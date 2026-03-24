'use client';

import Link from 'next/link';
import { FileText, BookOpen, Calculator, ArrowRight } from 'lucide-react';

export default function FeatureColumns() {
  return (
    <div className="bg-white py-8">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="bg-indigo-50 rounded-lg p-8 border border-indigo-100">
            <div className="mb-6">
              <FileText className="h-8 w-8 text-brand-primary mb-4" />
              <h3 className="text-sm font-bold text-gray-900 mb-2 uppercase tracking-wide">
                Immigration Guides
              </h3>
              <h4 className="text-xl font-bold text-gray-900 mb-4">
                Country Immigration & Relocation Guides
              </h4>
              <p className="text-sm text-gray-700 leading-relaxed">
                Comprehensive guides for moving abroad. Explore visa requirements, work permits, cost of living, healthcare, and everything you need to relocate successfully.
              </p>
            </div>
            <div className="space-y-3 mb-6">
              <Link
                href="/immigration-guides"
                className="flex items-center text-sm text-gray-700 hover:text-brand-primary transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Popular Destinations
              </Link>
              <Link
                href="/immigration-guides"
                className="flex items-center text-sm text-gray-700 hover:text-brand-primary transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Work Visa Guides
              </Link>
              <Link
                href="/immigration-guides"
                className="flex items-center text-sm text-gray-700 hover:text-brand-primary transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Retirement Destinations
              </Link>
            </div>
            <Link
              href="/immigration-guides"
              className="inline-flex items-center text-sm font-semibold text-brand-primary hover:text-indigo-700 transition-colors"
            >
              View all Immigration Guides
              <ArrowRight className="h-4 w-4 ml-2" />
            </Link>
          </div>

          <div className="bg-blue-50 rounded-lg p-8 border border-blue-100">
            <div className="mb-6">
              <BookOpen className="h-8 w-8 text-blue-600 mb-4" />
              <h3 className="text-sm font-bold text-gray-900 mb-2 uppercase tracking-wide">
                Resources
              </h3>
              <h4 className="text-xl font-bold text-gray-900 mb-4">
                Immigration Resources & Expert Insights
              </h4>
              <p className="text-sm text-gray-700 leading-relaxed">
                Articles, checklists, and expert advice on immigration processes, document preparation, and settling abroad. Everything you need for a successful move.
              </p>
            </div>
            <div className="space-y-3 mb-6">
              <Link
                href="/blog"
                className="flex items-center text-sm text-gray-700 hover:text-blue-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Immigration Articles
              </Link>
              <Link
                href="/document-checklist"
                className="flex items-center text-sm text-gray-700 hover:text-blue-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Document Checklists
              </Link>
              <Link
                href="/resources"
                className="flex items-center text-sm text-gray-700 hover:text-blue-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Immigration Resources
              </Link>
            </div>
            <Link
              href="/blog"
              className="inline-flex items-center text-sm font-semibold text-blue-600 hover:text-blue-700 transition-colors"
            >
              View all Resources
              <ArrowRight className="h-4 w-4 ml-2" />
            </Link>
          </div>

          <div className="bg-amber-50 rounded-lg p-8 border border-amber-100">
            <div className="mb-6">
              <Calculator className="h-8 w-8 text-amber-600 mb-4" />
              <h3 className="text-sm font-bold text-gray-900 mb-2 uppercase tracking-wide">
                Tools
              </h3>
              <h4 className="text-xl font-bold text-gray-900 mb-4">
                Free Immigration Planning and Research Tools
              </h4>
              <p className="text-sm text-gray-700 leading-relaxed">
                Find your ideal immigration pathway with our free tools. Compare countries, assess eligibility, and plan your move with accurate, up-to-date information.
              </p>
            </div>
            <div className="space-y-3 mb-6">
              <Link
                href="/path-finder"
                className="flex items-center text-sm text-gray-700 hover:text-amber-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Immigration Path Finder
              </Link>
              <Link
                href="/country-finder"
                className="flex items-center text-sm text-gray-700 hover:text-amber-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Country Comparison Tool
              </Link>
              <Link
                href="/immigration-cost-calculator"
                className="flex items-center text-sm text-gray-700 hover:text-amber-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Immigration Cost Calculator
              </Link>
            </div>
            <Link
              href="/tools"
              className="inline-flex items-center text-sm font-semibold text-amber-600 hover:text-amber-700 transition-colors"
            >
              View all Tools
              <ArrowRight className="h-4 w-4 ml-2" />
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
