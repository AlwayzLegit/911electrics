import { Clock } from 'lucide-react'
import Link from 'next/link'
import React from 'react'

import type { Post } from '@/payload-types'

import { Media } from '@/components/Media'
import { readingTime } from '@/lib/blog'
import { formatDateTime } from '@/utilities/formatDateTime'

const firstCategoryTitle = (post: Post): string | null => {
  const category = post.categories?.find((c) => typeof c === 'object')
  return category && typeof category === 'object' ? category.title : null
}

export function PostCard({ post }: { post: Post }) {
  const category = firstCategoryTitle(post)
  const minutes = post.content ? readingTime(post.content) : null

  return (
    <Link
      className="group flex flex-col overflow-hidden rounded-xl border border-border bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-lg"
      href={`/${post.slug}/`}
    >
      <div className="relative">
        {post.heroImage && typeof post.heroImage === 'object' ? (
          <div className="relative aspect-[16/9] overflow-hidden bg-card">
            <Media
              fill
              imgClassName="object-cover transition duration-300 group-hover:scale-105"
              resource={post.heroImage}
              size="(min-width: 1024px) 33vw, (min-width: 640px) 50vw, 100vw"
            />
          </div>
        ) : (
          <div className="aspect-[16/9] bg-gradient-to-br from-brand-700 to-navy-900" />
        )}
        {category && (
          <span className="absolute top-3 left-3 rounded-full bg-brand-600 px-2.5 py-1 text-xs font-semibold text-white">
            {category}
          </span>
        )}
      </div>
      <div className="flex flex-1 flex-col p-6">
        <p className="flex items-center gap-2 text-xs text-muted-foreground">
          {post.publishedAt && (
            <time dateTime={post.publishedAt}>{formatDateTime(post.publishedAt)}</time>
          )}
          {minutes && (
            <>
              <span aria-hidden>·</span>
              <span className="flex items-center gap-1">
                <Clock aria-hidden className="size-3" />
                {minutes} min read
              </span>
            </>
          )}
        </p>
        <h3 className="mt-1.5 line-clamp-2 text-lg font-semibold text-navy-950 group-hover:text-brand-700">
          {post.title}
        </h3>
        {post.meta?.description && (
          <p className="mt-2 line-clamp-3 text-sm leading-relaxed text-muted-foreground">
            {post.meta.description}
          </p>
        )}
        <span className="mt-auto pt-4 text-sm font-semibold text-brand-700 opacity-0 transition group-hover:opacity-100">
          Read article →
        </span>
      </div>
    </Link>
  )
}

/** Large horizontal card for the newest post at the top of the blog index. */
export function FeaturedPostCard({ post }: { post: Post }) {
  const category = firstCategoryTitle(post)
  const minutes = post.content ? readingTime(post.content) : null

  return (
    <Link
      className="group grid overflow-hidden rounded-xl border border-border bg-white shadow-sm transition hover:shadow-lg md:grid-cols-2"
      href={`/${post.slug}/`}
    >
      <div className="relative">
        {post.heroImage && typeof post.heroImage === 'object' ? (
          <div className="relative aspect-[16/9] h-full overflow-hidden bg-card md:aspect-auto md:min-h-72">
            <Media
              fill
              imgClassName="object-cover transition duration-300 group-hover:scale-105"
              priority
              resource={post.heroImage}
              size="(min-width: 768px) 50vw, 100vw"
            />
          </div>
        ) : (
          <div className="aspect-[16/9] h-full bg-gradient-to-br from-brand-700 to-navy-900 md:aspect-auto md:min-h-72" />
        )}
        <span className="absolute top-3 left-3 rounded-full bg-amber-accent px-2.5 py-1 text-xs font-bold text-navy-950">
          Latest
        </span>
      </div>
      <div className="flex flex-col justify-center p-7 md:p-9">
        <p className="flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
          {category && <span className="font-semibold text-brand-700 uppercase">{category}</span>}
          {post.publishedAt && (
            <time dateTime={post.publishedAt}>{formatDateTime(post.publishedAt)}</time>
          )}
          {minutes && (
            <span className="flex items-center gap-1">
              <Clock aria-hidden className="size-3" />
              {minutes} min read
            </span>
          )}
        </p>
        <h2 className="mt-3 text-2xl font-bold text-balance text-navy-950 group-hover:text-brand-700 md:text-3xl">
          {post.title}
        </h2>
        {post.meta?.description && (
          <p className="mt-3 line-clamp-3 leading-relaxed text-muted-foreground">
            {post.meta.description}
          </p>
        )}
        <span className="mt-5 text-sm font-semibold text-brand-700">Read article →</span>
      </div>
    </Link>
  )
}
