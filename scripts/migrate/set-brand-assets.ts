import 'dotenv/config'

import { getPayload } from 'payload'

import configPromise from '../../src/payload.config'

/**
 * Wire the real company logo (migrated from the live WordPress site into the
 * Media library) into Site Settings, so the header, schema.org logo/image and
 * default OG card all resolve to the admin-managed asset rather than the
 * bundled fallback. Idempotent — safe to run repeatedly.
 *
 *   pnpm payload run scripts/migrate/set-brand-assets.ts
 */
const payload = await getPayload({ config: await configPromise })

const findMedia = async (filename: string): Promise<number | null> => {
  const { docs } = await payload.find({
    collection: 'media',
    limit: 1,
    where: { filename: { equals: filename } },
  })
  if (!docs[0]) {
    console.warn(`! media not found: ${filename}`)
    return null
  }
  return docs[0].id as number
}

// Header logo — transparent landscape lockup used on the live site header.
const logo = await findMedia('911CE-removebg-preview.png')
// Default social card — logo on a white 1200x630-friendly canvas.
const ogImage = await findMedia(
  '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background.png',
)

await payload.updateGlobal({
  slug: 'siteSettings',
  context: { disableRevalidate: true },
  data: {
    ...(logo ? { logo } : {}),
    ...(ogImage ? { defaultOGImage: ogImage } : {}),
  },
})

console.log('Site Settings brand assets set:', { logo, ogImage })
process.exit(0)
