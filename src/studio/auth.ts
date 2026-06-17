import 'server-only'

import configPromise from '@payload-config'
import { cookies, headers } from 'next/headers'
import { getPayload } from 'payload'

import type { User } from '@/payload-types'

/**
 * Custom admin ("Studio") auth, built directly on Payload's local API so we
 * reuse Payload's user collection, password hashing and JWT — without rendering
 * any of Payload's admin UI. The Studio is a bespoke, crash-proof admin that
 * talks to Payload purely as a headless backend.
 *
 * Payload issues a JWT and (by default) stores it in the `payload-token`
 * cookie. We set the same cookie on login so `payload.auth()` recognises the
 * session everywhere, and clear it on logout.
 */

const TOKEN_COOKIE = 'payload-token'

export async function getStudioUser(): Promise<User | null> {
  const payload = await getPayload({ config: configPromise })
  try {
    const { user } = await payload.auth({ headers: await headers() })
    return (user as User) ?? null
  } catch {
    return null
  }
}

export type StudioLoginResult = { ok: true } | { ok: false; error: string }

export async function studioLogin(email: string, password: string): Promise<StudioLoginResult> {
  const payload = await getPayload({ config: configPromise })
  try {
    const result = await payload.login({
      collection: 'users',
      data: { email, password },
    })

    if (!result?.token) {
      return { ok: false, error: 'Invalid email or password.' }
    }

    const cookieStore = await cookies()
    cookieStore.set(TOKEN_COOKIE, result.token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      path: '/',
      // result.exp is a unix timestamp (seconds); fall back to 2h.
      expires: result.exp ? new Date(result.exp * 1000) : new Date(Date.now() + 2 * 60 * 60 * 1000),
    })

    return { ok: true }
  } catch {
    return { ok: false, error: 'Invalid email or password.' }
  }
}

export async function studioLogout(): Promise<void> {
  const cookieStore = await cookies()
  cookieStore.delete(TOKEN_COOKIE)
}
