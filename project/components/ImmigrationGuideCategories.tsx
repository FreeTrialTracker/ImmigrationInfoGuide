import Link from 'next/link';
import { Briefcase, GraduationCap, Laptop, PiggyBank, DollarSign, Users, ArrowRight } from 'lucide-react';

const categories = [
  {
    slug: 'work',
    name: 'Work',
    icon: Briefcase,
    description: 'Employment visas, work permits, and skilled worker programs',
    color: 'bg-blue-50 text-blue-700 border-blue-200',
  },
  {
    slug: 'study',
    name: 'Study',
    icon: GraduationCap,
    description: 'Student visas and educational program requirements',
    color: 'bg-orange-50 text-orange-700 border-orange-200',
  },
  {
    slug: 'digital_nomad',
    name: 'Digital Nomad',
    icon: Laptop,
    description: 'Remote work visas and location-independent programs',
    color: 'bg-purple-50 text-purple-700 border-purple-200',
  },
  {
    slug: 'retirement',
    name: 'Retirement',
    icon: PiggyBank,
    description: 'Retirement visas and pensioner residence options',
    color: 'bg-amber-50 text-amber-700 border-amber-200',
  },
  {
    slug: 'investor',
    name: 'Investor',
    icon: DollarSign,
    description: 'Investment visas, golden visas, and entrepreneur programs',
    color: 'bg-indigo-50 text-indigo-700 border-indigo-200',
  },
  {
    slug: 'family',
    name: 'Family',
    icon: Users,
    description: 'Family reunification and spouse visas',
    color: 'bg-green-50 text-green-700 border-green-200',
  },
];

export default function ImmigrationGuideCategories() {
  return (
    <div className="mt-16">
      <div className="text-center mb-8">
        <h2 className="text-2xl font-bold text-gray-900 mb-2">
          Immigration Guides by Category
        </h2>
        <p className="text-gray-600">
          Explore immigration pathways by your purpose of relocation
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
              <p className="text-sm opacity-80">
                {category.description}
              </p>
            </Link>
          );
        })}
      </div>

      <div className="text-center mt-8">
        <Link
          href="/immigration-guides"
          className="inline-flex items-center text-brand-primary hover:text-indigo-700 font-medium"
        >
          View All Guides
          <ArrowRight className="ml-2 h-4 w-4" />
        </Link>
      </div>
    </div>
  );
}
