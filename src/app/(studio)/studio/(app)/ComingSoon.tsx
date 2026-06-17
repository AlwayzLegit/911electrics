export function ComingSoon({ title, blurb }: { title: string; blurb: string }) {
  return (
    <div className="space-y-6">
      <header>
        <h1 className="text-2xl font-semibold tracking-tight">{title}</h1>
      </header>
      <div className="rounded-xl border border-dashed border-slate-300 bg-white px-6 py-14 text-center">
        <div className="mx-auto mb-4 flex size-12 items-center justify-center rounded-full bg-brand-50 text-brand-600">
          <svg fill="none" height="24" stroke="currentColor" strokeWidth="1.7" viewBox="0 0 24 24" width="24">
            <path d="M12 6v6l4 2" strokeLinecap="round" strokeLinejoin="round" />
            <circle cx="12" cy="12" r="9" />
          </svg>
        </div>
        <h2 className="text-base font-semibold text-slate-900">Coming soon to your dashboard</h2>
        <p className="mx-auto mt-1.5 max-w-md text-sm text-slate-500">{blurb}</p>
      </div>
    </div>
  )
}
