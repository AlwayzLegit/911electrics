import 'server-only'

import crypto from 'crypto'

import { cookies } from 'next/headers'

import { query } from '@/db/client'

import type { StudioRole } from './constants'

/**
 * Payload-free Studio auth.
 *
 * Verifies credentials directly against the `users` table (Payload's PBKDF2
 * salt+hash, so existing passwords keep working) and issues our own HMAC-signed
 * session cookie. Adds roles, disabled accounts, login lockout and last-login
 * tracking. Reuses PAYLOAD_SECRET as the signing key.
 */

const SESSION_COOKIE = 'studio_session'
const SESSION_TTL_SECONDS = 8 * 60 * 60 // 8 hours
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

function createToken(userId: number): string {
  const exp = Math.floor(Date.now() / 1000) + SESSION_TTL_SECONDS
  const body = Buffer.from(JSON.stringify({ uid: userId, exp })).toString('base64url')
  return `${body}.${sign(body)}`
}

function verifyToken(token: string): { uid: number; exp: number } | null {
  const [body, sig] = token.split('.')
  if (!body || !sig || !timingSafeStrEqual(sig, sign(body))) return null
  try {
    const parsed = JSON.parse(Buffer.from(body, 'base64url').toString()) as {
      uid: number
      exp: number
    }
    if (!parsed.exp || parsed.exp < Math.floor(Date.now() / 1000)) return null
    return parsed
  } catch {
    return null
  }
}

export async function getStudioUser(): Promise<StudioUser | null> {
  const token = (await cookies()).get(SESSION_COOKIE)?.value
  if (!token) return null
  const session = verifyToken(token)
  if (!session) return null

  const rows = await query<{ id: number; email: string; name: string | null; role: string }>(
    `SELECT id, email, name, role FROM users WHERE id = $1 AND disabled = false LIMIT 1`,
    [session.uid],
  )
  const u = rows[0]
  if (!u) return null
  return { id: u.id, email: u.email, name: u.name, role: u.role === 'editor' ? 'editor' : 'admin' }
}

export type StudioLoginResult = { ok: true } | { ok: false; error: string }

export async function studioLogin(email: string, password: string): Promise<StudioLoginResult> {
  const rows = await query<{
    id: number
    salt: string | null
    hash: string | null
    disabled: boolean | null
    login_attempts: string | number | null
    lock_until: string | null
  }>(
    `SELECT id, salt, hash, disabled, login_attempts, lock_until
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

  await query(
    `UPDATE users SET login_attempts = 0, lock_until = NULL, last_login_at = now() WHERE id = $1`,
    [user.id],
  ).catch(() => {})

  const cookieStore = await cookies()
  cookieStore.set(SESSION_COOKIE, createToken(user.id), {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    path: '/',
    expires: new Date(Date.now() + SESSION_TTL_SECONDS * 1000),
  })
  return { ok: true }
}

export async function studioLogout(): Promise<void> {
  const cookieStore = await cookies()
  cookieStore.delete(SESSION_COOKIE)
}
