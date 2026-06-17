import type { MetadataRoute } from 'next'

import { getServerSideURL } from '@/utilities/getURL'

const isProduction =
  process.env.VERCEL_ENV === 'production' || process.env.NODE_ENV === 'production'

export default function robots(): MetadataRoute.Robots {
  if (!isProduction) {
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
