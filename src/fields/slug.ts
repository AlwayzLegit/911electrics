import type { Field } from 'payload'
import { slugField as payloadSlugField } from 'payload'

type SlugFieldArgs = Parameters<typeof payloadSlugField>[0]

/**
 * Stable wrapper around Payload's (experimental) `slugField`.
 *
 * The upstream `slugField` renders the `slug` text input with a custom client
 * component (`@payloadcms/next/client#SlugField`). On Next 16 / React 19 that
 * component enters an infinite render loop (React error #185 — "Maximum update
 * depth exceeded") the moment you type in the document's title, crashing the
 * whole edit view.
 *
 * We keep everything else identical — same field names, same DB columns
 * (`slug` + `generate_slug`), and the same server-side `generateSlug`
 * beforeChange hook on the checkbox — so slugs still auto-generate from the
 * title on save. We only strip the buggy client component, so the slug renders
 * as a plain (still editable) text input. No schema change, no migration.
 */
export const slugField = (args?: SlugFieldArgs): Field => {
  const field = payloadSlugField(args)

  if (field.type === 'row') {
    const slugName = args?.name ?? 'slug'
    for (const sub of field.fields) {
      if ('name' in sub && sub.name === slugName && sub.admin?.components) {
        delete sub.admin.components
      }
    }
  }

  return field
}
