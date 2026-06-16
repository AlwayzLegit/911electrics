// Sentry initialization for the Edge runtime (middleware, edge routes).
// Loaded from src/instrumentation.ts via the Next.js `register` hook.
import * as Sentry from '@sentry/nextjs'

const dsn =
  process.env.NEXT_PUBLIC_SENTRY_DSN ||
  'https://61e39fc530a4d81203261c3d31592b9a@o4511575678517249.ingest.us.sentry.io/4511575758405632'

Sentry.init({
  dsn,
  enabled: process.env.NODE_ENV === 'production',
  environment: process.env.VERCEL_ENV || process.env.NODE_ENV,
  tracesSampleRate: 1.0,
  sendDefaultPii: false,
  debug: false,
})
