import { readFileSync } from 'node:fs'
import { join } from 'node:path'

import { describe, expect, it } from 'vitest'

import { RESET_COOLDOWN_MIN, RESET_TOKEN_TTL_MIN, resetRecentlyIssued } from '@/lib/reset-policy'

const NOW = Date.parse('2026-09-18T20:00:00.000Z')
const MIN = 60_000
/** Expiry of a token issued `minutesAgo` minutes before NOW. */
const issued = (minutesAgo: number) =>
  new Date(NOW - minutesAgo * MIN + RESET_TOKEN_TTL_MIN * MIN).toISOString()

describe('resetRecentlyIssued', () => {
  it('suppresses a second link inside the cooldown', () => {
    expect(resetRecentlyIssued(issued(0), NOW)).toBe(true)
    expect(resetRecentlyIssued(issued(1), NOW)).toBe(true)
    expect(resetRecentlyIssued(issued(RESET_COOLDOWN_MIN - 0.1), NOW)).toBe(true)
  })

  it('allows a new link once the cooldown has passed', () => {
    expect(resetRecentlyIssued(issued(RESET_COOLDOWN_MIN), NOW)).toBe(false)
    expect(resetRecentlyIssued(issued(30), NOW)).toBe(false)
  })

  it('allows a new link when the previous one has expired or never existed', () => {
    expect(resetRecentlyIssued(issued(RESET_TOKEN_TTL_MIN + 10), NOW)).toBe(false)
    expect(resetRecentlyIssued(null, NOW)).toBe(false)
    expect(resetRecentlyIssued(undefined, NOW)).toBe(false)
  })

  it('never blocks recovery over a bad or future-dated value', () => {
    expect(resetRecentlyIssued('not a date', NOW)).toBe(false)
    expect(resetRecentlyIssued(issued(-120), NOW)).toBe(false)
  })

  it('accepts a Date as well as an ISO string', () => {
    expect(resetRecentlyIssued(new Date(issued(2)), NOW)).toBe(true)
  })

  it('keeps the cooldown well inside the token lifetime', () => {
    expect(RESET_COOLDOWN_MIN).toBeGreaterThan(0)
    expect(RESET_COOLDOWN_MIN).toBeLessThan(RESET_TOKEN_TTL_MIN)
  })
})

/**
 * studioLogin needs cookies and a database, so its behaviour is not unit-tested
 * here. These source checks pin the two properties that were wrong before and
 * are easy to break again by reordering the function.
 */
describe('studioLogin — order of checks', () => {
  const src = readFileSync(join(process.cwd(), 'src', 'studio', 'auth.ts'), 'utf8')
  const fn = src.slice(src.indexOf('export async function studioLogin'), src.indexOf('export async function completeTotpLogin'))

  it('verifies the password before revealing that an account is disabled', () => {
    const passwordCheck = fn.indexOf('timingSafeStrEqual(computed, user.hash)')
    const disabledMessage = fn.indexOf("'This account has been disabled.'")
    expect(passwordCheck).toBeGreaterThan(-1)
    expect(disabledMessage).toBeGreaterThan(passwordCheck)
  })

  it('decides the lockout before looking at the password, and counts it against the IP', () => {
    const lockCheck = fn.indexOf('user.lock_until &&')
    const passwordCheck = fn.indexOf('timingSafeStrEqual(computed, user.hash)')
    expect(lockCheck).toBeGreaterThan(-1)
    expect(lockCheck).toBeLessThan(passwordCheck)
    const lockBlock = fn.slice(lockCheck, fn.indexOf('const computed'))
    expect(lockBlock).toContain('recordIpFailure(ip)')
  })

  it('spends a hash on an unknown email so timing does not reveal it', () => {
    const unknownBlock = fn.slice(fn.indexOf('if (!user?.salt || !user.hash)'), fn.indexOf('user.lock_until &&'))
    expect(unknownBlock).toContain('pbkdf2Sync(password, DUMMY_SALT')
    expect(unknownBlock).toContain('recordIpFailure(ip)')
  })
})

/**
 * In a 'use server' file every exported function is a public endpoint. The
 * cooldown bypass must stay private, or anyone could call it with force: true.
 */
describe('password reset — the cooldown bypass is not reachable from outside', () => {
  const src = readFileSync(join(process.cwd(), 'src', 'app', 'actions', 'studio-reset.ts'), 'utf8')

  it('keeps issueResetLink unexported', () => {
    expect(src).toMatch(/^async function issueResetLink\(/m)
    expect(src).not.toMatch(/export\s+(async\s+)?function\s+issueResetLink/)
  })

  it('the public action never forces, and only the admin-checked path does', () => {
    const publicAction = src.slice(src.indexOf('export async function requestPasswordReset'), src.indexOf('export async function resetPassword'))
    expect(publicAction).toContain('issueResetLink(email)')
    expect(publicAction).not.toContain('force')

    const adminAction = src.slice(src.indexOf('export async function sendResetLinkToUser'))
    expect(adminAction.indexOf("me.role !== 'admin'")).toBeGreaterThan(-1)
    expect(adminAction.indexOf("me.role !== 'admin'")).toBeLessThan(adminAction.indexOf('force: true'))
  })
})
