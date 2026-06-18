import type { MetadataRoute } from 'next'

import { unstable_cache } from 'next/cache'

import { query } from '@/db/client'
import { getCategoriesWithCounts } from '@/lib/posts'
import { getServerSideURL } from '@/utilities/getURL'

/**
 * Single sitemap mirroring the legacy WordPress URL set: all published
 * services, cities (incl. pathOverride) and posts plus the static routes and
 * non-empty categories. Read from Postgres; revalidated via the 'sitemap' tag.
 */
const getSitemapEntries = unstable_cache(
  async (): Promise<MetadataRoute.Sitemap> => {
    const base = getServerSideURL()
    const entries: MetadataRoute.Sitemap = [
      { url: `${base}/`, lastModified: new Date(), changeFrequency: 'weekly', priority: 1 },
      { url: `${base}/services/`, changeFrequency: 'monthly', priority: 0.8 },
      { url: `${base}/service-areas/`, changeFrequency: 'monthly', priority: 0.8 },
      { url: `${base}/contact/`, changeFrequency: 'yearly', priority: 0.7 },
      { url: `${base}/blog/`, changeFrequency: 'weekly', priority: 0.7 },
      { url: `${base}/privacy-policy/`, changeFrequency: 'yearly', priority: 0.2 },
      { url: `${base}/terms-of-service/`, changeFrequency: 'yearly', priority: 0.2 },
    ]

    const docs = await query<{
      slug: string | null
      updated_at: string | null
      path_override: string | null
      collection: string
    }>(`
      SELECT slug, updated_at, NULL::varchar AS path_override, 'services' AS collection
        FROM services WHERE _status = 'published'
      UNION ALL
      SELECT slug, updated_at, path_override, 'cities' FROM cities WHERE _status = 'published'
      UNION ALL
      SELECT slug, updated_at, NULL::varchar, 'posts' FROM posts WHERE _status = 'published'
    `)
    for (const doc of docs) {
      if (!doc.slug || doc.slug === 'home') continue
      const path = doc.path_override || `/${doc.slug}/`
      entries.push({
        url: `${base}${path}`,
        lastModified: doc.updated_at ? new Date(doc.updated_at) : undefined,
        changeFrequency: doc.collection === 'posts' ? 'monthly' : 'weekly',
        priority: doc.collection === 'posts' ? 0.6 : 0.9,
      })
    }

    for (const category of await getCategoriesWithCounts()) {
      if (!category.slug || category.slug === 'uncategorized' || category.count === 0) continue
      entries.push({
        url: `${base}/category/${category.slug}/`,
        changeFrequency: 'weekly',
        priority: 0.4,
      })
    }

    return entries
  },
  ['sitemap'],
  { tags: ['sitemap'] },
)

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  return getSitemapEntries()
}
