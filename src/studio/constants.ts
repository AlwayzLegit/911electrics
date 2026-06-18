/**
 * Client-safe Studio constants and helpers. No server imports here so both
 * client components and server code can import from it freely.
 */

export const LEAD_STATUSES = ['new', 'contacted', 'quoted', 'won', 'lost', 'spam'] as const
export type LeadStatus = (typeof LEAD_STATUSES)[number]

export const TESTIMONIAL_SOURCES = ['google', 'yelp', 'facebook', 'direct'] as const
export type TestimonialSource = (typeof TESTIMONIAL_SOURCES)[number]

export const TESTIMONIAL_SOURCE_LABEL: Record<TestimonialSource, string> = {
  google: 'Google',
  yelp: 'Yelp',
  facebook: 'Facebook',
  direct: 'Direct',
}

export const LEAD_STATUS_LABEL: Record<LeadStatus, string> = {
  new: 'New',
  contacted: 'Contacted',
  quoted: 'Quoted',
  won: 'Won',
  lost: 'Lost',
  spam: 'Spam',
}

// Full static class strings so Tailwind keeps them (no dynamic class names).
export const LEAD_STATUS_BADGE: Record<LeadStatus, string> = {
  new: 'bg-brand-100 text-brand-700',
  contacted: 'bg-amber-100 text-amber-800',
  quoted: 'bg-blue-100 text-blue-800',
  won: 'bg-green-100 text-green-800',
  lost: 'bg-slate-200 text-slate-600',
  spam: 'bg-slate-200 text-slate-600',
}

export function timeAgo(input?: string | null): string {
  if (!input) return ''
  const then = new Date(input).getTime()
  if (Number.isNaN(then)) return ''
  const s = Math.max(0, (Date.now() - then) / 1000)
  if (s < 60) return 'just now'
  const m = s / 60
  if (m < 60) return `${Math.floor(m)}m ago`
  const h = m / 60
  if (h < 24) return `${Math.floor(h)}h ago`
  const d = h / 24
  if (d < 7) return `${Math.floor(d)}d ago`
  return new Date(input).toLocaleDateString()
}
