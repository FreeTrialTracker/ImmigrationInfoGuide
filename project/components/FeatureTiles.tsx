import Link from 'next/link';
import { FileText, BookOpen, Wrench } from 'lucide-react';

export default function FeatureTiles() {
  const features = [
    {
      icon: FileText,
      title: 'IMMIGRATION GUIDES',
      description: 'Country-by-country long-stay options',
      href: '/immigration-guides',
      bgColor: 'bg-indigo-50',
      iconColor: 'text-brand-primary',
    },
    {
      icon: BookOpen,
      title: 'RESOURCES',
      description: 'Official links, checklists, timelines',
      href: '/resources',
      bgColor: 'bg-blue-50',
      iconColor: 'text-blue-600',
    },
    {
      icon: Wrench,
      title: 'TOOLS',
      description: 'Planning tools and comparisons',
      href: '/tools',
      bgColor: 'bg-amber-50',
      iconColor: 'text-amber-600',
    },
  ];

  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mt-12">
      {features.map((feature) => {
        const Icon = feature.icon;
        return (
          <Link
            key={feature.title}
            href={feature.href}
            className="block p-6 rounded-lg border border-gray-200 bg-white hover:shadow-md transition-shadow"
          >
            <div className={`inline-flex p-3 rounded-lg ${feature.bgColor} mb-4`}>
              <Icon className={`h-6 w-6 ${feature.iconColor}`} />
            </div>
            <h3 className="text-sm font-semibold text-gray-900 mb-2">
              {feature.title}
            </h3>
            <p className="text-sm text-gray-600">{feature.description}</p>
          </Link>
        );
      })}
    </div>
  );
}
