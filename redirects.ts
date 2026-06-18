import type { NextConfig } from 'next'

/**
 * Static redirects preserving legacy WordPress URLs. Content-level
 * redirects added after launch live in the CMS redirects collection
 * (managed in the admin panel) — these are the infrastructure ones.
 */
export const redirects: NextConfig['redirects'] = async () => {
  return [
    // Yoast sitemap URLs -> the single Next.js sitemap
    ...[
      '/sitemap_index.xml',
      '/page-sitemap.xml',
      '/post-sitemap.xml',
      '/category-sitemap.xml',
      '/geo-sitemap.xml',
    ].map((source) => ({
      source,
      destination: '/sitemap.xml',
      permanent: true,
    })),

    // WordPress leftovers
    { source: '/category/uncategorized', destination: '/blog/', permanent: true },
    { source: '/feed', destination: '/blog/', permanent: true },
    { source: '/comments/feed', destination: '/blog/', permanent: true },
    { source: '/wp-admin', destination: '/studio', permanent: false },
    { source: '/wp-admin/:path*', destination: '/studio', permanent: false },
    { source: '/author/:author', destination: '/blog/', permanent: true },
  ]
}
