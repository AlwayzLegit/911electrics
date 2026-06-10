import type { Metadata } from 'next'

import configPromise from '@payload-config'
import { notFound, redirect } from 'next/navigation'
import { getPayload } from 'payload'
import React from 'react'

import { BlogArchive, POSTS_PER_PAGE } from '@/components/BlogArchive'

export const revalidate = 86400

type Args = {
  params: Promise<{ pageNumber: string }>
}

export async function generateStaticParams() {
  const payload = await getPayload({ config: configPromise })
  const { totalDocs } = await payload.count({
    collection: 'posts',
    overrideAccess: false,
    where: { _status: { equals: 'published' } },
  })
  const totalPages = Math.ceil(totalDocs / POSTS_PER_PAGE)
  return Array.from({ length: Math.max(totalPages - 1, 0) }, (_, i) => ({
    pageNumber: String(i + 2),
  }))
}

export default async function BlogPaginatedPage({ params }: Args) {
  const { pageNumber } = await params
  const page = Number(pageNumber)
  if (!Number.isInteger(page) || page < 1) notFound()
  if (page === 1) redirect('/blog/')
  return <BlogArchive page={page} />
}

export async function generateMetadata({ params }: Args): Promise<Metadata> {
  const { pageNumber } = await params
  return {
    title: `Electrical Tips & Guides — Page ${pageNumber} | 911 Construction & Electric Inc.`,
    alternates: { canonical: `/blog/page/${pageNumber}/` },
  }
}
