/**
 * Generate the real brand favicon / app-icon set and public logo assets from
 * the actual company logo (migrated from the live WordPress site) instead of
 * the placeholder bolt mark.
 *
 *   source square crop  -> favicon.ico, favicon-32x32.png, apple-touch-icon.png,
 *                          icon-192.png, icon-512.png
 *   landscape logo      -> public/logo.png  (site header)
 *   1200x630 logo card  -> public/og-default.jpg (default social card)
 */
import { copyFile, writeFile } from 'fs/promises'
import path from 'path'
import sharp from 'sharp'

sharp.cache(false)
const ROOT = process.cwd()
const PUB = path.join(ROOT, 'public')
const MEDIA = path.join(PUB, 'media')

// The WordPress "Site Icon" — a 512x512 square crop of the logo on white.
const SQUARE = path.join(
  MEDIA,
  'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1.png',
)
// The header logo used on the live site (transparent, landscape).
const HEADER_LOGO = path.join(MEDIA, '911CE-removebg-preview.png')
// A ready-made 1200x630 logo card for the default OG image.
const OG_SOURCE = path.join(
  MEDIA,
  '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1200x630.jpg',
)

const square = (size) =>
  sharp(SQUARE).resize(size, size, { fit: 'contain', background: '#ffffff' }).flatten({ background: '#ffffff' })

const png32 = await square(32).png().toBuffer()
await writeFile(path.join(PUB, 'favicon-32x32.png'), png32)
await writeFile(path.join(PUB, 'apple-touch-icon.png'), await square(180).png().toBuffer())
await writeFile(path.join(PUB, 'icon-192.png'), await square(192).png().toBuffer())
await writeFile(path.join(PUB, 'icon-512.png'), await square(512).png().toBuffer())

// ICO container holding one 32x32 PNG (supported by all modern browsers)
const ico = Buffer.alloc(6 + 16 + png32.length)
ico.writeUInt16LE(0, 0) // reserved
ico.writeUInt16LE(1, 2) // type: icon
ico.writeUInt16LE(1, 4) // image count
ico.writeUInt8(32, 6) // width
ico.writeUInt8(32, 7) // height
ico.writeUInt8(0, 8) // palette
ico.writeUInt8(0, 9) // reserved
ico.writeUInt16LE(1, 10) // color planes
ico.writeUInt16LE(32, 12) // bits per pixel
ico.writeUInt32LE(png32.length, 14) // image size
ico.writeUInt32LE(22, 18) // image offset
png32.copy(ico, 22)
await writeFile(path.join(PUB, 'favicon.ico'), ico)

// Public copies used directly by the layout (no DB dependency for site chrome)
await copyFile(HEADER_LOGO, path.join(PUB, 'logo.png'))
await copyFile(OG_SOURCE, path.join(PUB, 'og-default.jpg'))

console.log('Brand assets generated from the real company logo.')
