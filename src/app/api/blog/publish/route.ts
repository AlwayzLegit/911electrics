import crypto from 'crypto'

import { revalidatePath, revalidateTag } from 'next/cache'
import { NextResponse } from 'next/server'
import { z } from 'zod'

import type { RichTextData } from '@/db/types'

import { pool, query } from '@/db/client'
import { markdownToLexical } from '@/lib/markdown-to-lexical'
import { logAudit } from '@/studio/audit'

// Uses the pg pool, so it must run on the Node.js runtime (not edge).
export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const API_ACTOR = { id: null, email: 'blog-api' }

/**
 * Bearer-token auth for the blog API. Returns:
 *   'unconfigured' — BLOG_API_TOKEN isn't set (→ 503, feature off)
 *   'unauthorized' — missing/wrong token (→ 401)
 *   'ok'           — valid token
 */
function checkAuth(req: Request): 'unconfigured' | 'unauthorized' | 'ok' {
  const token = process.env.BLOG_API_TOKEN
  if (!token) return 'unconfigured'

  const header = req.headers.get('authorization') || ''
  const bearer = /^Bearer\s+(.+)$/i.exec(header)?.[1]
  const provided = bearer ?? req.headers.get('x-api-key') ?? ''

  const a = Buffer.from(provided)
  const b = Buffer.from(token)
  if (a.length !== b.length) return 'unauthorized'
  return crypto.timingSafeEqual(a, b) ? 'ok' : 'unauthorized'
}

function authGate(req: Request): NextResponse | null {
  const state = checkAuth(req)
  if (state === 'unconfigured') {
    return NextResponse.json(
      { error: 'Blog API is not configured. Set BLOG_API_TOKEN.' },
      { status: 503 },
    )
  }
  if (state === 'unauthorized') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }
  return null
}

function slugify(input: string): string {
  return input
    .toLowerCase()
    .trim()
    .replace(/['"]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
}

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
  })
  .refine((d) => Boolean(d.markdown) || Boolean(d.content), {
    message: 'Provide either "markdown" or "content".',
  })

/** Resolve category names/slugs to existing category ids (unknowns ignored). */
async function resolveCategoryIds(names: string[]): Promise<number[]> {
  if (!names.length) return []
  const rows = await query<{ id: number }>(
    `SELECT id FROM categories
     WHERE lower(slug) = ANY($1::text[]) OR lower(title) = ANY($1::text[])`,
    [names.map((n) => n.toLowerCase())],
  )
  return rows.map((r) => r.id)
}

export async function POST(req: Request) {
  const gate = authGate(req)
  if (gate) return gate

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

  // Body content: prefer raw Lexical if provided, else convert markdown.
  const content = data.content
    ? JSON.stringify(data.content as RichTextData)
    : JSON.stringify(markdownToLexical(data.markdown as string))

  const status = data.status ?? 'published'
  const publishedAt =
    status === 'published'
      ? (data.publishedAt ?? new Date().toISOString())
      : (data.publishedAt ?? null)
  const metaDescription = data.metaDescription ?? data.excerpt ?? null

  let categoryIds: number[] = []
  try {
    categoryIds = await resolveCategoryIds(data.categories ?? [])
  } catch {
    // Non-fatal: a category lookup failure shouldn't block publishing.
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
        data.heroImageId ?? null,
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

    // Best-effort revision snapshot (author columns are nullable).
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

  // Surface the new post immediately (ISR + sitemap).
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
  const gate = authGate(req)
  if (gate) return gate

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
