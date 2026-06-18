'use server'

import { headers } from 'next/headers'
import { Resend } from 'resend'
import { z } from 'zod'

import { query } from '@/db/client'
import { getSiteSettings } from '@/lib/queries'

const leadSchema = z.object({
  name: z.string().trim().min(2, 'Please enter your name').max(100),
  phone: z
    .string()
    .trim()
    .regex(/^[\d\s()+.-]{7,20}$/, 'Please enter a valid phone number'),
  email: z.union([z.literal(''), z.string().trim().email('Please enter a valid email')]).optional(),
  address: z.string().trim().max(200).optional(),
  service: z.string().trim().max(100).optional(),
  message: z.string().trim().max(2000).optional(),
  sourcePath: z.string().max(300).optional(),
  formLocation: z.enum(['hero', 'contact', 'contact-page']).optional(),
})

export type LeadFormState = {
  status: 'idle' | 'success' | 'error'
  message?: string
  fieldErrors?: Record<string, string>
}

const MIN_FILL_MS = 3000

async function verifyTurnstile(token: string | undefined, ip: string | undefined): Promise<boolean> {
  const secret = process.env.TURNSTILE_SECRET_KEY
  // Turnstile is optional — if not configured, honeypot + time-trap still apply
  if (!secret) return true
  if (!token) return false
  try {
    const res = await fetch('https://challenges.cloudflare.com/turnstile/v0/siteverify', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ secret, response: token, remoteip: ip }),
    })
    const data = (await res.json()) as { success: boolean }
    return data.success
  } catch {
    // Cloudflare outage shouldn't block real customers
    return true
  }
}

export async function submitLead(_prev: LeadFormState, formData: FormData): Promise<LeadFormState> {
  const headerList = await headers()
  const ip =
    headerList.get('x-forwarded-for')?.split(',')[0]?.trim() ||
    headerList.get('x-real-ip') ||
    undefined
  const userAgent = headerList.get('user-agent') ?? undefined

  // --- Spam checks (fail silently with a fake success so bots don't learn) ---
  const honeypot = formData.get('company_website')
  if (typeof honeypot === 'string' && honeypot.length > 0) {
    return { status: 'success' }
  }

  const startedAt = Number(formData.get('startedAt'))
  if (!Number.isFinite(startedAt) || Date.now() - startedAt < MIN_FILL_MS) {
    return { status: 'success' }
  }

  const turnstileOk = await verifyTurnstile(
    formData.get('cf-turnstile-response')?.toString(),
    ip,
  )
  if (!turnstileOk) {
    return { status: 'error', message: 'Verification failed — please try again or call us.' }
  }

  // --- Validation ---
  const parsed = leadSchema.safeParse({
    name: formData.get('name'),
    phone: formData.get('phone'),
    email: formData.get('email') ?? '',
    address: formData.get('address') ?? '',
    service: formData.get('service') ?? '',
    message: formData.get('message') ?? '',
    sourcePath: formData.get('sourcePath') ?? '',
    formLocation: formData.get('formLocation') ?? 'hero',
  })

  if (!parsed.success) {
    const fieldErrors: Record<string, string> = {}
    for (const issue of parsed.error.issues) {
      const key = issue.path[0]?.toString()
      if (key && !fieldErrors[key]) fieldErrors[key] = issue.message
    }
    return { status: 'error', message: 'Please fix the highlighted fields.', fieldErrors }
  }

  const data = parsed.data

  // UTM params captured by the client from the landing URL
  const utm = {
    source: formData.get('utm_source')?.toString() || null,
    medium: formData.get('utm_medium')?.toString() || null,
    campaign: formData.get('utm_campaign')?.toString() || null,
    term: formData.get('utm_term')?.toString() || null,
    content: formData.get('utm_content')?.toString() || null,
  }

  // --- 1. Persist the lead (source of truth) ---
  let leadId: number
  try {
    const rows = await query<{ id: number }>(
      `INSERT INTO leads
         (status, name, phone, email, service, address, message, source_path, form_location,
          utm_source, utm_medium, utm_campaign, utm_term, utm_content, ip, user_agent,
          updated_at, created_at)
       VALUES ('new'::enum_leads_status, $1, $2, $3, $4, $5, $6, $7, $8::enum_leads_form_location,
          $9, $10, $11, $12, $13, $14, $15, now(), now())
       RETURNING id`,
      [
        data.name,
        data.phone,
        data.email || null,
        data.service || null,
        data.address || null,
        data.message || null,
        data.sourcePath || null,
        data.formLocation ?? 'hero',
        utm.source,
        utm.medium,
        utm.campaign,
        utm.term,
        utm.content,
        ip ?? null,
        userAgent ?? null,
      ],
    )
    leadId = rows[0].id
  } catch (err) {
    console.error('Failed to save lead', err)
    return {
      status: 'error',
      message: 'Something went wrong — please call us at 747-255-8595.',
    }
  }

  // --- 2. Email notification (best-effort, never blocks the lead) ---
  // Delivery status is recorded on the lead; the failure reason goes to the
  // server logs (Vercel).
  const recordEmailFailure = async (reason: string) => {
    console.warn(`Lead ${leadId}: notification email not sent — ${reason}`)
    try {
      await query(
        `UPDATE leads SET email_sent = false, email_error = $2, updated_at = now() WHERE id = $1`,
        [leadId, reason.slice(0, 500)],
      )
    } catch (updateErr) {
      console.error('Failed to record lead email status', updateErr)
    }
  }

  if (!process.env.RESEND_API_KEY) {
    await recordEmailFailure('RESEND_API_KEY is not set in this environment')
  } else {
    try {
      const resend = new Resend(process.env.RESEND_API_KEY)
      const siteSettings = await getSiteSettings()
      const to = process.env.LEAD_NOTIFICATION_EMAIL || siteSettings.email
      if (!to) {
        throw new Error('No recipient — set LEAD_NOTIFICATION_EMAIL or the Site Settings email')
      }
      const esc = (s?: string) =>
        (s ?? '').replace(/[<>&"]/g, (c) => ({ '<': '&lt;', '>': '&gt;', '&': '&amp;', '"': '&quot;' })[c] as string)

      // Resend reports API failures via the `error` field, not by throwing
      const { error } = await resend.emails.send({
        from: process.env.LEAD_FROM_EMAIL || 'leads@911electrics.com',
        to,
        subject: `New lead: ${data.name}${data.service ? ` — ${data.service}` : ''}`,
        html: `
          <h2>New quote request</h2>
          <table cellpadding="6" style="border-collapse:collapse">
            <tr><td><b>Name</b></td><td>${esc(data.name)}</td></tr>
            <tr><td><b>Phone</b></td><td><a href="tel:${esc(data.phone)}">${esc(data.phone)}</a></td></tr>
            <tr><td><b>Email</b></td><td>${esc(data.email)}</td></tr>
            <tr><td><b>Service</b></td><td>${esc(data.service)}</td></tr>
            <tr><td><b>Address</b></td><td>${esc(data.address)}</td></tr>
            <tr><td><b>Message</b></td><td>${esc(data.message)}</td></tr>
            <tr><td><b>Page</b></td><td>${esc(data.sourcePath)}</td></tr>
          </table>
          <p>Open in Studio: ${process.env.NEXT_PUBLIC_SERVER_URL}/studio/leads/${leadId}</p>
        `,
      })
      if (error) {
        throw new Error(`Resend rejected the email: ${error.name} — ${error.message}`)
      }
      await query(
        `UPDATE leads SET email_sent = true, email_error = NULL, updated_at = now() WHERE id = $1`,
        [leadId],
      )
    } catch (err) {
      console.error('Lead saved but notification email failed', err)
      await recordEmailFailure(err instanceof Error ? err.message : 'Unknown email error')
    }
  }

  return {
    status: 'success',
    message: 'Thanks! We received your request and will call you shortly.',
  }
}
