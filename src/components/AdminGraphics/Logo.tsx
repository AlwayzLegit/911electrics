import React from 'react'

/** Full brand lockup — shown on the admin login screen. */
export default function AdminLogo() {
  return (
    <div style={{ alignItems: 'center', display: 'flex', flexDirection: 'column', gap: 14 }}>
      {/* eslint-disable-next-line @next/next/no-img-element */}
      <img alt="911 Construction & Electric Inc." src="/logo.png" style={{ height: 56, width: 'auto' }} />
      <div
        style={{ fontSize: 12, fontWeight: 600, letterSpacing: '0.12em', opacity: 0.6, textTransform: 'uppercase' }}
      >
        Site Manager
      </div>
    </div>
  )
}
