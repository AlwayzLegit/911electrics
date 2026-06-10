import 'dotenv/config'

import { readFile } from 'fs/promises'
import path from 'path'
import { getPayload } from 'payload'

import { interpolateString } from '../../src/lib/interpolate'
import configPromise from '../../src/payload.config'

/**
 * The WP city pages used two H1 variants. Port each page's H1 verbatim:
 * when the old H1 differs from the interpolated template heading, store it
 * as the city's heroHeadingOverride.
 */
const SNAP = path.resolve(process.cwd(), 'wp-snapshot')

const payload = await getPayload({ config: await configPromise })
const template = await payload.findGlobal({ slug: 'cityPageTemplate' })

const seoSummary: { url: string; h1?: string }[] = JSON.parse(
  await readFile(path.join(SNAP, 'seo-summary.json'), 'utf8'),
)
const h1ByPath = new Map(seoSummary.map((e) => [new URL(e.url).pathname, e.h1?.trim()]))

const { docs: cities } = await payload.find({
  collection: 'cities',
  limit: 100,
  pagination: false,
})

let updated = 0
for (const city of cities) {
  const pagePath = city.pathOverride || `/${city.slug}/`
  const oldH1 = h1ByPath.get(pagePath)
  if (!oldH1) continue
  const templated = interpolateString(template.heroHeading, { city: city.cityName })
  if (oldH1 !== templated && oldH1 !== city.heroHeadingOverride) {
    await payload.update({
      collection: 'cities',
      id: city.id,
      context: { disableRevalidate: true },
      data: { heroHeadingOverride: oldH1 },
    })
    console.log(`${city.cityName}: "${oldH1}"`)
    updated++
  }
}
console.log(`\n${updated} city H1 overrides set`)
process.exit(0)
