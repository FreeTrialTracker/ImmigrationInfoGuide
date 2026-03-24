import { Globe } from 'lucide-react';

const anchorVariants = [
  { text: 'check visa requirements', href: 'https://visainfoguide.com' },
  { text: 'visa rules by passport', href: 'https://visainfoguide.com' },
  { text: 'entry visa requirements', href: 'https://visainfoguide.com' },
  { text: 'travel visa rules', href: 'https://visainfoguide.com' },
];

interface VisaEntryNoticeProps {
  countryName?: string;
  variantIndex?: number;
}

export default function VisaEntryNotice({ countryName, variantIndex = 0 }: VisaEntryNoticeProps) {
  const anchor = anchorVariants[variantIndex % anchorVariants.length];

  return (
    <div className="my-8 rounded-xl border border-teal-200 bg-teal-50 p-5 sm:p-6">
      <div className="flex items-start gap-4">
        <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-teal-100 flex items-center justify-center mt-0.5">
          <Globe className="w-5 h-5 text-teal-700" />
        </div>

        <div className="flex-1 min-w-0">
          <h3 className="text-base font-semibold text-teal-900 mb-2">
            Check Entry Visa Requirements
          </h3>

          <p className="text-sm text-teal-800 leading-relaxed mb-3">
            Before relocating{countryName ? ` to ${countryName}` : ' abroad'}, you must first
            enter the country under the correct short-term visa or entry permission. Arriving on
            the wrong visa status — for example a standard tourist entry when you intend to work
            or enroll in study — can affect your ability to convert to a long-term permit or
            residency. Visa eligibility depends on:
          </p>

          <ul className="text-sm text-teal-800 space-y-1 mb-4 pl-4">
            <li className="flex items-start gap-2">
              <span className="mt-1.5 w-1.5 h-1.5 rounded-full bg-teal-500 flex-shrink-0" />
              <span>
                <strong className="font-semibold">Nationality</strong> — your passport country
                determines which bilateral visa-free or visa-on-arrival agreements apply
              </span>
            </li>
            <li className="flex items-start gap-2">
              <span className="mt-1.5 w-1.5 h-1.5 rounded-full bg-teal-500 flex-shrink-0" />
              <span>
                <strong className="font-semibold">Destination country</strong> — each country
                sets its own entry rules, permitted stays, and extension policies
              </span>
            </li>
            <li className="flex items-start gap-2">
              <span className="mt-1.5 w-1.5 h-1.5 rounded-full bg-teal-500 flex-shrink-0" />
              <span>
                <strong className="font-semibold">Length of stay</strong> — short-stay rules
                (30, 60, or 90 days) differ from long-stay immigration permits
              </span>
            </li>
            <li className="flex items-start gap-2">
              <span className="mt-1.5 w-1.5 h-1.5 rounded-full bg-teal-500 flex-shrink-0" />
              <span>
                <strong className="font-semibold">Purpose of travel</strong> — tourism,
                employment, study, and investment each require separate permit categories
              </span>
            </li>
          </ul>

          <a
            href={anchor.href}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 text-sm font-semibold text-white bg-teal-600 hover:bg-teal-700 px-4 py-2 rounded-lg transition-colors"
          >
            {anchor.text.charAt(0).toUpperCase() + anchor.text.slice(1)}
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="14"
              height="14"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
              aria-hidden="true"
            >
              <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6" />
              <polyline points="15 3 21 3 21 9" />
              <line x1="10" y1="14" x2="21" y2="3" />
            </svg>
          </a>
        </div>
      </div>
    </div>
  );
}
