import { CircleCheckBig } from 'lucide-react'
import React from 'react'

import type { Media as MediaType } from '@/payload-types'
import type { DefaultTypedEditorState } from '@payloadcms/richtext-lexical'

import { Media } from '@/components/Media'
import RichText from '@/components/RichText'

export function AboutSection({
  heading,
  body,
  image,
  differentiators,
}: {
  heading?: string | null
  body?: DefaultTypedEditorState | null
  image?: MediaType | number | null
  differentiators?: { title: string; text: string; id?: string | null }[] | null
}) {
  const hasImage = !!image && typeof image === 'object'

  return (
    <section className="scroll-mt-28 py-16 md:py-20" id="about">
      <div
        className={
          hasImage
            ? 'container grid items-center gap-12 lg:grid-cols-2'
            : 'container max-w-3xl'
        }
      >
        <div>
          <p className="mb-2 text-sm font-semibold tracking-widest text-brand-600 uppercase">
            About Us
          </p>
          <h2 className="text-3xl font-bold text-balance text-navy-950 md:text-4xl">
            {heading || 'Why Choose 911 Construction & Electric'}
          </h2>
          {body && <RichText className="mt-5 max-w-none" data={body} enableGutter={false} />}
          {!!differentiators?.length && (
            <ul className="mt-7 space-y-4">
              {differentiators.map((d, i) => (
                <li className="flex gap-3" key={d.id ?? i}>
                  <CircleCheckBig aria-hidden className="mt-0.5 size-5 shrink-0 text-brand-600" />
                  <div>
                    <h3 className="font-semibold text-navy-950">{d.title}</h3>
                    <p className="mt-0.5 text-sm leading-relaxed text-muted-foreground">{d.text}</p>
                  </div>
                </li>
              ))}
            </ul>
          )}
        </div>
        {hasImage && (
          <div className="relative aspect-[4/3] overflow-hidden rounded-2xl shadow-lg">
            <Media fill imgClassName="object-cover" resource={image} size="(min-width: 1024px) 50vw, 100vw" />
          </div>
        )}
      </div>
    </section>
  )
}
