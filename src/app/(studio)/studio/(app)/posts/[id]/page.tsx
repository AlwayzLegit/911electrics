import Link from 'next/link'
import { notFound } from 'next/navigation'

import { updatePost } from '@/app/actions/studio-posts'
import { getAllMedia } from '@/studio/media'
import { getPostById, getStudioCategories } from '@/studio/posts'

import { PostForm } from '../PostForm'

export const dynamic = 'force-dynamic'

export default async function EditPostPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const postId = Number(id)
  if (Number.isNaN(postId)) notFound()

  const [post, mediaItems, categories] = await Promise.all([
    getPostById(postId),
    getAllMedia(),
    getStudioCategories(),
  ])
  if (!post) notFound()

  const action = updatePost.bind(null, postId)

  return (
    <div className="space-y-6">
      <Link
        className="inline-flex items-center gap-1 text-sm font-medium text-brand-600 hover:text-brand-700"
        href="/studio/posts"
      >
        <svg fill="none" height="16" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24" width="16">
          <path d="M15 18l-6-6 6-6" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
        Back to posts
      </Link>
      <header>
        <h1 className="text-2xl font-semibold tracking-tight">Edit post</h1>
      </header>
      <PostForm
        action={action}
        categories={categories}
        initial={post}
        mediaItems={mediaItems}
        submitLabel="Save post"
      />
    </div>
  )
}
