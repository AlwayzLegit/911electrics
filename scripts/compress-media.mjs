// Compress WP media originals in place to web-grade sizes before import:
// max 1920px wide, JPEG q80 / PNG -> JPEG when opaque. SVGs untouched.
import { readdir, rename, stat, unlink } from 'fs/promises'
import path from 'path'
import sharp from '../node_modules/.pnpm/sharp@0.34.2/node_modules/sharp/lib/index.js'

sharp.cache(false) // Windows: keep input files unlocked so they can be replaced

const ROOT = path.resolve(process.cwd(), 'wp-snapshot/media')

async function* walk(dir) {
  for (const name of await readdir(dir)) {
    const p = path.join(dir, name)
    if ((await stat(p)).isDirectory()) yield* walk(p)
    else yield p
  }
}

let before = 0
let after = 0
for await (const file of walk(ROOT)) {
  const ext = path.extname(file).toLowerCase()
  if (!['.jpg', '.jpeg', '.png', '.webp'].includes(ext)) continue
  const size = (await stat(file)).size
  before += size

  const tmp = `${file}.tmp`
  try {
    let img = sharp(file).rotate()
    const meta = await img.metadata()
    if ((meta.width ?? 0) > 1920) img = img.resize({ width: 1920 })
    if (ext === '.png' && !meta.hasAlpha) {
      img = img.jpeg({ quality: 80, mozjpeg: true })
    } else if (ext === '.png') {
      img = img.png({ compressionLevel: 9, palette: true })
    } else if (ext === '.webp') {
      img = img.webp({ quality: 80 })
    } else {
      img = img.jpeg({ quality: 80, mozjpeg: true })
    }
    await img.toFile(tmp)
    const newSize = (await stat(tmp)).size
    if (newSize < size) {
      await unlink(file)
      await rename(tmp, file)
      after += newSize
    } else {
      await unlink(tmp)
      after += size
    }
  } catch (e) {
    console.warn(`skip ${file}: ${e.message}`)
    after += size
  }
}
console.log(`before: ${(before / 1e6).toFixed(1)} MB  after: ${(after / 1e6).toFixed(1)} MB`)
