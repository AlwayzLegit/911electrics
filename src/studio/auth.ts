import 'server-only'

import crypto from 'crypto'

import { cookies } from 'next/headers'
import { redirect } from 'next/navigation'

import { query } from '@/db/client'

import {
  STUDIO_PERMISSIONS,
  isStudioPermission,
  type StudioPermission,
  type StudioRole,
} from './constants'

/**
 * Payload-free Studio auth.
 *
 * Verifies credentials directly against the `users` table (Payload's PBKDF2
 * salt+hash, so existing passwords keep working) and issues our own HMAC-signed
 * session cookie. Adds roles, disabled accounts, login lockout and last-login
 * tracking. Reuses PAYLOAD_SECRET as the signing key.
 */

const SESSION_COOKIE = 'studio_session'
const TFA_COOKIE = 'studio_2fa'
const SESSION_TTL_SECONDS = 8 * 60 * 60 // 8 hours
const TFA_TTL_SECONDS = 5 * 60 // 5 minutes to enter the code
const PBKDF2_ITERATIONS = 25_000
const PBKDF2_KEYLEN = 512
const PBKDF2_DIGEST = 'sha256'
const MAX_ATTEMPTS = 5
const LOCK_MINUTES = 15

export type StudioUser = {
  id: number
  email: string
  name: string | null
  role: StudioRole
  /** Effective permissions — admins implicitly have all of them. */
  permissions: StudioPermission[]
}

/** Does this user have a given grantable permission? Admins always do. */
export function can(user: StudioUser | null, perm: StudioPermission): boolean {
  return !!user && (user.role === 'admin' || user.permissions.includes(perm))
}

function getSecret(): string {
  const secret = process.env.PAYLOAD_SECRET
  if (!secret) throw new Error('PAYLOAD_SECRET is not set')
  return secret
}

function sign(data: string): string {
  return crypto.createHmac('sha256', getSecret()).update(data).digest('base64url')
}

function timingSafeStrEqual(a: string, b: string): boolean {
  const ab = Buffer.from(a)
  const bb = Buffer.from(b)
  return ab.length === bb.length && crypto.timingSafeEqual(ab, bb)
}

/** Generate a Payload-compatible salt + hash for a new/changed password. */
export function hashPassword(password: string): { salt: string; hash: string } {
  const salt = crypto.randomBytes(32).toString('hex')
  const hash = crypto
    .pbkdf2Sync(password, salt, PBKDF2_ITERATIONS, PBKDF2_KEYLEN, PBKDF2_DIGEST)
    .toString('hex')
  return { salt, hash }
}

function createToken(userId: number, ttlSeconds: number, kind: 'session' | '2fa'): string {
  const exp = Math.floor(Date.now() / 1000) + ttlSeconds
  const body = Buffer.from(JSON.stringify({ uid: userId, exp, k: kind })).toString('base64url')
  return `${body}.${sign(body)}`
}

function verifyToken(token: string, kind: 'session' | '2fa'): { uid: number; exp: number } | null {
  const [body, sig] = token.split('.')
  if (!body || !sig || !timingSafeStrEqual(sig, sign(body))) return null
  try {
    const parsed = JSON.parse(Buffer.from(body, 'base64url').toString()) as {
      uid: number
      exp: number
      k?: string
    }
    if (parsed.k !== kind) return null
    if (!parsed.exp || parsed.exp < Math.floor(Date.now() / 1000)) return null
    return parsed
  } catch {
    return null
  }
}

async function issueSession(userId: number): Promise<void> {
  const cookieStore = await cookies()
  cookieStore.set(SESSION_COOKIE, createToken(userId, SESSION_TTL_SECONDS, 'session'), {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    path: '/',
    expires: new Date(Date.now() + SESSION_TTL_SECONDS * 1000),
  })
}

export async function getStudioUser(): Promise<StudioUser | null> {
  const token = (await cookies()).get(SESSION_COOKIE)?.value
  if (!token) return null
  const session = verifyToken(token, 'session')
  if (!session) return null

  const rows = await query<{
    id: number
    email: string
    name: string | null
    role: string
    permissions: unknown
  }>(
    `SELECT id, email, name, role, permissions FROM users WHERE id = $1 AND disabled = false LIMIT 1`,
    [session.uid],
  )
  const u = rows[0]
  if (!u) return null
  const role: StudioRole = u.role === 'editor' ? 'editor' : 'admin'
  const permissions: StudioPermission[] =
    role === 'admin'
      ? [...STUDIO_PERMISSIONS]
      : Array.isArray(u.permissions)
        ? u.permissions.filter((p): p is StudioPermission => typeof p === 'string' && isStudioPermission(p))
        : []
  return { id: u.id, email: u.email, name: u.name, role, permissions }
}

/** Guard for a page/subtree that requires a grantable permission. */
export async function requirePermission(perm: StudioPermission): Promise<StudioUser> {
  const me = await getStudioUser()
  if (!me) redirect('/studio/login')
  if (!can(me, perm)) redirect('/studio')
  return me
}

/** Guard for admin-only areas (team, business info, audit log). */
export async function requireAdminPage(): Promise<StudioUser> {
  const me = await getStudioUser()
  if (!me) redirect('/studio/login')
  if (me.role !== 'admin') redirect('/studio')
  return me
}

export type StudioLoginResult =
  | { ok: true }
  | { ok: false; needsTotp: true }
  | { ok: false; error: string }

export async function studioLogin(email: string, password: string): Promise<StudioLoginResult> {
  const rows = await query<{
    id: number
    salt: string | null
    hash: string | null
    disabled: boolean | null
    login_attempts: string | number | null
    lock_until: string | null
    totp_enabled: boolean | null
  }>(
    `SELECT id, salt, hash, disabled, login_attempts, lock_until, totp_enabled
     FROM users WHERE lower(email) = lower($1) LIMIT 1`,
    [email.trim()],
  )
  const user = rows[0]
  const invalid: StudioLoginResult = { ok: false, error: 'Invalid email or password.' }
  if (!user?.salt || !user.hash) return invalid

  if (user.disabled) return { ok: false, error: 'This account has been disabled.' }

  if (user.lock_until && new Date(user.lock_until).getTime() > Date.now()) {
    return { ok: false, error: 'Too many attempts. Try again in a few minutes.' }
  }

  const computed = crypto
    .pbkdf2Sync(password, user.salt, PBKDF2_ITERATIONS, PBKDF2_KEYLEN, PBKDF2_DIGEST)
    .toString('hex')

  if (!timingSafeStrEqual(computed, user.hash)) {
    const attempts = Number(user.login_attempts ?? 0) + 1
    const lockUntil = attempts >= MAX_ATTEMPTS ? new Date(Date.now() + LOCK_MINUTES * 60_000) : null
    await query(`UPDATE users SET login_attempts = $2, lock_until = $3 WHERE id = $1`, [
      user.id,
      attempts,
      lockUntil ? lockUntil.toISOString() : null,
    ]).catch(() => {})
    return invalid
  }

  // Password is correct. If 2FA is on, defer the session to the second step.
  if (user.totp_enabled) {
    const cookieStore = await cookies()
    cookieStore.set(TFA_COOKIE, createToken(user.id, TFA_TTL_SECONDS, '2fa'), {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      path: '/',
      expires: new Date(Date.now() + TFA_TTL_SECONDS * 1000),
    })
    return { ok: false, needsTotp: true }
  }

  await query(
    `UPDATE users SET login_attempts = 0, lock_until = NULL, last_login_at = now() WHERE id = $1`,
    [user.id],
  ).catch(() => {})

  await issueSession(user.id)
  return { ok: true }
}

/** Is there a valid pending-2FA cookie from a passed password step? */
export async function getPending2faUserId(): Promise<number | null> {
  const token = (await cookies()).get(TFA_COOKIE)?.value
  if (!token) return null
  return verifyToken(token, '2fa')?.uid ?? null
}

/**
 * Second login step: verify the authenticator code (or a recovery code) for the
 * user identified by the pending-2FA cookie, then issue the real session.
 */
export async function completeTotpLogin(code: string): Promise<StudioLoginResult> {
  const uid = await getPending2faUserId()
  if (!uid) return { ok: false, error: 'Your session expired. Sign in again.' }

  const { verifyTotp, consumeRecoveryCode } = await import('./totp')
  const rows = await query<{
    id: number
    totp_secret: string | null
    totp_enabled: boolean | null
    totp_recovery_codes: string[] | null
  }>(
    `SELECT id, totp_secret, totp_enabled, totp_recovery_codes
     FROM users WHERE id = $1 AND disabled = false LIMIT 1`,
    [uid],
  )
  const user = rows[0]
  if (!user?.totp_secret || !user.totp_enabled) {
    return { ok: false, error: 'Two-factor is not set up. Sign in again.' }
  }

  const cleaned = code.replace(/\s+/g, '')
  let verified = verifyTotp(user.totp_secret, cleaned)

  if (!verified) {
    // Maybe it's a recovery code.
    const remaining = consumeRecoveryCode(user.totp_recovery_codes ?? [], cleaned)
    if (remaining) {
      verified = true
      await query(`UPDATE users SET totp_recovery_codes = $2::jsonb WHERE id = $1`, [
        user.id,
        JSON.stringify(remaining),
      ]).catch(() => {})
    }
  }

  if (!verified) return { ok: false, error: 'Invalid code. Try again.' }

  const cookieStore = await cookies()
  cookieStore.delete(TFA_COOKIE)
  await query(
    `UPDATE users SET login_attempts = 0, lock_until = NULL, last_login_at = now() WHERE id = $1`,
    [user.id],
  ).catch(() => {})
  await issueSession(user.id)
  return { ok: true }
}

export async function studioLogout(): Promise<void> {
  const cookieStore = await cookies()
  cookieStore.delete(SESSION_COOKIE)
  cookieStore.delete(TFA_COOKIE)
}
