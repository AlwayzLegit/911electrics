'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import React, { type ComponentProps } from 'react'

/**
 * A Link that smooth-scrolls to the top of the page when you click through to
 * the route you're already on (e.g. the logo or "Home" on the homepage), which
 * a plain <Link> does nothing for. Behaves like a normal Link otherwise.
 */
export function ScrollTopLink({ href, onClick, ...props }: ComponentProps<typeof Link>) {
  const pathname = usePathname()

  return (
    <Link
      {...props}
      href={href}
      onClick={(e) => {
        if (typeof href === 'string' && href === pathname) {
          e.preventDefault()
          window.scrollTo({ top: 0, behavior: 'smooth' })
        }
        onClick?.(e)
      }}
    />
  )
}
