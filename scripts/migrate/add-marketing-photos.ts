import 'dotenv/config'

import path from 'path'
import { fileURLToPath } from 'url'
import { getPayload } from 'payload'

import configPromise from '../../src/payload.config'

/**
 * Import the professional 911 Construction & Electric photo set into the Media
 * library and wire the strongest shots into the homepage and each service.
 *
 * Idempotent:
 *   - media is matched by filename and only uploaded once (re-runs reuse the
 *     existing record, so resized variants in public/media aren't regenerated);
 *   - homepage + service image fields are simply re-pointed each run.
 *
 * Run against the target database with:
 *   pnpm payload run scripts/migrate/add-marketing-photos.ts
 *
 * Uploading creates the original + resized variants under public/media (Payload
 * generates them via sharp). Commit those generated files so Vercel serves them.
 */

const dirname = path.dirname(fileURLToPath(import.meta.url))
const PHOTO_DIR = path.join(dirname, 'marketing-photos')

/** filename -> alt text. Alt doubles as SEO/accessibility copy. */
const PHOTOS: Record<string, string> = {
  '911-construction-electric-technician-handshake.jpg':
    '911 Construction & Electric technician shaking hands with a homeowner beside the company van',
  'electrical-outlet-troubleshooting-multimeter.jpg':
    'Electrician troubleshooting a wall outlet with a multimeter',
  'electrical-panel-inspection-flashlight.jpg':
    'Electrician inspecting an electrical panel against the wiring schematic with a flashlight',
  'electrical-wiring-rough-in-voltage-tester.jpg':
    'Electrician checking rough-in wiring with a non-contact voltage tester',
  'commercial-electrical-consultation-walkthrough.jpg':
    '911 Construction & Electric electrician walking a client through a commercial building',
  'electrical-panel-wiring-repair.jpg':
    'Electrician repairing breaker panel wiring with strippers and a wire connector',
  'emergency-electrical-panel-service.jpg':
    'Emergency electrician servicing an electrical panel by flashlight',
  'new-construction-electrical-framing.jpg':
    '911 Construction & Electric electrician running conduit through metal framing on a new build',
  'commercial-office-electrical-buildout.jpg':
    'Commercial office electrical build-out with recessed lighting and cabling',
  'recessed-lighting-installation.jpg':
    'Electrician installing a recessed ceiling light from a scaffold',
  'electrician-replacing-ceiling-light-fixture.jpg':
    'Electrician replacing a ceiling light fixture using a headlamp and meter',
  'smart-thermostat-installation.jpg': 'Electrician wiring a smart thermostat on a wall',
  'light-switch-installation.jpg': 'Electrician installing a light switch in a residential wall',
}

/** service slug -> { heroImage, cardImage } filenames. */
const SERVICE_IMAGES: Record<string, { hero: string; card: string }> = {
  'electrical-repairs-los-angeles-ca': {
    hero: 'electrical-outlet-troubleshooting-multimeter.jpg',
    card: 'light-switch-installation.jpg',
  },
  'electrical-panel-upgrades-los-angeles-ca': {
    hero: 'electrical-panel-inspection-flashlight.jpg',
    card: 'electrical-panel-wiring-repair.jpg',
  },
  'ev-charger-installation-los-angeles-ca': {
    hero: 'electrical-wiring-rough-in-voltage-tester.jpg',
    card: 'smart-thermostat-installation.jpg',
  },
  'new-construction-electrical-los-angeles-ca': {
    hero: 'new-construction-electrical-framing.jpg',
    card: 'commercial-office-electrical-buildout.jpg',
  },
  'lighting-installation-upgrades-los-angeles-ca': {
    hero: 'recessed-lighting-installation.jpg',
    card: 'electrician-replacing-ceiling-light-fixture.jpg',
  },
  'emergency-electrician-los-angeles-ca': {
    hero: 'emergency-electrical-panel-service.jpg',
    card: 'emergency-electrical-panel-service.jpg',
  },
}

const HOMEPAGE_HERO = '911-construction-electric-technician-handshake.jpg'
const HOMEPAGE_ABOUT = 'commercial-electrical-consultation-walkthrough.jpg'

const payload = await getPayload({ config: await configPromise })

const mediaIds = new Map<string, number | string>()

// ------------------------------------------------------------------
// 1. Upload (or reuse) every photo in the Media library
// ------------------------------------------------------------------
for (const [filename, alt] of Object.entries(PHOTOS)) {
  const existing = await payload.find({
    collection: 'media',
    limit: 1,
    where: { filename: { equals: filename } },
  })
  if (existing.docs[0]) {
    mediaIds.set(filename, existing.docs[0].id)
    console.log(`media exists: ${filename}`)
    continue
  }
  try {
    const doc = await payload.create({
      collection: 'media',
      data: { alt },
      filePath: path.join(PHOTO_DIR, filename),
    })
    mediaIds.set(filename, doc.id)
    console.log(`media uploaded: ${filename}`)
  } catch (err) {
    console.warn(`media FAILED: ${filename} — ${(err as Error).message}`)
  }
}

const idFor = (filename: string): number | string | undefined => mediaIds.get(filename)

// ------------------------------------------------------------------
// 2. Homepage hero + about
// ------------------------------------------------------------------
{
  const heroImage = idFor(HOMEPAGE_HERO)
  const aboutImage = idFor(HOMEPAGE_ABOUT)
  if (heroImage || aboutImage) {
    await payload.updateGlobal({
      slug: 'homepage',
      context: { disableRevalidate: true },
      data: {
        ...(heroImage ? { heroImage } : {}),
        ...(aboutImage ? { aboutImage } : {}),
      },
    })
    console.log('homepage hero/about images set')
  }
}

// ------------------------------------------------------------------
// 3. Services — hero + card image per slug
// ------------------------------------------------------------------
for (const [slug, imgs] of Object.entries(SERVICE_IMAGES)) {
  const heroImage = idFor(imgs.hero)
  const cardImage = idFor(imgs.card)
  if (!heroImage && !cardImage) continue

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
    data: {
      ...(heroImage ? { heroImage } : {}),
      ...(cardImage ? { cardImage } : {}),
    },
  })
  console.log(`service images set: ${slug}`)
}

console.log('\nMarketing photos imported.')
process.exit(0)
