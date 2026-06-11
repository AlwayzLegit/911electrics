import type { Metadata } from 'next'

import type { City, Config, Media, Page, Post, Service } from '../payload-types'

import { mergeOpenGraph } from './mergeOpenGraph'
import { getServerSideURL } from './getURL'

const SITE_NAME = '911 Construction & Electric Inc.'
const BRAND_SUFFIX = '911 Electric'

const getImageURL = (image?: Media | Config['db']['defaultIDType'] | null) => {
  if (image && typeof image === 'object' && 'url' in image) {
    const serverUrl = getServerSideURL()
    const ogUrl = image.sizes?.og?.url
    return ogUrl ? serverUrl + ogUrl : serverUrl + image.url
  }
  return undefined
}

type SeoDoc = Partial<Page> | Partial<Post> | Partial<Service> | Partial<City>

/**
 * Metadata from the doc's SEO tab. `meta.title` is used VERBATIM — stored
 * titles are curated to fit Google's ~60-char display limit. The short brand
 * suffix is only added to the fallback (doc title) case, and only when the
 * result still fits.
 */
export const generateMeta = async (args: { doc: SeoDoc | null }): Promise<Metadata> => {
  const { doc } = args

  const ogImage = getImageURL(doc?.meta?.image)
  const fallbackTitle = doc?.title
    ? doc.title.length + BRAND_SUFFIX.length + 3 <= 60
      ? `${doc.title} | ${BRAND_SUFFIX}`
      : doc.title
    : SITE_NAME
  const title = doc?.meta?.title || fallbackTitle

  const path =
    (doc && 'pathOverride' in doc && doc.pathOverride) || (doc?.slug ? `/${doc.slug}/` : '/')

  return {
    title,
    description: doc?.meta?.description,
    alternates: {
      canonical: path,
    },
    openGraph: mergeOpenGraph({
      description: doc?.meta?.description || '',
      images: ogImage ? [{ url: ogImage }] : undefined,
      title,
      url: path,
    }),
  }
}
