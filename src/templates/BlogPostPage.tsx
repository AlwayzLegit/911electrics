import React from 'react'

import type { Post, SiteSetting } from '@/payload-types'

import { Media } from '@/components/Media'
import { PostCard } from '@/components/PostCard'
import RichText from '@/components/RichText'
import { CTABanner } from '@/components/sections/CTABanner'
import { formatAuthors } from '@/utilities/formatAuthors'
import { formatDateTime } from '@/utilities/formatDateTime'

export function BlogPostPage({ post, siteSettings }: { post: Post; siteSettings: SiteSetting }) {
  const relatedPosts = (post.relatedPosts ?? []).filter((p): p is Post => typeof p === 'object')
  const hasAuthors =
    !!post.populatedAuthors?.length && formatAuthors(post.populatedAuthors) !== ''

  return (
    <article>
      <header className="bg-navy-950 py-14 text-white">
        <div className="container max-w-4xl">
          <p className="text-sm font-semibold tracking-widest text-amber-accent uppercase">
            {post.categories
              ?.filter((c): c is Exclude<typeof c, number> => typeof c === 'object')
              .map((c) => c.title)
              .join(' · ') || 'Blog'}
          </p>
          <h1 className="mt-3 text-3xl font-bold text-balance md:text-5xl">{post.title}</h1>
          <p className="mt-4 text-sm text-white/70">
            {post.publishedAt && (
              <time dateTime={post.publishedAt}>{formatDateTime(post.publishedAt)}</time>
            )}
            {hasAuthors && <> · By {formatAuthors(post.populatedAuthors!)}</>}
          </p>
        </div>
      </header>

      {post.heroImage && typeof post.heroImage === 'object' && (
        <div className="container max-w-4xl">
          <div className="relative -mt-8 aspect-[2/1] overflow-hidden rounded-xl shadow-lg">
            <Media fill imgClassName="object-cover" priority resource={post.heroImage} size="56rem" />
          </div>
        </div>
      )}

      <div className="container max-w-4xl py-12">
        <RichText className="max-w-none" data={post.content} enableGutter={false} />
      </div>

      {!!relatedPosts.length && (
        <section className="bg-card py-16">
          <div className="container">
            <h2 className="text-2xl font-bold text-navy-950">Keep Reading</h2>
            <div className="mt-8 grid gap-6 md:grid-cols-2 lg:grid-cols-3">
              {relatedPosts.map((p) => (
                <PostCard key={p.id} post={p} />
              ))}
            </div>
          </div>
        </section>
      )}

      <CTABanner
        heading="Have an electrical project in mind?"
        body="Talk to a licensed electrician today — free estimates, 24/7 emergency service."
        phone={siteSettings.phone}
      />
    </article>
  )
}
