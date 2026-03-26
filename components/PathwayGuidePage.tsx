import Link from 'next/link';
import { Globe, ExternalLink, Clock, FileCheck, Award, ArrowRight, Info, TriangleAlert as AlertTriangle, Plane } from 'lucide-react';
import VisaEntryNotice from '@/components/VisaEntryNotice';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';
import type { RelatedLinkGroup } from '@/lib/seo/relatedLinks';
import type { PathwayType } from '@/lib/pathwayTypes';
import type { PathwayQualityMetrics, EnrichedPathwayContent } from '@/lib/pathwayContentHelpers';

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

interface PathwayGuidePageProps {
  countrySlug: string;
  countryName: string;
  pathwayType: PathwayType;
  pathwaysData: Pathway[];
  usingStarter: boolean;
  qualityMetrics: PathwayQualityMetrics | null;
  enrichedContent: EnrichedPathwayContent | null;
  relatedLinksGroups: RelatedLinkGroup[];
}

export default function PathwayGuidePage({
  countrySlug,
  countryName,
  pathwayType,
  pathwaysData,
  usingStarter,
  qualityMetrics,
  enrichedContent,
  relatedLinksGroups,
}: PathwayGuidePageProps) {
  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-gradient-to-br from-brand-primary to-indigo-700 text-white py-16">
        <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
          <div className="flex items-center space-x-2 text-indigo-100 mb-4">
            <Link href="/" className="hover:text-white transition-colors">
              Home
            </Link>
            <span>/</span>
            <Link href="/immigration-guides" className="hover:text-white transition-colors">
              Immigration Guides
            </Link>
            <span>/</span>
            <Link href={`/immigrate-to/${countrySlug}`} className="hover:text-white transition-colors">
              {countryName}
            </Link>
            <span>/</span>
            <span className="text-white">{pathwayType.type}</span>
          </div>

          <h1 className="text-4xl font-bold mb-4">
            {pathwayType.title} in {countryName}
          </h1>
          <p className="text-xl text-indigo-50 max-w-3xl">
            Explore requirements, eligibility, and pathways for {pathwayType.type.toLowerCase()} immigration and long-term residence.
          </p>
        </div>
      </div>

      <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 py-12">
        {usingStarter && (
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-8 flex items-start space-x-3">
            <Info className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
            <div>
              <p className="text-sm text-blue-900">
                <strong>Starter Content:</strong> This page shows informational template content. Verify specific requirements and pathways with official government sources.
              </p>
            </div>
          </div>
        )}

        {qualityMetrics && !qualityMetrics.is_indexable && (
          <div className="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-8 flex items-start space-x-3">
            <AlertTriangle className="h-5 w-5 text-amber-600 flex-shrink-0 mt-0.5" />
            <div className="flex-1">
              <p className="text-sm text-amber-900 font-semibold mb-2">
                Limited Content Notice
              </p>
              <p className="text-sm text-amber-800 mb-2">
                This page currently has basic information only (Quality Score: {Math.round(qualityMetrics.content_richness_score)}/100).
                We&apos;re working to add more comprehensive details including step-by-step guides, cost breakdowns, FAQs, and real examples.
              </p>
              <p className="text-xs text-amber-700">
                Always verify information with official government sources and consider consulting an immigration professional.
              </p>
            </div>
          </div>
        )}

        <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">
            Overview
          </h2>
          <p className="text-gray-700 leading-relaxed">
            {pathwayType.description} in {countryName}. Requirements, eligibility criteria, and application processes vary depending on your specific situation, nationality, and the type of residence permit you&apos;re seeking.
          </p>
        </div>

        <VisaEntryNotice countryName={countryName} variantIndex={1} />

        {pathwaysData.length > 0 ? (
          <div className="space-y-6 mb-8">
            <h2 className="text-2xl font-bold text-gray-900">
              Available {pathwayType.type} Pathways
            </h2>

            {pathwaysData.map((pathway) => (
              <div
                key={pathway.id}
                className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-md transition-shadow"
              >
                <div className="flex items-start justify-between mb-3">
                  <h3 className="text-xl font-semibold text-gray-900">
                    {pathway.pathway_name}
                  </h3>
                  {pathway.isStarter && (
                    <span className="px-3 py-1 text-xs font-medium rounded-full bg-blue-100 text-blue-800">
                      Starter content
                    </span>
                  )}
                </div>

                <p className="text-gray-700 mb-6">{pathway.summary}</p>

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
        ) : (
          <div className="bg-white rounded-lg border border-gray-200 p-8 text-center mb-8">
            <h3 className="text-lg font-semibold text-gray-900 mb-2">
              No {pathwayType.type} Pathways Available
            </h3>
            <p className="text-gray-600">
              Specific pathway information for {pathwayType.type.toLowerCase()} immigration to {countryName} will be available soon.
            </p>
          </div>
        )}

        {enrichedContent && enrichedContent.contentSections.length > 0 && (
          <div className="space-y-6 mb-8">
            {enrichedContent.contentSections.map((section) => (
              <div key={section.id} className="bg-white rounded-lg border border-gray-200 p-8">
                <h2 className="text-2xl font-bold text-gray-900 mb-4">{section.title}</h2>
                <div className="prose prose-teal max-w-none text-gray-700 leading-relaxed whitespace-pre-line">
                  {section.content}
                </div>
              </div>
            ))}
          </div>
        )}

        {enrichedContent && enrichedContent.costBreakdown.length > 0 && (
          <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">Cost Breakdown</h2>
            <div className="space-y-4">
              {enrichedContent.costBreakdown.map((cost) => (
                <div key={cost.id} className="flex justify-between items-start border-b border-gray-100 pb-3">
                  <div className="flex-1">
                    <h3 className="font-semibold text-gray-900">{cost.cost_category}</h3>
                    {cost.description && (
                      <p className="text-sm text-gray-600 mt-1">{cost.description}</p>
                    )}
                    {!cost.is_mandatory && (
                      <span className="inline-block mt-1 text-xs text-gray-500 italic">Optional</span>
                    )}
                  </div>
                  <div className="text-right ml-4">
                    <p className="font-semibold text-gray-900">
                      {cost.amount_min && cost.amount_max
                        ? `${cost.currency} ${cost.amount_min.toLocaleString()} - ${cost.amount_max.toLocaleString()}`
                        : cost.amount_min
                        ? `${cost.currency} ${cost.amount_min.toLocaleString()}+`
                        : 'Varies'}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {enrichedContent && enrichedContent.faqs.length > 0 && (
          <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">Frequently Asked Questions</h2>
            <div className="space-y-6">
              {enrichedContent.faqs.map((faq) => (
                <div key={faq.id}>
                  <h3 className="font-semibold text-gray-900 mb-2">{faq.question}</h3>
                  <p className="text-gray-700 leading-relaxed">{faq.answer}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        {enrichedContent && enrichedContent.caseStudies.length > 0 && (
          <div className="space-y-6 mb-8">
            <h2 className="text-2xl font-bold text-gray-900">Real-World Examples</h2>
            {enrichedContent.caseStudies.map((study) => (
              <div key={study.id} className="bg-gradient-to-br from-indigo-50 to-blue-50 rounded-lg border border-indigo-200 p-6">
                <h3 className="text-xl font-bold text-gray-900 mb-2">{study.title}</h3>
                <p className="text-gray-700 mb-4">{study.summary}</p>
                {study.applicant_profile && Object.keys(study.applicant_profile).length > 0 && (
                  <div className="text-sm text-gray-600 mb-3">
                    <strong>Profile:</strong>{' '}
                    {Object.entries(study.applicant_profile)
                      .map(([key, value]) => `${key}: ${value}`)
                      .join(' | ')}
                  </div>
                )}
                <details className="text-sm text-gray-700">
                  <summary className="cursor-pointer font-medium text-brand-primary hover:text-indigo-700">
                    Read full story
                  </summary>
                  <p className="mt-3 whitespace-pre-line">{study.full_story}</p>
                </details>
              </div>
            ))}
          </div>
        )}

        <div className="grid md:grid-cols-3 gap-6 mb-8">
          <div className="bg-white rounded-lg border border-gray-200 p-6">
            <h3 className="font-semibold text-gray-900 mb-3 flex items-center">
              <Globe className="h-5 w-5 mr-2 text-brand-primary" />
              Check Visa Entry Requirements
            </h3>
            <p className="text-sm text-gray-600 mb-4">
              Before applying for immigration, check if you need a tourist or short-stay visa to enter {countryName}.
            </p>
            <a
              href="https://www.visainfoguide.com"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center text-sm font-medium text-brand-primary hover:text-sky-700"
            >
              View Entry Requirements →
              <ExternalLink className="h-3.5 w-3.5 ml-1.5" />
            </a>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6">
            <h3 className="font-semibold text-gray-900 mb-3 flex items-center">
              <Plane className="h-5 w-5 mr-2 text-brand-primary" />
              Plan Your Travel
            </h3>
            <p className="text-sm text-gray-600 mb-4">
              Moving to {countryName} involves long international flights. Find airport transit hotels for layovers along the way.
            </p>
            <a
              href="https://www.restinairport.com"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center text-sm font-medium text-brand-primary hover:text-sky-700"
            >
              Find Airport Hotels →
              <ExternalLink className="h-3.5 w-3.5 ml-1.5" />
            </a>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6">
            <h3 className="font-semibold text-gray-900 mb-3 flex items-center">
              <Globe className="h-5 w-5 mr-2 text-brand-primary" />
              All Immigration Pathways
            </h3>
            <p className="text-sm text-gray-600 mb-4">
              Explore all available immigration routes and residence options for {countryName}.
            </p>
            <Link
              href={`/immigrate-to/${countrySlug}`}
              className="inline-flex items-center text-sm font-medium text-brand-primary hover:text-indigo-700"
            >
              See All Pathways
              <ArrowRight className="h-4 w-4 ml-2" />
            </Link>
          </div>
        </div>

        <div className="bg-gradient-to-br from-indigo-50 to-blue-50 rounded-lg border border-indigo-200 p-8 text-center">
          <h3 className="text-xl font-bold text-gray-900 mb-3">
            Find Your Immigration Path
          </h3>
          <p className="text-gray-700 mb-6 max-w-2xl mx-auto">
            Use our interactive Path Finder to discover personalized immigration options based on your passport, destination, and goals.
          </p>
          <Link
            href="/path-finder"
            className="inline-flex items-center px-6 py-3 bg-brand-primary text-white font-semibold rounded-md hover:bg-indigo-700 transition-colors"
          >
            Start Path Finder
            <ArrowRight className="h-5 w-5 ml-2" />
          </Link>
        </div>

        <RelatedLinksSection groups={relatedLinksGroups} />
      </div>
    </div>
  );
}
