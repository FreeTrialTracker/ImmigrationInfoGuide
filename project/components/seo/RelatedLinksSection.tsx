import Link from 'next/link';
import { ArrowRight } from 'lucide-react';
import type { RelatedLinkGroup } from '@/lib/seo/relatedLinks';

interface RelatedLinksSectionProps {
  groups: RelatedLinkGroup[];
  intro?: string;
}

export default function RelatedLinksSection({ groups, intro }: RelatedLinksSectionProps) {
  const visibleGroups = groups.filter((g) => g.links.length > 0);
  if (visibleGroups.length === 0) return null;

  return (
    <section className="mt-10 border-t border-gray-200 pt-10">
      <div className="mb-6">
        <h2 className="text-xl font-bold text-gray-900">Related Guides &amp; Resources</h2>
        <p className="text-sm text-gray-500 mt-1">
          {intro ?? 'Explore related immigration routes, costs, and planning guides.'}
        </p>
      </div>

      <div className="grid gap-8 sm:grid-cols-2">
        {visibleGroups.map((group) => (
          <div key={group.heading}>
            <h3 className="text-sm font-semibold text-gray-700 uppercase tracking-wide mb-3">
              {group.heading}
            </h3>
            <ul className="space-y-2">
              {group.links.map((link) => (
                <li key={link.href}>
                  <Link
                    href={link.href}
                    className="group flex items-start gap-2 rounded-lg border border-gray-100 bg-gray-50 px-4 py-3 text-sm hover:border-brand-primary hover:bg-white hover:shadow-sm transition-all"
                  >
                    <ArrowRight className="h-3.5 w-3.5 text-brand-primary flex-shrink-0 mt-0.5 group-hover:translate-x-0.5 transition-transform" />
                    <span>
                      <span className="font-medium text-gray-900 group-hover:text-brand-primary">
                        {link.label}
                      </span>
                      {link.description && (
                        <span className="block text-xs text-gray-400 mt-0.5">{link.description}</span>
                      )}
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </section>
  );
}
