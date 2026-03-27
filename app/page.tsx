import ImmigrationPathFinderCard from '@/components/ImmigrationPathFinderCard';
import PopularImmigrationDestinations from '@/components/PopularImmigrationDestinations';
import PathwayCategories from '@/components/PathwayCategories';
import HowItWorks from '@/components/HowItWorks';
import FeatureColumns from '@/components/FeatureColumns';
import SEOContentSection from '@/components/SEOContentSection';
import WebAppSuite from '@/components/WebAppSuite';
import BlogSection from '@/components/BlogSection';
import BrandPushTrustBadge from '@/components/BrandPushTrustBadge';

export const metadata = {
  title: 'ImmigrationInfoGuide.com | Immigration Pathways, Guides & Cost Calculator',
  description: 'Research legal immigration pathways for 52 countries. Work visas, digital nomad programs, retirement visas, permanent residence routes, and immigration cost estimates — all in one place.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com',
  },
  openGraph: {
    title: 'ImmigrationInfoGuide.com — Immigration Pathways & Country Guides',
    description: 'Compare legal pathways for long-term stay: work permits, digital nomad visas, study permits, retirement programs, and permanent residence routes across 52 countries.',
    type: 'website',
    url: 'https://immigrationinfoguide.com',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'ImmigrationInfoGuide.com — Immigration Pathways & Country Guides',
    description: 'Compare legal pathways for long-term stay: work permits, digital nomad visas, study permits, retirement programs, and permanent residence routes across 52 countries.',
    images: ['/og-image.webp'],
  },
};

export default function Home() {
  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 pt-12 pb-0 text-center">
        <h1 className="text-5xl md:text-6xl font-display font-bold mb-6">
          <span className="block sm:inline text-gray-900">Immigration</span>
          <span className="block sm:inline">
            <span className="text-brand-primary">Info</span>
            <span className="text-gray-900">Guide.com</span>
          </span>
        </h1>
        <p className="text-xl text-gray-600 mb-4 max-w-3xl mx-auto">
          Research legal immigration pathways for 52 countries — work visas, permanent residence, digital nomad programs, retirement visas, and more.
        </p>
        <p className="text-base text-gray-500 mb-12 max-w-2xl mx-auto">
          Compare routes by eligibility, cost, and long-term settlement potential. Not legal advice — a research starting point.
        </p>

        <div className="mx-auto max-w-3xl">
          <ImmigrationPathFinderCard />
        </div>

        <p className="text-sm text-gray-500 mt-8 mb-8">
          For informational purposes only. Always verify current requirements with official government sources.
        </p>

        <div className="mx-auto max-w-3xl mb-4">
          <BrandPushTrustBadge />
        </div>
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
