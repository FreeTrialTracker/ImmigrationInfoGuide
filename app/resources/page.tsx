'use client';

import Link from 'next/link';
import { BookOpen, ExternalLink, SquareCheck as CheckSquare, Clock, Search, ChevronDown, ChevronUp, FileText, Briefcase, GraduationCap, Chrome as Home, Globe, TrendingUp, TriangleAlert as AlertTriangle, X, type LucideIcon } from 'lucide-react';
import { useState, useMemo, useEffect, useCallback } from 'react';
import { supabase } from '@/lib/supabaseClient';
import { officialLinks, regionColors, linkTypeColors, ALL_REGIONS } from '@/data/resourcesOfficialLinks';
import { checklistsData, checklistColorMap, type ChecklistData } from '@/data/resourcesChecklists';
import { timelines, speedConfig, TIMELINE_REGIONS } from '@/data/resourcesTimelines';

const CHECKLIST_ICON_MAP: Record<string, LucideIcon> = {
  Briefcase,
  GraduationCap,
  Home,
  Globe,
  FileText,
  TrendingUp,
};

type Checklist = ChecklistData & { icon: LucideIcon };

const checklists: Checklist[] = checklistsData.map((cl) => ({
  ...cl,
  icon: CHECKLIST_ICON_MAP[cl.iconName] ?? FileText,
}));

const categories = [
  {
    id: 'gov-links',
    icon: ExternalLink,
    title: 'Official Government Links',
    description: 'Direct links to immigration authorities and official application portals',
    color: 'teal',
    available: true,
  },
  {
    id: 'checklists',
    icon: CheckSquare,
    title: 'Application Checklists',
    description: 'Step-by-step document checklists for common immigration pathways',
    color: 'blue',
    available: true,
  },
  {
    id: 'timelines',
    icon: Clock,
    title: 'Processing Timelines',
    description: 'Expected processing times for different visa and permit types by country',
    color: 'amber',
    available: true,
  },
  {
    id: 'requirements',
    icon: BookOpen,
    title: 'Requirements Database',
    description: 'Comprehensive database of documentation and eligibility requirements',
    color: 'green',
    available: true,
  },
];

type RequirementItem = {
  id: string;
  category_id: string;
  label: string;
  detail: string | null;
  is_mandatory: boolean;
  condition: string | null;
  sort_order: number;
};

type VisaRequirement = {
  id: string;
  country: string;
  country_slug: string;
  region: string;
  visa_type: string;
  visa_category: string;
  difficulty: 'easy' | 'moderate' | 'hard';
  min_age: number | null;
  max_age: number | null;
  min_income_usd: number | null;
  min_savings_usd: number | null;
  language_required: string | null;
  health_insurance_required: boolean;
  criminal_check_required: boolean;
  medical_exam_required: boolean;
  job_offer_required: boolean;
  sponsor_required: boolean;
  notes: string | null;
  items?: RequirementItem[];
};

const REQ_CATEGORY_LABELS: Record<string, { label: string; color: string }> = {
  identity:      { label: 'Identity & Travel',          color: 'bg-slate-100 text-slate-700' },
  financial:     { label: 'Financial Proof',             color: 'bg-green-100 text-green-700' },
  employment:    { label: 'Employment & Skills',         color: 'bg-blue-100 text-blue-700' },
  education:     { label: 'Education',                   color: 'bg-teal-100 text-teal-700' },
  health:        { label: 'Health & Insurance',          color: 'bg-rose-100 text-rose-700' },
  legal:         { label: 'Legal & Background',          color: 'bg-orange-100 text-orange-700' },
  language:      { label: 'Language',                    color: 'bg-amber-100 text-amber-700' },
  accommodation: { label: 'Accommodation',               color: 'bg-cyan-100 text-cyan-700' },
  family:        { label: 'Family',                      color: 'bg-pink-100 text-pink-700' },
  other:         { label: 'Other',                       color: 'bg-gray-100 text-gray-600' },
};

const DIFFICULTY_CONFIG = {
  easy:     { label: 'Straightforward', color: 'bg-green-100 text-green-700',  dot: 'bg-green-500' },
  moderate: { label: 'Moderate',        color: 'bg-amber-100 text-amber-700',  dot: 'bg-amber-500' },
  hard:     { label: 'Complex',         color: 'bg-red-100 text-red-700',      dot: 'bg-red-500'   },
};

const VISA_CATEGORIES = [
  { id: 'all',       label: 'All Types' },
  { id: 'work',      label: 'Work' },
  { id: 'study',     label: 'Study' },
  { id: 'residency', label: 'Residency' },
  { id: 'nomad',     label: 'Digital Nomad' },
  { id: 'investor',  label: 'Investor' },
  { id: 'family',    label: 'Family' },
];

const REQ_REGIONS = ['All Regions', 'Europe', 'North America', 'Oceania', 'Asia', 'Middle East', 'Latin America'];

export default function ResourcesPage() {
  const [activeSection, setActiveSection] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const [region, setRegion] = useState('All Regions');
  const [expandedLinks, setExpandedLinks] = useState<string[]>([]);
  const [activeChecklist, setActiveChecklist] = useState<string | null>(null);
  const [checkedItems, setCheckedItems] = useState<Set<string>>(new Set());
  const [notNeededItems, setNotNeededItems] = useState<Set<string>>(new Set());
  const [timelineSearch, setTimelineSearch] = useState('');
  const [timelineRegion, setTimelineRegion] = useState('All Regions');
  const [timelineSpeedFilter, setTimelineSpeedFilter] = useState<string>('All');
  const [expandedCountry, setExpandedCountry] = useState<string | null>(null);

  const [reqVisas, setReqVisas] = useState<VisaRequirement[]>([]);
  const [reqLoading, setReqLoading] = useState(false);
  const [reqSearch, setReqSearch] = useState('');
  const [reqRegion, setReqRegion] = useState('All Regions');
  const [reqCategory, setReqCategory] = useState('all');
  const [reqDifficulty, setReqDifficulty] = useState('all');
  const [selectedVisa, setSelectedVisa] = useState<VisaRequirement | null>(null);
  const [loadingItems, setLoadingItems] = useState(false);

  const fetchRequirements = useCallback(async () => {
    setReqLoading(true);
    const { data } = await supabase
      .from('visa_requirements')
      .select('*')
      .order('country')
      .order('visa_category');
    setReqVisas((data as VisaRequirement[]) || []);
    setReqLoading(false);
  }, []);

  useEffect(() => {
    if (activeSection === 'requirements' && reqVisas.length === 0) {
      fetchRequirements();
    }
  }, [activeSection, fetchRequirements, reqVisas.length]);

  const fetchVisaItems = useCallback(async (visa: VisaRequirement) => {
    if (visa.items) { setSelectedVisa(visa); return; }
    setLoadingItems(true);
    setSelectedVisa({ ...visa, items: [] });
    const { data } = await supabase
      .from('requirement_items')
      .select('*')
      .eq('visa_requirement_id', visa.id)
      .order('category_id')
      .order('sort_order');
    const updated = { ...visa, items: (data as RequirementItem[]) || [] };
    setReqVisas((prev) => prev.map((v) => v.id === visa.id ? updated : v));
    setSelectedVisa(updated);
    setLoadingItems(false);
  }, []);

  const filteredReqVisas = useMemo(() => {
    return reqVisas.filter((v) => {
      const matchSearch = reqSearch === '' ||
        v.country.toLowerCase().includes(reqSearch.toLowerCase()) ||
        v.visa_type.toLowerCase().includes(reqSearch.toLowerCase());
      const matchRegion = reqRegion === 'All Regions' || v.region === reqRegion;
      const matchCat = reqCategory === 'all' || v.visa_category === reqCategory;
      const matchDiff = reqDifficulty === 'all' || v.difficulty === reqDifficulty;
      return matchSearch && matchRegion && matchCat && matchDiff;
    });
  }, [reqVisas, reqSearch, reqRegion, reqCategory, reqDifficulty]);

  const toggleChecked = (key: string) => {
    setCheckedItems((prev) => {
      const next = new Set(prev);
      next.has(key) ? next.delete(key) : next.add(key);
      return next;
    });
    setNotNeededItems((prev) => { const next = new Set(prev); next.delete(key); return next; });
  };

  const toggleNotNeeded = (key: string) => {
    setNotNeededItems((prev) => {
      const next = new Set(prev);
      next.has(key) ? next.delete(key) : next.add(key);
      return next;
    });
    setCheckedItems((prev) => { const next = new Set(prev); next.delete(key); return next; });
  };

  const filtered = useMemo(() => {
    return officialLinks.filter((c) => {
      const matchesSearch = c.country.toLowerCase().includes(search.toLowerCase());
      const matchesRegion = region === 'All Regions' || c.region === region;
      return matchesSearch && matchesRegion;
    });
  }, [search, region]);

  const toggleExpand = (country: string) => {
    setExpandedLinks((prev) =>
      prev.includes(country) ? prev.filter((c) => c !== country) : [...prev, country]
    );
  };

  const handleCardClick = (id: string, available: boolean) => {
    if (!available) return;
    setActiveSection((prev) => (prev === id ? null : id));
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="text-center mb-10">
          <h1 className="text-3xl font-bold text-gray-900 mb-3">Immigration Resources</h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Essential tools and information to help you plan and execute your immigration journey.
          </p>
        </div>

        {/* 4-card grid */}
        <div className="grid md:grid-cols-2 gap-5 mb-6">
          {categories.map((category) => {
            const Icon = category.icon;
            const isActive = activeSection === category.id;
            return (
              <div
                key={category.id}
                onClick={() => handleCardClick(category.id, category.available)}
                className={`bg-white rounded-xl border p-6 transition-all ${
                  category.available
                    ? 'cursor-pointer hover:shadow-md ' + (isActive
                        ? (category.id === 'checklists' ? 'border-blue-400 shadow-md ring-1 ring-blue-300' : category.id === 'timelines' ? 'border-amber-400 shadow-md ring-1 ring-amber-300' : category.id === 'requirements' ? 'border-green-400 shadow-md ring-1 ring-green-300' : 'border-teal-400 shadow-md ring-1 ring-teal-300')
                        : (category.id === 'checklists' ? 'border-gray-200 hover:border-blue-300' : category.id === 'timelines' ? 'border-gray-200 hover:border-amber-300' : category.id === 'requirements' ? 'border-gray-200 hover:border-green-300' : 'border-gray-200 hover:border-teal-300'))
                    : 'border-gray-200'
                }`}
              >
                <div className={`inline-flex p-3 rounded-lg mb-4 ${
                  category.color === 'teal' ? 'bg-teal-50' :
                  category.color === 'blue' ? 'bg-blue-50' :
                  category.color === 'amber' ? 'bg-amber-50' : 'bg-green-50'
                }`}>
                  <Icon className={`h-6 w-6 ${
                    category.color === 'teal' ? 'text-teal-600' :
                    category.color === 'blue' ? 'text-blue-600' :
                    category.color === 'amber' ? 'text-amber-600' : 'text-green-600'
                  }`} />
                </div>
                <h2 className="text-lg font-semibold text-gray-900 mb-2">{category.title}</h2>
                <p className="text-sm text-gray-600 mb-4">{category.description}</p>
                {category.available ? (
                  <div className={`flex items-center gap-1.5 text-sm font-medium ${isActive ? 'text-gray-500' : category.id === 'checklists' ? 'text-blue-600' : category.id === 'timelines' ? 'text-amber-600' : category.id === 'requirements' ? 'text-green-600' : 'text-teal-600'}`}>
                    {isActive ? (
                      <><ChevronUp className="h-4 w-4" />Hide</>
                    ) : category.id === 'checklists' ? (
                      <><ChevronDown className="h-4 w-4" />View {checklists.length} checklists</>
                    ) : category.id === 'timelines' ? (
                      <><ChevronDown className="h-4 w-4" />View {timelines.length} countries</>
                    ) : category.id === 'requirements' ? (
                      <><ChevronDown className="h-4 w-4" />Browse visa requirements</>
                    ) : (
                      <><ChevronDown className="h-4 w-4" />View all {officialLinks.length} countries</>
                    )}
                  </div>
                ) : (
                  <div className="text-sm text-gray-400 font-medium">Coming soon</div>
                )}
              </div>
            );
          })}
        </div>

        {/* Application Checklists expanded panel */}
        {activeSection === 'checklists' && (
          <div className="bg-white rounded-xl border border-blue-300 shadow-sm mb-8 ring-1 ring-blue-200">
            <div className="px-6 py-5 border-b border-gray-100">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-base font-semibold text-gray-900">Application Checklists</h3>
                  <p className="text-sm text-gray-500 mt-0.5">
                    Select a visa type to view the required documents. Check items off as you gather them.
                  </p>
                </div>
                <button
                  onClick={() => { setActiveSection(null); setActiveChecklist(null); setCheckedItems(new Set()); }}
                  className="text-gray-400 hover:text-gray-600 transition-colors p-1 rounded-lg hover:bg-gray-100"
                  aria-label="Close"
                >
                  <ChevronUp className="h-5 w-5" />
                </button>
              </div>
            </div>

            <div className="p-4 sm:p-6">
              {/* Checklist selector cards */}
              <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3 mb-6">
                {checklists.map((cl) => {
                  const Icon = cl.icon;
                  const colors = checklistColorMap[cl.color];
                  const isSelected = activeChecklist === cl.id;
                  const total = cl.sections.reduce((acc, s) => acc + s.items.length, 0);
                  const done = cl.sections.reduce((acc, s) =>
                    acc + s.items.filter((_, i) => {
                      const k = `${cl.id}-${s.title}-${i}`;
                      return checkedItems.has(k) || notNeededItems.has(k);
                    }).length, 0);
                  return (
                    <button
                      key={cl.id}
                      onClick={() => setActiveChecklist(isSelected ? null : cl.id)}
                      className={`text-left rounded-lg border p-4 transition-all ${
                        isSelected
                          ? `${colors.border} bg-white shadow-sm ring-1 ${colors.border}`
                          : 'border-gray-200 hover:border-gray-300 hover:shadow-sm bg-gray-50'
                      }`}
                    >
                      <div className="flex items-start justify-between mb-2">
                        <div className={`inline-flex p-2 rounded-md ${colors.bg}`}>
                          <Icon className={`h-4 w-4 ${colors.text}`} />
                        </div>
                        <div className="flex items-center gap-1.5">
                          {cl.badge && (
                            <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${colors.badge}`}>{cl.badge}</span>
                          )}
                          {done > 0 && (
                            <span className="text-xs font-medium px-2 py-0.5 rounded-full bg-gray-100 text-gray-600">{done}/{total}</span>
                          )}
                        </div>
                      </div>
                      <div className="text-sm font-semibold text-gray-900 mb-1">{cl.title}</div>
                      <div className="text-xs text-gray-500 leading-snug">{cl.subtitle}</div>
                      {done > 0 && (
                        <div className="mt-3 h-1.5 bg-gray-100 rounded-full overflow-hidden">
                          <div
                            className={`h-full rounded-full transition-all ${colors.bg.replace('bg-', 'bg-').replace('-50', '-400')}`}
                            style={{ width: `${(done / total) * 100}%` }}
                          />
                        </div>
                      )}
                    </button>
                  );
                })}
              </div>

              {/* Active checklist detail */}
              {activeChecklist && (() => {
                const cl = checklists.find((c) => c.id === activeChecklist)!;
                const colors = checklistColorMap[cl.color];
                const total = cl.sections.reduce((acc, s) => acc + s.items.length, 0);
                const done = cl.sections.reduce((acc, s) =>
                  acc + s.items.filter((_, i) => {
                    const k = `${cl.id}-${s.title}-${i}`;
                    return checkedItems.has(k) || notNeededItems.has(k);
                  }).length, 0);
                return (
                  <div className={`rounded-xl border ${colors.border} overflow-hidden`}>
                    <div className={`px-5 py-4 ${colors.bg} border-b ${colors.border} flex items-center justify-between`}>
                      <div className="flex items-center gap-3">
                        <cl.icon className={`h-5 w-5 ${colors.text}`} />
                        <div>
                          <div className="font-semibold text-gray-900 text-sm">{cl.title} Checklist</div>
                          <div className="text-xs text-gray-500">{done} of {total} items gathered</div>
                        </div>
                      </div>
                      {done > 0 && (
                        <button
                          onClick={() => {
                            const keys = cl.sections.flatMap((s) =>
                              s.items.map((_, i) => `${cl.id}-${s.title}-${i}`)
                            );
                            setCheckedItems((prev) => {
                              const next = new Set(prev);
                              keys.forEach((k) => next.delete(k));
                              return next;
                            });
                            setNotNeededItems((prev) => {
                              const next = new Set(prev);
                              keys.forEach((k) => next.delete(k));
                              return next;
                            });
                          }}
                          className="text-xs text-gray-400 hover:text-gray-600 transition-colors"
                        >
                          Reset
                        </button>
                      )}
                    </div>
                    <div className="divide-y divide-gray-100">
                      {cl.sections.map((section) => (
                        <div key={section.title} className="px-5 py-4">
                          <div className="flex items-center mb-3">
                            <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider flex-1">{section.title}</h4>
                            <span className="text-xs text-gray-400 font-medium w-16 text-center flex-shrink-0">Gathered</span>
                            <span className="text-xs text-gray-400 font-medium w-16 text-center flex-shrink-0">Not needed</span>
                          </div>
                          <ul className="space-y-2.5">
                            {section.items.map((item, i) => {
                              const key = `${cl.id}-${section.title}-${i}`;
                              const isChecked = checkedItems.has(key);
                              const isNotNeeded = notNeededItems.has(key);
                              const isDimmed = isChecked || isNotNeeded;
                              return (
                                <li key={key} className="flex items-start">
                                  <div className="flex-1 min-w-0 pr-2">
                                    <span className={`text-sm font-medium leading-snug transition-colors ${isDimmed ? 'text-gray-400 line-through' : 'text-gray-800'}`}>
                                      {item.label}
                                    </span>
                                    {item.detail && !isDimmed && (
                                      <p className="text-xs text-gray-400 mt-0.5 leading-snug">{item.detail}</p>
                                    )}
                                  </div>
                                  {/* Gathered checkbox - centered in w-16 column */}
                                  <div className="w-16 flex-shrink-0 flex justify-center mt-0.5">
                                    <div
                                      role="checkbox"
                                      aria-checked={isChecked}
                                      tabIndex={0}
                                      onClick={() => toggleChecked(key)}
                                      onKeyDown={(e) => e.key === ' ' && toggleChecked(key)}
                                      className={`w-4 h-4 rounded border-2 flex items-center justify-center transition-all cursor-pointer ${
                                        isChecked
                                          ? `${colors.bg.replace('-50', '-500')} border-transparent`
                                          : 'border-gray-300 bg-white hover:border-gray-400'
                                      }`}
                                    >
                                      {isChecked && (
                                        <svg className="w-2.5 h-2.5 text-white" fill="none" viewBox="0 0 10 10">
                                          <path d="M1.5 5.5L4 8L8.5 2.5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                        </svg>
                                      )}
                                    </div>
                                  </div>
                                  {/* Not needed checkbox - centered in w-16 column */}
                                  <div className="w-16 flex-shrink-0 flex justify-center mt-0.5">
                                    <div
                                      role="checkbox"
                                      aria-checked={isNotNeeded}
                                      tabIndex={0}
                                      onClick={() => toggleNotNeeded(key)}
                                      onKeyDown={(e) => e.key === ' ' && toggleNotNeeded(key)}
                                      className={`w-4 h-4 rounded border-2 flex items-center justify-center transition-all cursor-pointer ${
                                        isNotNeeded
                                          ? 'bg-gray-400 border-transparent'
                                          : 'border-gray-300 bg-white hover:border-gray-400'
                                      }`}
                                    >
                                      {isNotNeeded && (
                                        <svg className="w-2.5 h-2.5 text-white" fill="none" viewBox="0 0 10 10">
                                          <path d="M2 2L8 8M8 2L2 8" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
                                        </svg>
                                      )}
                                    </div>
                                  </div>
                                </li>
                              );
                            })}
                          </ul>
                        </div>
                      ))}
                    </div>
                    <div className="px-5 py-3 bg-gray-50 border-t border-gray-100">
                      <div className="flex items-center justify-between">
                        <div className="flex items-center gap-2">
                          <div className="w-32 h-1.5 bg-gray-200 rounded-full overflow-hidden">
                            <div
                              className={`h-full rounded-full transition-all duration-300 ${
                                cl.color === 'blue' ? 'bg-blue-500' :
                                cl.color === 'green' ? 'bg-green-500' :
                                cl.color === 'teal' ? 'bg-teal-500' :
                                cl.color === 'amber' ? 'bg-amber-500' :
                                cl.color === 'rose' ? 'bg-rose-500' : 'bg-yellow-500'
                              }`}
                              style={{ width: `${(done / total) * 100}%` }}
                            />
                          </div>
                          <span className="text-xs text-gray-500">{Math.round((done / total) * 100)}% complete</span>
                        </div>
                        <p className="text-xs text-gray-400">Requirements vary by country - always verify with the official authority.</p>
                      </div>
                    </div>
                  </div>
                );
              })()}
            </div>
          </div>
        )}

        {/* Processing Timelines expanded panel */}
        {activeSection === 'timelines' && (
          <div className="bg-white rounded-xl border border-amber-300 shadow-sm mb-8 ring-1 ring-amber-200">
            <div className="px-6 py-5 border-b border-gray-100">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-base font-semibold text-gray-900">Processing Timelines</h3>
                  <p className="text-sm text-gray-500 mt-0.5">
                    Typical government processing times for {timelines.length} countries. Click a country to see all visa types.
                  </p>
                </div>
                <button
                  onClick={() => { setActiveSection(null); setExpandedCountry(null); }}
                  className="text-gray-400 hover:text-gray-600 transition-colors p-1 rounded-lg hover:bg-gray-100"
                  aria-label="Close"
                >
                  <ChevronUp className="h-5 w-5" />
                </button>
              </div>

              {/* Filters */}
              <div className="mt-4 flex flex-col sm:flex-row gap-3">
                <div className="relative flex-1">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400" />
                  <input
                    type="text"
                    placeholder="Search by country..."
                    value={timelineSearch}
                    onChange={(e) => { setTimelineSearch(e.target.value); setExpandedCountry(null); }}
                    className="w-full pl-9 pr-4 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-400 bg-gray-50"
                  />
                </div>
                <select
                  value={timelineRegion}
                  onChange={(e) => { setTimelineRegion(e.target.value); setExpandedCountry(null); }}
                  className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-400 bg-gray-50 text-gray-700"
                >
                  {TIMELINE_REGIONS.map((r) => <option key={r} value={r}>{r}</option>)}
                </select>
                <select
                  value={timelineSpeedFilter}
                  onChange={(e) => { setTimelineSpeedFilter(e.target.value); setExpandedCountry(null); }}
                  className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-400 bg-gray-50 text-gray-700"
                >
                  <option value="All">All Speeds</option>
                  <option value="fast">Fast</option>
                  <option value="moderate">Moderate</option>
                  <option value="slow">Slow</option>
                  <option value="variable">Variable</option>
                </select>
              </div>

              {/* Speed legend */}
              <div className="mt-3 flex flex-wrap gap-3">
                {(Object.entries(speedConfig) as [string, typeof speedConfig[keyof typeof speedConfig]][]).map(([key, cfg]) => (
                  <div key={key} className="flex items-center gap-1.5">
                    <span className={`inline-block w-2 h-2 rounded-full ${cfg.dot}`} />
                    <span className="text-xs text-gray-500">{cfg.label}</span>
                  </div>
                ))}
              </div>
            </div>

            <div className="p-4 sm:p-6">
              {(() => {
                const filteredTimelines = timelines.filter((t) => {
                  const matchesSearch = t.country.toLowerCase().includes(timelineSearch.toLowerCase());
                  const matchesRegion = timelineRegion === 'All Regions' || t.region === timelineRegion;
                  const matchesSpeed = timelineSpeedFilter === 'All' || t.visaTypes.some((v) => v.speed === timelineSpeedFilter);
                  return matchesSearch && matchesRegion && matchesSpeed;
                });

                if (filteredTimelines.length === 0) {
                  return <p className="text-center text-gray-400 py-10 text-sm">No countries match your filters.</p>;
                }

                return (
                  <div className="space-y-2">
                    {filteredTimelines.map((entry) => {
                      const isExpanded = expandedCountry === entry.country;
                      const filteredVisa = timelineSpeedFilter === 'All'
                        ? entry.visaTypes
                        : entry.visaTypes.filter((v) => v.speed === timelineSpeedFilter);
                      const previewVisa = isExpanded ? filteredVisa : filteredVisa.slice(0, 2);
                      const hasMore = filteredVisa.length > 2;

                      return (
                        <div
                          key={entry.country}
                          className={`border rounded-lg transition-all ${isExpanded ? 'border-amber-300 bg-amber-50/30' : 'border-gray-200 bg-white hover:border-amber-200 hover:bg-amber-50/10'}`}
                        >
                          {/* Country header row */}
                          <button
                            onClick={() => setExpandedCountry(isExpanded ? null : entry.country)}
                            className="w-full flex items-center justify-between px-4 py-3 text-left"
                          >
                            <div className="flex items-center gap-3">
                              <Link
                                href={`/country/${entry.slug}`}
                                className="text-sm font-semibold text-gray-900 hover:text-amber-700 transition-colors"
                                onClick={(e) => e.stopPropagation()}
                              >
                                {entry.country}
                              </Link>
                              <span className={`text-xs px-2 py-0.5 rounded-full border font-medium ${regionColors[entry.region] || 'bg-gray-100 text-gray-600 border-gray-200'}`}>
                                {entry.region}
                              </span>
                              <span className="hidden sm:block text-xs text-gray-400">{filteredVisa.length} visa type{filteredVisa.length !== 1 ? 's' : ''}</span>
                            </div>
                            <div className="flex items-center gap-2">
                              <div className="hidden sm:flex gap-1">
                                {Array.from(new Set(filteredVisa.map((v) => v.speed))).map((s) => (
                                  <span key={s} className={`inline-block w-2 h-2 rounded-full ${speedConfig[s].dot}`} />
                                ))}
                              </div>
                              {isExpanded ? <ChevronUp className="h-4 w-4 text-gray-400" /> : <ChevronDown className="h-4 w-4 text-gray-400" />}
                            </div>
                          </button>

                          {/* Visa rows */}
                          <div className="px-4 pb-3 divide-y divide-gray-100">
                            {previewVisa.map((visa, i) => {
                              const cfg = speedConfig[visa.speed];
                              return (
                                <div key={i} className="py-2.5 grid grid-cols-1 sm:grid-cols-[1fr_auto_auto] gap-x-4 gap-y-1 items-start">
                                  <div>
                                    <div className="flex items-center gap-2 flex-wrap">
                                      <span className="text-sm font-medium text-gray-800">{visa.name}</span>
                                      <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${cfg.color}`}>{cfg.label}</span>
                                    </div>
                                    {visa.notes && (
                                      <p className="text-xs text-gray-400 mt-0.5 leading-snug">{visa.notes}</p>
                                    )}
                                  </div>
                                  <div className="sm:text-right">
                                    <div className="text-xs text-gray-500 mb-0.5">Standard</div>
                                    <div className="text-sm font-semibold text-gray-900">{visa.standard}</div>
                                  </div>
                                  {visa.expedited && (
                                    <div className="sm:text-right">
                                      <div className="text-xs text-gray-500 mb-0.5">Expedited</div>
                                      <div className="text-sm font-semibold text-amber-700">{visa.expedited}</div>
                                    </div>
                                  )}
                                </div>
                              );
                            })}
                            {!isExpanded && hasMore && (
                              <div className="pt-2">
                                <button
                                  onClick={() => setExpandedCountry(entry.country)}
                                  className="flex items-center gap-1 text-xs text-amber-600 hover:text-amber-800 font-medium transition-colors"
                                >
                                  <ChevronDown className="h-3.5 w-3.5" />
                                  +{filteredVisa.length - 2} more visa type{filteredVisa.length - 2 > 1 ? 's' : ''}
                                </button>
                              </div>
                            )}
                          </div>
                        </div>
                      );
                    })}
                  </div>
                );
              })()}
            </div>

            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50/50 rounded-b-xl flex items-start gap-2">
              <AlertTriangle className="h-3.5 w-3.5 text-amber-500 flex-shrink-0 mt-0.5" />
              <p className="text-xs text-gray-400">
                Processing times are estimates based on official government service standards and are subject to change. Actual times vary by applicant profile, workload, and country of application. Always verify current timelines with the relevant immigration authority.
              </p>
            </div>
          </div>
        )}

        {/* Requirements Database expanded panel */}
        {activeSection === 'requirements' && (
          <div className="bg-white rounded-xl border border-green-300 shadow-sm mb-8 ring-1 ring-green-200">
            {/* Header */}
            <div className="px-6 py-5 border-b border-gray-100">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-base font-semibold text-gray-900">Requirements Database</h3>
                  <p className="text-sm text-gray-500 mt-0.5">
                    Browse eligibility criteria and required documents for {reqVisas.length > 0 ? `${reqVisas.length} visa types` : 'major immigration pathways'} across key destinations.
                  </p>
                </div>
                <button
                  onClick={() => { setActiveSection(null); setSelectedVisa(null); }}
                  className="text-gray-400 hover:text-gray-600 transition-colors p-1 rounded-lg hover:bg-gray-100"
                  aria-label="Close"
                >
                  <ChevronUp className="h-5 w-5" />
                </button>
              </div>

              {/* Filters */}
              <div className="mt-4 flex flex-col sm:flex-row gap-3">
                <div className="relative flex-1">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400" />
                  <input
                    type="text"
                    placeholder="Search country or visa type..."
                    value={reqSearch}
                    onChange={(e) => { setReqSearch(e.target.value); setSelectedVisa(null); }}
                    className="w-full pl-9 pr-4 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400 bg-gray-50"
                  />
                </div>
                <select
                  value={reqRegion}
                  onChange={(e) => { setReqRegion(e.target.value); setSelectedVisa(null); }}
                  className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400 bg-gray-50 text-gray-700"
                >
                  {REQ_REGIONS.map((r) => <option key={r} value={r}>{r}</option>)}
                </select>
                <select
                  value={reqCategory}
                  onChange={(e) => { setReqCategory(e.target.value); setSelectedVisa(null); }}
                  className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400 bg-gray-50 text-gray-700"
                >
                  {VISA_CATEGORIES.map((c) => <option key={c.id} value={c.id}>{c.label}</option>)}
                </select>
                <select
                  value={reqDifficulty}
                  onChange={(e) => { setReqDifficulty(e.target.value); setSelectedVisa(null); }}
                  className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400 bg-gray-50 text-gray-700"
                >
                  <option value="all">All Levels</option>
                  <option value="easy">Straightforward</option>
                  <option value="moderate">Moderate</option>
                  <option value="hard">Complex</option>
                </select>
              </div>

              {/* Active filter chips */}
              {(reqSearch || reqRegion !== 'All Regions' || reqCategory !== 'all' || reqDifficulty !== 'all') && (
                <div className="mt-3 flex flex-wrap gap-2">
                  {reqSearch && (
                    <span className="inline-flex items-center gap-1 text-xs bg-green-50 text-green-700 border border-green-200 rounded-full px-2.5 py-1 font-medium">
                      &ldquo;{reqSearch}&rdquo;
                      <button onClick={() => setReqSearch('')}><X className="h-3 w-3" /></button>
                    </span>
                  )}
                  {reqRegion !== 'All Regions' && (
                    <span className="inline-flex items-center gap-1 text-xs bg-green-50 text-green-700 border border-green-200 rounded-full px-2.5 py-1 font-medium">
                      {reqRegion}
                      <button onClick={() => setReqRegion('All Regions')}><X className="h-3 w-3" /></button>
                    </span>
                  )}
                  {reqCategory !== 'all' && (
                    <span className="inline-flex items-center gap-1 text-xs bg-green-50 text-green-700 border border-green-200 rounded-full px-2.5 py-1 font-medium">
                      {VISA_CATEGORIES.find((c) => c.id === reqCategory)?.label}
                      <button onClick={() => setReqCategory('all')}><X className="h-3 w-3" /></button>
                    </span>
                  )}
                  {reqDifficulty !== 'all' && (
                    <span className="inline-flex items-center gap-1 text-xs bg-green-50 text-green-700 border border-green-200 rounded-full px-2.5 py-1 font-medium">
                      {DIFFICULTY_CONFIG[reqDifficulty as keyof typeof DIFFICULTY_CONFIG]?.label}
                      <button onClick={() => setReqDifficulty('all')}><X className="h-3 w-3" /></button>
                    </span>
                  )}
                </div>
              )}
            </div>

            <div className="p-4 sm:p-6">
              {reqLoading ? (
                <div className="py-16 text-center">
                  <div className="inline-block w-6 h-6 rounded-full border-2 border-green-500 border-t-transparent animate-spin mb-3" />
                  <p className="text-sm text-gray-400">Loading requirements database...</p>
                </div>
              ) : filteredReqVisas.length === 0 ? (
                <p className="text-center text-gray-400 py-10 text-sm">No visa types match your filters.</p>
              ) : (
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                  {/* Left: visa list */}
                  <div className="space-y-2">
                    <p className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-3">
                      {filteredReqVisas.length} visa type{filteredReqVisas.length !== 1 ? 's' : ''}
                    </p>
                    {filteredReqVisas.map((visa) => {
                      const diff = DIFFICULTY_CONFIG[visa.difficulty];
                      const isSelected = selectedVisa?.id === visa.id;
                      return (
                        <button
                          key={visa.id}
                          onClick={() => fetchVisaItems(visa)}
                          className={`w-full text-left rounded-lg border p-3.5 transition-all ${
                            isSelected
                              ? 'border-green-400 bg-green-50/60 ring-1 ring-green-300 shadow-sm'
                              : 'border-gray-200 bg-white hover:border-green-300 hover:bg-green-50/20 hover:shadow-sm'
                          }`}
                        >
                          <div className="flex items-start justify-between gap-2">
                            <div className="min-w-0 flex-1">
                              <div className="flex items-center gap-2 flex-wrap mb-1">
                                <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${regionColors[visa.region] || 'bg-gray-100 text-gray-600 border-gray-200'}`}>
                                  {visa.region}
                                </span>
                                <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${diff.color}`}>
                                  {diff.label}
                                </span>
                              </div>
                              <p className="text-sm font-semibold text-gray-900 leading-tight">{visa.visa_type}</p>
                              <p className="text-xs text-gray-500 mt-0.5">{visa.country}</p>
                            </div>
                            <ChevronDown className={`h-4 w-4 flex-shrink-0 mt-1 transition-transform ${isSelected ? 'rotate-180 text-green-600' : 'text-gray-300'}`} />
                          </div>
                          {/* Quick eligibility indicators */}
                          <div className="flex flex-wrap gap-1.5 mt-2.5">
                            {visa.job_offer_required && (
                              <span className="text-xs bg-blue-50 text-blue-600 px-2 py-0.5 rounded-full border border-blue-100">Job offer required</span>
                            )}
                            {visa.sponsor_required && (
                              <span className="text-xs bg-blue-50 text-blue-600 px-2 py-0.5 rounded-full border border-blue-100">Employer sponsor</span>
                            )}
                            {visa.min_income_usd && (
                              <span className="text-xs bg-green-50 text-green-700 px-2 py-0.5 rounded-full border border-green-100">${visa.min_income_usd.toLocaleString()}/mo min.</span>
                            )}
                            {visa.min_savings_usd && (
                              <span className="text-xs bg-green-50 text-green-700 px-2 py-0.5 rounded-full border border-green-100">${visa.min_savings_usd.toLocaleString()} savings</span>
                            )}
                            {visa.language_required && (
                              <span className="text-xs bg-amber-50 text-amber-700 px-2 py-0.5 rounded-full border border-amber-100">{visa.language_required}</span>
                            )}
                            {visa.min_age && (
                              <span className="text-xs bg-slate-50 text-slate-600 px-2 py-0.5 rounded-full border border-slate-100">Age {visa.min_age}{visa.max_age ? `-${visa.max_age}` : '+'}</span>
                            )}
                          </div>
                        </button>
                      );
                    })}
                  </div>

                  {/* Right: detail panel */}
                  <div className="lg:sticky lg:top-6 lg:self-start">
                    {!selectedVisa ? (
                      <div className="rounded-xl border border-dashed border-gray-200 bg-gray-50/50 flex flex-col items-center justify-center py-16 px-6 text-center">
                        <BookOpen className="h-8 w-8 text-gray-300 mb-3" />
                        <p className="text-sm font-medium text-gray-500">Select a visa type</p>
                        <p className="text-xs text-gray-400 mt-1">Click any row to view the full requirements list</p>
                      </div>
                    ) : (
                      <div className="rounded-xl border border-green-200 overflow-hidden">
                        {/* Detail header */}
                        <div className="bg-green-50 px-5 py-4 border-b border-green-200">
                          <div className="flex items-start justify-between gap-2">
                            <div>
                              <div className="flex items-center gap-2 flex-wrap mb-1.5">
                                <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${regionColors[selectedVisa.region] || 'bg-gray-100 text-gray-600'}`}>
                                  {selectedVisa.region}
                                </span>
                                <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${DIFFICULTY_CONFIG[selectedVisa.difficulty].color}`}>
                                  {DIFFICULTY_CONFIG[selectedVisa.difficulty].label}
                                </span>
                                <span className="text-xs font-medium px-2 py-0.5 rounded-full bg-white border border-green-200 text-green-700">
                                  {VISA_CATEGORIES.find((c) => c.id === selectedVisa.visa_category)?.label}
                                </span>
                              </div>
                              <h4 className="text-base font-bold text-gray-900">{selectedVisa.visa_type}</h4>
                              <p className="text-sm text-gray-600 mt-0.5">{selectedVisa.country}</p>
                            </div>
                            <button
                              onClick={() => setSelectedVisa(null)}
                              className="text-gray-400 hover:text-gray-600 p-1 rounded-md hover:bg-white/60 transition-colors flex-shrink-0"
                            >
                              <X className="h-4 w-4" />
                            </button>
                          </div>

                          {/* Key criteria row */}
                          <div className="mt-3 grid grid-cols-2 sm:grid-cols-3 gap-2">
                            {selectedVisa.min_age && (
                              <div className="bg-white rounded-md px-3 py-2 border border-green-100">
                                <div className="text-xs text-gray-500 mb-0.5">Age</div>
                                <div className="text-sm font-semibold text-gray-900">{selectedVisa.min_age}{selectedVisa.max_age ? `-${selectedVisa.max_age}` : '+'}</div>
                              </div>
                            )}
                            {selectedVisa.min_income_usd && (
                              <div className="bg-white rounded-md px-3 py-2 border border-green-100">
                                <div className="text-xs text-gray-500 mb-0.5">Min. Income</div>
                                <div className="text-sm font-semibold text-gray-900">${selectedVisa.min_income_usd.toLocaleString()}/mo</div>
                              </div>
                            )}
                            {selectedVisa.min_savings_usd && (
                              <div className="bg-white rounded-md px-3 py-2 border border-green-100">
                                <div className="text-xs text-gray-500 mb-0.5">Min. Savings</div>
                                <div className="text-sm font-semibold text-gray-900">${selectedVisa.min_savings_usd.toLocaleString()}</div>
                              </div>
                            )}
                            {selectedVisa.language_required && (
                              <div className="bg-white rounded-md px-3 py-2 border border-green-100">
                                <div className="text-xs text-gray-500 mb-0.5">Language</div>
                                <div className="text-sm font-semibold text-gray-900">{selectedVisa.language_required}</div>
                              </div>
                            )}
                            <div className="bg-white rounded-md px-3 py-2 border border-green-100">
                              <div className="text-xs text-gray-500 mb-0.5">Health Insurance</div>
                              <div className={`text-sm font-semibold ${selectedVisa.health_insurance_required ? 'text-rose-600' : 'text-gray-400'}`}>
                                {selectedVisa.health_insurance_required ? 'Required' : 'Not required'}
                              </div>
                            </div>
                            <div className="bg-white rounded-md px-3 py-2 border border-green-100">
                              <div className="text-xs text-gray-500 mb-0.5">Background Check</div>
                              <div className={`text-sm font-semibold ${selectedVisa.criminal_check_required ? 'text-rose-600' : 'text-gray-400'}`}>
                                {selectedVisa.criminal_check_required ? 'Required' : 'Not required'}
                              </div>
                            </div>
                          </div>

                          {selectedVisa.notes && (
                            <div className="mt-3 bg-white border border-green-100 rounded-md px-3 py-2.5 flex gap-2">
                              <AlertTriangle className="h-3.5 w-3.5 text-amber-500 flex-shrink-0 mt-0.5" />
                              <p className="text-xs text-gray-600 leading-relaxed">{selectedVisa.notes}</p>
                            </div>
                          )}
                        </div>

                        {/* Requirements list */}
                        <div className="divide-y divide-gray-100">
                          {loadingItems ? (
                            <div className="py-10 text-center">
                              <div className="inline-block w-5 h-5 rounded-full border-2 border-green-500 border-t-transparent animate-spin mb-2" />
                              <p className="text-xs text-gray-400">Loading requirements...</p>
                            </div>
                          ) : selectedVisa.items && selectedVisa.items.length > 0 ? (() => {
                            const grouped = selectedVisa.items.reduce<Record<string, RequirementItem[]>>((acc, item) => {
                              (acc[item.category_id] = acc[item.category_id] || []).push(item);
                              return acc;
                            }, {});
                            return Object.entries(grouped).map(([catId, items]) => {
                              const catInfo = REQ_CATEGORY_LABELS[catId] || { label: catId, color: 'bg-gray-100 text-gray-600' };
                              return (
                                <div key={catId} className="px-5 py-4">
                                  <div className="flex items-center gap-2 mb-3">
                                    <span className={`text-xs font-semibold px-2.5 py-1 rounded-full ${catInfo.color}`}>
                                      {catInfo.label}
                                    </span>
                                  </div>
                                  <ul className="space-y-2.5">
                                    {items.map((item) => (
                                      <li key={item.id} className="flex items-start gap-2.5">
                                        <span className={`mt-0.5 flex-shrink-0 w-1.5 h-1.5 rounded-full ${item.is_mandatory ? 'bg-green-500' : 'bg-gray-300'} mt-1.5`} />
                                        <div className="min-w-0">
                                          <span className={`text-sm leading-snug ${item.is_mandatory ? 'text-gray-800 font-medium' : 'text-gray-500'}`}>
                                            {item.label}
                                          </span>
                                          {!item.is_mandatory && (
                                            <span className="ml-1.5 text-xs text-gray-400 italic">(conditional{item.condition ? `: ${item.condition}` : ''})</span>
                                          )}
                                          {item.detail && (
                                            <p className="text-xs text-gray-400 mt-0.5 leading-snug">{item.detail}</p>
                                          )}
                                        </div>
                                      </li>
                                    ))}
                                  </ul>
                                </div>
                              );
                            });
                          })() : selectedVisa.items?.length === 0 && !loadingItems ? (
                            <div className="py-8 px-5 text-center text-sm text-gray-400">No detailed requirements available.</div>
                          ) : null}
                        </div>

                        {/* Legend footer */}
                        <div className="px-5 py-3 border-t border-gray-100 bg-gray-50/50 flex items-center gap-4 text-xs text-gray-400">
                          <span className="flex items-center gap-1.5"><span className="w-1.5 h-1.5 rounded-full bg-green-500 inline-block" />Mandatory</span>
                          <span className="flex items-center gap-1.5"><span className="w-1.5 h-1.5 rounded-full bg-gray-300 inline-block" />Conditional / may apply</span>
                        </div>
                      </div>
                    )}
                  </div>
                </div>
              )}
            </div>

            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50/50 rounded-b-xl flex items-start gap-2">
              <AlertTriangle className="h-3.5 w-3.5 text-amber-500 flex-shrink-0 mt-0.5" />
              <p className="text-xs text-gray-400">
                Requirements are based on official government guidelines and are subject to change. Always verify current requirements directly with the relevant immigration authority or a qualified immigration adviser before applying.
              </p>
            </div>
          </div>
        )}

        {/* Official Government Links expanded panel */}
        {activeSection === 'gov-links' && (
          <div className="bg-white rounded-xl border border-teal-300 shadow-sm mb-8 ring-1 ring-teal-200">
            <div className="px-6 py-5 border-b border-gray-100">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-base font-semibold text-gray-900">Official Government Links</h3>
                  <p className="text-sm text-gray-500 mt-0.5">
                    {officialLinks.length} countries - direct links to immigration authorities and application portals
                  </p>
                </div>
                <button
                  onClick={() => setActiveSection(null)}
                  className="text-gray-400 hover:text-gray-600 transition-colors p-1 rounded-lg hover:bg-gray-100"
                  aria-label="Close"
                >
                  <ChevronUp className="h-5 w-5" />
                </button>
              </div>

              {/* Search + Filter */}
              <div className="mt-4 flex flex-col sm:flex-row gap-3">
                <div className="relative flex-1">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400" />
                  <input
                    type="text"
                    placeholder="Search by country..."
                    value={search}
                    onChange={(e) => setSearch(e.target.value)}
                    className="w-full pl-9 pr-4 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400 bg-gray-50"
                  />
                </div>
                <select
                  value={region}
                  onChange={(e) => setRegion(e.target.value)}
                  className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400 bg-gray-50 text-gray-700"
                >
                  {ALL_REGIONS.map((r) => (
                    <option key={r} value={r}>{r}</option>
                  ))}
                </select>
              </div>
            </div>

            {/* Country Cards Grid */}
            <div className="p-4 sm:p-6">
              {filtered.length === 0 ? (
                <p className="text-center text-gray-400 py-10 text-sm">No countries match your search.</p>
              ) : (
                <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
                  {filtered.map((country) => {
                    const isExpanded = expandedLinks.includes(country.country);
                    const visibleLinks = isExpanded ? country.links : country.links.slice(0, 2);
                    const hasMore = country.links.length > 2;

                    return (
                      <div
                        key={country.country}
                        className="bg-gray-50 border border-gray-200 rounded-lg p-4 hover:border-teal-300 hover:bg-teal-50/30 transition-colors"
                      >
                        <div className="flex items-center mb-3">
                          <Link
                            href={`/country/${country.slug}`}
                            className="text-sm font-semibold text-gray-900 hover:text-teal-700 transition-colors"
                            onClick={(e) => e.stopPropagation()}
                          >
                            {country.country}
                          </Link>
                          <span className={`ml-2 inline-block text-xs px-2 py-0.5 rounded-full border font-medium ${regionColors[country.region] || 'bg-gray-100 text-gray-600 border-gray-200'}`}>
                            {country.region}
                          </span>
                        </div>

                        <ul className="space-y-2">
                          {visibleLinks.map((link) => (
                            <li key={link.url}>
                              <a
                                href={link.url}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex items-start gap-2 group"
                                onClick={(e) => e.stopPropagation()}
                              >
                                <ExternalLink className="h-3.5 w-3.5 mt-0.5 text-teal-500 flex-shrink-0 group-hover:text-teal-700" />
                                <div className="min-w-0">
                                  <span className="text-xs text-gray-800 group-hover:text-teal-700 transition-colors leading-snug block font-medium">
                                    {link.label}
                                  </span>
                                  <span className={`inline-block mt-0.5 text-xs px-1.5 py-0.5 rounded font-medium ${linkTypeColors[link.type] || 'bg-gray-100 text-gray-600'}`}>
                                    {link.type}
                                  </span>
                                </div>
                              </a>
                            </li>
                          ))}
                        </ul>

                        {hasMore && (
                          <button
                            onClick={(e) => { e.stopPropagation(); toggleExpand(country.country); }}
                            className="mt-3 flex items-center gap-1 text-xs text-teal-600 hover:text-teal-800 font-medium transition-colors"
                          >
                            {isExpanded ? (
                              <><ChevronUp className="h-3.5 w-3.5" />Show less</>
                            ) : (
                              <><ChevronDown className="h-3.5 w-3.5" />+{country.links.length - 2} more link{country.links.length - 2 > 1 ? 's' : ''}</>
                            )}
                          </button>
                        )}
                      </div>
                    );
                  })}
                </div>
              )}
            </div>

            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50/50 rounded-b-xl">
              <p className="text-xs text-gray-400">
                Links are verified to official government domains. Always check current visa requirements directly with the relevant authority before applying.
              </p>
            </div>
          </div>
        )}

        {/* SEO Content: How to use immigration resources */}
        <section className="mt-12 mb-10" aria-labelledby="how-to-use-resources">
          <h2 id="how-to-use-resources" className="text-2xl font-bold text-gray-900 mb-4">How to Use These Immigration Resources</h2>
          <p className="text-gray-600 leading-relaxed mb-6">
            Navigating the immigration process requires accurate, up-to-date information from reliable sources. The tools on this page are designed to give you a structured starting point for your research, helping you understand what documents you need, how long processes typically take, and where to find official guidance.
          </p>
          <div className="grid md:grid-cols-2 gap-6">
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="text-base font-semibold text-gray-900 mb-2">Start with the Requirements Database</h3>
              <p className="text-sm text-gray-600 leading-relaxed">
                Before anything else, confirm you meet the basic eligibility criteria for your target visa. The Requirements Database outlines financial thresholds, language requirements, age limits, and mandatory documents for dozens of visa types across major destination countries. Knowing your eligibility early saves time and prevents costly application mistakes.
              </p>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="text-base font-semibold text-gray-900 mb-2">Use Application Checklists to Stay Organized</h3>
              <p className="text-sm text-gray-600 leading-relaxed">
                Immigration applications often involve gathering 10 to 20 separate documents, each with specific format or certification requirements. The Application Checklists break each visa type into manageable categories so you can track your progress, mark items as gathered, and flag documents that do not apply to your situation.
              </p>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="text-base font-semibold text-gray-900 mb-2">Check Processing Times Before You Apply</h3>
              <p className="text-sm text-gray-600 leading-relaxed">
                Processing timelines vary widely by country, visa category, and time of year. The Processing Timelines tool gives you standard and expedited estimates for 42 countries, helping you plan travel, employment transitions, and housing arrangements around realistic government service standards.
              </p>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="text-base font-semibold text-gray-900 mb-2">Verify with Official Government Links</h3>
              <p className="text-sm text-gray-600 leading-relaxed">
                Information on immigration changes frequently. Fee increases, new documentation rules, and policy shifts can affect your application even after it is submitted. The Official Government Links section connects you directly to the immigration authority or application portal for each country, so you can confirm all requirements with primary sources before submitting.
              </p>
            </div>
          </div>
        </section>

        {/* SEO Content: Understanding visa types */}
        <section className="mb-10" aria-labelledby="understanding-visa-types">
          <h2 id="understanding-visa-types" className="text-2xl font-bold text-gray-900 mb-4">Understanding the Main Visa Categories</h2>
          <p className="text-gray-600 leading-relaxed mb-6">
            Immigration pathways fall into several broad categories, each designed for a different life situation. Choosing the right category is the most important decision in your immigration journey because it determines eligibility requirements, processing timelines, and long-term residency options.
          </p>
          <div className="space-y-4">
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-start gap-4">
                <div className="bg-blue-50 rounded-lg p-2.5 flex-shrink-0">
                  <Briefcase className="h-5 w-5 text-blue-600" />
                </div>
                <div>
                  <h3 className="text-base font-semibold text-gray-900 mb-1.5">Work Visas and Employment Permits</h3>
                  <p className="text-sm text-gray-600 leading-relaxed">
                    Work visas are issued to foreign nationals who have secured or are seeking employment in the destination country. Most skilled worker pathways require a job offer, employer sponsorship, or points-based assessment of your qualifications and experience. Countries like Canada, Australia, Germany, and the United Kingdom have structured points-based systems that score applicants on factors such as education, language ability, work experience, and age. Some countries also offer open work permits that allow holders to work for any employer without needing a specific job offer in advance.
                  </p>
                </div>
              </div>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-start gap-4">
                <div className="bg-teal-50 rounded-lg p-2.5 flex-shrink-0">
                  <GraduationCap className="h-5 w-5 text-teal-600" />
                </div>
                <div>
                  <h3 className="text-base font-semibold text-gray-900 mb-1.5">Student Visas</h3>
                  <p className="text-sm text-gray-600 leading-relaxed">
                    Student visas allow foreign nationals to enrol in accredited educational institutions abroad. Most countries require proof of acceptance from a recognised institution, sufficient funds to cover tuition and living expenses, and evidence of intention to return home after studies or transition to a post-study work visa. Many countries, including Australia, Canada, and the UK, now offer dedicated post-study work permits that allow graduates to gain work experience for one to three years after completing their degree.
                  </p>
                </div>
              </div>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-start gap-4">
                <div className="bg-amber-50 rounded-lg p-2.5 flex-shrink-0">
                  <Globe className="h-5 w-5 text-amber-600" />
                </div>
                <div>
                  <h3 className="text-base font-semibold text-gray-900 mb-1.5">Digital Nomad and Remote Worker Visas</h3>
                  <p className="text-sm text-gray-600 leading-relaxed">
                    More than 50 countries now offer digital nomad or remote worker visa programmes designed for location-independent professionals. These visas typically require proof of remote employment or self-employment, a minimum monthly income (commonly ranging from USD 1,500 to USD 3,500 depending on the country), and private health insurance. Popular destinations include Portugal, Spain, Germany, Thailand, Indonesia, and Costa Rica. Most digital nomad visas are valid for one to two years and can be renewed or converted to a longer-term residence permit.
                  </p>
                </div>
              </div>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-start gap-4">
                <div className="bg-green-50 rounded-lg p-2.5 flex-shrink-0">
                  <Home className="h-5 w-5 text-green-600" />
                </div>
                <div>
                  <h3 className="text-base font-semibold text-gray-900 mb-1.5">Permanent Residency and Long-Term Settlement</h3>
                  <p className="text-sm text-gray-600 leading-relaxed">
                    Permanent residency grants the right to live and work indefinitely in a country without needing to renew a visa. Most PR pathways require several years of continuous legal residence, sufficient language ability, proof of financial self-sufficiency, and a clean criminal record. Some countries offer direct PR routes for investors, skilled workers in shortage occupations, or those with family connections. Permanent residents often gain access to public healthcare, education, and social services and may be eligible for citizenship after an additional residency period.
                  </p>
                </div>
              </div>
            </div>
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <div className="flex items-start gap-4">
                <div className="bg-rose-50 rounded-lg p-2.5 flex-shrink-0">
                  <TrendingUp className="h-5 w-5 text-rose-600" />
                </div>
                <div>
                  <h3 className="text-base font-semibold text-gray-900 mb-1.5">Investor and Business Owner Visas</h3>
                  <p className="text-sm text-gray-600 leading-relaxed">
                    Investor visas are designed for individuals who can contribute capital to the destination country's economy through direct business investment, real estate purchases, or government bonds. Minimum investment thresholds range from around USD 100,000 for some Caribbean programmes to over EUR 500,000 in parts of Europe. Many investor visa programmes offer a fast route to permanent residency or citizenship. Applicants are generally required to demonstrate that their investment funds were obtained through legal means and must pass due diligence background checks.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* SEO Content: Common mistakes */}
        <section className="mb-10" aria-labelledby="common-immigration-mistakes">
          <h2 id="common-immigration-mistakes" className="text-2xl font-bold text-gray-900 mb-4">Common Immigration Application Mistakes to Avoid</h2>
          <p className="text-gray-600 leading-relaxed mb-6">
            Immigration applications are frequently refused for administrative reasons that have nothing to do with the applicant's underlying eligibility. Understanding the most common errors can significantly improve your chances of a successful outcome.
          </p>
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {[
              {
                title: 'Submitting expired documents',
                description: 'Many immigration authorities require documents such as police clearances, medical certificates, and bank statements to be issued within the last three to six months. Always check the validity requirements for each document in your checklist.',
              },
              {
                title: 'Underestimating proof of funds requirements',
                description: 'Financial thresholds vary by visa type and family size. Some countries require you to hold a set amount in a bank account for a minimum period (often 28 to 90 days) before the application date. Check specific requirements for your target pathway.',
              },
              {
                title: 'Applying in the wrong visa category',
                description: 'Applying for a tourist visa when you intend to work, or selecting the wrong stream within a points-based system, can result in refusal and may affect future applications. Use the Requirements Database to confirm the correct category before you apply.',
              },
              {
                title: 'Incomplete translation of documents',
                description: 'Most countries require certified translations of any documents not in their official language. Translations must typically be performed by a certified translator and include the translator\'s credentials. Machine translations are rarely accepted.',
              },
              {
                title: 'Missing the continuous residence requirement',
                description: 'For permanent residency applications, many countries require you to have been physically present for a minimum number of days per year. Extended overseas trips can reset or disqualify your residency clock. Track your travel dates carefully.',
              },
              {
                title: 'Not disclosing previous visa refusals',
                description: 'Most immigration applications ask whether you have previously been refused a visa to any country. Failure to disclose a prior refusal, even for a different country, can be treated as deception and lead to a ban on future applications.',
              },
            ].map((item) => (
              <div key={item.title} className="bg-white rounded-xl border border-gray-200 p-5">
                <div className="flex items-start gap-2 mb-2">
                  <span className="mt-0.5 w-2 h-2 rounded-full bg-rose-400 flex-shrink-0 mt-1.5" />
                  <h3 className="text-sm font-semibold text-gray-900">{item.title}</h3>
                </div>
                <p className="text-xs text-gray-600 leading-relaxed pl-4">{item.description}</p>
              </div>
            ))}
          </div>
        </section>

        {/* SEO Content: FAQ */}
        <section className="mb-10" aria-labelledby="immigration-resources-faq">
          <h2 id="immigration-resources-faq" className="text-2xl font-bold text-gray-900 mb-6">Frequently Asked Questions</h2>
          <div className="space-y-4">
            {[
              {
                q: 'How do I know which visa is right for my situation?',
                a: 'Start by identifying your primary goal: work, study, family reunion, retirement, investment, or long-term residency. Then consider your passport country, target destination, financial situation, and language ability. The Path Finder tool on this site can match your profile against available pathways and highlight your strongest options.',
              },
              {
                q: 'Do visa requirements differ based on my passport country?',
                a: 'Yes, significantly. Citizens of countries with strong diplomatic ties to the destination often face fewer requirements, lower fees, and shorter processing times. Some bilateral agreements reduce or waive certain requirements altogether. The Passport Country field in our cost calculator and path finder tools accounts for these differences.',
              },
              {
                q: 'How far in advance should I start preparing my immigration application?',
                a: 'For most major visa types, allow at least three to six months for document gathering, translations, and any required language tests or medical examinations. For investor visas or permanent residency applications, 12 months is a more realistic preparation window. Processing timelines on top of preparation can add several additional months.',
              },
              {
                q: 'Are the processing times shown on this site guaranteed?',
                a: 'No. Processing time estimates are based on published government service standards and are subject to change due to application volumes, staffing levels, seasonal peaks, and policy shifts. Always verify current timelines directly with the relevant immigration authority before making travel or employment arrangements.',
              },
              {
                q: 'What is the difference between a visa and a residence permit?',
                a: 'A visa is typically issued before you travel and grants permission to enter the country. A residence permit (or residence card) is issued after arrival and confirms your right to live and work in the country for a defined period. Some countries issue a combined document, while others require separate applications for entry and residence.',
              },
              {
                q: 'Can I apply for immigration on my own without a lawyer?',
                a: 'Many straightforward visa applications can be completed without legal assistance. However, complex cases involving prior refusals, gaps in employment history, criminal records, or multi-step pathways such as express entry systems benefit significantly from professional guidance. Immigration consultants and lawyers can also identify eligibility issues before you apply, reducing the risk of refusal.',
              },
            ].map((item, idx) => (
              <details key={idx} className="group bg-white rounded-xl border border-gray-200 overflow-hidden">
                <summary className="flex items-center justify-between px-6 py-4 cursor-pointer list-none hover:bg-gray-50 transition-colors">
                  <span className="text-sm font-semibold text-gray-900 pr-4">{item.q}</span>
                  <ChevronDown className="h-4 w-4 text-gray-400 flex-shrink-0 group-open:rotate-180 transition-transform" />
                </summary>
                <div className="px-6 pb-5 pt-1">
                  <p className="text-sm text-gray-600 leading-relaxed">{item.a}</p>
                </div>
              </details>
            ))}
          </div>
        </section>

        <div className="bg-teal-50 rounded-xl border border-teal-200 p-6">
          <h3 className="font-semibold text-gray-900 mb-1.5">Ready to explore immigration pathways?</h3>
          <p className="text-sm text-gray-600 mb-4">
            Use our Immigration Path Finder to discover relevant options based on your situation and goals.
          </p>
          <Link
            href="/path-finder"
            className="inline-block bg-teal-600 hover:bg-teal-700 text-white text-sm font-medium py-2 px-4 rounded-lg transition-colors"
          >
            Start Path Finder
          </Link>
        </div>
      </div>
    </div>
  );
}
