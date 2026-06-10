/**
 * P7 — One-shot content migration from the WordPress snapshot into Payload.
 * Idempotent: documents are skipped when their slug already exists.
 *
 * Run: pnpm payload run scripts/migrate/index.ts
 */

import 'dotenv/config'

import { convertHTMLToLexical, editorConfigFactory } from '@payloadcms/richtext-lexical'
import { randomBytes } from 'crypto'
import { readdir, readFile, stat } from 'fs/promises'
import { JSDOM } from 'jsdom'
import path from 'path'
import { getPayload, type Payload, type SanitizedConfig } from 'payload'

import configPromise from '../../src/payload.config'

const SNAP = path.resolve(process.cwd(), 'wp-snapshot')
const BASE = 'https://911electrics.com'
const ADMIN_EMAIL = '1977constructioncompany@gmail.com'

type SeoEntry = {
  url: string
  title?: string
  metaDescription?: string
  ogImage?: string
  h1?: string
}

const clean = (s: string | null | undefined) => s?.replace(/\s+/g, ' ').trim() ?? ''

/** Strip WP size suffix / -scaled so URLs map to the downloaded originals. */
const toOriginalUploadPath = (url: string): string | null => {
  const m = url.match(/\/wp-content\/uploads\/(.+)$/)
  if (!m) return null
  return m[1].replace(/-\d+x\d+(\.\w+)$/, '$1').replace(/-scaled(\.\w+)$/, '$1')
}

/** Rewrite absolute internal links to relative ones with trailing slash. */
const rewriteInternalLinks = (html: string): string =>
  html.replace(/href="https?:\/\/(?:www\.)?911electrics\.com(\/[^"#?]*?)\/?(["#?])/g, 'href="$1/$2')

async function main() {
  const config = await configPromise
  const payload = await getPayload({ config })
  const editorConfig = await editorConfigFactory.default({ config: config as SanitizedConfig })

  const toLexical = (html: string) =>
    convertHTMLToLexical({
      editorConfig,
      html: rewriteInternalLinks(html),
      JSDOM,
    })

  const seoSummary: SeoEntry[] = JSON.parse(await readFile(path.join(SNAP, 'seo-summary.json'), 'utf8'))
  const seoByPath = new Map<string, SeoEntry>()
  for (const entry of seoSummary) {
    seoByPath.set(new URL(entry.url).pathname, entry)
  }

  const loadDom = async (slugFile: string) => {
    const html = await readFile(path.join(SNAP, 'html', `${slugFile}.html`), 'utf8')
    return new JSDOM(html).window.document
  }

  // ------------------------------------------------------------------
  // 1. Admin user
  // ------------------------------------------------------------------
  const existingUsers = await payload.find({ collection: 'users', limit: 1, where: { email: { equals: ADMIN_EMAIL } } })
  if (existingUsers.docs.length === 0) {
    const password = randomBytes(12).toString('base64url')
    await payload.create({
      collection: 'users',
      data: { email: ADMIN_EMAIL, name: '911 Construction & Electric', password },
    })
    console.log(`\n*** ADMIN USER CREATED ***\n    email:    ${ADMIN_EMAIL}\n    password: ${password}\n    (change it after first login)\n`)
  } else {
    console.log('admin user exists')
  }

  // ------------------------------------------------------------------
  // 2. Media
  // ------------------------------------------------------------------
  const mediaDir = path.join(SNAP, 'media')
  const mediaMap = new Map<string, { id: number | string; url: string }>() // rel upload path -> media

  const walk = async (dir: string): Promise<string[]> => {
    const out: string[] = []
    for (const name of await readdir(dir)) {
      const p = path.join(dir, name)
      if ((await stat(p)).isDirectory()) out.push(...(await walk(p)))
      else out.push(p)
    }
    return out
  }

  for (const filePath of await walk(mediaDir)) {
    const rel = path.relative(mediaDir, filePath).replace(/\\/g, '/')
    const filename = path.basename(filePath)
    const existing = await payload.find({ collection: 'media', limit: 1, where: { filename: { equals: filename } } })
    if (existing.docs.length > 0) {
      mediaMap.set(rel, { id: existing.docs[0].id, url: existing.docs[0].url ?? '' })
      continue
    }
    const alt = clean(
      path.basename(filename, path.extname(filename)).replace(/[-_]+/g, ' ').replace(/\d{3,}/g, ''),
    ) || '911 Construction & Electric'
    try {
      const doc = await payload.create({ collection: 'media', data: { alt }, filePath })
      mediaMap.set(rel, { id: doc.id, url: doc.url ?? '' })
      console.log(`media: ${rel}`)
    } catch (err) {
      console.warn(`media FAILED: ${rel} — ${(err as Error).message}`)
    }
  }

  const mediaIdForUrl = (url?: string | null): number | string | undefined => {
    if (!url) return undefined
    const rel = toOriginalUploadPath(url)
    return rel ? mediaMap.get(rel)?.id : undefined
  }

  // ------------------------------------------------------------------
  // DOM extraction helpers
  // ------------------------------------------------------------------
  const headingEl = (doc: Document, text: string, tag = 'h2, h3') =>
    [...doc.querySelectorAll(tag)].find((h) => clean(h.textContent).toLowerCase().startsWith(text.toLowerCase()))

  /** First text-editor widget that follows a heading in DOM order. */
  const textAfterHeading = (doc: Document, heading: Element | undefined, asHtml = false): string => {
    if (!heading) return ''
    const all = [...doc.querySelectorAll('h1, h2, h3, .elementor-widget-text-editor .elementor-widget-container')]
    const idx = all.indexOf(heading)
    for (let i = idx + 1; i < all.length; i++) {
      const el = all[i]
      if (/^H[1-3]$/.test(el.tagName)) return '' // hit the next heading first
      const text = clean(el.textContent)
      if (text.length > 30) return asHtml ? el.innerHTML.trim() : text
    }
    return ''
  }

  const extractFaqs = (doc: Document) =>
    [...doc.querySelectorAll('details.e-n-accordion-item')].map((item) => {
      const question = clean(item.querySelector('.e-n-accordion-item-title-text')?.textContent)
      const bodyWidget = item.querySelector('.elementor-widget-text-editor .elementor-widget-container')
      const answerHtml = bodyWidget?.innerHTML.trim() || `<p>${clean(item.querySelector(':scope > div')?.textContent)}</p>`
      return { question, answerHtml }
    })

  /** Icon-list entries of the form "Title : text". */
  const extractTitledListItems = (doc: Document) =>
    [...doc.querySelectorAll('.elementor-icon-list-item')]
      .map((li) => clean(li.textContent))
      .filter((t) => t.includes(':') && t.length > 60)
      .map((t) => {
        const [title, ...rest] = t.split(':')
        return { title: clean(title), text: clean(rest.join(':')) }
      })

  const PROCESS_STEPS = ['Schedule Your Service', 'Detailed Assessment & Quote', 'Professional Execution']

  const extractProcessSteps = (doc: Document) =>
    PROCESS_STEPS.map((title) => ({
      title,
      text: textAfterHeading(doc, headingEl(doc, title, 'h3')),
    })).filter((s) => s.text)

  // ------------------------------------------------------------------
  // 3. Site settings global
  // ------------------------------------------------------------------
  await payload.updateGlobal({
    slug: 'siteSettings',
    data: {
      businessName: '911 Construction & Electric Inc.',
      licenseNumber: '1027421',
      phone: '747-255-8595',
      email: 'info@911electrics.com',
      address: { street: '1308 East Colorado Blvd Ste 141', city: 'Pasadena', state: 'CA', zip: '91106' },
      geo: { lat: 34.1453, lng: -118.1182 },
      hoursLabel: '24/7 Emergency Service',
      socials: [
        { platform: 'facebook', url: 'https://www.facebook.com/911Electrics' },
        { platform: 'instagram', url: 'https://www.instagram.com/911construction_electric' },
        { platform: 'x', url: 'https://twitter.com/911Electric' },
        { platform: 'pinterest', url: 'https://www.pinterest.com/911electricinc/' },
        { platform: 'google', url: 'https://share.google/LPz2HwoGDHNgF9UCk' },
      ],
      aggregateRating: { value: 5, count: 0 },
    },
    context: { disableRevalidate: true },
  })
  console.log('siteSettings seeded')

  // ------------------------------------------------------------------
  // 4. Homepage global
  // ------------------------------------------------------------------
  {
    const doc = await loadDom('_home')
    const seo = seoByPath.get('/')
    const servicesH2 = headingEl(doc, 'Professional Electrical Services')
    const aboutH2 = headingEl(doc, 'Trusted Los Angeles Electricians')
    const processH2 = headingEl(doc, 'Electrical Services in Los Angeles, CA Made Simple')

    await payload.updateGlobal({
      slug: 'homepage',
      data: {
        heroHeading: seo?.h1 ?? 'Licensed Electricians in Los Angeles, CA',
        heroSubheading: textAfterHeading(doc, doc.querySelector('h1') ?? undefined),
        heroImage: mediaIdForUrl(seo?.ogImage),
        processHeading: clean(processH2?.textContent) || undefined,
        processSteps: extractProcessSteps(doc),
        servicesHeading: clean(servicesH2?.textContent) || undefined,
        servicesIntro: textAfterHeading(doc, servicesH2),
        aboutHeading: clean(aboutH2?.textContent) || undefined,
        aboutBody: toLexical(`<p>${textAfterHeading(doc, aboutH2)}</p>`),
        differentiators: extractTitledListItems(doc).slice(0, 4),
        reviewsHeading: clean(headingEl(doc, 'What Clients Say')?.textContent) || undefined,
        faqs: extractFaqs(doc).map((f) => ({ question: f.question, answer: toLexical(f.answerHtml) })),
        contactHeading: 'Get Your Free Quote Today',
        meta: { title: seo?.title, description: seo?.metaDescription },
      },
      context: { disableRevalidate: true },
    })
    console.log('homepage seeded')
  }

  // ------------------------------------------------------------------
  // 5. City page template global (from the Glendale page, tokenized)
  // ------------------------------------------------------------------
  {
    const doc = await loadDom('electrician-glendale-ca')
    const tokenize = (s: string) => s.replace(/Glendale/g, '{{city}}')
    const seo = seoByPath.get('/electrician-glendale-ca/')
    const servicesH2 = [...doc.querySelectorAll('h2')].find((h) => /Services/i.test(h.textContent ?? ''))
    const aboutH2 = [...doc.querySelectorAll('h2')].find((h) => /Trusted|Why/i.test(h.textContent ?? ''))

    await payload.updateGlobal({
      slug: 'cityPageTemplate',
      data: {
        heroHeading: tokenize(seo?.h1 ?? 'Electrician in {{city}}, CA for Repairs, Panel Upgrades & EV Chargers'),
        heroSubheading: tokenize(textAfterHeading(doc, doc.querySelector('h1') ?? undefined)),
        heroImage: mediaIdForUrl(seo?.ogImage),
        intro: undefined,
        processHeading: clean(headingEl(doc, 'From Consultation')?.textContent) || 'From Consultation to Completion in 3 Easy Steps',
        processSteps: extractProcessSteps(doc).map((s) => ({ ...s, text: tokenize(s.text) })),
        servicesHeading: tokenize(clean(servicesH2?.textContent) || 'Our Electrical Services in {{city}}, CA'),
        servicesIntro: tokenize(textAfterHeading(doc, servicesH2)),
        aboutHeading: tokenize(clean(aboutH2?.textContent) || ''),
        aboutBody: toLexical(`<p>${tokenize(textAfterHeading(doc, aboutH2))}</p>`),
        differentiators: extractTitledListItems(doc).slice(0, 4).map((d) => ({ title: tokenize(d.title), text: tokenize(d.text) })),
        faqs: extractFaqs(doc).map((f) => ({ question: tokenize(f.question), answer: toLexical(tokenize(f.answerHtml)) })),
        ctaHeading: 'Need an Electrician in {{city}}? Call Us 24/7',
        ctaBody: 'Fast response across {{city}} and surrounding communities — licensed, insured, and available around the clock.',
      },
      context: { disableRevalidate: true },
    })
    console.log('cityPageTemplate seeded')
  }

  // ------------------------------------------------------------------
  // 6. Categories
  // ------------------------------------------------------------------
  const wpCategories: { id: number; slug: string; name: string }[] = JSON.parse(
    await readFile(path.join(SNAP, 'rest', 'categories.json'), 'utf8'),
  )
  const categoryIdMap = new Map<number, number | string>()
  for (const wpCat of wpCategories) {
    if (wpCat.slug === 'uncategorized') continue
    const existing = await payload.find({ collection: 'categories', limit: 1, where: { slug: { equals: wpCat.slug } } })
    const doc =
      existing.docs[0] ??
      (await payload.create({ collection: 'categories', data: { title: wpCat.name, slug: wpCat.slug } }))
    categoryIdMap.set(wpCat.id, doc.id)
    console.log(`category: ${wpCat.slug}`)
  }

  // ------------------------------------------------------------------
  // 7. Services
  // ------------------------------------------------------------------
  const SERVICES = [
    { slug: 'electrical-repairs-los-angeles-ca', navLabel: 'Electrical Repairs & Troubleshooting' },
    { slug: 'electrical-panel-upgrades-los-angeles-ca', navLabel: 'Electrical Panel Upgrades' },
    { slug: 'ev-charger-installation-los-angeles-ca', navLabel: 'EV Charger Installation' },
    { slug: 'new-construction-electrical-los-angeles-ca', navLabel: 'New Construction Electrical' },
    { slug: 'lighting-installation-upgrades-los-angeles-ca', navLabel: 'Lighting Installation & Upgrades' },
    { slug: 'emergency-electrician-los-angeles-ca', navLabel: 'Emergency Electrical Services (24/7)' },
  ]

  // Card descriptions live on the homepage as the text widget following
  // each service H3
  const homeDoc = await loadDom('_home')
  const cardDescriptions = SERVICES.map((s) => {
    const h3 = headingEl(homeDoc, s.navLabel.replace(' & ', ' '), 'h3') ?? headingEl(homeDoc, s.navLabel.split(' ')[0], 'h3')
    return textAfterHeading(homeDoc, h3)
  })

  for (const [i, def] of SERVICES.entries()) {
    const existing = await payload.find({ collection: 'services', limit: 1, where: { slug: { equals: def.slug } } })
    if (existing.docs.length > 0) {
      console.log(`service exists: ${def.slug}`)
      continue
    }
    const doc = await loadDom(def.slug)
    const seo = seoByPath.get(`/${def.slug}/`)
    const titled = extractTitledListItems(doc)
    const faqs = extractFaqs(doc)
    const heroImageId = mediaIdForUrl(seo?.ogImage)

    await payload.create({
      collection: 'services',
      context: { disableRevalidate: true },
      data: {
        title: seo?.h1 ?? def.navLabel,
        navLabel: def.navLabel,
        slug: def.slug,
        heroSubheading: textAfterHeading(doc, doc.querySelector('h1') ?? undefined),
        heroImage: heroImageId,
        showRatingBadge: true,
        shortDescription: cardDescriptions[i] || seo?.metaDescription || def.navLabel,
        cardImage: heroImageId,
        features: titled.slice(0, 3),
        benefits: titled.slice(3, 6),
        faqs: faqs.map((f) => ({ question: f.question, answer: toLexical(f.answerHtml) })),
        displayOrder: i,
        meta: { title: seo?.title, description: seo?.metaDescription, image: heroImageId },
        _status: 'published',
      },
    })
    console.log(`service: ${def.slug}`)
  }

  // ------------------------------------------------------------------
  // 8. Cities
  // ------------------------------------------------------------------
  const urls: string[] = JSON.parse(await readFile(path.join(SNAP, 'urls.json'), 'utf8'))
  const citySlugs = urls
    .map((u) => new URL(u).pathname)
    .filter((p) => /^\/electrician-.+-ca\/$/.test(p))
    .map((p) => p.replace(/^\/|\/$/g, ''))

  const cityNameFromH1 = (h1?: string, slug?: string): string => {
    const m = h1?.match(/Electricians? in (.+?), CA/i)
    if (m) return m[1].trim()
    return (slug ?? '')
      .replace(/^electrician-/, '')
      .replace(/-ca$/, '')
      .split('-')
      .map((w) => w[0]?.toUpperCase() + w.slice(1))
      .join(' ')
  }

  for (const slug of citySlugs) {
    const existing = await payload.find({ collection: 'cities', limit: 1, where: { slug: { equals: slug } } })
    if (existing.docs.length > 0) continue
    const seo = seoByPath.get(`/${slug}/`)
    const cityName = cityNameFromH1(seo?.h1, slug)
    await payload.create({
      collection: 'cities',
      context: { disableRevalidate: true },
      data: {
        cityName,
        title: `Electrician in ${cityName}, CA`,
        slug,
        meta: { title: seo?.title, description: seo?.metaDescription },
        _status: 'published',
      },
    })
    console.log(`city: ${cityName} (${slug})`)
  }

  // Los Angeles hub page at /services/los-angeles-ca/
  {
    const existing = await payload.find({
      collection: 'cities',
      limit: 1,
      where: { pathOverride: { equals: '/services/los-angeles-ca/' } },
    })
    if (existing.docs.length === 0) {
      const seo = seoByPath.get('/services/los-angeles-ca/')
      await payload.create({
        collection: 'cities',
        context: { disableRevalidate: true },
        data: {
          cityName: 'Los Angeles',
          title: 'Electrician in Los Angeles, CA',
          slug: 'electrician-los-angeles-hub',
          pathOverride: '/services/los-angeles-ca/',
          meta: { title: seo?.title, description: seo?.metaDescription },
          _status: 'published',
        },
      })
      console.log('city: Los Angeles (/services/los-angeles-ca/)')
    }
  }

  // ------------------------------------------------------------------
  // 9. Posts
  // ------------------------------------------------------------------
  type WpPost = {
    slug: string
    date_gmt: string
    title: { rendered: string }
    content: { rendered: string }
    categories: number[]
    _embedded?: { 'wp:featuredmedia'?: { source_url?: string }[] }
  }
  const wpPosts: WpPost[] = JSON.parse(await readFile(path.join(SNAP, 'rest', 'posts.json'), 'utf8'))

  const decode = (s: string) =>
    s
      .replace(/&#8217;/g, '’')
      .replace(/&#8216;/g, '‘')
      .replace(/&#8220;/g, '“')
      .replace(/&#8221;/g, '”')
      .replace(/&#8211;/g, '–')
      .replace(/&amp;/g, '&')
      .replace(/&nbsp;/g, ' ')

  for (const wpPost of wpPosts) {
    const existing = await payload.find({ collection: 'posts', limit: 1, where: { slug: { equals: wpPost.slug } } })
    if (existing.docs.length > 0) {
      console.log(`post exists: ${wpPost.slug}`)
      continue
    }
    const seo = seoByPath.get(`/${wpPost.slug}/`)
    const heroUrl = wpPost._embedded?.['wp:featuredmedia']?.[0]?.source_url ?? seo?.ogImage
    const html = wpPost.content.rendered.replace(/<p[^>]*>(\s|&nbsp;)*<\/p>/g, '')

    try {
      await payload.create({
        collection: 'posts',
        context: { disableRevalidate: true },
        data: {
          title: decode(wpPost.title.rendered),
          slug: wpPost.slug,
          content: toLexical(html),
          heroImage: mediaIdForUrl(heroUrl),
          publishedAt: `${wpPost.date_gmt}Z`,
          categories: wpPost.categories.map((id) => categoryIdMap.get(id)).filter((x): x is number | string => !!x),
          meta: { title: seo?.title, description: seo?.metaDescription, image: mediaIdForUrl(heroUrl) },
          _status: 'published',
        },
      })
      console.log(`post: ${wpPost.slug}`)
    } catch (err) {
      console.warn(`post FAILED: ${wpPost.slug} — ${(err as Error).message}`)
    }
  }

  console.log('\nMigration complete.')
  process.exit(0)
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
