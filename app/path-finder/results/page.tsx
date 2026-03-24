import { Suspense } from 'react';
import ResultsContent from './ResultsContent';

export const metadata = {
  title: 'Immigration Pathways Results - Visa Options & Requirements | ImmigrationInfoGuide',
  description: 'View detailed immigration pathways, visa requirements, processing times, and eligibility criteria for your chosen destination.',
  openGraph: {
    title: 'Immigration Pathways Results',
    description: 'View detailed immigration pathways, visa requirements, and eligibility criteria.',
    type: 'website',
  },
};

export default function ResultsPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-12">
        <Suspense fallback={<div className="text-center">Loading results...</div>}>
          <ResultsContent />
        </Suspense>
      </div>
    </div>
  );
}
