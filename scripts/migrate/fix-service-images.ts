import 'dotenv/config'

import { getPayload } from 'payload'

import configPromise from '../../src/payload.config'

/**
 * The first migration used each page's og:image (a generic rating banner)
 * for service cards/heroes. The WP homepage actually paired each service
 * with a real project photo — restore that mapping.
 */
const IMAGE_BY_SLUG: Record<string, string> = {
  'electrical-repairs-los-angeles-ca': 'IMG_2784.jpg',
  'electrical-panel-upgrades-los-angeles-ca': 'IMG_2782.jpg',
  'ev-charger-installation-los-angeles-ca': 'cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2.avif',
  'new-construction-electrical-los-angeles-ca': 'IMG_2785.jpg',
  'lighting-installation-upgrades-los-angeles-ca': 'IMG_2787.jpg',
  'emergency-electrician-los-angeles-ca': 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2.avif',
}

const payload = await getPayload({ config: await configPromise })

for (const [slug, filename] of Object.entries(IMAGE_BY_SLUG)) {
  const media = await payload.find({
    collection: 'media',
    limit: 1,
    where: { filename: { equals: filename } },
  })
  if (!media.docs[0]) {
    console.warn(`media not found: ${filename}`)
    continue
  }
  const services = await payload.find({
    collection: 'services',
    limit: 1,
    where: { slug: { equals: slug } },
  })
  if (!services.docs[0]) {
    console.warn(`service not found: ${slug}`)
    continue
  }
  await payload.update({
    collection: 'services',
    id: services.docs[0].id,
    context: { disableRevalidate: true },
    data: { cardImage: media.docs[0].id, heroImage: media.docs[0].id },
  })
  console.log(`${slug} -> ${filename}`)
}
process.exit(0)
