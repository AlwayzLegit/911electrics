import { redirect } from 'next/navigation'

import { getStudioUser } from '@/studio/auth'
import { getStudioSettings } from '@/studio/settings'

import { SettingsForm } from './SettingsForm'

export const dynamic = 'force-dynamic'

export default async function StudioSettingsPage() {
  const me = await getStudioUser()
  if (!me) redirect('/studio/login')
  if (me.role !== 'admin') redirect('/studio')

  const settings = await getStudioSettings()

  return (
    <div className="space-y-6">
      <header>
        <h1 className="text-2xl font-semibold tracking-tight">Business Info</h1>
        <p className="mt-1 text-sm text-slate-500">
          Your business details, contact info and social links. Changes go live on the website
          immediately.
        </p>
      </header>
      <SettingsForm initial={settings} />
    </div>
  )
}
