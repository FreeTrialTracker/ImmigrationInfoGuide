import Link from 'next/link';
import { ArrowRight, Globe, ChevronRight } from 'lucide-react';
import { INDEXABLE_PASSPORTS, getPassportMeta } from '@/lib/passport/passportData';

const BASE_URL = 'https://immigrationinfoguide.com';

export const revalidate = 86400;

export const metadata = {
  title: 'Immigration Guides by Passport | ImmigrationInfoGuide',
  description:
    'Find immigration and relocation options tailored to your passport. Explore where US, UK, Indian, Canadian, and other passport holders can move, work, or retire abroad.',
  alternates: {
    canonical: `${BASE_URL}/passports`,
  },
  openGraph: {
    title: 'Immigration Guides by Passport | ImmigrationInfoGuide',
    description:
      'Find immigration and relocation options tailored to your passport. Explore where US, UK, Indian, Canadian, and other passport holders can move, work, or retire abroad.',
    url: `${BASE_URL}/passports`,
    type: 'website',
  },
};

const REGION_ORDER = ['North America', 'Europe', 'Asia', 'South America', 'Africa', 'Middle East', 'Oceania'];

interface PassportCard {
  slug: string;
  name: string;
  citizenLabel: string;
  region: string;
  popularDestinations: string[];
}

function groupByRegion(passports: PassportCard[]): Array<{ region: string; passports: PassportCard[] }> {
  const map = new Map<string, PassportCard[]>();
  for (const p of passports) {
    if (!map.has(p.region)) map.set(p.region, []);
    map.get(p.region)!.push(p);
  }
  return REGION_ORDER
    .filter((r) => map.has(r))
    .map((r) => ({ region: r, passports: map.get(r)! }));
}

export default function PassportsHubPage() {
  const passports: PassportCard[] = INDEXABLE_PASSPORTS.map((slug) => {
    const meta = getPassportMeta(slug)!;
    return {
      slug: meta.slug,
      name: meta.name,
      citizenLabel: meta.citizenLabel,
      region: meta.region,
      popularDestinations: meta.popularDestinations,
    };
  });

  const grouped = groupByRegion(passports);

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-gradient-to-br from-slate-800 to-slate-900 text-white py-16">
        <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
          <nav className="flex items-center space-x-2 text-slate-400 text-sm mb-6">
            <Link href="/" className="hover:text-white transition-colors">Home</Link>
            <ChevronRight className="h-3.5 w-3.5" />
            <span className="text-white">Passport Guides</span>
          </nav>
          <h1 className="text-4xl font-bold text-white mb-4">Immigration Guides by Passport</h1>
          <p className="text-lg text-slate-300 max-w-3xl leading-relaxed">
            Where can you move, work, or retire? Find immigration and long-term relocation options tailored to your citizenship. Select your passport to explore destinations, pathways, and planning guides.
          </p>
        </div>
      </div>

      <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 py-12 space-y-12">

        {grouped.map(({ region, passports: regionPassports }) => (
          <section key={region}>
            <h2 className="text-xl font-bold text-gray-900 mb-5 pb-2 border-b border-gray-200">
              {region}
            </h2>
            <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {regionPassports.map((passport) => (
                <Link
                  key={passport.slug}
                  href={`/passport/${passport.slug}`}
                  className="group bg-white rounded-xl border border-gray-200 p-5 hover:border-slate-400 hover:shadow-md transition-all"
                >
                  <div className="flex items-start justify-between mb-3">
                    <div>
                      <h3 className="font-semibold text-gray-900 group-hover:text-slate-700">
                        {passport.name}
                      </h3>
                      <p className="text-xs text-gray-500 mt-1">{passport.citizenLabel}</p>
                    </div>
                    <ArrowRight className="h-4 w-4 text-gray-400 group-hover:text-slate-600 transition-colors mt-1 flex-shrink-0" />
                  </div>
                  <div className="flex flex-wrap gap-1.5">
                    {passport.popularDestinations.slice(0, 3).map((dest) => (
                      <span
                        key={dest}
                        className="text-xs px-2 py-1 bg-slate-100 text-slate-600 rounded-full"
                      >
                        {dest.split('-').map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
                      </span>
                    ))}
                  </div>
                </Link>
              ))}
            </div>
          </section>
        ))}

        <section className="bg-slate-800 rounded-2xl p-8 text-white">
          <div className="flex items-center gap-3 mb-3">
            <Globe className="h-6 w-6 text-slate-300" />
            <h2 className="text-xl font-bold">Find Your Path</h2>
          </div>
          <p className="text-slate-300 mb-6 max-w-2xl">
            Use our Path Finder to get personalized immigration recommendations based on your passport, destination preferences, and goals.
          </p>
          <Link
            href="/path-finder"
            className="inline-flex items-center gap-2 px-6 py-3 bg-white text-slate-800 font-semibold rounded-lg hover:bg-slate-100 transition-colors"
          >
            Start Path Finder
            <ArrowRight className="h-4 w-4" />
          </Link>
        </section>

        <section>
          <h2 className="text-xl font-bold text-gray-900 mb-5">Explore by Destination</h2>
          <p className="text-gray-600 mb-4">
            Looking at a specific country rather than your passport? Browse all destination immigration guides.
          </p>
          <Link
            href="/immigration-guides"
            className="inline-flex items-center gap-2 text-slate-700 font-semibold hover:text-slate-900 transition-colors"
          >
            Browse all country guides
            <ArrowRight className="h-4 w-4" />
          </Link>
        </section>

      </div>
    </div>
  );
}
