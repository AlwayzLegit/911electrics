'use client'

import { Menu, Phone, X, Zap } from 'lucide-react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import React, { useEffect, useState } from 'react'

import type { NavItem } from './index'

export function MobileNav({
  nav,
  phone,
  phoneHref,
}: {
  nav: NavItem[]
  phone: string
  phoneHref: string
}) {
  const [open, setOpen] = useState(false)
  const pathname = usePathname()

  // Close on navigation
  useEffect(() => {
    setOpen(false)
  }, [pathname])

  useEffect(() => {
    document.body.style.overflow = open ? 'hidden' : ''
    return () => {
      document.body.style.overflow = ''
    }
  }, [open])

  return (
    <div className="lg:hidden">
      <button
        aria-expanded={open}
        aria-label="Open menu"
        className="flex size-10 items-center justify-center rounded-lg border border-border text-navy-900"
        onClick={() => setOpen(true)}
        type="button"
      >
        <Menu className="size-5" />
      </button>

      {open && (
        // Full-screen panel: independent of header height, no gaps
        <div className="fixed inset-0 z-50 flex flex-col bg-white">
          <div className="flex items-center justify-between border-b border-border px-4 py-3">
            <Link className="flex items-center gap-2" href="/" onClick={() => setOpen(false)}>
              <span className="flex size-9 items-center justify-center rounded-lg bg-brand-600 text-white">
                <Zap aria-hidden className="size-5" />
              </span>
              <span className="text-base font-bold text-navy-950">911 Construction &amp; Electric</span>
            </Link>
            <button
              aria-label="Close menu"
              className="flex size-10 items-center justify-center rounded-lg border border-border text-navy-900"
              onClick={() => setOpen(false)}
              type="button"
            >
              <X className="size-5" />
            </button>
          </div>

          <nav aria-label="Mobile" className="flex-1 overflow-y-auto px-4 pb-8">
            {nav.map((item) => (
              <React.Fragment key={item.label}>
                <Link
                  className="block border-b border-border py-3 text-base font-medium text-navy-900"
                  href={item.href}
                  onClick={() => setOpen(false)}
                >
                  {item.label}
                </Link>
                {item.children?.map((child) => (
                  <Link
                    className="block border-b border-border py-2.5 pl-6 text-sm text-muted-foreground"
                    href={child.href}
                    key={child.href}
                    onClick={() => setOpen(false)}
                  >
                    {child.label}
                  </Link>
                ))}
              </React.Fragment>
            ))}
          </nav>

          <div className="border-t border-border p-4 pb-6">
            <a
              className="flex items-center justify-center gap-2 rounded-lg bg-brand-600 px-4 py-3 font-semibold text-white"
              href={phoneHref}
            >
              <Phone className="size-5" />
              Call {phone}
            </a>
          </div>
        </div>
      )}
    </div>
  )
}
