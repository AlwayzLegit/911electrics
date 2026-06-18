import 'server-only'

import { revalidatePath, revalidateTag } from 'next/cache'

import { query } from '@/db/client'

import { esc, leadLink, sendInternalEmail } from './notify'

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

  let sent = 0
  for (const lead of due) {
    const res = await sendInternalEmail(
      lead.assignee_email,
      `Follow-up due: ${lead.name || 'a lead'}`,
      `<p>This lead is due for a follow-up.</p>
       <p><b>${esc(lead.name)}</b>${lead.service ? ` — ${esc(lead.service)}` : ''}${
         lead.phone ? `<br>${esc(lead.phone)}` : ''
       }</p>
       <p><a href="${leadLink(lead.id)}">Open in Studio</a></p>`,
    )
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
