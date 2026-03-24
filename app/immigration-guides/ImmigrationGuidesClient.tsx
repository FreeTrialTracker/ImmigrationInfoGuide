'use client';

import Link from 'next/link';
import { FileText, Globe, ArrowRight, ChevronDown, ChevronUp, Calculator, Compass, ChartBar as BarChart2, ClipboardList } from 'lucide-react';
import { supabase } from '@/lib/supabaseClient';
import { useState, useEffect } from 'react';

interface RegionData {
  name: string;
  count: number;
  guides: Array<{ slug: string; name: string }>;
}

export default function ImmigrationGuidesClient() {
  const [regions, setRegions] = useState<RegionData[]>([]);
  const [loading, setLoading] = useState(true);
  const [expandedRegions, setExpandedRegions] = useState<{ [key: string]: boolean }>({});

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

      const regionMap: { [key: string]: RegionData } = {};

      data.forEach((item: any) => {
        const region = item.countries.region;
        const name = item.countries.name;
        const slug = item.country_slug;

        if (!region) return;

        if (!regionMap[region]) {
          regionMap[region] = { name: region, count: 0, guides: [] };
        }

        regionMap[region].count++;
        regionMap[region].guides.push({ slug, name });
      });

      setRegions(Object.values(regionMap).sort((a, b) => a.name.localeCompare(b.name)));
      setLoading(false);
    }

    loadData();
  }, []);

  const toggleRegion = (regionName: string) => {
    setExpandedRegions(prev => ({
      ...prev,
      [regionName]: !prev[regionName]
    }));
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-white">
        <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-12">
          <div className="text-center py-12">
            <p className="text-gray-600">Loading immigration guides...</p>
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
            Immigration Guides
          </h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Comprehensive country-by-country guides covering work permits, residency options, and long-term relocation pathways.
          </p>
        </div>

        {regions.length === 0 ? (
          <div className="text-center py-12">
            <p className="text-gray-600 mb-4">Immigration guides are being prepared. Check back soon!</p>
          </div>
        ) : (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {regions.map((region) => {
              const isExpanded = expandedRegions[region.name];
              const visibleGuides = isExpanded ? region.guides : region.guides.slice(0, 5);
              const hasMore = region.guides.length > 5;

              return (
                <div
                  key={region.name}
                  className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-md transition-shadow"
                >
                  <div className="flex items-center space-x-3 mb-3">
                    <Globe className="h-6 w-6 text-brand-primary" />
                    <h2 className="text-lg font-semibold text-gray-900">
                      {region.name}
                    </h2>
                  </div>
                  <p className="text-sm text-gray-600 mb-4">
                    {region.count} {region.count === 1 ? 'guide' : 'guides'} available
                  </p>
                  <div className="space-y-2">
                    {visibleGuides.map((guide) => (
                      <Link
                        key={guide.slug}
                        href={`/country/${guide.slug}`}
                        className="flex items-center justify-between text-sm text-brand-primary hover:text-indigo-700 transition-colors"
                      >
                        <span>{guide.name}</span>
                        <ArrowRight className="h-3 w-3" />
                      </Link>
                    ))}
                    {hasMore && (
                      <button
                        onClick={() => toggleRegion(region.name)}
                        className="flex items-center space-x-1 text-sm text-brand-primary hover:text-indigo-700 transition-colors pt-1"
                      >
                        {isExpanded ? (
                          <>
                            <span>Show less</span>
                            <ChevronUp className="h-3 w-3" />
                          </>
                        ) : (
                          <>
                            <span>+{region.guides.length - 5} more</span>
                            <ChevronDown className="h-3 w-3" />
                          </>
                        )}
                      </button>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        )}

        <div className="mt-12 border-t pt-10">
          <h2 className="text-xl font-bold text-gray-900 mb-5">Immigration Planning Tools</h2>
          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
            <Link
              href="/path-finder"
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <Compass className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Path Finder</p>
                <p className="text-xs text-gray-500 mt-0.5">Find your ideal immigration pathway</p>
              </div>
            </Link>
            <Link
              href="/immigration-cost-calculator"
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <Calculator className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Cost Calculator</p>
                <p className="text-xs text-gray-500 mt-0.5">Estimate total immigration costs</p>
              </div>
            </Link>
            <Link
              href="/country-comparison"
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <BarChart2 className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Compare Countries</p>
                <p className="text-xs text-gray-500 mt-0.5">Side-by-side destination comparison</p>
              </div>
            </Link>
            <Link
              href="/document-checklist"
              className="flex items-start gap-3 bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary hover:shadow-sm transition-all group"
            >
              <ClipboardList className="h-5 w-5 text-brand-primary mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary">Document Checklist</p>
                <p className="text-xs text-gray-500 mt-0.5">Prepare your application docs</p>
              </div>
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
