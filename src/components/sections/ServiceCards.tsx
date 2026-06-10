import { ArrowRight } from 'lucide-react'
import Link from 'next/link'
import React from 'react'

import type { Service } from '@/payload-types'

import { Media } from '@/components/Media'

import { SectionHeading } from './SectionHeading'

export function ServiceCards({
  heading,
  intro,
  services,
}: {
  heading?: string | null
  intro?: string | null
  services: Service[]
}) {
  if (!services.length) return null

  return (
    <section className="py-16 md:py-20">
      <div className="container">
        <SectionHeading
          eyebrow="What We Do"
          subtitle={intro}
          title={heading || 'Electrical Solutions We Offer'}
        />
        <div className="mt-12 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {services.map((service) => (
            <Link
              className="group overflow-hidden rounded-xl border border-border bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-lg"
              href={`/${service.slug}/`}
              key={service.id}
            >
              {service.cardImage && typeof service.cardImage === 'object' ? (
                <div className="relative aspect-[16/9] overflow-hidden bg-card">
                  <Media
                    fill
                    imgClassName="object-cover transition duration-300 group-hover:scale-105"
                    resource={service.cardImage}
                    size="(min-width: 1024px) 33vw, (min-width: 640px) 50vw, 100vw"
                  />
                </div>
              ) : (
                <div className="aspect-[16/9] bg-gradient-to-br from-brand-700 to-navy-900" />
              )}
              <div className="p-6">
                <h3 className="text-lg font-semibold text-navy-950 group-hover:text-brand-700">
                  {service.navLabel}
                </h3>
                <p className="mt-2 line-clamp-3 text-sm leading-relaxed text-muted-foreground">
                  {service.shortDescription}
                </p>
                <span className="mt-4 inline-flex items-center gap-1.5 text-sm font-semibold text-brand-600">
                  Explore service
                  <ArrowRight aria-hidden className="size-4 transition group-hover:translate-x-1" />
                </span>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  )
}
