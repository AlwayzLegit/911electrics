// Exploratory: dump headings, FAQ accordions, and text widgets from a
// snapshot HTML file to understand what's extractable.
import { readFile } from 'fs/promises'
import { JSDOM } from '../node_modules/.pnpm/jsdom@28.0.0/node_modules/jsdom/lib/api.js'

const file = process.argv[2] || 'wp-snapshot/html/_home.html'
const html = await readFile(file, 'utf8')
const dom = new JSDOM(html)
const doc = dom.window.document

const clean = (s) => s?.replace(/\s+/g, ' ').trim()

console.log('=== HEADINGS ===')
for (const h of doc.querySelectorAll('h1, h2, h3')) {
  const t = clean(h.textContent)
  if (t) console.log(`${h.tagName}: ${t.slice(0, 110)}`)
}

console.log('\n=== FAQ ACCORDION ===')
for (const item of doc.querySelectorAll('details.e-n-accordion-item')) {
  const q = clean(item.querySelector('.e-n-accordion-item-title-text')?.textContent)
  const body = item.querySelector(':scope > div')
  const a = clean(body?.textContent)
  console.log(`Q: ${q}`)
  console.log(`A: ${a?.slice(0, 250)}`)
  console.log('---')
}

console.log('\n=== TEXT WIDGETS (first 30) ===')
let i = 0
for (const w of doc.querySelectorAll('.elementor-widget-text-editor .elementor-widget-container')) {
  const t = clean(w.textContent)
  if (t && i++ < 30) console.log(`- ${t.slice(0, 160)}`)
}

console.log('\n=== ICON LIST ITEMS ===')
for (const li of doc.querySelectorAll('.elementor-icon-list-item')) {
  const t = clean(li.textContent)
  if (t) console.log(`* ${t.slice(0, 120)}`)
}
