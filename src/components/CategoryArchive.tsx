import configPromise from '@payload-config'
import { notFound } from 'next/navigation'
import { getPayload } from 'payload'
import React from 'react'

import { POSTS_PER_PAGE } from '@/components/BlogArchive'
import { PaginationNav } from '@/components/PaginationNav'
import { PostCard } from '@/components/PostCard'

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

  const posts = await payload.find({
    collection: 'posts',
    draft: false,
    limit: POSTS_PER_PAGE,
    overrideAccess: false,
    page,
    sort: '-publishedAt',
    where: { categories: { in: [category.id] } },
  })

  if (page > 1 && posts.docs.length === 0) notFound()

  return (
    <>
      <header className="bg-navy-950 py-14 text-white">
        <div className="container">
          <p className="text-sm font-semibold tracking-widest text-amber-accent uppercase">
            Category
          </p>
          <h1 className="mt-2 text-3xl font-bold md:text-5xl">Category: {category.title}</h1>
        </div>
      </header>
      <section className="py-14">
        <div className="container">
          {posts.docs.length === 0 ? (
            <p className="text-center text-muted-foreground">No articles in this category yet.</p>
          ) : (
            <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
              {posts.docs.map((post) => (
                <PostCard key={post.id} post={post} />
              ))}
            </div>
          )}
          <PaginationNav
            basePath={`/category/${categorySlug}/`}
            currentPage={page}
            totalPages={posts.totalPages}
          />
        </div>
      </section>
    </>
  )
}
