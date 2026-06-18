import { NextResponse } from 'next/server'

import { runFollowUpReminders } from '@/lib/cron-tasks'

export const dynamic = 'force-dynamic'

/** Back-compat endpoint; the scheduled worker is /api/cron/tick. */
export async function GET(request: Request) {
  const secret = process.env.CRON_SECRET
  if (secret && request.headers.get('authorization') !== `Bearer ${secret}`) {
    return new NextResponse('Unauthorized', { status: 401 })
  }
  const reminders = await runFollowUpReminders()
  return NextResponse.json(reminders)
}
