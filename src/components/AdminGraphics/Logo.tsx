import React from 'react'

/** Full brand lockup — shown on the admin login screen. */
export default function AdminLogo() {
  return (
    <div style={{ alignItems: 'center', display: 'flex', flexDirection: 'column', gap: 14 }}>
      <svg fill="none" height="64" viewBox="0 0 100 100" width="64" xmlns="http://www.w3.org/2000/svg">
        <rect fill="#1d4ed8" height="100" rx="22" width="100" />
        <path d="M56 12 L26 56 L46 56 L40 88 L74 42 L52 42 Z" fill="#ffffff" />
      </svg>
      <div style={{ textAlign: 'center' }}>
        <div style={{ fontSize: 22, fontWeight: 700, letterSpacing: '-0.01em' }}>
          911 Construction &amp; Electric
        </div>
        <div style={{ fontSize: 12, fontWeight: 600, letterSpacing: '0.12em', opacity: 0.6, textTransform: 'uppercase' }}>
          Site Manager
        </div>
      </div>
    </div>
  )
}
