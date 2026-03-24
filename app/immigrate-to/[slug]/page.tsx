import Link from 'next/link';
import { notFound } from 'next/navigation';
import { Globe, ExternalLink, Clock, FileCheck, Award, CircleCheck as CheckCircle, TriangleAlert as AlertTriangle, FileText, Compass, Calculator, ChartBar as BarChart2, BookOpen, ListChecks } from 'lucide-react';
import VisaEntryNotice from '@/components/VisaEntryNotice';
import { getCountryBySlug, getImmigrationPathways, getCountries } from '@/lib/supabaseClient';
import { generateStarterPathways } from '@/lib/generateStarterPathways';
import { generateStarterCountryGuide } from '@/lib/generateStarterCountryGuide';
import { PATHWAY_TYPES } from '@/lib/pathwayTypes';
import { buildBreadcrumbSchema, buildFaqSchema } from '@/lib/schemaBuilders';
import { getAllBlogPosts } from '@/lib/blogData';
import { getCountryHubRelatedLinks } from '@/lib/seo/relatedLinks';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';

interface Pathway {
  id?: string;
  passport_slug: string;
  destination_slug: string;
  pathway_type: string;
  pathway_name: string;
  summary: string;
  eligibility: string;
  requirements: string;
  processing_time: string;
  validity_period: string;
  official_url: string | null;
  last_updated: string;
  isStarter?: boolean;
}

export const revalidate = 86400;

export async function generateStaticParams() {
  try {
    const countries = await getCountries();
    if (countries.length > 0) {
      return countries.map((country) => ({
        slug: country.slug,
      }));
    }
  } catch (error) {
    console.error('Error generating static params:', error);
  }

  return [];
}

export async function generateMetadata({ params }: { params: { slug: string } }) {
  let countryName = 'Country';

  try {
    const { data: country } = await getCountryBySlug(params.slug);
    countryName = (country as any)?.name || countryName;
  } catch (error) {
    countryName = params.slug.split('-').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
  }

  return {
    title: `Immigrate to ${countryName} - Residency, Work Visas, and Pathways`,
    description: `Explore immigration pathways, residency permits, work visas, and long-term stay options in ${countryName}. Find the right path for your move.`,
    alternates: {
      canonical: `https://immigrationinfoguide.com/immigrate-to/${params.slug}`,
    },
    openGraph: {
      title: `Immigrate to ${countryName} - Residency, Work Visas, and Pathways`,
      description: `Explore immigration pathways, residency permits, work visas, and long-term stay options in ${countryName}. Find the right path for your move.`,
      url: `https://immigrationinfoguide.com/immigrate-to/${params.slug}`,
      type: 'article',
    },
  };
}

export default async function ImmigratePage({ params }: { params: { slug: string } }) {
  const { data: country, error } = await getCountryBySlug(params.slug);

  if (error || !country) {
    notFound();
  }

  const countryData = country as { slug: string; name: string; region: string; iso_code?: string | null };

  let pathwaysData: Pathway[] = [];
  let usingStarterPathways = false;

  try {
    const { data: pathways } = await getImmigrationPathways(params.slug);
    if (pathways && pathways.length > 0) {
      pathwaysData = (pathways as Pathway[]).map(p => ({ ...p, isStarter: false }));
    } else {
      const generatedPathways = generateStarterPathways(params.slug, countryData.name);
      pathwaysData = generatedPathways.map((p, index) => ({
        ...p,
        id: `starter-${index}`,
      }));
      usingStarterPathways = true;
    }
  } catch (err) {
    const generatedPathways = generateStarterPathways(params.slug, countryData.name);
    pathwaysData = generatedPathways.map((p, index) => ({
      ...p,
      id: `starter-${index}`,
    }));
    usingStarterPathways = true;
  }

  const countryGuide = generateStarterCountryGuide(countryData.name);

  const blogPosts = await getAllBlogPosts().catch(() => []);
  const relatedLinksGroups = getCountryHubRelatedLinks({
    countrySlug: params.slug,
    blogPosts: blogPosts.map((p) => ({ slug: p.slug, title: p.title, tags: p.tags, category: p.category })),
  });

  const breadcrumbSchema = buildBreadcrumbSchema([
    { name: 'Home', url: 'https://immigrationinfoguide.com' },
    { name: `Immigrate to ${countryData.name}`, url: `https://immigrationinfoguide.com/immigrate-to/${params.slug}` },
  ]);

  const faqSchema = buildFaqSchema([
    {
      question: `What are the immigration pathways to ${countryData.name}?`,
      answer: `${countryData.name} offers various immigration pathways including work visas, residency permits, digital nomad visas, study permits, retirement visas, and investor programs. Each pathway has specific requirements, processing times, and validity periods.`,
    },
    {
      question: `How can I find the right immigration pathway to ${countryData.name}?`,
      answer: 'Use our Immigration Path Finder tool to discover personalized pathways based on your passport, destination, and goals. The tool filters options relevant to your situation and provides detailed information about requirements and application processes.',
    },
    {
      question: `Do I need a visa to enter ${countryData.name}?`,
      answer: `Visa requirements depend on your nationality. Check visa entry requirements for ${countryData.name} on VisaInfoGuide.com to see if you need a tourist or business visa before planning your long-term relocation.`,
    },
  ]);

  const pathwayTypeColors: Record<string, string> = {
    'Work': 'bg-blue-50 text-blue-700 border-blue-200',
    'Residency': 'bg-green-50 text-green-700 border-green-200',
    'Digital Nomad': 'bg-purple-50 text-purple-700 border-purple-200',
    'Study': 'bg-orange-50 text-orange-700 border-orange-200',
    'Investor': 'bg-indigo-50 text-indigo-700 border-indigo-200',
    'Retirement': 'bg-amber-50 text-amber-700 border-amber-200',
  };

  return (
    <div className="min-h-screen bg-white">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(faqSchema) }}
      />
      <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="flex items-center space-x-3 mb-4">
          <Globe className="h-10 w-10 text-brand-primary" />
          <h1 className="text-4xl font-bold text-gray-900">
            Immigrate to {countryData.name}
          </h1>
        </div>

        <p className="text-xl text-gray-600 mb-8">
          Explore legal pathways for long-term residence, work, and citizenship.
        </p>

        <div className="bg-gray-50 rounded-lg p-4 mb-8">
          <p className="text-sm text-gray-600">
            Region: <span className="font-medium text-gray-900">{countryData.region}</span>
          </p>
        </div>

        <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
          <h2 className="text-2xl font-semibold text-gray-900 mb-4">
            Overview
          </h2>
          <p className="text-gray-700 mb-4">
            {countryGuide ? countryGuide.overview :
              `${countryData.name} offers various immigration pathways for individuals looking to relocate for work,
              study, retirement, or investment purposes. Each pathway has specific requirements, processing
              times, and validity periods.`}
          </p>
          <p className="text-gray-700">
            Below you'll find the available immigration pathways, their requirements, and key information
            to help you determine which option best suits your situation.
          </p>
          <p className="text-sm text-amber-700 mt-4 font-medium">
            Always verify requirements via official government sources. This is not legal advice.
          </p>
        </div>

        <VisaEntryNotice countryName={countryData?.name} variantIndex={0} />

        {pathwaysData && pathwaysData.length > 0 ? (
          <div>
            <h2 className="text-2xl font-semibold text-gray-900 mb-6">
              Immigration Pathways
            </h2>

            <div className="grid gap-6 mb-8">
              {pathwaysData.map((pathway) => (
                <div
                  key={pathway.id}
                  className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-md transition-shadow"
                >
                  <div className="flex items-start justify-between mb-4">
                    <div>
                      <h3 className="text-xl font-semibold text-gray-900 mb-2">
                        {pathway.pathway_name}
                      </h3>
                      <div className="flex items-center gap-2">
                        <span
                          className={`inline-block px-3 py-1 text-xs font-medium rounded-full border ${
                            pathwayTypeColors[pathway.pathway_type] || 'bg-gray-50 text-gray-700 border-gray-200'
                          }`}
                        >
                          {pathway.pathway_type}
                        </span>
                        {pathway.isStarter && (
                          <span className="px-2.5 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-md">
                            Starter
                          </span>
                        )}
                      </div>
                    </div>
                  </div>

                  <p className="text-gray-700 mb-6">{pathway.summary}</p>

                  {pathway.isStarter && (
                    <div className="mb-4 p-3 bg-amber-50 border border-amber-200 rounded-md">
                      <p className="text-xs text-amber-800">
                        This is starter content for informational purposes only. Always verify requirements via official government sources. This is not legal advice.
                      </p>
                    </div>
                  )}

                  <div className="grid md:grid-cols-2 gap-6 mb-4">
                    <div>
                      <h4 className="flex items-center text-sm font-semibold text-gray-900 mb-2">
                        <Award className="h-4 w-4 mr-2 text-brand-primary" />
                        Eligibility
                      </h4>
                      <p className="text-sm text-gray-700">{pathway.eligibility}</p>
                    </div>

                    <div>
                      <h4 className="flex items-center text-sm font-semibold text-gray-900 mb-2">
                        <FileCheck className="h-4 w-4 mr-2 text-brand-primary" />
                        Requirements
                      </h4>
                      <p className="text-sm text-gray-700">{pathway.requirements}</p>
                    </div>

                    <div>
                      <h4 className="flex items-center text-sm font-semibold text-gray-900 mb-2">
                        <Clock className="h-4 w-4 mr-2 text-brand-primary" />
                        Processing Time
                      </h4>
                      <p className="text-sm text-gray-700">{pathway.processing_time}</p>
                    </div>

                    <div>
                      <h4 className="flex items-center text-sm font-semibold text-gray-900 mb-2">
                        <Clock className="h-4 w-4 mr-2 text-brand-primary" />
                        Validity Period
                      </h4>
                      <p className="text-sm text-gray-700">{pathway.validity_period}</p>
                    </div>
                  </div>

                  {pathway.official_url && (
                    <div className="border-t border-gray-200 pt-4 mt-4">
                      <a
                        href={pathway.official_url}
                        target="_blank"
                        rel="noopener noreferrer"
                                                className="inline-flex items-center text-sm text-brand-primary hover:text-indigo-700 font-medium"
                      >
                        <ExternalLink className="h-4 w-4 mr-2" />
                        Official Application Portal
                      </a>
                    </div>
                  )}

                  <p className="text-xs text-gray-500 mt-4">
                    Last updated: {new Date(pathway.last_updated).toLocaleDateString()}
                  </p>
                </div>
              ))}
            </div>
          </div>
        ) : (
          <div className="bg-white rounded-lg border border-gray-200 p-8 text-center mb-8">
            <h3 className="text-lg font-semibold text-gray-900 mb-2">
              Immigration Pathways Coming Soon
            </h3>
            <p className="text-gray-600 mb-4">
              Detailed pathway information for {countryData.name} will be available soon.
            </p>
          </div>
        )}

        <div className="bg-white rounded-lg border border-gray-200 p-6 mb-8">
          <h2 className="flex items-center text-2xl font-semibold text-gray-900 mb-4">
            <ListChecks className="h-6 w-6 mr-2 text-brand-primary" />
            How to Apply: General Steps
          </h2>
          <p className="text-sm text-gray-600 mb-4">
            Most immigration pathways to {countryData.name} follow a similar application process:
          </p>
          <ol className="space-y-3">
            {[
              { step: '1', title: 'Choose your pathway', desc: 'Identify the right immigration route based on your purpose (work, study, retirement, investment) and eligibility.' },
              { step: '2', title: 'Check eligibility requirements', desc: 'Review the specific criteria for your chosen pathway including education, work experience, age, and financial requirements.' },
              { step: '3', title: 'Gather supporting documents', desc: 'Collect passports, certificates, financial records, police clearances, and medical reports as required.' },
              { step: '4', title: 'Submit your application', desc: 'Apply online or in person at the relevant government authority or embassy. Pay all required fees.' },
              { step: '5', title: 'Wait for processing', desc: 'Processing times vary by pathway. Check the timeline for your specific route and respond promptly to any requests for additional information.' },
              { step: '6', title: 'Receive your decision', desc: 'If approved, follow the instructions for next steps including biometrics, entry endorsement, or permit collection.' },
            ].map(({ step, title, desc }) => (
              <li key={step} className="flex items-start gap-4">
                <div className="w-7 h-7 rounded-full bg-brand-primary/10 text-brand-primary font-bold text-sm flex items-center justify-center flex-shrink-0 mt-0.5">
                  {step}
                </div>
                <div>
                  <span className="text-sm font-semibold text-gray-900">{title}: </span>
                  <span className="text-sm text-gray-700">{desc}</span>
                </div>
              </li>
            ))}
          </ol>
          <div className="mt-4 pt-4 border-t border-gray-200">
            <Link href={`/immigration-cost/${params.slug}`} className="inline-flex items-center text-sm text-brand-primary hover:text-brand-primary-hover font-medium">
              <Calculator className="h-4 w-4 mr-1.5" />
              Estimate your total immigration costs for {countryData.name}
            </Link>
          </div>
        </div>

        <div className="bg-white rounded-lg border border-gray-200 p-6 mb-8">
          <h3 className="flex items-center text-lg font-semibold text-gray-900 mb-4">
            <Compass className="h-5 w-5 mr-2 text-brand-primary" />
            Explore by Pathway Type
          </h3>
          <p className="text-sm text-gray-600 mb-6">
            View detailed information for specific immigration pathways to {countryData.name}:
          </p>
          <div className="grid md:grid-cols-2 gap-4">
            {PATHWAY_TYPES.map((pathwayType) => (
              <Link
                key={pathwayType.slug}
                href={`/${pathwayType.slug}-${params.slug}`}
                className="border border-gray-200 rounded-lg p-5 hover:border-indigo-500 hover:bg-indigo-50 transition-all group"
              >
                <div className="flex items-start justify-between mb-3">
                  <h4 className="text-base font-semibold text-gray-900 group-hover:text-indigo-700">
                    {pathwayType.type}
                  </h4>
                  <ExternalLink className="h-4 w-4 text-gray-400 group-hover:text-brand-primary flex-shrink-0 mt-1" />
                </div>
                <p className="text-sm text-gray-600 leading-relaxed">
                  {pathwayType.description}
                </p>
              </Link>
            ))}
          </div>
        </div>

        <div className="space-y-6 mb-8">
          {countryGuide.commonPathways.length > 0 && (
            <div className="bg-white rounded-lg border border-gray-200 p-6">
              <h3 className="flex items-center text-lg font-semibold text-gray-900 mb-4">
                <Compass className="h-5 w-5 mr-2 text-brand-primary" />
                Common Immigration Pathways
              </h3>
              <ul className="space-y-2">
                {countryGuide.commonPathways.map((pathway, index) => (
                  <li key={index} className="flex items-start">
                    <CheckCircle className="h-5 w-5 mr-2 text-brand-primary flex-shrink-0 mt-0.5" />
                    <span className="text-gray-700">{pathway}</span>
                  </li>
                ))}
              </ul>
            </div>
          )}

          {countryGuide.documentsRequired.length > 0 && (
            <div className="bg-white rounded-lg border border-gray-200 p-6">
              <h3 className="flex items-center text-lg font-semibold text-gray-900 mb-4">
                <FileText className="h-5 w-5 mr-2 text-brand-primary" />
                Typical Documents Required
              </h3>
              <ul className="space-y-2">
                {countryGuide.documentsRequired.map((doc, index) => (
                  <li key={index} className="flex items-start">
                    <FileCheck className="h-5 w-5 mr-2 text-gray-400 flex-shrink-0 mt-0.5" />
                    <span className="text-gray-700">{doc}</span>
                  </li>
                ))}
              </ul>
            </div>
          )}

          {countryGuide.importantNotes.length > 0 && (
            <div className="bg-white rounded-lg border border-gray-200 p-6">
              <h3 className="flex items-center text-lg font-semibold text-gray-900 mb-4">
                <AlertTriangle className="h-5 w-5 mr-2 text-amber-600" />
                Important Notes
              </h3>
              <ul className="space-y-2">
                {countryGuide.importantNotes.map((note, index) => (
                  <li key={index} className="flex items-start">
                    <AlertTriangle className="h-5 w-5 mr-2 text-amber-500 flex-shrink-0 mt-0.5" />
                    <span className="text-gray-700">{note}</span>
                  </li>
                ))}
              </ul>
            </div>
          )}
        </div>

        <div className="bg-gray-50 rounded-xl border border-gray-200 p-6 mb-8">
          <h3 className="font-semibold text-gray-900 mb-4">Tools & Resources for {countryData.name}</h3>
          <div className="grid sm:grid-cols-2 gap-3 mb-4">
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
                <p className="text-xs text-gray-500 mt-0.5">Visa fees, medical & legal breakdown</p>
              </div>
            </Link>
            <Link
              href={`/country/${params.slug}`}
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <Globe className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Country Guide</p>
                <p className="text-xs text-gray-500 mt-0.5">Cost of living, jobs & culture</p>
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
          <div className="border-t border-gray-200 pt-4">
            <a
              href={`https://visainfoguide.com/destination/${params.slug}`}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center text-sm text-brand-primary hover:text-brand-primary-hover font-medium"
            >
              Check entry visa requirements on VisaInfoGuide.com
              <ExternalLink className="ml-1.5 h-3.5 w-3.5" />
            </a>
          </div>
        </div>

        <RelatedLinksSection groups={relatedLinksGroups} />
      </div>
    </div>
  );
}
