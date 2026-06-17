import type { CollectionConfig } from 'payload'

import { revalidatePath, revalidateTag } from 'next/cache'

import { anyone } from '../access/anyone'
import { authenticated } from '../access/authenticated'
import { syncGoogleReviews } from '../lib/sync-google-reviews'

// Testimonials render on the homepage carousel and on city pages — bust
// the cached list and re-render those pages whenever one changes.
const revalidateTestimonials = ({ doc, req }: { doc: unknown; req: { context: { disableRevalidate?: unknown } } }) => {
  if (!req.context.disableRevalidate) {
    revalidateTag('testimonials', 'max')
    revalidatePath('/', 'layout')
  }
  return doc
}

export const Testimonials: CollectionConfig = {
  slug: 'testimonials',
  labels: { singular: 'Review', plural: 'Reviews' },
  access: {
    create: authenticated,
    delete: authenticated,
    read: anyone,
    update: authenticated,
  },
  admin: {
    group: 'Content',
    description:
      'Customer reviews shown on the site. Use “Sync Google Reviews” to pull the latest from your Google profile, or add one by hand. Turn on “Featured” to show it on the homepage.',
    components: {
      beforeListTable: ['@/components/SyncGoogleReviews'],
    },
    defaultColumns: ['authorName', 'rating', 'source', 'featured', 'updatedAt'],
    useAsTitle: 'authorName',
  },
  endpoints: [
    {
      // Admin "Sync Google Reviews" button
      path: '/sync-google',
      method: 'post',
      handler: async (req) => {
        if (!req.user) {
          return Response.json({ message: 'Unauthorized' }, { status: 401 })
        }
        try {
          const result = await syncGoogleReviews(req.payload)
          return Response.json(result)
        } catch (err) {
          req.payload.logger.error({ err }, 'Google reviews sync failed')
          return Response.json(
            { message: err instanceof Error ? err.message : 'Sync failed' },
            { status: 500 },
          )
        }
      },
    },
    {
      // Scheduled sync — Vercel cron sends GET with the CRON_SECRET bearer
      path: '/sync-google',
      method: 'get',
      handler: async (req) => {
        const secret = process.env.CRON_SECRET
        const authorized =
          Boolean(req.user) ||
          (Boolean(secret) && req.headers.get('authorization') === `Bearer ${secret}`)
        if (!authorized) {
          return Response.json({ message: 'Unauthorized' }, { status: 401 })
        }
        try {
          const result = await syncGoogleReviews(req.payload)
          return Response.json(result)
        } catch (err) {
          req.payload.logger.error({ err }, 'Scheduled Google reviews sync failed')
          return Response.json(
            { message: err instanceof Error ? err.message : 'Sync failed' },
            { status: 500 },
          )
        }
      },
    },
  ],
  hooks: {
    afterChange: [revalidateTestimonials],
    afterDelete: [revalidateTestimonials],
  },
  fields: [
    {
      name: 'authorName',
      type: 'text',
      required: true,
    },
    {
      name: 'location',
      type: 'text',
      admin: {
        description: 'e.g. "Glendale, CA"',
      },
    },
    {
      name: 'rating',
      type: 'number',
      defaultValue: 5,
      min: 1,
      max: 5,
      required: true,
    },
    {
      name: 'text',
      type: 'textarea',
      required: true,
    },
    {
      name: 'source',
      type: 'select',
      defaultValue: 'google',
      options: [
        { label: 'Google', value: 'google' },
        { label: 'Yelp', value: 'yelp' },
        { label: 'Facebook', value: 'facebook' },
        { label: 'Direct', value: 'direct' },
      ],
    },
    {
      name: 'date',
      type: 'date',
    },
    {
      name: 'featured',
      type: 'checkbox',
      defaultValue: false,
      admin: {
        position: 'sidebar',
        description: 'Featured testimonials appear on the homepage carousel',
      },
    },
    {
      name: 'cities',
      type: 'relationship',
      relationTo: 'cities',
      hasMany: true,
      admin: {
        position: 'sidebar',
        description: 'City pages this testimonial can appear on',
      },
    },
    {
      name: 'externalId',
      type: 'text',
      index: true,
      admin: {
        readOnly: true,
        position: 'sidebar',
        description: 'Google review resource ID — set by the sync, used to avoid duplicates',
      },
    },
  ],
}
