import { LinkNode } from '@lexical/link'
import type { LexicalNode, NodeKey } from 'lexical'

/**
 * A Lexical link node that serializes to Payload's rich-text link shape
 * (`{ type:'link', version:3, fields:{ linkType:'custom', url, newTab } }`)
 * instead of @lexical/link's vanilla shape (top-level `url`).
 *
 * This lets the Studio editor load and re-save existing Payload content with
 * links intact, and keeps the existing renderer (which reads `fields.url`)
 * working. Registered for the `link` type in place of the stock LinkNode.
 */
type PayloadLinkFields = {
  linkType?: 'custom' | 'internal'
  url?: string
  newTab?: boolean
}

export class PayloadLinkNode extends LinkNode {
  static getType(): string {
    return 'link'
  }

  static clone(node: PayloadLinkNode): PayloadLinkNode {
    return new PayloadLinkNode(
      node.__url,
      { rel: node.__rel, target: node.__target, title: node.__title },
      node.__key,
    )
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  static importJSON(serializedNode: any): PayloadLinkNode {
    return new PayloadLinkNode().updateFromJSON(serializedNode)
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  updateFromJSON(serializedNode: any): this {
    const fields: PayloadLinkFields = serializedNode?.fields ?? {}
    const url: string = fields.url ?? serializedNode?.url ?? ''
    const newTab = Boolean(fields.newTab)
    return super
      .updateFromJSON(serializedNode)
      .setURL(url)
      .setTarget(newTab ? '_blank' : null)
      .setRel(newTab ? 'noopener noreferrer' : null)
      .setTitle(null) as this
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  exportJSON(): any {
    const { url: _url, rel: _rel, target, title: _title, ...base } = super.exportJSON() as Record<
      string,
      unknown
    > & { target?: string | null }
    return {
      ...base,
      type: 'link',
      version: 3,
      fields: {
        linkType: 'custom',
        url: this.getURL(),
        newTab: target === '_blank',
      },
    }
  }
}

export function $createPayloadLinkNode(url = '', key?: NodeKey): PayloadLinkNode {
  return new PayloadLinkNode(url, {}, key)
}

export function $isPayloadLinkNode(node: LexicalNode | null | undefined): node is PayloadLinkNode {
  return node instanceof PayloadLinkNode
}
