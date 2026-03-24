import Link from 'next/link';
import { Briefcase, GraduationCap, Laptop, Chrome as Home, TrendingUp, Users, ArrowRight } from 'lucide-react';
import { COUNTRIES_52 } from '@/data/countries52';

const PATHWAY_CATEGORIES = [
  {
    title: 'Work Visas',
    description: 'Employment-based immigration and work permits',
    detailedDescription: 'Explore work visa options including skilled worker programs, employer-sponsored permits, intra-company transfers, and temporary work authorization across 52 countries.',
    icon: Briefcase,
    href: '/immigration-guides?category=work',
    slug: 'work-visa',
    color: 'teal',
    popularCountries: ['canada', 'germany', 'australia', 'united-kingdom', 'united-states', 'singapore'],
  },
  {
    title: 'Study Visas',
    description: 'Student visas and education pathways',
    detailedDescription: 'Discover student visa requirements for universities, language schools, and vocational training programs. Many countries offer post-study work rights.',
    icon: GraduationCap,
    href: '/immigration-guides?category=study',
    slug: 'study-visa',
    color: 'blue',
    popularCountries: ['united-states', 'united-kingdom', 'canada', 'australia', 'germany', 'france'],
  },
  {
    title: 'Digital Nomad Visas',
    description: 'Remote work and digital nomad permits',
    detailedDescription: 'Find digital nomad visa programs designed for remote workers and freelancers who want to live abroad while working for foreign employers or clients.',
    icon: Laptop,
    href: '/immigration-guides?category=digital-nomad',
    slug: 'digital-nomad-visa',
    color: 'purple',
    popularCountries: ['portugal', 'spain', 'croatia', 'greece', 'thailand', 'mexico'],
  },
  {
    title: 'Retirement Visas',
    description: 'Long-stay options for retirees',
    detailedDescription: 'Research retirement visa programs for seniors and retirees with pension income. Many countries offer special residence permits for those seeking to retire abroad.',
    icon: Home,
    href: '/immigration-guides?category=retirement',
    slug: 'retirement-visa',
    color: 'orange',
    popularCountries: ['portugal', 'spain', 'thailand', 'mexico', 'philippines', 'malaysia'],
  },
  {
    title: 'Investor Visas',
    description: 'Investment-based residence programs',
    detailedDescription: 'Compare investment visa programs including golden visas, entrepreneur visas, startup permits, and business immigration pathways requiring capital investment.',
    icon: TrendingUp,
    href: '/immigration-guides?category=investor',
    slug: 'investor-visa',
    color: 'green',
    popularCountries: ['portugal', 'spain', 'greece', 'united-arab-emirates', 'singapore', 'united-kingdom'],
  },
  {
    title: 'Family Visas',
    description: 'Family reunification and dependent permits',
    detailedDescription: 'Learn about family reunification visas for spouses, partners, children, and other dependents. Includes marriage visas and family-based residence permits.',
    icon: Users,
    href: '/immigration-guides?category=family',
    slug: 'family-visa',
    color: 'rose',
    popularCountries: ['canada', 'united-states', 'united-kingdom', 'germany', 'australia', 'france'],
  },
];

export default function PathwayCategories() {
  const getColorClasses = (color: string) => {
    const colors: Record<string, { bg: string; bgHover: string; text: string; border: string }> = {
      teal: { bg: 'bg-indigo-100', bgHover: 'group-hover:bg-indigo-200', text: 'text-brand-primary', border: 'border-indigo-200' },
      blue: { bg: 'bg-blue-100', bgHover: 'group-hover:bg-blue-200', text: 'text-blue-600', border: 'border-blue-200' },
      purple: { bg: 'bg-purple-100', bgHover: 'group-hover:bg-purple-200', text: 'text-purple-600', border: 'border-purple-200' },
      orange: { bg: 'bg-orange-100', bgHover: 'group-hover:bg-orange-200', text: 'text-orange-600', border: 'border-orange-200' },
      green: { bg: 'bg-green-100', bgHover: 'group-hover:bg-green-200', text: 'text-green-600', border: 'border-green-200' },
      rose: { bg: 'bg-rose-100', bgHover: 'group-hover:bg-rose-200', text: 'text-rose-600', border: 'border-rose-200' },
    };
    return colors[color] || colors.teal;
  };

  return (
    <div className="py-10 bg-gray-50">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <h2 className="text-3xl font-bold text-gray-900 mb-2 text-center">
          Explore by Pathway Type
        </h2>
        <p className="text-gray-600 text-center mb-12 max-w-2xl mx-auto">
          Find the immigration pathway that matches your goals and situation. Click to see which countries offer each pathway.
        </p>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          {PATHWAY_CATEGORIES.map((category) => {
            const Icon = category.icon;
            const colorClasses = getColorClasses(category.color);

            return (
              <div
                key={category.slug}
                className="bg-white rounded-lg border border-gray-200 p-6 hover:border-indigo-500 hover:shadow-md transition-all group"
              >
                <div className="flex items-start space-x-4 mb-4">
                  <div className={`flex-shrink-0 w-12 h-12 rounded-lg ${colorClasses.bg} flex items-center justify-center ${colorClasses.bgHover} transition-colors`}>
                    <Icon className={`h-6 w-6 ${colorClasses.text}`} />
                  </div>
                  <div className="flex-1 min-w-0">
                    <h3 className="text-lg font-semibold text-gray-900 mb-1">
                      {category.title}
                    </h3>
                    <p className="text-sm text-gray-600 leading-relaxed">
                      {category.detailedDescription}
                    </p>
                  </div>
                </div>

                <div className="mt-4 pt-4 border-t border-gray-100">
                  <p className="text-xs font-medium text-gray-500 uppercase tracking-wide mb-3">
                    Popular Destinations
                  </p>
                  <div className="flex flex-wrap gap-2 mb-4">
                    {category.popularCountries.map((countrySlug) => {
                      const country = COUNTRIES_52.find(c => c.slug === countrySlug);
                      if (!country) return null;

                      return (
                        <Link
                          key={countrySlug}
                          href={`/${category.slug}-${countrySlug}`}
                          className="inline-flex items-center px-2.5 py-1 text-xs font-medium text-gray-700 bg-gray-100 rounded-md hover:bg-indigo-100 hover:text-indigo-700 transition-colors"
                        >
                          {country.name}
                        </Link>
                      );
                    })}
                  </div>
                  <Link
                    href={category.href}
                    className="inline-flex items-center text-sm font-medium text-brand-primary hover:text-indigo-700 transition-colors"
                  >
                    View all countries
                    <ArrowRight className="h-4 w-4 ml-1" />
                  </Link>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
