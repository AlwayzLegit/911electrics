# 911electrics.com

Custom rebuild of the 911 Construction & Electric Inc. website — migrated from WordPress with byte-identical SEO preservation.

- **Frontend:** Next.js 16 (App Router), Tailwind CSS 4, fully static with on-demand revalidation
- **CMS:** Payload 3 embedded in the same app — admin panel at `/admin`
- **Database:** Postgres on Supabase (Supavisor transaction pooler)
- **Hosting:** Vercel (`vercel.json` includes a daily cron that runs scheduled publishing)

## Local development

```bash
pnpm install
cp .env.example .env   # then fill in real values (see below)
pnpm dev               # http://localhost:3000, admin at /admin
```

### Environment variables

| Variable | Purpose |
|---|---|
| `DATABASE_URL` | Postgres connection (use the Supavisor **transaction pooler, port 6543** in serverless) |
| `PAYLOAD_SECRET` | Encrypts Payload auth tokens |
| `CRON_SECRET` | Authorizes the scheduled-publishing cron (`/api/payload-jobs/run`) |
| `PREVIEW_SECRET` | Validates draft-preview requests |
| `NEXT_PUBLIC_SERVER_URL` | Canonical origin, no trailing slash (`https://911electrics.com`) |
| `RESEND_API_KEY` *(optional)* | Emails lead notifications to the business; leads are stored in the DB regardless |
| `LEAD_NOTIFICATION_EMAIL` *(optional)* | Override notification recipient (defaults to Site Settings email) |
| `NEXT_PUBLIC_GA_ID` *(optional)* | Enables GA4 + phone-click conversion tracking |
| `TURNSTILE_SECRET_KEY` / `NEXT_PUBLIC_TURNSTILE_SITE_KEY` *(optional)* | Adds Cloudflare Turnstile on top of the built-in honeypot + time-trap |

## Architecture notes

- **Root-slug routing:** services, city pages, and blog posts all render at `/{slug}/` (mirroring WordPress). `src/app/(frontend)/[slug]/page.tsx` resolves a slug against all collections; a `beforeValidate` hook enforces slug uniqueness across them.
- **City pages:** 43 pages render from one `{{city}}`-tokenized template global (`City Page Template` in the admin) with optional per-city overrides — see `src/lib/interpolate.ts`.
- **SEO invariants:** every legacy WordPress URL, `<title>`, and `<h1>` is preserved verbatim. Old Yoast sitemap URLs, feeds, and `/wp-content/uploads/*` media URLs 301 to their new equivalents. **Do not change titles/H1s/slugs until rankings stabilize after launch.**
- **Leads:** form submissions go through a server action (`src/app/actions/submit-lead.ts`) — validated, spam-checked, written to the `leads` collection (admin Inbox), then emailed best-effort. Public API access to leads is blocked.
- **Publishing:** collection hooks revalidate affected pages on publish — content changes go live in seconds without a redeploy.

## Verification suite

Run against any environment (`BASE` defaults to `http://localhost:3000`):

```bash
node scripts/verify-parity.mjs       [BASE]  # 79 checks: legacy URLs, verbatim titles/H1s, redirects
node scripts/verify-legacy-links.mjs [BASE]  # every <a href> found in the WordPress snapshot resolves
node scripts/crawl-site.mjs          [BASE]  # BFS crawl: every page, link, and asset returns 200
pnpm exec tsx scripts/audit-content-completeness.ts  # WP snapshot vs database structural diff
```

Against a protection-gated Vercel deployment:

```bash
node scripts/with-vercel-auth.mjs <shareUrl> scripts/verify-parity.mjs <deploymentUrl>
```

`wp-snapshot/` holds the full capture of the legacy WordPress site (HTML, REST exports, Yoast metadata) — the migration source of truth. Media binaries inside it are gitignored and re-downloadable via `scripts/download-media.mjs`.

## Operations

See **[OWNERS-GUIDE.md](OWNERS-GUIDE.md)** for the non-technical handbook (editing content, publishing posts, managing quote requests).
