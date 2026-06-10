import type { Metadata } from 'next'

import configPromise from '@payload-config'
import { notFound } from 'next/navigation'
import { getPayload } from 'payload'
import React from 'react'

import { PostCard } from '@/components/PostCard'

export const revalidate = 86400

type Args = {
  params: Promise<{ category: string }>
}

export async function generateStaticParams() {
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'categories',
    limit: 100,
    pagination: false,
    select: { slug: true },
  })
  return docs.filter((c) => c.slug).map((c) => ({ category: c.slug as string }))
}

export default async function CategoryPage({ params }: Args) {
  const { category: categorySlug } = await params
  const payload = await getPayload({ config: configPromise })

  const { docs: categories } = await payload.find({
    collection: 'categories',
    limit: 1,
    pagination: false,
    where: { slug: { equals: categorySlug } },
  })
  const category = categories[0]
  if (!category) notFound()

  const { docs: posts } = await payload.find({
    collection: 'posts',
    draft: false,
    limit: 100,
    overrideAccess: false,
    pagination: false,
    sort: '-publishedAt',
    where: { categories: { in: [category.id] } },
  })

  return (
    <>
      <header className="bg-navy-950 py-14 text-white">
        <div className="container">
          <p className="text-sm font-semibold tracking-widest text-amber-accent uppercase">Category</p>
          <h1 className="mt-2 text-3xl font-bold md:text-5xl">Category: {category.title}</h1>
        </div>
      </header>
      <section className="py-14">
        <div className="container">
          {posts.length === 0 ? (
            <p className="text-center text-muted-foreground">No articles in this category yet.</p>
          ) : (
            <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
              {posts.map((post) => (
                <PostCard key={post.id} post={post} />
              ))}
            </div>
          )}
        </div>
      </section>
    </>
  )
}

export async function generateMetadata({ params }: Args): Promise<Metadata> {
  const { category } = await params
  const title = category
    .split('-')
    .map((w) => w[0]?.toUpperCase() + w.slice(1))
    .join(' ')
  return {
    title: `${title} | 911 Construction & Electric Inc.`,
    alternates: { canonical: `/category/${category}/` },
  }
}
