import 'dotenv/config'

import { readFile } from 'fs/promises'
import { JSDOM } from 'jsdom'
import path from 'path'
import { getPayload } from 'payload'

import configPromise from '../../src/payload.config'

/**
 * Audit data fixes:
 * 1. cityPageTemplate.servicesHeading had grabbed the process H2 ("...Made
 *    Simple...") because both match /Services/i — set the real one.
 * 2. Hero backdrops were og:image rating banners / logos — use real project
 *    photos (ballroom lighting for homepage, staircase for city pages).
 */
const SNAP = path.resolve(process.cwd(), 'wp-snapshot')
const clean = (s: string | null | undefined) => s?.replace(/\s+/g, ' ').trim() ?? ''

const payload = await getPayload({ config: await configPromise })

const mediaIdByFilename = async (filename: string) => {
  const { docs } = await payload.find({
    collection: 'media',
    limit: 1,
    where: { filename: { equals: filename } },
  })
  return docs[0]?.id
}

// ---- 1. City template services heading/intro ----
{
  const html = await readFile(path.join(SNAP, 'html', 'electrician-glendale-ca.html'), 'utf8')
  const doc = new JSDOM(html).window.document
  const tokenize = (s: string) => s.replace(/Glendale/g, '{{city}}')

  const servicesH2 = [...doc.querySelectorAll('h2')].find((h) =>
    /Professional Electrical Services/i.test(h.textContent ?? ''),
  )
  let servicesIntro = ''
  if (servicesH2) {
    const all = [...doc.querySelectorAll('h2, .elementor-widget-text-editor .elementor-widget-container')]
    const idx = all.indexOf(servicesH2)
    for (let i = idx + 1; i < all.length; i++) {
      if (all[i].tagName === 'H2') break
      const text = clean(all[i].textContent)
      if (text.length > 80) {
        servicesIntro = text
        break
      }
    }
  }

  await payload.updateGlobal({
    slug: 'cityPageTemplate',
    context: { disableRevalidate: true },
    data: {
      servicesHeading: servicesH2
        ? tokenize(clean(servicesH2.textContent))
        : 'Professional Electrical Services in {{city}}, CA',
      ...(servicesIntro ? { servicesIntro: tokenize(servicesIntro) } : {}),
      heroImage: await mediaIdByFilename('IMG_2787.jpg'),
    },
  })
  console.log(`cityPageTemplate: servicesHeading fixed, intro=${!!servicesIntro}, heroImage=IMG_2787`)
}

// ---- 2. Homepage hero backdrop ----
{
  await payload.updateGlobal({
    slug: 'homepage',
    context: { disableRevalidate: true },
    data: { heroImage: await mediaIdByFilename('IMG_2783.jpg') },
  })
  console.log('homepage: heroImage=IMG_2783 (ballroom lighting project)')
}

process.exit(0)
