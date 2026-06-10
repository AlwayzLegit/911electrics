import 'dotenv/config'

import { readFile } from 'fs/promises'
import { JSDOM } from 'jsdom'
import path from 'path'
import { getPayload } from 'payload'

import configPromise from '../../src/payload.config'

/**
 * Audit fixups:
 * 1. processSteps lived in elementor icon-box widgets (h3.elementor-icon-box-title
 *    + p.elementor-icon-box-description) — the first migration missed them.
 * 2. cityPageTemplate aboutHeading/aboutBody ("{{city}}'s Reliable Electrical
 *    Team") — the heading matcher missed the real H2.
 * 3. SCE post meta.description was duplicated on the live WP site (same bug
 *    as its title).
 */

const SNAP = path.resolve(process.cwd(), 'wp-snapshot')
const clean = (s: string | null | undefined) => s?.replace(/\s+/g, ' ').trim() ?? ''

const payload = await getPayload({ config: await configPromise })

const loadDom = async (slugFile: string) => {
  const html = await readFile(path.join(SNAP, 'html', `${slugFile}.html`), 'utf8')
  return new JSDOM(html).window.document
}

const extractIconBoxSteps = (doc: Document) =>
  [...doc.querySelectorAll('.elementor-icon-box-wrapper')]
    .map((box) => ({
      title: clean(box.querySelector('.elementor-icon-box-title')?.textContent),
      text: clean(box.querySelector('.elementor-icon-box-description')?.textContent),
    }))
    .filter((s) => s.title && s.text)
    .slice(0, 3)

// ---- 1. Homepage process steps ----
{
  const doc = await loadDom('_home')
  const steps = extractIconBoxSteps(doc)
  if (steps.length === 3) {
    await payload.updateGlobal({
      slug: 'homepage',
      context: { disableRevalidate: true },
      data: { processSteps: steps },
    })
    console.log(`homepage: ${steps.length} process steps`)
  } else {
    console.warn(`homepage: only found ${steps.length} steps — skipped`)
  }
}

// ---- 2. City template steps + about section + process heading ----
{
  const doc = await loadDom('electrician-glendale-ca')
  const tokenize = (s: string) => s.replace(/Glendale/g, '{{city}}')
  const steps = extractIconBoxSteps(doc).map((s) => ({
    title: tokenize(s.title),
    text: tokenize(s.text),
  }))

  const h2s = [...doc.querySelectorAll('h2')]
  const processH2 = h2s.find((h) => /Made Simple/i.test(h.textContent ?? ''))
  const aboutH2 = h2s.find((h) => /Reliable Electrical Team/i.test(h.textContent ?? ''))

  // Body copy: first long text widget following the about H2 in DOM order
  let aboutBodyText = ''
  if (aboutH2) {
    const all = [...doc.querySelectorAll('h2, .elementor-widget-text-editor .elementor-widget-container')]
    const idx = all.indexOf(aboutH2)
    for (let i = idx + 1; i < all.length; i++) {
      if (all[i].tagName === 'H2') break
      const text = clean(all[i].textContent)
      if (text.length > 80) {
        aboutBodyText = text
        break
      }
    }
  }

  const { convertHTMLToLexical, editorConfigFactory } = await import('@payloadcms/richtext-lexical')
  const editorConfig = await editorConfigFactory.default({ config: await configPromise })

  await payload.updateGlobal({
    slug: 'cityPageTemplate',
    context: { disableRevalidate: true },
    data: {
      ...(steps.length === 3 ? { processSteps: steps } : {}),
      ...(processH2 ? { processHeading: tokenize(clean(processH2.textContent)) } : {}),
      ...(aboutH2 ? { aboutHeading: tokenize(clean(aboutH2.textContent)) } : {}),
      ...(aboutBodyText
        ? {
            aboutBody: convertHTMLToLexical({
              editorConfig,
              html: `<p>${tokenize(aboutBodyText)}</p>`,
              JSDOM,
            }),
          }
        : {}),
    },
  })
  console.log(
    `cityPageTemplate: steps=${steps.length} processHeading=${!!processH2} aboutHeading=${!!aboutH2} aboutBody=${!!aboutBodyText}`,
  )
}

// ---- 3. SCE post description ----
{
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
          description:
            'SCE Charge Ready Home offers up to $4,200 in rebates for electrical panel upgrades and EV charger installation in Los Angeles. Learn how to qualify with a certified SCE installer.',
        },
      },
    })
    console.log('SCE post description fixed')
  }
}

process.exit(0)
