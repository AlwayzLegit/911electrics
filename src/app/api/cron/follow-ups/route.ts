import { NextResponse } from 'next/server'

import { query } from '@/db/client'
import { esc, leadLink, sendInternalEmail } from '@/lib/notify'

export const dynamic = 'force-dynamic'

/**
 * Emails the owner of any lead whose follow-up time has passed and hasn't been
 * reminded yet. Triggered by Vercel Cron (see vercel.json). Each due lead is
 * reminded once; rescheduling the follow-up re-arms it (the action clears
 * follow_up_notified_at).
 */
export async function GET(request: Request) {
  const secret = process.env.CRON_SECRET
  if (secret && request.headers.get('authorization') !== `Bearer ${secret}`) {
    return new NextResponse('Unauthorized', { status: 401 })
  }

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

  return NextResponse.json({ due: due.length, sent })
}
