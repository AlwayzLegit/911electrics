import type { CollectionConfig } from 'payload'

import { revalidatePath, revalidateTag } from 'next/cache'

import { anyone } from '../access/anyone'
import { authenticated } from '../access/authenticated'

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
  access: {
    create: authenticated,
    delete: authenticated,
    read: anyone,
    update: authenticated,
  },
  admin: {
    group: 'Content',
    defaultColumns: ['authorName', 'rating', 'source', 'featured', 'updatedAt'],
    useAsTitle: 'authorName',
  },
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
  ],
}
