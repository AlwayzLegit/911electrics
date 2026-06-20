import 'server-only'

import { query } from '@/db/client'
import {
  supabaseStorageConfigured,
  uniqueObjectName,
  uploadToMediaBucket,
} from '@/lib/supabase-storage'

const ALLOWED = ['image/jpeg', 'image/png', 'image/webp', 'image/avif', 'image/gif', 'image/svg+xml']
const MAX_BYTES = 8 * 1024 * 1024

/**
 * Download an image from a public URL, store it in Supabase Storage, and create
 * a `media` row — returning the new media id. Used by the API so callers can give
 * a post a hero image by URL (e.g. an AI-generated cover) without a manual upload.
 *
 * Throws on any problem (caller decides whether that's fatal).
 */
export async function ingestImageFromUrl(url: string, alt: string): Promise<number> {
  if (!supabaseStorageConfigured()) {
    throw new Error('Media uploads are not enabled (set SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY).')
  }

  let res: Response
  try {
    res = await fetch(url, { redirect: 'follow' })
  } catch {
    throw new Error('Could not download the image URL.')
  }
  if (!res.ok) throw new Error(`Could not download the image (HTTP ${res.status}).`)

  const type = (res.headers.get('content-type') || '').split(';')[0].trim().toLowerCase()
  if (!ALLOWED.includes(type)) {
    throw new Error(`Unsupported image type "${type || 'unknown'}". Use JPG, PNG, WebP, AVIF, GIF or SVG.`)
  }

  const buf = Buffer.from(await res.arrayBuffer())
  if (buf.length === 0) throw new Error('The image URL returned no data.')
  if (buf.length > MAX_BYTES) throw new Error('Image is too large (max 8 MB).')

  const rawName = (url.split('/').pop() || 'image').split('?')[0]
  const objectName = uniqueObjectName(rawName)
  const publicUrl = await uploadToMediaBucket(objectName, buf, type)

  const rows = await query<{ id: number }>(
    `INSERT INTO media (alt, url, filename, mime_type, filesize, updated_at, created_at)
     VALUES ($1, $2, $3, $4, $5, now(), now()) RETURNING id`,
    [alt.trim() || objectName, publicUrl, objectName, type, buf.length],
  )
  return rows[0].id
}
