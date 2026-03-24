'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { ArrowRight, CircleAlert as AlertCircle } from 'lucide-react';
import { getCountries, getPassports } from '@/lib/supabaseClient';
import { starterDestinations } from '@/data/starterDestinations';
import { starterPassports } from '@/data/starterPassports';

const GOALS = [
  { value: 'work', label: 'Work' },
  { value: 'study', label: 'Study' },
  { value: 'digital-nomad', label: 'Digital Nomad' },
  { value: 'retirement', label: 'Retirement' },
  { value: 'investor', label: 'Investor' },
  { value: 'family', label: 'Family' },
];

const STAY_LENGTHS = [
  { value: '6-12-months', label: '6-12 months' },
  { value: '1-3-years', label: '1-3 years' },
  { value: '3-plus-years', label: '3+ years' },
];

export default function ImmigrationPathFinderCard() {
  const router = useRouter();
  const [passportSlug, setPassportSlug] = useState('');
  const [destinationSlug, setDestinationSlug] = useState('');
  const [goal, setGoal] = useState('');
  const [stayLength, setStayLength] = useState('');

  const [passports, setPassports] = useState<Array<{ slug: string; name: string }>>([]);
  const [countries, setCountries] = useState<Array<{ slug: string; name: string }>>([]);
  const [usingFallback, setUsingFallback] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadData() {
      try {
        const [passportsResult, countriesResult] = await Promise.all([
          getPassports(),
          getCountries(),
        ]);

        if (passportsResult && passportsResult.length > 0) {
          setPassports(
            (passportsResult as Array<{ slug: string; name: string }>)
              .map((p) => ({ slug: p.slug, name: p.name }))
              .sort((a, b) => a.name.localeCompare(b.name))
          );
        } else {
          setPassports(
            starterPassports
              .map((p) => ({ slug: p.slug, name: p.name }))
              .sort((a, b) => a.name.localeCompare(b.name))
          );
          setUsingFallback(true);
        }

        if (countriesResult && countriesResult.length > 0) {
          setCountries(
            (countriesResult as Array<{ slug: string; name: string }>)
              .map((c) => ({ slug: c.slug, name: c.name }))
              .sort((a, b) => a.name.localeCompare(b.name))
          );
        } else {
          setCountries(
            starterDestinations
              .map((d) => ({ slug: d.slug, name: d.name }))
              .sort((a, b) => a.name.localeCompare(b.name))
          );
          setUsingFallback(true);
        }
      } catch (error) {
        setPassports(
          starterPassports
            .map((p) => ({ slug: p.slug, name: p.name }))
            .sort((a, b) => a.name.localeCompare(b.name))
        );
        setCountries(
          starterDestinations
            .map((d) => ({ slug: d.slug, name: d.name }))
            .sort((a, b) => a.name.localeCompare(b.name))
        );
        setUsingFallback(true);
      } finally {
        setLoading(false);
      }
    }

    loadData();
  }, []);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!passportSlug || !destinationSlug || !goal) {
      return;
    }

    const params = new URLSearchParams({
      passport: passportSlug,
      destination: destinationSlug,
      goal,
      ...(stayLength && { stayLength }),
    });

    router.push(`/path-finder/results?${params.toString()}`);
  };

  const isFormValid = passportSlug && destinationSlug && goal;

  return (
    <div className="bg-white rounded-lg border border-gray-200 shadow-sm p-8">
      <div className="mb-6">
        <h2 className="text-2xl font-bold text-gray-900 mb-2">
          Immigration Path Finder
        </h2>
        <p className="text-gray-600">
          Choose your passport and destination to see common long-stay pathways.
        </p>
      </div>

      {usingFallback && (
        <div className="mb-4 flex items-start space-x-2 bg-blue-50 border border-blue-200 rounded-md p-3">
          <AlertCircle className="h-4 w-4 text-blue-600 flex-shrink-0 mt-0.5" />
          <p className="text-xs text-blue-900">Using starter dataset</p>
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label htmlFor="passport" className="block text-sm font-medium text-gray-900 mb-1.5">
            Your Passport
          </label>
          <select
            id="passport"
            value={passportSlug}
            onChange={(e) => setPassportSlug(e.target.value)}
            className="w-full px-4 py-2.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-brand-primary focus:border-brand-primary text-gray-900"
            required
            disabled={loading}
          >
            <option value="">Select your passport</option>
            {passports.map((passport) => (
              <option key={passport.slug} value={passport.slug}>
                {passport.name}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="destination" className="block text-sm font-medium text-gray-900 mb-1.5">
            Destination Country
          </label>
          <select
            id="destination"
            value={destinationSlug}
            onChange={(e) => setDestinationSlug(e.target.value)}
            className="w-full px-4 py-2.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-brand-primary focus:border-brand-primary text-gray-900"
            required
            disabled={loading}
          >
            <option value="">Select destination</option>
            {countries.map((country) => (
              <option key={country.slug} value={country.slug}>
                {country.name}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="goal" className="block text-sm font-medium text-gray-900 mb-1.5">
            Goal
          </label>
          <select
            id="goal"
            value={goal}
            onChange={(e) => setGoal(e.target.value)}
            className="w-full px-4 py-2.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-brand-primary focus:border-brand-primary text-gray-900"
            required
          >
            <option value="">Select your goal</option>
            {GOALS.map((g) => (
              <option key={g.value} value={g.value}>
                {g.label}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="stayLength" className="block text-sm font-medium text-gray-900 mb-1.5">
            Planned Stay Length
          </label>
          <select
            id="stayLength"
            value={stayLength}
            onChange={(e) => setStayLength(e.target.value)}
            className="w-full px-4 py-2.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-brand-primary focus:border-brand-primary text-gray-900"
          >
            <option value="">Select stay length (optional)</option>
            {STAY_LENGTHS.map((sl) => (
              <option key={sl.value} value={sl.value}>
                {sl.label}
              </option>
            ))}
          </select>
        </div>

        <button
          type="submit"
          disabled={!isFormValid || loading}
          className={`w-full flex items-center justify-center px-6 py-3 rounded-md font-semibold transition-colors ${
            isFormValid && !loading
              ? 'bg-brand-primary text-white hover:bg-brand-primary-hover'
              : 'bg-gray-300 text-gray-500 cursor-not-allowed'
          }`}
        >
          Check Immigration Pathways
          <ArrowRight className="ml-2 h-5 w-5" />
        </button>
      </form>
    </div>
  );
}
