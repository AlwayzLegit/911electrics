import type { MetadataRoute } from 'next'

import configPromise from '@payload-config'
import { unstable_cache } from 'next/cache'
import { getPayload } from 'payload'

import { getServerSideURL } from '@/utilities/getURL'

/**
 * Single sitemap mirroring the legacy WordPress URL set: all published
 * services, cities (incl. pathOverride), posts and pages plus the static
 * routes. Revalidated via the 'sitemap' tag from collection hooks.
 */
const getSitemapEntries = unstable_cache(
  async (): Promise<MetadataRoute.Sitemap> => {
    const payload = await getPayload({ config: configPromise })
    const base = getServerSideURL()
    const entries: MetadataRoute.Sitemap = []

    entries.push(
      { url: `${base}/`, lastModified: new Date(), changeFrequency: 'weekly', priority: 1 },
      { url: `${base}/services/`, changeFrequency: 'monthly', priority: 0.8 },
      { url: `${base}/service-areas/`, changeFrequency: 'monthly', priority: 0.8 },
      { url: `${base}/contact/`, changeFrequency: 'yearly', priority: 0.7 },
      { url: `${base}/blog/`, changeFrequency: 'weekly', priority: 0.7 },
      { url: `${base}/privacy-policy/`, changeFrequency: 'yearly', priority: 0.2 },
    )

    for (const collection of ['services', 'cities', 'posts', 'pages'] as const) {
      const { docs } = await payload.find({
        collection,
        draft: false,
        limit: 1000,
        overrideAccess: false,
        pagination: false,
        select: {
          slug: true,
          updatedAt: true,
          ...(collection === 'cities' ? { pathOverride: true } : {}),
        },
      })
      for (const doc of docs) {
        if (!doc.slug || doc.slug === 'home') continue
        const path =
          'pathOverride' in doc && doc.pathOverride ? doc.pathOverride : `/${doc.slug}/`
        entries.push({
          url: `${base}${path}`,
          lastModified: doc.updatedAt ? new Date(doc.updatedAt) : undefined,
          changeFrequency: collection === 'posts' ? 'monthly' : 'weekly',
          priority: collection === 'posts' ? 0.6 : 0.9,
        })
      }
    }

    const { docs: categories } = await payload.find({
      collection: 'categories',
      limit: 100,
      pagination: false,
      select: { slug: true },
    })
    for (const category of categories) {
      if (!category.slug || category.slug === 'uncategorized') continue
      entries.push({ url: `${base}/category/${category.slug}/`, changeFrequency: 'weekly', priority: 0.4 })
    }

    return entries
  },
  ['sitemap'],
  { tags: ['sitemap'] },
)

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  return getSitemapEntries()
}
