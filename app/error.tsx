'use client';

import { useEffect } from 'react';
import Link from 'next/link';
import { TriangleAlert as AlertTriangle, RefreshCw, Chrome as Home } from 'lucide-react';

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  useEffect(() => {
    if (process.env.NODE_ENV === 'development') {
      console.error('Application error:', error);
    }
  }, [error]);

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
      <div className="max-w-md w-full text-center">
        <div className="inline-flex items-center justify-center w-16 h-16 bg-red-100 rounded-full mb-6">
          <AlertTriangle className="w-8 h-8 text-red-600" />
        </div>

        <h1 className="text-2xl font-bold text-gray-900 mb-3">
          Something went wrong
        </h1>
        <p className="text-gray-600 mb-8">
          We encountered an unexpected error. Please try again or return to the homepage.
        </p>

        <div className="flex flex-col sm:flex-row gap-3 justify-center">
          <button
            onClick={() => reset()}
            className="inline-flex items-center justify-center gap-2 px-5 py-2.5 bg-brand-primary text-white rounded-md font-medium hover:bg-indigo-700 transition-colors"
          >
            <RefreshCw className="w-4 h-4" />
            Try Again
          </button>
          <Link
            href="/"
            className="inline-flex items-center justify-center gap-2 px-5 py-2.5 border border-gray-300 text-gray-700 rounded-md font-medium hover:bg-gray-100 transition-colors"
          >
            <Home className="w-4 h-4" />
            Return Home
          </Link>
        </div>

        {process.env.NODE_ENV === 'development' && error?.digest && (
          <p className="mt-6 text-xs text-gray-400 font-mono">
            Error digest: {error.digest}
          </p>
        )}
      </div>
    </div>
  );
}
