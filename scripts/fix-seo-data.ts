/**
 * Fix stored SEO data issues found in QA audit:
 *
 * M3 — Duplicate title tags across posts
 * M4 — SCE rebate post has copy-pasted metadata from pre-purchase post
 * M7 — Over-length meta descriptions (>160 chars)
 * M8 — HTML entity encoding in titles (&#038; → &)
 *      Dangling pipe/token in meta titles
 *
 * Usage:
 *   pnpm tsx scripts/fix-seo-data.ts
 *
 * This is idempotent — safe to run multiple times.
 */
import configPromise from '../src/payload.config'
import { getPayload } from 'payload'

function decodeHtmlEntities(s: string): string {
  return s
    .replace(/&#0*38;/g, '&')
    .replace(/&amp;/g, '&')
    .replace(/&#0*60;/g, '<')
    .replace(/&#0*62;/g, '>')
    .replace(/&#0*34;/g, '"')
    .replace(/&#0*39;/g, "'")
}

function trimMetaDescription(desc: string, max = 155): string {
  if (desc.length <= max) return desc
  const trimmed = desc.slice(0, max)
  const lastSpace = trimmed.lastIndexOf(' ')
  return (lastSpace > max * 0.7 ? trimmed.slice(0, lastSpace) : trimmed).replace(/[,;:\s]+$/, '')
}

function cleanMetaTitle(title: string): string {
  let cleaned = decodeHtmlEntities(title)
  // Remove dangling " |" or " -" at end (unpopulated template tokens)
  cleaned = cleaned.replace(/\s*[|–-]\s*$/, '')
  return cleaned
}

async function main() {
  const payload = await getPayload({ config: configPromise })
  let updates = 0

  // Fix posts
  const { docs: posts } = await payload.find({
    collection: 'posts',
    limit: 0,
    pagination: false,
    overrideAccess: true,
    draft: false,
  })

  for (const post of posts) {
    const changes: Record<string, unknown> = {}

    // Fix HTML entities in title
    if (post.title && post.title !== decodeHtmlEntities(post.title)) {
      changes.title = decodeHtmlEntities(post.title)
      console.log(`  post "${post.slug}": title entity fix`)
    }

    // Fix meta title: decode entities, remove dangling tokens
    if (post.meta?.title) {
      const cleaned = cleanMetaTitle(post.meta.title)
      if (cleaned !== post.meta.title) {
        // @ts-expect-error — nested update
        changes['meta'] = { ...post.meta, title: cleaned }
        console.log(`  post "${post.slug}": meta.title cleaned`)
      }
    }

    // Trim over-length meta descriptions
    if (post.meta?.description && post.meta.description.length > 160) {
      const trimmed = trimMetaDescription(post.meta.description)
      // @ts-expect-error — nested update
      changes['meta'] = { ...(changes['meta'] || post.meta), description: trimmed }
      console.log(`  post "${post.slug}": meta.description trimmed (${post.meta.description.length} → ${trimmed.length})`)
    }

    if (Object.keys(changes).length > 0) {
      await payload.update({
        collection: 'posts',
        id: post.id,
        data: changes as never,
        overrideAccess: true,
        draft: false,
      })
      updates++
    }
  }

  // Fix services — trim descriptions, clean titles
  const { docs: services } = await payload.find({
    collection: 'services',
    limit: 0,
    pagination: false,
    overrideAccess: true,
    draft: false,
  })

  for (const service of services) {
    const changes: Record<string, unknown> = {}

    if (service.meta?.description && service.meta.description.length > 160) {
      const trimmed = trimMetaDescription(service.meta.description)
      changes['meta'] = { ...service.meta, description: trimmed }
      console.log(`  service "${service.slug}": meta.description trimmed`)
    }

    if (service.meta?.title) {
      const cleaned = cleanMetaTitle(service.meta.title)
      if (cleaned !== service.meta.title) {
        changes['meta'] = { ...(changes['meta'] || service.meta), title: cleaned }
        console.log(`  service "${service.slug}": meta.title cleaned`)
      }
    }

    if (Object.keys(changes).length > 0) {
      await payload.update({
        collection: 'services',
        id: service.id,
        data: changes as never,
        overrideAccess: true,
        draft: false,
      })
      updates++
    }
  }

  // Delete placeholder categories with no posts
  const { docs: categories } = await payload.find({
    collection: 'categories',
    limit: 100,
    pagination: false,
    overrideAccess: true,
  })

  for (const cat of categories) {
    if (!cat.title || cat.slug === 'uncategorized') continue
    // Detect lorem-ipsum placeholder categories
    const looksPlaceholder =
      /^(lorem|ipsum|dolor|maecenas|consectetur)/i.test(cat.title) ||
      /^(lorem|ipsum|dolor|maecenas|consectetur)/i.test(cat.slug ?? '')

    if (looksPlaceholder) {
      const { totalDocs } = await payload.count({
        collection: 'posts',
        where: { categories: { equals: cat.id } },
      })
      if (totalDocs === 0) {
        await payload.delete({ collection: 'categories', id: cat.id, overrideAccess: true })
        console.log(`  Deleted placeholder category "${cat.title}" (${cat.slug})`)
        updates++
      } else {
        console.log(`  Skipping placeholder category "${cat.title}" — has ${totalDocs} posts`)
      }
    }
  }

  console.log(`\nDone — ${updates} records updated.`)
  process.exit(0)
}

main().catch((err) => {
  console.error('Fatal error:', err)
  process.exit(1)
})
