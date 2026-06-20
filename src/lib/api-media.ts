import 'server-only'

import { put } from '@vercel/blob'

import { query } from '@/db/client'

const ALLOWED = ['image/jpeg', 'image/png', 'image/webp', 'image/avif', 'image/gif', 'image/svg+xml']
const MAX_BYTES = 8 * 1024 * 1024

/**
 * Download an image from a public URL, store it in Vercel Blob, and create a
 * `media` row — returning the new media id. Used by the API so callers can give
 * a post a hero image by URL (e.g. an AI-generated cover) without a manual upload.
 *
 * Throws on any problem (caller decides whether that's fatal).
 */
export async function ingestImageFromUrl(url: string, alt: string): Promise<number> {
  if (!process.env.BLOB_READ_WRITE_TOKEN) {
    throw new Error('Media uploads are not enabled (BLOB_READ_WRITE_TOKEN is unset).')
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
  const safeName = rawName.replace(/[^a-zA-Z0-9._-]/g, '-') || 'image'

  const blob = await put(`media/${safeName}`, buf, {
    access: 'public',
    addRandomSuffix: true,
    contentType: type,
  })

  const rows = await query<{ id: number }>(
    `INSERT INTO media (alt, url, filename, mime_type, filesize, updated_at, created_at)
     VALUES ($1, $2, $3, $4, $5, now(), now()) RETURNING id`,
    [alt.trim() || safeName, blob.url, safeName, type, buf.length],
  )
  return rows[0].id
}
