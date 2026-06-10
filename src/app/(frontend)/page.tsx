import type { Metadata } from 'next'

import React from 'react'

import { AboutSection } from '@/components/sections/AboutSection'
import { CTABanner } from '@/components/sections/CTABanner'
import { ContactSection } from '@/components/sections/ContactSection'
import { FAQAccordion } from '@/components/sections/FAQAccordion'
import { Hero } from '@/components/sections/Hero'
import { ProcessSteps } from '@/components/sections/ProcessSteps'
import { ServiceCards } from '@/components/sections/ServiceCards'
import { TestimonialCarousel } from '@/components/sections/TestimonialCarousel'
import { getFeaturedTestimonials, getServicesNav } from '@/lib/queries'
import { generateMeta } from '@/utilities/generateMeta'
import { getCachedGlobal } from '@/utilities/getGlobals'

export default async function HomePage() {
  const [homepage, siteSettings, services, testimonials] = await Promise.all([
    getCachedGlobal('homepage', 1)(),
    getCachedGlobal('siteSettings', 1)(),
    getServicesNav(),
    getFeaturedTestimonials(),
  ])

  return (
    <>
      <Hero
        heading={homepage.heroHeading}
        image={homepage.heroImage}
        licenseNumber={siteSettings.licenseNumber}
        phone={siteSettings.phone}
        rating={siteSettings.aggregateRating}
        subheading={homepage.heroSubheading}
      />
      <ProcessSteps heading={homepage.processHeading} steps={homepage.processSteps} />
      <ServiceCards
        heading={homepage.servicesHeading}
        intro={homepage.servicesIntro}
        services={services}
      />
      <AboutSection
        body={homepage.aboutBody}
        differentiators={homepage.differentiators}
        heading={homepage.aboutHeading}
        image={homepage.aboutImage}
      />
      <TestimonialCarousel heading={homepage.reviewsHeading} testimonials={testimonials} />
      <FAQAccordion faqs={homepage.faqs ?? null} />
      <CTABanner phone={siteSettings.phone} />
      <ContactSection
        body={homepage.contactBody}
        heading={homepage.contactHeading}
        siteSettings={siteSettings}
      />
    </>
  )
}

export async function generateMetadata(): Promise<Metadata> {
  const homepage = await getCachedGlobal('homepage', 1)()
  const meta = await generateMeta({ doc: { meta: homepage.meta } })
  return { ...meta, alternates: { canonical: '/' } }
}
