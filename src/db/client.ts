import 'server-only'

import postgres from 'postgres'

/**
 * Payload-free database client.
 *
 * The site is migrating off Payload; this is the direct, typed Postgres access
 * layer that both the public site and the Studio admin read from. It talks to
 * the same Supabase database Payload created, so no data migration is needed —
 * we just read the tables directly.
 *
 * A single pooled client is reused across the serverless lambda. We keep the
 * pool small because Vercel runs many concurrent instances against Supabase.
 */
declare global {
  // eslint-disable-next-line no-var
  var __sql: ReturnType<typeof postgres> | undefined
}

const connectionString = process.env.DATABASE_URL

if (!connectionString) {
  throw new Error('DATABASE_URL is not set')
}

export const sql =
  globalThis.__sql ??
  postgres(connectionString, {
    // Keep the footprint tiny: this coexists with Payload's own pool during
    // the migration, and the queries are few and cached. A large pool here
    // exhausts the Supabase pooler under build-time concurrency.
    max: 2,
    idle_timeout: 20,
    connect_timeout: 10,
    // Supabase's transaction pooler doesn't support prepared statements.
    prepare: false,
  })

if (process.env.NODE_ENV !== 'production') {
  globalThis.__sql = sql
}
