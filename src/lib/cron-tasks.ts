import 'server-only'

import { revalidatePath, revalidateTag } from 'next/cache'

import { query } from '@/db/client'
import {
  brandFromSettings,
  defaultBrand,
  emailButton,
  emailInfoRows,
  renderBrandedEmail,
  type EmailBrand,
} from '@/lib/email-template'
import { getSiteSettings } from '@/lib/queries'
import { cleanUpSessions } from '@/studio/sessions'

import { leadLink, sendInternalEmail } from './notify'

/** Email lead owners about follow-ups that have come due (once per due date). */
export async function runFollowUpReminders(): Promise<{ due: number; sent: number }> {
  const due = await query<{
    id: number
    name: string | null
    phone: string | null
    service: string | null
    assignee_email: string
  }>(
    `SELECT l.id, l.name, l.phone, l.service, u.email AS assignee_email
     FROM leads l JOIN users u ON u.id = l.assigned_to
     WHERE l.status NOT IN ('won','lost','spam')
       AND l.next_follow_up_at IS NOT NULL
       AND l.next_follow_up_at <= now()
       AND (l.follow_up_notified_at IS NULL OR l.follow_up_notified_at < l.next_follow_up_at)
       AND u.disabled = false
     LIMIT 100`,
  )

  // Build brand once for the batch; fall back to defaults if settings fail.
  let brand: EmailBrand
  try {
    brand = brandFromSettings(await getSiteSettings())
  } catch {
    brand = defaultBrand()
  }

  let sent = 0
  for (const lead of due) {
    const name = lead.name || 'a lead'
    const studioUrl = leadLink(lead.id)
    const rows = emailInfoRows([
      { label: 'Name', value: lead.name || '' },
      { label: 'Phone', value: lead.phone || '' },
      { label: 'Service', value: lead.service || '' },
    ])
    const html = renderBrandedEmail({
      brand,
      title: `Follow-up due: ${name}`,
      heading: 'A lead is due for follow-up',
      preheader: `${name}${lead.service ? ` — ${lead.service}` : ''} is due for a follow-up.`,
      bodyHtml: `<p style="margin:0 0 12px;">This lead is due for a follow-up:</p>${rows}${emailButton('Open in Studio', studioUrl)}`,
    })
    const text = `A lead is due for follow-up.\n\nName: ${lead.name || '—'}\nPhone: ${lead.phone || '—'}\nService: ${lead.service || '—'}\n\nOpen in Studio: ${studioUrl}`
    const res = await sendInternalEmail(lead.assignee_email, `Follow-up due: ${name}`, html, text)
    if (res.ok) {
      await query(`UPDATE leads SET follow_up_notified_at = now() WHERE id = $1`, [lead.id]).catch(
        () => {},
      )
      sent++
    }
  }
  return { due: due.length, sent }
}

/** Publish any scheduled posts whose time has come, and revalidate the blog. */
export async function runScheduledPublishing(): Promise<{ published: number }> {
  const due = await query<{ id: number; slug: string | null }>(
    `UPDATE posts
       SET _status = 'published',
           published_at = COALESCE(published_at, scheduled_for, now()),
           scheduled_for = NULL,
           updated_at = now()
     WHERE _status = 'draft' AND scheduled_for IS NOT NULL AND scheduled_for <= now()
     RETURNING id, slug`,
  )

  if (due.length > 0) {
    revalidateTag('posts', 'max')
    revalidateTag('sitemap', 'max')
    revalidatePath('/blog')
    for (const p of due) if (p.slug) revalidatePath(`/${p.slug}`)
  }
  return { published: due.length }
}

/**
 * Table housekeeping. Best-effort by design: it shares a cron run with
 * scheduled publishing and follow-up reminders, and a failure here must never
 * stop a post going out or a reminder being sent.
 */
export async function runHousekeeping(): Promise<{
  sessionsExpired: number
  sessionsDeleted: number
  throttleRowsDeleted: number
}> {
  const result = { sessionsExpired: 0, sessionsDeleted: 0, throttleRowsDeleted: 0 }
  try {
    const sessions = await cleanUpSessions()
    result.sessionsExpired = sessions.expired
    result.sessionsDeleted = sessions.deleted
  } catch (err) {
    console.error('session cleanup failed', err)
  }
  try {
    // One row per IP that ever failed a sign-in. A row matters only while its
    // counting window or its lock is current; after that it is dead weight.
    const rows = await query<{ ip: string }>(
      `DELETE FROM login_throttle
       WHERE window_start < now() - interval '1 day'
         AND (locked_until IS NULL OR locked_until < now())
       RETURNING ip`,
    )
    result.throttleRowsDeleted = rows.length
  } catch (err) {
    console.error('login throttle cleanup failed', err)
  }
  return result
}
