import type { CollectionConfig } from 'payload'

import {
  MetaDescriptionField,
  MetaImageField,
  MetaTitleField,
  OverviewField,
  PreviewField,
} from '@payloadcms/plugin-seo/fields'
import { slugField } from 'payload'

import { authenticated } from '../access/authenticated'
import { authenticatedOrPublished } from '../access/authenticatedOrPublished'
import { faqsField } from '../fields/faqs'
import { revalidateRootSlug, revalidateRootSlugDelete } from '../hooks/revalidateRootSlug'
import { validateUniqueRootSlug } from '../hooks/validateUniqueRootSlug'
import { generatePreviewPath } from '../utilities/generatePreviewPath'

import {
  FixedToolbarFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

const richText = lexicalEditor({
  features: ({ rootFeatures }) => [...rootFeatures, FixedToolbarFeature(), InlineToolbarFeature()],
})

export const Services: CollectionConfig<'services'> = {
  slug: 'services',
  access: {
    create: authenticated,
    delete: authenticated,
    read: authenticatedOrPublished,
    update: authenticated,
  },
  defaultPopulate: {
    title: true,
    slug: true,
    navLabel: true,
    shortDescription: true,
    cardImage: true,
  },
  admin: {
    group: 'Content',
    description:
      'The services you offer (one page each). Edit descriptions, photos and FAQs here. “Display Order” controls the order they appear in menus and on the homepage (lowest number first).',
    defaultColumns: ['title', 'slug', 'displayOrder', 'updatedAt'],
    livePreview: {
      url: ({ data, req }) =>
        generatePreviewPath({
          slug: data?.slug as string,
          collection: 'services',
          req,
        }),
    },
    preview: (data, { req }) =>
      generatePreviewPath({
        slug: data?.slug as string,
        collection: 'services',
        req,
      }),
    useAsTitle: 'title',
  },
  fields: [
    {
      name: 'title',
      type: 'text',
      required: true,
      admin: {
        description: 'Page H1, e.g. "Professional EV Charger Installation in Los Angeles, CA"',
      },
    },
    {
      name: 'navLabel',
      type: 'text',
      required: true,
      admin: {
        description: 'Short name used in menus and service cards, e.g. "EV Charger Installation"',
      },
    },
    {
      type: 'tabs',
      tabs: [
        {
          label: 'Hero',
          fields: [
            {
              name: 'heroSubheading',
              type: 'textarea',
            },
            {
              name: 'heroImage',
              type: 'upload',
              relationTo: 'media',
            },
            {
              name: 'showRatingBadge',
              type: 'checkbox',
              defaultValue: true,
            },
          ],
        },
        {
          label: 'Content',
          fields: [
            {
              name: 'shortDescription',
              type: 'textarea',
              required: true,
              admin: {
                description: 'Used on service cards across the site',
              },
            },
            {
              name: 'cardImage',
              type: 'upload',
              relationTo: 'media',
            },
            {
              name: 'intro',
              type: 'richText',
              editor: richText,
            },
            {
              name: 'features',
              type: 'array',
              maxRows: 4,
              admin: {
                description: 'Feature blocks, e.g. "Customized Solutions", "Code-Compliant Safety"',
                initCollapsed: true,
              },
              fields: [
                { name: 'title', type: 'text', required: true },
                { name: 'text', type: 'textarea', required: true },
              ],
            },
            {
              name: 'benefits',
              type: 'array',
              maxRows: 4,
              admin: {
                description: 'Benefit statements, e.g. safety, property value, efficiency',
                initCollapsed: true,
              },
              fields: [
                { name: 'title', type: 'text', required: true },
                { name: 'text', type: 'textarea', required: true },
              ],
            },
            {
              name: 'gallery',
              type: 'array',
              maxRows: 4,
              admin: {
                description: 'Project photos shown in the page body',
                initCollapsed: true,
              },
              fields: [
                {
                  name: 'image',
                  type: 'upload',
                  relationTo: 'media',
                  required: true,
                },
              ],
            },
            faqsField(),
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
            PreviewField({
              hasGenerateFn: true,
              titlePath: 'meta.title',
              descriptionPath: 'meta.description',
            }),
          ],
        },
      ],
    },
    {
      name: 'relatedPosts',
      type: 'relationship',
      relationTo: 'posts',
      hasMany: true,
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'displayOrder',
      type: 'number',
      defaultValue: 0,
      admin: {
        position: 'sidebar',
        description: 'Lower numbers appear first in cards and menus',
      },
    },
    slugField(),
  ],
  hooks: {
    afterChange: [revalidateRootSlug],
    afterDelete: [revalidateRootSlugDelete],
    beforeValidate: [validateUniqueRootSlug],
  },
  versions: {
    drafts: {
      autosave: {
        interval: 100,
      },
      schedulePublish: true,
    },
    maxPerDoc: 25,
  },
}
