import Link from 'next/link';
import { MapPin, Compass, Search, ArrowRight } from 'lucide-react';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Page Not Found | ImmigrationInfoGuide.com',
  description: 'The page you are looking for could not be found. Browse immigration guides, pathway finder, and country resources.',
  robots: { index: false, follow: false },
};

const HELPFUL_LINKS = [
  {
    href: '/path-finder',
    icon: Compass,
    label: 'Immigration Path Finder',
    description: 'Find pathways based on your passport and goals',
  },
  {
    href: '/immigration-guides',
    icon: Search,
    label: 'Immigration Guides',
    description: 'Browse guides for 52+ countries worldwide',
  },
  {
    href: '/country-finder',
    icon: MapPin,
    label: 'Country Finder',
    description: 'Explore immigration destinations',
  },
];

export default function NotFound() {
  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
      <div className="max-w-lg w-full text-center">
        <div className="inline-flex items-center justify-center w-20 h-20 bg-indigo-50 rounded-full mb-6">
          <MapPin className="w-10 h-10 text-brand-primary" />
        </div>

        <h1 className="text-6xl font-bold text-gray-900 mb-3">404</h1>
        <h2 className="text-xl font-semibold text-gray-800 mb-3">
          Page Not Found
        </h2>
        <p className="text-gray-600 mb-10">
          The immigration resource you are looking for has moved or does not exist.
          Explore the links below to find what you need.
        </p>

        <div className="space-y-3 mb-8 text-left">
          {HELPFUL_LINKS.map(({ href, icon: Icon, label, description }) => (
            <Link
              key={href}
              href={href}
              className="flex items-center gap-4 p-4 bg-white rounded-lg border border-gray-200 hover:border-indigo-300 hover:bg-indigo-50 transition-all group"
            >
              <div className="flex-shrink-0 w-10 h-10 bg-indigo-50 rounded-lg flex items-center justify-center group-hover:bg-indigo-100 transition-colors">
                <Icon className="w-5 h-5 text-brand-primary" />
              </div>
              <div className="flex-1 min-w-0">
                <p className="font-medium text-gray-900 group-hover:text-brand-primary transition-colors">
                  {label}
                </p>
                <p className="text-sm text-gray-500">{description}</p>
              </div>
              <ArrowRight className="w-4 h-4 text-gray-400 group-hover:text-brand-primary group-hover:translate-x-1 transition-all flex-shrink-0" />
            </Link>
          ))}
        </div>

        <Link
          href="/"
          className="inline-flex items-center gap-2 px-6 py-3 bg-brand-primary text-white rounded-md font-medium hover:bg-indigo-700 transition-colors"
        >
          Back to Homepage
          <ArrowRight className="w-4 h-4" />
        </Link>
      </div>
    </div>
  );
}
