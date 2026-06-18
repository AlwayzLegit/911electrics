import Link from 'next/link'

import { getAllCities } from '@/studio/cities'

import { CityRowActions } from './CityRowActions'

export const dynamic = 'force-dynamic'

export default async function StudioCitiesPage() {
  const cities = await getAllCities()

  return (
    <div className="space-y-6">
      <header className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold tracking-tight">Service Areas</h1>
          <p className="mt-1 text-sm text-slate-500">{cities.length} service area{cities.length === 1 ? '' : 's'}.</p>
        </div>
        <Link
          className="rounded-lg bg-brand-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-brand-700"
          href="/studio/cities/new"
        >
          New service area
        </Link>
      </header>

      {cities.length === 0 ? (
        <div className="rounded-xl border border-slate-200 bg-white px-5 py-12 text-center text-sm text-slate-500">
          No service areas yet.
        </div>
      ) : (
        <div className="overflow-hidden rounded-xl border border-slate-200 bg-white">
          <ul className="divide-y divide-slate-100">
            {cities.map((c) => (
              <li className="flex items-center gap-3 px-5 py-3.5" key={c.id}>
                <div className="min-w-0 flex-1">
                  <div className="truncate text-sm font-medium text-slate-900">{c.cityName}</div>
                  <div className="truncate text-xs text-slate-500">{c.pathOverride || (c.slug ? `/${c.slug}/` : 'no slug')}</div>
                </div>
                <span
                  className={`shrink-0 rounded-full px-2.5 py-0.5 text-xs font-semibold ${
                    c.status === 'published' ? 'bg-green-100 text-green-800' : 'bg-slate-200 text-slate-600'
                  }`}
                >
                  {c.status === 'published' ? 'Published' : 'Draft'}
                </span>
                <CityRowActions id={c.id} pathOverride={c.pathOverride} slug={c.slug} />
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  )
}
