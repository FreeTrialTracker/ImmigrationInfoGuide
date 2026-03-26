import { TriangleAlert as AlertTriangle } from 'lucide-react';

export const metadata = {
  title: 'Legal Disclaimer - ImmigrationInfoGuide.com',
  description: 'Legal disclaimer for ImmigrationInfoGuide.com. All immigration information is provided for general guidance only and does not constitute legal advice. Verify all details with official government sources.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/legal',
  },
  openGraph: {
    title: 'Legal Disclaimer - ImmigrationInfoGuide.com',
    description: 'Legal disclaimer for ImmigrationInfoGuide.com. All immigration information is provided for general guidance only and does not constitute legal advice.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/legal',
  },
};

export default function LegalPage() {
  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="bg-amber-50 border border-amber-200 rounded-lg p-6 mb-8">
          <div className="flex items-start space-x-3">
            <AlertTriangle className="h-6 w-6 text-amber-600 mt-0.5" />
            <div>
              <h1 className="text-2xl font-bold text-gray-900 mb-2">
                Legal Disclaimer
              </h1>
              <p className="text-gray-700">
                Please read this disclaimer carefully before using ImmigrationInfoGuide.com
              </p>
            </div>
          </div>
        </div>

        <div className="prose prose-gray max-w-none">
          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-3">
              Informational Purposes Only
            </h2>
            <p className="text-gray-700 mb-4">
              ImmigrationInfoGuide.com provides general information about immigration pathways,
              visa requirements, and relocation options. This information is for educational
              and informational purposes only and should not be construed as legal advice.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-3">
              Not Legal Advice
            </h2>
            <p className="text-gray-700 mb-4">
              The content on this website does not constitute legal advice and should not be
              relied upon as such. Immigration laws and regulations are complex, subject to
              change, and vary significantly by country and individual circumstances.
            </p>
            <p className="text-gray-700 mb-4">
              We strongly recommend consulting with a qualified immigration attorney or
              registered immigration consultant before making any decisions or taking any
              actions related to immigration matters.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-3">
              No Guarantee of Accuracy
            </h2>
            <p className="text-gray-700 mb-4">
              While we strive to provide accurate and up-to-date information, we make no
              representations or warranties of any kind, express or implied, about the
              completeness, accuracy, reliability, or suitability of the information
              contained on this website.
            </p>
            <p className="text-gray-700 mb-4">
              Immigration policies and requirements can change frequently. Always verify
              information with official government sources and qualified professionals.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-3">
              User Responsibility
            </h2>
            <p className="text-gray-700 mb-4">
              You are solely responsible for verifying any information obtained from this
              website and for ensuring that you comply with all applicable laws and
              regulations. Any reliance you place on information from this website is
              strictly at your own risk.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-3">
              External Links
            </h2>
            <p className="text-gray-700 mb-4">
              This website may contain links to external websites that are not provided or
              maintained by us. We do not guarantee the accuracy, relevance, timeliness, or
              completeness of any information on these external websites.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-3">
              Seek Professional Advice
            </h2>
            <p className="text-gray-700 mb-4">
              For personalized advice regarding your specific immigration situation, please
              consult with:
            </p>
            <ul className="list-disc list-inside text-gray-700 space-y-2 mb-4">
              <li>Licensed immigration attorneys</li>
              <li>Registered immigration consultants</li>
              <li>Official government immigration offices</li>
              <li>Accredited immigration advisors</li>
            </ul>
          </section>

          <section className="bg-gray-50 rounded-lg p-6 border border-gray-200">
            <h2 className="text-xl font-semibold text-gray-900 mb-3">
              Questions or Concerns?
            </h2>
            <p className="text-gray-700">
              If you have any questions about this disclaimer or the information provided
              on this website, please consult with a qualified immigration professional
              before proceeding with any immigration applications or decisions.
            </p>
          </section>
        </div>
      </div>
    </div>
  );
}
