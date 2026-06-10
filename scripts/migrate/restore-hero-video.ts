import 'dotenv/config'
import { getPayload } from 'payload'
import configPromise from '../../src/payload.config'
const payload = await getPayload({ config: await configPromise })
const existing = await payload.find({ collection: 'media', limit: 1, where: { filename: { equals: 'Hero-Video.mp4' } } })
if (existing.docs.length === 0) {
  await payload.create({ collection: 'media', data: { alt: '911 Construction & Electric promotional video' }, filePath: 'wp-snapshot/media/2026/02/Hero-Video.mp4' })
  console.log('hero video restored to media library')
} else { console.log('already present') }
process.exit(0)
