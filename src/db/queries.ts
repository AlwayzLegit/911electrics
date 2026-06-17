import 'server-only'

import { unstable_cache } from 'next/cache'

import { sql } from './client'
import type { Category, CityNav, MediaImage, ServiceNav, Testimonial } from './types'

/**
 * Payload-free read helpers. Each query is validated directly against the
 * Supabase schema. Results are wrapped in `unstable_cache` with the same tags
 * the Payload hooks already revalidate, so existing cache invalidation keeps
 * working as read paths migrate over.
 */

type MediaRow = {
  id: number
  alt: string | null
  filename: string | null
  width: string | number | null
  height: string | number | null
  sizes_thumbnail_filename: string | null
  sizes_square_filename: string | null
  sizes_small_filename: string | null
  sizes_medium_filename: string | null
  sizes_large_filename: string | null
  sizes_xlarge_filename: string | null
  sizes_og_filename: string | null
}

const num = (v: string | number | null): number | null =>
  v === null || v === undefined ? null : Number(v)

/**
 * Media files are served as static assets from /public/media. The `url`/`*_url`
 * columns Payload stored point at its own /api/media/file/* route, which won't
 * exist once Payload is removed — so we build paths from the filenames instead.
 */
const mediaPath = (filename: string | null): string | null =>
  filename ? `/media/${filename}` : null

export function mapMedia(row: MediaRow): MediaImage {
  return {
    id: row.id,
    alt: row.alt,
    url: mediaPath(row.filename) ?? '',
    width: num(row.width),
    height: num(row.height),
    sizes: {
      thumbnail: mediaPath(row.sizes_thumbnail_filename),
      square: mediaPath(row.sizes_square_filename),
      small: mediaPath(row.sizes_small_filename),
      medium: mediaPath(row.sizes_medium_filename),
      large: mediaPath(row.sizes_large_filename),
      xlarge: mediaPath(row.sizes_xlarge_filename),
      og: mediaPath(row.sizes_og_filename),
    },
  }
}

const MEDIA_COLUMNS = sql`
  id, alt, filename, width, height,
  sizes_thumbnail_filename, sizes_square_filename, sizes_small_filename,
  sizes_medium_filename, sizes_large_filename, sizes_xlarge_filename, sizes_og_filename
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

export const getServicesNav = unstable_cache(
  async (): Promise<ServiceNav[]> => {
    const rows = await sql<
      Array<{
        id: number
        title: string | null
        nav_label: string | null
        slug: string | null
        short_description: string | null
        display_order: string | number | null
        card_image_id: number | null
      }>
    >`
      SELECT id, title, nav_label, slug, short_description, display_order, card_image_id
      FROM services
      WHERE _status = 'published'
      ORDER BY display_order NULLS LAST, title
    `
    const media = await getMediaByIds(
      rows.map((r) => r.card_image_id).filter((n): n is number => typeof n === 'number'),
    )
    return rows.map((r) => ({
      id: r.id,
      title: r.title ?? '',
      navLabel: r.nav_label ?? r.title ?? '',
      slug: r.slug ?? '',
      shortDescription: r.short_description ?? '',
      displayOrder: num(r.display_order),
      cardImage: r.card_image_id ? (media.get(r.card_image_id) ?? null) : null,
    }))
  },
  ['db-services-nav'],
  { tags: ['services'] },
)

export const getCitiesNav = unstable_cache(
  async (): Promise<CityNav[]> => {
    const rows = await sql<
      Array<{
        id: number
        city_name: string | null
        slug: string | null
        path_override: string | null
      }>
    >`
      SELECT id, city_name, slug, path_override
      FROM cities
      WHERE _status = 'published'
      ORDER BY city_name
    `
    return rows.map((r) => ({
      id: r.id,
      cityName: r.city_name ?? '',
      slug: r.slug ?? '',
      pathOverride: r.path_override,
    }))
  },
  ['db-cities-nav'],
  { tags: ['cities'] },
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
      authorName: r.author_name ?? '',
      location: r.location,
      rating: num(r.rating) ?? 0,
      text: r.text ?? '',
      source: r.source,
      date: r.date,
      featured: Boolean(r.featured),
    }))
  },
  ['db-featured-testimonials'],
  { tags: ['testimonials'] },
)
