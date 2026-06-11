// Quick connectivity test against the database in DATABASE_URL.
// Run: node scripts/test-db.mjs
import 'dotenv/config'
import pg from '../node_modules/.pnpm/pg@8.20.0/node_modules/pg/lib/index.js'

const url = process.env.DATABASE_URL
if (!url) {
  console.error('DATABASE_URL not set')
  process.exit(1)
}

const client = new pg.Client({ connectionString: url, ssl: { rejectUnauthorized: false }, connectionTimeoutMillis: 8000 })
try {
  await client.connect()
  const r = await client.query('select current_user, current_database()')
  console.log(`OK -> ${r.rows[0].current_user}@${r.rows[0].current_database}`)
  await client.end()
} catch (e) {
  console.error(`ERR -> ${e.message}`)
  process.exit(1)
}
