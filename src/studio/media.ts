import 'server-only'

import { query } from '@/db/client'

export type MediaItem = {
  id: number
  alt: string | null
  /** Full-size static path (/media/<filename>). */
  url: string
  /** Thumbnail path for grids (falls back to full size). */
  thumb: string
}

const path = (filename: string | null): string | null => (filename ? `/media/${filename}` : null)

export async function getAllMedia(): Promise<MediaItem[]> {
  const rows = await query<{
    id: number
    alt: string | null
    filename: string | null
    sizes_thumbnail_filename: string | null
    sizes_small_filename: string | null
  }>(
    `SELECT id, alt, filename, sizes_thumbnail_filename, sizes_small_filename
     FROM media ORDER BY created_at DESC`,
  )
  return rows.map((r) => {
    const url = path(r.filename) ?? ''
    return {
      id: r.id,
      alt: r.alt,
      url,
      thumb: path(r.sizes_thumbnail_filename) ?? path(r.sizes_small_filename) ?? url,
    }
  })
}
