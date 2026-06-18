import type { Metadata } from 'next'

import configPromise from '@payload-config'
import { draftMode } from 'next/headers'
import { notFound } from 'next/navigation'
import { getPayload } from 'payload'
import React, { cache } from 'react'

import { LivePreviewListener } from '@/components/LivePreviewListener'
import { getFeaturedTestimonials, getServicesNav, getSiteSettings, getCityPageTemplate } from '@/lib/queries'
import { CityPage } from '@/templates/CityPage'
import { generateMeta } from '@/utilities/generateMeta'

/**
 * The one city page that doesn't live at root: /services/los-angeles-ca/
 * (preserved verbatim from the WordPress URL structure). The city doc is
 * marked with pathOverride = '/services/los-angeles-ca/'.
 */

const queryLosAngeles = cache(async () => {
  const { isEnabled: draft } = await draftMode()
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'cities',
    draft,
    limit: 1,
    overrideAccess: draft,
    pagination: false,
    where: { pathOverride: { equals: '/services/los-angeles-ca/' } },
  })
  return docs[0] ?? null
})

export default async function LosAngelesCityPage() {
  const { isEnabled: draft } = await draftMode()
  const city = await queryLosAngeles()
  if (!city) notFound()

  const [template, services, siteSettings, testimonials] = await Promise.all([
    getCityPageTemplate(),
    getServicesNav(),
    getSiteSettings(),
    getFeaturedTestimonials(),
  ])

  return (
    <>
      {draft && <LivePreviewListener />}
      <CityPage
        city={city}
        services={services}
        siteSettings={siteSettings}
        template={template}
        testimonials={testimonials}
      />
    </>
  )
}

export async function generateMetadata(): Promise<Metadata> {
  const city = await queryLosAngeles()
  return generateMeta({ doc: city })
}
