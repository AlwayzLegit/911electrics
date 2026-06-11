'use client'

import { Button, toast } from '@payloadcms/ui'
import React, { useState } from 'react'

/**
 * "Sync Google Reviews" button shown above the Testimonials list. Calls the
 * collection's sync endpoint, which pulls the latest Google reviews and
 * updates the aggregate rating badge.
 */
export default function SyncGoogleReviews() {
  const [busy, setBusy] = useState(false)

  const sync = async () => {
    setBusy(true)
    try {
      const res = await fetch('/api/testimonials/sync-google', {
        method: 'POST',
        credentials: 'include',
      })
      const data = await res.json()
      if (!res.ok) {
        throw new Error(typeof data?.message === 'string' ? data.message : `Sync failed (${res.status})`)
      }
      toast.success(
        `Google reviews synced — ${data.created} new, ${data.updated} updated` +
          (data.rating ? ` · profile rating ${data.rating} (${data.ratingCount} reviews)` : ''),
      )
      // Refresh the list view so new entries appear
      setTimeout(() => window.location.reload(), 1200)
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Sync failed')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div style={{ alignItems: 'center', display: 'flex', gap: 12, marginBottom: 8 }}>
      <Button buttonStyle="secondary" disabled={busy} onClick={sync} size="small">
        {busy ? 'Syncing…' : 'Sync Google Reviews'}
      </Button>
      <span style={{ fontSize: 12, opacity: 0.65 }}>
        Pulls the latest reviews from the Google Business profile and updates the rating badge.
      </span>
    </div>
  )
}
