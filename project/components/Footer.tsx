import Link from 'next/link';
import { Mail } from 'lucide-react';

export default function Footer() {
  return (
    <footer className="bg-slate-900 mt-16">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-8 mb-8">
          <div>
            <h3 className="text-sm font-semibold text-white mb-4">
              About ImmigrationInfoGuide
            </h3>
            <p className="text-sm text-gray-400 mb-6">
              Independent immigration information database for international movers. Sister site to{' '}
              <a
                href="https://visainfoguide.com"
                target="_blank"
                rel="noopener noreferrer"
                                className="text-indigo-400 hover:text-indigo-300 transition-colors"
              >
                VisaInfoGuide.com
              </a>
              .
            </p>
            <ul className="space-y-2">
              <li>
                <Link
                  href="/about"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  About Us
                </Link>
              </li>
              <li>
                <Link
                  href="/methodology"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Methodology
                </Link>
              </li>
              <li>
                <Link
                  href="/data-sources"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Data Sources
                </Link>
              </li>
            </ul>
          </div>

          <div>
            <h3 className="text-sm font-semibold text-white mb-4">Tools</h3>
            <ul className="space-y-2">
              <li>
                <Link
                  href="/path-finder"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Immigration Path Finder
                </Link>
              </li>
              <li>
                <Link
                  href="/country-finder"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Compare Countries
                </Link>
              </li>
              <li>
                <Link
                  href="/tools"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  All Tools
                </Link>
              </li>
            </ul>
          </div>

          <div>
            <h3 className="text-sm font-semibold text-white mb-4">Research</h3>
            <ul className="space-y-2">
              <li>
                <Link
                  href="/immigration-guides"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Immigration Guides
                </Link>
              </li>
              <li>
                <Link
                  href="/resources"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Passport Rankings 2026
                </Link>
              </li>
              <li>
                <Link
                  href="/resources"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  All Research
                </Link>
              </li>
            </ul>
          </div>

          <div>
            <h3 className="text-sm font-semibold text-white mb-4">Travel Resources</h3>
            <ul className="space-y-2">
              <li>
                <Link
                  href="/global-travel-resources"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Global Travel Resources
                </Link>
              </li>
              <li>
                <a
                  href="https://visainfoguide.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Visa Requirements
                </a>
              </li>
              <li>
                <a
                  href="https://hotelinairport.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Airport Transit Hotels
                </a>
              </li>
            </ul>
          </div>

          <div>
            <h3 className="text-sm font-semibold text-white mb-4">Legal</h3>
            <ul className="space-y-2">
              <li>
                <Link
                  href="/privacy-policy"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Privacy Policy
                </Link>
              </li>
              <li>
                <Link
                  href="/terms-of-use"
                  className="text-sm text-gray-300 hover:text-indigo-400 transition-colors"
                >
                  Terms of Use
                </Link>
              </li>
            </ul>
            <p className="text-xs text-gray-500 mt-6">
              Not affiliated with any government agency.
              <br />
              Information for guidance only.
            </p>
          </div>
        </div>

        <div className="pt-8 border-t border-gray-800 flex flex-col sm:flex-row justify-between items-center">
          <p className="text-sm text-gray-500">
            © {new Date().getFullYear()} ImmigrationInfoGuide. All rights reserved.
          </p>
          <a
            href="mailto:contact@visainfoguide.com"
            className="text-sm text-gray-400 hover:text-indigo-400 transition-colors mt-4 sm:mt-0 inline-flex items-center gap-2"
          >
            <Mail className="w-4 h-4" />
            contact@visainfoguide.com
          </a>
        </div>
      </div>
    </footer>
  );
}
