import Link from 'next/link';
import { Globe, ArrowRight } from 'lucide-react';
import { getCountries } from '@/lib/supabaseClient';

export default async function PopularDestinations() {
  const countries = await getCountries();
  const popularCountries = countries.slice(0, 12);

  return (
    <div className="mt-16">
      <div className="text-center mb-8">
        <h2 className="text-2xl font-bold text-gray-900 mb-2">
          Popular Immigration Destinations
        </h2>
        <p className="text-gray-600">
          Explore immigration pathways to these popular countries
        </p>
      </div>

      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        {popularCountries.map((country) => (
          <Link
            key={country.slug}
            href={`/immigrate-to/${country.slug}`}
            className="group bg-white rounded-lg border border-gray-200 p-4 hover:shadow-md transition-all"
          >
            <div className="flex items-center justify-between mb-2">
              <Globe className="h-5 w-5 text-brand-primary" />
              <ArrowRight className="h-4 w-4 text-gray-400 group-hover:text-brand-primary group-hover:translate-x-1 transition-all" />
            </div>
            <h3 className="text-sm font-semibold text-gray-900 group-hover:text-brand-primary transition-colors">
              {country.name}
            </h3>
            <p className="text-xs text-gray-600 mt-1">{country.region}</p>
          </Link>
        ))}
      </div>

      <div className="text-center mt-8">
        <Link
          href="/country-finder"
          className="inline-flex items-center text-brand-primary hover:text-indigo-700 font-medium"
        >
          View All Countries
          <ArrowRight className="ml-2 h-4 w-4" />
        </Link>
      </div>
    </div>
  );
}
