'use client';

import { useEffect, useState } from 'react';
import { useSearchParams } from 'next/navigation';
import Link from 'next/link';
import { ExternalLink, Clock, DollarSign, CircleCheck as CheckCircle, Badge, Calculator, BookOpen, FileText, Compass, Globe, FileSearch, Plane } from 'lucide-react';
import BackNavigation from '@/components/BackNavigation';
import { supabase, getPassports, getCountries } from '@/lib/supabaseClient';
import { starterPassports } from '@/data/starterPassports';
import { starterDestinations } from '@/data/starterDestinations';
import { generateStarterPathways, filterPathwaysByGoal } from '@/lib/generateStarterPathways';

interface Pathway {
  id?: string;
  pathway_type: string;
  pathway_name: string;
  summary: string;
  eligibility: string;
  requirements: string;
  processing_time: string;
  validity_period: string;
  official_url: string | null;
  last_updated: string;
  isStarter?: boolean;
}

export default function ResultsContent() {
  const searchParams = useSearchParams();
  const [pathways, setPathways] = useState<Pathway[]>([]);
  const [passportName, setPassportName] = useState('');
  const [destinationName, setDestinationName] = useState('');
  const [loading, setLoading] = useState(true);

  const passport = searchParams.get('passport') || '';
  const destination = searchParams.get('destination') || '';
  const goal = searchParams.get('goal') || '';
  const stayLength = searchParams.get('stayLength') || '';

  useEffect(() => {
    loadData();
  }, [passport, destination, goal]);

  async function loadData() {
    try {
      let passportsData = [];
      let countriesData = [];

      try {
        [passportsData, countriesData] = await Promise.all([
          getPassports(),
          getCountries(),
        ]);
      } catch (err) {
        passportsData = starterPassports;
        countriesData = starterDestinations;
      }

      if (passportsData.length === 0) passportsData = starterPassports;
      if (countriesData.length === 0) countriesData = starterDestinations;

      const passportFound = passportsData.find((p) => p.slug === passport);
      const countryFound = countriesData.find((c) => c.slug === destination);

      setPassportName(passportFound?.name || passport);
      setDestinationName(countryFound?.name || destination);

      // Convert kebab-case goal to proper format (e.g., "digital-nomad" -> "Digital Nomad")
      const goalFormatted = goal
        .split('-')
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ');

      const { data, error } = await supabase
        .from('immigration_pathways')
        .select('*')
        .in('passport_slug', [passport, 'any'])
        .eq('destination_slug', destination)
        .eq('goal', goalFormatted)
        .order('pathway_name');

      if (!error && data && data.length > 0) {
        setPathways(data.map((p: any) => ({ ...p, isStarter: false })));
      } else {
        const generatedPathways = generateStarterPathways(destination, countryFound?.name || destination);
        const filteredPathways = filterPathwaysByGoal(generatedPathways, goal);

        setPathways(filteredPathways.map((p, index) => ({
          ...p,
          id: `starter-${index}`,
        })));
      }
    } catch (error) {
      console.error('Error loading pathways:', error);

      const passportFound = starterPassports.find((p) => p.slug === passport);
      const countryFound = starterDestinations.find((c) => c.slug === destination);

      setPassportName(passportFound?.name || passport);
      setDestinationName(countryFound?.name || destination);

      const generatedPathways = generateStarterPathways(destination, countryFound?.name || destination);
      const filteredPathways = filterPathwaysByGoal(generatedPathways, goal);

      setPathways(filteredPathways.map((p, index) => ({
        ...p,
        id: `starter-${index}`,
      })));
    } finally {
      setLoading(false);
    }
  }

  if (loading) {
    return (
      <div className="text-center py-12">
        <div className="inline-block h-8 w-8 animate-spin rounded-full border-4 border-solid border-brand-primary border-r-transparent"></div>
        <p className="mt-4 text-gray-600">Loading immigration pathways...</p>
      </div>
    );
  }

  return (
    <div>
      <BackNavigation fallbackUrl="/path-finder" label="Back to Path Finder" className="mb-6" />

      <div className="bg-white rounded-lg border border-gray-200 p-6 mb-8">
        <h1 className="text-2xl font-bold text-gray-900 mb-4">
          Immigration Pathways Results
        </h1>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
          <div>
            <span className="text-gray-600">From:</span>
            <p className="font-medium text-gray-900">{passportName}</p>
          </div>
          <div>
            <span className="text-gray-600">To:</span>
            <p className="font-medium text-gray-900">{destinationName}</p>
          </div>
          <div>
            <span className="text-gray-600">Goal:</span>
            <p className="font-medium text-gray-900">{goal}</p>
          </div>
          <div>
            <span className="text-gray-600">Stay Length:</span>
            <p className="font-medium text-gray-900">{stayLength}</p>
          </div>
        </div>
      </div>

      {pathways.length === 0 ? (
        <div className="bg-white rounded-lg border border-gray-200 p-12 text-center">
          <div className="max-w-md mx-auto">
            <h2 className="text-xl font-semibold text-gray-900 mb-2">
              No Pathways Found Yet
            </h2>
            <p className="text-gray-600 mb-6">
              We don't have specific pathway information for this combination yet.
              Check back soon as we continue to expand our database.
            </p>
            <Link
              href="/immigration-guides"
              className="inline-flex items-center text-brand-primary hover:text-brand-primary-hover font-medium"
            >
              View Immigration Guides
              <ExternalLink className="ml-2 h-4 w-4" />
            </Link>
          </div>
        </div>
      ) : (
        <div className="space-y-6">
          <p className="text-sm text-gray-600">
            Found {pathways.length} {pathways.length === 1 ? 'pathway' : 'pathways'} for your criteria
          </p>

          {pathways.map((pathway) => (
            <div
              key={pathway.id}
              className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-md transition-shadow"
            >
              <div className="flex items-start justify-between mb-3">
                <h2 className="text-xl font-semibold text-gray-900">
                  {pathway.pathway_name}
                </h2>
                {pathway.isStarter && (
                  <span className="px-2.5 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-md">
                    Starter
                  </span>
                )}
              </div>

              <p className="text-gray-700 mb-4">{pathway.summary}</p>

              {pathway.isStarter && (
                <div className="mb-4 p-3 bg-amber-50 border border-amber-200 rounded-md">
                  <p className="text-xs text-amber-800">
                    This is starter content for informational purposes only. Always verify requirements via official government sources. This is not legal advice.
                  </p>
                </div>
              )}

              <div className="grid md:grid-cols-2 gap-6 mb-4">
                <div>
                  <h3 className="flex items-center text-sm font-semibold text-gray-900 mb-2">
                    <CheckCircle className="h-4 w-4 mr-2 text-brand-primary" />
                    Eligibility
                  </h3>
                  <p className="text-sm text-gray-700">{pathway.eligibility}</p>
                </div>

                <div>
                  <h3 className="flex items-center text-sm font-semibold text-gray-900 mb-2">
                    <CheckCircle className="h-4 w-4 mr-2 text-brand-primary" />
                    Requirements
                  </h3>
                  <p className="text-sm text-gray-700">{pathway.requirements}</p>
                </div>

                <div>
                  <h3 className="flex items-center text-sm font-semibold text-gray-900 mb-2">
                    <Clock className="h-4 w-4 mr-2 text-brand-primary" />
                    Processing Time
                  </h3>
                  <p className="text-sm text-gray-700">{pathway.processing_time}</p>
                </div>

                <div>
                  <h3 className="flex items-center text-sm font-semibold text-gray-900 mb-2">
                    <Clock className="h-4 w-4 mr-2 text-brand-primary" />
                    Validity Period
                  </h3>
                  <p className="text-sm text-gray-700">{pathway.validity_period}</p>
                </div>
              </div>

              {pathway.official_url && (
                <div className="border-t border-gray-200 pt-4 mt-4">
                  <a
                    href={pathway.official_url}
                    target="_blank"
                    rel="noopener noreferrer"
                                        className="inline-flex items-center text-sm text-brand-primary hover:text-indigo-700 font-medium"
                  >
                    <ExternalLink className="h-4 w-4 mr-2" />
                    Official Application Portal
                  </a>
                </div>
              )}

              <p className="text-xs text-gray-500 mt-4">
                Last updated: {new Date(pathway.last_updated).toLocaleDateString()}
              </p>
            </div>
          ))}
        </div>
      )}

      <div className="mt-10 grid sm:grid-cols-2 gap-4 mb-6">
        <a
          href="https://www.visainfoguide.com"
          target="_blank"
          rel="noopener noreferrer"
          className="flex items-start gap-3 bg-sky-50 border border-sky-200 hover:border-sky-400 rounded-lg p-4 transition-all group"
        >
          <FileSearch className="h-5 w-5 text-sky-600 mt-0.5 flex-shrink-0" />
          <div>
            <p className="text-sm font-semibold text-sky-900 group-hover:text-sky-700">Check Entry Visa Requirements</p>
            <p className="text-xs text-sky-700 mt-0.5">Before you apply — do you need a tourist visa to visit {destinationName} first?</p>
            <p className="text-xs text-sky-500 mt-1 font-medium">VisaInfoGuide.com →</p>
          </div>
        </a>
        <a
          href="https://www.restinairport.com"
          target="_blank"
          rel="noopener noreferrer"
          className="flex items-start gap-3 bg-sky-50 border border-sky-200 hover:border-sky-400 rounded-lg p-4 transition-all group"
        >
          <Plane className="h-5 w-5 text-sky-600 mt-0.5 flex-shrink-0" />
          <div>
            <p className="text-sm font-semibold text-sky-900 group-hover:text-sky-700">Find Airport Transit Hotels</p>
            <p className="text-xs text-sky-700 mt-0.5">Planning a long-haul relocation flight? Find hotels for layovers and connecting flights.</p>
            <p className="text-xs text-sky-500 mt-1 font-medium">RestInAirport.com →</p>
          </div>
        </a>
      </div>

      <div className="mt-4 bg-gray-50 rounded-xl border border-gray-200 p-6">
        <h2 className="text-lg font-semibold text-gray-900 mb-5">Next Steps</h2>
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {destination && (
            <Link
              href={`/immigration-cost/${destination}`}
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <Calculator className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Calculate Costs</p>
                <p className="text-xs text-gray-500 mt-0.5">See visa fees & total expenses</p>
              </div>
            </Link>
          )}
          {destination && (
            <Link
              href={`/country/${destination}`}
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <Globe className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Country Guide</p>
                <p className="text-xs text-gray-500 mt-0.5">Cost of living, jobs & culture</p>
              </div>
            </Link>
          )}
          <Link
            href="/document-checklist"
            className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
          >
            <FileText className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
            <div>
              <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Document Checklist</p>
              <p className="text-xs text-gray-500 mt-0.5">Prepare your application docs</p>
            </div>
          </Link>
          <Link
            href="/immigration-guides"
            className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
          >
            <BookOpen className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
            <div>
              <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Immigration Guides</p>
              <p className="text-xs text-gray-500 mt-0.5">Deep-dive country research</p>
            </div>
          </Link>
        </div>
      </div>

      {destination && (
        <div className="mt-6 flex flex-wrap gap-3">
          <Link
            href={`/immigrate-to/${destination}`}
            className="inline-flex items-center gap-1.5 text-sm text-brand-primary border border-brand-primary/30 rounded-full px-4 py-1.5 hover:bg-brand-primary hover:text-white transition-colors"
          >
            <Compass className="h-3.5 w-3.5" />
            Explore all pathways to {destinationName}
          </Link>
          <Link
            href={`/country-comparison`}
            className="inline-flex items-center gap-1.5 text-sm text-gray-600 border border-gray-200 rounded-full px-4 py-1.5 hover:border-brand-primary hover:text-brand-primary transition-colors"
          >
            Compare with other countries
          </Link>
          <Link
            href="/path-finder"
            className="inline-flex items-center gap-1.5 text-sm text-gray-600 border border-gray-200 rounded-full px-4 py-1.5 hover:border-brand-primary hover:text-brand-primary transition-colors"
          >
            Try a different search
          </Link>
        </div>
      )}
    </div>
  );
}
