import { NextResponse } from 'next/server'

import { runFollowUpReminders, runScheduledPublishing } from '@/lib/cron-tasks'

export const dynamic = 'force-dynamic'

/** Periodic worker: publishes scheduled posts and sends follow-up reminders. */
export async function GET(request: Request) {
  const secret = process.env.CRON_SECRET
  if (secret && request.headers.get('authorization') !== `Bearer ${secret}`) {
    return new NextResponse('Unauthorized', { status: 401 })
  }

  const [publishing, reminders] = await Promise.all([
    runScheduledPublishing(),
    runFollowUpReminders(),
  ])
  return NextResponse.json({ ...publishing, ...reminders })
}
