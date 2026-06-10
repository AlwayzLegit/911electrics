import 'dotenv/config'
import { getPayload } from 'payload'
import configPromise from '../../src/payload.config'
const payload = await getPayload({ config: await configPromise })
const { docs } = await payload.find({ collection: 'posts', limit: 100, pagination: false })
const decode = (s) => s.replace(/&#0?38;/g, '&').replace(/&#0?39;/g, "'").replace(/&amp;/g, '&')
for (const p of docs) {
  const fixed = decode(p.title)
  if (fixed !== p.title) {
    await payload.update({ collection: 'posts', id: p.id, context: { disableRevalidate: true }, data: { title: fixed } })
    console.log('fixed:', fixed)
  }
}
process.exit(0)
