import crypto from 'crypto'

import { NextResponse } from 'next/server'

/**
 * Shared bearer-token auth for the programmatic API (`/api/blog`,
 * `/api/content/*`, `/api/revalidate`), the lead export and the cron workers.
 *
 * Every guard here FAILS CLOSED: if its secret is not configured the endpoint
 * answers 503 and does nothing. An unset env var must never mean "open".
 *
 * Usage in a route handler:
 *   const auth = requireApiToken(req)
 *   if (!auth.ok) return auth.response
 */
export type ApiAuthResult = { ok: true } | { ok: false; response: NextResponse }

function requireSecret(
  req: Request,
  secret: string | undefined,
  opts: { name: string; allowApiKeyHeader?: boolean },
): ApiAuthResult {
  if (!secret) {
    return {
      ok: false,
      response: NextResponse.json(
        { error: `Not configured. Set ${opts.name}.` },
        { status: 503 },
      ),
    }
  }

  const header = req.headers.get('authorization') || ''
  const bearer = /^Bearer\s+(.+)$/i.exec(header)?.[1]
  const provided = bearer ?? (opts.allowApiKeyHeader ? req.headers.get('x-api-key') : null) ?? ''

  const a = Buffer.from(provided)
  const b = Buffer.from(secret)
  const valid = a.length === b.length && crypto.timingSafeEqual(a, b)
  if (!valid) {
    return { ok: false, response: NextResponse.json({ error: 'Unauthorized' }, { status: 401 }) }
  }
  return { ok: true }
}

/** Content API: blog posts, services, service areas, testimonials, revalidate. */
export function requireApiToken(req: Request): ApiAuthResult {
  return requireSecret(req, process.env.BLOG_API_TOKEN, {
    name: 'BLOG_API_TOKEN',
    allowApiKeyHeader: true,
  })
}

/**
 * Lead export (`GET /api/leads`) — customer names, phones, emails, addresses.
 *
 * `BLOG_API_TOKEN` is handed to the external blog writer, which has no business
 * reading that. Set `LEADS_API_TOKEN` and the lead export accepts only it, so
 * the writer's token stops working here. Left unset, the export keeps accepting
 * `BLOG_API_TOKEN` so an existing integration does not break on deploy.
 */
export function requireLeadsToken(req: Request): ApiAuthResult {
  const dedicated = process.env.LEADS_API_TOKEN
  return requireSecret(req, dedicated || process.env.BLOG_API_TOKEN, {
    name: dedicated ? 'LEADS_API_TOKEN' : 'LEADS_API_TOKEN (or BLOG_API_TOKEN)',
    allowApiKeyHeader: true,
  })
}

/**
 * Cron workers. Vercel sends `Authorization: Bearer $CRON_SECRET` on scheduled
 * invocations when the variable is set. These used to check the header only
 * `if (secret)`, so a missing variable made them public: anyone could publish
 * scheduled posts early or trigger the follow-up email batch.
 */
export function requireCronSecret(req: Request): ApiAuthResult {
  return requireSecret(req, process.env.CRON_SECRET, { name: 'CRON_SECRET' })
}

/** Actor recorded in the audit log for API-driven writes. */
export const API_ACTOR = { id: null, email: 'blog-api' } as const
