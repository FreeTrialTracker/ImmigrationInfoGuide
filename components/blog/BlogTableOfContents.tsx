'use client';

import { useState, useEffect } from 'react';
import { List } from 'lucide-react';
import type { TocItem } from '@/lib/blogTypes';

type Props = {
  toc: TocItem[];
};

export default function BlogTableOfContents({ toc }: Props) {
  const [activeId, setActiveId] = useState<string>('');

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setActiveId(entry.target.id);
          }
        });
      },
      { rootMargin: '-80px 0px -70% 0px', threshold: 0 }
    );

    toc.forEach(({ id }) => {
      const el = document.getElementById(id);
      if (el) observer.observe(el);
    });

    return () => observer.disconnect();
  }, [toc]);

  if (!toc || toc.length === 0) return null;

  return (
    <nav className="bg-white border border-gray-200 rounded-xl p-5" aria-label="Table of contents">
      <div className="flex items-center gap-2 mb-4">
        <List className="h-4 w-4 text-brand-primary" />
        <span className="text-sm font-semibold text-gray-900">Table of Contents</span>
      </div>
      <ol className="space-y-1.5">
        {toc.map((item) => (
          <li key={item.id} className={item.level === 3 ? 'pl-3' : ''}>
            <a
              href={`#${item.id}`}
              className={`block text-sm leading-snug transition-colors py-0.5 rounded ${
                activeId === item.id
                  ? 'text-brand-primary font-medium'
                  : 'text-gray-500 hover:text-gray-900'
              }`}
            >
              {item.level === 3 && (
                <span className="inline-block w-3 h-px bg-gray-300 mr-1.5 mb-0.5 align-middle" />
              )}
              {item.title}
            </a>
          </li>
        ))}
      </ol>
    </nav>
  );
}
