import configPromise from '@payload-config'
import { unstable_cache } from 'next/cache'
import { getPayload } from 'payload'

import type { City, Service, Testimonial } from '@/payload-types'

/**
 * Cached Payload Local API fetchers for data used across many pages
 * (header/footer nav, service cards, city lists). Tagged so collection
 * hooks can invalidate them on publish.
 */

export const getServicesNav = unstable_cache(
  async (): Promise<Service[]> => {
    const payload = await getPayload({ config: configPromise })
    const { docs } = await payload.find({
      collection: 'services',
      draft: false,
      limit: 20,
      overrideAccess: false,
      pagination: false,
      sort: 'displayOrder',
    })
    return docs
  },
  ['services-nav'],
  { tags: ['services'] },
)

export const getCitiesNav = unstable_cache(
  async (): Promise<Pick<City, 'id' | 'cityName' | 'slug' | 'pathOverride'>[]> => {
    const payload = await getPayload({ config: configPromise })
    const { docs } = await payload.find({
      collection: 'cities',
      draft: false,
      limit: 100,
      overrideAccess: false,
      pagination: false,
      select: {
        cityName: true,
        slug: true,
        pathOverride: true,
      },
      sort: 'cityName',
    })
    return docs
  },
  ['cities-nav'],
  { tags: ['cities'] },
)

export const getFeaturedTestimonials = unstable_cache(
  async (): Promise<Testimonial[]> => {
    const payload = await getPayload({ config: configPromise })
    const { docs } = await payload.find({
      collection: 'testimonials',
      limit: 12,
      overrideAccess: false,
      pagination: false,
      sort: '-date',
      where: { featured: { equals: true } },
    })
    return docs
  },
  ['featured-testimonials'],
  { tags: ['testimonials'] },
)

/** Public URL path for a city document. */
export const cityPath = (city: Pick<City, 'slug' | 'pathOverride'>): string =>
  city.pathOverride || `/${city.slug}/`
