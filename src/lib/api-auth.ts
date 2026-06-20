import crypto from 'crypto'

import { NextResponse } from 'next/server'

/**
 * Shared bearer-token auth for the programmatic API (`/api/blog`, `/api/leads`,
 * `/api/content/*`). One token, `BLOG_API_TOKEN`, gates everything.
 *
 * Usage in a route handler:
 *   const auth = requireApiToken(req)
 *   if (!auth.ok) return auth.response
 */
export type ApiAuthResult = { ok: true } | { ok: false; response: NextResponse }

export function requireApiToken(req: Request): ApiAuthResult {
  const token = process.env.BLOG_API_TOKEN
  if (!token) {
    return {
      ok: false,
      response: NextResponse.json(
        { error: 'API is not configured. Set BLOG_API_TOKEN.' },
        { status: 503 },
      ),
    }
  }

  const header = req.headers.get('authorization') || ''
  const bearer = /^Bearer\s+(.+)$/i.exec(header)?.[1]
  const provided = bearer ?? req.headers.get('x-api-key') ?? ''

  const a = Buffer.from(provided)
  const b = Buffer.from(token)
  const valid = a.length === b.length && crypto.timingSafeEqual(a, b)
  if (!valid) {
    return { ok: false, response: NextResponse.json({ error: 'Unauthorized' }, { status: 401 }) }
  }
  return { ok: true }
}

/** Actor recorded in the audit log for API-driven writes. */
export const API_ACTOR = { id: null, email: 'blog-api' } as const
