import { redirect } from 'next/navigation'

import { getStudioUser } from '@/studio/auth'

import { LoginForm } from './LoginForm'

export default async function StudioLoginPage() {
  // Already signed in → straight to the dashboard.
  const user = await getStudioUser()
  if (user) redirect('/studio')

  return (
    <main className="flex min-h-screen items-center justify-center px-4">
      <div className="w-full max-w-sm">
        <div className="mb-8 flex flex-col items-center text-center">
          <svg aria-hidden height="48" viewBox="0 0 100 100" width="48" xmlns="http://www.w3.org/2000/svg">
            <rect fill="#d01d24" height="100" rx="22" width="100" />
            <path d="M56 12 L26 56 L46 56 L40 88 L74 42 L52 42 Z" fill="#ffffff" />
          </svg>
          <h1 className="mt-4 text-xl font-semibold tracking-tight">911 Construction &amp; Electric</h1>
          <p className="mt-1 text-sm text-slate-500">Sign in to your dashboard</p>
        </div>
        <LoginForm />
      </div>
    </main>
  )
}
