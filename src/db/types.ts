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
  title: string | null
  navLabel: string | null
  slug: string | null
  shortDescription: string | null
  displayOrder: number | null
  cardImage: MediaImage | null
}

export type CityNav = {
  id: number
  cityName: string | null
  slug: string | null
  pathOverride: string | null
}

export type Testimonial = {
  id: number
  authorName: string | null
  location: string | null
  rating: number | null
  text: string | null
  source: string | null
  date: string | null
  featured: boolean
}
