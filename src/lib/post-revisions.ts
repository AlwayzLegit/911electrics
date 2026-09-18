import 'server-only'

import type { PoolClient } from 'pg'

/**
 * Post revision history — one implementation for Studio and the admin API.
 *
 * This used to exist three times: once in the Studio action, which pruned to
 * the newest 30, and once in each API handler, which did not. The blog
 * automation writes through the API every day, so `post_revisions` grew without
 * bound on exactly the path that writes the most. Having the two copies drift is
 * the same way PATCH came to skip auto-linking; the rule now lives in one place.
 */

/** Revisions kept per post. Older ones are deleted when a new one is recorded. */
export const MAX_POST_REVISIONS = 30

export type PostRevisionInput = {
  postId: number
  title: string
  /** The Lexical editor state, already serialised to JSON. */
  content: string
  status: string
  /** Studio user id, or null for an API write. */
  authorId: number | null
  /** Shown in Studio → Revision history. */
  authorName: string
  note: string | null
}

/**
 * Record a revision and prune to the newest `MAX_POST_REVISIONS`. Call it
 * inside the same transaction as the post write, so a failed save never leaves
 * a revision behind.
 */
export async function recordPostRevision(
  client: Pick<PoolClient, 'query'>,
  rev: PostRevisionInput,
): Promise<void> {
  await client.query(
    `INSERT INTO post_revisions (post_id, title, content, status, author_id, author_name, note)
     VALUES ($1, $2, $3::jsonb, $4, $5, $6, $7)`,
    [rev.postId, rev.title, rev.content, rev.status, rev.authorId, rev.authorName, rev.note],
  )
  await client.query(
    `DELETE FROM post_revisions WHERE post_id = $1 AND id NOT IN (
       SELECT id FROM post_revisions WHERE post_id = $1 ORDER BY created_at DESC, id DESC LIMIT $2
     )`,
    [rev.postId, MAX_POST_REVISIONS],
  )
}
