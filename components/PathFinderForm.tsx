'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { Plane } from 'lucide-react';
import { getPassports, getCountries, PATHWAY_TYPES, STAY_LENGTH_OPTIONS } from '@/lib/supabaseClient';
import { starterPassports } from '@/data/starterPassports';
import { starterDestinations } from '@/data/starterDestinations';

interface Passport {
  slug: string;
  name: string;
}

interface Country {
  slug: string;
  name: string;
  region: string;
}

export default function PathFinderForm() {
  const router = useRouter();
  const [passports, setPassports] = useState<Passport[]>([]);
  const [countries, setCountries] = useState<Country[]>([]);
  const [loading, setLoading] = useState(true);
  const [usingStarterData, setUsingStarterData] = useState(false);

  const [passport, setPassport] = useState('');
  const [destination, setDestination] = useState('');
  const [goal, setGoal] = useState('');
  const [stayLength, setStayLength] = useState('');

  useEffect(() => {
    loadData();
  }, []);

  async function loadData() {
    try {
      const [passportsData, countriesData] = await Promise.all([
        getPassports(),
        getCountries(),
      ]);

      if (passportsData.length === 0 || countriesData.length === 0) {
        setPassports(starterPassports);
        setCountries(starterDestinations);
        setUsingStarterData(true);
      } else {
        setPassports(passportsData);
        setCountries(countriesData);
        setUsingStarterData(false);
      }
    } catch (error) {
      console.error('Error loading data:', error);
      setPassports(starterPassports);
      setCountries(starterDestinations);
      setUsingStarterData(true);
    } finally {
      setLoading(false);
    }
  }

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault();

    const params = new URLSearchParams({
      passport,
      destination,
      goal,
      stayLength,
    });

    router.push(`/path-finder/results?${params.toString()}`);
  }

  if (loading) {
    return (
      <div className="bg-white rounded-lg border border-gray-200 shadow-sm p-8">
        <div className="flex items-center space-x-3 mb-4">
          <Plane className="h-6 w-6 text-brand-primary" />
          <h2 className="text-2xl font-semibold text-gray-900">
            Immigration Path Finder
          </h2>
        </div>
        <p className="text-gray-600 mb-6">Loading...</p>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-lg border border-gray-200 shadow-sm p-8">
      <div className="flex items-center space-x-3 mb-4">
        <Plane className="h-6 w-6 text-brand-primary" />
        <h2 className="text-2xl font-semibold text-gray-900">
          Immigration Path Finder
        </h2>
      </div>
      <p className="text-gray-600 mb-6">
        Select your passport and destination to see common pathways and requirements.
      </p>

      {usingStarterData && (
        <div className="mb-6 p-4 bg-blue-50 border border-blue-200 rounded-md">
          <p className="text-sm text-blue-800">
            Showing starter dataset. This is informational content only and not legal advice.
          </p>
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-6">
        <div>
          <label htmlFor="passport" className="block text-sm font-medium text-gray-900 mb-2">
            Your Passport
          </label>
          <select
            id="passport"
            value={passport}
            onChange={(e) => setPassport(e.target.value)}
            className="w-full px-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
            required
          >
            <option value="">Select your passport</option>
            {passports.map((p) => (
              <option key={p.slug} value={p.slug}>
                {p.name}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="destination" className="block text-sm font-medium text-gray-900 mb-2">
            Destination Country
          </label>
          <select
            id="destination"
            value={destination}
            onChange={(e) => setDestination(e.target.value)}
            className="w-full px-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
            required
          >
            <option value="">Select destination</option>
            {countries.map((c) => (
              <option key={c.slug} value={c.slug}>
                {c.name}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="goal" className="block text-sm font-medium text-gray-900 mb-2">
            Goal
          </label>
          <select
            id="goal"
            value={goal}
            onChange={(e) => setGoal(e.target.value)}
            className="w-full px-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
            required
          >
            <option value="">Select your goal</option>
            {PATHWAY_TYPES.map((g) => (
              <option key={g} value={g}>
                {g}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="stayLength" className="block text-sm font-medium text-gray-900 mb-2">
            Planned Stay Length
          </label>
          <select
            id="stayLength"
            value={stayLength}
            onChange={(e) => setStayLength(e.target.value)}
            className="w-full px-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
          >
            <option value="">Select stay length (optional)</option>
            <option value="0-3-months">0-3 months</option>
            <option value="3-6-months">3-6 months</option>
            <option value="6-12-months">6-12 months</option>
            <option value="1-3-years">1-3 years</option>
            <option value="3-years-plus">3+ years</option>
          </select>
        </div>

        <button
          type="submit"
          className="w-full bg-brand-primary hover:bg-indigo-700 text-white font-medium py-3 px-6 rounded-md transition-colors"
        >
          Check Immigration Pathways
        </button>
      </form>
    </div>
  );
}
