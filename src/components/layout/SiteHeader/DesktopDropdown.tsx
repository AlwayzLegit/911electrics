'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import React, { useEffect, useState } from 'react'

import type { NavItem } from './index'

/**
 * Desktop nav dropdown. State-driven (not pure CSS hover) so the menu
 * reliably closes after navigating — with CSS-only hover/focus-within the
 * panel stayed open after a click, because the header persists across
 * client-side navigation and the pointer/focus never left it.
 */
export function DesktopDropdown({ item }: { item: NavItem }) {
  const [open, setOpen] = useState(false)
  const pathname = usePathname()

  // A long list (e.g. service-area cities) flows into a scrollable
  // multi-column panel instead of one tall column.
  const wide = (item.children?.length ?? 0) > 10

  // Close when navigation completes (also covers back/forward)
  useEffect(() => {
    setOpen(false)
  }, [pathname])

  return (
    <div
      className="relative"
      onBlur={(e) => {
        if (!e.currentTarget.contains(e.relatedTarget as Node | null)) setOpen(false)
      }}
      onFocus={() => setOpen(true)}
      onKeyDown={(e) => {
        if (e.key === 'Escape') setOpen(false)
      }}
      onMouseEnter={() => setOpen(true)}
      onMouseLeave={() => setOpen(false)}
    >
      <Link
        aria-expanded={open}
        className="inline-flex items-center gap-1 rounded-md px-3 py-2 text-sm font-medium text-navy-900 hover:bg-brand-50 hover:text-brand-700"
        href={item.href}
        onClick={() => setOpen(false)}
      >
        {item.label}
        <svg aria-hidden className="size-3 fill-current" viewBox="0 0 12 12">
          <path d="M6 8.5 1.5 4h9L6 8.5Z" />
        </svg>
      </Link>
      <div
        className={`absolute left-0 top-full z-50 rounded-lg border border-border bg-white p-2 shadow-lg transition ${
          wide
            ? 'grid max-h-[70vh] w-[34rem] max-w-[90vw] grid-cols-2 gap-x-2 overflow-y-auto sm:grid-cols-3'
            : 'min-w-64'
        } ${open ? 'visible opacity-100' : 'invisible opacity-0'}`}
      >
        {item.children?.map((child) => (
          <Link
            className="block rounded-md px-3 py-2 text-sm text-navy-900 hover:bg-brand-50 hover:text-brand-700"
            href={child.href}
            key={child.href}
            onClick={() => setOpen(false)}
          >
            {child.label}
          </Link>
        ))}
      </div>
    </div>
  )
}
