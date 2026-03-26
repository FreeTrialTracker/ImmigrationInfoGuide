'use client';

import Link from 'next/link';
import Image from 'next/image';
import { useState, useEffect } from 'react';
import { Compass, BookOpen, Wrench, ChevronDown, Search, FolderOpen, FileText, Plane, ExternalLink } from 'lucide-react';
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from '@/components/ui/popover';
import { Input } from '@/components/ui/input';
import { COUNTRIES_52 } from '@/data/countries52';

export default function Header() {
  const [isScrolled, setIsScrolled] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [isOpen, setIsOpen] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 0);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const filteredCountries = COUNTRIES_52.filter((country) =>
    country.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <header
      className={`sticky top-0 z-50 border-b border-gray-200 bg-white transition-shadow ${
        isScrolled ? 'shadow-sm' : ''
      }`}
    >
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex h-16 items-center justify-between">
          <Link href="/" className="flex items-center gap-2 text-lg font-semibold text-gray-900 hover:text-brand-primary transition-colors">
            <Image
              src="/IMMIGRATION_INFO_NEW_FAVICON.png"
              alt="ImmigrationInfoGuide.com Logo"
              width={32}
              height={32}
              className="w-8 h-8"
            />
            <span>Immigration<span style={{ color: '#6366f1' }}>Info</span>Guide.com</span>
          </Link>

          <nav className="hidden md:flex items-center space-x-8">
            <Link
              href="/path-finder"
              className="flex items-center gap-2 text-sm font-medium text-gray-700 hover:text-brand-primary transition-colors"
            >
              <Compass className="w-4 h-4" />
              Path Finder
            </Link>
            <Link
              href="/immigration-guides"
              className="flex items-center gap-2 text-sm font-medium text-gray-700 hover:text-brand-primary transition-colors"
            >
              <BookOpen className="w-4 h-4" />
              Immigration Guides
            </Link>
            <Link
              href="/tools"
              className="flex items-center gap-2 text-sm font-medium text-gray-700 hover:text-brand-primary transition-colors"
            >
              <Wrench className="w-4 h-4" />
              Tools
            </Link>
            <Link
              href="/resources"
              className="flex items-center gap-2 text-sm font-medium text-gray-700 hover:text-brand-primary transition-colors"
            >
              <FolderOpen className="w-4 h-4" />
              Resources
            </Link>
            <Popover>
              <PopoverTrigger asChild>
                <button
                  className="flex items-center gap-1.5 text-sm font-medium text-gray-700 hover:text-brand-primary transition-colors border border-gray-200 hover:border-brand-primary/40 rounded-md px-3 py-1.5"
                  aria-label="Sister sites"
                >
                  <ExternalLink className="w-3.5 h-3.5" aria-hidden="true" />
                  Sister Sites
                  <ChevronDown className="w-3.5 h-3.5" aria-hidden="true" />
                </button>
              </PopoverTrigger>
              <PopoverContent className="w-72 p-0" align="end">
                <div className="p-3 border-b bg-gray-50">
                  <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Travel Resource Network</p>
                </div>
                <div className="p-2 space-y-1">
                  <a
                    href="https://www.visainfoguide.com"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-start gap-3 px-3 py-3 rounded-md hover:bg-sky-50 transition-colors group"
                  >
                    <div className="flex-shrink-0 w-8 h-8 bg-sky-100 rounded-md flex items-center justify-center mt-0.5">
                      <FileText className="w-4 h-4 text-sky-600" />
                    </div>
                    <div>
                      <p className="text-sm font-semibold text-gray-900 group-hover:text-sky-700">VisaInfoGuide.com</p>
                      <p className="text-xs text-gray-500 mt-0.5">Tourist & short-stay visa requirements</p>
                    </div>
                  </a>
                  <a
                    href="https://www.restinairport.com"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-start gap-3 px-3 py-3 rounded-md hover:bg-sky-50 transition-colors group"
                  >
                    <div className="flex-shrink-0 w-8 h-8 bg-sky-100 rounded-md flex items-center justify-center mt-0.5">
                      <Plane className="w-4 h-4 text-sky-600" />
                    </div>
                    <div>
                      <p className="text-sm font-semibold text-gray-900 group-hover:text-sky-700">RestInAirport.com</p>
                      <p className="text-xs text-gray-500 mt-0.5">Airport hotels, layover & transit stays</p>
                    </div>
                  </a>
                </div>
              </PopoverContent>
            </Popover>

            <Popover open={isOpen} onOpenChange={setIsOpen}>
              <PopoverTrigger asChild>
                <button
                  className="flex items-center gap-2 text-sm font-medium text-gray-700 hover:text-brand-primary transition-colors"
                  aria-label="Open country finder"
                  aria-haspopup="dialog"
                  aria-expanded={isOpen}
                >
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
                    <circle cx="12" cy="12" r="10" />
                    <path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
                    <path d="M2 12h20" />
                  </svg>
                  Country Finder
                  <ChevronDown className="w-4 h-4" aria-hidden="true" />
                </button>
              </PopoverTrigger>
              <PopoverContent className="w-80 p-0" align="end">
                <div className="p-3 border-b">
                  <div className="relative">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <Input
                      type="text"
                      placeholder="Search country or passport..."
                      value={searchQuery}
                      onChange={(e) => setSearchQuery(e.target.value)}
                      className="pl-10"
                    />
                  </div>
                </div>
                <div className="max-h-96 overflow-y-auto">
                  {filteredCountries.length > 0 ? (
                    <div className="py-2">
                      {filteredCountries.map((country) => (
                        <Link
                          key={country.slug}
                          href={`/immigrate-to/${country.slug}`}
                          className="block px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50 hover:text-brand-primary transition-colors"
                          onClick={() => {
                            setIsOpen(false);
                            setSearchQuery('');
                          }}
                        >
                          {country.name}
                        </Link>
                      ))}
                    </div>
                  ) : (
                    <div className="px-4 py-8 text-center text-sm text-gray-500">
                      No countries found
                    </div>
                  )}
                </div>
              </PopoverContent>
            </Popover>
          </nav>
        </div>
      </div>
    </header>
  );
}
