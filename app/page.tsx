import ImmigrationPathFinderCard from '@/components/ImmigrationPathFinderCard';
import PopularImmigrationDestinations from '@/components/PopularImmigrationDestinations';
import PathwayCategories from '@/components/PathwayCategories';
import HowItWorks from '@/components/HowItWorks';
import FeatureColumns from '@/components/FeatureColumns';
import SEOContentSection from '@/components/SEOContentSection';
import WebAppSuite from '@/components/WebAppSuite';
import BlogSection from '@/components/BlogSection';

export const metadata = {
  title: 'ImmigrationInfoGuide.com - Work, Residency, Digital Nomad, and Long-Stay Pathways',
  description: 'Immigration pathway finder, cost calculator, and guides for 52 countries. Find work visas, digital nomad visas, retirement options, and study permits worldwide.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com',
  },
  openGraph: {
    title: 'ImmigrationInfoGuide.com - Immigration Pathways & Resources',
    description: 'Find legal pathways for long-term stay: work, study, digital nomad, retirement, and investment options for 52+ countries.',
    type: 'website',
    url: 'https://immigrationinfoguide.com',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'ImmigrationInfoGuide.com - Immigration Pathways & Resources',
    description: 'Find legal pathways for long-term stay: work, study, digital nomad, retirement, and investment options for 52+ countries.',
    images: ['/og-image.webp'],
  },
};

export default function Home() {
  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-12 text-center">
        <h1 className="text-5xl md:text-6xl font-display font-bold mb-6">
          <span className="block sm:inline text-gray-900">Immigration</span>
          <span className="block sm:inline">
            <span className="text-brand-primary">Info</span>
            <span className="text-gray-900">Guide.com</span>
          </span>
        </h1>
        <p className="text-xl text-gray-600 mb-16 max-w-3xl mx-auto">
          Explore legal pathways for long-term stay: work, study, digital nomad, retirement, and investment
        </p>

        <div className="mx-auto max-w-3xl">
          <ImmigrationPathFinderCard />
        </div>

        <p className="text-sm text-gray-500 mt-8 mb-16">
          Informational only. Verify with official government sources.
        </p>
      </div>

      <FeatureColumns />

      <PopularImmigrationDestinations />

      <PathwayCategories />

      <HowItWorks />

      <SEOContentSection />

      <BlogSection />

      <WebAppSuite />
    </div>
  );
}
