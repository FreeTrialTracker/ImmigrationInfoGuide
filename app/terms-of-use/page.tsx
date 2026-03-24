import { Metadata } from 'next';
import Link from 'next/link';

export const metadata: Metadata = {
  title: 'Terms of Use - ImmigrationInfoGuide.com',
  description: 'Terms of Use for ImmigrationInfoGuide.com. Read our terms and conditions for using our immigration information resources.',
};

export default function TermsOfUsePage() {
  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-6">
          Terms of Use
        </h1>

        <p className="text-sm text-gray-600 mb-8">
          Last Updated: February 28, 2026
        </p>

        <div className="prose prose-gray max-w-none">
          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Agreement to Terms
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              By accessing and using ImmigrationInfoGuide.com ("the Site"), you accept and agree to be bound by these Terms of Use. If you do not agree to these terms, please do not use this Site.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Nature of Information Provided
            </h2>

            <div className="bg-amber-50 border-l-4 border-amber-500 p-4 mb-6">
              <p className="text-gray-800 font-semibold mb-2">
                Educational and Informational Purposes Only
              </p>
              <p className="text-gray-700 text-sm mb-2">
                ImmigrationInfoGuide.com provides general educational information about immigration pathways, visa options, and relocation considerations. This information is for informational purposes only and does not constitute legal, financial, or professional advice.
              </p>
            </div>

            <div className="bg-red-50 border-l-4 border-red-500 p-4 mb-6">
              <p className="text-gray-800 font-semibold mb-2">
                Not Legal Advice
              </p>
              <p className="text-gray-700 text-sm mb-2">
                We are not a law firm and do not provide legal advice. Immigration law is complex and varies by jurisdiction. The information on this Site should not be used as a substitute for competent legal advice from a licensed immigration attorney in the relevant jurisdiction.
              </p>
            </div>

            <div className="bg-blue-50 border-l-4 border-blue-500 p-4 mb-6">
              <p className="text-gray-800 font-semibold mb-2">
                Not Affiliated with Government Agencies
              </p>
              <p className="text-gray-700 text-sm mb-2">
                ImmigrationInfoGuide.com is an independent information resource. We are not affiliated with, endorsed by, or connected to any government, immigration department, embassy, consulate, or official visa processing agency.
              </p>
            </div>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              No Guarantees or Warranties
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              While we strive to provide accurate and up-to-date information:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Immigration laws and policies change frequently and without notice</li>
              <li>There may be delays in updating information on this Site after policy changes</li>
              <li>Individual immigration cases involve unique circumstances not addressed in general guides</li>
              <li>We make no guarantees about the accuracy, completeness, or current status of information</li>
              <li>We provide no warranties, express or implied, regarding the information on this Site</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              User Responsibilities
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              When using ImmigrationInfoGuide.com, you agree to:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li><strong>Verify Information:</strong> Always verify immigration requirements with official government sources and licensed immigration professionals before making decisions</li>
              <li><strong>Seek Professional Advice:</strong> Consult with licensed immigration attorneys for legal advice specific to your circumstances</li>
              <li><strong>Check Official Sources:</strong> Use the official government links provided in our guides to confirm current requirements and procedures</li>
              <li><strong>Act Responsibly:</strong> Make immigration decisions based on professional legal counsel, not solely on information from this Site</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Limitation of Liability
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              To the fullest extent permitted by law:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>ImmigrationInfoGuide.com and its operators shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising from your use of this Site</li>
              <li>We are not responsible for decisions made based on information from this Site</li>
              <li>We are not liable for visa denials, application rejections, immigration problems, financial losses, or any other damages related to use of information from this Site</li>
              <li>You use this Site entirely at your own risk</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Third-Party Links and Resources
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              This Site contains links to official government websites and other external resources. We:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Do not control and are not responsible for the content of external sites</li>
              <li>Do not endorse or make representations about third-party websites</li>
              <li>Are not liable for any harm or damages related to the use of external websites</li>
              <li>Encourage you to review the terms and privacy policies of any third-party sites you visit</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Intellectual Property
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              The content on ImmigrationInfoGuide.com, including text, graphics, logos, and layout, is protected by intellectual property laws and is owned by or licensed to us.
            </p>
            <p className="text-gray-700 leading-relaxed mb-4">
              You may view, download, and print pages from this Site for personal, non-commercial use only. You may not:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Reproduce, republish, or redistribute content without permission</li>
              <li>Use content for commercial purposes</li>
              <li>Remove copyright or proprietary notices</li>
              <li>Scrape, crawl, or systematically extract data from the Site</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              User Conduct
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              You agree not to:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Use the Site for any unlawful purpose or in violation of these Terms</li>
              <li>Attempt to gain unauthorized access to the Site or its systems</li>
              <li>Interfere with or disrupt the Site's operation</li>
              <li>Transmit viruses, malware, or other harmful code</li>
              <li>Impersonate any person or entity or misrepresent your affiliation</li>
              <li>Collect or harvest information about users without consent</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Disclaimer of Immigration Success
            </h2>
            <div className="bg-amber-50 border-l-4 border-amber-500 p-4 mb-4">
              <p className="text-gray-700 text-sm">
                <strong>Important:</strong> Reading information on this Site or using our Path Finder tool does not guarantee visa approval, immigration success, or eligibility for any immigration program. Immigration decisions are made solely by government immigration authorities based on their assessment of your individual application and circumstances.
              </p>
            </div>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Changes to Terms
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We reserve the right to modify these Terms of Use at any time. Changes will be posted on this page with an updated "Last Updated" date. Your continued use of the Site after changes constitutes acceptance of the modified terms.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Changes to Site Content
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We reserve the right to:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Modify, suspend, or discontinue any part of the Site at any time</li>
              <li>Update, remove, or change content without notice</li>
              <li>Limit access to certain features or sections</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Governing Law
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              These Terms shall be governed by and construed in accordance with applicable laws, without regard to conflict of law principles. Any disputes arising from these Terms or use of the Site shall be resolved in the appropriate courts.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Severability
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              If any provision of these Terms is found to be unenforceable or invalid, that provision shall be limited or eliminated to the minimum extent necessary, and the remaining provisions shall remain in full force and effect.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Contact Information
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              If you have questions about these Terms of Use, please contact us:
            </p>
            <p className="text-gray-700 leading-relaxed">
              Email:{' '}
              <a
                href="mailto:contact@visainfoguide.com"
                className="text-brand-primary hover:text-indigo-700 underline"
              >
                contact@visainfoguide.com
              </a>
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Acknowledgment
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              By using ImmigrationInfoGuide.com, you acknowledge that:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>You have read and understood these Terms of Use</li>
              <li>You agree to be bound by these Terms</li>
              <li>You understand this Site provides information only, not legal advice</li>
              <li>You will verify all information with official sources and seek professional legal counsel for immigration decisions</li>
            </ul>
          </section>

          <section className="mb-8 bg-gray-50 p-6 rounded-lg">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">
              Related Pages
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <Link
                href="/privacy-policy"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                Privacy Policy
              </Link>
              <Link
                href="/about"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                About Us
              </Link>
              <Link
                href="/methodology"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                Our Methodology
              </Link>
              <Link
                href="/data-sources"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                Data Sources
              </Link>
            </div>
          </section>
        </div>
      </div>
    </div>
  );
}
