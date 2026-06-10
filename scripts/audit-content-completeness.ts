import 'dotenv/config'

import { readFile } from 'fs/promises'
import { JSDOM } from 'jsdom'
import path from 'path'
import { getPayload } from 'payload'

import configPromise from '../src/payload.config'

/**
 * Diff the WordPress snapshot against the Payload database: per-page
 * structural counts (FAQs, features) and body-text coverage for posts.
 */
const SNAP = path.resolve(process.cwd(), 'wp-snapshot')
const clean = (s: string | null | undefined) => s?.replace(/\s+/g, ' ').trim() ?? ''

const payload = await getPayload({ config: await configPromise })
const issues: string[] = []
const ok: string[] = []

const loadDom = async (slugFile: string) => {
  const html = await readFile(path.join(SNAP, 'html', `${slugFile}.html`), 'utf8')
  return new JSDOM(html).window.document
}

const lexicalText = (state: unknown): string => {
  const out: string[] = []
  const walk = (n: unknown): void => {
    if (!n || typeof n !== 'object') return
    const node = n as { text?: string; children?: unknown[] }
    if (typeof node.text === 'string') out.push(node.text)
    if (Array.isArray(node.children)) node.children.forEach(walk)
  }
  walk((state as { root?: unknown })?.root)
  return out.join(' ')
}

// ---- Services ----
const { docs: services } = await payload.find({ collection: 'services', limit: 20, pagination: false })
for (const svc of services) {
  const doc = await loadDom(svc.slug as string)
  const wpFaqs = doc.querySelectorAll('details.e-n-accordion-item').length
  const wpTitled = [...doc.querySelectorAll('.elementor-icon-list-item')]
    .map((li) => clean(li.textContent))
    .filter((t) => t.includes(':') && t.length > 60).length
  const dbFaqs = svc.faqs?.length ?? 0
  const dbBlocks = (svc.features?.length ?? 0) + (svc.benefits?.length ?? 0)
  if (dbFaqs < wpFaqs) issues.push(`service ${svc.slug}: FAQs ${dbFaqs}/${wpFaqs}`)
  else ok.push(`service ${svc.slug}: faqs ${dbFaqs}/${wpFaqs}, blocks ${dbBlocks}/${wpTitled}`)
  if (dbBlocks < wpTitled) issues.push(`service ${svc.slug}: feature blocks ${dbBlocks}/${wpTitled}`)
  if (!svc.heroSubheading) issues.push(`service ${svc.slug}: missing heroSubheading`)
}

// ---- Posts: text coverage ----
type WpPost = { slug: string; content: { rendered: string } }
const wpPosts: WpPost[] = JSON.parse(await readFile(path.join(SNAP, 'rest', 'posts.json'), 'utf8'))
for (const wp of wpPosts) {
  const { docs } = await payload.find({ collection: 'posts', limit: 1, where: { slug: { equals: wp.slug } } })
  if (!docs[0]) {
    issues.push(`post MISSING: ${wp.slug}`)
    continue
  }
  const wpLen = clean(new JSDOM(wp.content.rendered).window.document.body.textContent).length
  const dbLen = clean(lexicalText(docs[0].content)).length
  const pct = Math.round((dbLen / Math.max(wpLen, 1)) * 100)
  if (pct < 90) issues.push(`post ${wp.slug}: body coverage ${pct}% (${dbLen}/${wpLen} chars)`)
  else ok.push(`post ${wp.slug}: ${pct}%`)
}

// ---- Counts ----
const counts = {
  services: services.length,
  cities: (await payload.count({ collection: 'cities' })).totalDocs,
  posts: (await payload.count({ collection: 'posts' })).totalDocs,
  media: (await payload.count({ collection: 'media' })).totalDocs,
}
if (counts.services !== 6) issues.push(`services count ${counts.services} != 6`)
if (counts.cities !== 43) issues.push(`cities count ${counts.cities} != 43`)
if (counts.posts !== 17) issues.push(`posts count ${counts.posts} != 17`)

// ---- Homepage / template globals ----
const homepage = await payload.findGlobal({ slug: 'homepage' })
const homeDom = await loadDom('_home')
const homeWpFaqs = homeDom.querySelectorAll('details.e-n-accordion-item').length
if ((homepage.faqs?.length ?? 0) < homeWpFaqs)
  issues.push(`homepage FAQs ${homepage.faqs?.length}/${homeWpFaqs}`)
if (!homepage.processSteps?.length) issues.push('homepage: no process steps')

const template = await payload.findGlobal({ slug: 'cityPageTemplate' })
if (!template.processSteps?.length) issues.push('cityPageTemplate: no process steps')
if (!template.faqs?.length) issues.push('cityPageTemplate: no FAQs')
if (!template.aboutBody) issues.push('cityPageTemplate: no about body')

console.log(`counts: ${JSON.stringify(counts)}`)
console.log(`\nOK (${ok.length}):`)
ok.slice(0, 8).forEach((o) => console.log(`  ✓ ${o}`))
if (ok.length > 8) console.log(`  … and ${ok.length - 8} more`)
console.log(`\nISSUES (${issues.length}):`)
issues.forEach((i) => console.log(`  ✗ ${i}`))
process.exit(0)
