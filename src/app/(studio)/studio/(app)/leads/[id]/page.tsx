import Link from 'next/link'
import { notFound } from 'next/navigation'

import { addLeadNote, updateLeadDetails } from '@/app/actions/studio-leads'
import { timeAgo } from '@/studio/constants'
import { getLeadActivity, getLeadById } from '@/studio/leads'

import { LeadStatusSelect } from './LeadStatusSelect'

export const dynamic = 'force-dynamic'

function toLocalInput(iso: string | null): string {
  if (!iso) return ''
  const d = new Date(iso)
  if (Number.isNaN(d.getTime())) return ''
  const pad = (n: number) => String(n).padStart(2, '0')
  return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}T${pad(d.getHours())}:${pad(d.getMinutes())}`
}

const Row = ({ label, children }: { label: string; children: React.ReactNode }) => {
  if (children === null || children === undefined || children === '') return null
  return (
    <div className="grid grid-cols-[7rem_1fr] gap-3 px-5 py-3 text-sm">
      <dt className="font-medium text-slate-500">{label}</dt>
      <dd className="min-w-0 break-words text-slate-900">{children}</dd>
    </div>
  )
}

export default async function StudioLeadDetail({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const leadId = Number(id)
  if (Number.isNaN(leadId)) notFound()

  const lead = await getLeadById(leadId)
  if (!lead) notFound()
  const activity = await getLeadActivity(leadId)

  const utm = lead.utm
  const hasUtm = Object.values(utm).some(Boolean)
  const inputCls =
    'w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm focus:border-brand-500 focus:ring-2 focus:ring-brand-500/30 focus:outline-none'

  return (
    <div className="space-y-6">
      <Link className="inline-flex items-center gap-1 text-sm font-medium text-brand-600 hover:text-brand-700" href="/studio/leads">
        <svg fill="none" height="16" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24" width="16">
          <path d="M15 18l-6-6 6-6" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
        Back to all requests
      </Link>

      <header className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold tracking-tight">{lead.name || 'Unnamed lead'}</h1>
          <p className="mt-1 text-sm text-slate-500">Received {timeAgo(lead.createdAt)}</p>
        </div>
        <LeadStatusSelect current={lead.status} id={leadId} />
      </header>

      <div className="flex flex-wrap gap-3">
        {lead.phone && (
          <a
            className="inline-flex items-center gap-2 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-700"
            href={`tel:${lead.phone}`}
          >
            Call {lead.phone}
          </a>
        )}
        {lead.email && (
          <a
            className="inline-flex items-center gap-2 rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-50"
            href={`mailto:${lead.email}`}
          >
            Email
          </a>
        )}
      </div>

      <dl className="divide-y divide-slate-100 overflow-hidden rounded-xl border border-slate-200 bg-white">
        <Row label="Name">{lead.name}</Row>
        <Row label="Phone">{lead.phone ? <a className="text-brand-600 hover:underline" href={`tel:${lead.phone}`}>{lead.phone}</a> : null}</Row>
        <Row label="Email">{lead.email ? <a className="text-brand-600 hover:underline" href={`mailto:${lead.email}`}>{lead.email}</a> : null}</Row>
        <Row label="Service">{lead.service}</Row>
        <Row label="Address">{lead.address}</Row>
        <Row label="Message">{lead.message}</Row>
        <Row label="Page">{lead.sourcePath}</Row>
        <Row label="Form">{lead.formLocation}</Row>
        <Row label="Email sent">
          {lead.emailSent ? (
            'Yes'
          ) : (
            <span className="text-red-600">
              No{lead.emailError ? ` — ${lead.emailError}` : ''}
            </span>
          )}
        </Row>
      </dl>

      {hasUtm && (
        <dl className="divide-y divide-slate-100 overflow-hidden rounded-xl border border-slate-200 bg-white">
          <div className="border-b border-slate-100 bg-slate-50 px-5 py-2 text-xs font-semibold uppercase tracking-wide text-slate-500">
            Campaign tracking
          </div>
          <Row label="Source">{utm.source}</Row>
          <Row label="Medium">{utm.medium}</Row>
          <Row label="Campaign">{utm.campaign}</Row>
          <Row label="Term">{utm.term}</Row>
          <Row label="Content">{utm.content}</Row>
        </dl>
      )}

      <form
        action={updateLeadDetails.bind(null, leadId)}
        className="rounded-xl border border-slate-200 bg-white p-5"
      >
        <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-slate-500">Deal</h2>
        <div className="grid gap-4 sm:grid-cols-2">
          <div>
            <label className="mb-1 block text-xs font-medium text-slate-500" htmlFor="estimatedValue">
              Estimated value ($)
            </label>
            <input className={inputCls} defaultValue={lead.estimatedValue ?? ''} id="estimatedValue" name="estimatedValue" type="number" />
          </div>
          <div>
            <label className="mb-1 block text-xs font-medium text-slate-500" htmlFor="nextFollowUpAt">
              Next follow-up
            </label>
            <input className={inputCls} defaultValue={toLocalInput(lead.nextFollowUpAt)} id="nextFollowUpAt" name="nextFollowUpAt" type="datetime-local" />
          </div>
        </div>
        <button className="mt-3 rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white transition hover:bg-brand-700" type="submit">
          Save deal
        </button>
      </form>

      <section className="rounded-xl border border-slate-200 bg-white p-5">
        <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-slate-500">Activity</h2>
        <form action={addLeadNote.bind(null, leadId)} className="flex gap-2">
          <input className={inputCls} name="note" placeholder="Add a note (call summary, next step…)" />
          <button className="shrink-0 rounded-lg bg-slate-800 px-4 py-2 text-sm font-semibold text-white transition hover:bg-slate-900" type="submit">
            Add
          </button>
        </form>
        {activity.length === 0 ? (
          <p className="mt-4 text-sm text-slate-400">No activity yet.</p>
        ) : (
          <ul className="mt-4 space-y-3">
            {activity.map((a) => (
              <li className="flex gap-3 text-sm" key={a.id}>
                <span
                  className={`mt-1.5 size-2 shrink-0 rounded-full ${
                    a.type === 'note' ? 'bg-brand-500' : 'bg-slate-300'
                  }`}
                />
                <div className="min-w-0">
                  <p className="break-words text-slate-800">{a.body}</p>
                  <p className="text-xs text-slate-400">{timeAgo(a.createdAt)}</p>
                </div>
              </li>
            ))}
          </ul>
        )}
      </section>
    </div>
  )
}
