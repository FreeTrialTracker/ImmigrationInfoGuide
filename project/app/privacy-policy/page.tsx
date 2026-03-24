import { Metadata } from 'next';
import Link from 'next/link';

export const metadata: Metadata = {
  title: 'Privacy Policy - ImmigrationInfoGuide.com',
  description: 'Privacy Policy for ImmigrationInfoGuide.com. Learn how we handle your information and protect your privacy.',
};

export default function PrivacyPolicyPage() {
  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-6">
          Privacy Policy
        </h1>

        <p className="text-sm text-gray-600 mb-8">
          Last Updated: February 28, 2026
        </p>

        <div className="prose prose-gray max-w-none">
          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Introduction
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              ImmigrationInfoGuide.com ("we," "us," or "our") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and safeguard information when you visit our website.
            </p>
            <p className="text-gray-700 leading-relaxed mb-4">
              By using ImmigrationInfoGuide.com, you agree to the collection and use of information in accordance with this policy.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Information We Collect
            </h2>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              Information You Provide
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              We may collect information that you voluntarily provide when you:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li>Use our Immigration Path Finder tool (nationality, immigration goals, qualifications)</li>
              <li>Contact us via email</li>
              <li>Subscribe to updates or newsletters (if offered)</li>
            </ul>
            <p className="text-gray-700 leading-relaxed mb-4">
              This information may include your nationality, immigration objectives, professional background, and contact information.
            </p>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              Automatically Collected Information
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              When you visit our site, we may automatically collect:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li><strong>Usage Data:</strong> Pages visited, time spent on pages, links clicked, browser type, device type</li>
              <li><strong>Technical Data:</strong> IP address, browser version, operating system, referring URLs</li>
              <li><strong>Cookies and Similar Technologies:</strong> Small data files stored on your device (see Cookies section below)</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              How We Use Your Information
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We use collected information for the following purposes:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li><strong>Provide Services:</strong> To deliver immigration pathway recommendations through our Path Finder tool</li>
              <li><strong>Improve Our Site:</strong> To understand how users interact with our content and identify areas for improvement</li>
              <li><strong>Communicate:</strong> To respond to your inquiries and provide customer support</li>
              <li><strong>Analytics:</strong> To analyze site traffic, usage patterns, and popular content</li>
              <li><strong>Security:</strong> To detect, prevent, and address technical issues and protect against fraud or abuse</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Cookies and Tracking Technologies
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We use cookies and similar tracking technologies to track activity on our site and store certain information.
            </p>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              Types of Cookies We Use
            </h3>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li><strong>Essential Cookies:</strong> Necessary for the website to function properly</li>
              <li><strong>Analytics Cookies:</strong> Help us understand how visitors use our site</li>
              <li><strong>Functional Cookies:</strong> Remember your preferences (e.g., selected nationality in tools)</li>
            </ul>

            <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">
              Managing Cookies
            </h3>
            <p className="text-gray-700 leading-relaxed mb-4">
              You can instruct your browser to refuse all cookies or indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our site.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Data Sharing and Disclosure
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We do not sell, trade, or rent your personal information to third parties.
            </p>
            <p className="text-gray-700 leading-relaxed mb-4">
              We may share information only in the following circumstances:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li><strong>Service Providers:</strong> With trusted third-party service providers who assist in operating our website (e.g., hosting, analytics) under strict confidentiality agreements</li>
              <li><strong>Legal Obligations:</strong> When required by law, subpoena, or legal process</li>
              <li><strong>Protection:</strong> To protect our rights, property, or safety, or that of our users or the public</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Third-Party Links
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              Our site contains links to official government immigration websites and other external resources. We are not responsible for the privacy practices of these third-party sites. We encourage you to review their privacy policies.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Data Security
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We implement reasonable security measures to protect your information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Data Retention
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We retain personal information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Your Rights
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              Depending on your location, you may have certain rights regarding your personal information:
            </p>
            <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-4">
              <li><strong>Access:</strong> Request access to your personal information</li>
              <li><strong>Correction:</strong> Request correction of inaccurate information</li>
              <li><strong>Deletion:</strong> Request deletion of your personal information</li>
              <li><strong>Objection:</strong> Object to processing of your personal information</li>
              <li><strong>Data Portability:</strong> Request transfer of your information to another service</li>
            </ul>
            <p className="text-gray-700 leading-relaxed mb-4">
              To exercise these rights, please contact us at{' '}
              <a
                href="mailto:contact@visainfoguide.com"
                className="text-brand-primary hover:text-indigo-700 underline"
              >
                contact@visainfoguide.com
              </a>
              .
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Children's Privacy
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              Our site is not intended for individuals under the age of 18. We do not knowingly collect personal information from children. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              International Users
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              Your information may be transferred to and maintained on servers located outside of your country of residence. By using our site, you consent to this transfer.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Changes to This Privacy Policy
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We may update this Privacy Policy from time to time. Changes will be posted on this page with an updated "Last Updated" date. Your continued use of the site after changes constitutes acceptance of the updated policy.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Contact Us
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              If you have questions about this Privacy Policy, please contact us:
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

          <section className="mb-8 bg-gray-50 p-6 rounded-lg">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">
              Related Pages
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <Link
                href="/terms-of-use"
                className="text-brand-primary hover:text-indigo-700 font-medium"
              >
                Terms of Use
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
