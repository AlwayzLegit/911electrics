# Site Manager Guide — 911 Construction & Electric

Everything you need to run the website yourself. No developer required for day-to-day changes — **everything you publish goes live within seconds.**

## Logging in

1. Go to **yoursite.com/admin** (works on the Vercel URL too)
2. Sign in with your email. *Change your password after first login:* click your avatar (top-right) → Account → set a new password.

The dashboard shows shortcut buttons for the most common tasks.

## Quote requests (your leads)

**Inbox → Leads.** Every quote/contact form submission lands here instantly with the customer's name, phone, email, message, and which page they came from.

- Click a lead to see full details
- Use the **Status** field on the right as your mini-CRM: New → Contacted → Quoted → Won / Lost
- Leads are never deleted automatically. Spam protection runs on every form, but if junk slips through, set its status to Spam or delete it.
- *(Once a Resend email key is connected, each new lead is also emailed to info@911electrics.com.)*

## Writing a blog post

1. **Content → Posts → Create New**
2. Title, then write in the editor (press `/` for headings, lists, links)
3. Add a hero image, pick the category, and fill the **SEO tab** (title + description shown on Google)
4. Click **Publish** — or use the arrow next to Publish to **schedule** it for later (scheduled posts go out daily at 8 AM)

The blog index, sitemap, and the page itself update automatically.

## Adding a customer review

1. **Content → Testimonials → Create New**
2. Paste the review text, the customer's name, their city, and the star rating
3. Tick **Featured** to show it in the homepage "What Clients Say" carousel
4. Optionally pick which city pages it should also appear on

Also update **Site → Site Settings → Web Presence → Aggregate Rating** with your real Google review count — that makes the "5.0 rating · N+ reviews" badge appear in the hero of every page.

## Editing pages

- **Homepage:** Site → Homepage (hero text, the 3 steps, about section, FAQs)
- **All 43 city pages at once:** Site → City Page Template — write `{{city}}` wherever the city name should appear
- **One specific city:** Content → Cities → pick the city → fill any field in the *Overrides* tab (only that city changes). Adding neighborhoods and local notes per city is great for Google rankings.
- **Service pages:** Content → Services (features, benefits, FAQs, photos per service)
- **Business info everywhere** (phone, address, hours, social links): Site → Site Settings

While editing Services, Cities, Posts, or Pages, click the **eye icon** for a live side-by-side preview before publishing. Every edit keeps version history — open **Versions** at the top of any document to restore an older one.

## Photos & files

**Library → Media.** Upload images here (or directly from any image field). Add **Alt text** — it helps SEO and accessibility.

## If a page URL must change

Never just rename a page that's been live — add a redirect so old links keep working: **System → Redirects → Create New**, enter the old path (e.g. `/old-page/`) and where it should go.

## Rules of thumb

1. **Don't change page titles, headings, or URLs of existing pages** until your developer confirms Google rankings have stabilized after the migration.
2. Publish freely — drafts are invisible to visitors until you hit Publish, and everything is reversible through Versions.
3. The reviews section and rating badge stay hidden until you add testimonials and a review count — nothing looks broken in the meantime, it just doesn't show.
