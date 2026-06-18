'use server'

import { put } from '@vercel/blob'
import { revalidatePath } from 'next/cache'

import { query } from '@/db/client'
import { getStudioUser } from '@/studio/auth'
import type { MediaItem } from '@/studio/media'

export type UploadResult = { ok: true; item: MediaItem } | { ok: false; error: string }

const MAX_BYTES = 8 * 1024 * 1024
const ALLOWED = ['image/jpeg', 'image/png', 'image/webp', 'image/avif', 'image/gif', 'image/svg+xml']

export async function uploadMedia(formData: FormData): Promise<UploadResult> {
  const user = await getStudioUser()
  if (!user) return { ok: false, error: 'Not authenticated' }

  if (!process.env.BLOB_READ_WRITE_TOKEN) {
    return {
      ok: false,
      error:
        'Image uploads aren’t enabled yet. Create a Vercel Blob store (Vercel → Storage → Blob) and redeploy.',
    }
  }

  const file = formData.get('file')
  const alt = String(formData.get('alt') ?? '').trim()

  if (!(file instanceof File) || file.size === 0) return { ok: false, error: 'Choose an image to upload.' }
  if (!ALLOWED.includes(file.type)) {
    return { ok: false, error: 'Unsupported file type. Use JPG, PNG, WebP, AVIF, GIF or SVG.' }
  }
  if (file.size > MAX_BYTES) return { ok: false, error: 'Image is too large (max 8 MB).' }
  if (!alt) {
    return { ok: false, error: 'Add alt text describing the image (for accessibility and SEO).' }
  }

  const safeName = file.name.replace(/[^a-zA-Z0-9._-]/g, '-') || 'image'
  let blobUrl: string
  try {
    const blob = await put(`media/${safeName}`, file, { access: 'public', addRandomSuffix: true })
    blobUrl = blob.url
  } catch (err) {
    return { ok: false, error: err instanceof Error ? err.message : 'Upload failed.' }
  }

  const rows = await query<{ id: number }>(
    `INSERT INTO media (alt, url, filename, mime_type, filesize, updated_at, created_at)
     VALUES ($1, $2, $3, $4, $5, now(), now()) RETURNING id`,
    [alt, blobUrl, safeName, file.type, file.size],
  )

  revalidatePath('/studio')
  return { ok: true, item: { id: rows[0].id, alt, url: blobUrl, thumb: blobUrl } }
}
