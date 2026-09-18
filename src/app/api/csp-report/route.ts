import { NextResponse } from 'next/server'

import { isReportWorthLogging, summarizeCspReport } from '@/lib/csp-report'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const MAX_BODY_BYTES = 8 * 1024

/**
 * Receives violation reports for the strict Report-Only policy (src/lib/csp.ts).
 *
 * Browsers POST here with no credentials, so this is public by necessity. It
 * therefore does as little as possible: caps the body, keeps a handful of
 * fields, drops the noise browser extensions generate, and writes one line to
 * the function log (readable in Vercel → Logs). It stores nothing, never echoes
 * the body, and always answers 204 so it cannot be used as an oracle.
 */
export async function POST(req: Request) {
  try {
    const declared = Number(req.headers.get('content-length') ?? 0)
    if (declared > MAX_BODY_BYTES) return new NextResponse(null, { status: 204 })

    const text = (await req.text()).slice(0, MAX_BODY_BYTES)
    for (const report of summarizeCspReport(text)) {
      if (isReportWorthLogging(report)) console.warn('[csp-report]', JSON.stringify(report))
    }
  } catch {
    // A malformed report is not worth a 500.
  }
  return new NextResponse(null, { status: 204 })
}
