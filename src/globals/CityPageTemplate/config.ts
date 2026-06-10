import type { GlobalConfig } from 'payload'

import { revalidatePath } from 'next/cache'

import {
  FixedToolbarFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

import { authenticated } from '../../access/authenticated'
import { faqsField } from '../../fields/faqs'

const richText = lexicalEditor({
  features: ({ rootFeatures }) => [...rootFeatures, FixedToolbarFeature(), InlineToolbarFeature()],
})

/**
 * Shared template for all /electrician-{city}-ca/ pages. Write copy once
 * with {{city}} (and {{region}}) tokens — every city page renders from it,
 * with per-city overrides from the `cities` collection taking precedence.
 */
export const CityPageTemplate: GlobalConfig = {
  slug: 'cityPageTemplate',
  label: 'City Page Template',
  access: {
    read: () => true,
    update: authenticated,
  },
  admin: {
    description:
      'Shared sections for every city page. Use {{city}} where the city name should appear, e.g. "Trusted Electrician in {{city}}, CA".',
  },
  fields: [
    {
      type: 'tabs',
      tabs: [
        {
          label: 'Hero',
          fields: [
            {
              name: 'heroHeading',
              type: 'text',
              required: true,
              defaultValue: 'Electrician in {{city}}, CA for Repairs, Panel Upgrades & EV Chargers',
            },
            {
              name: 'heroSubheading',
              type: 'textarea',
            },
            {
              name: 'heroImage',
              type: 'upload',
              relationTo: 'media',
            },
          ],
        },
        {
          label: 'Sections',
          fields: [
            {
              name: 'intro',
              type: 'richText',
              editor: richText,
            },
            {
              name: 'processHeading',
              type: 'text',
              defaultValue: 'From Consultation to Completion in 3 Easy Steps',
            },
            {
              name: 'processSteps',
              type: 'array',
              maxRows: 3,
              fields: [
                { name: 'title', type: 'text', required: true },
                { name: 'text', type: 'textarea', required: true },
              ],
            },
            {
              name: 'servicesHeading',
              type: 'text',
              defaultValue: 'Our Electrical Services in {{city}}, CA',
            },
            {
              name: 'servicesIntro',
              type: 'textarea',
            },
            {
              name: 'aboutHeading',
              type: 'text',
            },
            {
              name: 'aboutBody',
              type: 'richText',
              editor: richText,
            },
            {
              name: 'differentiators',
              type: 'array',
              admin: { initCollapsed: true },
              fields: [
                { name: 'title', type: 'text', required: true },
                { name: 'text', type: 'textarea', required: true },
              ],
            },
            faqsField({
              admin: {
                initCollapsed: true,
                description: 'Default FAQ set — {{city}} tokens work here too',
              },
            }),
            {
              name: 'ctaHeading',
              type: 'text',
              defaultValue: 'Need an Electrician in {{city}}? Call Us 24/7',
            },
            {
              name: 'ctaBody',
              type: 'textarea',
            },
          ],
        },
      ],
    },
  ],
  hooks: {
    afterChange: [
      ({ doc, req: { context } }) => {
        // The template feeds all ~43 city pages — revalidate everything
        if (!context.disableRevalidate) revalidatePath('/', 'layout')
        return doc
      },
    ],
  },
}
