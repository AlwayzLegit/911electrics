import 'server-only'

import { query } from '@/db/client'

export type PostListItem = {
  id: number
  title: string
  slug: string | null
  status: string
  publishedAt: string | null
}

export type StudioPost = {
  id: number
  title: string
  slug: string
  content: unknown
  heroImageId: number | null
  metaTitle: string
  metaDescription: string
  metaImageId: number | null
  publishedAt: string | null
  status: 'draft' | 'published'
  categoryIds: number[]
}

export type StudioCategory = { id: number; title: string }

export async function getAllPosts(): Promise<PostListItem[]> {
  const rows = await query<{
    id: number
    title: string | null
    slug: string | null
    _status: string | null
    published_at: string | null
  }>(
    `SELECT id, title, slug, _status, published_at FROM posts
     ORDER BY published_at DESC NULLS LAST, created_at DESC`,
  )
  return rows.map((r) => ({
    id: r.id,
    title: r.title ?? '(untitled)',
    slug: r.slug,
    status: r._status ?? 'draft',
    publishedAt: r.published_at,
  }))
}

export async function getStudioCategories(): Promise<StudioCategory[]> {
  return query<StudioCategory>(`SELECT id, title FROM categories ORDER BY title`)
}

export async function getPostById(id: number): Promise<StudioPost | null> {
  const rows = await query<{
    id: number
    title: string | null
    slug: string | null
    content: unknown
    hero_image_id: number | null
    meta_title: string | null
    meta_description: string | null
    meta_image_id: number | null
    published_at: string | null
    _status: string | null
  }>(
    `SELECT id, title, slug, content, hero_image_id,
            meta_title, meta_description, meta_image_id, published_at, _status
     FROM posts WHERE id = $1 LIMIT 1`,
    [id],
  )
  const p = rows[0]
  if (!p) return null

  const cats = await query<{ categories_id: number }>(
    `SELECT categories_id FROM posts_rels
     WHERE parent_id = $1 AND path = 'categories' AND categories_id IS NOT NULL
     ORDER BY "order"`,
    [id],
  )

  return {
    id: p.id,
    title: p.title ?? '',
    slug: p.slug ?? '',
    content: p.content,
    heroImageId: p.hero_image_id,
    metaTitle: p.meta_title ?? '',
    metaDescription: p.meta_description ?? '',
    metaImageId: p.meta_image_id,
    publishedAt: p.published_at,
    status: p._status === 'published' ? 'published' : 'draft',
    categoryIds: cats.map((c) => c.categories_id),
  }
}
