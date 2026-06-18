import Link from 'next/link'

import {
  LEAD_STATUS_BADGE,
  LEAD_STATUS_LABEL,
  LEAD_STATUSES,
  timeAgo,
  type LeadStatus,
} from '@/studio/constants'
import { getStudioUser } from '@/studio/auth'
import { getLeads, getLeadStatusCounts } from '@/studio/leads'

export const dynamic = 'force-dynamic'

const FILTERS: Array<{ value: string; label: string }> = [
  { value: 'all', label: 'All' },
  ...LEAD_STATUSES.map((s) => ({ value: s, label: LEAD_STATUS_LABEL[s] })),
]

export default async function StudioLeadsPage({
  searchParams,
}: {
  searchParams: Promise<{ status?: string; mine?: string }>
}) {
  const { status, mine } = await searchParams
  const active = status && LEAD_STATUSES.includes(status as LeadStatus) ? (status as LeadStatus) : 'all'
  const onlyMine = mine === '1'
  const me = await getStudioUser()

  const [leads, counts] = await Promise.all([
    getLeads(active === 'all' ? undefined : active, onlyMine && me ? me.id : undefined),
    getLeadStatusCounts(),
  ])
  const totalCount = Object.values(counts).reduce((a, b) => a + b, 0)
  const countFor = (value: string) => (value === 'all' ? totalCount : counts[value] ?? 0)
  // Preserve the current "mine" state on the status chips…
  const withMine = (href: string) => (onlyMine ? `${href}${href.includes('?') ? '&' : '?'}mine=1` : href)
  // …and an explicit on-switch for the toggle button.
  const addMine = (href: string) => `${href}${href.includes('?') ? '&' : '?'}mine=1`
  const statusBase = active === 'all' ? '/studio/leads' : `/studio/leads?status=${active}`

  return (
    <div className="space-y-6">
      <header className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold tracking-tight">Quote Requests</h1>
          <p className="mt-1 text-sm text-slate-500">
            Every contact and quote form submission. Newest first.
          </p>
        </div>
        <div className="flex items-center gap-2">
          <Link
            className={`rounded-lg px-3 py-2 text-sm font-semibold ring-1 transition ${
              onlyMine
                ? 'bg-brand-600 text-white ring-brand-600'
                : 'text-slate-700 ring-slate-200 hover:bg-slate-50'
            }`}
            href={onlyMine ? statusBase : addMine(statusBase)}
          >
            {onlyMine ? '✓ My leads' : 'My leads'}
          </Link>
          <Link
            className="rounded-lg px-3 py-2 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-slate-50"
            href="/studio/pipeline"
          >
            Board view
          </Link>
          <a
            className="rounded-lg px-3 py-2 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-slate-50"
            href={active === 'all' ? '/studio/leads/export' : `/studio/leads/export?status=${active}`}
          >
            Export CSV
          </a>
        </div>
      </header>

      <div className="flex flex-wrap gap-2">
        {FILTERS.map((f) => (
          <Link
            className={`rounded-full px-3 py-1.5 text-sm font-medium transition ${
              active === f.value
                ? 'bg-brand-600 text-white'
                : 'bg-white text-slate-600 ring-1 ring-slate-200 hover:bg-slate-50'
            }`}
            href={withMine(f.value === 'all' ? '/studio/leads' : `/studio/leads?status=${f.value}`)}
            key={f.value}
          >
            {f.label}
            <span className={active === f.value ? 'text-white/80' : 'text-slate-400'}>
              {' '}
              {countFor(f.value)}
            </span>
          </Link>
        ))}
      </div>

      {leads.length === 0 ? (
        <div className="rounded-xl border border-slate-200 bg-white px-5 py-12 text-center text-sm text-slate-500">
          No {active === 'all' ? '' : LEAD_STATUS_LABEL[active].toLowerCase() + ' '}leads yet.
        </div>
      ) : (
        <div className="overflow-hidden rounded-xl border border-slate-200 bg-white">
          <ul className="divide-y divide-slate-100">
            {leads.map((lead) => (
              <li key={lead.id}>
                <Link className="flex items-center gap-3 px-5 py-3.5 hover:bg-slate-50" href={`/studio/leads/${lead.id}`}>
                  <div className="min-w-0 flex-1">
                    <div className="truncate text-sm font-medium text-slate-900">{lead.name || 'Unnamed'}</div>
                    <div className="truncate text-xs text-slate-500">
                      {lead.service ? `${lead.service} · ` : ''}
                      {lead.phone ? `${lead.phone} · ` : ''}
                      {timeAgo(lead.createdAt)}
                    </div>
                  </div>
                  {lead.assigneeName && (
                    <span className="hidden shrink-0 text-xs text-slate-400 sm:inline" title={`Owner: ${lead.assigneeName}`}>
                      {lead.assigneeName}
                    </span>
                  )}
                  <span className={`shrink-0 rounded-full px-2.5 py-0.5 text-xs font-semibold ${LEAD_STATUS_BADGE[lead.status] ?? LEAD_STATUS_BADGE.new}`}>
                    {LEAD_STATUS_LABEL[lead.status] ?? lead.status}
                  </span>
                </Link>
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  )
}
