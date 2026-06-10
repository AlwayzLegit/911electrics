import type { CollectionAfterChangeHook, CollectionAfterDeleteHook } from 'payload'

import { revalidatePath, revalidateTag } from 'next/cache'

type RootSlugDoc = {
  id: number | string
  _status?: string | null
  pathOverride?: string | null
  slug?: string | null
}

const docPath = (doc: RootSlugDoc): string =>
  doc.pathOverride?.replace(/\/$/, '') || `/${doc.slug}`

/**
 * Generic revalidation hooks for documents that render at root-level URLs
 * (/{slug}/). Used by services, cities and posts so the owner can publish
 * from the admin panel and see changes live without a redeploy.
 */
export const revalidateRootSlug: CollectionAfterChangeHook<RootSlugDoc> = ({
  collection,
  doc,
  previousDoc,
  req: { payload, context },
}) => {
  if (!context.disableRevalidate) {
    if (doc._status === 'published' && doc.slug) {
      const path = docPath(doc)
      payload.logger.info(`Revalidating path: ${path}`)
      revalidatePath(path)
      revalidateTag('sitemap', 'max')
      // Bust cached nav/card lists derived from this collection
      revalidateTag(collection.slug, 'max')
    }

    if (previousDoc?._status === 'published' && doc._status !== 'published' && previousDoc.slug) {
      const oldPath = docPath(previousDoc)
      payload.logger.info(`Revalidating old path: ${oldPath}`)
      revalidatePath(oldPath)
      revalidateTag('sitemap', 'max')
      revalidateTag(collection.slug, 'max')
    }
  }
  return doc
}

export const revalidateRootSlugDelete: CollectionAfterDeleteHook<RootSlugDoc> = ({
  collection,
  doc,
  req: { context },
}) => {
  if (!context.disableRevalidate && doc?.slug) {
    revalidatePath(docPath(doc))
    revalidateTag('sitemap', 'max')
    revalidateTag(collection.slug, 'max')
  }
  return doc
}
