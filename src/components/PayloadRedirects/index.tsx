import type React from 'react'
import type { City, Page, Post, Service } from '@/payload-types'

import configPromise from '@payload-config'
import { getPayload } from 'payload'

import { getCachedRedirects } from '@/utilities/getRedirects'
import { notFound, redirect } from 'next/navigation'

interface Props {
  disableNotFound?: boolean
  url: string
}

/** Trailing-slash-insensitive ('/a/' === '/a'); also tolerates absolute URLs in `from`. */
const normalize = (value: string): string => {
  let path = value.trim()
  if (path.startsWith('http')) {
    try {
      path = new URL(path).pathname
    } catch {
      /* keep as-is */
    }
  }
  return path !== '/' && path.endsWith('/') ? path.slice(0, -1) : path
}

/* SSR dynamic redirects from the CMS Redirects collection */
export const PayloadRedirects: React.FC<Props> = async ({ disableNotFound, url }) => {
  const redirects = await getCachedRedirects()()

  const target = normalize(url)
  const redirectItem = redirects.find((r) => r.from && normalize(r.from) === target)

  if (redirectItem) {
    if (redirectItem.to?.url) {
      redirect(redirectItem.to.url)
    }

    const reference = redirectItem.to?.reference
    if (reference) {
      let slug: string | null | undefined

      if (typeof reference.value === 'object') {
        slug = (reference.value as Page | Post | Service | City)?.slug
      } else {
        // Unpopulated reference — resolve the document by id
        const payload = await getPayload({ config: configPromise })
        const document = await payload
          .findByID({ collection: reference.relationTo, id: reference.value, depth: 0 })
          .catch(() => null)
        slug = (document as Page | Post | Service | City | null)?.slug
      }

      // All public collections render at root-level URLs (/{slug}/)
      if (slug) redirect(`/${slug}/`)
    }
  }

  if (disableNotFound) return null

  notFound()
}
