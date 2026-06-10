/**
 * Harvest EVERY internal link target that appears anywhere in the WordPress
 * snapshot HTML (nav, footers, post bodies, buttons — not just sitemap URLs)
 * and verify each resolves on the new site (200 directly or via redirect).
 *
 * Run: node scripts/verify-legacy-links.mjs [baseUrl]
 */
import { readdir, readFile } from 'fs/promises'
import path from 'path'

const BASE = process.argv[2] || 'http://localhost:3000'
const HTML_DIR = path.resolve(process.cwd(), 'wp-snapshot/html')

const paths = new Map() // path -> first source file

for (const file of await readdir(HTML_DIR)) {
  const html = await readFile(path.join(HTML_DIR, file), 'utf8')
  for (const m of html.matchAll(/<a[^>]+href="([^"#]+)(?:#[^"]*)?"/g)) {
    let href = m[1].trim()
    if (href.startsWith('//')) href = 'https:' + href
    if (/^(mailto:|tel:|javascript:|sms:)/i.test(href)) continue
    let urlPath
    if (href.startsWith('http')) {
      let u
      try {
        u = new URL(href)
      } catch {
        continue
      }
      if (!/(^|\.)911electrics\.com$/.test(u.hostname)) continue
      urlPath = u.pathname
    } else if (href.startsWith('/')) {
      urlPath = href.split('?')[0]
    } else {
      continue
    }
    if (!paths.has(urlPath)) paths.set(urlPath, file)
  }
}

console.log(`${paths.size} unique internal link targets found in WP HTML\n`)

const failures = []
let pass = 0
for (const [p, source] of [...paths.entries()].sort()) {
  try {
    const res = await fetch(BASE + p, { redirect: 'follow' })
    if (res.status === 200) {
      pass++
    } else {
      failures.push(`${res.status}  ${p}   (linked from ${source})`)
    }
  } catch (e) {
    failures.push(`ERR  ${p}  ${e.message}`)
  }
}

console.log(`PASS: ${pass}/${paths.size}`)
if (failures.length) {
  console.log(`\nFAILURES (${failures.length}):`)
  failures.forEach((f) => console.log(`  ✗ ${f}`))
  process.exit(1)
}
console.log('Every legacy internal link resolves ✓')
