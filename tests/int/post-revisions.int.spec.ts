import { readFileSync } from 'node:fs'
import { join } from 'node:path'

import { describe, expect, it, vi } from 'vitest'

import { MAX_POST_REVISIONS, recordPostRevision } from '@/lib/post-revisions'

const rev = {
  postId: 7,
  title: 'Panel upgrades in Pasadena',
  content: '{"root":{}}',
  status: 'published',
  authorId: null,
  authorName: 'API — Daily blog writer',
  note: 'Edited via API',
}

describe('recordPostRevision', () => {
  it('inserts the revision, then prunes that post to the newest N — on the same client', async () => {
    const query = vi.fn().mockResolvedValue({ rows: [] })
    await recordPostRevision({ query } as never, rev)

    expect(query).toHaveBeenCalledTimes(2)
    const [insertSql, insertParams] = query.mock.calls[0]
    expect(insertSql).toMatch(/INSERT INTO post_revisions/)
    expect(insertParams).toEqual([7, rev.title, rev.content, 'published', null, 'API — Daily blog writer', 'Edited via API'])

    const [pruneSql, pruneParams] = query.mock.calls[1]
    expect(pruneSql).toMatch(/DELETE FROM post_revisions WHERE post_id = \$1/)
    expect(pruneSql).toMatch(/ORDER BY created_at DESC, id DESC LIMIT \$2/)
    expect(pruneParams).toEqual([7, MAX_POST_REVISIONS])
  })

  it('does not prune if the insert fails (the caller rolls the transaction back)', async () => {
    const query = vi.fn().mockRejectedValueOnce(new Error('insert failed'))
    await expect(recordPostRevision({ query } as never, rev)).rejects.toThrow('insert failed')
    expect(query).toHaveBeenCalledTimes(1)
  })

  it('keeps 30, matching what Studio tells the owner', () => {
    expect(MAX_POST_REVISIONS).toBe(30)
  })
})

/**
 * The bug was three copies of this logic, only one of which pruned. Make sure
 * nobody writes to the table directly again.
 */
describe('post_revisions has a single writer', () => {
  const files = [
    'src/app/actions/studio-posts.ts',
    'src/app/api/admin/v1/posts/route.ts',
    'src/app/api/admin/v1/posts/[id]/route.ts',
  ]
  for (const file of files) {
    it(`${file} goes through recordPostRevision`, () => {
      const src = readFileSync(join(process.cwd(), file), 'utf8')
      expect(src).toContain('recordPostRevision(')
      expect(src).not.toMatch(/INSERT INTO post_revisions/)
    })
  }
})
