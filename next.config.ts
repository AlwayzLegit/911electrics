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
    const securityHeaders = [
      { key: 'X-Content-Type-Options', value: 'nosniff' },
      { key: 'X-Frame-Options', value: 'SAMEORIGIN' },
      { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
      { key: 'Permissions-Policy', value: 'camera=(), microphone=(), geolocation=()' },
      { key: 'Strict-Transport-Security', value: 'max-age=63072000; includeSubDomains; preload' },
    ]

    return [{ source: '/:path*', headers: securityHeaders }]
  },
  turbopack: {
    root: path.resolve(dirname),
  },
}

export default withSentryConfig(nextConfig, {
  org: '911electrics',
  project: '911electrics-web',
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
