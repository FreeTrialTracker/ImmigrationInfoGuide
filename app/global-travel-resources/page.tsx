import { Metadata } from 'next';
import Link from 'next/link';
import { ArrowRight, Globe, MapPin, Building2, Plane, FileText, Users } from 'lucide-react';

export const metadata: Metadata = {
  title: 'Global Travel and Immigration Resources – Visas, Airport Hotels, Residency Guides',
  description:
    'Plan international travel and relocation with visa requirement tools, airport transit hotel guides, and immigration visa resources worldwide.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/global-travel-resources',
  },
  openGraph: {
    title: 'Global Travel and Immigration Resources – Visas, Airport Hotels, Residency Guides',
    description:
      'Plan international travel and relocation with visa requirement tools, airport transit hotel guides, and immigration visa resources worldwide.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/global-travel-resources',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Global Travel and Immigration Resources – Visas, Airport Hotels, Residency Guides',
    description:
      'Plan international travel and relocation with visa requirement tools, airport transit hotel guides, and immigration visa resources worldwide.',
    images: ['/og-image.webp'],
  },
};

const structuredData = {
  '@context': 'https://schema.org',
  '@type': 'WebPage',
  name: 'Global Travel and Immigration Resources',
  url: 'https://immigrationinfoguide.com/global-travel-resources',
  description:
    'Resources for immigration planning including visa rules, airport transit hotels, and residency visa guides.',
  about: ['Immigration visas', 'Travel visas', 'Airport transit hotels'],
  sameAs: ['https://visainfoguide.com', 'https://hotelinairport.com'],
};

const popularGuides = [
  {
    title: 'Best Countries for Digital Nomads',
    href: '/immigration-guides',
    description: 'Compare remote work visa programs and nomad-friendly destinations worldwide.',
  },
  {
    title: 'Work Visa Guides by Country',
    href: '/immigration-guides',
    description: 'Step-by-step work visa requirements for major destination countries.',
  },
  {
    title: 'Permanent Residency Options',
    href: '/immigration-guides',
    description: 'Pathways to permanent residence and long-term settlement in 99 countries.',
  },
  {
    title: 'Retirement Visa Programs',
    href: '/immigration-guides',
    description: 'Affordable retirement destinations with dedicated visa programs for retirees.',
  },
];

export default function GlobalTravelResourcesPage() {
  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(structuredData) }}
      />

      <div className="min-h-screen bg-white">
        <div className="bg-gradient-to-b from-slate-50 to-white border-b border-slate-100">
          <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-16 md:py-20">
            <div className="max-w-3xl">
              <div className="flex items-center gap-2 text-sm text-slate-500 mb-4">
                <Link href="/" className="hover:text-slate-700 transition-colors">
                  Home
                </Link>
                <span>/</span>
                <span className="text-slate-700">Global Travel Resources</span>
              </div>
              <h1 className="text-4xl md:text-5xl font-bold text-slate-900 tracking-tight mb-6">
                Global Travel and Immigration Resources
              </h1>
              <p className="text-lg text-slate-600 leading-relaxed">
                Planning international travel or long-term relocation involves far more than booking
                a flight. Depending on your nationality, destination, and intended length of stay,
                you may need to check short-term visa requirements, secure the right immigration
                permits, and arrange accommodation during connecting layovers. This resource hub
                connects all three planning stages — from travel visa eligibility and airport transit
                logistics through to long-stay visas, residency permits, and full immigration
                pathways.
              </p>
            </div>
          </div>
        </div>

        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-14 space-y-20">

          {/* Section 1 — Immigration and Residency Planning */}
          <section>
            <div className="flex items-start gap-4 mb-6">
              <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center">
                <FileText className="w-5 h-5 text-blue-600" />
              </div>
              <div>
                <h2 className="text-2xl md:text-3xl font-bold text-slate-900 mb-3">
                  Immigration and Long-Term Residency Guides
                </h2>
                <p className="text-slate-600 leading-relaxed max-w-3xl">
                  Immigration rules vary significantly by country. Travelers planning to work,
                  retire, or permanently relocate abroad need to research more than a tourist entry
                  stamp. Long-stay visas, residency permits, and permanent residency pathways each
                  have distinct eligibility requirements, processing timelines, and application
                  procedures.
                </p>
              </div>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mt-8">
              {[
                {
                  icon: <Globe className="w-5 h-5 text-blue-600" />,
                  label: 'immigration visa guides',
                  href: '/immigration-guides',
                  description:
                    'Browse comprehensive immigration guides covering entry categories, eligibility criteria, and required documentation for 99 countries.',
                },
                {
                  icon: <MapPin className="w-5 h-5 text-blue-600" />,
                  label: 'residency permits',
                  href: '/immigration-guides',
                  description:
                    'Understand temporary and permanent residency permit requirements, including financial thresholds and minimum stay obligations.',
                },
                {
                  icon: <Plane className="w-5 h-5 text-blue-600" />,
                  label: 'long stay visa options',
                  href: '/immigration-guides',
                  description:
                    'Compare digital nomad visas, retirement visas, and investor visas across popular destinations.',
                },
                {
                  icon: <Users className="w-5 h-5 text-blue-600" />,
                  label: 'work visa requirements',
                  href: '/immigration-guides',
                  description:
                    'Explore skilled worker visas, employer-sponsored permits, and self-employment pathways by destination country.',
                },
              ].map((item) => (
                <Link
                  key={item.label}
                  href={item.href}
                  className="group block p-5 rounded-xl border border-slate-200 bg-white hover:border-blue-300 hover:shadow-md transition-all duration-200"
                >
                  <div className="w-9 h-9 rounded-lg bg-blue-50 flex items-center justify-center mb-3 group-hover:bg-blue-100 transition-colors">
                    {item.icon}
                  </div>
                  <p className="text-sm font-semibold text-slate-900 mb-2 group-hover:text-blue-700 transition-colors capitalize">
                    {item.label}
                  </p>
                  <p className="text-xs text-slate-500 leading-relaxed">{item.description}</p>
                </Link>
              ))}
            </div>
          </section>

          {/* Section 2 — Short-Term Visa Requirements */}
          <section>
            <div className="flex items-start gap-4 mb-6">
              <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-emerald-50 flex items-center justify-center">
                <Globe className="w-5 h-5 text-emerald-600" />
              </div>
              <div>
                <h2 className="text-2xl md:text-3xl font-bold text-slate-900 mb-3">
                  Short-Term Travel Visa Requirements
                </h2>
                <p className="text-slate-600 leading-relaxed max-w-3xl">
                  Many travelers enter a country on a short-term tourist or visitor visa before
                  later applying for immigration or residency permits. Understanding short-stay entry
                  rules is the first step in any international relocation plan. Check{' '}
                  <a
                    href="https://visainfoguide.com"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-emerald-700 font-medium hover:text-emerald-800 underline decoration-emerald-200 underline-offset-2 transition-colors"
                  >
                    visa requirements by passport
                  </a>{' '}
                  to see which destinations you can enter visa-free, on arrival, or with a
                  pre-obtained visa.
                </p>
              </div>
            </div>

            <div className="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="rounded-xl border border-slate-200 bg-slate-50 p-6">
                <h3 className="text-base font-semibold text-slate-900 mb-4">
                  Visa rules depend on four key factors
                </h3>
                <ul className="space-y-3">
                  {[
                    {
                      factor: 'Nationality',
                      detail:
                        'Your passport country determines which bilateral agreements and visa-free arrangements apply.',
                    },
                    {
                      factor: 'Destination country',
                      detail:
                        'Entry requirements vary significantly — from strict visa-in-advance requirements to visa-on-arrival or e-visa schemes.',
                    },
                    {
                      factor: 'Length of stay',
                      detail:
                        'Short stays of 30, 60, or 90 days are governed by different rules than long-stay visas.',
                    },
                    {
                      factor: 'Purpose of travel',
                      detail:
                        'Tourism, business, study, and employment each require different permit categories.',
                    },
                  ].map((item) => (
                    <li key={item.factor} className="flex items-start gap-3">
                      <div className="mt-1 w-1.5 h-1.5 rounded-full bg-emerald-500 flex-shrink-0" />
                      <div>
                        <span className="text-sm font-semibold text-slate-800">{item.factor}: </span>
                        <span className="text-sm text-slate-600">{item.detail}</span>
                      </div>
                    </li>
                  ))}
                </ul>
              </div>

              <div className="rounded-xl border border-emerald-200 bg-emerald-50 p-6 flex flex-col justify-between">
                <div>
                  <p className="text-sm font-semibold text-emerald-800 uppercase tracking-wider mb-3">
                    External Resource
                  </p>
                  <h3 className="text-lg font-bold text-slate-900 mb-3">
                    Travel visa rules and entry requirements
                  </h3>
                  <p className="text-sm text-slate-600 leading-relaxed mb-5">
                    Check{' '}
                    <a
                      href="https://visainfoguide.com"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-emerald-700 font-medium hover:text-emerald-800 underline decoration-emerald-200 underline-offset-2 transition-colors"
                    >
                      travel visa rules
                    </a>{' '}
                    for your passport at VisaInfoGuide.com — covering{' '}
                    <a
                      href="https://visainfoguide.com"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-emerald-700 font-medium hover:text-emerald-800 underline decoration-emerald-200 underline-offset-2 transition-colors"
                    >
                      visa-free travel requirements
                    </a>{' '}
                    and{' '}
                    <a
                      href="https://visainfoguide.com"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-emerald-700 font-medium hover:text-emerald-800 underline decoration-emerald-200 underline-offset-2 transition-colors"
                    >
                      entry visa regulations
                    </a>{' '}
                    across 200+ destination countries.
                  </p>
                </div>
                <a
                  href="https://visainfoguide.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 bg-emerald-600 hover:bg-emerald-700 text-white text-sm font-semibold px-5 py-2.5 rounded-lg transition-colors w-fit"
                >
                  Check Visa Requirements
                  <ArrowRight className="w-4 h-4" />
                </a>
              </div>
            </div>
          </section>

          {/* Section 3 — Airport Transit and Layover Planning */}
          <section>
            <div className="flex items-start gap-4 mb-6">
              <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-sky-50 flex items-center justify-center">
                <Building2 className="w-5 h-5 text-sky-600" />
              </div>
              <div>
                <h2 className="text-2xl md:text-3xl font-bold text-slate-900 mb-3">
                  Airport Transit and Layover Accommodation
                </h2>
                <p className="text-slate-600 leading-relaxed max-w-3xl">
                  International moves often involve long-haul flights with connecting layovers. When
                  a layover runs overnight or exceeds eight hours, staying at or near the airport is
                  usually far more practical than traveling into the city. Explore{' '}
                  <a
                    href="https://hotelinairport.com"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-sky-700 font-medium hover:text-sky-800 underline decoration-sky-200 underline-offset-2 transition-colors"
                  >
                    airport transit hotels
                  </a>{' '}
                  to find accommodation options at major international airports worldwide.
                </p>
              </div>
            </div>

            <div className="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
              <div className="rounded-xl border border-sky-200 bg-sky-50 p-6 flex flex-col justify-between md:col-span-1">
                <div>
                  <p className="text-sm font-semibold text-sky-800 uppercase tracking-wider mb-3">
                    External Resource
                  </p>
                  <h3 className="text-lg font-bold text-slate-900 mb-3">
                    Hotels inside airports and transit terminals
                  </h3>
                  <p className="text-sm text-slate-600 leading-relaxed mb-5">
                    Find{' '}
                    <a
                      href="https://hotelinairport.com"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-sky-700 font-medium hover:text-sky-800 underline decoration-sky-200 underline-offset-2 transition-colors"
                    >
                      hotels inside airports
                    </a>
                    , including{' '}
                    <a
                      href="https://hotelinairport.com"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-sky-700 font-medium hover:text-sky-800 underline decoration-sky-200 underline-offset-2 transition-colors"
                    >
                      airport layover hotels
                    </a>{' '}
                    and{' '}
                    <a
                      href="https://hotelinairport.com"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-sky-700 font-medium hover:text-sky-800 underline decoration-sky-200 underline-offset-2 transition-colors"
                    >
                      terminal-connected airport hotels
                    </a>{' '}
                    at major hubs worldwide.
                  </p>
                </div>
                <a
                  href="https://hotelinairport.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 bg-sky-600 hover:bg-sky-700 text-white text-sm font-semibold px-5 py-2.5 rounded-lg transition-colors w-fit"
                >
                  Find Airport Hotels
                  <ArrowRight className="w-4 h-4" />
                </a>
              </div>

              <div className="md:col-span-2 grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div className="rounded-xl border border-slate-200 bg-white p-5">
                  <div className="w-8 h-8 rounded-lg bg-sky-100 flex items-center justify-center mb-3">
                    <Plane className="w-4 h-4 text-sky-600" />
                  </div>
                  <h4 className="text-sm font-bold text-slate-900 mb-2">
                    Airside Transit Hotels
                  </h4>
                  <p className="text-sm text-slate-600 leading-relaxed">
                    Located within the secure departure zone, airside hotels allow passengers to
                    rest without passing through immigration controls. Ideal for travelers without a
                    transit visa who cannot enter the country — common at airports in Singapore,
                    Amsterdam, Dubai, and London Heathrow.
                  </p>
                </div>
                <div className="rounded-xl border border-slate-200 bg-white p-5">
                  <div className="w-8 h-8 rounded-lg bg-sky-100 flex items-center justify-center mb-3">
                    <Building2 className="w-4 h-4 text-sky-600" />
                  </div>
                  <h4 className="text-sm font-bold text-slate-900 mb-2">
                    Landside Airport Hotels
                  </h4>
                  <p className="text-sm text-slate-600 leading-relaxed">
                    Landside hotels are accessible only after clearing immigration and customs. They
                    offer more amenities and are suitable for passengers who are permitted to enter
                    the country during a long layover. Most major international airports have
                    landside hotels connected directly to the terminal or within a short shuttle
                    ride.
                  </p>
                </div>
                <div className="rounded-xl border border-slate-200 bg-slate-50 p-5 sm:col-span-2">
                  <h4 className="text-sm font-bold text-slate-900 mb-2">
                    Planning Tip: Check Transit Visa Rules First
                  </h4>
                  <p className="text-sm text-slate-600 leading-relaxed">
                    Whether you can access a landside airport hotel depends on your transit visa
                    eligibility for that country. Some nationalities require an airport transit visa
                    even when remaining within the international zone. Always verify entry
                    requirements before booking layover accommodation.
                  </p>
                </div>
              </div>
            </div>
          </section>

          {/* Section 4 — Three-Card CTA Layout */}
          <section>
            <h2 className="text-2xl md:text-3xl font-bold text-slate-900 mb-2">
              Continue Planning Your International Move
            </h2>
            <p className="text-slate-500 mb-8">
              Choose the next step in your international relocation or travel planning journey.
            </p>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {[
                {
                  icon: <FileText className="w-6 h-6 text-blue-600" />,
                  iconBg: 'bg-blue-50',
                  title: 'Immigration Guides',
                  description:
                    'Learn about work visas, residency permits, and long-term immigration options in different countries.',
                  buttonLabel: 'Explore Immigration Guides',
                  href: '/',
                  external: false,
                  buttonClass:
                    'bg-blue-600 hover:bg-blue-700 text-white',
                },
                {
                  icon: <Globe className="w-6 h-6 text-emerald-600" />,
                  iconBg: 'bg-emerald-50',
                  title: 'Visa Requirements',
                  description:
                    'Check visa rules, visa-free travel eligibility, and entry requirements before traveling internationally.',
                  buttonLabel: 'Check Visa Rules',
                  href: 'https://visainfoguide.com',
                  external: true,
                  buttonClass:
                    'bg-emerald-600 hover:bg-emerald-700 text-white',
                },
                {
                  icon: <Building2 className="w-6 h-6 text-sky-600" />,
                  iconBg: 'bg-sky-50',
                  title: 'Airport Transit Hotels',
                  description:
                    'Find hotels inside airport terminals and near major international airports for overnight layovers.',
                  buttonLabel: 'Find Airport Hotels',
                  href: 'https://hotelinairport.com',
                  external: true,
                  buttonClass:
                    'bg-sky-600 hover:bg-sky-700 text-white',
                },
              ].map((card) => (
                <div
                  key={card.title}
                  className="flex flex-col rounded-xl border border-slate-200 bg-white p-6 hover:shadow-md transition-shadow duration-200"
                >
                  <div
                    className={`w-11 h-11 rounded-lg ${card.iconBg} flex items-center justify-center mb-4`}
                  >
                    {card.icon}
                  </div>
                  <h3 className="text-lg font-bold text-slate-900 mb-2">{card.title}</h3>
                  <p className="text-sm text-slate-600 leading-relaxed flex-1 mb-5">
                    {card.description}
                  </p>
                  {card.external ? (
                    <a
                      href={card.href}
                      target="_blank"
                      rel="noopener noreferrer"
                      className={`inline-flex items-center gap-2 text-sm font-semibold px-5 py-2.5 rounded-lg transition-colors w-fit ${card.buttonClass}`}
                    >
                      {card.buttonLabel}
                      <ArrowRight className="w-4 h-4" />
                    </a>
                  ) : (
                    <Link
                      href={card.href}
                      className={`inline-flex items-center gap-2 text-sm font-semibold px-5 py-2.5 rounded-lg transition-colors w-fit ${card.buttonClass}`}
                    >
                      {card.buttonLabel}
                      <ArrowRight className="w-4 h-4" />
                    </Link>
                  )}
                </div>
              ))}
            </div>
          </section>

          {/* Popular Immigration Guides */}
          <section className="border-t border-slate-100 pt-14">
            <h2 className="text-2xl font-bold text-slate-900 mb-2">
              Popular Immigration Guides
            </h2>
            <p className="text-slate-500 mb-8">
              Widely read guides for people researching international relocation options.
            </p>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              {popularGuides.map((guide) => (
                <Link
                  key={guide.title}
                  href={guide.href}
                  className="group flex items-start gap-4 p-5 rounded-xl border border-slate-200 bg-white hover:border-blue-300 hover:shadow-sm transition-all duration-200"
                >
                  <div className="flex-shrink-0 w-8 h-8 rounded-lg bg-blue-50 flex items-center justify-center mt-0.5 group-hover:bg-blue-100 transition-colors">
                    <FileText className="w-4 h-4 text-blue-600" />
                  </div>
                  <div className="min-w-0">
                    <p className="text-sm font-semibold text-slate-900 mb-1 group-hover:text-blue-700 transition-colors">
                      {guide.title}
                    </p>
                    <p className="text-xs text-slate-500 leading-relaxed">{guide.description}</p>
                  </div>
                  <ArrowRight className="w-4 h-4 text-slate-300 flex-shrink-0 mt-1 group-hover:text-blue-400 transition-colors" />
                </Link>
              ))}
            </div>
          </section>

        </div>
      </div>
    </>
  );
}
