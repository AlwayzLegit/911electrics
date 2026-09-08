# Blog Automation Handoff — utilities & internal linking

This is the brief for whatever writes the scheduled blog posts (the AI writer /
automation that `POST`s to the blog API). Two things must be right on every
post: **which utility serves the city**, and **internal links to our service
pages**. Paste the rules below into the writer's system prompt / content brief.

---

## 1. How posts reach the site

Posts are created by `POST`ing to **`/api/blog/publish`** with a bearer token.
You send Markdown (or raw Lexical); the API converts it, stores it, and (for
`status: "published"`) makes it live immediately. `status: "draft"` with a
`scheduled_for`-style flow is published later by the cron worker
(`/api/cron/tick`, run on a Vercel schedule).

- **Auth:** `Authorization: Bearer <BLOG_API_TOKEN>` (the token already
  configured for the automation — do not paste it into posts or commits).
- **List recent posts** to avoid duplicate slugs/topics: `GET /api/blog/publish`.
- After publish the API revalidates `/blog`, the new post, and the sitemap
  automatically — no extra cache step needed for API-created posts.

Minimal body:

```json
{
  "title": "Why a Panel Upgrade Pays Off in Pasadena",
  "markdown": "## Intro\n\nFull post body in Markdown …",
  "excerpt": "One-sentence summary for cards and meta description.",
  "categories": ["Panel Upgrades"],
  "heroImageUrl": "https://…/hero.jpg",
  "heroImageAlt": "200-amp electrical panel installed in a Pasadena home",
  "status": "published"
}
```

---

## 2. Utility per city — get this right

Most of LA County is **Southern California Edison (SCE)**, but two cities we
target run their **own municipal utility**. Using "SCE" for these two is wrong
and undercuts trust with local readers.

| City | Utility | Notes |
|------|---------|-------|
| **Pasadena** | **Pasadena Water & Power (PWP)** | Municipal. Rebates: up to **$1,000** panel upgrade, up to **$600** home EV charger. Amounts/eligibility change — say "up to" and "confirm current terms with PWP". |
| **Glendale** | **Glendale Water & Power (GWP)** | Municipal. Has its own rebate programs — do not cite SCE amounts for Glendale. |
| Everywhere else we serve | **Southern California Edison (SCE)** | LA, Burbank*, Altadena, Arcadia, Alhambra, San Marino, Sierra Madre, Temple City, San Gabriel, Monrovia, South Pasadena, and the rest. |

\* **Burbank** is actually served by **Burbank Water & Power (BWP)** — another
municipal utility. If a post is Burbank-specific, name BWP, not SCE.

**Rules for the writer:**

- If the post's city is **Pasadena → PWP**, **Glendale → GWP**, **Burbank →
  BWP**. Otherwise **SCE**.
- It's fine to mention SCE as a *contrast* in a PWP/GWP post ("unlike SCE
  customers, Pasadena homeowners go through PWP…") — that's accurate and
  actually targets searches like *"PWP vs SCE Pasadena"*.
- Don't invent exact rebate dollar amounts for a utility you're not sure about.
  Use the PWP figures above; for GWP/BWP, say "check the utility's current
  rebate program" rather than quoting a number.
- High-value, low-competition keywords to work in naturally where relevant:
  *Pasadena Water and Power panel upgrade*, *PWP panel upgrade rebate*, *PWP EV
  charger rebate*, *PWP vs SCE Pasadena*, *Glendale Water and Power panel
  upgrade*, *SCE Charge Ready Home eligibility*.

---

## 3. Internal links to service pages

Linking topic mentions to the matching service page is one of the strongest
on-page SEO signals we have. **The blog API now does a baseline pass of this
automatically** (`src/lib/auto-link-services.ts`): on every publish it links the
**first** mention of each core topic to its service page — at most one link per
service and 4 per post, never inside an existing link or a heading.

That safety net means posts are never link-less, but the automatic pass is
deliberately minimal. **Writers should still add their own contextual links**
in Markdown where it reads naturally — especially the anchor text a human would
click ("upgrade your panel", "install an EV charger"). Author links win; the
auto-linker only fills first-mention gaps it finds.

**Canonical service URLs (use these exact paths):**

| Topic / anchor phrases | Link to |
|------------------------|---------|
| panel upgrade, electrical panel upgrade, 200-amp panel/service, service upgrade | `https://911electrics.com/electrical-panel-upgrades-los-angeles-ca/` |
| EV charger, EV charger installation, Level 2 charger, NEMA 14-50, Tesla Wall Connector | `https://911electrics.com/ev-charger-installation-los-angeles-ca/` |
| rewiring, knob-and-tube, aluminum wiring, electrical repair, troubleshooting | `https://911electrics.com/electrical-repairs-los-angeles-ca/` |
| lighting installation, recessed lighting, landscape lighting | `https://911electrics.com/lighting-installation-upgrades-los-angeles-ca/` |
| new construction, ADU wiring | `https://911electrics.com/new-construction-electrical-los-angeles-ca/` |
| emergency electrician, 24/7, power outage | `https://911electrics.com/emergency-electrician-los-angeles-ca/` |

Markdown link syntax (converted to real links server-side):

```markdown
A [panel upgrade](https://911electrics.com/electrical-panel-upgrades-los-angeles-ca/)
is usually required before an
[EV charger installation](https://911electrics.com/ev-charger-installation-los-angeles-ca/)
in an older Pasadena home.
```

Guidelines:

- Link the **first natural mention** of a topic, not every mention.
- 2–5 internal links per post is plenty. Don't stuff.
- Link the descriptive phrase, not "click here".
- For a **city** post, you can also link the city's own page, e.g.
  `https://911electrics.com/electrician-pasadena-ca/`.

---

## 4. Worked example (Pasadena, published post #7)

The Pasadena panel-upgrade rebate post now ends with this section — it is the
pattern to copy for utility accuracy + internal links:

```markdown
## Pasadena Water & Power (PWP) Rebates

Pasadena runs on its own municipal utility, Pasadena Water & Power (PWP) — not
Southern California Edison — so its rebate programs and amounts differ from
SCE's. Pasadena homeowners can currently qualify for up to **$1,000 toward an
[electrical panel upgrade](https://911electrics.com/electrical-panel-upgrades-los-angeles-ca/)**
and up to **$600 toward a home
[EV charger installation](https://911electrics.com/ev-charger-installation-los-angeles-ca/)**
through PWP. Amounts and eligibility change, so confirm the current terms on
PWP's website before you apply …
```

---

## 5. Quick checklist per post

- [ ] Correct utility for the city (PWP / GWP / BWP / SCE).
- [ ] No SCE rebate figures attributed to a PWP/GWP/BWP city.
- [ ] 2–5 internal links to the service pages above, first-mention, natural anchors.
- [ ] Unique title + slug (check `GET /api/blog/publish`).
- [ ] `excerpt` set (drives the card + meta description).
- [ ] Hero image with descriptive `heroImageAlt`.
