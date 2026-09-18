# Site Manager Guide — 911 Construction & Electric

Everything you need to run the website yourself. No developer needed for
day-to-day changes — **what you publish goes live within seconds.**

You manage the site in **Studio**: <https://911electrics.com/studio>

> There is no `/admin` any more. If you have an old bookmark or an older copy of
> this guide that mentions it, use `/studio`.

---

## Signing in

1. Go to **911electrics.com/studio** and sign in with your email and password.
2. **Forgot password?** on the sign-in page emails you a link that is good for
   60 minutes. If you ask twice in a row, the second request is ignored for
   five minutes — use the link you already have.
3. Five wrong passwords lock the account for 15 minutes. Wait it out, or have
   another admin set a new password for you under **Team**.

### Turn on two-factor sign-in (recommended)

**Account → Two-factor authentication.** Scan the code with an authenticator
app (Google Authenticator, 1Password, Authy…), enter the 6-digit code to
confirm, and **save the recovery codes somewhere safe** — each one works once
if you lose your phone. An admin can also reset your two-factor from **Team**.

**Account → Active sessions** lists every device signed in as you. Sign out any
you don't recognise.

---

## Quote requests (your leads)

**Quote Requests** in the left menu. Every quote / contact form submission lands
here immediately with the customer's name, phone, email, message, the page they
were on, and the ad or campaign that brought them (if any).

- **Search** by name, phone or email; filter by status; **Export CSV** for a
  spreadsheet.
- Open a lead to change its **status** — New → Contacted → Quoted → Won / Lost —
  assign it to a teammate, and add notes. Type `@name` in a note to notify that
  person.
- Under **Deal**, record an estimated value and a **Next follow-up** time. Times
  are **Pacific**. When a follow-up comes due, the person the lead is
  **assigned to** gets a reminder email — so assign the lead first; an
  unassigned lead sends no reminder. Reminders go out with the twice-daily
  check (early morning and around midday), and not for leads marked Won, Lost
  or Spam.
- **Pipeline** shows the same leads as a board — drag a card between columns to
  change its status.
- **Spam** is kept, not deleted. Anything the spam filter catches is saved with
  the status *Spam*, so a real customer who was caught by mistake can be
  rescued: open it and set the status back to *New*.
- **Templates** holds reusable replies for leads and reviews.

New leads are also emailed to the business inbox, and the customer gets an
automatic confirmation. If those emails ever stop, **Setup** (below) will show
"Lead email" in red, and the lead itself will say the email failed.

---

## Writing a blog post

1. **Blog Posts → New post.**
2. **Title**, then write in the editor. The toolbar has bold / italic, headings
   (H2, H3), quotes, lists and links (`Ctrl+K`).
3. Choose a **Hero image** — pick an existing one or upload a new one. Uploads
   must be **JPG, PNG, WebP, AVIF or GIF, under 8 MB**, and need **alt text**
   (a short description — it helps Google and screen readers).
4. Tick the **Categories**, and fill in **SEO → Meta title** and **Meta
   description** (what shows on Google).
5. Set **Status**:
   - **Draft (hidden)** — only visible in Studio.
   - **Published (live)** — on the site within seconds.
   - **Scheduled (auto-publish)** — pick a date and time (**Pacific**). Scheduled
     posts are released by a check that runs **twice a day, early morning and
     around midday**, so a post goes live at the first check after the time you
     chose — not on the minute.

The blog page, the sitemap and the post itself update on their own. Links to
your service pages, and to the city page when a post is about one city, are
added automatically when a post comes in through the blog automation.

**Made a mistake?** Open the post → **Revision history** → **Restore**. The last
30 versions of every post are kept.

---

## Customer reviews

**Reviews → New review.** Enter the reviewer's name, their city, the star
rating, the text, and where it came from. Tick **Featured** to show it in the
"What Clients Say" carousel on the homepage.

The **"5.0 rating · N+ reviews"** badge is set by hand: **Business Info →
Rating value / Rating count**. Keep it true to your real Google numbers.

> **Google review sync is not switched on yet.** Studio has a screen for pulling
> reviews from your Google Business Profile and replying to them (**Reviews →
> Google**), but it needs a one-time developer setup first. Until then, add
> reviews by hand. **Setup** shows whether it is connected.

---

## Editing pages

| To change… | Go to… |
|---|---|
| A **service page** — features, benefits, FAQs, photos | **Services** → pick the service |
| **One city page** — hero heading, intro, neighbourhoods, FAQs, **local notes** | **Service Areas** → pick the city |
| **Phone, address, hours, licence number, social links, rating badge** — everywhere at once | **Business Info** |
| The **homepage** text, or the wording shared by **all city pages** | Not editable in Studio yet — ask your developer |

**Local notes** on a city are worth your time. They are the one part of a city
page that is genuinely about that city — real streets and landmarks, the age of
the housing, which utility serves it, who issues the permit — and they also
appear on that city's six service pages. That is what makes those pages rank.

There is no media library screen: upload images from the image field of
whatever you are editing, and they become available everywhere.

---

## If a page's address must change

Never just rename a live page — add a redirect so old links and Google rankings
carry over. **Redirects → Add redirect**: the old path (`/old-page/`) and where
it should go. You can paste many at once with **Bulk import**.

**Redirects take effect on the next site deployment, not instantly.** If you
need one live today, tell your developer.

---

## Your team

**Team** (admins only). **Add user**, choose **Admin** (everything) or
**Editor**, and for an editor tick what they may touch: *Leads & pipeline*,
*Content*, *Reviews*. You can email them a set-password link, reset their
password or two-factor, and disable an account — which signs them out
everywhere at once. The last admin can't be removed or demoted.

**Audit log** records who changed what, including failed sign-in attempts and
anything done by an automation.

---

## Automations and API keys

**API keys** (admins only) is where you let a program or an AI assistant work on
the site without a Studio login. Each key has a name, a list of things it may do,
and an optional expiry. Give every tool **its own key with only what it needs**
— the blog writer gets the *Blog writer* preset, nothing more. Everything a key
does appears in the Audit log under its name, and **Revoke** stops it instantly.

A key is shown **once**, when you create it. If you lose it, revoke it and make
another.

---

## Is everything working?

**Setup** lists every service the site depends on — lead email, spam
protection, analytics, error tracking, image uploads, scheduled jobs — with a
green or red status and what each one needs. The **Dashboard** warns you when
something that *was* working breaks.

---

## Rules of thumb

1. **Don't change the title, main heading or URL of a page that already
   exists.** The site ranks on Google for them exactly as they are. That
   includes blog posts — several of them bring in more visitors than any other
   page. New pages and new posts are fine.
2. **Publish freely.** Drafts are invisible until you publish, and posts can be
   rolled back from Revision history.
3. **Deleting is permanent.** There is no trash. Set something to *Draft* to
   hide it instead.
4. **One key per tool, one login per person.** Never share a password or paste
   an API key into an email or a chat.
