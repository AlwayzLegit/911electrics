import type { Metadata } from 'next'

import configPromise from '@payload-config'
import { draftMode } from 'next/headers'
import { redirect } from 'next/navigation'
import { getPayload } from 'payload'
import React, { cache } from 'react'

import type { City, Page, Post, Service } from '@/payload-types'

import { RenderBlocks } from '@/blocks/RenderBlocks'
import { LivePreviewListener } from '@/components/LivePreviewListener'
import { PayloadRedirects } from '@/components/PayloadRedirects'
import { getFeaturedTestimonials, getServicesNav } from '@/lib/queries'
import { RenderHero } from '@/heros/RenderHero'
import { BlogPostPage } from '@/templates/BlogPostPage'
import { CityPage } from '@/templates/CityPage'
import { ServicePage } from '@/templates/ServicePage'
import { generateMeta } from '@/utilities/generateMeta'
import { getCachedGlobal } from '@/utilities/getGlobals'

/**
 * Root-slug resolver. Services, cities, blog posts and flex pages all live
 * at /{slug}/ (mirroring the WordPress URL structure), so one dynamic
 * route resolves the slug against all four collections.
 */

type Resolved =
  | { type: 'service'; doc: Service }
  | { type: 'city'; doc: City }
  | { type: 'post'; doc: Post }
  | { type: 'page'; doc: Page }
  | { type: 'redirect'; to: string }

export async function generateStaticParams() {
  const payload = await getPayload({ config: configPromise })

  const params: { slug: string }[] = []
  for (const collection of ['services', 'cities', 'posts', 'pages'] as const) {
    const { docs } = await payload.find({
      collection,
      draft: false,
      limit: 1000,
      overrideAccess: false,
      pagination: false,
      select: { slug: true, ...(collection === 'cities' ? { pathOverride: true } : {}) },
    })
    for (const doc of docs) {
      if (!doc.slug || doc.slug === 'home') continue
      // Cities with a path override (e.g. /services/los-angeles-ca/) have
      // their own static route
      if ('pathOverride' in doc && doc.pathOverride) continue
      params.push({ slug: doc.slug })
    }
  }
  return params
}

const querySlug = cache(async (slug: string): Promise<Resolved | null> => {
  const { isEnabled: draft } = await draftMode()
  const payload = await getPayload({ config: configPromise })

  const find = <T extends 'services' | 'cities' | 'posts' | 'pages'>(collection: T) =>
    payload.find({
      collection,
      draft,
      limit: 1,
      overrideAccess: draft,
      pagination: false,
      where: { slug: { equals: slug } },
    })

  const [services, cities, posts, pages] = await Promise.all([
    find('services'),
    find('cities'),
    find('posts'),
    find('pages'),
  ])

  if (services.docs[0]) return { type: 'service', doc: services.docs[0] as Service }
  if (cities.docs[0]) {
    const city = cities.docs[0] as City
    if (city.pathOverride) return { type: 'redirect', to: city.pathOverride }
    return { type: 'city', doc: city }
  }
  if (posts.docs[0]) return { type: 'post', doc: posts.docs[0] as Post }
  if (pages.docs[0]) return { type: 'page', doc: pages.docs[0] as Page }
  return null
})

type Args = {
  params: Promise<{ slug?: string }>
}

export default async function RootSlugPage({ params: paramsPromise }: Args) {
  const { isEnabled: draft } = await draftMode()
  const { slug = '' } = await paramsPromise
  const decodedSlug = decodeURIComponent(slug)
  const url = `/${decodedSlug}`

  const resolved = await querySlug(decodedSlug)

  if (!resolved) {
    // Checks the CMS redirects collection before 404ing
    return <PayloadRedirects url={url} />
  }

  if (resolved.type === 'redirect') {
    redirect(resolved.to)
  }

  const siteSettings = await getCachedGlobal('siteSettings', 1)()

  return (
    <>
      {draft && <LivePreviewListener />}

      {resolved.type === 'service' && (
        <ServicePage service={resolved.doc} siteSettings={siteSettings} />
      )}

      {resolved.type === 'city' && (
        <CityPageWrapper city={resolved.doc} siteSettings={siteSettings} />
      )}

      {resolved.type === 'post' && (
        <BlogPostPage post={resolved.doc} siteSettings={siteSettings} />
      )}

      {resolved.type === 'page' && (
        <article className="pt-16 pb-24">
          <PayloadRedirects disableNotFound url={url} />
          <RenderHero {...resolved.doc.hero} />
          <RenderBlocks blocks={resolved.doc.layout} />
        </article>
      )}
    </>
  )
}

async function CityPageWrapper({
  city,
  siteSettings,
}: {
  city: City
  siteSettings: Awaited<ReturnType<ReturnType<typeof getCachedGlobal<'siteSettings'>>>>
}) {
  const [template, services, testimonials] = await Promise.all([
    getCachedGlobal('cityPageTemplate', 1)(),
    getServicesNav(),
    getFeaturedTestimonials(),
  ])

  return (
    <CityPage
      city={city}
      services={services}
      siteSettings={siteSettings}
      template={template}
      testimonials={testimonials}
    />
  )
}

export async function generateMetadata({ params: paramsPromise }: Args): Promise<Metadata> {
  const { slug = '' } = await paramsPromise
  const resolved = await querySlug(decodeURIComponent(slug))
  const doc = resolved && 'doc' in resolved ? resolved.doc : null
  return generateMeta({ doc })
}
