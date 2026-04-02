'use client';

import { useState } from 'react';
import { ChevronDown, CircleHelp as HelpCircle } from 'lucide-react';
import type { FaqItem } from '@/lib/blogTypes';

type Props = {
  faq: FaqItem[];
};

export default function BlogFaqSection({ faq }: Props) {
  const [openIndex, setOpenIndex] = useState<number | null>(0);

  if (!faq || faq.length === 0) return null;

  return (
    <section className="mt-12 pt-8 border-t border-gray-200" aria-label="Frequently Asked Questions">
      <h2 className="text-2xl font-bold text-gray-900 mb-2 flex items-center gap-2">
        <HelpCircle className="h-5 w-5 text-brand-primary flex-shrink-0" />
        Frequently Asked Questions
      </h2>
      <p className="text-gray-500 text-sm mb-6 leading-relaxed">
        Common questions and answers on this topic.
      </p>
      <div className="space-y-3">
        {faq.map((item, idx) => {
          const isOpen = openIndex === idx;
          return (
            <div
              key={idx}
              className={`rounded-xl border transition-all duration-200 ${
                isOpen ? 'border-brand-primary/25 bg-brand-primary/[0.03]' : 'border-gray-200 bg-white'
              }`}
            >
              <button
                onClick={() => setOpenIndex(isOpen ? null : idx)}
                className="w-full flex items-start justify-between gap-3 px-5 py-4 text-left"
                aria-expanded={isOpen}
              >
                <span className="font-semibold text-gray-900 leading-snug text-[0.9375rem]">
                  {item.question}
                </span>
                <ChevronDown
                  className={`h-5 w-5 flex-shrink-0 transition-transform duration-200 mt-0.5 ${
                    isOpen ? 'rotate-180 text-brand-primary' : 'text-gray-400'
                  }`}
                />
              </button>
              <div
                className={`overflow-hidden transition-all duration-200 ${
                  isOpen ? 'max-h-[600px] opacity-100' : 'max-h-0 opacity-0'
                }`}
                aria-hidden={!isOpen}
              >
                <div className="px-5 pb-5">
                  <p className="text-gray-600 leading-relaxed text-sm">{item.answer}</p>
                </div>
              </div>
              {/* Always-present hidden text for crawlers */}
              <noscript>
                <div className="px-5 pb-5">
                  <p className="text-gray-600 leading-relaxed text-sm">{item.answer}</p>
                </div>
              </noscript>
            </div>
          );
        })}
      </div>
    </section>
  );
}
