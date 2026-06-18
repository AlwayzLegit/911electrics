'use server'

import { revalidatePath } from 'next/cache'

import { getStudioUser } from '@/studio/auth'
import { getStudioPayload } from '@/studio/data'
import { LEAD_STATUSES, type LeadStatus } from '@/studio/constants'

export async function updateLeadStatus(id: number, status: LeadStatus): Promise<void> {
  const user = await getStudioUser()
  if (!user) throw new Error('Not authenticated')
  if (!LEAD_STATUSES.includes(status)) throw new Error('Invalid status')

  // Already authorized above via getStudioUser (our own session); Payload's
  // collection access control is bypassed since this is a trusted admin action.
  const payload = await getStudioPayload()
  await payload.update({
    collection: 'leads',
    id,
    data: { status },
    overrideAccess: true,
  })

  revalidatePath('/studio/leads')
  revalidatePath(`/studio/leads/${id}`)
  revalidatePath('/studio')
}
