import Link from 'next/link'
import React from 'react'

import { cn } from '@/utilities/ui'

/**
 * Numbered pagination matching the legacy WordPress URL scheme:
 * page 1 lives at `basePath`, page N at `${basePath}page/N/`.
 */
export function PaginationNav({
  basePath,
  currentPage,
  totalPages,
}: {
  basePath: string
  currentPage: number
  totalPages: number
}) {
  if (totalPages <= 1) return null

  const hrefFor = (page: number) => (page <= 1 ? basePath : `${basePath}page/${page}/`)

  return (
    <nav aria-label="Pagination" className="mt-12 flex items-center justify-center gap-2">
      {currentPage > 1 && (
        <Link
          className="rounded-lg border border-border bg-white px-4 py-2 text-sm font-medium text-navy-900 hover:border-brand-300 hover:text-brand-700"
          href={hrefFor(currentPage - 1)}
          rel="prev"
        >
          ← Newer
        </Link>
      )}
      {Array.from({ length: totalPages }, (_, i) => i + 1).map((page) => (
        <Link
          aria-current={page === currentPage ? 'page' : undefined}
          className={cn(
            'rounded-lg px-4 py-2 text-sm font-semibold',
            page === currentPage
              ? 'bg-brand-600 text-white'
              : 'border border-border bg-white text-navy-900 hover:border-brand-300 hover:text-brand-700',
          )}
          href={hrefFor(page)}
          key={page}
        >
          {page}
        </Link>
      ))}
      {currentPage < totalPages && (
        <Link
          className="rounded-lg border border-border bg-white px-4 py-2 text-sm font-medium text-navy-900 hover:border-brand-300 hover:text-brand-700"
          href={hrefFor(currentPage + 1)}
          rel="next"
        >
          Older →
        </Link>
      )}
    </nav>
  )
}
