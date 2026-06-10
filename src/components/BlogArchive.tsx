import configPromise from '@payload-config'
import { notFound } from 'next/navigation'
import { getPayload } from 'payload'
import React from 'react'

import { PostCard } from '@/components/PostCard'
import { PaginationNav } from '@/components/PaginationNav'
import { CTABanner } from '@/components/sections/CTABanner'
import { getCachedGlobal } from '@/utilities/getGlobals'

/** Matches the legacy WordPress archive page size. */
export const POSTS_PER_PAGE = 10

/**
 * Blog archive shared by /blog/ (page 1) and /blog/page/N/ — same URL
 * scheme WordPress used, so legacy pagination links keep working.
 */
export async function BlogArchive({ page }: { page: number }) {
  const payload = await getPayload({ config: configPromise })
  const [posts, siteSettings] = await Promise.all([
    payload.find({
      collection: 'posts',
      draft: false,
      limit: POSTS_PER_PAGE,
      overrideAccess: false,
      page,
      sort: '-publishedAt',
    }),
    getCachedGlobal('siteSettings', 0)(),
  ])

  if (page > 1 && posts.docs.length === 0) notFound()

  return (
    <>
      <header className="bg-navy-950 py-14 text-white">
        <div className="container">
          <p className="text-sm font-semibold tracking-widest text-amber-accent uppercase">Blog</p>
          <h1 className="mt-2 text-3xl font-bold text-balance md:text-5xl">
            Electrical Tips, News &amp; Expert Insights for Los Angeles Property Owners
          </h1>
          <p className="mt-3 max-w-2xl text-white/80">
            Practical advice from licensed Los Angeles electricians — EV chargers, panel upgrades,
            rebates, safety and more.
          </p>
        </div>
      </header>

      <section className="py-14">
        <div className="container">
          {posts.docs.length === 0 ? (
            <p className="text-center text-muted-foreground">No articles published yet.</p>
          ) : (
            <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
              {posts.docs.map((post) => (
                <PostCard key={post.id} post={post} />
              ))}
            </div>
          )}
          <PaginationNav basePath="/blog/" currentPage={page} totalPages={posts.totalPages} />
        </div>
      </section>

      <CTABanner phone={siteSettings.phone} />
    </>
  )
}
