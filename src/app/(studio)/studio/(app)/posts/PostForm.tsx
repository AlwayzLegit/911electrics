'use client'

import Link from 'next/link'
import { useActionState } from 'react'

import type { PostFormState } from '@/app/actions/studio-posts'
import type { MediaItem } from '@/studio/media'
import type { StudioCategory, StudioPost } from '@/studio/posts'
import { RichTextEditor } from '@/studio/editor/RichTextEditor'

import { MediaPicker } from '../_components/MediaPicker'

type Action = (prev: PostFormState, formData: FormData) => Promise<PostFormState>

const inputCls =
  'w-full rounded-lg border border-slate-300 bg-white px-3.5 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-brand-500 focus:ring-2 focus:ring-brand-500/30 focus:outline-none'
const labelCls = 'mb-1.5 block text-sm font-medium text-slate-700'

function toLocalInput(iso: string | null): string {
  if (!iso) return ''
  const d = new Date(iso)
  if (Number.isNaN(d.getTime())) return ''
  const pad = (n: number) => String(n).padStart(2, '0')
  return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}T${pad(d.getHours())}:${pad(d.getMinutes())}`
}

export function PostForm({
  action,
  initial,
  mediaItems,
  categories,
  submitLabel,
}: {
  action: Action
  initial?: StudioPost | null
  mediaItems: MediaItem[]
  categories: StudioCategory[]
  submitLabel: string
}) {
  const [state, formAction, pending] = useActionState<PostFormState, FormData>(action, {})
  const selectedCats = new Set(initial?.categoryIds ?? [])

  return (
    <form action={formAction} className="space-y-6">
      {state.error && (
        <div className="rounded-lg bg-red-50 px-4 py-3 text-sm font-medium text-red-700">
          {state.error}
        </div>
      )}

      <section className="space-y-5 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
        <div>
          <label className={labelCls} htmlFor="title">Title</label>
          <input className={inputCls} defaultValue={initial?.title ?? ''} id="title" name="title" required type="text" />
        </div>
        <div>
          <label className={labelCls} htmlFor="slug">
            URL slug <span className="text-slate-400">(leave blank to auto-generate from title)</span>
          </label>
          <input className={inputCls} defaultValue={initial?.slug ?? ''} id="slug" name="slug" placeholder="my-post-title" type="text" />
        </div>
        <div>
          <span className={labelCls}>Content</span>
          <RichTextEditor initial={initial?.content} name="content" />
        </div>
      </section>

      <section className="grid gap-5 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm sm:grid-cols-2">
        <MediaPicker initialId={initial?.heroImageId} items={mediaItems} label="Hero image" name="heroImage" />
        <div>
          <label className={labelCls} htmlFor="status">Status</label>
          <select className={inputCls} defaultValue={initial?.status ?? 'draft'} id="status" name="status">
            <option value="draft">Draft (hidden)</option>
            <option value="published">Published (live)</option>
          </select>
          <label className="mb-1.5 mt-4 block text-sm font-medium text-slate-700" htmlFor="publishedAt">
            Publish date <span className="text-slate-400">(optional)</span>
          </label>
          <input
            className={inputCls}
            defaultValue={toLocalInput(initial?.publishedAt ?? null)}
            id="publishedAt"
            name="publishedAt"
            type="datetime-local"
          />
        </div>
      </section>

      {categories.length > 0 && (
        <section className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
          <span className={labelCls}>Categories</span>
          <div className="flex flex-wrap gap-3">
            {categories.map((c) => (
              <label className="flex items-center gap-2 text-sm text-slate-700" key={c.id}>
                <input
                  className="size-4 rounded border-slate-300 text-brand-600 focus:ring-brand-500/30"
                  defaultChecked={selectedCats.has(c.id)}
                  name="categories"
                  type="checkbox"
                  value={c.id}
                />
                {c.title}
              </label>
            ))}
          </div>
        </section>
      )}

      <section className="space-y-5 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
        <h2 className="text-sm font-semibold uppercase tracking-wide text-slate-500">SEO</h2>
        <div>
          <label className={labelCls} htmlFor="metaTitle">Meta title <span className="text-slate-400">(optional)</span></label>
          <input className={inputCls} defaultValue={initial?.metaTitle ?? ''} id="metaTitle" name="metaTitle" type="text" />
        </div>
        <div>
          <label className={labelCls} htmlFor="metaDescription">Meta description <span className="text-slate-400">(optional)</span></label>
          <textarea className={inputCls} defaultValue={initial?.metaDescription ?? ''} id="metaDescription" name="metaDescription" rows={2} />
        </div>
        <MediaPicker initialId={initial?.metaImageId} items={mediaItems} label="Social share image" name="metaImage" />
      </section>

      <div className="flex items-center gap-3">
        <button
          className="rounded-lg bg-brand-600 px-5 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-brand-700 disabled:opacity-60"
          disabled={pending}
          type="submit"
        >
          {pending ? 'Saving…' : submitLabel}
        </button>
        <Link className="text-sm font-medium text-slate-500 hover:text-slate-700" href="/studio/posts">
          Cancel
        </Link>
      </div>
    </form>
  )
}
