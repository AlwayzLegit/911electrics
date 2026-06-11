import { Phone, ShieldCheck, Zap } from 'lucide-react'
import Link from 'next/link'
import React from 'react'

import { telHref } from '@/lib/format'
import { getFeaturedTestimonials, getServicesNav } from '@/lib/queries'
import { getCachedGlobal } from '@/utilities/getGlobals'

import { MobileNav } from './MobileNav'

export type NavItem = {
  label: string
  href: string
  children?: { label: string; href: string }[]
}

export async function SiteHeader() {
  const [siteSettings, services, testimonials] = await Promise.all([
    getCachedGlobal('siteSettings', 1)(),
    getServicesNav(),
    getFeaturedTestimonials(),
  ])

  const nav: NavItem[] = [
    { label: 'Home', href: '/' },
    {
      label: 'Services',
      href: '/services/',
      children: services.map((s) => ({ label: s.navLabel, href: `/${s.slug}/` })),
    },
    { label: 'Service Areas', href: '/service-areas/' },
    { label: 'About Us', href: '/#about' },
    // The homepage reviews section only renders when featured testimonials
    // exist — without this guard the link scrolls nowhere
    ...(testimonials.length ? [{ label: 'Reviews', href: '/#reviews' }] : []),
    { label: 'Blog', href: '/blog/' },
    { label: 'Contact', href: '/contact/' },
  ]

  const phone = siteSettings.phone
  const phoneHref = telHref(phone)

  // Prefer the logo set in Site Settings (admin); fall back to the bundled
  // brand asset so the header always renders a real logo.
  const logo = siteSettings.logo
  const logoSrc = (logo && typeof logo === 'object' && logo.url) || '/logo.png'
  const logoAlt =
    (logo && typeof logo === 'object' && logo.alt) || `${siteSettings.businessName} logo`

  return (
    <header className="sticky top-0 z-40 bg-white shadow-sm">
      {/* Top strip */}
      <div className="bg-navy-950 text-white">
        <div className="container flex items-center justify-between gap-4 py-1.5 text-xs sm:text-sm">
          <p className="flex items-center gap-1.5">
            <ShieldCheck aria-hidden className="size-4 text-amber-accent" />
            <span>Licensed &amp; Insured — Lic. #{siteSettings.licenseNumber}</span>
          </p>
          <p className="hidden items-center gap-1.5 sm:flex">
            <Zap aria-hidden className="size-4 text-amber-accent" />
            <span>{siteSettings.hoursLabel}</span>
          </p>
          <a className="flex items-center gap-1.5 font-semibold hover:text-amber-accent" href={phoneHref}>
            <Phone aria-hidden className="size-4" />
            {phone}
          </a>
        </div>
      </div>

      {/* Main bar */}
      <div className="container flex items-center justify-between gap-6 py-3">
        <Link aria-label={siteSettings.businessName} className="flex items-center" href="/">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            alt={logoAlt}
            className="h-11 w-auto sm:h-12"
            decoding="async"
            fetchPriority="high"
            height={343}
            src={logoSrc}
            width={728}
          />
        </Link>

        <nav aria-label="Main" className="hidden items-center gap-1 lg:flex">
          {nav.map((item) =>
            item.children?.length ? (
              <div className="group relative" key={item.label}>
                <Link
                  className="inline-flex items-center gap-1 rounded-md px-3 py-2 text-sm font-medium text-navy-900 hover:bg-brand-50 hover:text-brand-700"
                  href={item.href}
                >
                  {item.label}
                  <svg aria-hidden className="size-3 fill-current" viewBox="0 0 12 12">
                    <path d="M6 8.5 1.5 4h9L6 8.5Z" />
                  </svg>
                </Link>
                <div className="invisible absolute left-0 top-full z-50 min-w-64 rounded-lg border border-border bg-white p-2 opacity-0 shadow-lg transition group-hover:visible group-hover:opacity-100 group-focus-within:visible group-focus-within:opacity-100">
                  {item.children.map((child) => (
                    <Link
                      className="block rounded-md px-3 py-2 text-sm text-navy-900 hover:bg-brand-50 hover:text-brand-700"
                      href={child.href}
                      key={child.href}
                    >
                      {child.label}
                    </Link>
                  ))}
                </div>
              </div>
            ) : (
              <Link
                className="rounded-md px-3 py-2 text-sm font-medium text-navy-900 hover:bg-brand-50 hover:text-brand-700"
                href={item.href}
                key={item.label}
              >
                {item.label}
              </Link>
            ),
          )}
        </nav>

        <div className="flex items-center gap-3">
          <a
            className="hidden rounded-lg bg-brand-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-brand-700 md:inline-block"
            href="/contact/"
          >
            Get a Free Quote
          </a>
          <MobileNav
            logoAlt={logoAlt}
            logoSrc={logoSrc}
            nav={nav}
            phone={phone}
            phoneHref={phoneHref}
          />
        </div>
      </div>
    </header>
  )
}
