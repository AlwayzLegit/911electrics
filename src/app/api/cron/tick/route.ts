import { NextResponse } from 'next/server'

import { requireCronSecret } from '@/lib/api-auth'
import { runFollowUpReminders, runHousekeeping, runScheduledPublishing } from '@/lib/cron-tasks'

export const dynamic = 'force-dynamic'

/** Periodic worker: publishes scheduled posts, sends follow-up reminders, tidies tables. */
export async function GET(request: Request) {
  const auth = requireCronSecret(request)
  if (!auth.ok) return auth.response

  const [publishing, reminders, housekeeping] = await Promise.all([
    runScheduledPublishing(),
    runFollowUpReminders(),
    runHousekeeping(),
  ])
  return NextResponse.json({ ...publishing, ...reminders, ...housekeeping })
}
