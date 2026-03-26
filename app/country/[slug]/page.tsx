import Link from 'next/link';
import { Globe, ArrowRight, DollarSign, Languages, Briefcase, Heart, GraduationCap, Chrome as Home, ExternalLink, Calculator, FileText, ChartBar as BarChart2, BookOpen, Compass } from 'lucide-react';
import BackNavigation from '@/components/BackNavigation';
import { supabase } from '@/lib/supabaseClient';
import CrossDomainLink from '@/components/CrossDomainLink';
import { buildBreadcrumbSchema, buildArticleSchema, buildFaqSchema } from '@/lib/schemaBuilders';
import { getAllBlogPosts } from '@/lib/blogData';
import { getCountryGuideRelatedLinks } from '@/lib/seo/relatedLinks';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';

export const revalidate = 86400;

export async function generateStaticParams() {
  const { data } = await supabase
    .from('country_guides')
    .select('country_slug');

  return data ? data.map((guide: any) => ({
    slug: guide.country_slug,
  })) : [];
}

export async function generateMetadata({ params }: { params: { slug: string } }) {
  const { data } = await supabase
    .from('country_guides')
    .select('country_slug, countries(name)')
    .eq('country_slug', params.slug)
    .single();

  const countryName = (data as any)?.countries?.name || 'Country';

  return {
    title: `Living in ${countryName}: Immigrant's Relocation & Settlement Guide`,
    description: `Planning to settle in ${countryName}? Explore cost of living, employment, healthcare, language requirements, lifestyle, and long-term immigration environment.`,
    alternates: {
      canonical: `https://immigrationinfoguide.com/country/${params.slug}`,
    },
    openGraph: {
      title: `Living in ${countryName}: Immigrant's Relocation & Settlement Guide`,
      description: `Planning to settle in ${countryName}? Explore cost of living, employment, healthcare, language requirements, lifestyle, and long-term immigration environment.`,
      url: `https://immigrationinfoguide.com/country/${params.slug}`,
      type: 'article',
    },
  };
}

export default async function CountryPage({ params }: { params: { slug: string } }) {
  const { data: guideData, error } = await supabase
    .from('country_guides')
    .select('*, countries(name, region, country_code)')
    .eq('country_slug', params.slug)
    .single();

  const guide = guideData as any;

  if (error || !guide) {
    return (
      <div className="min-h-screen bg-white">
        <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12 text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-4">
            Guide Not Available
          </h1>
          <p className="text-gray-600 mb-6">
            This country guide is not yet available. Check back soon!
          </p>
          <Link
            href="/immigration-guides"
            className="text-brand-primary hover:text-indigo-700 font-medium"
          >
            View Available Guides
          </Link>
        </div>
      </div>
    );
  }

  const keyFacts = guide.key_facts as Array<{ label: string; value: string }>;
  const popularPathways = guide.popular_pathways as Array<{ type: string; name: string }>;
  const officialResources = guide.official_resources as Array<{ name: string; url: string }>;

  const countryFAQs = [
    {
      question: `What are the main visa types for immigrating to ${guide.countries.name}?`,
      answer: `${guide.countries.name} offers various immigration pathways including work visas for skilled professionals, study permits for international students, family reunification visas, business and investor visas, and retirement options. Each pathway has specific requirements for eligibility, documentation, and processing times. Visit our Path Finder tool to explore pathways that match your situation.`,
    },
    {
      question: `How much does it cost to live in ${guide.countries.name}?`,
      answer: guide.cost_of_living || `The cost of living in ${guide.countries.name} varies by city and lifestyle. Major urban centers typically have higher costs for housing and daily expenses. Research specific cities and budget for housing, food, transportation, healthcare, and other living expenses based on your intended location.`,
    },
    {
      question: `Do I need to speak the local language to immigrate to ${guide.countries.name}?`,
      answer: guide.language_requirements || `Language requirements for ${guide.countries.name} depend on your immigration pathway. Some visa types require proof of language proficiency, while others may not. Work visas often require business-level language skills, while student visas depend on the program's language of instruction. Check specific requirements for your intended visa category.`,
    },
    {
      question: `What is the job market like in ${guide.countries.name}?`,
      answer: guide.employment_opportunities || `Employment opportunities in ${guide.countries.name} vary by industry and region. Research in-demand occupations, average salaries in your field, and work permit requirements. Some sectors may have labor shortages offering better prospects for foreign workers. Consider working with recruitment agencies specializing in your industry.`,
    },
  ];

  const breadcrumbSchema = buildBreadcrumbSchema([
    { name: 'Home', url: 'https://immigrationinfoguide.com' },
    { name: 'Immigration Guides', url: 'https://immigrationinfoguide.com/immigration-guides' },
    { name: guide.countries.name, url: `https://immigrationinfoguide.com/country/${params.slug}` },
  ]);

  const articleSchema = buildArticleSchema({
    headline: `${guide.countries.name} Immigration Guide`,
    description: guide.overview,
    url: `https://immigrationinfoguide.com/country/${params.slug}`,
    dateModified: guide.last_updated,
  });

  const faqSchema = buildFaqSchema(countryFAQs);

  const blogPosts = await getAllBlogPosts().catch(() => []);
  const relatedLinksGroups = getCountryGuideRelatedLinks({
    countrySlug: params.slug,
    blogPosts: blogPosts.map((p) => ({ slug: p.slug, title: p.title, tags: p.tags, category: p.category })),
  });

  return (
    <div className="min-h-screen bg-white">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(articleSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(faqSchema) }}
      />
      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <BackNavigation fallbackUrl="/immigration-guides" label="Back to Guides" className="mb-4" />
        <div className="flex items-center space-x-3 mb-2">
          <Globe className="h-8 w-8 text-brand-primary" />
          <h1 className="text-3xl font-bold text-gray-900">
            Living in {guide.countries.name}: Relocation Guide
          </h1>
        </div>

        <p className="text-sm text-gray-500 mb-8">{guide.countries.region}</p>

        <div className="prose max-w-none mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Settling in {guide.countries.name}</h2>
          <p className="text-gray-700 leading-relaxed">{guide.overview}</p>
          <p className="text-gray-700 leading-relaxed mt-3">
            This guide covers what life is actually like once you arrive — cost of living, job markets, healthcare, education, and the cultural context you need to plan a successful long-term relocation to {guide.countries.name}.
          </p>
        </div>

        {keyFacts && keyFacts.length > 0 && (
          <div className="bg-gray-50 rounded-lg p-6 mb-8">
            <h3 className="font-semibold text-gray-900 mb-4">Key Facts</h3>
            <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
              {keyFacts.map((fact, index) => (
                <div key={index}>
                  <p className="text-xs text-gray-500">{fact.label}</p>
                  <p className="text-sm font-medium text-gray-900">{fact.value}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        <div className="mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Why Immigrants Choose {guide.countries.name}</h2>
          <p className="text-gray-700 leading-relaxed">{guide.why_immigrate}</p>
        </div>

        {popularPathways && popularPathways.length > 0 && (
          <div className="mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-4">Common Routes to {guide.countries.name}</h2>
            <p className="text-sm text-gray-500 mb-4">For detailed eligibility and application steps, visit the <Link href={`/immigrate-to/${params.slug}`} className="text-brand-primary hover:underline">immigration pathways page</Link>.</p>
            <div className="grid md:grid-cols-2 gap-4">
              {popularPathways.map((pathway, index) => (
                <div key={index} className="border border-gray-200 rounded-lg p-4">
                  <p className="text-xs font-medium text-brand-primary mb-1">{pathway.type}</p>
                  <p className="text-sm font-semibold text-gray-900">{pathway.name}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        <h2 className="text-2xl font-bold text-gray-900 mb-6">Life in {guide.countries.name}: What to Expect</h2>

        <div className="grid md:grid-cols-2 gap-8 mb-8">
          {guide.cost_of_living && (
            <div>
              <div className="flex items-center space-x-2 mb-3">
                <DollarSign className="h-5 w-5 text-brand-primary" />
                <h3 className="font-semibold text-gray-900">Cost of Living</h3>
              </div>
              <p className="text-sm text-gray-700 leading-relaxed">{guide.cost_of_living}</p>
            </div>
          )}

          {guide.language_requirements && (
            <div>
              <div className="flex items-center space-x-2 mb-3">
                <Languages className="h-5 w-5 text-brand-primary" />
                <h3 className="font-semibold text-gray-900">Language Requirements</h3>
              </div>
              <p className="text-sm text-gray-700 leading-relaxed">{guide.language_requirements}</p>
            </div>
          )}

          {guide.employment_opportunities && (
            <div>
              <div className="flex items-center space-x-2 mb-3">
                <Briefcase className="h-5 w-5 text-brand-primary" />
                <h3 className="font-semibold text-gray-900">Employment Opportunities</h3>
              </div>
              <p className="text-sm text-gray-700 leading-relaxed">{guide.employment_opportunities}</p>
            </div>
          )}

          {guide.climate_lifestyle && (
            <div>
              <div className="flex items-center space-x-2 mb-3">
                <Home className="h-5 w-5 text-brand-primary" />
                <h3 className="font-semibold text-gray-900">Climate & Lifestyle</h3>
              </div>
              <p className="text-sm text-gray-700 leading-relaxed">{guide.climate_lifestyle}</p>
            </div>
          )}

          {guide.healthcare_system && (
            <div>
              <div className="flex items-center space-x-2 mb-3">
                <Heart className="h-5 w-5 text-brand-primary" />
                <h3 className="font-semibold text-gray-900">Healthcare System</h3>
              </div>
              <p className="text-sm text-gray-700 leading-relaxed">{guide.healthcare_system}</p>
            </div>
          )}

          {guide.education_system && (
            <div>
              <div className="flex items-center space-x-2 mb-3">
                <GraduationCap className="h-5 w-5 text-brand-primary" />
                <h3 className="font-semibold text-gray-900">Education System</h3>
              </div>
              <p className="text-sm text-gray-700 leading-relaxed">{guide.education_system}</p>
            </div>
          )}
        </div>

        {guide.visa_free_travel && (
          <div className="mb-8">
            <h3 className="font-semibold text-gray-900 mb-3">Visa-Free Travel</h3>
            <p className="text-sm text-gray-700 leading-relaxed">{guide.visa_free_travel}</p>
          </div>
        )}

        {officialResources && officialResources.length > 0 && (
          <div className="bg-indigo-50 rounded-lg border border-indigo-200 p-6 mb-8">
            <h3 className="font-semibold text-gray-900 mb-4">Official Resources</h3>
            <div className="space-y-2">
              {officialResources.map((resource, index) => (
                <a
                  key={index}
                  href={resource.url}
                  target="_blank"
                  rel="noopener noreferrer"
                                    className="flex items-center justify-between text-sm text-brand-primary hover:text-indigo-700 transition-colors"
                >
                  <span>{resource.name}</span>
                  <ExternalLink className="h-4 w-4" />
                </a>
              ))}
            </div>
          </div>
        )}

        <CrossDomainLink
          countryName={guide.countries.name}
          countrySlug={params.slug}
          countryCode={guide.countries.country_code}
          siteType="visa"
        />

        <div className="bg-gray-50 rounded-xl border border-gray-200 p-6 mb-8">
          <h3 className="font-semibold text-gray-900 mb-4">Tools & Resources for {guide.countries.name}</h3>
          <div className="grid sm:grid-cols-2 gap-3">
            <Link
              href={`/path-finder?destination=${params.slug}`}
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <Compass className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Path Finder</p>
                <p className="text-xs text-gray-500 mt-0.5">Personalised pathway recommendations</p>
              </div>
            </Link>
            <Link
              href={`/immigration-cost/${params.slug}`}
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <Calculator className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Immigration Costs</p>
                <p className="text-xs text-gray-500 mt-0.5">Visa fees, medical & legal costs</p>
              </div>
            </Link>
            <Link
              href={`/immigrate-to/${params.slug}`}
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <Globe className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Immigration Pathways</p>
                <p className="text-xs text-gray-500 mt-0.5">Work, residency, digital nomad & more</p>
              </div>
            </Link>
            <Link
              href="/document-checklist"
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <FileText className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Document Checklist</p>
                <p className="text-xs text-gray-500 mt-0.5">Prepare your application documents</p>
              </div>
            </Link>
            <Link
              href="/country-comparison"
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <BarChart2 className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Compare Countries</p>
                <p className="text-xs text-gray-500 mt-0.5">Side-by-side destination comparison</p>
              </div>
            </Link>
            <Link
              href="/immigration-guides"
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <BookOpen className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">All Country Guides</p>
                <p className="text-xs text-gray-500 mt-0.5">Browse 50+ destination guides</p>
              </div>
            </Link>
          </div>
        </div>

        <div className="border-t pt-8 mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-6">
            Frequently Asked Questions
          </h2>
          <div className="space-y-6">
            {countryFAQs.map((faq, index) => (
              <div key={index} className="border-l-4 border-indigo-500 pl-4">
                <h3 className="text-lg font-semibold text-gray-900 mb-2">
                  {faq.question}
                </h3>
                <p className="text-gray-700">
                  {faq.answer}
                </p>
              </div>
            ))}
          </div>
        </div>

        <p className="text-xs text-gray-500 mt-8">
          Last updated: {new Date(guide.last_updated).toLocaleDateString()}
        </p>

        <RelatedLinksSection groups={relatedLinksGroups} />
      </div>
    </div>
  );
}
