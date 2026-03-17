import type { Metadata } from 'next';
import ImmigrationGuidesClient from './ImmigrationGuidesClient';
import { buildBreadcrumbSchema } from '@/lib/schemaBuilders';

export const metadata: Metadata = {
  title: 'Immigration Guides by Country | Work Visas, Residency & More | ImmigrationInfoGuide.com',
  description: 'Country-by-country immigration guides for 52+ destinations. Work permits, residency pathways, digital nomad visas, and long-term relocation options covered.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/immigration-guides',
  },
  openGraph: {
    title: 'Immigration Guides by Country | Work Visas, Residency & More',
    description: 'Country-by-country immigration guides for 52+ destinations. Work permits, residency, digital nomad visas, and relocation options.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/immigration-guides',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Immigration Guides by Country | Work Visas, Residency & More',
    description: 'Country-by-country immigration guides for 52+ destinations. Work permits, residency, digital nomad visas, and relocation options.',
    images: ['/og-image.webp'],
  },
};

export default function ImmigrationGuidesPage() {
  const breadcrumbSchema = buildBreadcrumbSchema([
    { name: 'Home', url: 'https://immigrationinfoguide.com' },
    { name: 'Immigration Guides', url: 'https://immigrationinfoguide.com/immigration-guides' },
  ]);

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }} />
      <ImmigrationGuidesClient />
    </>
  );
}
