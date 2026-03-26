import type { Metadata } from 'next';
import CountryFinderClient from './CountryFinderClient';
import { buildBreadcrumbSchema, buildCollectionPageSchema } from '@/lib/schemaBuilders';

export const metadata: Metadata = {
  title: 'Country Finder | Browse 52 Immigration Destinations',
  description: 'Browse 52 immigration destinations worldwide. Explore residency, work visas, digital nomad visas, and more by country or region.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/country-finder',
  },
  openGraph: {
    title: 'Country Finder - Browse 52 Immigration Destinations',
    description: 'Browse 52 immigration destinations worldwide. Explore residency, work visas, and digital nomad options by country or region.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/country-finder',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Country Finder - Browse 52 Immigration Destinations',
    description: 'Browse 52 immigration destinations worldwide. Explore residency, work visas, and digital nomad options by country or region.',
    images: ['/og-image.webp'],
  },
};

export default function CountryFinderPage() {
  const breadcrumbSchema = buildBreadcrumbSchema([
    { name: 'Home', url: 'https://immigrationinfoguide.com' },
    { name: 'Country Finder', url: 'https://immigrationinfoguide.com/country-finder' },
  ]);

  const collectionSchema = buildCollectionPageSchema({
    name: 'Country Finder - Browse 52 Immigration Destinations',
    description: 'Browse 52 immigration destinations worldwide. Explore residency, work visas, digital nomad visas, and more by country or region.',
    url: 'https://immigrationinfoguide.com/country-finder',
  });

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }} />
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }} />
      <CountryFinderClient />
    </>
  );
}
