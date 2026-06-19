import { Client } from 'pg'
import type { NextConfig } from 'next'

type Redirect = { source: string; destination: string; permanent: boolean }

/**
 * Infrastructure redirects preserving legacy WordPress URLs.
 */
const staticRedirects: Redirect[] = [
  // Yoast sitemap URLs -> the single Next.js sitemap
  ...[
    '/sitemap_index.xml',
    '/page-sitemap.xml',
    '/post-sitemap.xml',
    '/category-sitemap.xml',
    '/geo-sitemap.xml',
  ].map((source) => ({ source, destination: '/sitemap.xml', permanent: true })),

  // WordPress leftovers
  { source: '/category/uncategorized', destination: '/blog/', permanent: true },
  { source: '/feed', destination: '/blog/', permanent: true },
  { source: '/comments/feed', destination: '/blog/', permanent: true },
  { source: '/wp-admin', destination: '/studio', permanent: false },
  { source: '/wp-admin/:path*', destination: '/studio', permanent: false },
  { source: '/author/:author', destination: '/blog/', permanent: true },
]

/**
 * Editor-managed redirects from the url_redirects table (Studio → Redirects).
 * Read at build time; best-effort so a build without DB access still succeeds.
 * New/changed entries take effect on the next deploy.
 */
async function dbRedirects(): Promise<Redirect[]> {
  const connectionString = process.env.DATABASE_URL
  if (!connectionString) return []
  const client = new Client({ connectionString, connectionTimeoutMillis: 8000 })
  try {
    await client.connect()
    const { rows } = await client.query<{ source: string; destination: string; permanent: boolean }>(
      `SELECT source, destination, permanent FROM url_redirects`,
    )
    return rows.map((r) => ({ source: r.source, destination: r.destination, permanent: r.permanent }))
  } catch {
    return []
  } finally {
    await client.end().catch(() => {})
  }
}

export const redirects: NextConfig['redirects'] = async () => {
  const fromDb = await dbRedirects()
  // Static infra redirects win over any conflicting managed source.
  const staticSources = new Set(staticRedirects.map((r) => r.source))
  return [...staticRedirects, ...fromDb.filter((r) => !staticSources.has(r.source))]
}
