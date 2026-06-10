import { MapPin } from 'lucide-react'
import React from 'react'

import type { City, CityPageTemplate, Service, SiteSetting, Testimonial } from '@/payload-types'

import RichText from '@/components/RichText'
import { AboutSection } from '@/components/sections/AboutSection'
import { CTABanner } from '@/components/sections/CTABanner'
import { ContactSection } from '@/components/sections/ContactSection'
import { FAQAccordion, type FAQ } from '@/components/sections/FAQAccordion'
import { Hero } from '@/components/sections/Hero'
import { ProcessSteps } from '@/components/sections/ProcessSteps'
import { ServiceCards } from '@/components/sections/ServiceCards'
import { TestimonialCarousel } from '@/components/sections/TestimonialCarousel'
import { JsonLd } from '@/components/seo/JsonLd'
import { interpolateDeep, interpolateString, type CityTokens } from '@/lib/interpolate'
import {
  breadcrumbSchema,
  electricianSchema,
  faqSchema,
  jsonLdGraph,
  lexicalToPlainText,
} from '@/lib/schema-org'

/**
 * City pages render from the shared template global; any populated
 * override field on the city doc wins over the template section.
 */
export function CityPage({
  city,
  template,
  services,
  siteSettings,
  testimonials,
}: {
  city: City
  template: CityPageTemplate
  services: Service[]
  siteSettings: SiteSetting
  testimonials: Testimonial[]
}) {
  const tokens: CityTokens = { city: city.cityName, region: city.region ?? undefined }
  const t = <V,>(value: V): V => interpolateDeep(value, tokens)

  const heroHeading = city.heroHeadingOverride || interpolateString(template.heroHeading, tokens)
  const intro = city.introOverride ?? (template.intro ? t(template.intro) : null)
  const faqs = (city.faqsOverride?.length ? city.faqsOverride : t(template.faqs)) as FAQ[] | null

  const cityTestimonials = (city.featuredTestimonials ?? []).filter(
    (x): x is Testimonial => typeof x === 'object',
  )

  const pagePath = city.pathOverride || `/${city.slug}/`
  const json = jsonLdGraph(
    electricianSchema(siteSettings, { areaServed: [city.cityName], pagePath }),
    faqSchema(
      (faqs ?? []).map((f) => ({
        question: f.question,
        answerText: lexicalToPlainText(f.answer),
      })),
    ),
    breadcrumbSchema([
      { name: 'Home', path: '/' },
      { name: 'Service Areas', path: '/service-areas/' },
      { name: `Electrician in ${city.cityName}, CA`, path: pagePath },
    ]),
  )

  return (
    <>
      <JsonLd json={json} />
      <Hero
        heading={heroHeading}
        image={template.heroImage}
        licenseNumber={siteSettings.licenseNumber}
        phone={siteSettings.phone}
        rating={siteSettings.aggregateRating}
        subheading={template.heroSubheading ? interpolateString(template.heroSubheading, tokens) : null}
      />

      {intro && (
        <section className="py-16">
          <div className="container max-w-4xl">
            <RichText className="max-w-none" data={intro} enableGutter={false} />
          </div>
        </section>
      )}

      <ProcessSteps
        heading={template.processHeading ? interpolateString(template.processHeading, tokens) : null}
        steps={template.processSteps}
      />

      <ServiceCards
        heading={template.servicesHeading ? interpolateString(template.servicesHeading, tokens) : null}
        intro={template.servicesIntro ? interpolateString(template.servicesIntro, tokens) : null}
        services={services}
      />

      <AboutSection
        body={template.aboutBody ? t(template.aboutBody) : null}
        differentiators={t(template.differentiators)}
        heading={template.aboutHeading ? interpolateString(template.aboutHeading, tokens) : null}
      />

      {(city.localNotes || !!city.neighborhoods?.length) && (
        <section className="bg-card py-16">
          <div className="container max-w-4xl">
            <h2 className="text-2xl font-bold text-navy-950 md:text-3xl">
              Serving {city.cityName} and Nearby Neighborhoods
            </h2>
            {city.localNotes && (
              <RichText className="mt-5 max-w-none" data={city.localNotes} enableGutter={false} />
            )}
            {!!city.neighborhoods?.length && (
              <ul className="mt-6 flex flex-wrap gap-2.5">
                {city.neighborhoods.map((n) => (
                  <li
                    className="inline-flex items-center gap-1.5 rounded-full bg-white px-3.5 py-1.5 text-sm font-medium text-navy-900 shadow-sm"
                    key={n.id}
                  >
                    <MapPin aria-hidden className="size-3.5 text-brand-600" />
                    {n.name}
                  </li>
                ))}
              </ul>
            )}
          </div>
        </section>
      )}

      <TestimonialCarousel
        testimonials={cityTestimonials.length ? cityTestimonials : testimonials}
      />

      <FAQAccordion faqs={faqs} heading={`Electrician in ${city.cityName} — FAQs`} />

      <CTABanner
        body={template.ctaBody ? interpolateString(template.ctaBody, tokens) : null}
        heading={template.ctaHeading ? interpolateString(template.ctaHeading, tokens) : null}
        phone={siteSettings.phone}
      />
      <ContactSection siteSettings={siteSettings} />
    </>
  )
}
