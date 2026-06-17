'use server'

import { redirect } from 'next/navigation'

import { studioLogin, studioLogout } from '@/studio/auth'

export type StudioLoginState = { error?: string }

export async function loginAction(
  _prev: StudioLoginState,
  formData: FormData,
): Promise<StudioLoginState> {
  const email = String(formData.get('email') || '').trim()
  const password = String(formData.get('password') || '')

  if (!email || !password) {
    return { error: 'Enter your email and password.' }
  }

  const result = await studioLogin(email, password)
  if (!result.ok) {
    return { error: result.error }
  }

  redirect('/studio')
}

export async function logoutAction(): Promise<void> {
  await studioLogout()
  redirect('/studio/login')
}
