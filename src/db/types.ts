/**
 * Payload-free domain types for the direct DB layer. These intentionally mirror
 * the shapes the site components need, decoupled from Payload's generated types.
 * As read paths migrate off Payload, components move onto these.
 */

export type MediaImage = {
  id: number
  alt: string | null
  url: string
  width: number | null
  height: number | null
  /** Best-fit responsive variant URLs (may be null if not generated). */
  sizes: {
    thumbnail?: string | null
    square?: string | null
    small?: string | null
    medium?: string | null
    large?: string | null
    xlarge?: string | null
    og?: string | null
  }
}

export type Category = {
  id: number
  title: string | null
  slug: string | null
}

export type ServiceNav = {
  id: number
  title: string
  navLabel: string
  slug: string
  shortDescription: string
  displayOrder: number | null
  cardImage: MediaImage | null
}

export type CityNav = {
  id: number
  cityName: string
  slug: string
  pathOverride: string | null
}

export type Testimonial = {
  id: number
  authorName: string
  location: string | null
  rating: number
  text: string
  source: string | null
  date: string | null
  featured: boolean
}
