import { Metadata } from 'next';
import CountryComparisonClient from './CountryComparisonClient';
import { buildBreadcrumbSchema, buildFaqSchema } from '@/lib/schemaBuilders';

export const metadata: Metadata = {
  title: 'Country Comparison Tool | ImmigrationInfoGuide.com',
  description: 'Compare immigration destinations side by side. Analyze visa costs, pathways, language requirements, and quality of life for 52+ countries.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/country-comparison',
  },
  openGraph: {
    title: 'Immigration Country Comparison Tool | ImmigrationInfoGuide.com',
    description: 'Compare immigration destinations side by side. Analyze visa costs, pathways, and quality of life for 52+ countries.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/country-comparison',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Immigration Country Comparison Tool',
    description: 'Compare immigration destinations side by side. Analyze visa costs, pathways, and quality of life for 52+ countries.',
    images: ['/og-image.webp'],
  },
};

export default function CountryComparisonPage() {
  const faqSchema = buildFaqSchema([
    {
      question: 'Which country is easiest to immigrate to?',
      answer: 'Countries like Portugal, Mexico, and Panama are often considered among the easiest to immigrate to due to straightforward residency programs, lower financial requirements, and streamlined application processes. Our comparison tool lets you evaluate ease of immigration scores across 52+ destinations.',
    },
    {
      question: 'How do I compare immigration costs between countries?',
      answer: 'Use our country comparison tool to analyze visa fees, proof of funds requirements, medical exam costs, and legal fees side by side. You can compare up to 4 countries simultaneously across all key immigration factors.',
    },
    {
      question: 'What factors should I consider when choosing an immigration destination?',
      answer: 'Key factors include visa pathway availability, total immigration costs, language requirements, cost of living, quality of life, healthcare quality, job market conditions, and proximity to your home country. Our comparison tool covers all these dimensions.',
    },
  ]);

  const breadcrumbSchema = buildBreadcrumbSchema([
    { name: 'Home', url: 'https://immigrationinfoguide.com' },
    { name: 'Country Comparison', url: 'https://immigrationinfoguide.com/country-comparison' },
  ]);

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(faqSchema) }} />
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }} />
      <CountryComparisonClient />
    </>
  );
}
