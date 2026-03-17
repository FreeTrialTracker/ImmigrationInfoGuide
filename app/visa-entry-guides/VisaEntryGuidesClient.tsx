'use client';

import Link from 'next/link';
import { Globe, ArrowRight, ExternalLink } from 'lucide-react';
import { supabase } from '@/lib/supabaseClient';
import { useState, useEffect } from 'react';

interface CountryGuide {
  slug: string;
  name: string;
  region: string;
}

export default function VisaEntryGuidesClient() {
  const [guides, setGuides] = useState<CountryGuide[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadData() {
      const { data, error } = await supabase
        .from('country_guides')
        .select(`
          country_slug,
          countries!inner(name, region)
        `)
        .order('countries(name)');

      if (error || !data) {
        setLoading(false);
        return;
      }

      const formattedGuides: CountryGuide[] = data.map((item: any) => ({
        slug: item.country_slug,
        name: item.countries.name,
        region: item.countries.region,
      }));

      setGuides(formattedGuides);
      setLoading(false);
    }

    loadData();
  }, []);

  const groupedByRegion = guides.reduce((acc, guide) => {
    if (!acc[guide.region]) {
      acc[guide.region] = [];
    }
    acc[guide.region].push(guide);
    return acc;
  }, {} as Record<string, CountryGuide[]>);

  const sortedRegions = Object.keys(groupedByRegion).sort();

  if (loading) {
    return (
      <div className="min-h-screen bg-white">
        <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-12">
          <div className="text-center py-12">
            <p className="text-gray-600">Loading visa entry guides...</p>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="text-center mb-12">
          <h1 className="text-3xl font-bold text-gray-900 mb-3">
            Visa & Entry Requirements
          </h1>
          <p className="text-lg text-gray-600 max-w-3xl mx-auto mb-6">
            Before planning your long-term immigration strategy, check visa and entry requirements for your destination country. These guides cover tourist visas, business visas, and short-stay entry regulations.
          </p>
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 max-w-3xl mx-auto">
            <p className="text-sm text-gray-700 mb-3">
              For comprehensive visa and entry information, visit our sister site:
            </p>
            <a
              href="https://www.visainfoguide.com"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium transition-colors"
            >
              VisaInfoGuide.com
              <ExternalLink className="ml-2 h-4 w-4" />
            </a>
          </div>
        </div>

        <div className="space-y-8">
          {sortedRegions.map((region) => (
            <div key={region} className="border border-gray-200 rounded-lg p-6">
              <div className="flex items-center space-x-3 mb-4">
                <Globe className="h-6 w-6 text-blue-600" />
                <h2 className="text-xl font-semibold text-gray-900">{region}</h2>
                <span className="text-sm text-gray-500">
                  ({groupedByRegion[region].length} {groupedByRegion[region].length === 1 ? 'country' : 'countries'})
                </span>
              </div>
              <div className="grid md:grid-cols-3 gap-3">
                {groupedByRegion[region].map((guide) => (
                  <a
                    key={guide.slug}
                    href={`https://www.visainfoguide.com/destinations/${guide.slug}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-between text-sm text-blue-600 hover:text-blue-700 hover:bg-blue-50 transition-all p-3 rounded-md border border-transparent hover:border-blue-200"
                  >
                    <span>{guide.name}</span>
                    <ArrowRight className="h-3 w-3" />
                  </a>
                ))}
              </div>
            </div>
          ))}
        </div>

        <div className="mt-12 bg-indigo-50 rounded-lg border border-indigo-200 p-6">
          <h3 className="font-semibold text-gray-900 mb-2">
            Planning to Move Long-Term?
          </h3>
          <p className="text-sm text-gray-700 mb-4">
            Once you understand entry requirements, explore long-term immigration pathways including work visas, permanent residency, and citizenship options.
          </p>
          <Link
            href="/immigration-guides"
            className="inline-flex items-center text-brand-primary hover:text-indigo-700 font-medium transition-colors"
          >
            View Immigration Guides
            <ArrowRight className="ml-2 h-4 w-4" />
          </Link>
        </div>
      </div>
    </div>
  );
}
