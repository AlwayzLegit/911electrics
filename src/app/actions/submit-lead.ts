'use server'

import configPromise from '@payload-config'
import { headers } from 'next/headers'
import { getPayload } from 'payload'
import { Resend } from 'resend'
import { z } from 'zod'

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
  const payload = await getPayload({ config: configPromise })

  // UTM params captured by the client from the landing URL
  const utm = {
    source: formData.get('utm_source')?.toString() || undefined,
    medium: formData.get('utm_medium')?.toString() || undefined,
    campaign: formData.get('utm_campaign')?.toString() || undefined,
    term: formData.get('utm_term')?.toString() || undefined,
    content: formData.get('utm_content')?.toString() || undefined,
  }

  // --- 1. Persist the lead (source of truth) ---
  let leadId: number | string
  try {
    const lead = await payload.create({
      collection: 'leads',
      data: {
        name: data.name,
        phone: data.phone,
        email: data.email || undefined,
        address: data.address || undefined,
        service: data.service || undefined,
        message: data.message || undefined,
        sourcePath: data.sourcePath || undefined,
        formLocation: data.formLocation,
        utm,
        ip,
        userAgent,
        status: 'new',
      },
      overrideAccess: true,
    })
    leadId = lead.id
  } catch (err) {
    payload.logger.error({ err }, 'Failed to save lead')
    return {
      status: 'error',
      message: 'Something went wrong — please call us at 747-255-8595.',
    }
  }

  // --- 2. Email notification (best-effort, never blocks the lead) ---
  // Record delivery status on the lead. The failure *reason* goes to the
  // server logs (Vercel) — we deliberately don't persist it on the document
  // to keep the leads schema stable.
  const recordEmailFailure = async (reason: string) => {
    payload.logger.warn(`Lead ${leadId}: notification email not sent — ${reason}`)
    try {
      await payload.update({
        collection: 'leads',
        id: leadId,
        data: { emailSent: false },
        overrideAccess: true,
      })
    } catch (updateErr) {
      payload.logger.error({ err: updateErr }, 'Failed to record lead email status')
    }
  }

  if (!process.env.RESEND_API_KEY) {
    await recordEmailFailure('RESEND_API_KEY is not set in this environment')
  } else {
    try {
      const resend = new Resend(process.env.RESEND_API_KEY)
      const siteSettings = await payload.findGlobal({ slug: 'siteSettings' })
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
          <p>Open in admin: ${process.env.NEXT_PUBLIC_SERVER_URL}/admin/collections/leads/${leadId}</p>
        `,
      })
      if (error) {
        throw new Error(`Resend rejected the email: ${error.name} — ${error.message}`)
      }
      await payload.update({
        collection: 'leads',
        id: leadId,
        data: { emailSent: true },
        overrideAccess: true,
      })
    } catch (err) {
      payload.logger.error({ err }, 'Lead saved but notification email failed')
      await recordEmailFailure(err instanceof Error ? err.message : 'Unknown email error')
    }
  }

  return {
    status: 'success',
    message: 'Thanks! We received your request and will call you shortly.',
  }
}
