/**
 * Backfill initial version records for all versioned collections.
 *
 * Seeded documents predate the versions/drafts config, so Payload's admin
 * list view (which queries with draft=true) returns 0 results for them.
 * Re-saving each document via the Local API creates the missing version
 * row and sets _status = 'published'.
 *
 * Usage:
 *   pnpm tsx scripts/backfill-versions.ts
 *
 * Safe to run multiple times — already-versioned docs just get a new
 * version snapshot (no data loss).
 */
import configPromise from '../src/payload.config'
import { getPayload } from 'payload'

const VERSIONED_COLLECTIONS = ['posts', 'pages', 'services', 'cities'] as const

async function main() {
  const payload = await getPayload({ config: configPromise })
  let totalFixed = 0

  for (const slug of VERSIONED_COLLECTIONS) {
    const { docs } = await payload.find({
      collection: slug,
      limit: 0,
      pagination: false,
      overrideAccess: true,
      draft: false,
    })

    if (docs.length === 0) {
      console.log(`  ${slug}: 0 documents — skipping`)
      continue
    }

    let fixed = 0
    for (const doc of docs) {
      try {
        await payload.update({
          collection: slug,
          id: doc.id,
          data: { _status: 'published' },
          overrideAccess: true,
          draft: false,
        })
        fixed++
      } catch (err) {
        console.error(`  ${slug}/${doc.id}: FAILED`, err)
      }
    }
    console.log(`  ${slug}: ${fixed}/${docs.length} documents backfilled`)
    totalFixed += fixed
  }

  console.log(`\nDone — ${totalFixed} documents now have version records.`)
  process.exit(0)
}

main().catch((err) => {
  console.error('Fatal error:', err)
  process.exit(1)
})
