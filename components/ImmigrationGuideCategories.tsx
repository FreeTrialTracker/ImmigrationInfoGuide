import Link from 'next/link';
import { Briefcase, GraduationCap, Laptop, PiggyBank, DollarSign, Users, ArrowRight } from 'lucide-react';

const categories = [
  {
    slug: 'work',
    name: 'Work Visas',
    icon: Briefcase,
    description: 'Employment-based work permits, employer-sponsored visas, and skilled worker programs. Many routes can lead to permanent residence after a qualifying period.',
    color: 'bg-blue-50 text-blue-700 border-blue-200',
  },
  {
    slug: 'study',
    name: 'Study Permits',
    icon: GraduationCap,
    description: 'Student visas for university enrollment and language programs. Many countries offer post-study work permits as a bridge to employment-based residence.',
    color: 'bg-orange-50 text-orange-700 border-orange-200',
  },
  {
    slug: 'digital_nomad',
    name: 'Digital Nomad Visas',
    icon: Laptop,
    description: 'Remote work authorization for location-independent professionals. These are typically temporary stay permits, not permanent residence routes.',
    color: 'bg-teal-50 text-teal-700 border-teal-200',
  },
  {
    slug: 'retirement',
    name: 'Retirement Visas',
    icon: PiggyBank,
    description: 'Pensioner and passive income residence programs. Usually require proof of sufficient income and do not include local work authorization.',
    color: 'bg-amber-50 text-amber-700 border-amber-200',
  },
  {
    slug: 'investor',
    name: 'Investor Visas',
    icon: DollarSign,
    description: 'Golden visas, investment-based residence, and entrepreneur programs. Many offer accelerated routes to permanent residence or citizenship.',
    color: 'bg-green-50 text-green-700 border-green-200',
  },
  {
    slug: 'family',
    name: 'Family Visas',
    icon: Users,
    description: 'Spouse visas, family reunification permits, and dependent residence. Often leads to independent permanent residence after a qualifying period.',
    color: 'bg-rose-50 text-rose-700 border-rose-200',
  },
];

export default function ImmigrationGuideCategories() {
  return (
    <div className="mt-16">
      <div className="text-center mb-8">
        <h2 className="text-2xl font-bold text-gray-900 mb-2">
          Browse by Immigration Purpose
        </h2>
        <p className="text-gray-600">
          Each category covers a distinct legal basis for immigration. Routes differ in work rights, permanence, and family inclusion.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {categories.map((category) => {
          const Icon = category.icon;
          return (
            <Link
              key={category.slug}
              href={`/immigration-guides?category=${category.slug}`}
              className={`group bg-white rounded-lg border p-6 hover:shadow-md transition-all ${category.color}`}
            >
              <div className="flex items-start justify-between mb-3">
                <Icon className="h-8 w-8" />
                <ArrowRight className="h-5 w-5 opacity-0 group-hover:opacity-100 group-hover:translate-x-1 transition-all" />
              </div>
              <h3 className="text-lg font-semibold mb-2">
                {category.name}
              </h3>
              <p className="text-sm opacity-80 leading-relaxed">
                {category.description}
              </p>
            </Link>
          );
        })}
      </div>

      <div className="text-center mt-8">
        <Link
          href="/immigration-guides"
          className="inline-flex items-center text-brand-primary hover:text-blue-700 font-medium"
        >
          View All Country Guides
          <ArrowRight className="ml-2 h-4 w-4" />
        </Link>
      </div>
    </div>
  );
}
