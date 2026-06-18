import type { Metadata } from 'next'

import configPromise from '@payload-config'
import { draftMode } from 'next/headers'
import { redirect } from 'next/navigation'
import { getPayload } from 'payload'
import React, { cache } from 'react'

import type { City, Page, Service } from '@/payload-types'

import { RenderBlocks } from '@/blocks/RenderBlocks'
import { LivePreviewListener } from '@/components/LivePreviewListener'
import { PayloadRedirects } from '@/components/PayloadRedirects'
import type { SiteSettings } from '@/db/types'
import { getPostBySlug, type PostDetail } from '@/lib/posts'
import { getFeaturedTestimonials, getServicesNav, getSiteSettings, getCityPageTemplate } from '@/lib/queries'
import { RenderHero } from '@/heros/RenderHero'
import { BlogPostPage } from '@/templates/BlogPostPage'
import { CityPage } from '@/templates/CityPage'
import { ServicePage } from '@/templates/ServicePage'
import { generateMeta } from '@/utilities/generateMeta'
import { getServerSideURL } from '@/utilities/getURL'
import { mergeOpenGraph } from '@/utilities/mergeOpenGraph'

/**
 * Root-slug resolver. Services, cities, blog posts and flex pages all live
 * at /{slug}/ (mirroring the WordPress URL structure), so one dynamic
 * route resolves the slug against all four collections.
 */

type Resolved =
  | { type: 'service'; doc: Service }
  | { type: 'city'; doc: City }
  | { type: 'post'; doc: PostDetail }
  | { type: 'page'; doc: Page }
  | { type: 'redirect'; to: string }

/**
 * On-demand ISR instead of mass build-time SSG.
 *
 * Previously this route pre-rendered every service, city, post and page at
 * build (~70 pages), which doesn't scale and made the build hammer the
 * database. We now render each page on first request and cache it, refreshing
 * in the background (revalidate). Payload's afterChange hooks still call
 * revalidatePath to bust a specific page immediately on publish, and crawlers
 * get a fully-rendered, indexable page. This is the rendering change that lets
 * the public site move off Payload's data layer without build-time spikes.
 */
export const revalidate = 3600
export const dynamicParams = true

export async function generateStaticParams() {
  // Intentionally empty: pages are generated on-demand (ISR), not at build.
  return [] as { slug: string }[]
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

  const [services, cities, pages, post] = await Promise.all([
    find('services'),
    find('cities'),
    find('pages'),
    getPostBySlug(slug),
  ])

  if (services.docs[0]) return { type: 'service', doc: services.docs[0] as Service }
  if (cities.docs[0]) {
    const city = cities.docs[0] as City
    if (city.pathOverride) return { type: 'redirect', to: city.pathOverride }
    return { type: 'city', doc: city }
  }
  if (post) return { type: 'post', doc: post }
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

  const siteSettings = await getSiteSettings()

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
  siteSettings: SiteSettings
}) {
  const [template, services, testimonials] = await Promise.all([
    getCityPageTemplate(),
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

  // Posts come from the DB layer; build their metadata directly.
  if (resolved?.type === 'post') {
    const { meta, title, slug: postSlug } = resolved.doc
    return {
      title: meta.title || title,
      description: meta.description ?? undefined,
      alternates: { canonical: `/${postSlug}/` },
      openGraph: mergeOpenGraph({
        description: meta.description ?? '',
        images: meta.image?.url ? [{ url: getServerSideURL() + meta.image.url }] : undefined,
        title: meta.title || title,
        url: `/${postSlug}/`,
      }),
    }
  }

  const doc = resolved && 'doc' in resolved ? resolved.doc : null
  return generateMeta({ doc })
}
