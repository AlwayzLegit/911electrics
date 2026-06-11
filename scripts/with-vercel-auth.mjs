/**
 * Runs one of the verification scripts against a protected Vercel
 * deployment: exchanges a _vercel_share token for the auth cookie, patches
 * global fetch to send it, then imports the target script.
 *
 * Usage: node scripts/with-vercel-auth.mjs <shareUrl> <script> [args...]
 */
import path from 'path'
import { pathToFileURL } from 'url'

const [shareUrl, target, ...rest] = process.argv.slice(2)
if (!shareUrl || !target) {
  console.error('usage: node scripts/with-vercel-auth.mjs <shareUrl> <script> [args...]')
  process.exit(1)
}

const res = await fetch(shareUrl, { redirect: 'manual' })
const setCookie = res.headers.getSetCookie?.() ?? [res.headers.get('set-cookie')].filter(Boolean)
const jwt = setCookie.map((c) => c.split(';')[0]).find((c) => c.startsWith('_vercel_jwt='))
if (!jwt) {
  console.error(`could not obtain _vercel_jwt (status ${res.status}) — token expired?`)
  process.exit(1)
}
console.log('vercel auth cookie obtained\n')

const origin = new URL(shareUrl).origin
const realFetch = globalThis.fetch
globalThis.fetch = (input, init = {}) => {
  const url = typeof input === 'string' ? input : input.url
  if (url.startsWith(origin)) {
    const headers = new Headers(init.headers ?? {})
    headers.set('cookie', jwt)
    return realFetch(input, { ...init, headers })
  }
  return realFetch(input, init)
}

// Re-point argv so the target script sees its own expected positions
process.argv = [process.argv[0], path.resolve(target), ...rest]
await import(pathToFileURL(path.resolve(target)).href)
