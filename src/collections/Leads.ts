import type { CollectionConfig } from 'payload'

import { authenticated } from '../access/authenticated'

/**
 * Every quote/contact form submission lands here — the database is the
 * source of truth; the email notification is best-effort. Status select
 * lets the owner use the admin list as a lightweight CRM.
 *
 * `create` is locked down: the public REST/GraphQL API cannot create leads.
 * The submit-lead server action writes with `overrideAccess: true` after
 * validation + spam checks.
 */
export const Leads: CollectionConfig = {
  slug: 'leads',
  access: {
    create: () => false,
    delete: authenticated,
    read: authenticated,
    update: authenticated,
  },
  admin: {
    group: 'Inbox',
    defaultColumns: ['name', 'phone', 'service', 'status', 'createdAt'],
    useAsTitle: 'name',
    description: 'Quote and contact form submissions. Newest first.',
  },
  defaultSort: '-createdAt',
  fields: [
    {
      name: 'status',
      type: 'select',
      defaultValue: 'new',
      options: [
        { label: 'New', value: 'new' },
        { label: 'Contacted', value: 'contacted' },
        { label: 'Quoted', value: 'quoted' },
        { label: 'Won', value: 'won' },
        { label: 'Lost', value: 'lost' },
        { label: 'Spam', value: 'spam' },
      ],
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'name',
      type: 'text',
      required: true,
    },
    {
      name: 'phone',
      type: 'text',
      required: true,
    },
    {
      name: 'email',
      type: 'email',
    },
    {
      name: 'service',
      type: 'text',
      admin: {
        description: 'Service requested in the form dropdown',
      },
    },
    {
      name: 'address',
      type: 'text',
    },
    {
      name: 'message',
      type: 'textarea',
    },
    {
      type: 'collapsible',
      label: 'Submission metadata',
      admin: {
        initCollapsed: true,
      },
      fields: [
        {
          name: 'sourcePath',
          type: 'text',
          admin: {
            description: 'Page the form was submitted from',
          },
        },
        {
          name: 'formLocation',
          type: 'select',
          options: [
            { label: 'Hero quote form', value: 'hero' },
            { label: 'Contact section', value: 'contact' },
            { label: 'Contact page', value: 'contact-page' },
          ],
        },
        {
          name: 'utm',
          type: 'group',
          fields: [
            { name: 'source', type: 'text' },
            { name: 'medium', type: 'text' },
            { name: 'campaign', type: 'text' },
            { name: 'term', type: 'text' },
            { name: 'content', type: 'text' },
          ],
        },
        {
          name: 'emailSent',
          type: 'checkbox',
          defaultValue: false,
          admin: {
            description: 'Whether the notification email was delivered',
          },
        },
        { name: 'ip', type: 'text' },
        { name: 'userAgent', type: 'text' },
      ],
    },
  ],
  timestamps: true,
}
