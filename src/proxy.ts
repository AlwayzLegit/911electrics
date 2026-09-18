import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

import { strictCsp } from '@/lib/csp'
import { getCanonicalHost } from '@/utilities/canonicalHost'

/**
 * Sends the strict, nonce-based Content-Security-Policy in *Report-Only* mode,
 * alongside the enforced policy from next.config.ts. Report-Only blocks
 * nothing, so this cannot break the live site; violations are posted to
 * /api/csp-report, which is how we find out whether the strict policy is safe
 * to enforce. Both policies are defined in src/lib/csp.ts.
 *
 * Noncing: the *request* header is set to `Content-Security-Policy` so Next.js
 * picks up the nonce and applies it to every framework script it emits. The
 * *response* header is what governs the browser.
 *
 * To enforce the strict policy, set ENFORCE = true AND remove the enforced
 * header from next.config.ts — a browser applies every CSP it receives, so
 * sending both would enforce the intersection, not the strict one.
 */
const ENFORCE = false

const CANONICAL_HOST = getCanonicalHost()

export function proxy(request: NextRequest) {
  const nonce = btoa(crypto.randomUUID())
  const csp = strictCsp(nonce)

  // Pass the nonce + CSP to Next on the request so it nonces its own scripts.
  const requestHeaders = new Headers(request.headers)
  requestHeaders.set('x-nonce', nonce)
  requestHeaders.set('Content-Security-Policy', csp)

  const response = NextResponse.next({ request: { headers: requestHeaders } })

  // The response header governs the browser. Report-Only until ENFORCE flips.
  response.headers.set(
    ENFORCE ? 'Content-Security-Policy' : 'Content-Security-Policy-Report-Only',
    csp,
  )

  // Block indexing of any non-canonical host (e.g. the *.vercel.app domain).
  if (CANONICAL_HOST) {
    const host = request.headers.get('host')?.replace(/:\d+$/, '') || ''
    if (host && host !== CANONICAL_HOST) {
      response.headers.set('X-Robots-Tag', 'noindex')
    }
  }

  return response
}

export const config = {
  // Run on page routes only — skip API routes (incl. /api/csp-report, so a
  // report can never trigger another), Next internals and static asset files.
  // The `admin` entry is a leftover from the removed Payload panel; nothing is
  // served there now.
  matcher: [
    {
      source:
        '/((?!admin|api|_next/static|_next/image|favicon.ico|favicon-32x32.png|icon-192.png|apple-touch-icon.png|site.webmanifest|sitemap.xml|robots.txt).*)',
      missing: [
        { type: 'header', key: 'next-router-prefetch' },
        { type: 'header', key: 'purpose', value: 'prefetch' },
      ],
    },
  ],
}
