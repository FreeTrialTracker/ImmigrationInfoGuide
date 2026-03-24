'use client';

import { useState } from 'react';
import { ChevronDown, CircleHelp as HelpCircle } from 'lucide-react';
import type { FaqItem } from '@/lib/blogTypes';

type Props = {
  faq: FaqItem[];
};

export default function BlogFaqSection({ faq }: Props) {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  if (!faq || faq.length === 0) return null;

  return (
    <section className="mt-12 pt-8 border-t border-gray-200">
      <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center gap-2">
        <HelpCircle className="h-5 w-5 text-brand-primary" />
        Frequently Asked Questions
      </h2>
      <div className="space-y-2">
        {faq.map((item, idx) => (
          <div
            key={idx}
            className={`rounded-xl border transition-all duration-200 overflow-hidden ${
              openIndex === idx ? 'border-brand-primary/30 bg-brand-primary/5' : 'border-gray-200 bg-white'
            }`}
          >
            <button
              onClick={() => setOpenIndex(openIndex === idx ? null : idx)}
              className="w-full flex items-start justify-between gap-3 px-5 py-4 text-left"
              aria-expanded={openIndex === idx}
            >
              <span className="text-sm font-semibold text-gray-900 leading-snug">{item.question}</span>
              <ChevronDown
                className={`h-5 w-5 text-gray-400 flex-shrink-0 transition-transform duration-200 ${
                  openIndex === idx ? 'rotate-180 text-brand-primary' : ''
                }`}
              />
            </button>
            {openIndex === idx && (
              <div className="px-5 pb-5">
                <p className="text-sm text-gray-600 leading-relaxed">{item.answer}</p>
              </div>
            )}
          </div>
        ))}
      </div>
    </section>
  );
}
