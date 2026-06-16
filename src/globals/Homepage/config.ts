import type { GlobalConfig } from 'payload'

import { revalidatePath } from 'next/cache'

import {
  MetaDescriptionField,
  MetaImageField,
  MetaTitleField,
  OverviewField,
} from '@payloadcms/plugin-seo/fields'

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

export const Homepage: GlobalConfig = {
  slug: 'homepage',
  access: {
    read: () => true,
    update: authenticated,
  },
  admin: {
    group: 'Content',
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
              defaultValue: 'Licensed Electrician in Los Angeles, CA',
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
              defaultValue: 'Electrical Solutions We Offer',
            },
            {
              name: 'servicesIntro',
              type: 'textarea',
            },
            {
              name: 'aboutHeading',
              type: 'text',
              defaultValue: 'Why Choose 911 Construction & Electric',
            },
            {
              name: 'aboutBody',
              type: 'richText',
              editor: richText,
            },
            {
              name: 'aboutImage',
              type: 'upload',
              relationTo: 'media',
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
            {
              name: 'reviewsHeading',
              type: 'text',
              defaultValue: 'What Our Customers Say',
            },
            faqsField({ admin: { initCollapsed: true } }),
            {
              name: 'contactHeading',
              type: 'text',
              defaultValue: 'Get Your Free Quote Today',
            },
            {
              name: 'contactBody',
              type: 'textarea',
            },
          ],
        },
        {
          name: 'meta',
          label: 'SEO',
          fields: [
            OverviewField({
              titlePath: 'meta.title',
              descriptionPath: 'meta.description',
              imagePath: 'meta.image',
            }),
            MetaTitleField({ hasGenerateFn: true }),
            MetaImageField({ relationTo: 'media' }),
            MetaDescriptionField({}),
          ],
        },
      ],
    },
  ],
  hooks: {
    afterChange: [
      ({ doc, req: { context } }) => {
        if (!context.disableRevalidate) revalidatePath('/')
        return doc
      },
    ],
  },
}
