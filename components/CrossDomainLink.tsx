'use client';

import { useEffect, useState } from 'react';
import { ArrowRight } from 'lucide-react';
import { supabase } from '@/lib/supabaseClient';

interface CrossDomainLinkProps {
  countryName: string;
  countryCode?: string;
  countrySlug?: string;
  siteType: 'visa' | 'immigration';
}

const immigrationAnchorTexts = [
  'Immigration options for {country}',
  'Residency pathways in {country}',
  'Work visa requirements for {country}',
  'Permanent residence guide for {country}',
];

const visaAnchorTexts = [
  'Tourist visa requirements for {country}',
  'Entry visa rules for {country}',
  'Short-stay visa information for {country}',
];

function getRandomAnchorText(texts: string[], countryName: string): string {
  const randomIndex = Math.floor(Math.random() * texts.length);
  return texts[randomIndex].replace('{country}', countryName);
}

function isValidAbsoluteUrl(url: string): boolean {
  return url.startsWith('https://') || url.startsWith('http://');
}

export default function CrossDomainLink({
  countryName,
  countryCode,
  countrySlug,
  siteType,
}: CrossDomainLinkProps) {
  const [anchorText, setAnchorText] = useState('');
  const [targetUrl, setTargetUrl] = useState<string | null>(null);
  const [isVerifying, setIsVerifying] = useState(true);

  useEffect(() => {
    async function loadCrossLink() {
      if ((!countryCode && !countrySlug) || !countryName) {
        setIsVerifying(false);
        return;
      }

      const query = supabase
        .from('country_crosslinks')
        .select('visa_url, immigration_url')
        .eq('is_active', true);

      if (countrySlug) {
        query.eq('visa_slug', countrySlug);
      } else if (countryCode) {
        query.eq('country_code', countryCode);
      }

      const { data, error } = await query.maybeSingle();

      if (error || !data) {
        setIsVerifying(false);
        return;
      }

      const crossLinkData = data as { visa_url: string; immigration_url: string };
      const url = siteType === 'visa' ? crossLinkData.visa_url : crossLinkData.immigration_url;

      if (!isValidAbsoluteUrl(url)) {
        setIsVerifying(false);
        return;
      }

      setTargetUrl(url);

      const texts = siteType === 'visa' ? visaAnchorTexts : immigrationAnchorTexts;
      const selectedText = getRandomAnchorText(texts, countryName);
      setAnchorText(selectedText);
      setIsVerifying(false);
    }

    loadCrossLink();
  }, [countryName, countryCode, countrySlug, siteType]);

  if (isVerifying || !targetUrl) {
    return null;
  }

  if (siteType === 'visa') {
    return (
      <div className="border-t border-b border-gray-200 bg-indigo-50 py-8 my-12">
        <div className="mx-auto max-w-3xl px-4 sm:px-6 lg:px-8">
          <h3 className="text-lg font-semibold text-gray-900 mb-2">
            Visiting First?
          </h3>
          <p className="text-gray-700 mb-4">
            Before applying for residency in {countryName}, review short-stay visa requirements and entry regulations.
          </p>
          <a
            href={targetUrl}
            target="_blank"
            rel="noopener noreferrer"
                        className="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium transition-colors"
          >
            {anchorText}
            <ArrowRight className="ml-2 h-4 w-4" />
          </a>
        </div>
      </div>
    );
  }

  return (
    <div className="border-t border-b border-gray-200 bg-blue-50 py-8 my-12">
      <div className="mx-auto max-w-3xl px-4 sm:px-6 lg:px-8">
        <h3 className="text-lg font-semibold text-gray-900 mb-2">
          Planning Long-Term?
        </h3>
        <p className="text-gray-700 mb-4">
          If you are considering work, residency, or permanent relocation to {countryName}, explore detailed immigration pathways below.
        </p>
        <a
          href={targetUrl}
          target="_blank"
          rel="noopener noreferrer"
                    className="inline-flex items-center text-brand-primary hover:text-indigo-700 font-medium transition-colors"
        >
          {anchorText}
          <ArrowRight className="ml-2 h-4 w-4" />
        </a>
      </div>
    </div>
  );
}
