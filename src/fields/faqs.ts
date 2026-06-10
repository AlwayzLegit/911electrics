import type { ArrayField } from 'payload'

import {
  FixedToolbarFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

/**
 * Shared FAQ array field. Answers are rich text so they can carry internal
 * links (e.g. service pages linking to related blog posts) and render as
 * FAQPage JSON-LD on the frontend.
 */
export const faqsField = (overrides: Partial<ArrayField> = {}): ArrayField => ({
  name: 'faqs',
  type: 'array',
  labels: {
    singular: 'FAQ',
    plural: 'FAQs',
  },
  admin: {
    initCollapsed: true,
  },
  fields: [
    {
      name: 'question',
      type: 'text',
      required: true,
    },
    {
      name: 'answer',
      type: 'richText',
      required: true,
      editor: lexicalEditor({
        features: ({ rootFeatures }) => [
          ...rootFeatures,
          FixedToolbarFeature(),
          InlineToolbarFeature(),
        ],
      }),
    },
  ],
  ...overrides,
})
