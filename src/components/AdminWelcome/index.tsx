import type { ServerProps } from 'payload'

import React from 'react'

import './index.scss'

/**
 * Owner dashboard shown at the top of /admin. Surfaces the things a busy
 * contractor actually cares about — new quote requests first — with live
 * counts pulled from the database, plus one-click shortcuts.
 *
 * Rendered as a React Server Component, so it can query Payload directly.
 */

type LeadStatus = 'new' | 'contacted' | 'quoted' | 'won' | 'lost' | 'spam'

const STATUS_LABEL: Record<LeadStatus, string> = {
  new: 'New',
  contacted: 'Contacted',
  quoted: 'Quoted',
  won: 'Won',
  lost: 'Lost',
  spam: 'Spam',
}

/** Small inline icon set for the quick-action cards (no external deps). */
const ICONS = {
  inbox: 'M3 13h4l1.5 3h7L17 13h4M5 6h14l1 7v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-5l1-7Z',
  home: 'M4 11.5 12 4l8 7.5M6 10v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1v-9',
  bolt: 'M13 3 5 13h5l-1 8 8-10h-5l1-8Z',
  pencil: 'M4 20h4l10-10-4-4L4 16v4ZM14 6l4 4',
  star: 'M12 4l2.4 4.9 5.4.8-3.9 3.8.9 5.4-4.8-2.5-4.8 2.5.9-5.4L4.2 9.7l5.4-.8L12 4Z',
  gear: 'M12 9a3 3 0 1 0 0 6 3 3 0 0 0 0-6ZM19 12a7 7 0 0 0-.1-1l2-1.6-2-3.4-2.4 1a7 7 0 0 0-1.7-1L14.5 2h-5l-.3 2.6a7 7 0 0 0-1.7 1l-2.4-1-2 3.4 2 1.6a7 7 0 0 0 0 2l-2 1.6 2 3.4 2.4-1a7 7 0 0 0 1.7 1l.3 2.6h5l.3-2.6a7 7 0 0 0 1.7-1l2.4 1 2-3.4-2-1.6a7 7 0 0 0 .1-1Z',
} as const

const Icon = ({ d }: { d: string }) => (
  <svg aria-hidden fill="none" height="18" stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="1.7" viewBox="0 0 24 24" width="18">
    <path d={d} />
  </svg>
)

const greeting = () => {
  const h = new Date().getHours()
  if (h < 12) return 'Good morning'
  if (h < 18) return 'Good afternoon'
  return 'Good evening'
}

const timeAgo = (input?: string | null): string => {
  if (!input) return ''
  const then = new Date(input).getTime()
  if (Number.isNaN(then)) return ''
  const s = Math.max(0, (Date.now() - then) / 1000)
  if (s < 60) return 'just now'
  const m = s / 60
  if (m < 60) return `${Math.floor(m)}m ago`
  const hrs = m / 60
  if (hrs < 24) return `${Math.floor(hrs)}h ago`
  const d = hrs / 24
  if (d < 7) return `${Math.floor(d)}d ago`
  return new Date(input).toLocaleDateString()
}

export default async function AdminWelcome({ payload, user }: ServerProps) {
  const weekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString()

  let newLeads = 0
  let weekLeads = 0
  let totalLeads = 0
  let postCount = 0
  let serviceCount = 0
  let rating: { value?: number | null; count?: number | null } = {}
  let recent: Array<{
    id: number | string
    name?: string | null
    phone?: string | null
    email?: string | null
    service?: string | null
    status?: string | null
    createdAt?: string | null
  }> = []

  try {
    const [newL, weekL, totalL, posts, services, settings, recentLeads] = await Promise.all([
      payload.count({ collection: 'leads', where: { status: { equals: 'new' } } }),
      payload.count({ collection: 'leads', where: { createdAt: { greater_than: weekAgo } } }),
      payload.count({ collection: 'leads' }),
      payload.count({ collection: 'posts' }),
      payload.count({ collection: 'services' }),
      payload.findGlobal({ slug: 'siteSettings', depth: 0 }),
      payload.find({ collection: 'leads', limit: 6, sort: '-createdAt', depth: 0 }),
    ])
    newLeads = newL.totalDocs
    weekLeads = weekL.totalDocs
    totalLeads = totalL.totalDocs
    postCount = posts.totalDocs
    serviceCount = services.totalDocs
    rating = (settings as { aggregateRating?: typeof rating })?.aggregateRating ?? {}
    recent = recentLeads.docs as typeof recent
  } catch (err) {
    payload.logger?.error?.({ err }, 'AdminWelcome dashboard query failed')
  }

  const name = (user as { name?: string } | undefined)?.name?.split(' ')[0]
  const stats: Array<{ label: string; value: string; href: string; accent?: boolean }> = [
    { label: 'New quote requests', value: String(newLeads), href: '/admin/collections/leads?where[or][0][and][0][status][equals]=new', accent: newLeads > 0 },
    { label: 'Leads this week', value: String(weekLeads), href: '/admin/collections/leads' },
    { label: 'Total leads', value: String(totalLeads), href: '/admin/collections/leads' },
    {
      label: 'Google rating',
      value: rating?.value ? `${rating.value}★ (${rating.count ?? 0})` : '—',
      href: '/admin/collections/testimonials',
    },
    { label: 'Services', value: String(serviceCount), href: '/admin/collections/services' },
    { label: 'Blog posts', value: String(postCount), href: '/admin/collections/posts' },
  ]

  const actions: Array<{ href: string; title: string; sub: string; icon: keyof typeof ICONS }> = [
    { href: '/admin/collections/leads', title: 'Quote requests', sub: 'Your leads inbox', icon: 'inbox' },
    { href: '/admin/globals/homepage', title: 'Edit homepage', sub: 'Hero, services, about, FAQ', icon: 'home' },
    { href: '/admin/collections/services', title: 'Services', sub: 'Descriptions & photos', icon: 'bolt' },
    { href: '/admin/collections/posts/create', title: 'Write a blog post', sub: 'Publish in minutes', icon: 'pencil' },
    { href: '/admin/collections/testimonials', title: 'Reviews', sub: 'Sync & feature', icon: 'star' },
    { href: '/admin/globals/siteSettings', title: 'Business info', sub: 'Hours, phone, socials', icon: 'gear' },
  ]

  const steps = [
    {
      title: 'Respond to new leads fast',
      body: 'Every quote request lands in your inbox. Call them back, then mark them Contacted → Quoted → Won.',
      href: '/admin/collections/leads',
      cta: 'Open inbox',
    },
    {
      title: 'Keep your site content fresh',
      body: 'Edit your homepage, services and service-area pages anytime. Changes go live the moment you save.',
      href: '/admin/globals/homepage',
      cta: 'Edit homepage',
    },
    {
      title: 'Publish a blog post',
      body: 'Write helpful articles to bring in more local search traffic. Hit Preview to check it, then Publish.',
      href: '/admin/collections/posts/create',
      cta: 'New post',
    },
  ]

  return (
    <div className="owner-dash">
      <div className="owner-dash__head">
        <svg aria-hidden fill="none" height="40" viewBox="0 0 100 100" width="40" xmlns="http://www.w3.org/2000/svg">
          <rect fill="#d01d24" height="100" rx="22" width="100" />
          <path d="M56 12 L26 56 L46 56 L40 88 L74 42 L52 42 Z" fill="#ffffff" />
        </svg>
        <div>
          <h2>
            {greeting()}
            {name ? `, ${name}` : ''}
          </h2>
          <p>911 Construction &amp; Electric — changes go live within seconds of publishing.</p>
        </div>
        <a className="owner-dash__view-site" href="/" rel="noopener noreferrer" target="_blank">
          View live site ↗
        </a>
      </div>

      {newLeads > 0 && (
        <a
          className="owner-dash__alert"
          href="/admin/collections/leads?where[or][0][and][0][status][equals]=new"
        >
          <strong>
            {newLeads} new quote {newLeads === 1 ? 'request' : 'requests'}
          </strong>{' '}
          waiting for a callback — review them now →
        </a>
      )}

      <div className="owner-dash__stats">
        {stats.map((s) => (
          <a className={`owner-dash__stat${s.accent ? ' is-accent' : ''}`} href={s.href} key={s.label}>
            <span className="owner-dash__stat-value">{s.value}</span>
            <span className="owner-dash__stat-label">{s.label}</span>
          </a>
        ))}
      </div>

      <div className="owner-dash__cols">
        <section className="owner-dash__panel">
          <div className="owner-dash__panel-head">
            <h3>Recent quote requests</h3>
            <a href="/admin/collections/leads">View all</a>
          </div>
          {recent.length === 0 ? (
            <p className="owner-dash__empty">No leads yet. New form submissions will appear here.</p>
          ) : (
            <ul className="owner-dash__leads">
              {recent.map((lead) => {
                const status = (lead.status as LeadStatus) || 'new'
                return (
                  <li className="owner-dash__lead" key={lead.id}>
                    <a className="owner-dash__lead-main" href={`/admin/collections/leads/${lead.id}`}>
                      <span className="owner-dash__lead-name">{lead.name || 'Unnamed'}</span>
                      <span className="owner-dash__lead-meta">
                        {lead.service ? `${lead.service} · ` : ''}
                        {timeAgo(lead.createdAt)}
                      </span>
                    </a>
                    <span className={`owner-dash__badge is-${status}`}>{STATUS_LABEL[status] ?? status}</span>
                    {lead.phone ? (
                      <a className="owner-dash__lead-call" href={`tel:${lead.phone}`}>
                        {lead.phone}
                      </a>
                    ) : null}
                  </li>
                )
              })}
            </ul>
          )}
        </section>

        <section className="owner-dash__panel">
          <div className="owner-dash__panel-head">
            <h3>Quick actions</h3>
          </div>
          <div className="owner-dash__actions">
            {actions.map((a) => (
              <a className="owner-dash__action" href={a.href} key={a.href}>
                <span className="owner-dash__action-icon">
                  <Icon d={ICONS[a.icon]} />
                </span>
                <span className="owner-dash__action-text">
                  <span className="owner-dash__action-title">{a.title}</span>
                  <span className="owner-dash__action-sub">{a.sub}</span>
                </span>
              </a>
            ))}
          </div>
        </section>
      </div>

      <section className="owner-dash__guide">
        <div className="owner-dash__panel-head">
          <h3>Getting started</h3>
          <span className="owner-dash__guide-hint">New here? Start with these.</span>
        </div>
        <ol className="owner-dash__steps">
          {steps.map((step, i) => (
            <li className="owner-dash__step" key={step.href}>
              <span className="owner-dash__step-num">{i + 1}</span>
              <div className="owner-dash__step-body">
                <strong>{step.title}</strong>
                <p>{step.body}</p>
                <a href={step.href}>{step.cta} →</a>
              </div>
            </li>
          ))}
        </ol>
        <p className="owner-dash__help">
          Tip: every screen has a short description at the top explaining what it’s for. Need a
          hand? Email{' '}
          <a href="mailto:support@911electrics.com">support@911electrics.com</a>.
        </p>
      </section>
    </div>
  )
}
