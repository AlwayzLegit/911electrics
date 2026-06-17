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

/**
 * One document per service-area city (e.g. /electrician-glendale-ca/).
 *
 * Pages are rendered from the shared `cityPageTemplate` global ({{city}}
 * tokens substituted with `cityName`). Every field in the Overrides tab is
 * optional — when set, it replaces the corresponding template section for
 * this city only.
 */
export const Cities: CollectionConfig<'cities'> = {
  slug: 'cities',
  labels: { singular: 'Service Area Page', plural: 'Service Area Pages' },
  access: {
    create: authenticated,
    delete: authenticated,
    read: authenticatedOrPublished,
    update: authenticated,
  },
  defaultPopulate: {
    title: true,
    slug: true,
    cityName: true,
  },
  admin: {
    group: 'Content',
    description:
      'One landing page per city you serve. They share a common template — fill in a city’s own intro, neighborhoods and FAQs to make its page unique (recommended for SEO).',
    defaultColumns: ['cityName', 'slug', 'updatedAt'],
    livePreview: {
      url: ({ data, req }) =>
        generatePreviewPath({
          slug: data?.slug as string,
          collection: 'cities',
          req,
        }),
    },
    preview: (data, { req }) =>
      generatePreviewPath({
        slug: data?.slug as string,
        collection: 'cities',
        req,
      }),
    useAsTitle: 'cityName',
  },
  fields: [
    {
      name: 'cityName',
      type: 'text',
      required: true,
      admin: {
        description: 'Substituted for {{city}} in the city page template, e.g. "Glendale"',
      },
    },
    {
      name: 'region',
      type: 'text',
      admin: {
        description: 'Optional, substituted for {{region}}, e.g. "the San Fernando Valley"',
      },
    },
    {
      name: 'title',
      type: 'text',
      admin: {
        description:
          'Auto-generated if left empty: "Electrician in {cityName}, CA". Used as SEO title fallback.',
      },
      hooks: {
        beforeValidate: [
          ({ siblingData, value }) => value || `Electrician in ${siblingData?.cityName}, CA`,
        ],
      },
    },
    {
      type: 'tabs',
      tabs: [
        {
          label: 'Overrides',
          description:
            'All fields optional. When set, they replace the matching section of the shared city page template for this city.',
          fields: [
            {
              name: 'heroHeadingOverride',
              type: 'text',
            },
            {
              name: 'introOverride',
              type: 'richText',
              editor: richText,
            },
            {
              name: 'localNotes',
              type: 'richText',
              editor: richText,
              admin: {
                description:
                  'City-specific content (permits, rebates, common local issues). Rendered as an extra section — strongly recommended for SEO uniqueness.',
              },
            },
            {
              name: 'neighborhoods',
              type: 'array',
              admin: { initCollapsed: true },
              fields: [{ name: 'name', type: 'text', required: true }],
            },
            {
              name: 'zipCodes',
              type: 'array',
              admin: { initCollapsed: true },
              fields: [{ name: 'zip', type: 'text', required: true }],
            },
            faqsField({
              name: 'faqsOverride',
              admin: {
                initCollapsed: true,
                description: 'Replaces the template FAQ set when filled in',
              },
            }),
            {
              name: 'featuredTestimonials',
              type: 'relationship',
              relationTo: 'testimonials',
              hasMany: true,
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
      name: 'pathOverride',
      type: 'text',
      admin: {
        position: 'sidebar',
        description:
          'Only for pages that do not live at /{slug}/ — e.g. the Los Angeles page at /services/los-angeles-ca/. Include leading and trailing slashes.',
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
