/**
 * P0 — Capture a full snapshot of the live WordPress site (911electrics.com)
 * before migration. Pure Node (global fetch), no dependencies.
 *
 * Outputs to wp-snapshot/:
 *   sitemaps/          raw XML of all Yoast sitemaps
 *   urls.json          every URL discovered from sitemaps
 *   html/              rendered HTML of every URL (slug-based filenames)
 *   seo-summary.json   per-URL title / meta description / canonical / og / h1
 *   rest/              WP REST API JSON (posts, pages, media, categories)
 *   media-urls.json    all upload URLs referenced by the media library
 *
 * Run: node scripts/export-wp.mjs
 * (Media binaries are downloaded by scripts/download-media.mjs separately.)
 */

import { mkdir, writeFile } from 'fs/promises'
import path from 'path'

const BASE = 'https://911electrics.com'
const OUT = path.resolve(process.cwd(), 'wp-snapshot')
const UA = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) snapshot-export/1.0'

const sleep = (ms) => new Promise((r) => setTimeout(r, ms))

async function fetchText(url, attempt = 1) {
  try {
    const res = await fetch(url, { headers: { 'User-Agent': UA } })
    if (!res.ok) throw new Error(`HTTP ${res.status}`)
    return await res.text()
  } catch (err) {
    if (attempt < 3) {
      await sleep(1500 * attempt)
      return fetchText(url, attempt + 1)
    }
    throw new Error(`${url}: ${err.message}`)
  }
}

function slugify(url) {
  const p = new URL(url).pathname.replace(/^\/|\/$/g, '')
  return p === '' ? '_home' : p.replace(/\//g, '__')
}

function extract(re, html) {
  const m = html.match(re)
  return m ? m[1].trim() : null
}

function decodeEntities(s) {
  if (!s) return s
  return s
    .replace(/&amp;/g, '&')
    .replace(/&#0?39;/g, "'")
    .replace(/&#82(1[6-7]|2[0-1]);/g, (m) => ({ 8216: '‘', 8217: '’', 8220: '“', 8221: '”' })[m.match(/\d+/)[0]] || m)
    .replace(/&quot;/g, '"')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&nbsp;/g, ' ')
}

async function main() {
  await mkdir(path.join(OUT, 'sitemaps'), { recursive: true })
  await mkdir(path.join(OUT, 'html'), { recursive: true })
  await mkdir(path.join(OUT, 'rest'), { recursive: true })

  // ---- 1. Sitemaps -> URL inventory ----
  const sitemapNames = ['sitemap_index.xml', 'post-sitemap.xml', 'page-sitemap.xml', 'category-sitemap.xml', 'geo-sitemap.xml']
  const urls = new Set()
  for (const name of sitemapNames) {
    try {
      const xml = await fetchText(`${BASE}/${name}`)
      await writeFile(path.join(OUT, 'sitemaps', name), xml)
      if (name !== 'sitemap_index.xml' && name !== 'geo-sitemap.xml') {
        for (const m of xml.matchAll(/<loc>([^<]+)<\/loc>/g)) {
          const u = m[1].trim()
          if (u.startsWith(BASE) && !/\.(jpg|jpeg|png|webp|gif|pdf)$/i.test(u)) urls.add(u)
        }
      }
      console.log(`sitemap ok: ${name}`)
    } catch (e) {
      console.warn(`sitemap FAILED: ${name} — ${e.message}`)
    }
  }
  const urlList = [...urls].sort()
  await writeFile(path.join(OUT, 'urls.json'), JSON.stringify(urlList, null, 2))
  console.log(`\n${urlList.length} URLs discovered\n`)

  // ---- 2. Crawl rendered HTML + extract SEO fields ----
  const seo = []
  for (const url of urlList) {
    try {
      const html = await fetchText(url)
      await writeFile(path.join(OUT, 'html', `${slugify(url)}.html`), html)
      seo.push({
        url,
        title: decodeEntities(extract(/<title[^>]*>([\s\S]*?)<\/title>/i, html)),
        metaDescription: decodeEntities(
          extract(/<meta\s+name=["']description["']\s+content=["']([\s\S]*?)["']/i, html) ??
            extract(/<meta\s+content=["']([\s\S]*?)["']\s+name=["']description["']/i, html),
        ),
        canonical: extract(/<link\s+rel=["']canonical["']\s+href=["']([^"']+)["']/i, html),
        ogTitle: decodeEntities(extract(/<meta\s+property=["']og:title["']\s+content=["']([\s\S]*?)["']/i, html)),
        ogDescription: decodeEntities(extract(/<meta\s+property=["']og:description["']\s+content=["']([\s\S]*?)["']/i, html)),
        ogImage: extract(/<meta\s+property=["']og:image["']\s+content=["']([^"']+)["']/i, html),
        robots: extract(/<meta\s+name=["']robots["']\s+content=["']([^"']+)["']/i, html),
        h1: decodeEntities(extract(/<h1[^>]*>([\s\S]*?)<\/h1>/i, html)?.replace(/<[^>]+>/g, '')),
      })
      console.log(`crawled: ${url}`)
      await sleep(250) // be polite
    } catch (e) {
      seo.push({ url, error: e.message })
      console.warn(`crawl FAILED: ${url} — ${e.message}`)
    }
  }
  await writeFile(path.join(OUT, 'seo-summary.json'), JSON.stringify(seo, null, 2))

  // ---- 3. WP REST API export ----
  const mediaUrls = new Set()
  for (const type of ['posts', 'pages', 'media', 'categories', 'tags', 'users']) {
    const all = []
    for (let page = 1; page <= 20; page++) {
      const url = `${BASE}/wp-json/wp/v2/${type}?per_page=100&page=${page}${type === 'posts' || type === 'pages' ? '&_embed=1' : ''}`
      try {
        const res = await fetch(url, { headers: { 'User-Agent': UA } })
        if (res.status === 400) break // past last page
        if (!res.ok) throw new Error(`HTTP ${res.status}`)
        const batch = await res.json()
        if (!Array.isArray(batch) || batch.length === 0) break
        all.push(...batch)
        if (batch.length < 100) break
      } catch (e) {
        console.warn(`REST ${type} p${page} FAILED: ${e.message}`)
        break
      }
      await sleep(250)
    }
    await writeFile(path.join(OUT, 'rest', `${type}.json`), JSON.stringify(all, null, 2))
    console.log(`REST ${type}: ${all.length} items`)
    if (type === 'media') {
      for (const item of all) {
        if (item.source_url) mediaUrls.add(item.source_url)
      }
    }
  }

  // Also collect upload URLs referenced in crawled HTML (page-builder images
  // often aren't in the media REST response's first level)
  const { readFile, readdir } = await import('fs/promises')
  for (const f of await readdir(path.join(OUT, 'html'))) {
    const html = await readFile(path.join(OUT, 'html', f), 'utf8')
    for (const m of html.matchAll(/https?:\/\/911electrics\.com\/wp-content\/uploads\/[^\s"'\\)<>]+?\.(?:jpe?g|png|webp|gif|svg)/gi)) {
      mediaUrls.add(m[0])
    }
  }
  await writeFile(path.join(OUT, 'media-urls.json'), JSON.stringify([...mediaUrls].sort(), null, 2))
  console.log(`media URLs: ${mediaUrls.size}`)
  console.log('\nSnapshot complete -> wp-snapshot/')
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
