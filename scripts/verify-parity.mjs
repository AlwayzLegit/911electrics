/**
 * P8 — URL/SEO parity check: every URL from the WordPress snapshot must
 * resolve on the new site (200 or a planned redirect), and titles/meta must
 * match the snapshot verbatim (known intentional exceptions listed below).
 *
 * Run against a local prod server: node scripts/verify-parity.mjs [baseUrl]
 */

import { readFile } from 'fs/promises'
import path from 'path'

const BASE = process.argv[2] || 'http://localhost:3000'
const SNAP = path.resolve(process.cwd(), 'wp-snapshot')

// Intentional differences from the live WP site
const TITLE_EXCEPTIONS = new Set([
  '/sce-4200-rebate-panel-upgrade-ev-charger-installation-los-angeles/', // WP served a duplicated Yoast title (bug) — fixed
  '/blog/', // WP blog index title was generic; new one is branded
  '/category/electrical-tips/',
])
const REDIRECTS_EXPECTED = new Set(['/category/uncategorized/'])

const decode = (s) =>
  s
    ?.replace(/&amp;/g, '&')
    .replace(/&#0?38;/g, '&')
    .replace(/&#0?39;/g, "'")
    .replace(/&#8217;/g, '’')
    .replace(/&#8211;/g, '–')
    .replace(/\s+/g, ' ')
    .trim()

const seoSummary = JSON.parse(await readFile(path.join(SNAP, 'seo-summary.json'), 'utf8'))

let pass = 0
const failures = []
const warnings = []

for (const entry of seoSummary) {
  const urlPath = new URL(entry.url).pathname
  const res = await fetch(BASE + urlPath, { redirect: 'manual' })

  if (REDIRECTS_EXPECTED.has(urlPath)) {
    if (res.status >= 300 && res.status < 400) pass++
    else failures.push(`${urlPath}: expected redirect, got ${res.status}`)
    continue
  }

  if (res.status !== 200) {
    failures.push(`${urlPath}: HTTP ${res.status}`)
    continue
  }

  const html = await res.text()
  const title = decode(html.match(/<title[^>]*>([\s\S]*?)<\/title>/i)?.[1])
  const h1 = decode(html.match(/<h1[^>]*>([\s\S]*?)<\/h1>/i)?.[1]?.replace(/<[^>]+>/g, ''))
  const oldTitle = decode(entry.title)
  const oldH1 = decode(entry.h1)

  if (!h1) {
    failures.push(`${urlPath}: missing <h1>`)
    continue
  }

  if (oldTitle && title !== oldTitle && !TITLE_EXCEPTIONS.has(urlPath)) {
    failures.push(`${urlPath}:\n    old title: ${oldTitle}\n    new title: ${title}`)
    continue
  }

  if (oldH1 && h1 !== oldH1) {
    warnings.push(`${urlPath}: h1 differs\n    old: ${oldH1}\n    new: ${h1}`)
  }

  pass++
}

// Planned infrastructure redirects
for (const p of ['/sitemap_index.xml', '/page-sitemap.xml', '/post-sitemap.xml', '/feed/']) {
  const res = await fetch(BASE + p, { redirect: 'manual' })
  if (res.status >= 300 && res.status < 400) pass++
  else failures.push(`${p}: expected redirect, got ${res.status}`)
}

// New endpoints
for (const p of ['/sitemap.xml', '/robots.txt']) {
  const res = await fetch(BASE + p)
  if (res.status === 200) pass++
  else failures.push(`${p}: HTTP ${res.status}`)
}

console.log(`\nPASS: ${pass}`)
if (warnings.length) {
  console.log(`\nWARNINGS (${warnings.length}):`)
  warnings.forEach((w) => console.log(`  ~ ${w}`))
}
if (failures.length) {
  console.log(`\nFAILURES (${failures.length}):`)
  failures.forEach((f) => console.log(`  ✗ ${f}`))
  process.exit(1)
}
console.log('\nAll parity checks passed ✓')
