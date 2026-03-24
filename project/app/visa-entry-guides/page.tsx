import type { Metadata } from 'next';
import VisaEntryGuidesClient from './VisaEntryGuidesClient';
import { buildBreadcrumbSchema } from '@/lib/schemaBuilders';

export const metadata: Metadata = {
  title: 'Visa & Entry Requirements by Country | Tourist & Short-Stay Guides',
  description: 'Tourist and short-stay visa requirements for 52+ countries. Check entry requirements, visa-on-arrival eligibility, and e-visa options by destination.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/visa-entry-guides',
  },
  openGraph: {
    title: 'Visa & Entry Requirements by Country | Tourist & Short-Stay Guides',
    description: 'Tourist and short-stay visa requirements for 52+ countries. Check entry requirements, visa-on-arrival eligibility, and e-visa options.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/visa-entry-guides',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Visa & Entry Requirements by Country | Tourist & Short-Stay Guides',
    description: 'Tourist and short-stay visa requirements for 52+ countries. Check entry requirements, visa-on-arrival eligibility, and e-visa options.',
    images: ['/og-image.webp'],
  },
};

export default function VisaEntryGuidesPage() {
  const breadcrumbSchema = buildBreadcrumbSchema([
    { name: 'Home', url: 'https://immigrationinfoguide.com' },
    { name: 'Visa Entry Guides', url: 'https://immigrationinfoguide.com/visa-entry-guides' },
  ]);

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }} />
      <VisaEntryGuidesClient />
    </>
  );
}
