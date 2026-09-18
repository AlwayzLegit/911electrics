import { describe, expect, it } from 'vitest'

import { CSP_REPORT_PATH, enforcedCsp, strictCsp } from '@/lib/csp'

/**
 * The enforced header exactly as production sent it on 2026-09-18, before the
 * two policies were unified. The unification must not change what the browser
 * enforces — this header guards the quote form and its Turnstile challenge —
 * so any edit to the enforced policy has to be made here too, deliberately.
 */
const PRODUCTION_ENFORCED =
  "default-src 'self'; script-src 'self' 'unsafe-inline' https://*.posthog.com https://*.i.posthog.com https://www.googletagmanager.com https://challenges.cloudflare.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: blob: https:; font-src 'self' data:; worker-src 'self' blob:; connect-src 'self' https://*.posthog.com https://*.i.posthog.com https://*.google-analytics.com https://*.analytics.google.com https://www.googletagmanager.com https://*.ingest.sentry.io https://*.ingest.us.sentry.io https://challenges.cloudflare.com; frame-src 'self' https://www.google.com https://challenges.cloudflare.com; base-uri 'self'; object-src 'none'; form-action 'self'; frame-ancestors 'self'"

const parse = (csp: string): Record<string, string> =>
  Object.fromEntries(
    csp.split('; ').map((d) => {
      const at = d.indexOf(' ')
      return [d.slice(0, at), d.slice(at + 1)]
    }),
  )

describe('enforced CSP', () => {
  it('is byte-identical to the header production was already sending', () => {
    expect(enforcedCsp()).toBe(PRODUCTION_ENFORCED)
  })
})

describe('strict (report-only) CSP', () => {
  const nonce = 'dGVzdC1ub25jZQ=='
  const strict = parse(strictCsp(nonce))
  const enforced = parse(enforcedCsp())

  it('differs from the enforced policy only in script-src and the report target', () => {
    const { 'script-src': _s, 'report-uri': _r, ...strictRest } = strict
    const { 'script-src': _e, ...enforcedRest } = enforced
    expect(strictRest).toEqual(enforcedRest)
  })

  it('allows scripts by nonce and strict-dynamic, carrying the request nonce', () => {
    expect(strict['script-src']).toContain(`'nonce-${nonce}'`)
    expect(strict['script-src']).toContain("'strict-dynamic'")
    expect(strictCsp('another')).toContain("'nonce-another'")
  })

  it('reports somewhere — a report-only policy with no report target tells nobody anything', () => {
    expect(strict['report-uri']).toBe(CSP_REPORT_PATH)
    expect(CSP_REPORT_PATH.startsWith('/api/')).toBe(true) // the proxy matcher skips /api, so no loop
  })

  it('never reports from the enforced header (that would double every report)', () => {
    expect(enforced['report-uri']).toBeUndefined()
  })
})
