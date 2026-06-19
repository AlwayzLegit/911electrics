import { withSentryConfig } from '@sentry/nextjs'
import type { NextConfig } from 'next'
import path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(__filename)
import { redirects } from './redirects'

const NEXT_PUBLIC_SERVER_URL = process.env.VERCEL_PROJECT_PRODUCTION_URL
  ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
  : process.env.__NEXT_PRIVATE_ORIGIN || 'http://localhost:3000'

const nextConfig: NextConfig = {
  // All legacy WordPress URLs end in a trailing slash — keep them identical for SEO.
  trailingSlash: true,
  images: {
    formats: ['image/avif', 'image/webp'],
    localPatterns: [
      {
        // Static media assets in /public/media (service/post/hero images, logos).
        pathname: '/media/**',
      },
    ],
    qualities: [75, 100],
    remotePatterns: [
      ...[NEXT_PUBLIC_SERVER_URL /* 'https://example.com' */].map((item) => {
        const url = new URL(item)

        return {
          hostname: url.hostname,
          protocol: url.protocol.replace(':', '') as 'http' | 'https',
        }
      }),
      // Studio media uploaded to Vercel Blob.
      { protocol: 'https' as const, hostname: '*.public.blob.vercel-storage.com' },
    ],
  },
  webpack: (webpackConfig) => {
    webpackConfig.resolve.extensionAlias = {
      '.cjs': ['.cts', '.cjs'],
      '.js': ['.ts', '.tsx', '.js', '.jsx'],
      '.mjs': ['.mts', '.mjs'],
    }

    return webpackConfig
  },
  reactStrictMode: true,
  redirects,
  headers: async () => {
    // Enforced now — these directives can't block scripts/styles/images, so
    // they're safe without per-request nonces or browser testing.
    const cspEnforced = [
      "base-uri 'self'",
      "object-src 'none'",
      "form-action 'self'",
      "frame-ancestors 'self'",
    ].join('; ')

    // Full policy shipped Report-Only first: it logs violations to the console
    // without blocking anything, so the third-party allowlist (analytics, error
    // tracking, bot challenge, blob images) can be verified before it's
    // promoted to an enforced Content-Security-Policy.
    const cspReportOnly = [
      "default-src 'self'",
      "script-src 'self' 'unsafe-inline' https://*.posthog.com https://*.i.posthog.com https://www.googletagmanager.com https://challenges.cloudflare.com",
      "style-src 'self' 'unsafe-inline'",
      "img-src 'self' data: blob: https:",
      "font-src 'self' data:",
      "connect-src 'self' https://*.posthog.com https://*.i.posthog.com https://www.google-analytics.com https://*.ingest.sentry.io https://*.ingest.us.sentry.io https://challenges.cloudflare.com https://*.public.blob.vercel-storage.com",
      "frame-src 'self' https://challenges.cloudflare.com",
      "base-uri 'self'",
      "object-src 'none'",
      "form-action 'self'",
      "frame-ancestors 'self'",
    ].join('; ')

    const securityHeaders = [
      { key: 'X-Content-Type-Options', value: 'nosniff' },
      { key: 'X-Frame-Options', value: 'SAMEORIGIN' },
      { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
      { key: 'Permissions-Policy', value: 'camera=(), microphone=(), geolocation=()' },
      { key: 'Strict-Transport-Security', value: 'max-age=63072000; includeSubDomains; preload' },
      { key: 'Content-Security-Policy', value: cspEnforced },
      { key: 'Content-Security-Policy-Report-Only', value: cspReportOnly },
    ]

    return [{ source: '/:path*', headers: securityHeaders }]
  },
  turbopack: {
    root: path.resolve(dirname),
  },
}

export default withSentryConfig(nextConfig, {
  // Env-driven so a new Sentry account is just env vars, no code change.
  // Unset → source-map upload is skipped (the build still succeeds).
  org: process.env.SENTRY_ORG,
  project: process.env.SENTRY_PROJECT,
  // Quiet build logs locally; verbose only in CI.
  silent: !process.env.CI,
  // Upload a wider set of client bundles so stack traces resolve fully.
  // Source-map upload requires SENTRY_AUTH_TOKEN at build time (e.g. a Vercel
  // Production env var). Builds still succeed without it.
  widenClientFileUpload: true,
  // Tree-shake Sentry logger statements from the client bundle.
  disableLogger: true,
  // Auto-instrument Vercel Cron Monitors.
  automaticVercelMonitors: true,
})
