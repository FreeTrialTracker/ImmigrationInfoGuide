import Link from 'next/link';
import { Globe, ExternalLink, Clock, FileCheck, Award, ArrowRight, Info, TriangleAlert as AlertTriangle, Plane, Calculator, CircleCheck as CheckCircle } from 'lucide-react';
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

const PATHWAY_CONTEXT: Record<string, {
  leadsTo: string;
  workRights: string;
  familyRights: string;
  permanenceNote: string;
}> = {
  Work: {
    leadsTo: 'Temporary residence. Many work permit routes can lead to permanent residence after a qualifying period of continuous employment and legal stay.',
    workRights: 'Employment is typically authorized under the specific work permit. Rights may be tied to a specific employer, role, or sector depending on the permit type.',
    familyRights: 'Dependent family members (spouse and minor children) can typically apply alongside the principal applicant on most work permit routes.',
    permanenceNote: 'Permanent residence eligibility usually requires 2–5 years of continuous legal residence on a valid work permit, depending on the specific country and program.',
  },
  'Digital Nomad': {
    leadsTo: 'Temporary stay only in most countries. Digital nomad visas are generally not designed as a pathway to permanent residence.',
    workRights: 'Authorized for remote work providing services to clients or employers outside the host country. Local employment is not typically permitted under a digital nomad visa.',
    familyRights: 'Some digital nomad programs allow dependents to accompany the principal applicant. Check country-specific rules, as dependent work rights vary.',
    permanenceNote: 'Most digital nomad visas do not count toward permanent residence qualifying periods. If long-term settlement is the goal, a separate immigration route may be required.',
  },
  Study: {
    leadsTo: 'Temporary stay for the duration of enrollment. Many countries offer post-study work permits that can serve as a bridge to employment-based residence.',
    workRights: 'Part-time work during studies is permitted in many countries, typically subject to weekly hour limits. Full-time work authorization may be available during scheduled breaks.',
    familyRights: 'Dependent rights on student visas vary. Some countries allow spouses to accompany students; others do not. Work rights for dependents are often restricted.',
    permanenceNote: 'Permanent residence via the study route typically requires completing a post-study work period and transitioning to a work permit, followed by the standard qualifying period.',
  },
  Retirement: {
    leadsTo: 'Temporary residence, typically renewable. Retirement visas do not automatically lead to permanent residence in most countries.',
    workRights: 'Local employment is generally not permitted under retirement and passive income visa programs. Applicants must demonstrate sufficient income from pensions or savings.',
    familyRights: 'Spouses and dependents can often accompany the principal applicant on retirement visa programs. Dependent work rights vary by country.',
    permanenceNote: 'Some countries allow retirement visa holders to apply for permanent residence after a long qualifying period. Check country-specific rules — this is not universally available.',
  },
  Investor: {
    leadsTo: 'Temporary residence initially, with clear pathways to permanent residence or citizenship in many investor and golden visa programs.',
    workRights: 'Investor visa holders can typically operate their investment business. General employment rights vary by program type.',
    familyRights: 'Most investor visa programs include provisions for the principal applicant\'s spouse and minor children to obtain dependent residence permits.',
    permanenceNote: 'Many investor programs offer accelerated routes to permanent residence. The qualifying investment amount, period, and conditions vary significantly by country.',
  },
  Family: {
    leadsTo: 'Temporary residence initially. Family reunification and dependent permits often lead to independent permanent residence after a qualifying period.',
    workRights: 'Work authorization on family reunification permits varies by country and visa type. Many countries allow spouses and partners to work freely after a qualifying period.',
    familyRights: 'This is the primary category covering family-based immigration, including spouse visas, partner visas, dependent child permits, and other family reunification routes.',
    permanenceNote: 'Family route permits frequently convert to permanent residence after 2–5 years. The qualifying period and conditions depend on the specific family relationship and country rules.',
  },
  Residency: {
    leadsTo: 'Long-term or permanent residence. Residency programs are specifically designed to grant extended or permanent settlement rights.',
    workRights: 'Permanent and long-term residence permits generally include full work authorization rights without employer restriction.',
    familyRights: 'Permanent residents can typically sponsor family members for reunification through family immigration routes.',
    permanenceNote: 'Permanent residence grants indefinite stay rights without the need for regular renewal. After a qualifying period of permanent residence, citizenship may become available.',
  },
};

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
  const context = PATHWAY_CONTEXT[pathwayType.type] || null;

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-gradient-to-br from-gray-900 to-gray-700 text-white py-16">
        <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
          <div className="flex items-center space-x-2 text-gray-300 mb-4 text-sm">
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
          <p className="text-xl text-gray-200 max-w-3xl">
            Eligibility, requirements, and application process for {pathwayType.type.toLowerCase()} immigration to {countryName}.
          </p>
        </div>
      </div>

      <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 py-12">
        {usingStarter && (
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-8 flex items-start space-x-3">
            <Info className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
            <div>
              <p className="text-sm text-blue-900">
                <strong>General reference content:</strong> This page shows informational template data. Verify specific requirements and current pathway availability with the official immigration authority of {countryName}.
              </p>
            </div>
          </div>
        )}

        {qualityMetrics && !qualityMetrics.is_indexable && (
          <div className="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-8 flex items-start space-x-3">
            <AlertTriangle className="h-5 w-5 text-amber-600 flex-shrink-0 mt-0.5" />
            <div className="flex-1">
              <p className="text-sm text-amber-900 font-semibold mb-1">
                Limited detail available
              </p>
              <p className="text-sm text-amber-800">
                This page currently covers basic pathway information. Always verify with official government sources and consider consulting a licensed immigration professional for {countryName}.
              </p>
            </div>
          </div>
        )}

        <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">
            What is the {pathwayType.type} Route in {countryName}?
          </h2>
          <p className="text-gray-700 leading-relaxed mb-4">
            {pathwayType.description} in {countryName}. Requirements, eligibility criteria, and application processes vary by your specific circumstances, nationality, and the category of permit you are seeking.
          </p>

          {context && (
            <div className="grid md:grid-cols-2 gap-6 mt-6 pt-6 border-t border-gray-100">
              <div>
                <div className="flex items-center gap-2 mb-2">
                  <CheckCircle className="h-4 w-4 text-green-600 flex-shrink-0" />
                  <h3 className="text-sm font-semibold text-gray-900">Settlement outcome</h3>
                </div>
                <p className="text-sm text-gray-600 leading-relaxed">{context.leadsTo}</p>
              </div>
              <div>
                <div className="flex items-center gap-2 mb-2">
                  <CheckCircle className="h-4 w-4 text-blue-600 flex-shrink-0" />
                  <h3 className="text-sm font-semibold text-gray-900">Work authorization</h3>
                </div>
                <p className="text-sm text-gray-600 leading-relaxed">{context.workRights}</p>
              </div>
              <div>
                <div className="flex items-center gap-2 mb-2">
                  <CheckCircle className="h-4 w-4 text-blue-600 flex-shrink-0" />
                  <h3 className="text-sm font-semibold text-gray-900">Family inclusion</h3>
                </div>
                <p className="text-sm text-gray-600 leading-relaxed">{context.familyRights}</p>
              </div>
              <div>
                <div className="flex items-center gap-2 mb-2">
                  <CheckCircle className="h-4 w-4 text-amber-600 flex-shrink-0" />
                  <h3 className="text-sm font-semibold text-gray-900">Permanent residence</h3>
                </div>
                <p className="text-sm text-gray-600 leading-relaxed">{context.permanenceNote}</p>
              </div>
            </div>
          )}
        </div>

        <VisaEntryNotice countryName={countryName} variantIndex={1} />

        {pathwaysData.length > 0 ? (
          <div className="space-y-6 mb-8">
            <h2 className="text-2xl font-bold text-gray-900">
              Available {pathwayType.type} Pathways in {countryName}
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
                    <span className="px-3 py-1 text-xs font-medium rounded-full bg-blue-100 text-blue-800 flex-shrink-0 ml-3">
                      General reference
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
                      Permit Validity
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
                      className="inline-flex items-center text-sm text-brand-primary hover:text-blue-700 font-medium"
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
              Pathway Detail Pending
            </h3>
            <p className="text-gray-600">
              Specific pathway information for {pathwayType.type.toLowerCase()} immigration to {countryName} is being compiled. In the meantime, use the Path Finder to explore related options or visit the full immigration hub for {countryName}.
            </p>
            <Link
              href={`/immigrate-to/${countrySlug}`}
              className="inline-flex items-center mt-4 text-sm font-medium text-brand-primary hover:text-blue-700"
            >
              View all pathways to {countryName}
              <ArrowRight className="h-4 w-4 ml-2" />
            </Link>
          </div>
        )}

        {enrichedContent && enrichedContent.contentSections.length > 0 && (
          <div className="space-y-6 mb-8">
            {enrichedContent.contentSections.map((section) => (
              <div key={section.id} className="bg-white rounded-lg border border-gray-200 p-8">
                <h2 className="text-2xl font-bold text-gray-900 mb-4">{section.title}</h2>
                <div className="prose prose-gray max-w-none text-gray-700 leading-relaxed whitespace-pre-line">
                  {section.content}
                </div>
              </div>
            ))}
          </div>
        )}

        {enrichedContent && enrichedContent.costBreakdown.length > 0 && (
          <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-2">Typical Cost Breakdown</h2>
            <p className="text-sm text-gray-500 mb-6">Indicative costs for the {pathwayType.type} route in {countryName}. Actual amounts vary and should be verified with official sources.</p>
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
            <p className="text-xs text-gray-500 mt-4">
              For a full cost estimate including proof-of-funds requirements, use the{' '}
              <Link href={`/immigration-cost-calculator`} className="text-brand-primary hover:underline">
                Immigration Cost Calculator
              </Link>.
            </p>
          </div>
        )}

        {enrichedContent && enrichedContent.faqs.length > 0 && (
          <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">Frequently Asked Questions</h2>
            <div className="space-y-6">
              {enrichedContent.faqs.map((faq) => (
                <div key={faq.id} className="border-l-4 border-brand-primary pl-4">
                  <h3 className="font-semibold text-gray-900 mb-2">{faq.question}</h3>
                  <p className="text-gray-700 leading-relaxed">{faq.answer}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        {(!enrichedContent || enrichedContent.faqs.length === 0) && context && (
          <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">
              Common Questions: {pathwayType.type} Immigration to {countryName}
            </h2>
            <div className="space-y-6">
              {[
                {
                  q: `Does the ${pathwayType.type.toLowerCase()} route in ${countryName} lead to permanent residence?`,
                  a: context.permanenceNote,
                },
                {
                  q: `Can I work in ${countryName} on a ${pathwayType.type.toLowerCase()} visa or permit?`,
                  a: context.workRights,
                },
                {
                  q: `Can my family members come with me on the ${pathwayType.type.toLowerCase()} route?`,
                  a: context.familyRights,
                },
                {
                  q: `What documents are typically required for the ${pathwayType.type.toLowerCase()} route in ${countryName}?`,
                  a: `Most ${pathwayType.type.toLowerCase()} applications to ${countryName} require a valid passport, proof of the basis of application (employment contract, enrollment confirmation, proof of income, or investment documentation depending on route type), bank statements demonstrating financial sufficiency, medical examination results, and police clearance certificates. Document requirements depend on your specific circumstances and nationality. Translations and notarizations of foreign-language documents are typically required.`,
                },
                {
                  q: `How long does the ${pathwayType.type.toLowerCase()} application process take for ${countryName}?`,
                  a: `Processing times for ${pathwayType.type.toLowerCase()} applications to ${countryName} vary depending on the specific permit category, application volume, and completeness of your submission. Review the processing time field on the pathway cards above for indicative timelines. Always check current processing times directly with the official immigration authority, as these may change without notice.`,
                },
              ].map((faq, i) => (
                <div key={i} className="border-l-4 border-brand-primary pl-4">
                  <h3 className="font-semibold text-gray-900 mb-2">{faq.q}</h3>
                  <p className="text-gray-700 leading-relaxed">{faq.a}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        {enrichedContent && enrichedContent.caseStudies.length > 0 && (
          <div className="space-y-6 mb-8">
            <h2 className="text-2xl font-bold text-gray-900">Real-World Examples</h2>
            {enrichedContent.caseStudies.map((study) => (
              <div key={study.id} className="bg-gray-50 rounded-lg border border-gray-200 p-6">
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
                  <summary className="cursor-pointer font-medium text-brand-primary hover:text-blue-700">
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
              Entry Visa Requirements
            </h3>
            <p className="text-sm text-gray-600 mb-4">
              Check whether you need a tourist or short-stay visa to enter {countryName} before starting an immigration application. Entry authorization is separate from a long-term residence permit.
            </p>
            <a
              href="https://www.visainfoguide.com"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center text-sm font-medium text-brand-primary hover:text-blue-700"
            >
              Check entry requirements on VisaInfoGuide.com
              <ExternalLink className="h-3.5 w-3.5 ml-1.5" />
            </a>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6">
            <h3 className="font-semibold text-gray-900 mb-3 flex items-center">
              <Calculator className="h-5 w-5 mr-2 text-brand-primary" />
              Estimate Your Costs
            </h3>
            <p className="text-sm text-gray-600 mb-4">
              Calculate total immigration costs for the {pathwayType.type.toLowerCase()} route in {countryName} including visa fees, medical requirements, and proof-of-funds thresholds.
            </p>
            <Link
              href={`/immigration-cost/${countrySlug}`}
              className="inline-flex items-center text-sm font-medium text-brand-primary hover:text-blue-700"
            >
              View cost breakdown for {countryName}
              <ArrowRight className="h-4 w-4 ml-2" />
            </Link>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6">
            <h3 className="font-semibold text-gray-900 mb-3 flex items-center">
              <Plane className="h-5 w-5 mr-2 text-brand-primary" />
              Long-Haul Travel Planning
            </h3>
            <p className="text-sm text-gray-600 mb-4">
              Moving to {countryName} often involves long international flights with one or more connections. Find airside hotels and transit rest options for layovers along the way.
            </p>
            <a
              href="https://www.restinairport.com"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center text-sm font-medium text-brand-primary hover:text-blue-700"
            >
              Find airport transit hotels at RestInAirport.com
              <ExternalLink className="h-3.5 w-3.5 ml-1.5" />
            </a>
          </div>
        </div>

        <div className="bg-gray-50 rounded-lg border border-gray-200 p-6 mb-8">
          <h3 className="font-semibold text-gray-900 mb-3">Also Consider</h3>
          <p className="text-sm text-gray-700 mb-4">
            Before committing to the {pathwayType.type.toLowerCase()} route, review all available immigration options for {countryName} to ensure this is the most appropriate pathway for your goals and eligibility profile.
          </p>
          <div className="flex flex-wrap gap-4 text-sm">
            <Link href={`/immigrate-to/${countrySlug}`} className="text-brand-primary hover:underline font-medium">
              All immigration pathways to {countryName}
            </Link>
            <Link href={`/country/${countrySlug}`} className="text-brand-primary hover:underline font-medium">
              {countryName} settlement and living guide
            </Link>
            <Link href="/path-finder" className="text-brand-primary hover:underline font-medium">
              Run the Immigration Path Finder
            </Link>
          </div>
        </div>

        <div className="bg-brand-primary rounded-lg p-8 text-center text-white mb-8">
          <h3 className="text-xl font-bold mb-3">
            Not Sure This Is the Right Route?
          </h3>
          <p className="text-blue-100 mb-6 max-w-2xl mx-auto">
            Use the Immigration Path Finder to compare available routes based on your passport, destination, and immigration goals. It takes under two minutes.
          </p>
          <Link
            href="/path-finder"
            className="inline-flex items-center px-6 py-3 bg-white text-brand-primary font-semibold rounded-md hover:bg-gray-100 transition-colors"
          >
            Run the Path Finder
            <ArrowRight className="h-5 w-5 ml-2" />
          </Link>
        </div>

        <RelatedLinksSection groups={relatedLinksGroups} />
      </div>
    </div>
  );
}
