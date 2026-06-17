import 'server-only'

import { unstable_cache } from 'next/cache'

import { sql } from './client'
import type { Category, MediaImage, Testimonial } from './types'

/**
 * Payload-free read helpers. Each query is validated directly against the
 * Supabase schema. Results are wrapped in `unstable_cache` with the same tags
 * the Payload hooks already revalidate, so existing cache invalidation keeps
 * working as read paths migrate over.
 */

type MediaRow = {
  id: number
  alt: string | null
  url: string | null
  filename: string | null
  width: string | number | null
  height: string | number | null
  sizes_thumbnail_url: string | null
  sizes_square_url: string | null
  sizes_small_url: string | null
  sizes_medium_url: string | null
  sizes_large_url: string | null
  sizes_xlarge_url: string | null
  sizes_og_url: string | null
}

const num = (v: string | number | null): number | null =>
  v === null || v === undefined ? null : Number(v)

/** Media files are served as static assets from /media/<filename>. */
const mediaUrl = (row: Pick<MediaRow, 'url' | 'filename'>): string =>
  row.url || (row.filename ? `/media/${row.filename}` : '')

export function mapMedia(row: MediaRow): MediaImage {
  return {
    id: row.id,
    alt: row.alt,
    url: mediaUrl(row),
    width: num(row.width),
    height: num(row.height),
    sizes: {
      thumbnail: row.sizes_thumbnail_url,
      square: row.sizes_square_url,
      small: row.sizes_small_url,
      medium: row.sizes_medium_url,
      large: row.sizes_large_url,
      xlarge: row.sizes_xlarge_url,
      og: row.sizes_og_url,
    },
  }
}

const MEDIA_COLUMNS = sql`
  id, alt, url, filename, width, height,
  sizes_thumbnail_url, sizes_square_url, sizes_small_url,
  sizes_medium_url, sizes_large_url, sizes_xlarge_url, sizes_og_url
`

/** Fetch media rows by id, returned as a Map for easy joining. */
export async function getMediaByIds(ids: number[]): Promise<Map<number, MediaImage>> {
  const unique = [...new Set(ids.filter((n): n is number => typeof n === 'number'))]
  if (unique.length === 0) return new Map()
  const rows = await sql<MediaRow[]>`
    SELECT ${MEDIA_COLUMNS} FROM media WHERE id IN ${sql(unique)}
  `
  return new Map(rows.map((r) => [r.id, mapMedia(r)]))
}

export const getAllCategories = unstable_cache(
  async (): Promise<Category[]> => {
    const rows = await sql<Category[]>`
      SELECT id, title, slug FROM categories ORDER BY title
    `
    return rows
  },
  ['db-categories'],
  { tags: ['categories'] },
)

export const getFeaturedTestimonials = unstable_cache(
  async (): Promise<Testimonial[]> => {
    const rows = await sql<
      Array<{
        id: number
        author_name: string | null
        location: string | null
        rating: string | number | null
        text: string | null
        source: string | null
        date: string | null
        featured: boolean | null
      }>
    >`
      SELECT id, author_name, location, rating, text, source, date, featured
      FROM testimonials
      WHERE featured = true
      ORDER BY date DESC NULLS LAST
      LIMIT 12
    `
    return rows.map((r) => ({
      id: r.id,
      authorName: r.author_name,
      location: r.location,
      rating: num(r.rating),
      text: r.text,
      source: r.source,
      date: r.date,
      featured: Boolean(r.featured),
    }))
  },
  ['db-featured-testimonials'],
  { tags: ['testimonials'] },
)
