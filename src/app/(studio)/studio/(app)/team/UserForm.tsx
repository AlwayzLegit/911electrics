'use client'

import Link from 'next/link'
import { useActionState } from 'react'

import type { UserFormState } from '@/app/actions/studio-users'
import { STUDIO_ROLES, STUDIO_ROLE_LABEL } from '@/studio/constants'
import type { StudioUserRow } from '@/studio/users'

type Action = (prev: UserFormState, formData: FormData) => Promise<UserFormState>

const inputCls =
  'w-full rounded-lg border border-slate-300 bg-white px-3.5 py-2.5 text-sm focus:border-brand-500 focus:ring-2 focus:ring-brand-500/30 focus:outline-none'
const labelCls = 'mb-1.5 block text-sm font-medium text-slate-700'

export function UserForm({
  action,
  initial,
  submitLabel,
  mode,
}: {
  action: Action
  initial?: StudioUserRow | null
  submitLabel: string
  mode: 'create' | 'edit'
}) {
  const [state, formAction, pending] = useActionState<UserFormState, FormData>(action, {})

  return (
    <form action={formAction} className="space-y-5 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
      {state.error && (
        <div className="rounded-lg bg-red-50 px-4 py-3 text-sm font-medium text-red-700">{state.error}</div>
      )}

      <div className="grid gap-5 sm:grid-cols-2">
        <div>
          <label className={labelCls} htmlFor="name">Name</label>
          <input className={inputCls} defaultValue={initial?.name ?? ''} id="name" name="name" type="text" />
        </div>
        <div>
          <label className={labelCls} htmlFor="email">Email</label>
          <input className={inputCls} defaultValue={initial?.email ?? ''} id="email" name="email" required type="email" />
        </div>
      </div>

      <div>
        <label className={labelCls} htmlFor="role">Role</label>
        <select className={inputCls} defaultValue={initial?.role ?? 'editor'} id="role" name="role">
          {STUDIO_ROLES.map((r) => (
            <option key={r} value={r}>{STUDIO_ROLE_LABEL[r]}</option>
          ))}
        </select>
      </div>

      {mode === 'create' && (
        <div>
          <label className={labelCls} htmlFor="password">Temporary password</label>
          <input className={inputCls} id="password" minLength={8} name="password" required type="text" />
          <p className="mt-1 text-xs text-slate-400">At least 8 characters. Share it with the user; they can change it from Account.</p>
        </div>
      )}

      {mode === 'edit' && (
        <label className="flex items-center gap-2.5 text-sm font-medium text-slate-700">
          <input className="size-4 rounded border-slate-300 text-brand-600 focus:ring-brand-500/30" defaultChecked={initial?.disabled ?? false} name="disabled" type="checkbox" />
          Disable this account (blocks sign-in)
        </label>
      )}

      <div className="flex items-center gap-3">
        <button className="rounded-lg bg-brand-600 px-5 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-brand-700 disabled:opacity-60" disabled={pending} type="submit">
          {pending ? 'Saving…' : submitLabel}
        </button>
        <Link className="text-sm font-medium text-slate-500 hover:text-slate-700" href="/studio/team">Cancel</Link>
      </div>
    </form>
  )
}
