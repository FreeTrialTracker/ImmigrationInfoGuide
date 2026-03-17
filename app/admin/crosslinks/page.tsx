'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabaseClient';
import { ExternalLink, CircleCheck as CheckCircle, Circle as XCircle, TriangleAlert as AlertTriangle } from 'lucide-react';

interface Country {
  slug: string;
  name: string;
  country_code: string | null;
}

interface CrossLink {
  country_code: string;
  country_name: string;
  visa_url: string;
  immigration_url: string;
  is_active: boolean;
}

export default function CrossLinksAdminPage() {
  const [countries, setCountries] = useState<Country[]>([]);
  const [crossLinks, setCrossLinks] = useState<CrossLink[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadData() {
      const [countriesResult, crossLinksResult] = await Promise.all([
        supabase.from('countries').select('slug, name, country_code').order('name'),
        supabase.from('country_crosslinks').select('*').order('country_name'),
      ]);

      if (countriesResult.data) {
        setCountries(countriesResult.data as Country[]);
      }

      if (crossLinksResult.data) {
        setCrossLinks(crossLinksResult.data as CrossLink[]);
      }

      setLoading(false);
    }

    loadData();
  }, []);

  if (loading) {
    return (
      <div className="min-h-screen bg-white p-8">
        <div className="max-w-6xl mx-auto">
          <p className="text-gray-600">Loading cross-link mapping data...</p>
        </div>
      </div>
    );
  }

  const countriesWithCode = countries.filter((c) => c.country_code);
  const countriesWithoutCode = countries.filter((c) => !c.country_code);
  const crossLinkCodes = new Set(crossLinks.map((cl) => cl.country_code));
  const missingMappings = countriesWithCode.filter(
    (c) => c.country_code && !crossLinkCodes.has(c.country_code)
  );

  return (
    <div className="min-h-screen bg-white p-8">
      <div className="max-w-6xl mx-auto">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">
          Cross-Domain Link Mapping Status
        </h1>
        <p className="text-gray-600 mb-8">
          Diagnostic view of country cross-link mappings between ImmigrationInfoGuide and VisaInfoGuide
        </p>

        <div className="grid md:grid-cols-3 gap-6 mb-8">
          <div className="bg-green-50 border border-green-200 rounded-lg p-4">
            <div className="flex items-center space-x-2 mb-2">
              <CheckCircle className="h-5 w-5 text-green-600" />
              <h3 className="font-semibold text-gray-900">Active Mappings</h3>
            </div>
            <p className="text-3xl font-bold text-green-600">{crossLinks.filter((cl) => cl.is_active).length}</p>
            <p className="text-sm text-gray-600">Countries with verified URLs</p>
          </div>

          <div className="bg-amber-50 border border-amber-200 rounded-lg p-4">
            <div className="flex items-center space-x-2 mb-2">
              <AlertTriangle className="h-5 w-5 text-amber-600" />
              <h3 className="font-semibold text-gray-900">Missing Mappings</h3>
            </div>
            <p className="text-3xl font-bold text-amber-600">{missingMappings.length}</p>
            <p className="text-sm text-gray-600">Countries with code but no mapping</p>
          </div>

          <div className="bg-red-50 border border-red-200 rounded-lg p-4">
            <div className="flex items-center space-x-2 mb-2">
              <XCircle className="h-5 w-5 text-red-600" />
              <h3 className="font-semibold text-gray-900">No Country Code</h3>
            </div>
            <p className="text-3xl font-bold text-red-600">{countriesWithoutCode.length}</p>
            <p className="text-sm text-gray-600">Countries missing ISO code</p>
          </div>
        </div>

        <div className="space-y-8">
          <div className="border border-gray-200 rounded-lg p-6">
            <h2 className="text-xl font-semibold text-gray-900 mb-4 flex items-center">
              <CheckCircle className="h-5 w-5 mr-2 text-green-600" />
              Active Cross-Link Mappings ({crossLinks.filter((cl) => cl.is_active).length})
            </h2>
            <div className="space-y-4">
              {crossLinks
                .filter((cl) => cl.is_active)
                .map((cl) => (
                  <div
                    key={cl.country_code}
                    className="border border-gray-200 rounded-md p-4 bg-gray-50"
                  >
                    <div className="flex items-center justify-between mb-2">
                      <h3 className="font-semibold text-gray-900">
                        {cl.country_name} ({cl.country_code})
                      </h3>
                    </div>
                    <div className="space-y-2 text-sm">
                      <div>
                        <span className="text-gray-600">Visa URL:</span>
                        <a
                          href={cl.visa_url}
                          target="_blank"
                          rel="noopener noreferrer"
                                                    className="ml-2 text-blue-600 hover:text-blue-700 inline-flex items-center"
                        >
                          {cl.visa_url}
                          <ExternalLink className="ml-1 h-3 w-3" />
                        </a>
                      </div>
                      <div>
                        <span className="text-gray-600">Immigration URL:</span>
                        <a
                          href={cl.immigration_url}
                          target="_blank"
                          rel="noopener noreferrer"
                                                    className="ml-2 text-brand-primary hover:text-indigo-700 inline-flex items-center"
                        >
                          {cl.immigration_url}
                          <ExternalLink className="ml-1 h-3 w-3" />
                        </a>
                      </div>
                    </div>
                  </div>
                ))}
            </div>
          </div>

          {missingMappings.length > 0 && (
            <div className="border border-amber-200 rounded-lg p-6 bg-amber-50">
              <h2 className="text-xl font-semibold text-gray-900 mb-4 flex items-center">
                <AlertTriangle className="h-5 w-5 mr-2 text-amber-600" />
                Countries Missing Cross-Link Mappings ({missingMappings.length})
              </h2>
              <p className="text-sm text-gray-700 mb-4">
                These countries have a country_code in the database but no entry in country_crosslinks table:
              </p>
              <div className="grid md:grid-cols-3 gap-3">
                {missingMappings.map((country) => (
                  <div key={country.slug} className="bg-white border border-amber-200 rounded p-3">
                    <p className="font-medium text-gray-900">{country.name}</p>
                    <p className="text-xs text-gray-600">
                      Code: {country.country_code} | Slug: {country.slug}
                    </p>
                  </div>
                ))}
              </div>
            </div>
          )}

          {countriesWithoutCode.length > 0 && (
            <div className="border border-red-200 rounded-lg p-6 bg-red-50">
              <h2 className="text-xl font-semibold text-gray-900 mb-4 flex items-center">
                <XCircle className="h-5 w-5 mr-2 text-red-600" />
                Countries Without Country Code ({countriesWithoutCode.length})
              </h2>
              <p className="text-sm text-gray-700 mb-4">
                These countries need a country_code (ISO2) added to enable cross-linking:
              </p>
              <div className="grid md:grid-cols-3 gap-3">
                {countriesWithoutCode.map((country) => (
                  <div key={country.slug} className="bg-white border border-red-200 rounded p-3">
                    <p className="font-medium text-gray-900">{country.name}</p>
                    <p className="text-xs text-gray-600">Slug: {country.slug}</p>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>

        <div className="mt-8 bg-blue-50 border border-blue-200 rounded-lg p-6">
          <h3 className="font-semibold text-gray-900 mb-2">How to Add New Mappings</h3>
          <p className="text-sm text-gray-700 mb-4">
            To add a new country cross-link mapping, insert a row into the country_crosslinks table:
          </p>
          <pre className="bg-gray-900 text-gray-100 p-4 rounded text-xs overflow-x-auto">
            {`INSERT INTO country_crosslinks
  (country_name, country_code, visa_url, immigration_url, is_active)
VALUES
  ('Country Name', 'XX', 'https://www.visainfoguide.com/destinations/slug',
   'https://www.immigrationinfoguide.com/immigrate-to/slug', true);`}
          </pre>
        </div>
      </div>
    </div>
  );
}
