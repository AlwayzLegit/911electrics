-- QA data fixes for the production database.
-- Run in the Supabase SQL editor (or psql) for project 911-electrics.
-- These are data changes that cannot ship in application code.
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
