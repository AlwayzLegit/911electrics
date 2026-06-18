import 'server-only'

/**
 * Optional website analytics from PostHog, shown on the dashboard. Gated on
 * env and entirely best-effort: any missing config or API hiccup returns null
 * so the dashboard still renders (with a "connect PostHog" prompt).
 *
 * Required env:
 *   POSTHOG_PROJECT_ID   – numeric project id
 *   POSTHOG_API_KEY      – a personal API key with "query:read" scope
 *   POSTHOG_HOST         – optional, defaults to https://us.posthog.com
 */

export type WebAnalytics = {
  pageviews: number
  visitors: number
  topPages: { path: string; views: number }[]
}

export function isPostHogConfigured(): boolean {
  return Boolean(process.env.POSTHOG_PROJECT_ID && process.env.POSTHOG_API_KEY)
}

async function hogql<T extends unknown[]>(q: string): Promise<T[] | null> {
  const projectId = process.env.POSTHOG_PROJECT_ID
  const apiKey = process.env.POSTHOG_API_KEY
  const host = (process.env.POSTHOG_HOST || 'https://us.posthog.com').replace(/\/$/, '')
  if (!projectId || !apiKey) return null

  const controller = new AbortController()
  const timeout = setTimeout(() => controller.abort(), 6000)
  try {
    const res = await fetch(`${host}/api/projects/${projectId}/query/`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ query: { kind: 'HogQLQuery', query: q } }),
      cache: 'no-store',
      signal: controller.signal,
    })
    if (!res.ok) return null
    const data = (await res.json()) as { results?: T[] }
    return Array.isArray(data.results) ? data.results : null
  } catch {
    return null
  } finally {
    clearTimeout(timeout)
  }
}

export async function getWebAnalytics(): Promise<WebAnalytics | null> {
  if (!isPostHogConfigured()) return null

  const [totals, pages] = await Promise.all([
    hogql<[number, number]>(
      `SELECT count() AS views, count(DISTINCT person_id) AS visitors
       FROM events
       WHERE event = '$pageview' AND timestamp > now() - INTERVAL 7 DAY`,
    ),
    hogql<[string, number]>(
      `SELECT properties.$pathname AS path, count() AS views
       FROM events
       WHERE event = '$pageview' AND timestamp > now() - INTERVAL 7 DAY
       GROUP BY path ORDER BY views DESC LIMIT 6`,
    ),
  ])

  if (!totals || !totals[0]) return null
  return {
    pageviews: Number(totals[0][0] ?? 0),
    visitors: Number(totals[0][1] ?? 0),
    topPages: (pages ?? [])
      .filter((r) => r[0])
      .map((r) => ({ path: String(r[0]), views: Number(r[1] ?? 0) })),
  }
}
