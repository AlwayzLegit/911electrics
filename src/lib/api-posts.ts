import 'server-only'

import { revalidatePath, revalidateTag } from 'next/cache'

import { query } from '@/db/client'

/** WordPress-style slugify, matching the Studio post editor. */
export function slugify(input: string): string {
  return input
    .toLowerCase()
    .trim()
    .replace(/['"]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
}

/** Resolve category names/slugs to existing category ids (unknowns ignored). */
export async function resolveCategoryIds(names: string[]): Promise<number[]> {
  if (!names.length) return []
  const rows = await query<{ id: number }>(
    `SELECT id FROM categories
     WHERE lower(slug) = ANY($1::text[]) OR lower(title) = ANY($1::text[])`,
    [names.map((n) => n.toLowerCase())],
  )
  return rows.map((r) => r.id)
}

/** Bust the public + Studio caches for a post (and the blog/sitemap). */
export function revalidatePost(slug: string | null): void {
  revalidateTag('posts', 'max')
  revalidateTag('sitemap', 'max')
  revalidatePath('/blog')
  if (slug) revalidatePath(`/${slug}`)
  revalidatePath('/studio/posts')
}
