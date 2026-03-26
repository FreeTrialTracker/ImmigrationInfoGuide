import type { Metadata } from 'next';
import { buildBreadcrumbSchema } from '@/lib/schemaBuilders';
import { ResourcesClient } from './ResourcesClient';

export const metadata: Metadata = {
  title: 'Immigration Resources | Checklists, Official Links & Processing Timelines',
  description: 'Free immigration resources: government visa portals, document checklists, processing timelines, and official links for 52+ countries. Everything in one place.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/resources',
  },
  openGraph: {
    title: 'Immigration Resources | Checklists, Official Links & Processing Timelines',
    description: 'Free immigration resources: government visa portals, document checklists, processing timelines, and official links for 52+ countries.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/resources',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Immigration Resources | Checklists, Official Links & Processing Timelines',
    description: 'Free immigration resources: government visa portals, document checklists, processing timelines, and official links for 52+ countries.',
    images: ['/og-image.webp'],
  },
};

export default function ResourcesPage() {
  const breadcrumbSchema = buildBreadcrumbSchema([
    { name: 'Home', url: 'https://immigrationinfoguide.com' },
    { name: 'Resources', url: 'https://immigrationinfoguide.com/resources' },
  ]);

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }} />
      <ResourcesClient />
    </>
  );
}
