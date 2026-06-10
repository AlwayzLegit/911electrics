/**
 * Generate brand assets from a single source SVG:
 *   public/favicon.svg        brand bolt mark
 *   public/favicon.ico        32px PNG wrapped in ICO container
 *   public/apple-touch-icon.png  180x180
 *   public/icon-192.png / icon-512.png  (web manifest)
 *   public/og-default.jpg     1200x630 default social card
 */
import { writeFile } from 'fs/promises'
import path from 'path'
import sharp from '../node_modules/.pnpm/sharp@0.34.2/node_modules/sharp/lib/index.js'

sharp.cache(false)
const PUB = path.resolve(process.cwd(), 'public')

// Brand bolt mark — blue rounded square, white lightning bolt
const boltSvg = (size, radiusRatio = 0.22) => `<svg xmlns="http://www.w3.org/2000/svg" width="${size}" height="${size}" viewBox="0 0 100 100">
  <rect width="100" height="100" rx="${100 * radiusRatio}" fill="#1d4ed8"/>
  <path d="M56 12 L26 56 L46 56 L40 88 L74 42 L52 42 Z" fill="#ffffff"/>
</svg>`

await writeFile(path.join(PUB, 'favicon.svg'), boltSvg(100))

const png32 = await sharp(Buffer.from(boltSvg(64))).resize(32, 32).png().toBuffer()
const png180 = await sharp(Buffer.from(boltSvg(360))).resize(180, 180).png().toBuffer()
const png192 = await sharp(Buffer.from(boltSvg(384))).resize(192, 192).png().toBuffer()
const png512 = await sharp(Buffer.from(boltSvg(1024))).resize(512, 512).png().toBuffer()

await writeFile(path.join(PUB, 'apple-touch-icon.png'), png180)
await writeFile(path.join(PUB, 'icon-192.png'), png192)
await writeFile(path.join(PUB, 'icon-512.png'), png512)

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
ico.writeUInt32LE(png32.length, 14) // data size
ico.writeUInt32LE(22, 18) // data offset
png32.copy(ico, 22)
await writeFile(path.join(PUB, 'favicon.ico'), ico)

// Default OG card: project photo, navy gradient, brand mark + name
const ogText = `<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630">
  <defs>
    <linearGradient id="g" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#0b1023" stop-opacity="0.45"/>
      <stop offset="100%" stop-color="#0b1023" stop-opacity="0.92"/>
    </linearGradient>
  </defs>
  <rect width="1200" height="630" fill="url(#g)"/>
  <g transform="translate(80, 420)">
    <rect width="84" height="84" rx="18" fill="#1d4ed8"/>
    <path d="M47 10 L22 47 L39 47 L34 74 L62 35 L44 35 Z" fill="#ffffff"/>
    <text x="104" y="38" font-family="Arial, Helvetica, sans-serif" font-size="40" font-weight="700" fill="#ffffff">911 Construction &amp; Electric Inc.</text>
    <text x="104" y="76" font-family="Arial, Helvetica, sans-serif" font-size="26" fill="#fbbf24">Licensed Electrician in Los Angeles · 24/7 · Lic. #1027421</text>
  </g>
</svg>`

await sharp(path.join(PUB, 'media', 'IMG_2783.jpg'))
  .resize(1200, 630, { fit: 'cover' })
  .composite([{ input: Buffer.from(ogText) }])
  .jpeg({ quality: 82, mozjpeg: true })
  .toFile(path.join(PUB, 'og-default.jpg'))

console.log('brand assets generated')
