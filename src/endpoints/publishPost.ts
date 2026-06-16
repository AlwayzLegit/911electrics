import type { Endpoint, PayloadRequest, RequiredDataFromCollectionSlug } from 'payload'

/**
 * Authenticated blogging API for automated/scheduled posting.
 *
 *   POST /api/blog/publish
 *   Authorization: Bearer <BLOG_API_TOKEN>
 *   Content-Type: application/json
 *
 * Body:
 * {
 *   "title":           "string (required)",
 *   "html":            "<h2>...</h2><p>...</p>  (article body; required unless `lexical` is given)",
 *   "lexical":         { ...Payload Lexical JSON... }   // optional alternative to `html`
 *   "slug":            "optional-custom-slug",          // else derived from the title (made unique)
 *   "excerpt":         "short summary -> meta.description",
 *   "metaTitle":       "optional SEO title",
 *   "metaDescription": "optional SEO description (falls back to excerpt)",
 *   "categories":      ["Panel Upgrades", "ev-chargers"],  // names or slugs; created if missing
 *   "heroImageId":     123,                               // optional existing Media id
 *   "publishedAt":     "2026-06-16T09:00:00.000Z",        // optional; defaults to now when published
 *   "status":          "published" | "draft"              // default "published"
 * }
 *
 * Returns: { ok, id, slug, status, url }
 */

const slugify = (input: string): string =>
  input
    .toLowerCase()
    .normalize('NFKD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)+/g, '')
    .slice(0, 80)

const json = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json' },
  })

const handler = async (req: PayloadRequest): Promise<Response> => {
  const { payload } = req

  // --- Auth: shared bearer token ---
  const expected = process.env.BLOG_API_TOKEN
  if (!expected) {
    return json({ ok: false, error: 'BLOG_API_TOKEN is not configured on the server' }, 503)
  }
  const auth = req.headers.get('authorization') || ''
  if (auth !== `Bearer ${expected}`) {
    return json({ ok: false, error: 'Unauthorized' }, 401)
  }

  // --- Parse body ---
  let body: Record<string, unknown>
  try {
    body = typeof req.json === 'function' ? await req.json() : ((req.data as Record<string, unknown>) ?? {})
  } catch {
    return json({ ok: false, error: 'Invalid JSON body' }, 400)
  }

  const title = typeof body.title === 'string' ? body.title.trim() : ''
  const html = typeof body.html === 'string' ? body.html : ''
  const lexical = body.lexical && typeof body.lexical === 'object' ? body.lexical : null
  if (!title) return json({ ok: false, error: '`title` is required' }, 400)
  if (!html && !lexical) return json({ ok: false, error: 'Provide `html` or `lexical` content' }, 400)

  const status = body.status === 'draft' ? 'draft' : 'published'

  try {
    // --- Content: convert HTML -> Lexical (lazy-load the heavy deps) ---
    let content = lexical as unknown
    if (!content) {
      const [{ convertHTMLToLexical, editorConfigFactory }, { JSDOM }] = await Promise.all([
        import('@payloadcms/richtext-lexical'),
        import('jsdom'),
      ])
      const editorConfig = await editorConfigFactory.default({ config: payload.config })
      content = await convertHTMLToLexical({ editorConfig, html, JSDOM })
    }

    // --- Categories: upsert by slug/name ---
    const categoryIds: (number | string)[] = []
    const rawCategories = Array.isArray(body.categories) ? body.categories : []
    for (const raw of rawCategories) {
      const name = String(raw).trim()
      if (!name) continue
      const slug = slugify(name)
      const existing = await payload.find({
        collection: 'categories',
        limit: 1,
        where: { or: [{ slug: { equals: slug } }, { title: { equals: name } }] },
      })
      const cat = existing.docs[0] ?? (await payload.create({ collection: 'categories', data: { title: name, slug } }))
      categoryIds.push(cat.id)
    }

    // --- Unique slug ---
    const base = typeof body.slug === 'string' && body.slug.trim() ? slugify(body.slug) : slugify(title)
    let slug = base || `post-${Date.now()}`
    for (let i = 2; i < 50; i++) {
      const clash = await payload.find({ collection: 'posts', limit: 1, where: { slug: { equals: slug } } })
      if (clash.docs.length === 0) break
      slug = `${base}-${i}`
    }

    const excerpt = typeof body.excerpt === 'string' ? body.excerpt.trim() : undefined
    const metaTitle = typeof body.metaTitle === 'string' ? body.metaTitle.trim() : undefined
    const metaDescription =
      typeof body.metaDescription === 'string' ? body.metaDescription.trim() : excerpt

    const data: Record<string, unknown> = {
      title,
      slug,
      content,
      _status: status,
      ...(categoryIds.length ? { categories: categoryIds } : {}),
      ...(typeof body.heroImageId === 'number' || typeof body.heroImageId === 'string'
        ? { heroImage: body.heroImageId }
        : {}),
      ...(typeof body.publishedAt === 'string' ? { publishedAt: body.publishedAt } : {}),
      meta: {
        ...(metaTitle ? { title: metaTitle } : {}),
        ...(metaDescription ? { description: metaDescription } : {}),
      },
    }

    const post = await payload.create({
      collection: 'posts',
      data: data as RequiredDataFromCollectionSlug<'posts'>,
      overrideAccess: true,
    })

    const origin = process.env.NEXT_PUBLIC_SERVER_URL || ''
    return json({
      ok: true,
      id: post.id,
      slug,
      status,
      url: `${origin}/${slug}/`,
      adminUrl: `${origin}/admin/collections/posts/${post.id}`,
    })
  } catch (err) {
    payload.logger.error({ err }, 'Blog publish endpoint failed')
    return json({ ok: false, error: (err as Error).message }, 500)
  }
}

export const publishPostEndpoint: Endpoint = {
  path: '/blog/publish',
  method: 'post',
  handler,
}
