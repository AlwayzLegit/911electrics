import type { Payload } from 'payload'

/**
 * Pull the business's Google reviews into the Testimonials collection via the
 * Google Places API (New), and keep the Site Settings aggregate rating badge
 * in sync with the real Google profile.
 *
 * Google returns the five most relevant reviews for a place — the same set
 * the old WordPress site's reviews widget displayed. Reviews are upserted by
 * their stable Google resource name (`externalId`), so re-running never
 * duplicates and editors can safely tweak `featured`/`cities` afterwards:
 * only rating/text/date are refreshed on existing entries.
 */

const PLACE_ID = process.env.GOOGLE_PLACE_ID || 'ChIJF6lnmlDDwoARebR7r9k_oG0'

type GoogleReview = {
  name?: string
  rating?: number
  text?: { text?: string }
  originalText?: { text?: string }
  authorAttribution?: { displayName?: string }
  publishTime?: string
}

type PlaceDetails = {
  rating?: number
  userRatingCount?: number
  reviews?: GoogleReview[]
}

export type SyncResult = {
  created: number
  updated: number
  skipped: number
  rating?: number
  ratingCount?: number
}

export async function syncGoogleReviews(payload: Payload): Promise<SyncResult> {
  const apiKey = process.env.GOOGLE_PLACES_API_KEY
  if (!apiKey) {
    throw new Error(
      'GOOGLE_PLACES_API_KEY is not set. Create a Google Cloud API key with the Places API (New) enabled and add it to the environment.',
    )
  }

  const res = await fetch(`https://places.googleapis.com/v1/places/${PLACE_ID}`, {
    headers: {
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask': 'rating,userRatingCount,reviews',
    },
  })
  if (!res.ok) {
    throw new Error(`Google Places API responded ${res.status}: ${(await res.text()).slice(0, 300)}`)
  }
  const place = (await res.json()) as PlaceDetails

  let created = 0
  let updated = 0
  let skipped = 0

  for (const review of place.reviews ?? []) {
    const text = review.text?.text || review.originalText?.text
    // Rating-only reviews have no text to display
    if (!review.name || !review.rating || !text) {
      skipped++
      continue
    }

    const { docs } = await payload.find({
      collection: 'testimonials',
      limit: 1,
      overrideAccess: true,
      where: { externalId: { equals: review.name } },
    })

    if (docs[0]) {
      // Refresh content only — leave featured/cities curation to editors
      await payload.update({
        collection: 'testimonials',
        id: docs[0].id,
        overrideAccess: true,
        data: {
          rating: review.rating,
          text,
          date: review.publishTime,
        },
      })
      updated++
    } else {
      await payload.create({
        collection: 'testimonials',
        overrideAccess: true,
        data: {
          authorName: review.authorAttribution?.displayName || 'Google user',
          rating: review.rating,
          text,
          source: 'google',
          date: review.publishTime,
          externalId: review.name,
          featured: true,
        },
      })
      created++
    }
  }

  // Keep the "5.0 RATING" badge and schema.org aggregateRating honest
  if (place.rating && place.userRatingCount) {
    await payload.updateGlobal({
      slug: 'siteSettings',
      overrideAccess: true,
      data: {
        aggregateRating: { value: place.rating, count: place.userRatingCount },
      },
    })
  }

  return {
    created,
    updated,
    skipped,
    rating: place.rating,
    ratingCount: place.userRatingCount,
  }
}
