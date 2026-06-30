import 'server-only'

import { query } from '@/db/client'
import { getIntegration, googleConfigured } from '@/lib/google'
import { getResendDomainStatus, type ResendDomainStatus } from '@/lib/notify'

export type IntegrationStatus = {
  name: string
  ok: boolean
  detail: string
  envVars: string[]
}

const has = (k: string) => Boolean(process.env[k])

type EmailHealth = { sent: boolean; error: string | null; at: string }

/**
 * The Resend `/domains` endpoint requires a "Full access" API key — a key
 * scoped to "Sending access only" 401s on it even though actual sends work
 * fine. So the domains check alone can't tell us whether mail is really
 * going out. The leads table already records the outcome of every real send
 * attempt (src/app/actions/submit-lead.ts), which is a more trustworthy
 * signal than the diagnostic API call — use it as the source of truth and
 * fall back to the domains check only when there's no send history yet.
 */
async function getRecentEmailHealth(): Promise<EmailHealth | null> {
  try {
    const rows = await query<EmailHealth & { created_at: string }>(
      `SELECT email_sent AS sent, email_error AS error, created_at AS at FROM leads
       WHERE email_sent = true OR email_error IS NOT NULL
       ORDER BY created_at DESC LIMIT 1`,
    )
    return rows[0] ?? null
  } catch {
    return null
  }
}

function resendDomainDetail(status: ResendDomainStatus | null, health: EmailHealth | null): string {
  if (health) {
    return health.sent
      ? 'Confirmed working — the most recent lead notification email sent successfully.'
      : `The most recent lead notification email failed to send: ${health.error}`
  }
  if (!status) return 'Owner alert, customer auto-reply, @mention and follow-up emails.'
  if (!status.checked) return `Key is set, but couldn't verify the sending domain (${status.reason}).`
  if (!status.found) {
    return `Domain "${status.domain}" hasn't been added to Resend yet — emails will fail until it is.`
  }
  if (status.status === 'verified') return `Sending domain "${status.domain}" is verified.`
  return `Domain "${status.domain}" is added but not verified yet (status: ${status.status}) — emails are failing.`
}

/** Live status of every optional integration, for the Setup page. */
export async function getIntegrationStatuses(): Promise<IntegrationStatus[]> {
  const google = googleConfigured() ? await getIntegration().catch(() => null) : null
  const resendDomain = has('RESEND_API_KEY') ? await getResendDomainStatus() : null
  const emailHealth = has('RESEND_API_KEY') ? await getRecentEmailHealth() : null

  return [
    {
      name: 'Lead email alerts (Resend)',
      ok: emailHealth
        ? emailHealth.sent
        : resendDomain?.checked === true && resendDomain.found && resendDomain.status === 'verified',
      detail: resendDomainDetail(resendDomain, emailHealth),
      envVars: ['RESEND_API_KEY', 'LEAD_FROM_EMAIL', 'LEAD_NOTIFICATION_EMAIL'],
    },
    {
      name: 'Owner SMS (Twilio)',
      ok: has('TWILIO_ACCOUNT_SID') && has('TWILIO_AUTH_TOKEN') && has('TWILIO_FROM_NUMBER'),
      detail: 'Text the owner the moment a new lead arrives.',
      envVars: ['TWILIO_ACCOUNT_SID', 'TWILIO_AUTH_TOKEN', 'TWILIO_FROM_NUMBER', 'LEAD_SMS_TO'],
    },
    {
      name: 'Spam protection (Turnstile)',
      ok: has('TURNSTILE_SECRET_KEY') && has('NEXT_PUBLIC_TURNSTILE_SITE_KEY'),
      detail: 'Cloudflare bot challenge on the public quote form.',
      envVars: ['NEXT_PUBLIC_TURNSTILE_SITE_KEY', 'TURNSTILE_SECRET_KEY'],
    },
    {
      name: 'Website analytics capture (PostHog)',
      ok: has('NEXT_PUBLIC_POSTHOG_KEY'),
      detail: 'Collects visits, journeys and clicks on the public site.',
      envVars: ['NEXT_PUBLIC_POSTHOG_KEY', 'NEXT_PUBLIC_POSTHOG_HOST'],
    },
    {
      name: 'Analytics dashboard (PostHog API)',
      ok: has('POSTHOG_API_KEY') && has('POSTHOG_PROJECT_ID'),
      detail: 'Shows traffic and journeys in Studio → Analytics.',
      envVars: ['POSTHOG_PROJECT_ID', 'POSTHOG_API_KEY'],
    },
    {
      name: 'Error tracking (Sentry)',
      ok: has('SENTRY_AUTH_TOKEN'),
      detail: 'Surfaces unresolved errors in Studio → Analytics.',
      envVars: ['SENTRY_AUTH_TOKEN'],
    },
    {
      name: 'Google Business Profile',
      ok: Boolean(google?.connected && google?.locationName),
      detail: google?.connected
        ? google.locationName
          ? `Connected${google.locationTitle ? ` · ${google.locationTitle}` : ''}.`
          : 'Connected — choose a business location.'
        : googleConfigured()
          ? 'Keys set — connect your Google account in Business Info.'
          : 'Sync and reply to Google reviews.',
      envVars: ['GOOGLE_CLIENT_ID', 'GOOGLE_CLIENT_SECRET'],
    },
    {
      name: 'Media uploads (Supabase Storage)',
      ok: has('SUPABASE_URL') && has('SUPABASE_SERVICE_ROLE_KEY'),
      detail: 'Upload images from Studio and via the API (hero images).',
      envVars: ['SUPABASE_URL', 'SUPABASE_SERVICE_ROLE_KEY'],
    },
    {
      name: 'Blog API (programmatic posting)',
      ok: has('BLOG_API_TOKEN'),
      detail: 'Create blog posts via POST /api/blog/publish with a Bearer token.',
      envVars: ['BLOG_API_TOKEN'],
    },
    {
      name: 'Scheduled jobs (Cron secret)',
      ok: has('CRON_SECRET'),
      detail: 'Protects the /api/cron/tick worker endpoint.',
      envVars: ['CRON_SECRET'],
    },
  ]
}
