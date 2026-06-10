import 'dotenv/config'

import { getPayload } from 'payload'

import configPromise from '../../src/payload.config'

// The live WP site served a duplicated Yoast title on this post (copied
// from the pre-purchase-inspection article). Give it a correct one instead
// of porting the bug.
const payload = await getPayload({ config: await configPromise })

const { docs } = await payload.find({
  collection: 'posts',
  limit: 1,
  where: { slug: { equals: 'sce-4200-rebate-panel-upgrade-ev-charger-installation-los-angeles' } },
})

if (docs[0]) {
  await payload.update({
    collection: 'posts',
    id: docs[0].id,
    context: { disableRevalidate: true },
    data: {
      meta: {
        ...docs[0].meta,
        title: 'SCE $4,200 Rebate: Panel Upgrade & EV Charger Installation - 911 Construction & Electric Inc.',
        description:
          docs[0].meta?.description ||
          'SCE Charge Ready Home offers up to $4,200 in rebates for panel upgrades and EV charger installation in Los Angeles. Learn how to qualify with a certified installer.',
      },
    },
  })
  console.log('fixed SCE post title')
}
process.exit(0)
