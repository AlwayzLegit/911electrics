/**
 * Full BFS crawl of the new site: starting from / and the sitemap, follow
 * every internal link; verify every page, image, and asset resolves.
 *
 * Run: node scripts/crawl-site.mjs [baseUrl]
 */
const BASE = (process.argv[2] || 'http://localhost:3000').replace(/\/$/, '')

const queue = ['/']
const seen = new Set(['/'])
const checkedAssets = new Set()
const failures = []
let pagesCrawled = 0
let assetsChecked = 0

// Seed with every sitemap URL so orphan pages get crawled too
const sitemap = await fetch(`${BASE}/sitemap.xml`).then((r) => r.text())
for (const m of sitemap.matchAll(/<loc>([^<]+)<\/loc>/g)) {
  const p = new URL(m[1]).pathname
  if (!seen.has(p)) {
    seen.add(p)
    queue.push(p)
  }
}

const internalPath = (href, fromPath, { keepQuery = false } = {}) => {
  if (!href || /^(mailto:|tel:|javascript:|sms:|data:|#)/i.test(href)) return null
  try {
    const u = new URL(href.replace(/&amp;/g, '&'), BASE + fromPath)
    if (u.origin !== BASE && !u.hostname.endsWith('911electrics.com')) return null
    return keepQuery ? u.pathname + u.search : u.pathname
  } catch {
    return null
  }
}

while (queue.length) {
  const p = queue.shift()
  let res
  try {
    res = await fetch(BASE + p, { redirect: 'follow' })
  } catch (e) {
    failures.push(`FETCH ERR ${p}: ${e.message}`)
    continue
  }
  if (res.status !== 200) {
    failures.push(`${res.status} page: ${p}`)
    continue
  }
  pagesCrawled++
  const type = res.headers.get('content-type') ?? ''
  if (!type.includes('text/html')) continue
  const html = await res.text()

  // Links -> crawl queue
  for (const m of html.matchAll(/<a[^>]+href="([^"]+)"/g)) {
    const linkPath = internalPath(m[1].split('#')[0], p)
    if (linkPath && !seen.has(linkPath) && !linkPath.startsWith('/admin')) {
      seen.add(linkPath)
      queue.push(linkPath)
    }
  }

  // Images + assets -> HEAD-ish check
  const assetPaths = new Set()
  for (const m of html.matchAll(/<(?:img|source)[^>]+(?:src|srcset)="([^"]+)"/g)) {
    for (const part of m[1].split(/,\s+/)) {
      const assetPath = internalPath(part.trim().split(' ')[0], p, { keepQuery: true })
      if (assetPath) assetPaths.add(assetPath)
    }
  }
  for (const m of html.matchAll(/<(?:link)[^>]+href="([^"]+)"/g)) {
    const assetPath = internalPath(m[1], p, { keepQuery: true })
    if (assetPath) assetPaths.add(assetPath)
  }
  for (const assetPath of assetPaths) {
    if (checkedAssets.has(assetPath)) continue
    checkedAssets.add(assetPath)
    try {
      const ar = await fetch(BASE + assetPath, { redirect: 'follow' })
      assetsChecked++
      if (ar.status !== 200) failures.push(`${ar.status} asset: ${assetPath}  (on ${p})`)
    } catch (e) {
      failures.push(`ASSET ERR ${assetPath}: ${e.message}`)
    }
  }
}

console.log(`pages crawled: ${pagesCrawled}`)
console.log(`assets checked: ${assetsChecked}`)
if (failures.length) {
  console.log(`\nFAILURES (${failures.length}):`)
  failures.forEach((f) => console.log(`  ✗ ${f}`))
  process.exit(1)
}
console.log('\nZero broken links or assets across the entire site ✓')
