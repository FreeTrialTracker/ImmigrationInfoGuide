import { notFound } from 'next/navigation';
import Link from 'next/link';
import {
  Globe,
  Briefcase,
  GraduationCap,
  MapPin,
  Calculator,
  ArrowRight,
  Info,
  ChevronRight,
  Building2,
  Leaf,
  Laptop,
} from 'lucide-react';
import {
  getPassportMeta,
  isValidPassportSlug,
  INDEXABLE_PASSPORTS,
  getDestinationName,
  ALL_PATHWAY_TYPES,
} from '@/lib/passport/passportData';
import {
  buildPassportPageMetadata,
  buildPassportBreadcrumbSchema,
  buildPassportFaqs,
  buildPassportFaqSchema,
  buildPassportWebPageSchema,
  buildPassportDestinationListSchema,
} from '@/lib/passport/passportSeo';
import { getPassportRelatedLinks } from '@/lib/passport/passportRelatedLinks';
import { getAllBlogPosts } from '@/lib/blogData';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';

export const revalidate = 86400;
export const dynamicParams = true;

export async function generateStaticParams() {
  return INDEXABLE_PASSPORTS.map((slug) => ({ slug }));
}

export async function generateMetadata({ params }: { params: { slug: string } }) {
  if (!isValidPassportSlug(params.slug)) {
    return { title: 'Passport Guide | ImmigrationInfoGuide', robots: { index: false, follow: true } };
  }
  const passport = getPassportMeta(params.slug);
  if (!passport) return { title: 'Passport Guide | ImmigrationInfoGuide', robots: { index: false, follow: true } };

  const meta = buildPassportPageMetadata(passport);

  return {
    title: meta.title,
    description: meta.description,
    robots: { index: meta.shouldIndex, follow: true },
    alternates: { canonical: meta.canonical },
    ...(meta.shouldIndex && {
      openGraph: {
        title: meta.ogTitle,
        description: meta.ogDescription,
        type: 'article',
        url: meta.ogUrl,
        images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
      },
      twitter: {
        card: 'summary_large_image',
        title: meta.ogTitle,
        description: meta.ogDescription,
        images: ['/og-image.webp'],
      },
    }),
  };
}

const PATHWAY_ICONS: Record<string, React.ReactNode> = {
  'work-visa': <Briefcase className="h-5 w-5" />,
  'study-visa': <GraduationCap className="h-5 w-5" />,
  'digital-nomad-visa': <Laptop className="h-5 w-5" />,
  'retirement-visa': <Leaf className="h-5 w-5" />,
  'investor-visa': <Building2 className="h-5 w-5" />,
  'family-visa': <Globe className="h-5 w-5" />,
};

export default async function PassportPage({ params }: { params: { slug: string } }) {
  if (!isValidPassportSlug(params.slug)) notFound();

  const passport = getPassportMeta(params.slug);
  if (!passport) notFound();

  if (!passport.isIndexable) notFound();

  const faqs = buildPassportFaqs(passport);
  const breadcrumbSchema = buildPassportBreadcrumbSchema(passport.name, passport.slug);
  const faqSchema = buildPassportFaqSchema(faqs);
  const meta = buildPassportPageMetadata(passport);
  const webPageSchema = buildPassportWebPageSchema(passport, meta.ogTitle, meta.description);
  const destinationListSchema = buildPassportDestinationListSchema(
    passport.popularDestinations.map(getDestinationName),
    passport.name,
  );

  const blogPosts = await getAllBlogPosts().catch(() => []);
  const relatedLinksGroups = getPassportRelatedLinks({
    passportSlug: passport.slug,
    popularDestinations: passport.popularDestinations,
    blogPosts: blogPosts.map((p) => ({
      slug: p.slug,
      title: p.title,
      tags: p.tags,
      category: p.category,
    })),
  });

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify([breadcrumbSchema, faqSchema, webPageSchema, destinationListSchema]) }}
      />

      <div className="min-h-screen bg-gray-50">
        <div className="bg-gradient-to-br from-slate-800 to-slate-900 text-white py-16">
          <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
            <nav className="flex items-center space-x-2 text-slate-400 text-sm mb-6">
              <Link href="/" className="hover:text-white transition-colors">Home</Link>
              <ChevronRight className="h-3.5 w-3.5" />
              <Link href="/passports" className="hover:text-white transition-colors">Passport Guides</Link>
              <ChevronRight className="h-3.5 w-3.5" />
              <span className="text-white">{passport.name}</span>
            </nav>

            <div className="flex items-start gap-6">
              <div className="flex-1">
                <p className="text-slate-400 text-sm uppercase tracking-wider font-medium mb-2">
                  {passport.region} · Immigration Guide
                </p>
                <h1 className="text-4xl font-bold text-white mb-4">
                  Immigration Options for {passport.citizenLabel}
                </h1>
                <p className="text-lg text-slate-300 max-w-3xl leading-relaxed">
                  {passport.contextNote}
                </p>
              </div>
            </div>
          </div>
        </div>

        <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 py-12 space-y-12">

          <section>
            <div className="bg-blue-50 border border-blue-100 rounded-xl p-5 flex items-start gap-3">
              <Info className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
              <p className="text-sm text-blue-900 leading-relaxed">
                This guide focuses on immigration and long-term relocation options — work permits, residency, study programs, and retirement visas. For short-stay or tourist visa requirements, visit{' '}
                <a href="https://visainfoguide.com" target="_blank" rel="noopener noreferrer" className="underline font-medium">VisaInfoGuide.com</a>.
              </p>
            </div>
          </section>

          <section>
            <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-3">
              <MapPin className="h-6 w-6 text-slate-600" />
              Popular Destinations for {passport.citizenLabel}
            </h2>
            <p className="text-gray-600 mb-6 leading-relaxed">
              The destinations below are frequently pursued by {passport.citizenLabel} for immigration, long-term residency, and relocation. Each link leads to a full country guide covering available pathways, requirements, and planning information.
            </p>
            <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
              {passport.popularDestinations.map((dest) => (
                <Link
                  key={dest}
                  href={`/immigrate-to/${dest}`}
                  className="group bg-white rounded-xl border border-gray-200 p-5 hover:border-slate-400 hover:shadow-md transition-all"
                >
                  <div className="flex items-center justify-between mb-2">
                    <span className="font-semibold text-gray-900 group-hover:text-slate-700">
                      {getDestinationName(dest)}
                    </span>
                    <ArrowRight className="h-4 w-4 text-gray-400 group-hover:text-slate-600 transition-colors" />
                  </div>
                  <p className="text-xs text-gray-500">View immigration pathways</p>
                </Link>
              ))}
            </div>
          </section>

          <section>
            <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-3">
              <Briefcase className="h-6 w-6 text-slate-600" />
              Common Immigration Pathways
            </h2>
            <p className="text-gray-600 mb-6 leading-relaxed">
              Below are the main immigration pathways available in most destination countries. Requirements and availability vary — use the links to explore what each pathway looks like for specific destinations.
            </p>
            <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {ALL_PATHWAY_TYPES.map((pt) => (
                <div key={pt.slug} className="bg-white rounded-xl border border-gray-200 p-5">
                  <div className="flex items-center gap-3 mb-3">
                    <div className="p-2 bg-slate-100 rounded-lg text-slate-600">
                      {PATHWAY_ICONS[pt.slug] ?? <Globe className="h-5 w-5" />}
                    </div>
                    <h3 className="font-semibold text-gray-900">{pt.title.split(' and ')[0]}</h3>
                  </div>
                  <p className="text-sm text-gray-600 mb-4">{pt.description}</p>
                  <div className="flex flex-wrap gap-2">
                    {passport.popularDestinations.slice(0, 3).map((dest) => (
                      <Link
                        key={dest}
                        href={`/immigrate-to/${dest}/${pt.slug}`}
                        className="text-xs px-3 py-1.5 bg-slate-100 text-slate-700 rounded-full hover:bg-slate-200 transition-colors font-medium"
                      >
                        {getDestinationName(dest)}
                      </Link>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          </section>

          <section>
            <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-3">
              <Calculator className="h-6 w-6 text-slate-600" />
              Cost Planning
            </h2>
            <p className="text-gray-600 mb-6 leading-relaxed">
              Immigration costs vary significantly by destination and pathway. The pages below break down government fees, proof-of-funds requirements, and estimated total costs for each country.
            </p>
            <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {passport.popularDestinations.slice(0, 6).map((dest) => (
                <Link
                  key={dest}
                  href={`/immigration-cost/${dest}`}
                  className="group bg-white rounded-xl border border-gray-200 p-5 hover:border-slate-400 hover:shadow-md transition-all"
                >
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="font-semibold text-gray-900 group-hover:text-slate-700">
                        {getDestinationName(dest)}
                      </p>
                      <p className="text-xs text-gray-500 mt-1">Fees, funds & total cost estimates</p>
                    </div>
                    <ArrowRight className="h-4 w-4 text-gray-400 group-hover:text-slate-600" />
                  </div>
                </Link>
              ))}
            </div>
          </section>

          <section className="bg-slate-800 rounded-2xl p-8 text-white">
            <h2 className="text-xl font-bold mb-3">Not sure where to start?</h2>
            <p className="text-slate-300 mb-6 max-w-2xl">
              Use our interactive Path Finder tool to get personalized immigration pathway recommendations based on your passport, goals, and destination preferences.
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
            <h2 className="text-2xl font-bold text-gray-900 mb-6">
              Frequently Asked Questions
            </h2>
            <div className="space-y-6">
              {faqs.map((faq, i) => (
                <div key={i} className="bg-white rounded-xl border border-gray-200 p-6">
                  <h3 className="font-semibold text-gray-900 mb-3">{faq.question}</h3>
                  <p className="text-gray-700 leading-relaxed">{faq.answer}</p>
                </div>
              ))}
            </div>
          </section>

          <RelatedLinksSection groups={relatedLinksGroups} />
        </div>
      </div>
    </>
  );
}
