import { Metadata } from 'next';
import Link from 'next/link';

export const metadata: Metadata = {
  title: 'Data Sources - ImmigrationInfoGuide.com',
  description: 'Official government sources and references used by ImmigrationInfoGuide.com to compile immigration pathway information.',
  openGraph: {
    title: 'Data Sources & References | ImmigrationInfoGuide.com',
    description: 'Official government sources and research references used to compile immigration pathway data for 52+ countries.',
    type: 'website',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Data Sources & References | ImmigrationInfoGuide.com',
    description: 'Official government sources and research references used to compile immigration pathway data for 52+ countries.',
    images: ['/og-image.webp'],
  },
};

export default function DataSourcesPage() {
  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-6">
          Data Sources
        </h1>

        <div className="prose prose-gray max-w-none">
          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Official Sources
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              ImmigrationInfoGuide.com compiles information exclusively from authoritative, official sources. We prioritize government immigration departments, official visa portals, published regulations, and verified policy announcements.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Primary Data Sources
            </h2>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              1. National Immigration Authorities
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              We collect immigration pathway information directly from each country's official immigration department or ministry:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Official immigration department websites and portals</li>
              <li>Published visa and permit requirement documents</li>
              <li>Government application guidelines and forms</li>
              <li>Official fee schedules and processing time estimates</li>
              <li>Policy announcements and regulatory updates</li>
            </ul>
            <p className="text-gray-700 leading-relaxed mb-4">
              Each country guide on our site includes direct links to these official resources under "Official Resources."
            </p>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              2. Government Legislation and Regulations
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              For detailed requirements, we consult:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Published immigration acts and statutory instruments</li>
              <li>Official gazettes and legal notices</li>
              <li>Ministerial orders and policy directives</li>
              <li>Government regulation databases</li>
            </ul>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              3. Embassy and Consulate Resources
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              We verify visa requirements and application procedures through:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Embassy and consulate official websites</li>
              <li>Consular guidance documents and notices</li>
              <li>Official visa application center information</li>
            </ul>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              4. International Organizations
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              For context and comparative data, we reference:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>International Organization for Migration (IOM)</li>
              <li>United Nations Department of Economic and Social Affairs (UNDESA)</li>
              <li>OECD Migration Statistics</li>
              <li>World Bank Global Bilateral Migration Database</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Secondary Research Sources
            </h2>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              Legal and Professional Resources
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              To understand practical application of regulations and recent changes:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Immigration lawyer association publications and alerts</li>
              <li>Legal databases covering immigration law</li>
              <li>Government-published guidance notes for practitioners</li>
              <li>Official case law databases (where relevant)</li>
            </ul>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              News and Policy Monitoring
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              To stay current with policy changes:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Official government press releases and media statements</li>
              <li>Immigration department newsletters and bulletins</li>
              <li>Parliamentary debates and committee reports (public record)</li>
              <li>Specialized immigration news services and publications</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Country-Specific Source Examples
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              Here are examples of primary sources we use for major destinations:
            </p>

            <div className="bg-gray-50 rounded-lg p-6 mb-4">
              <h4 className="font-semibold text-gray-900 mb-3">United States</h4>
              <ul className="list-disc pl-6 space-y-1 text-gray-700 text-sm">
                <li>U.S. Citizenship and Immigration Services (USCIS)</li>
                <li>U.S. Department of State - Bureau of Consular Affairs</li>
                <li>Code of Federal Regulations (CFR) Title 8</li>
                <li>USCIS Policy Manual</li>
              </ul>
            </div>

            <div className="bg-gray-50 rounded-lg p-6 mb-4">
              <h4 className="font-semibold text-gray-900 mb-3">Canada</h4>
              <ul className="list-disc pl-6 space-y-1 text-gray-700 text-sm">
                <li>Immigration, Refugees and Citizenship Canada (IRCC)</li>
                <li>Immigration and Refugee Protection Act (IRPA)</li>
                <li>Immigration and Refugee Protection Regulations (IRPR)</li>
                <li>IRCC Program Delivery Instructions</li>
              </ul>
            </div>

            <div className="bg-gray-50 rounded-lg p-6 mb-4">
              <h4 className="font-semibold text-gray-900 mb-3">United Kingdom</h4>
              <ul className="list-disc pl-6 space-y-1 text-gray-700 text-sm">
                <li>UK Visas and Immigration (UKVI)</li>
                <li>Immigration Rules (HC 395)</li>
                <li>Immigration Directorate Instructions</li>
                <li>Gov.uk official guidance</li>
              </ul>
            </div>

            <div className="bg-gray-50 rounded-lg p-6 mb-4">
              <h4 className="font-semibold text-gray-900 mb-3">Australia</h4>
              <ul className="list-disc pl-6 space-y-1 text-gray-700 text-sm">
                <li>Department of Home Affairs</li>
                <li>Migration Act 1958 and Regulations 1994</li>
                <li>Legislative Instruments and Policy Advice Manual (PAM)</li>
                <li>SkillSelect and official visa guides</li>
              </ul>
            </div>

            <div className="bg-gray-50 rounded-lg p-6 mb-4">
              <h4 className="font-semibold text-gray-900 mb-3">European Union Countries</h4>
              <ul className="list-disc pl-6 space-y-1 text-gray-700 text-sm">
                <li>National immigration ministry websites</li>
                <li>EU Blue Card Directive (2021/1883)</li>
                <li>Schengen Visa Code regulations</li>
                <li>National implementing legislation</li>
              </ul>
            </div>

            <p className="text-gray-700 leading-relaxed mb-4 mt-6">
              Each country guide includes direct links to these sources in the "Official Resources" section.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              What We Don't Use
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              To maintain accuracy and reliability, we avoid:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Unverified social media posts or forums</li>
              <li>Anonymous or unattributed sources</li>
              <li>Commercial visa agencies as primary sources (though we may verify their cited regulations)</li>
              <li>Wikipedia or user-generated content platforms</li>
              <li>Outdated print publications without verification against current law</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Verification and Quality Control
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              Before publishing immigration pathway information:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>We cross-reference requirements across multiple official channels</li>
              <li>We verify that programs are currently active and accepting applications</li>
              <li>We link directly to official government sources for user verification</li>
              <li>We note the last verification date for each country guide</li>
              <li>We regularly review and update information based on policy changes</li>
            </ul>
          </section>

          <section className="mb-8">
            <div className="bg-blue-50 border-l-4 border-blue-500 p-4 mb-4">
              <p className="text-gray-800 font-semibold mb-2">
                Always Verify with Official Sources
              </p>
              <p className="text-gray-700 text-sm">
                While we strive for accuracy, immigration laws change frequently. Always verify requirements directly with the relevant government immigration authority or consult a licensed immigration attorney before making decisions or submitting applications.
              </p>
            </div>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Suggesting Additional Sources
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              If you are aware of official government sources we should include in our research, please contact us:
            </p>
            <p className="text-gray-700 leading-relaxed">
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
                href="/methodology"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                Our Methodology
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
