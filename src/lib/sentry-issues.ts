import 'server-only'

/**
 * Read recent issues from Sentry for the admin Analytics page. Gated on
 * SENTRY_AUTH_TOKEN and best-effort (returns null on any problem) so the page
 * always renders. Org/project default to this app's; override with env if needed.
 *
 * Required env:
 *   SENTRY_AUTH_TOKEN  – a Sentry auth token with project:read / event:read
 *   SENTRY_ORG         – optional, defaults to "911electrics"
 *   SENTRY_PROJECT     – optional, defaults to "911electrics-web"
 *   SENTRY_HOST        – optional, defaults to https://us.sentry.io
 */

export type SentryIssue = {
  id: string
  title: string
  culprit: string | null
  count: number
  userCount: number
  level: string
  permalink: string | null
  lastSeen: string | null
}

export type SentryOverview = { totalEvents: number; issues: SentryIssue[] }

const ORG = process.env.SENTRY_ORG || '911electrics'
const PROJECT = process.env.SENTRY_PROJECT || '911electrics-web'
const HOST = (process.env.SENTRY_HOST || 'https://us.sentry.io').replace(/\/$/, '')

export function sentryConfigured(): boolean {
  return Boolean(process.env.SENTRY_AUTH_TOKEN)
}

export async function getSentryOverview(): Promise<SentryOverview | null> {
  const token = process.env.SENTRY_AUTH_TOKEN
  if (!token) return null

  const controller = new AbortController()
  const timeout = setTimeout(() => controller.abort(), 6000)
  try {
    const url =
      `${HOST}/api/0/projects/${ORG}/${PROJECT}/issues/` +
      `?query=${encodeURIComponent('is:unresolved')}&statsPeriod=14d&limit=8&sort=freq`
    const res = await fetch(url, {
      headers: { Authorization: `Bearer ${token}` },
      cache: 'no-store',
      signal: controller.signal,
    })
    if (!res.ok) return null
    const data = (await res.json()) as Array<{
      id: string
      title?: string
      culprit?: string
      count?: string | number
      userCount?: number
      level?: string
      permalink?: string
      lastSeen?: string
      metadata?: { value?: string }
    }>
    if (!Array.isArray(data)) return null

    const issues: SentryIssue[] = data.map((i) => ({
      id: String(i.id),
      title: String(i.title || i.metadata?.value || 'Error'),
      culprit: i.culprit ?? null,
      count: Number(i.count ?? 0),
      userCount: Number(i.userCount ?? 0),
      level: i.level || 'error',
      permalink: i.permalink ?? null,
      lastSeen: i.lastSeen ?? null,
    }))
    const totalEvents = issues.reduce((sum, i) => sum + i.count, 0)
    return { totalEvents, issues }
  } catch {
    return null
  } finally {
    clearTimeout(timeout)
  }
}
