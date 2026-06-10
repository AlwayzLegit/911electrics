import type { CollectionBeforeValidateHook, CollectionSlug } from 'payload'
import { APIError } from 'payload'

/**
 * Services, cities, posts and pages all render at root-level URLs
 * (/{slug}/), so a slug used in one collection must not exist in any of the
 * others — otherwise one document would silently shadow another.
 */
const ROOT_SLUG_COLLECTIONS: CollectionSlug[] = ['pages', 'posts', 'services', 'cities']

export const validateUniqueRootSlug: CollectionBeforeValidateHook = async ({
  collection,
  data,
  originalDoc,
  req,
}) => {
  const slug = data?.slug
  if (!slug || slug === originalDoc?.slug) return data

  for (const other of ROOT_SLUG_COLLECTIONS) {
    if (other === collection?.slug) continue
    const existing = await req.payload.find({
      collection: other,
      draft: true,
      limit: 1,
      overrideAccess: true,
      pagination: false,
      where: { slug: { equals: slug } },
    })
    if (existing.docs.length > 0) {
      throw new APIError(
        `The slug "${slug}" is already used by a document in the "${other}" collection. All root-level slugs must be unique across pages, posts, services and cities.`,
        400,
      )
    }
  }

  return data
}
