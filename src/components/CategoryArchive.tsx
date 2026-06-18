import configPromise from '@payload-config'
import { notFound } from 'next/navigation'
import { getPayload } from 'payload'
import React from 'react'

import { POSTS_PER_PAGE } from '@/components/BlogArchive'
import { PaginationNav } from '@/components/PaginationNav'
import { PostCard } from '@/components/PostCard'
import {
  CategoryChips,
  SidebarCTA,
  SidebarCategories,
  SidebarRecentPosts,
} from '@/components/blog/Sidebar'
import { CTABanner } from '@/components/sections/CTABanner'
import { getSiteSettings } from '@/lib/queries'

/**
 * Category archive shared by /category/X/ and /category/X/page/N/ —
 * preserves the WordPress pagination URL scheme.
 */
export async function CategoryArchive({
  categorySlug,
  page,
}: {
  categorySlug: string
  page: number
}) {
  const payload = await getPayload({ config: configPromise })

  const { docs: categories } = await payload.find({
    collection: 'categories',
    limit: 1,
    pagination: false,
    where: { slug: { equals: categorySlug } },
  })
  const category = categories[0]
  if (!category) notFound()

  const [posts, siteSettings] = await Promise.all([
    payload.find({
      collection: 'posts',
      draft: false,
      limit: POSTS_PER_PAGE,
      overrideAccess: false,
      page,
      sort: '-publishedAt',
      where: { categories: { in: [category.id] } },
    }),
    getSiteSettings(),
  ])

  if (page > 1 && posts.docs.length === 0) notFound()

  return (
    <>
      <header className="bg-navy-950 py-14 text-white">
        <div className="container">
          <p className="text-sm font-semibold tracking-widest text-amber-accent uppercase">
            Category
          </p>
          <h1 className="mt-2 text-3xl font-bold md:text-5xl">Category: {category.title}</h1>
          <CategoryChips activeSlug={categorySlug} />
        </div>
      </header>

      <section className="py-14">
        <div className="container">
          {posts.docs.length === 0 ? (
            <p className="text-center text-muted-foreground">No articles in this category yet.</p>
          ) : (
            <div className="grid gap-10 lg:grid-cols-[minmax(0,1fr)_300px]">
              <div>
                <div className="grid gap-6 sm:grid-cols-2">
                  {posts.docs.map((post) => (
                    <PostCard key={post.id} post={post} />
                  ))}
                </div>
                <PaginationNav
                  basePath={`/category/${categorySlug}/`}
                  currentPage={page}
                  totalPages={posts.totalPages}
                />
              </div>

              <aside className="space-y-10 lg:sticky lg:top-28 lg:self-start">
                <SidebarCTA siteSettings={siteSettings} />
                <SidebarCategories activeSlug={categorySlug} />
                <SidebarRecentPosts />
              </aside>
            </div>
          )}
        </div>
      </section>

      <CTABanner phone={siteSettings.phone} />
    </>
  )
}
