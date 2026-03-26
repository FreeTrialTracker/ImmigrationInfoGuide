'use client';

import { useRouter } from 'next/navigation';
import { useEffect } from 'react';
import { ArrowLeft } from 'lucide-react';

interface BackNavigationProps {
  fallbackUrl?: string;
  label?: string;
  className?: string;
}

export default function BackNavigation({
  fallbackUrl = '/',
  label = 'Back',
  className = '',
}: BackNavigationProps) {
  const router = useRouter();

  useEffect(() => {
    if (typeof window !== 'undefined') {
      sessionStorage.setItem('lastPage', window.location.pathname);
    }
  }, []);

  function handleBack() {
    if (typeof window === 'undefined') return;

    const referrer = document.referrer;
    const isSameOrigin = referrer && referrer.startsWith(window.location.origin);
    const hasHistory = window.history.length > 1 && isSameOrigin;

    if (hasHistory) {
      router.back();
    } else {
      const stored = sessionStorage.getItem('lastPage');
      if (stored && stored !== window.location.pathname) {
        router.push(stored);
      } else {
        router.push(fallbackUrl);
      }
    }
  }

  return (
    <button
      onClick={handleBack}
      className={`inline-flex items-center gap-2 text-sm font-medium text-slate-600 hover:text-slate-900 transition-colors py-2 pr-3 rounded-md hover:bg-slate-100 active:bg-slate-200 ${className}`}
    >
      <ArrowLeft className="w-4 h-4 flex-shrink-0" />
      <span>{label}</span>
    </button>
  );
}
