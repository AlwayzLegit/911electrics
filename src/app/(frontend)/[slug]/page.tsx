import type { Metadata } from 'next'

import { notFound, redirect } from 'next/navigation'
import React, { cache } from 'react'

import type { SiteSettings } from '@/db/types'
import { getCityBySlug, type CityDetail } from '@/lib/cities'
import { getPostBySlug, type PostDetail } from '@/lib/posts'
import { getFeaturedTestimonials, getServicesNav, getSiteSettings, getCityPageTemplate } from '@/lib/queries'
import { getServiceBySlug, type ServiceDetail } from '@/lib/services'
import { BlogPostPage } from '@/templates/BlogPostPage'
import { CityPage } from '@/templates/CityPage'
import { ServicePage } from '@/templates/ServicePage'
import { buildMeta } from '@/utilities/buildMeta'

/**
 * Root-slug resolver. Services, cities and blog posts all live at /{slug}/
 * (mirroring the WordPress URL structure), so one dynamic route resolves the
 * slug against all three — now entirely from the Postgres layer.
 */

type Resolved =
  | { type: 'service'; doc: ServiceDetail }
  | { type: 'city'; doc: CityDetail }
  | { type: 'post'; doc: PostDetail }
  | { type: 'redirect'; to: string }

/** On-demand ISR: pages render on first request and cache (no build-time SSG). */
export const revalidate = 3600
export const dynamicParams = true

export async function generateStaticParams() {
  return [] as { slug: string }[]
}

const querySlug = cache(async (slug: string): Promise<Resolved | null> => {
  const [service, city, post] = await Promise.all([
    getServiceBySlug(slug),
    getCityBySlug(slug),
    getPostBySlug(slug),
  ])

  if (service) return { type: 'service', doc: service }
  if (city) {
    if (city.pathOverride) return { type: 'redirect', to: city.pathOverride }
    return { type: 'city', doc: city }
  }
  if (post) return { type: 'post', doc: post }
  return null
})

type Args = {
  params: Promise<{ slug?: string }>
}

export default async function RootSlugPage({ params: paramsPromise }: Args) {
  const { slug = '' } = await paramsPromise
  const resolved = await querySlug(decodeURIComponent(slug))

  if (!resolved) notFound()
  if (resolved.type === 'redirect') redirect(resolved.to)

  const siteSettings = await getSiteSettings()

  if (resolved.type === 'service') {
    return <ServicePage service={resolved.doc} siteSettings={siteSettings} />
  }
  if (resolved.type === 'city') {
    return <CityPageWrapper city={resolved.doc} siteSettings={siteSettings} />
  }
  return <BlogPostPage post={resolved.doc} siteSettings={siteSettings} />
}

async function CityPageWrapper({
  city,
  siteSettings,
}: {
  city: CityDetail
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
  if (!resolved || resolved.type === 'redirect') return {}

  if (resolved.type === 'service') {
    const s = resolved.doc
    return buildMeta({ ...s.meta, path: `/${s.slug}/`, fallbackTitle: s.title })
  }
  if (resolved.type === 'city') {
    const c = resolved.doc
    return buildMeta({
      ...c.meta,
      path: c.pathOverride || `/${c.slug}/`,
      fallbackTitle: `Electrician in ${c.cityName}, CA`,
    })
  }
  const p = resolved.doc
  return buildMeta({ ...p.meta, path: `/${p.slug}/`, fallbackTitle: p.title })
}
