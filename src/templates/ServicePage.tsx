import React from 'react'

import type { Post, Service, SiteSetting } from '@/payload-types'

import { Media } from '@/components/Media'
import RichText from '@/components/RichText'
import { CTABanner } from '@/components/sections/CTABanner'
import { ContactSection } from '@/components/sections/ContactSection'
import { FAQAccordion } from '@/components/sections/FAQAccordion'
import { FeatureBlocks } from '@/components/sections/FeatureBlocks'
import { Hero } from '@/components/sections/Hero'
import { PostCard } from '@/components/PostCard'
import { JsonLd } from '@/components/seo/JsonLd'
import {
  breadcrumbSchema,
  electricianSchema,
  faqSchema,
  jsonLdGraph,
  lexicalToPlainText,
  serviceSchema,
} from '@/lib/schema-org'

export function ServicePage({
  service,
  siteSettings,
}: {
  service: Service
  siteSettings: SiteSetting
}) {
  const relatedPosts = (service.relatedPosts ?? []).filter(
    (p): p is Post => typeof p === 'object',
  )

  const json = jsonLdGraph(
    electricianSchema(siteSettings, { pagePath: `/${service.slug}/` }),
    serviceSchema(service, siteSettings),
    faqSchema(
      (service.faqs ?? []).map((f) => ({
        question: f.question,
        answerText: lexicalToPlainText(f.answer),
      })),
    ),
    breadcrumbSchema([
      { name: 'Home', path: '/' },
      { name: 'Services', path: '/services/' },
      { name: service.navLabel, path: `/${service.slug}/` },
    ]),
  )

  return (
    <>
      <JsonLd json={json} />
      <Hero
        breadcrumbs={[
          { name: 'Home', path: '/' },
          { name: 'Services', path: '/services/' },
          { name: service.navLabel, path: `/${service.slug}/` },
        ]}
        defaultService={service.navLabel}
        heading={service.title}
        image={service.heroImage}
        licenseNumber={siteSettings.licenseNumber}
        phone={siteSettings.phone}
        rating={service.showRatingBadge ? siteSettings.aggregateRating : null}
        subheading={service.heroSubheading}
      />

      {service.intro && (
        <section className="py-16">
          <div className="container max-w-4xl">
            <RichText className="max-w-none" data={service.intro} enableGutter={false} />
          </div>
        </section>
      )}

      <FeatureBlocks heading={`Why Choose Us for ${service.navLabel}`} items={service.features} tone="card" />

      {!!service.gallery?.length && (
        <section className="py-16">
          <div className="container grid gap-6 sm:grid-cols-2">
            {service.gallery.map(
              (item) =>
                typeof item.image === 'object' && (
                  <div className="relative aspect-[4/3] overflow-hidden rounded-xl shadow" key={item.id}>
                    <Media
                      fill
                      imgClassName="object-cover"
                      resource={item.image}
                      size="(min-width: 640px) 50vw, 100vw"
                    />
                  </div>
                ),
            )}
          </div>
        </section>
      )}

      <FeatureBlocks eyebrow="The Benefits" heading="What You Get" items={service.benefits} />

      <FAQAccordion faqs={service.faqs ?? null} heading={`${service.navLabel} FAQs`} />

      {!!relatedPosts.length && (
        <section className="bg-card py-16">
          <div className="container">
            <h2 className="text-2xl font-bold text-navy-950">Related Guides</h2>
            <div className="mt-8 grid gap-6 md:grid-cols-2 lg:grid-cols-3">
              {relatedPosts.map((post) => (
                <PostCard key={post.id} post={post} />
              ))}
            </div>
          </div>
        </section>
      )}

      <CTABanner
        heading={`Ready to schedule your ${service.navLabel.toLowerCase()}?`}
        phone={siteSettings.phone}
      />
      <ContactSection siteSettings={siteSettings} />
    </>
  )
}
