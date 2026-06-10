import 'dotenv/config'

import { getPayload } from 'payload'

import configPromise from '../../src/payload.config'

// The 22 MB WP hero video isn't used by the new design — drop it from the
// media library (original remains in wp-snapshot/media, re-downloadable).
const payload = await getPayload({ config: await configPromise })
const { docs } = await payload.find({
  collection: 'media',
  limit: 5,
  where: { filename: { contains: 'Hero-Video' } },
})
for (const doc of docs) {
  await payload.delete({ collection: 'media', id: doc.id, context: { disableRevalidate: true } })
  console.log(`deleted media: ${doc.filename}`)
}
process.exit(0)
