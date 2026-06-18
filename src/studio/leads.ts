import 'server-only'

import { query } from '@/db/client'

import type { LeadStatus } from './constants'

export type LeadRow = {
  id: number
  status: LeadStatus
  name: string
  phone: string
  email: string | null
  service: string | null
  address: string | null
  message: string | null
  sourcePath: string | null
  formLocation: string | null
  emailSent: boolean | null
  emailError: string | null
  createdAt: string
  utm: {
    source: string | null
    medium: string | null
    campaign: string | null
    term: string | null
    content: string | null
  }
}

type Row = {
  id: number
  status: string | null
  name: string | null
  phone: string | null
  email: string | null
  service: string | null
  address: string | null
  message: string | null
  source_path: string | null
  form_location: string | null
  email_sent: boolean | null
  email_error: string | null
  created_at: string
  utm_source: string | null
  utm_medium: string | null
  utm_campaign: string | null
  utm_term: string | null
  utm_content: string | null
}

const SELECT = `
  SELECT id, status, name, phone, email, service, address, message, source_path, form_location,
         email_sent, email_error, created_at, utm_source, utm_medium, utm_campaign, utm_term, utm_content
  FROM leads
`

function map(r: Row): LeadRow {
  return {
    id: r.id,
    status: (r.status as LeadStatus) || 'new',
    name: r.name ?? '',
    phone: r.phone ?? '',
    email: r.email,
    service: r.service,
    address: r.address,
    message: r.message,
    sourcePath: r.source_path,
    formLocation: r.form_location,
    emailSent: r.email_sent,
    emailError: r.email_error,
    createdAt: r.created_at,
    utm: {
      source: r.utm_source,
      medium: r.utm_medium,
      campaign: r.utm_campaign,
      term: r.utm_term,
      content: r.utm_content,
    },
  }
}

export async function getLeads(status?: LeadStatus): Promise<LeadRow[]> {
  const rows = status
    ? await query<Row>(
        `${SELECT} WHERE status = $1::enum_leads_status ORDER BY created_at DESC LIMIT 200`,
        [status],
      )
    : await query<Row>(`${SELECT} ORDER BY created_at DESC LIMIT 200`)
  return rows.map(map)
}

export async function getRecentLeads(limit = 6): Promise<LeadRow[]> {
  const rows = await query<Row>(`${SELECT} ORDER BY created_at DESC LIMIT $1`, [limit])
  return rows.map(map)
}

export async function getLeadById(id: number): Promise<LeadRow | null> {
  const rows = await query<Row>(`${SELECT} WHERE id = $1 LIMIT 1`, [id])
  return rows[0] ? map(rows[0]) : null
}

export type DashboardCounts = {
  newLeads: number
  weekLeads: number
  totalLeads: number
  services: number
  posts: number
}

export async function getDashboardCounts(): Promise<DashboardCounts> {
  const [leadCounts] = await query<{ new_leads: string; week_leads: string; total_leads: string }>(
    `SELECT
       count(*) FILTER (WHERE status = 'new')::text AS new_leads,
       count(*) FILTER (WHERE created_at > now() - interval '7 days')::text AS week_leads,
       count(*)::text AS total_leads
     FROM leads`,
  )
  const [svc] = await query<{ count: string }>(`SELECT count(*)::text FROM services`)
  const [pst] = await query<{ count: string }>(`SELECT count(*)::text FROM posts`)
  return {
    newLeads: Number(leadCounts?.new_leads ?? 0),
    weekLeads: Number(leadCounts?.week_leads ?? 0),
    totalLeads: Number(leadCounts?.total_leads ?? 0),
    services: Number(svc?.count ?? 0),
    posts: Number(pst?.count ?? 0),
  }
}
