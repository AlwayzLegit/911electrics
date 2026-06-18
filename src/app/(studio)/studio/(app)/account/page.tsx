import { redirect } from 'next/navigation'

import { changeOwnPassword } from '@/app/actions/studio-users'
import { getStudioUser } from '@/studio/auth'
import { STUDIO_ROLE_LABEL } from '@/studio/constants'

import { PasswordForm } from '../team/PasswordForm'

export const dynamic = 'force-dynamic'

export default async function AccountPage() {
  const me = await getStudioUser()
  if (!me) redirect('/studio/login')

  return (
    <div className="space-y-6">
      <header>
        <h1 className="text-2xl font-semibold tracking-tight">Account</h1>
        <p className="mt-1 text-sm text-slate-500">
          {me.name ? `${me.name} · ` : ''}
          {me.email} · {STUDIO_ROLE_LABEL[me.role]}
        </p>
      </header>

      <section className="space-y-3">
        <h2 className="text-sm font-semibold uppercase tracking-wide text-slate-500">
          Change your password
        </h2>
        <PasswordForm action={changeOwnPassword} requireCurrent submitLabel="Update password" />
      </section>
    </div>
  )
}
