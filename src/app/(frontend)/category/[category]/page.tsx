import type { Metadata } from 'next'

import configPromise from '@payload-config'
import { getPayload } from 'payload'
import React from 'react'

import { CategoryArchive } from '@/components/CategoryArchive'

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
  const slugs: { category: string }[] = []
  for (const c of docs) {
    if (!c.slug) continue
    const { totalDocs } = await payload.count({
      collection: 'posts',
      where: { categories: { equals: c.id } },
    })
    if (totalDocs > 0) slugs.push({ category: c.slug })
  }
  return slugs
}

export default async function CategoryPage({ params }: Args) {
  const { category } = await params
  return <CategoryArchive categorySlug={category} page={1} />
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
