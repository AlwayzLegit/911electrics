import type { MetadataRoute } from 'next'
import { headers } from 'next/headers'

import { getServerSideURL } from '@/utilities/getURL'

const CANONICAL_HOST =
  process.env.CANONICAL_DOMAIN ||
  process.env.VERCEL_PROJECT_PRODUCTION_URL ||
  ''

function isCanonical(host: string): boolean {
  if (!CANONICAL_HOST) return true
  const canonical = CANONICAL_HOST.replace(/^https?:\/\//, '').replace(/\/$/, '')
  const incoming = host.replace(/:\d+$/, '')
  return incoming === canonical
}

export default async function robots(): Promise<MetadataRoute.Robots> {
  const headerList = await headers()
  const host = headerList.get('host') || ''

  if (!isCanonical(host)) {
    return {
      rules: { userAgent: '*', disallow: '/' },
    }
  }

  return {
    rules: {
      userAgent: '*',
      allow: '/',
      disallow: ['/admin', '/api/'],
    },
    sitemap: `${getServerSideURL()}/sitemap.xml`,
  }
}
