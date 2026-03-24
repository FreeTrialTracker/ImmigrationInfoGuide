'use client';

import { useState } from 'react';
import Link from 'next/link';
import { Search, Globe, ArrowRight } from 'lucide-react';
import { COUNTRIES_52 } from '@/data/countries52';

interface Country {
  slug: string;
  name: string;
  region: string;
}

export default function CountryFinderClient() {
  const [filteredCountries, setFilteredCountries] = useState<Country[]>(COUNTRIES_52);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedRegion, setSelectedRegion] = useState('all');

  const regions = Array.from(new Set(COUNTRIES_52.map((c) => c.region))).sort();

  function handleSearch(query: string) {
    setSearchQuery(query);
    applyFilters(query, selectedRegion);
  }

  function handleRegion(region: string) {
    setSelectedRegion(region);
    applyFilters(searchQuery, region);
  }

  function applyFilters(query: string, region: string) {
    let filtered = COUNTRIES_52;

    if (query) {
      filtered = filtered.filter((country) =>
        country.name.toLowerCase().includes(query.toLowerCase())
      );
    }

    if (region !== 'all') {
      filtered = filtered.filter((country) => country.region === region);
    }

    setFilteredCountries(filtered);
  }

  return (
    <div className="min-h-screen bg-white">
      <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="text-center mb-12">
          <h1 className="text-3xl font-bold text-gray-900 mb-3">
            Country Finder
          </h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Browse immigration destinations and explore pathways for long-term residence.
          </p>
        </div>

        <div className="bg-white rounded-lg border border-gray-200 p-6 mb-8">
          <div className="grid md:grid-cols-2 gap-4">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
              <input
                type="text"
                placeholder="Search countries..."
                value={searchQuery}
                onChange={(e) => handleSearch(e.target.value)}
                className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-brand-primary focus:border-brand-primary"
              />
            </div>

            <select
              value={selectedRegion}
              onChange={(e) => handleRegion(e.target.value)}
              className="w-full px-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-brand-primary focus:border-brand-primary"
            >
              <option value="all">All Regions</option>
              {regions.map((region) => (
                <option key={region} value={region}>
                  {region}
                </option>
              ))}
            </select>
          </div>

          <p className="text-sm text-gray-600 mt-4">
            Showing {filteredCountries.length} {filteredCountries.length === 1 ? 'country' : 'countries'}
          </p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredCountries.map((country) => (
            <Link
              key={country.slug}
              href={`/immigrate-to/${country.slug}`}
              className="group bg-white rounded-lg border border-gray-200 p-6 hover:shadow-md transition-all"
            >
              <div className="flex items-start justify-between mb-3">
                <div className="flex items-center space-x-3">
                  <Globe className="h-6 w-6 text-brand-primary" />
                  <h2 className="text-lg font-semibold text-gray-900 group-hover:text-brand-primary transition-colors">
                    {country.name}
                  </h2>
                </div>
                <ArrowRight className="h-5 w-5 text-gray-400 group-hover:text-brand-primary group-hover:translate-x-1 transition-all" />
              </div>
              <p className="text-sm text-gray-600">{country.region}</p>
            </Link>
          ))}
        </div>

        {filteredCountries.length === 0 && (
          <div className="text-center py-12">
            <p className="text-gray-600">No countries found matching your criteria.</p>
          </div>
        )}
      </div>
    </div>
  );
}
