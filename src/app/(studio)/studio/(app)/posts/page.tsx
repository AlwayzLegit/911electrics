import Link from 'next/link'

import { getAllPosts } from '@/studio/posts'

import { PostRowActions } from './PostRowActions'

export const dynamic = 'force-dynamic'

export default async function StudioPostsPage() {
  const posts = await getAllPosts()

  return (
    <div className="space-y-6">
      <header className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold tracking-tight">Blog Posts</h1>
          <p className="mt-1 text-sm text-slate-500">{posts.length} post{posts.length === 1 ? '' : 's'}.</p>
        </div>
        <Link
          className="rounded-lg bg-brand-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-brand-700"
          href="/studio/posts/new"
        >
          New post
        </Link>
      </header>

      {posts.length === 0 ? (
        <div className="rounded-xl border border-slate-200 bg-white px-5 py-12 text-center text-sm text-slate-500">
          No posts yet. Write your first one.
        </div>
      ) : (
        <div className="overflow-hidden rounded-xl border border-slate-200 bg-white">
          <ul className="divide-y divide-slate-100">
            {posts.map((p) => (
              <li className="flex items-center gap-3 px-5 py-3.5" key={p.id}>
                <div className="min-w-0 flex-1">
                  <div className="truncate text-sm font-medium text-slate-900">{p.title}</div>
                  <div className="text-xs text-slate-500">
                    {p.slug ? `/${p.slug}` : 'no slug'}
                    {p.status === 'scheduled' && p.scheduledFor
                      ? ` · publishes ${new Date(p.scheduledFor).toLocaleString()}`
                      : p.publishedAt
                        ? ` · ${new Date(p.publishedAt).toLocaleDateString()}`
                        : ''}
                  </div>
                </div>
                <span
                  className={`shrink-0 rounded-full px-2.5 py-0.5 text-xs font-semibold ${
                    p.status === 'published'
                      ? 'bg-green-100 text-green-800'
                      : p.status === 'scheduled'
                        ? 'bg-blue-100 text-blue-800'
                        : 'bg-slate-200 text-slate-600'
                  }`}
                >
                  {p.status === 'published' ? 'Published' : p.status === 'scheduled' ? 'Scheduled' : 'Draft'}
                </span>
                <PostRowActions id={p.id} slug={p.slug} />
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  )
}
