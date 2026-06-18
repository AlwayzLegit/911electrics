import 'server-only'

import { Resend } from 'resend'

export type NotifyResult = { ok: boolean; error?: string }

export type LeadForNotify = {
  id: number
  name: string
  phone: string
  email?: string | null
  service?: string | null
}

const esc = (s?: string | null): string =>
  (s ?? '').replace(
    /[<>&"]/g,
    (c) => ({ '<': '&lt;', '>': '&gt;', '&': '&amp;', '"': '&quot;' })[c] as string,
  )

/** Auto-reply to the customer confirming we received their request. */
export async function sendCustomerAutoReply(
  lead: LeadForNotify,
  businessName: string,
  businessPhone: string,
): Promise<NotifyResult> {
  if (!lead.email) return { ok: false, error: 'no customer email' }
  if (!process.env.RESEND_API_KEY) return { ok: false, error: 'RESEND_API_KEY not set' }
  try {
    const resend = new Resend(process.env.RESEND_API_KEY)
    const { error } = await resend.emails.send({
      from: process.env.LEAD_FROM_EMAIL || 'leads@911electrics.com',
      to: lead.email,
      subject: `We received your request — ${businessName}`,
      html: `
        <p>Hi ${esc(lead.name)},</p>
        <p>Thanks for contacting ${esc(businessName)} — we've received your request${
          lead.service ? ` for ${esc(lead.service)}` : ''
        } and a licensed electrician will reach out shortly (usually within 15 minutes during business hours).</p>
        <p>Need us right away? Call <a href="tel:${esc(businessPhone)}">${esc(businessPhone)}</a>.</p>
        <p>— ${esc(businessName)}</p>`,
    })
    if (error) return { ok: false, error: `${error.name}: ${error.message}` }
    return { ok: true }
  } catch (err) {
    return { ok: false, error: err instanceof Error ? err.message : 'send failed' }
  }
}

/** Text the owner about a new lead (Twilio REST API — no SDK). */
export async function sendOwnerSms(
  lead: LeadForNotify,
  ownerPhone: string | undefined,
): Promise<NotifyResult> {
  const sid = process.env.TWILIO_ACCOUNT_SID
  const token = process.env.TWILIO_AUTH_TOKEN
  const from = process.env.TWILIO_FROM_NUMBER
  const to = process.env.LEAD_SMS_TO || ownerPhone
  if (!sid || !token || !from) return { ok: false, error: 'Twilio not configured' }
  if (!to) return { ok: false, error: 'no SMS recipient' }

  const link = `${process.env.NEXT_PUBLIC_SERVER_URL ?? ''}/studio/leads/${lead.id}`
  const body = `New lead: ${lead.name} ${lead.phone}${lead.service ? ` · ${lead.service}` : ''}. ${link}`
  try {
    const res = await fetch(`https://api.twilio.com/2010-04-01/Accounts/${sid}/Messages.json`, {
      method: 'POST',
      headers: {
        Authorization: 'Basic ' + Buffer.from(`${sid}:${token}`).toString('base64'),
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams({ To: to, From: from, Body: body }),
    })
    if (!res.ok) {
      const text = await res.text()
      return { ok: false, error: `Twilio ${res.status}: ${text.slice(0, 200)}` }
    }
    return { ok: true }
  } catch (err) {
    return { ok: false, error: err instanceof Error ? err.message : 'sms failed' }
  }
}
