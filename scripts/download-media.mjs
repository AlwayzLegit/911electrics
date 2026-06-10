/**
 * P0 — Download every media binary referenced by the live WordPress site
 * into wp-snapshot/media/ (gitignored), preserving the /wp-content/uploads/
 * path so old→new URL mapping is trivial later.
 *
 * Prefers original files: strips WP size suffixes (-300x200) and -scaled.
 * Run after export-wp.mjs: node scripts/download-media.mjs
 */

import { mkdir, writeFile, readFile, access } from 'fs/promises'
import path from 'path'

const OUT = path.resolve(process.cwd(), 'wp-snapshot')
const UA = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) snapshot-export/1.0'
const sleep = (ms) => new Promise((r) => setTimeout(r, ms))

function originalUrl(u) {
  return u.replace(/-\d+x\d+(\.\w+)$/, '$1').replace(/-scaled(\.\w+)$/, '$1')
}

async function download(url) {
  const rel = new URL(url).pathname.replace(/^\/wp-content\/uploads\//, '')
  const dest = path.join(OUT, 'media', rel.replace(/\//g, path.sep))
  try {
    await access(dest)
    return 'skip'
  } catch {}
  const res = await fetch(url, { headers: { 'User-Agent': UA } })
  if (!res.ok) throw new Error(`HTTP ${res.status}`)
  await mkdir(path.dirname(dest), { recursive: true })
  await writeFile(dest, Buffer.from(await res.arrayBuffer()))
  return 'ok'
}

const urls = JSON.parse(await readFile(path.join(OUT, 'media-urls.json'), 'utf8'))
const originals = [...new Set(urls.map(originalUrl))]
const failures = []
let done = 0

for (const url of originals) {
  try {
    const r = await download(url)
    done++
    if (r === 'ok') await sleep(150)
  } catch (e) {
    // original may not exist for some sized variants — fall back to the sized file
    const sized = urls.find((u) => originalUrl(u) === url && u !== url)
    try {
      if (!sized) throw e
      await download(sized)
      done++
    } catch (e2) {
      failures.push({ url, error: e2.message })
      console.warn(`FAILED: ${url} — ${e2.message}`)
    }
  }
}

await writeFile(path.join(OUT, 'media-failures.json'), JSON.stringify(failures, null, 2))
console.log(`downloaded ${done}/${originals.length} originals, ${failures.length} failures`)
