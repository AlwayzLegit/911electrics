/**
 * Content-Security-Policy — one definition for both policies the site sends.
 *
 *   ENFORCED  (next.config.ts → `Content-Security-Policy`)
 *     What actually protects the site today. It allows inline scripts, because
 *     Next's bootstrap and the GA snippet are inline and this policy carries no
 *     per-request nonce.
 *
 *   STRICT    (src/proxy.ts → `Content-Security-Policy-Report-Only`)
 *     The policy we want to reach: scripts allowed by nonce + 'strict-dynamic'
 *     rather than by 'unsafe-inline'. It blocks nothing; the browser only
 *     reports what it *would* have blocked.
 *
 * The two used to be written out separately, with a comment saying they "must
 * mirror" each other — and they had drifted (frame-ancestors, font-src, the
 * Sentry and Tag Manager hosts). Promoting the strict policy would then have
 * enforced an allowlist that had never been the one in production. Now every
 * directive except `script-src` comes from the same object, so the only
 * difference between the policies is the one being evaluated.
 *
 * The strict policy also had no `report-uri`, so its violations went to each
 * visitor's browser console and nowhere else — the "promote once the reports are
 * clean" plan had no reports. It now reports to /api/csp-report.
 *
 * Pure and dependency-free: next.config.ts imports this by relative path.
 */

/** Third parties the site talks to. Add a vendor here and both policies get it. */
const SHARED: Record<string, string[]> = {
  'default-src': ["'self'"],
  // React renders inline style="" attributes; nonces don't cover those.
  'style-src': ["'self'", "'unsafe-inline'"],
  'img-src': ["'self'", 'data:', 'blob:', 'https:'],
  'font-src': ["'self'", 'data:'],
  // Sentry session replay spins up a worker from a blob URL.
  'worker-src': ["'self'", 'blob:'],
  // PostHog (analytics), Google Analytics / Tag Manager, Sentry (errors +
  // replay), Cloudflare Turnstile (quote-form captcha).
  'connect-src': [
    "'self'",
    'https://*.posthog.com',
    'https://*.i.posthog.com',
    'https://*.google-analytics.com',
    'https://*.analytics.google.com',
    'https://www.googletagmanager.com',
    'https://*.ingest.sentry.io',
    'https://*.ingest.us.sentry.io',
    'https://challenges.cloudflare.com',
  ],
  // Google Maps embed (contact section) + the Turnstile challenge frame.
  'frame-src': ["'self'", 'https://www.google.com', 'https://challenges.cloudflare.com'],
  'base-uri': ["'self'"],
  'object-src': ["'none'"],
  'form-action': ["'self'"],
  'frame-ancestors': ["'self'"],
}

/** Script hosts the enforced policy allows by name (it has no nonce). */
const ENFORCED_SCRIPT_SRC = [
  "'self'",
  "'unsafe-inline'",
  'https://*.posthog.com',
  'https://*.i.posthog.com',
  'https://www.googletagmanager.com',
  'https://challenges.cloudflare.com',
]

/** Where the strict policy sends violation reports. Same-origin, see the route. */
export const CSP_REPORT_PATH = '/api/csp-report'

/** Directive order of the enforced header — kept stable so it never changes by accident. */
const ORDER = [
  'default-src',
  'script-src',
  'style-src',
  'img-src',
  'font-src',
  'worker-src',
  'connect-src',
  'frame-src',
  'base-uri',
  'object-src',
  'form-action',
  'frame-ancestors',
]

function serialize(directives: Record<string, string[]>, extra: string[] = []): string {
  return [...ORDER.filter((k) => directives[k]).map((k) => `${k} ${directives[k].join(' ')}`), ...extra].join('; ')
}

/** The policy the browser enforces. */
export function enforcedCsp(): string {
  return serialize({ ...SHARED, 'script-src': ENFORCED_SCRIPT_SRC })
}

/**
 * The nonce-based policy, sent Report-Only. 'strict-dynamic' lets the nonce'd
 * Next scripts load their own chunks; `https:` and 'unsafe-inline' are ignored
 * by browsers that understand 'strict-dynamic' and are the documented fallback
 * for those that do not.
 */
export function strictCsp(nonce: string): string {
  return serialize(
    { ...SHARED, 'script-src': ["'self'", `'nonce-${nonce}'`, "'strict-dynamic'", 'https:', "'unsafe-inline'"] },
    [`report-uri ${CSP_REPORT_PATH}`],
  )
}
