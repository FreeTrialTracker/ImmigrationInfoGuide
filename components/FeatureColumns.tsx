'use client';

import Link from 'next/link';
import { FileText, BookOpen, Calculator, ArrowRight } from 'lucide-react';

export default function FeatureColumns() {
  return (
    <div className="bg-white py-8">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="bg-blue-50 rounded-lg p-8 border border-blue-100">
            <div className="mb-6">
              <FileText className="h-8 w-8 text-blue-600 mb-4" />
              <h3 className="text-sm font-bold text-gray-900 mb-2 uppercase tracking-wide">
                Immigration Guides
              </h3>
              <h4 className="text-xl font-bold text-gray-900 mb-4">
                Country Immigration Hubs &amp; Pathway Guides
              </h4>
              <p className="text-sm text-gray-700 leading-relaxed">
                Research immigration routes for 52 countries. Each hub covers the main legal stay options, temporary vs. permanent distinctions, route comparisons, and eligibility themes — segmented by work, study, retirement, investment, and family.
              </p>
            </div>
            <div className="space-y-3 mb-6">
              <Link
                href="/immigration-guides"
                className="flex items-center text-sm text-gray-700 hover:text-blue-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Top Immigration Destinations
              </Link>
              <Link
                href="/immigration-guides?category=work"
                className="flex items-center text-sm text-gray-700 hover:text-blue-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Work Visa Pathways
              </Link>
              <Link
                href="/immigration-guides?category=retirement"
                className="flex items-center text-sm text-gray-700 hover:text-blue-600 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Retirement Visa Programs
              </Link>
            </div>
            <Link
              href="/immigration-guides"
              className="inline-flex items-center text-sm font-semibold text-blue-600 hover:text-blue-700 transition-colors"
            >
              View All Country Guides
              <ArrowRight className="h-4 w-4 ml-2" />
            </Link>
          </div>

          <div className="bg-gray-50 rounded-lg p-8 border border-gray-200">
            <div className="mb-6">
              <BookOpen className="h-8 w-8 text-gray-600 mb-4" />
              <h3 className="text-sm font-bold text-gray-900 mb-2 uppercase tracking-wide">
                Resources
              </h3>
              <h4 className="text-xl font-bold text-gray-900 mb-4">
                Immigration Articles, Checklists &amp; Process Guides
              </h4>
              <p className="text-sm text-gray-700 leading-relaxed">
                Practical articles covering immigration processes, document preparation, and key legal distinctions. Includes document checklists, official resource directories, and process-focused reference material.
              </p>
            </div>
            <div className="space-y-3 mb-6">
              <Link
                href="/blog"
                className="flex items-center text-sm text-gray-700 hover:text-gray-900 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Immigration Articles
              </Link>
              <Link
                href="/document-checklist"
                className="flex items-center text-sm text-gray-700 hover:text-gray-900 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Document Checklists
              </Link>
              <Link
                href="/resources"
                className="flex items-center text-sm text-gray-700 hover:text-gray-900 transition-colors"
              >
                <ArrowRight className="h-4 w-4 mr-2" />
                Official Resource Directory
              </Link>
            </div>
            <Link
              href="/blog"
              className="inline-flex items-center text-sm font-semibold text-gray-600 hover:text-gray-800 transition-colors"
            >
              View All Resources
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
                Path Finder, Cost Calculator &amp; Country Comparison
              </h4>
              <p className="text-sm text-gray-700 leading-relaxed">
                Find immigration routes based on your passport and goals. Estimate total costs by pathway including visa fees, proof-of-funds, and medical requirements. Compare two or more destination countries side by side.
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
              View All Tools
              <ArrowRight className="h-4 w-4 ml-2" />
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
