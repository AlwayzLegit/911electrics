import type { CollectionConfig } from 'payload'

import { anyone } from '../access/anyone'
import { authenticated } from '../access/authenticated'

export const Testimonials: CollectionConfig = {
  slug: 'testimonials',
  access: {
    create: authenticated,
    delete: authenticated,
    read: anyone,
    update: authenticated,
  },
  admin: {
    defaultColumns: ['authorName', 'rating', 'source', 'featured', 'updatedAt'],
    useAsTitle: 'authorName',
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
