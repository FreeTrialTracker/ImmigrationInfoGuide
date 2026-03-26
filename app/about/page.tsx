import { Metadata } from 'next';
import Link from 'next/link';

export const metadata: Metadata = {
  title: 'About ImmigrationInfoGuide.com | Free Immigration Information',
  description: 'Learn about ImmigrationInfoGuide.com, your independent resource for immigration pathways and long-term relocation information worldwide.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/about',
  },
  openGraph: {
    title: 'About ImmigrationInfoGuide.com - Free Immigration Information',
    description: 'Learn about ImmigrationInfoGuide.com, your independent resource for immigration pathways and long-term relocation information for 52+ countries.',
    type: 'website',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'About ImmigrationInfoGuide.com - Free Immigration Information',
    description: 'Learn about ImmigrationInfoGuide.com, your independent resource for immigration pathways and long-term relocation information for 52+ countries.',
    images: ['/og-image.webp'],
  },
};

export default function AboutPage() {
  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-6">
          About ImmigrationInfoGuide.com
        </h1>

        <div className="prose prose-gray max-w-none">
          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Who We Are
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              ImmigrationInfoGuide.com is an independent immigration information database designed to help international movers research and understand long-term relocation pathways around the world.
            </p>
            <p className="text-gray-700 leading-relaxed mb-4">
              We provide comprehensive, regularly updated information about work visas, residency permits, digital nomad visas, investor programs, retirement options, and pathways to permanent residence and citizenship across 52+ major destination countries.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Our Mission
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              Our mission is to make immigration information accessible, accurate, and easy to understand. We believe that everyone considering international relocation should have access to clear, reliable information about their options.
            </p>
            <p className="text-gray-700 leading-relaxed mb-4">
              Whether you are seeking better career opportunities, a lower cost of living, favorable tax conditions, or simply a change of lifestyle, we aim to provide the foundational knowledge you need to make informed decisions about your immigration journey.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              What We Offer
            </h2>
            <ul className="list-disc pl-6 space-y-2 text-gray-700">
              <li>
                <strong>Country Immigration Guides:</strong> Detailed overviews of immigration systems, popular pathways, requirements, and living conditions in 52+ countries
              </li>
              <li>
                <strong>Immigration Path Finder:</strong> Interactive tool to discover visa and residency options based on your nationality, goals, and qualifications
              </li>
              <li>
                <strong>Pathway Comparisons:</strong> Side-by-side analysis of different immigration routes, processing times, costs, and requirements
              </li>
              <li>
                <strong>Official Resources:</strong> Direct links to government immigration authorities, application portals, and official documentation
              </li>
              <li>
                <strong>Regular Updates:</strong> Continuous monitoring of immigration policy changes and new program launches worldwide
              </li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Important Disclaimers
            </h2>
            <div className="bg-amber-50 border-l-4 border-amber-500 p-4 mb-4">
              <p className="text-gray-800 font-semibold mb-2">
                Not Legal Advice
              </p>
              <p className="text-gray-700 text-sm">
                ImmigrationInfoGuide.com provides general educational information only. We are not a law firm and do not provide legal advice. Immigration laws are complex and frequently change. Always consult with a licensed immigration attorney or official government sources before making immigration decisions.
              </p>
            </div>
            <div className="bg-blue-50 border-l-4 border-blue-500 p-4 mb-4">
              <p className="text-gray-800 font-semibold mb-2">
                Not Affiliated with Governments
              </p>
              <p className="text-gray-700 text-sm">
                We are an independent information resource and are not affiliated with, endorsed by, or connected to any government agency or immigration department. For official guidance and applications, always refer directly to the relevant government authorities.
              </p>
            </div>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Our Approach
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              We gather information from official government sources, immigration department websites, legal publications, and verified policy announcements. Our team regularly reviews and updates content to reflect the latest changes in immigration regulations.
            </p>
            <p className="text-gray-700 leading-relaxed mb-4">
              Learn more about our research process on our{' '}
              <Link href="/methodology" className="text-brand-primary hover:text-indigo-700 underline">
                Methodology
              </Link>{' '}
              page and review our{' '}
              <Link href="/data-sources" className="text-brand-primary hover:text-indigo-700 underline">
                Data Sources
              </Link>
              .
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Contact Us
            </h2>
            <p className="text-gray-700 leading-relaxed mb-4">
              Have questions, corrections, or suggestions? We welcome your feedback.
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
              Related Resources
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
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
