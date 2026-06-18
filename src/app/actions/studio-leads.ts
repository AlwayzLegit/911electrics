'use server'

import { revalidatePath } from 'next/cache'

import { query } from '@/db/client'
import { getStudioUser } from '@/studio/auth'
import { LEAD_STATUSES, type LeadStatus } from '@/studio/constants'

export async function updateLeadStatus(id: number, status: LeadStatus): Promise<void> {
  const user = await getStudioUser()
  if (!user) throw new Error('Not authenticated')
  if (!LEAD_STATUSES.includes(status)) throw new Error('Invalid status')

  await query(`UPDATE leads SET status = $2::enum_leads_status, updated_at = now() WHERE id = $1`, [
    id,
    status,
  ])

  revalidatePath('/studio/leads')
  revalidatePath(`/studio/leads/${id}`)
  revalidatePath('/studio')
}
