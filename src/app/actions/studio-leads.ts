'use server'

import { revalidatePath } from 'next/cache'

import { query } from '@/db/client'
import { getStudioUser } from '@/studio/auth'
import { LEAD_STATUS_LABEL, LEAD_STATUSES, type LeadStatus } from '@/studio/constants'

async function logActivity(leadId: number, type: string, body: string): Promise<void> {
  await query(`INSERT INTO lead_activity (lead_id, type, body) VALUES ($1, $2, $3)`, [
    leadId,
    type,
    body,
  ])
}

function refresh(id: number): void {
  revalidatePath('/studio/leads')
  revalidatePath(`/studio/leads/${id}`)
  revalidatePath('/studio')
}

export async function updateLeadStatus(id: number, status: LeadStatus): Promise<void> {
  const user = await getStudioUser()
  if (!user) throw new Error('Not authenticated')
  if (!LEAD_STATUSES.includes(status)) throw new Error('Invalid status')

  await query(`UPDATE leads SET status = $2::enum_leads_status, updated_at = now() WHERE id = $1`, [
    id,
    status,
  ])
  await logActivity(id, 'status', `Status changed to ${LEAD_STATUS_LABEL[status]}`)
  refresh(id)
}

export async function addLeadNote(id: number, formData: FormData): Promise<void> {
  const user = await getStudioUser()
  if (!user) throw new Error('Not authenticated')
  const body = String(formData.get('note') ?? '').trim()
  if (!body) return
  await logActivity(id, 'note', body.slice(0, 2000))
  refresh(id)
}

export async function updateLeadDetails(id: number, formData: FormData): Promise<void> {
  const user = await getStudioUser()
  if (!user) throw new Error('Not authenticated')

  const valueRaw = String(formData.get('estimatedValue') ?? '').trim()
  const value = valueRaw ? Number(valueRaw) : null
  const estimatedValue = value !== null && Number.isFinite(value) ? value : null

  const followRaw = String(formData.get('nextFollowUpAt') ?? '').trim()
  let nextFollowUp: string | null = null
  if (followRaw) {
    const d = new Date(followRaw)
    if (!Number.isNaN(d.getTime())) nextFollowUp = d.toISOString()
  }

  await query(
    `UPDATE leads SET estimated_value = $2, next_follow_up_at = $3, updated_at = now() WHERE id = $1`,
    [id, estimatedValue, nextFollowUp],
  )
  refresh(id)
}
