import { Metadata } from 'next';
import DocumentChecklistClient from './DocumentChecklistClient';

export const metadata: Metadata = {
  title: 'Immigration Document Checklist | Required Documents by Country & Visa Type',
  description: 'Generate a customized immigration document checklist by country and visa type. Get required documents for work visas, residency permits, digital nomad visas, and more.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/document-checklist',
  },
  openGraph: {
    title: 'Immigration Document Checklist | Required Documents by Country & Visa Type',
    description: 'Generate a customized immigration document checklist by country and visa type for work visas, residency permits, digital nomad visas, and more.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/document-checklist',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Immigration Document Checklist | Required Documents by Country & Visa Type',
    description: 'Generate a customized immigration document checklist for work visas, residency permits, digital nomad visas, and more.',
    images: ['/og-image.webp'],
  },
};

export default function DocumentChecklistPage() {
  return <DocumentChecklistClient />;
}
