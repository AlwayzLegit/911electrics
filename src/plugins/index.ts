import { redirectsPlugin } from '@payloadcms/plugin-redirects'
import { seoPlugin } from '@payloadcms/plugin-seo'
import { Plugin } from 'payload'
import { revalidateRedirects } from '@/hooks/revalidateRedirects'
import { GenerateTitle, GenerateURL } from '@payloadcms/plugin-seo/types'

import { City, Page, Post, Service } from '@/payload-types'
import { getServerSideURL } from '@/utilities/getURL'

const SITE_NAME = '911 Construction & Electric Inc.'
// Short brand for title suffixes — the full business name pushes nearly every
// title past Google's ~60-char display limit
const BRAND_SUFFIX = '911 Electric'

const generateTitle: GenerateTitle<Post | Page | Service | City> = ({ doc }) => {
  if (!doc?.title) return SITE_NAME
  // Only append the brand when the result stays within the ~60-char limit
  return doc.title.length + BRAND_SUFFIX.length + 3 <= 60
    ? `${doc.title} | ${BRAND_SUFFIX}`
    : doc.title
}

const generateURL: GenerateURL<Post | Page | Service | City> = ({ doc }) => {
  const url = getServerSideURL()

  return doc?.slug ? `${url}/${doc.slug}/` : url
}

export const plugins: Plugin[] = [
  redirectsPlugin({
    collections: ['pages', 'posts', 'services', 'cities'],
    overrides: {
      admin: {
        group: 'System',
      },
      // @ts-expect-error - This is a valid override, mapped fields don't resolve to the same type
      fields: ({ defaultFields }) => {
        return defaultFields.map((field) => {
          if ('name' in field && field.name === 'from') {
            return {
              ...field,
              admin: {
                description: 'You will need to rebuild the website when changing this field.',
              },
            }
          }
          return field
        })
      },
      hooks: {
        afterChange: [revalidateRedirects],
      },
    },
  }),
  seoPlugin({
    generateTitle,
    generateURL,
  }),
]
