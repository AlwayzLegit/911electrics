import React from 'react'

import './index.scss'

/**
 * Branded dashboard header: greeting + the owner's most common tasks as
 * one-click shortcuts.
 */
export default function AdminWelcome() {
  const links = [
    { href: '/', label: 'View live site', external: true },
    { href: '/admin/collections/leads', label: 'Quote requests (Leads)' },
    { href: '/admin/collections/posts/create', label: 'Write a blog post' },
    { href: '/admin/collections/testimonials/create', label: 'Add a customer review' },
    { href: '/admin/globals/homepage', label: 'Edit homepage' },
    { href: '/admin/globals/siteSettings', label: 'Business info & socials' },
  ]

  return (
    <div className="admin-welcome">
      <div className="admin-welcome__head">
        <svg fill="none" height="34" viewBox="0 0 100 100" width="34" xmlns="http://www.w3.org/2000/svg">
          <rect fill="#d01d24" height="100" rx="22" width="100" />
          <path d="M56 12 L26 56 L46 56 L40 88 L74 42 L52 42 Z" fill="#ffffff" />
        </svg>
        <div>
          <h2>911 Construction &amp; Electric — Site Manager</h2>
          <p>
            Changes go live within seconds of publishing — no developer needed. Common tasks:
          </p>
        </div>
      </div>
      <div className="admin-welcome__links">
        {links.map((link) => (
          <a
            href={link.href}
            key={link.href}
            {...(link.external ? { rel: 'noopener noreferrer', target: '_blank' } : {})}
          >
            {link.label}
            {link.external ? ' ↗' : ''}
          </a>
        ))}
      </div>
    </div>
  )
}
