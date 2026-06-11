-- QA data fixes for the production database.
--
-- STATUS: APPLIED to production on 2026-06-11 (including the latest-version
-- rows in _services_v/_cities_v/_posts_v so the admin edit view matches).
-- Kept for reference; every statement is idempotent / safe to re-run.
--
-- IMPORTANT: these tables are owned by the `payload` role, and Supabase's
-- `postgres` role (what the SQL editor uses) has NO write access to them and
-- cannot SET ROLE payload. Running this in the Supabase SQL editor fails with
-- `42501: permission denied`. Run it as the `payload` role instead, using the
-- same connection string your Payload app uses (the DATABASE_URL in your
-- Vercel env):
--
--   psql "$DATABASE_URL" -f scripts/migrate/qa-fixes.sql
--
-- The logo/OG and the two deletions can also just be done in the Payload admin
-- UI (which connects as `payload`); only the bulk meta-title update below is
-- impractical by hand.
--
-- Every statement is idempotent / safe to re-run.

-- 1. Wire the real company logo (already in the Media library, migrated from
--    the live site) into Site Settings, so the header, schema.org and default
--    OG card resolve to the admin-managed asset.
UPDATE site_settings
SET logo_id = (SELECT id FROM media WHERE filename = '911CE-removebg-preview.png'),
    default_o_g_image_id = (SELECT id FROM media WHERE filename = '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background.png')
WHERE id = 1;

-- 2. Shorten SEO meta titles so they fit Google's ~60-char display limit.
--    Pipe-style suffix -> short brand.
UPDATE services SET meta_title = regexp_replace(meta_title, ' \| 911 Construction & Electric Inc\.?$', ' | 911 Electric') WHERE meta_title ~ ' \| 911 Construction & Electric Inc\.?$';
UPDATE cities   SET meta_title = regexp_replace(meta_title, ' \| 911 Construction & Electric Inc\.?$', ' | 911 Electric') WHERE meta_title ~ ' \| 911 Construction & Electric Inc\.?$';
UPDATE posts    SET meta_title = regexp_replace(meta_title, ' \| 911 Construction & Electric Inc\.?$', ' | 911 Electric') WHERE meta_title ~ ' \| 911 Construction & Electric Inc\.?$';

--    Dash-style suffix: strip it; re-append the short brand only when it fits.
UPDATE services SET meta_title = CASE WHEN length(replace(meta_title, ' - 911 Construction & Electric Inc.', '')) <= 45 THEN replace(meta_title, ' - 911 Construction & Electric Inc.', '') || ' | 911 Electric' ELSE replace(meta_title, ' - 911 Construction & Electric Inc.', '') END WHERE meta_title LIKE '% - 911 Construction & Electric Inc.';
UPDATE cities   SET meta_title = CASE WHEN length(replace(meta_title, ' - 911 Construction & Electric Inc.', '')) <= 45 THEN replace(meta_title, ' - 911 Construction & Electric Inc.', '') || ' | 911 Electric' ELSE replace(meta_title, ' - 911 Construction & Electric Inc.', '') END WHERE meta_title LIKE '% - 911 Construction & Electric Inc.';
UPDATE posts    SET meta_title = CASE WHEN length(replace(meta_title, ' - 911 Construction & Electric Inc.', '')) <= 45 THEN replace(meta_title, ' - 911 Construction & Electric Inc.', '') || ' | 911 Electric' ELSE replace(meta_title, ' - 911 Construction & Electric Inc.', '') END WHERE meta_title LIKE '% - 911 Construction & Electric Inc.';

--    One-offs: stub city title, over-long post title, dangling trailing pipe.
UPDATE cities SET meta_title = 'Electrician Chatsworth CA: Trusted Electrical Services' WHERE slug LIKE '%chatsworth%';
UPDATE posts  SET meta_title = 'How to Choose a Licensed Electrician: Complete Guide' WHERE meta_title LIKE 'How to Choose a Licensed Electrician%';
UPDATE posts  SET meta_title = regexp_replace(meta_title, '\s*\|\s*$', '') WHERE meta_title ~ '\|\s*$';

-- 3. Remove leftover starter-template seed data.
DELETE FROM categories WHERE slug = 'maecenas';

-- 4. Remove the QA test lead submitted while verifying the form pipeline.
DELETE FROM leads WHERE name = 'TEST LEAD - Dashboard QA';
