import type { GlobalConfig } from 'payload'

import { revalidatePath } from 'next/cache'

import { authenticated } from '../../access/authenticated'

export const SiteSettings: GlobalConfig = {
  slug: 'siteSettings',
  label: 'Site Settings',
  access: {
    read: () => true,
    update: authenticated,
  },
  admin: {
    description: 'Business identity used across the site (header, footer, schema.org, contact).',
  },
  fields: [
    {
      type: 'tabs',
      tabs: [
        {
          label: 'Business',
          fields: [
            {
              name: 'businessName',
              type: 'text',
              required: true,
              defaultValue: '911 Construction & Electric Inc.',
            },
            {
              name: 'licenseNumber',
              type: 'text',
              required: true,
              defaultValue: '1027421',
            },
            {
              name: 'phone',
              type: 'text',
              required: true,
              defaultValue: '747-255-8595',
              admin: { description: 'Display format. Digits are extracted for tel: links.' },
            },
            {
              name: 'email',
              type: 'email',
              required: true,
              defaultValue: 'info@911electrics.com',
            },
            {
              name: 'address',
              type: 'group',
              fields: [
                { name: 'street', type: 'text', defaultValue: '1308 East Colorado Blvd Ste 141' },
                { name: 'city', type: 'text', defaultValue: 'Pasadena' },
                { name: 'state', type: 'text', defaultValue: 'CA' },
                { name: 'zip', type: 'text', defaultValue: '91106' },
              ],
            },
            {
              name: 'geo',
              type: 'group',
              admin: { description: 'Coordinates for LocalBusiness schema and the map embed' },
              fields: [
                { name: 'lat', type: 'number', defaultValue: 34.1453 },
                { name: 'lng', type: 'number', defaultValue: -118.1182 },
              ],
            },
            {
              name: 'hoursLabel',
              type: 'text',
              defaultValue: '24/7 Emergency Service',
            },
          ],
        },
        {
          label: 'Web Presence',
          fields: [
            {
              name: 'socials',
              type: 'array',
              admin: { initCollapsed: true },
              fields: [
                {
                  name: 'platform',
                  type: 'select',
                  required: true,
                  options: [
                    { label: 'Facebook', value: 'facebook' },
                    { label: 'Instagram', value: 'instagram' },
                    { label: 'X (Twitter)', value: 'x' },
                    { label: 'Pinterest', value: 'pinterest' },
                    { label: 'Google', value: 'google' },
                    { label: 'Yelp', value: 'yelp' },
                  ],
                },
                { name: 'url', type: 'text', required: true },
              ],
            },
            {
              name: 'aggregateRating',
              type: 'group',
              admin: {
                description:
                  'Shown in the rating badge and schema.org markup. Keep in sync with the real Google Business profile.',
              },
              fields: [
                { name: 'value', type: 'number', defaultValue: 5, min: 0, max: 5 },
                { name: 'count', type: 'number', defaultValue: 0 },
              ],
            },
            {
              name: 'logo',
              type: 'upload',
              relationTo: 'media',
            },
            {
              name: 'defaultOGImage',
              type: 'upload',
              relationTo: 'media',
            },
          ],
        },
      ],
    },
  ],
  hooks: {
    afterChange: [
      ({ doc }) => {
        // NAP / license data appears on every page (header, footer, schema)
        revalidatePath('/', 'layout')
        return doc
      },
    ],
  },
}
