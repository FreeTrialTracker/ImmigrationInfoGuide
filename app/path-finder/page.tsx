import PathFinderForm from '@/components/PathFinderForm';
import { StructuredData } from '@/components/StructuredData';
import { SEOBreadcrumbs } from '@/components/SEOBreadcrumbs';

export const metadata = {
  title: 'Immigration Path Finder - Find Your Relocation Pathway',
  description: 'Discover personalized immigration pathways based on your passport, destination, and goals. Find work visas, residency permits, and long-term stay options.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/path-finder',
  },
  openGraph: {
    title: 'Immigration Path Finder - Find Your Relocation Pathway',
    description: 'Discover personalized immigration pathways based on your passport, destination, and goals.',
    url: 'https://immigrationinfoguide.com/path-finder',
    type: 'website',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Immigration Path Finder - Find Your Relocation Pathway',
    description: 'Discover personalized immigration pathways based on your passport, destination, and goals.',
    images: ['/og-image.webp'],
  },
};

const pathFinderFAQs = [
  {
    question: 'How does the Immigration Path Finder work?',
    answer: 'The Path Finder matches your passport, destination country, and immigration goal with available legal pathways. It searches our database of immigration options across 52 countries to show you relevant visa types, work permits, and residency programs that match your specific situation.',
  },
  {
    question: 'What immigration goals can I search for?',
    answer: 'You can search for multiple immigration goals including Work (employment and career opportunities), Study (educational programs), Family (family reunification), Visit (tourism and short-term stays), Permanent Residency (long-term settlement), Retirement (retirement visas and programs), Investment (investor visas), and Digital Nomad (remote work options).',
  },
  {
    question: 'Do I need to provide personal information to use the Path Finder?',
    answer: 'No personal information is required. You only need to select your passport country, destination country, and immigration goal. The tool is completely anonymous and free to use.',
  },
  {
    question: 'Are the immigration pathways shown guaranteed to be available to me?',
    answer: 'The Path Finder shows pathways that are generally available for your passport and goal combination. However, individual eligibility depends on many factors including your qualifications, financial situation, criminal record, health, and other personal circumstances. Always verify current requirements with official government sources.',
  },
  {
    question: 'How current is the immigration information?',
    answer: 'Our immigration pathway data is regularly updated and sourced from official government websites. However, immigration policies can change frequently. The Path Finder shows last updated dates for each pathway, and we recommend verifying all information with official government sources before making decisions.',
  },
  {
    question: 'Can I save or export my search results?',
    answer: 'Currently, results are shown directly on the results page. You can bookmark the results URL to return to your specific search. We recommend taking notes on pathways that interest you and researching them further on official government websites.',
  },
];

const pathFinderSteps = [
  {
    name: 'Select Your Passport Country',
    text: 'Choose the country that issued your passport. This determines which immigration pathways and visa requirements apply to you. Your nationality significantly affects visa eligibility, processing times, and required documentation.',
  },
  {
    name: 'Choose Your Destination Country',
    text: 'Select where you want to relocate. We have immigration information for 52 major destination countries worldwide including USA, UK, Canada, Australia, Germany, and many others.',
  },
  {
    name: 'Specify Your Immigration Goal',
    text: 'Select your primary reason for relocating: Work, Study, Family, Visit, Permanent Residency, Retirement, Investment, or Digital Nomad. This helps filter pathways relevant to your specific situation.',
  },
  {
    name: 'Review Matching Pathways',
    text: 'Browse the immigration pathways that match your criteria. Each pathway includes eligibility requirements, processing times, validity periods, and key requirements. Compare options to find the best fit for your situation.',
  },
  {
    name: 'Research Official Requirements',
    text: 'Use the information as a starting point and verify all details with official government immigration websites. Requirements, fees, and processes can change, so always confirm with authoritative sources before applying.',
  },
];

export default function PathFinderPage() {
  const breadcrumbs = [
    { name: 'Home', url: 'https://immigrationinfoguide.com/' },
    { name: 'Path Finder', url: 'https://immigrationinfoguide.com/path-finder' },
  ];

  return (
    <div className="min-h-screen bg-white">
      <StructuredData
        type="BreadcrumbList"
        breadcrumbs={breadcrumbs}
      />
      <StructuredData
        type="HowTo"
        howTo={{
          name: 'How to Use the Immigration Path Finder',
          description: 'Step-by-step guide to finding immigration pathways that match your passport, destination, and goals.',
          totalTime: 'PT5M',
          steps: pathFinderSteps,
        }}
      />
      <StructuredData
        type="FAQPage"
        faqs={pathFinderFAQs}
      />

      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <SEOBreadcrumbs
          items={[
            { label: 'Home', href: '/' },
            { label: 'Path Finder', href: '/path-finder' },
          ]}
        />

        <div className="text-center mb-8 mt-6">
          <h1 className="text-3xl font-bold text-gray-900 mb-3">
            Immigration Path Finder
          </h1>
          <p className="text-gray-600">
            Discover legal pathways for long-term relocation based on your passport and goals.
          </p>
        </div>

        <PathFinderForm />

        <div className="mt-12 border-t pt-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-6">
            Frequently Asked Questions
          </h2>
          <div className="space-y-6">
            {pathFinderFAQs.map((faq, index) => (
              <div key={index} className="border-l-4 border-blue-500 pl-4">
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

        <div className="mt-12 border-t pt-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-6">
            How to Use This Tool
          </h2>
          <div className="space-y-4">
            {pathFinderSteps.map((step, index) => (
              <div key={index} className="flex gap-4">
                <div className="flex-shrink-0 w-8 h-8 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold">
                  {index + 1}
                </div>
                <div>
                  <h3 className="text-lg font-semibold text-gray-900 mb-1">
                    {step.name}
                  </h3>
                  <p className="text-gray-700">
                    {step.text}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
