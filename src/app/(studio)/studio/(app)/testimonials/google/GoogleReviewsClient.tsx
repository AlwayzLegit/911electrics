'use client'

import { useActionState, useState, useTransition } from 'react'

import {
  replyToGoogleReview,
  syncGoogleReviews,
  toggleFeatureGoogleReview,
  type GoogleActionResult,
} from '@/app/actions/google'

const initial: GoogleActionResult = { ok: true }

export function SyncButton({ disabled }: { disabled?: boolean }) {
  const [pending, start] = useTransition()
  const [msg, setMsg] = useState<{ ok: boolean; text: string } | null>(null)

  return (
    <div className="flex items-center gap-3">
      <button
        className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white shadow-sm transition hover:bg-brand-700 disabled:opacity-60"
        disabled={pending || disabled}
        onClick={() =>
          start(async () => {
            const res = await syncGoogleReviews()
            setMsg({ ok: res.ok, text: res.ok ? res.message ?? 'Synced.' : res.error })
          })
        }
        type="button"
      >
        {pending ? 'Syncing…' : 'Sync now'}
      </button>
      {msg && <span className={`text-sm ${msg.ok ? 'text-green-700' : 'text-red-600'}`}>{msg.text}</span>}
    </div>
  )
}

export function FeatureToggle({ id, featured }: { id: number; featured: boolean }) {
  const [pending, start] = useTransition()
  const [on, setOn] = useState(featured)
  const [err, setErr] = useState<string | null>(null)

  return (
    <div className="flex items-center gap-2">
      <button
        className={`rounded-lg px-3 py-1.5 text-xs font-semibold transition disabled:opacity-60 ${
          on ? 'bg-green-100 text-green-700 hover:bg-green-200' : 'border border-slate-300 text-slate-700 hover:bg-slate-50'
        }`}
        disabled={pending}
        onClick={() =>
          start(async () => {
            setErr(null)
            const res = await toggleFeatureGoogleReview(id)
            if (res.ok) setOn((v) => !v)
            else setErr(res.error)
          })
        }
        type="button"
      >
        {pending ? '…' : on ? '★ Featured on site' : 'Feature on site'}
      </button>
      {err && <span className="text-xs text-red-600">{err}</span>}
    </div>
  )
}

export function ReplyForm({ id, existing }: { id: number; existing: string | null }) {
  const [state, action, pending] = useActionState(replyToGoogleReview.bind(null, id), initial)
  const [open, setOpen] = useState(false)

  if (!open && !existing) {
    return (
      <button
        className="text-sm font-medium text-brand-600 hover:text-brand-700"
        onClick={() => setOpen(true)}
        type="button"
      >
        Reply
      </button>
    )
  }

  return (
    <form action={action} className="space-y-2">
      <textarea
        className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm focus:border-brand-500 focus:ring-2 focus:ring-brand-500/30 focus:outline-none"
        defaultValue={existing ?? ''}
        name="reply"
        placeholder="Write a public reply…"
        rows={3}
      />
      <div className="flex items-center gap-3">
        <button
          className="rounded-lg bg-brand-600 px-3.5 py-1.5 text-sm font-semibold text-white shadow-sm transition hover:bg-brand-700 disabled:opacity-60"
          disabled={pending}
          type="submit"
        >
          {pending ? 'Posting…' : existing ? 'Update reply' : 'Post reply'}
        </button>
        {!state.ok && <span className="text-sm text-red-600">{state.error}</span>}
        {state.ok && state.message && <span className="text-sm text-green-700">{state.message}</span>}
      </div>
    </form>
  )
}
