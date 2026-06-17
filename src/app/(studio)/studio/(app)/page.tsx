import Link from 'next/link'

import { getStudioPayload } from '@/studio/data'
import { LEAD_STATUS_BADGE, LEAD_STATUS_LABEL, timeAgo, type LeadStatus } from '@/studio/constants'

export const dynamic = 'force-dynamic'

const StatCard = ({
  label,
  value,
  href,
  accent,
}: {
  label: string
  value: string | number
  href: string
  accent?: boolean
}) => (
  <Link
    className={`flex flex-col gap-1 rounded-xl border p-4 transition hover:-translate-y-0.5 hover:shadow-sm ${
      accent ? 'border-brand-300 bg-brand-50' : 'border-slate-200 bg-white'
    }`}
    href={href}
  >
    <span className={`text-2xl font-bold leading-none ${accent ? 'text-brand-700' : 'text-slate-900'}`}>
      {value}
    </span>
    <span className="text-xs font-medium text-slate-500">{label}</span>
  </Link>
)

export default async function StudioDashboard() {
  const payload = await getStudioPayload()
  const weekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString()

  const [newLeads, weekLeads, totalLeads, posts, services, recent] = await Promise.all([
    payload.count({ collection: 'leads', where: { status: { equals: 'new' } } }),
    payload.count({ collection: 'leads', where: { createdAt: { greater_than: weekAgo } } }),
    payload.count({ collection: 'leads' }),
    payload.count({ collection: 'posts' }),
    payload.count({ collection: 'services' }),
    payload.find({ collection: 'leads', limit: 6, sort: '-createdAt', depth: 0 }),
  ])

  const hour = new Date().getHours()
  const greeting = hour < 12 ? 'Good morning' : hour < 18 ? 'Good afternoon' : 'Good evening'

  return (
    <div className="space-y-8">
      <header>
        <h1 className="text-2xl font-semibold tracking-tight">{greeting}</h1>
        <p className="mt-1 text-sm text-slate-500">
          Here&apos;s what&apos;s happening with 911 Construction &amp; Electric.
        </p>
      </header>

      {newLeads.totalDocs > 0 && (
        <Link
          className="block rounded-xl border-l-4 border-brand-500 bg-brand-50 px-4 py-3 text-sm hover:bg-brand-100"
          href="/studio/leads?status=new"
        >
          <strong className="text-brand-700">
            {newLeads.totalDocs} new quote {newLeads.totalDocs === 1 ? 'request' : 'requests'}
          </strong>{' '}
          waiting for a callback →
        </Link>
      )}

      <section className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-5">
        <StatCard accent={newLeads.totalDocs > 0} href="/studio/leads?status=new" label="New requests" value={newLeads.totalDocs} />
        <StatCard href="/studio/leads" label="Leads this week" value={weekLeads.totalDocs} />
        <StatCard href="/studio/leads" label="Total leads" value={totalLeads.totalDocs} />
        <StatCard href="/studio/services" label="Services" value={services.totalDocs} />
        <StatCard href="/studio/posts" label="Blog posts" value={posts.totalDocs} />
      </section>

      <section className="rounded-xl border border-slate-200 bg-white">
        <div className="flex items-center justify-between border-b border-slate-100 px-5 py-3.5">
          <h2 className="font-semibold">Recent quote requests</h2>
          <Link className="text-sm font-medium text-brand-600 hover:text-brand-700" href="/studio/leads">
            View all
          </Link>
        </div>
        {recent.docs.length === 0 ? (
          <p className="px-5 py-8 text-center text-sm text-slate-500">
            No leads yet. New form submissions will appear here.
          </p>
        ) : (
          <ul className="divide-y divide-slate-100">
            {recent.docs.map((lead) => {
              const status = (lead.status as LeadStatus) || 'new'
              return (
                <li key={lead.id}>
                  <Link className="flex items-center gap-3 px-5 py-3 hover:bg-slate-50" href={`/studio/leads/${lead.id}`}>
                    <div className="min-w-0 flex-1">
                      <div className="truncate text-sm font-medium text-slate-900">{lead.name || 'Unnamed'}</div>
                      <div className="truncate text-xs text-slate-500">
                        {lead.service ? `${lead.service} · ` : ''}
                        {timeAgo(lead.createdAt)}
                      </div>
                    </div>
                    <span className={`rounded-full px-2.5 py-0.5 text-xs font-semibold ${LEAD_STATUS_BADGE[status] ?? LEAD_STATUS_BADGE.new}`}>
                      {LEAD_STATUS_LABEL[status] ?? status}
                    </span>
                    {lead.phone && (
                      <span className="hidden text-sm font-medium text-brand-600 sm:inline">{lead.phone}</span>
                    )}
                  </Link>
                </li>
              )
            })}
          </ul>
        )}
      </section>
    </div>
  )
}
