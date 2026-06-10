import type { Metadata } from 'next'

import configPromise from '@payload-config'
import { getPayload } from 'payload'
import React from 'react'

import { PostCard } from '@/components/PostCard'
import { CTABanner } from '@/components/sections/CTABanner'
import { getCachedGlobal } from '@/utilities/getGlobals'

export const revalidate = 86400

export default async function BlogIndexPage() {
  const payload = await getPayload({ config: configPromise })
  const [{ docs: posts }, siteSettings] = await Promise.all([
    payload.find({
      collection: 'posts',
      draft: false,
      limit: 100,
      overrideAccess: false,
      pagination: false,
      sort: '-publishedAt',
    }),
    getCachedGlobal('siteSettings', 0)(),
  ])

  return (
    <>
      <header className="bg-navy-950 py-14 text-white">
        <div className="container">
          <p className="text-sm font-semibold tracking-widest text-amber-accent uppercase">Blog</p>
          <h1 className="mt-2 text-3xl font-bold md:text-5xl">Electrical Tips &amp; Guides</h1>
          <p className="mt-3 max-w-2xl text-white/80">
            Practical advice from licensed Los Angeles electricians — EV chargers, panel upgrades,
            rebates, safety and more.
          </p>
        </div>
      </header>

      <section className="py-14">
        <div className="container">
          {posts.length === 0 ? (
            <p className="text-center text-muted-foreground">No articles published yet.</p>
          ) : (
            <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
              {posts.map((post) => (
                <PostCard key={post.id} post={post} />
              ))}
            </div>
          )}
        </div>
      </section>

      <CTABanner phone={siteSettings.phone} />
    </>
  )
}

export const metadata: Metadata = {
  title: 'Electrical Tips & Guides | 911 Construction & Electric Inc.',
  description:
    'Expert electrical advice for Los Angeles homeowners and businesses: EV charger installation, panel upgrades, rebates, safety inspections and more.',
  alternates: { canonical: '/blog/' },
}
