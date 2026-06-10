import Link from 'next/link'
import React from 'react'

import type { Post } from '@/payload-types'

import { Media } from '@/components/Media'
import { formatDateTime } from '@/utilities/formatDateTime'

export function PostCard({ post }: { post: Post }) {
  return (
    <Link
      className="group overflow-hidden rounded-xl border border-border bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-lg"
      href={`/${post.slug}/`}
    >
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
      <div className="p-6">
        {post.publishedAt && (
          <time className="text-xs text-muted-foreground" dateTime={post.publishedAt}>
            {formatDateTime(post.publishedAt)}
          </time>
        )}
        <h3 className="mt-1.5 line-clamp-2 text-lg font-semibold text-navy-950 group-hover:text-brand-700">
          {post.title}
        </h3>
        {post.meta?.description && (
          <p className="mt-2 line-clamp-3 text-sm leading-relaxed text-muted-foreground">
            {post.meta.description}
          </p>
        )}
      </div>
    </Link>
  )
}
