import { Metadata } from 'next';
import Link from 'next/link';

export const metadata: Metadata = {
  title: 'Methodology - ImmigrationInfoGuide.com',
  description: 'Learn about our research methodology and how we compile immigration information for ImmigrationInfoGuide.com.',
  openGraph: {
    title: 'Our Research Methodology | ImmigrationInfoGuide.com',
    description: 'How we research and verify immigration data. Our methodology for collecting, fact-checking, and updating pathway information for 52+ countries.',
    type: 'website',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Our Research Methodology | ImmigrationInfoGuide.com',
    description: 'How we research and verify immigration data. Our methodology for collecting, fact-checking, and updating pathway information for 52+ countries.',
    images: ['/og-image.webp'],
  },
};

export default function MethodologyPage() {
  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-6">
          Our Methodology
        </h1>

        <div className="prose prose-gray max-w-none">
          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              How We Research Immigration Information
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              ImmigrationInfoGuide.com compiles immigration pathway information through a systematic research process focused on accuracy, clarity, and currency. Our methodology prioritizes official government sources while presenting information in an accessible format for international movers.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Research Process
            </h2>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              1. Primary Source Verification
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              We begin all research by consulting official government sources:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>National immigration department websites and official portals</li>
              <li>Published immigration regulations and statutory instruments</li>
              <li>Government policy announcements and press releases</li>
              <li>Official visa and permit application guidelines</li>
              <li>Embassy and consulate resources</li>
            </ul>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              2. Cross-Referencing and Validation
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              To ensure accuracy, we cross-reference information from multiple authoritative sources:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Comparing requirements across official government channels</li>
              <li>Reviewing legal databases and immigration law publications</li>
              <li>Consulting professional immigration lawyer associations</li>
              <li>Verifying application procedures and processing times</li>
              <li>Confirming fee structures and documentation requirements</li>
            </ul>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              3. Standardized Documentation
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              We structure immigration pathway information using consistent categories:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li><strong>Pathway Overview:</strong> Purpose and target applicant profile</li>
              <li><strong>Eligibility Requirements:</strong> Qualifications, experience, age, language, education</li>
              <li><strong>Application Process:</strong> Steps, documentation, timelines</li>
              <li><strong>Costs:</strong> Government fees, required investments, associated expenses</li>
              <li><strong>Duration and Rights:</strong> Initial validity period, renewal options, work/study rights</li>
              <li><strong>Path to Permanence:</strong> Options for permanent residence or citizenship</li>
            </ul>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              4. Regular Updates
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              Immigration policies change frequently. We maintain currency through:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Monitoring government immigration websites for policy changes</li>
              <li>Subscribing to official newsletters and announcements</li>
              <li>Reviewing legal updates from immigration law associations</li>
              <li>Periodic comprehensive reviews of all country guides</li>
              <li>Responding to user reports of outdated information</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Country Coverage Criteria
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We focus on countries that meet one or more of these criteria:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Popular immigration destinations with established pathways</li>
              <li>Countries offering specialized programs (digital nomad, retirement, investor visas)</li>
              <li>Major economic centers attracting skilled workers</li>
              <li>Countries with English-language immigration services or well-documented processes</li>
              <li>Destinations frequently searched by international movers</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Pathway Inclusion Standards
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We include immigration pathways that are:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li><strong>Officially Active:</strong> Currently accepting applications through government channels</li>
              <li><strong>Well-Documented:</strong> Have clear, publicly available requirements and procedures</li>
              <li><strong>Accessible:</strong> Open to international applicants (not limited to bilateral agreements)</li>
              <li><strong>Long-Term Focused:</strong> Lead to stays of 6+ months or offer paths to permanent residence</li>
            </ul>
            <p className="text-gray-700 leading-relaxed mb-4">
              We generally exclude short-term tourist visas, temporary visit permits under 6 months, and programs no longer accepting new applications.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Limitations and Disclaimers
            </h2>
            <div className="bg-amber-50 border-l-4 border-amber-500 p-4 mb-4">
              <p className="text-gray-800 font-semibold mb-2">
                Immigration Laws Are Complex
              </p>
              <p className="text-gray-700 text-sm mb-2">
                Immigration regulations involve nuanced legal requirements that can vary based on individual circumstances. Our guides provide general overviews but cannot capture every exception, special case, or recent micro-change.
              </p>
            </div>
            <div className="bg-blue-50 border-l-4 border-blue-500 p-4 mb-4">
              <p className="text-gray-800 font-semibold mb-2">
                Frequent Policy Changes
              </p>
              <p className="text-gray-700 text-sm mb-2">
                Governments regularly update immigration policies, fees, quotas, and requirements. While we work to keep information current, there may be a lag between official changes and updates to our site.
              </p>
            </div>
            <div className="bg-red-50 border-l-4 border-red-500 p-4 mb-4">
              <p className="text-gray-800 font-semibold mb-2">
                Always Verify with Official Sources
              </p>
              <p className="text-gray-700 text-sm mb-2">
                Before making immigration decisions or submitting applications, always verify requirements and procedures directly with the relevant government immigration authority or consult a licensed immigration attorney.
              </p>
            </div>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Reporting Errors or Outdated Information
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              If you notice incorrect or outdated information, please let us know. We take accuracy seriously and will investigate and update content as needed.
            </p>
            <p className="text-gray-700 leading-relaxed">
              Contact us at:{' '}
              <a
                href="mailto:contact@visainfoguide.com"
                className="text-brand-primary hover:text-indigo-700 underline"
              >
                contact@visainfoguide.com
              </a>
            </p>
          </section>

          <section className="mb-8 bg-gray-50 p-6 rounded-lg">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">
              Related Pages
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <Link
                href="/data-sources"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                Data Sources
              </Link>
              <Link
                href="/about"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                About Us
              </Link>
              <Link
                href="/privacy-policy"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                Privacy Policy
              </Link>
              <Link
                href="/terms-of-use"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                Terms of Use
              </Link>
            </div>
          </section>
        </div>
      </div>
    </div>
  );
}
