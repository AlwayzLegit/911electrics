import { describe, expect, it } from 'vitest'

import { isReportWorthLogging, summarizeCspReport } from '@/lib/csp-report'

const legacy = (fields: Record<string, unknown>) => JSON.stringify({ 'csp-report': fields })

describe('summarizeCspReport', () => {
  it('reads the legacy application/csp-report shape', () => {
    const [r] = summarizeCspReport(
      legacy({
        'document-uri': 'https://911electrics.com/contact/?utm_source=google&name=Jane',
        'violated-directive': 'script-src-elem',
        'effective-directive': 'script-src-elem',
        'blocked-uri': 'https://cdn.example.com/widget.js?id=42',
        'source-file': 'https://911electrics.com/_next/static/chunks/app.js',
        'line-number': 12,
      }),
    )
    expect(r).toEqual({
      directive: 'script-src-elem',
      blocked: 'https://cdn.example.com/widget.js',
      page: 'https://911electrics.com/contact/',
      source: 'https://911electrics.com/_next/static/chunks/app.js',
      line: 12,
    })
  })

  it('reads the Reporting API shape and ignores non-CSP report types', () => {
    const out = summarizeCspReport(
      JSON.stringify([
        { type: 'deprecation', body: { id: 'x' } },
        {
          type: 'csp-violation',
          body: {
            effectiveDirective: 'connect-src',
            blockedURL: 'https://api.vendor.io/v1?key=abc',
            documentURL: 'https://911electrics.com/',
            sourceFile: '',
            lineNumber: 3,
          },
        },
      ]),
    )
    expect(out).toEqual([
      { directive: 'connect-src', blocked: 'https://api.vendor.io/v1', page: 'https://911electrics.com/', source: '', line: 3 },
    ])
  })

  it('strips query strings so UTM tags and form values never reach the log', () => {
    const [r] = summarizeCspReport(legacy({ 'violated-directive': 'img-src', 'document-uri': 'https://911electrics.com/?email=a@b.c#frag' }))
    expect(r.page).toBe('https://911electrics.com/')
  })

  it('clips oversized fields and caps the number of reports', () => {
    const [r] = summarizeCspReport(legacy({ 'violated-directive': 'x'.repeat(500), 'blocked-uri': 'https://a.io/' + 'y'.repeat(900) }))
    expect(r.directive.length).toBe(80)
    expect(r.blocked.length).toBe(300)
    const many = JSON.stringify(new Array(100).fill({ type: 'csp-violation', body: { effectiveDirective: 'img-src' } }))
    expect(summarizeCspReport(many)).toHaveLength(20)
  })

  it('returns nothing for garbage instead of throwing', () => {
    for (const raw of ['', 'not json', '{}', '[]', 'null', '42', '{"csp-report":"nope"}', '[1,2,3]']) {
      expect(summarizeCspReport(raw)).toEqual([])
    }
  })
})

describe('isReportWorthLogging', () => {
  const base = { directive: 'script-src-elem', blocked: 'https://cdn.example.com/x.js', page: 'https://911electrics.com/', source: '', line: null }

  it('keeps a real violation', () => {
    expect(isReportWorthLogging(base)).toBe(true)
    expect(isReportWorthLogging({ ...base, blocked: 'inline' })).toBe(true)
    expect(isReportWorthLogging({ ...base, blocked: 'eval' })).toBe(true)
  })

  it('drops browser-extension noise', () => {
    for (const blocked of ['chrome-extension://abc/inject.js', 'moz-extension://abc/x.js', 'safari-web-extension://abc/x.js']) {
      expect(isReportWorthLogging({ ...base, blocked })).toBe(false)
    }
    expect(isReportWorthLogging({ ...base, source: 'chrome-extension://abc/content.js' })).toBe(false)
  })

  it('drops reports too empty to act on', () => {
    expect(isReportWorthLogging({ ...base, directive: '' })).toBe(false)
    expect(isReportWorthLogging({ ...base, blocked: 'data', source: '' })).toBe(false)
  })
})
