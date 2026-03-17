'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { MapPin } from 'lucide-react';
import { getCountries } from '@/lib/supabaseClient';
import { starterDestinations } from '@/data/starterDestinations';

export default function PopularImmigrationDestinations() {
  const [destinations, setDestinations] = useState<Array<{ slug: string; name: string; region: string }>>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadDestinations() {
      try {
        const data = await getCountries();

        if (data && data.length > 0) {
          const sorted = [...data]
            .sort((a: any, b: any) => a.name.localeCompare(b.name))
            .slice(0, 12)
            .map((c: any) => ({
              slug: c.slug,
              name: c.name,
              region: c.region || 'Global',
            }));
          setDestinations(sorted);
        } else {
          setDestinations(
            starterDestinations.slice(0, 12).map((d) => ({
              slug: d.slug,
              name: d.name,
              region: d.region || 'Global',
            }))
          );
        }
      } catch (error) {
        setDestinations(
          starterDestinations.slice(0, 12).map((d) => ({
            slug: d.slug,
            name: d.name,
            region: d.region || 'Global',
          }))
        );
      } finally {
        setLoading(false);
      }
    }

    loadDestinations();
  }, []);

  if (loading) {
    return (
      <div className="py-10 bg-gray-50">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-8 text-center">
            Popular Immigration Destinations
          </h2>
          <div className="grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            {[...Array(12)].map((_, i) => (
              <div key={i} className="bg-white rounded-lg border border-gray-200 p-4 animate-pulse">
                <div className="h-4 bg-gray-200 rounded w-3/4 mb-2"></div>
                <div className="h-3 bg-gray-100 rounded w-1/2"></div>
              </div>
            ))}
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="py-10 bg-gray-50">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <h2 className="text-3xl font-bold text-gray-900 mb-2 text-center">
          Popular Immigration Destinations
        </h2>
        <p className="text-gray-600 text-center mb-8 max-w-2xl mx-auto">
          Explore long-term stay options and immigration pathways for popular countries.
        </p>

        <div className="grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
          {destinations.map((destination) => (
            <Link
              key={destination.slug}
              href={`/immigrate-to/${destination.slug}`}
              className="bg-white rounded-lg border border-gray-200 p-4 hover:border-indigo-500 hover:shadow-md transition-all group"
            >
              <div className="flex items-start justify-between mb-2">
                <h3 className="font-semibold text-gray-900 group-hover:text-indigo-700 transition-colors">
                  {destination.name}
                </h3>
                <MapPin className="h-4 w-4 text-gray-400 group-hover:text-brand-primary transition-colors flex-shrink-0" />
              </div>
              <p className="text-xs text-gray-500">{destination.region}</p>
            </Link>
          ))}
        </div>

        <div className="text-center mt-8">
          <Link
            href="/country-finder"
            className="inline-flex items-center text-sm font-medium text-brand-primary hover:text-indigo-700"
          >
            View All Countries
            <svg className="ml-2 h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
            </svg>
          </Link>
        </div>
      </div>
    </div>
  );
}
