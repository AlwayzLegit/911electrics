'use server'

import { revalidatePath, revalidateTag } from 'next/cache'
import { redirect } from 'next/navigation'

import { pool } from '@/db/client'
import { logAudit } from '@/studio/audit'
import { getStudioUser } from '@/studio/auth'

export type PostFormState = { error?: string }

function slugify(input: string): string {
  return input
    .toLowerCase()
    .trim()
    .replace(/['"]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
}

type ParsedPost = {
  title: string
  slug: string
  content: string
  heroImageId: number | null
  metaTitle: string | null
  metaDescription: string | null
  metaImageId: number | null
  publishedAt: string | null
  status: 'draft' | 'published'
  categoryIds: number[]
}

function idOrNull(form: FormData, key: string): number | null {
  const raw = String(form.get(key) ?? '').trim()
  if (!raw) return null
  const n = Number(raw)
  return Number.isFinite(n) ? n : null
}

function parse(form: FormData): ParsedPost {
  const title = String(form.get('title') ?? '').trim()
  if (!title) throw new Error('Title is required.')

  const slugInput = String(form.get('slug') ?? '').trim()
  const slug = slugify(slugInput || title)
  if (!slug) throw new Error('Could not derive a URL slug — please set one.')

  const contentRaw = String(form.get('content') ?? '')
  let content: string
  try {
    const parsed = JSON.parse(contentRaw)
    if (!parsed || typeof parsed !== 'object' || !('root' in parsed)) throw new Error()
    content = JSON.stringify(parsed)
  } catch {
    throw new Error('The post content could not be read.')
  }

  const status = form.get('status') === 'published' ? 'published' : 'draft'

  const publishedRaw = String(form.get('publishedAt') ?? '').trim()
  let publishedAt: string | null = null
  if (publishedRaw) {
    const d = new Date(publishedRaw)
    if (!Number.isNaN(d.getTime())) publishedAt = d.toISOString()
  }
  if (status === 'published' && !publishedAt) publishedAt = new Date().toISOString()

  const categoryIds = form
    .getAll('categories')
    .map((v) => Number(v))
    .filter((n) => Number.isFinite(n))

  return {
    title,
    slug,
    content,
    heroImageId: idOrNull(form, 'heroImage'),
    metaTitle: String(form.get('metaTitle') ?? '').trim() || null,
    metaDescription: String(form.get('metaDescription') ?? '').trim() || null,
    metaImageId: idOrNull(form, 'metaImage'),
    publishedAt,
    status,
    categoryIds,
  }
}

async function writeCategoryRels(
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  client: any,
  postId: number,
  categoryIds: number[],
): Promise<void> {
  await client.query(`DELETE FROM posts_rels WHERE parent_id = $1 AND path = 'categories'`, [postId])
  for (let i = 0; i < categoryIds.length; i++) {
    await client.query(
      `INSERT INTO posts_rels ("order", parent_id, path, categories_id) VALUES ($1, $2, 'categories', $3)`,
      [i + 1, postId, categoryIds[i]],
    )
  }
}

function revalidatePost(slug: string): void {
  revalidateTag('posts', 'max')
  revalidateTag('sitemap', 'max')
  revalidatePath('/blog')
  revalidatePath(`/${slug}`)
  revalidatePath('/studio/posts')
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function dbError(err: any): string {
  if (err?.code === '23505') return 'A post with that URL slug already exists. Choose a different slug.'
  return err instanceof Error ? err.message : 'Could not save the post.'
}

export async function createPost(_prev: PostFormState, formData: FormData): Promise<PostFormState> {
  const user = await getStudioUser()
  if (!user) throw new Error('Not authenticated')

  let data: ParsedPost
  try {
    data = parse(formData)
  } catch (err) {
    return { error: err instanceof Error ? err.message : 'Could not save the post.' }
  }

  const client = await pool.connect()
  try {
    await client.query('BEGIN')
    const { rows } = await client.query<{ id: number }>(
      `INSERT INTO posts
         (title, slug, content, hero_image_id, meta_title, meta_description, meta_image_id,
          published_at, _status, generate_slug, updated_at, created_at)
       VALUES ($1,$2,$3::jsonb,$4,$5,$6,$7,$8,$9::enum_posts_status,false,now(),now())
       RETURNING id`,
      [
        data.title,
        data.slug,
        data.content,
        data.heroImageId,
        data.metaTitle,
        data.metaDescription,
        data.metaImageId,
        data.publishedAt,
        data.status,
      ],
    )
    await writeCategoryRels(client, rows[0].id, data.categoryIds)
    await client.query('COMMIT')
  } catch (err) {
    await client.query('ROLLBACK').catch(() => {})
    return { error: dbError(err) }
  } finally {
    client.release()
  }

  revalidatePost(data.slug)
  redirect('/studio/posts')
}

export async function updatePost(
  id: number,
  _prev: PostFormState,
  formData: FormData,
): Promise<PostFormState> {
  const user = await getStudioUser()
  if (!user) throw new Error('Not authenticated')

  let data: ParsedPost
  try {
    data = parse(formData)
  } catch (err) {
    return { error: err instanceof Error ? err.message : 'Could not save the post.' }
  }

  const client = await pool.connect()
  try {
    await client.query('BEGIN')
    await client.query(
      `UPDATE posts SET
         title=$2, slug=$3, content=$4::jsonb, hero_image_id=$5,
         meta_title=$6, meta_description=$7, meta_image_id=$8,
         published_at=$9, _status=$10::enum_posts_status, updated_at=now()
       WHERE id=$1`,
      [
        id,
        data.title,
        data.slug,
        data.content,
        data.heroImageId,
        data.metaTitle,
        data.metaDescription,
        data.metaImageId,
        data.publishedAt,
        data.status,
      ],
    )
    await writeCategoryRels(client, id, data.categoryIds)
    await client.query('COMMIT')
  } catch (err) {
    await client.query('ROLLBACK').catch(() => {})
    return { error: dbError(err) }
  } finally {
    client.release()
  }

  revalidatePost(data.slug)
  redirect('/studio/posts')
}

export async function deletePost(id: number, slug: string): Promise<void> {
  const user = await getStudioUser()
  if (!user) throw new Error('Not authenticated')

  const client = await pool.connect()
  try {
    await client.query('BEGIN')
    await client.query(`DELETE FROM posts_rels WHERE parent_id = $1`, [id])
    await client.query(`DELETE FROM posts WHERE id = $1`, [id])
    await client.query('COMMIT')
  } catch (err) {
    await client.query('ROLLBACK').catch(() => {})
    throw err
  } finally {
    client.release()
  }

  await logAudit('post.delete', { targetType: 'post', targetId: id, summary: slug })
  revalidatePost(slug)
}
