import 'server-only'

import crypto from 'crypto'

import { cookies } from 'next/headers'

import { query } from '@/db/client'

/**
 * Payload-free Studio auth.
 *
 * Verifies credentials directly against the existing `users` table (Payload's
 * PBKDF2 salt+hash, so existing passwords keep working) and issues our own
 * HMAC-signed session cookie — no Payload local API. Reuses PAYLOAD_SECRET as
 * the signing key so no new env var is needed during the migration.
 */

const SESSION_COOKIE = 'studio_session'
const SESSION_TTL_SECONDS = 8 * 60 * 60 // 8 hours
// Payload's default password hashing parameters.
const PBKDF2_ITERATIONS = 25_000
const PBKDF2_KEYLEN = 512
const PBKDF2_DIGEST = 'sha256'

export type StudioUser = { id: number; email: string; name: string | null }

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

  const rows = await query<StudioUser>(
    `SELECT id, email, name FROM users WHERE id = $1 LIMIT 1`,
    [session.uid],
  )
  return rows[0] ?? null
}

export type StudioLoginResult = { ok: true } | { ok: false; error: string }

export async function studioLogin(email: string, password: string): Promise<StudioLoginResult> {
  const rows = await query<{ id: number; salt: string | null; hash: string | null }>(
    `SELECT id, salt, hash FROM users WHERE lower(email) = lower($1) LIMIT 1`,
    [email.trim()],
  )
  const user = rows[0]
  if (!user?.salt || !user.hash) {
    return { ok: false, error: 'Invalid email or password.' }
  }

  const computed = crypto
    .pbkdf2Sync(password, user.salt, PBKDF2_ITERATIONS, PBKDF2_KEYLEN, PBKDF2_DIGEST)
    .toString('hex')
  if (!timingSafeStrEqual(computed, user.hash)) {
    return { ok: false, error: 'Invalid email or password.' }
  }

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
