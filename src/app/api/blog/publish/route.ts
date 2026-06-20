import { revalidatePath, revalidateTag } from 'next/cache'
import { NextResponse } from 'next/server'
import { z } from 'zod'

import type { RichTextData } from '@/db/types'

import { API_ACTOR, requireApiToken } from '@/lib/api-auth'
import { ingestImageFromUrl } from '@/lib/api-media'
import { resolveCategoryIds, slugify } from '@/lib/api-posts'
import { pool, query } from '@/db/client'
import { markdownToLexical } from '@/lib/markdown-to-lexical'
import { logAudit } from '@/studio/audit'

// Uses the pg pool, so it must run on the Node.js runtime (not edge).
export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const bodySchema = z
  .object({
    title: z.string().trim().min(3).max(200),
    markdown: z.string().min(1).optional(),
    // Advanced: pass a raw Lexical editor state ({ root: ... }) instead of markdown.
    content: z.object({ root: z.unknown() }).passthrough().optional(),
    slug: z.string().trim().max(200).optional(),
    excerpt: z.string().trim().max(500).optional(),
    metaTitle: z.string().trim().max(120).optional(),
    metaDescription: z.string().trim().max(320).optional(),
    status: z.enum(['draft', 'published']).optional(),
    publishedAt: z.string().datetime().optional(),
    categories: z.array(z.string().trim().min(1)).max(20).optional(),
    heroImageId: z.number().int().positive().optional(),
    // Give the post a hero image by URL (downloaded + stored in Blob).
    heroImageUrl: z.string().url().optional(),
    heroImageAlt: z.string().trim().max(300).optional(),
  })
  .refine((d) => Boolean(d.markdown) || Boolean(d.content), {
    message: 'Provide either "markdown" or "content".',
  })

export async function POST(req: Request) {
  const auth = requireApiToken(req)
  if (!auth.ok) return auth.response

  let json: unknown
  try {
    json = await req.json()
  } catch {
    return NextResponse.json({ error: 'Invalid JSON body.' }, { status: 400 })
  }

  const parsed = bodySchema.safeParse(json)
  if (!parsed.success) {
    return NextResponse.json(
      { error: 'Validation failed', issues: parsed.error.flatten().fieldErrors },
      { status: 422 },
    )
  }
  const data = parsed.data

  const slug = slugify(data.slug || data.title)
  if (!slug) {
    return NextResponse.json({ error: 'Could not derive a URL slug.' }, { status: 422 })
  }

  const content = data.content
    ? JSON.stringify(data.content as RichTextData)
    : JSON.stringify(markdownToLexical(data.markdown as string))

  const status = data.status ?? 'published'
  const publishedAt =
    status === 'published'
      ? (data.publishedAt ?? new Date().toISOString())
      : (data.publishedAt ?? null)
  const metaDescription = data.metaDescription ?? data.excerpt ?? null

  // Optional hero image by URL → media row.
  let heroImageId = data.heroImageId ?? null
  if (!heroImageId && data.heroImageUrl) {
    try {
      heroImageId = await ingestImageFromUrl(data.heroImageUrl, data.heroImageAlt || data.title)
    } catch (err) {
      return NextResponse.json(
        { error: err instanceof Error ? err.message : 'Could not ingest hero image.' },
        { status: 422 },
      )
    }
  }

  let categoryIds: number[] = []
  try {
    categoryIds = await resolveCategoryIds(data.categories ?? [])
  } catch {
    categoryIds = []
  }

  const client = await pool.connect()
  let postId: number
  try {
    await client.query('BEGIN')
    const { rows } = await client.query<{ id: number }>(
      `INSERT INTO posts
         (title, slug, content, hero_image_id, meta_title, meta_description, meta_image_id,
          published_at, scheduled_for, _status, generate_slug, updated_at, created_at)
       VALUES ($1,$2,$3::jsonb,$4,$5,$6,$7,$8,$9,$10::enum_posts_status,false,now(),now())
       RETURNING id`,
      [
        data.title,
        slug,
        content,
        heroImageId,
        data.metaTitle ?? null,
        metaDescription,
        null,
        publishedAt,
        null,
        status,
      ],
    )
    postId = rows[0].id

    for (let n = 0; n < categoryIds.length; n++) {
      await client.query(
        `INSERT INTO posts_rels ("order", parent_id, path, categories_id) VALUES ($1,$2,'categories',$3)`,
        [n + 1, postId, categoryIds[n]],
      )
    }

    await client.query(
      `INSERT INTO post_revisions (post_id, title, content, status, author_id, author_name, note)
       VALUES ($1,$2,$3::jsonb,$4,$5,$6,$7)`,
      [postId, data.title, content, status, null, 'Blog API', 'Created via API'],
    )

    await client.query('COMMIT')
  } catch (err: unknown) {
    await client.query('ROLLBACK').catch(() => {})
    if ((err as { code?: string })?.code === '23505') {
      return NextResponse.json(
        { error: `A post with slug "${slug}" already exists.` },
        { status: 409 },
      )
    }
    console.error('Blog API create failed', err)
    return NextResponse.json({ error: 'Could not create the post.' }, { status: 500 })
  } finally {
    client.release()
  }

  await logAudit('post.create', {
    actor: API_ACTOR,
    targetType: 'post',
    targetId: postId,
    summary: `${data.title} (API)`,
  })

  revalidateTag('posts', 'max')
  revalidateTag('sitemap', 'max')
  revalidatePath('/blog')
  revalidatePath(`/${slug}`)
  revalidatePath('/studio/posts')

  const base = (process.env.NEXT_PUBLIC_SERVER_URL ?? '').replace(/\/$/, '')
  return NextResponse.json(
    {
      id: postId,
      slug,
      status,
      url: base ? `${base}/${slug}/` : `/${slug}/`,
      publishedAt,
    },
    { status: 201 },
  )
}

/** List recent posts — handy for a scheduler to avoid duplicate topics/slugs. */
export async function GET(req: Request) {
  const auth = requireApiToken(req)
  if (!auth.ok) return auth.response

  const rows = await query<{
    id: number
    title: string | null
    slug: string | null
    status: string | null
    published_at: string | null
  }>(
    `SELECT id, title, slug, _status AS status, published_at
     FROM posts ORDER BY created_at DESC, id DESC LIMIT 50`,
  )
  return NextResponse.json({
    posts: rows.map((r) => ({
      id: r.id,
      title: r.title,
      slug: r.slug,
      status: r.status,
      publishedAt: r.published_at,
    })),
  })
}
