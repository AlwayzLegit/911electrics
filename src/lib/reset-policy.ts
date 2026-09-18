/**
 * When may the public "forgot password" form issue another reset link?
 *
 * The form is unauthenticated, so without a limit it is a mail cannon aimed at
 * any team member's inbox, paid for by our Resend account. It was also a way to
 * lock someone out of recovery: each request replaces the stored token, so
 * re-submitting the form kept invalidating the link the real user was trying to
 * click.
 *
 * The cooldown needs no new storage. A token's issue time is its expiry minus
 * its lifetime, and the expiry is already on the user row.
 *
 * Pure, so it is unit-tested without a database.
 */

/** How long an emailed reset link stays valid. */
export const RESET_TOKEN_TTL_MIN = 60

/** Minimum gap between two links for the same account. */
export const RESET_COOLDOWN_MIN = 5

/**
 * True when a reset link was issued for this account less than the cooldown
 * ago, so another request should be quietly ignored.
 */
export function resetRecentlyIssued(
  expiration: string | Date | null | undefined,
  now: number = Date.now(),
): boolean {
  if (!expiration) return false
  const expiresAt = expiration instanceof Date ? expiration.getTime() : new Date(expiration).getTime()
  if (Number.isNaN(expiresAt)) return false
  const issuedAt = expiresAt - RESET_TOKEN_TTL_MIN * 60_000
  const age = now - issuedAt
  // A token "issued in the future" means the clock or the row is wrong; do not
  // let that block recovery.
  return age >= 0 && age < RESET_COOLDOWN_MIN * 60_000
}
