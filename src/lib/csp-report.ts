/**
 * Parsing and filtering for CSP violation reports. Pure, so it is unit-tested;
 * the route that calls it is src/app/api/csp-report/route.ts.
 *
 * Browsers send one of two shapes: the older `application/csp-report`
 * (`{ "csp-report": { "violated-directive": … } }`) and the Reporting API's
 * `application/reports+json` (an array of `{ type, body: { effectiveDirective: … } }`).
 */

export type CspReportSummary = {
  directive: string
  blocked: string
  page: string
  source: string
  line: number | null
}

const clip = (v: unknown, max = 300): string => (typeof v === 'string' ? v.slice(0, max) : '')

/** Keep the path, drop the query string — it can carry UTM tags or form values. */
function withoutQuery(url: string): string {
  const at = url.search(/[?#]/)
  return at === -1 ? url : url.slice(0, at)
}

function fromLegacy(r: Record<string, unknown>): CspReportSummary {
  return {
    directive: clip(r['effective-directive'] ?? r['violated-directive'], 80),
    blocked: withoutQuery(clip(r['blocked-uri'])),
    page: withoutQuery(clip(r['document-uri'])),
    source: withoutQuery(clip(r['source-file'])),
    line: typeof r['line-number'] === 'number' ? r['line-number'] : null,
  }
}

function fromReportingApi(r: Record<string, unknown>): CspReportSummary {
  return {
    directive: clip(r.effectiveDirective ?? r.violatedDirective, 80),
    blocked: withoutQuery(clip(r.blockedURL)),
    page: withoutQuery(clip(r.documentURL)),
    source: withoutQuery(clip(r.sourceFile)),
    line: typeof r.lineNumber === 'number' ? r.lineNumber : null,
  }
}

const isObject = (v: unknown): v is Record<string, unknown> => !!v && typeof v === 'object' && !Array.isArray(v)

/** Normalise a raw report body to zero or more summaries. Never throws. */
export function summarizeCspReport(raw: string): CspReportSummary[] {
  let parsed: unknown
  try {
    parsed = JSON.parse(raw)
  } catch {
    return []
  }
  if (Array.isArray(parsed)) {
    return parsed
      .filter((r): r is Record<string, unknown> => isObject(r) && r.type === 'csp-violation' && isObject(r.body))
      .slice(0, 20)
      .map((r) => fromReportingApi(r.body as Record<string, unknown>))
  }
  if (isObject(parsed) && isObject(parsed['csp-report'])) return [fromLegacy(parsed['csp-report'])]
  return []
}

/** Schemes that mean "a browser extension did this", not the site. */
const EXTENSION = /^(chrome|moz|safari|safari-web|ms-browser)-extension:/i

/**
 * False for reports that say nothing about the site: injected by an extension,
 * or too empty to act on. These are the large majority of real-world CSP
 * reports and would bury the ones that matter.
 */
export function isReportWorthLogging(r: CspReportSummary): boolean {
  if (!r.directive) return false
  if (EXTENSION.test(r.blocked) || EXTENSION.test(r.source)) return false
  // Extensions and "translate this page" features inject from these.
  if (/^(about|blob|data):?$/i.test(r.blocked) && !r.source) return false
  return true
}
