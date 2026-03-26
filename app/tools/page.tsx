import Link from 'next/link';
import { Plane, Calculator, FileCheck, MapPin, ArrowRight, CircleCheck as CheckCircle2, ChevronDown, Globe, Clock, Shield, Users, TrendingUp, BookOpen } from 'lucide-react';
import type { Metadata } from 'next';
import { StructuredData } from '@/components/StructuredData';

export const metadata: Metadata = {
  title: 'Free Immigration Planning Tools | ImmigrationInfoGuide.com',
  description:
    'Use our free immigration planning tools to find the right visa pathway, estimate costs, generate document checklists, and compare countries. Trusted data for 52 countries.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/tools',
  },
  openGraph: {
    title: 'Free Immigration Planning Tools - Path Finder, Cost Calculator & More',
    description:
      'Find the right visa, estimate immigration costs, and compare countries with our free tools. Covering 52 countries and hundreds of immigration pathways.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/tools',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Free Immigration Planning Tools - Path Finder, Cost Calculator & More',
    description:
      'Find the right visa, estimate immigration costs, and compare countries with our free tools. Covering 52 countries.',
    images: ['/og-image.webp'],
  },
};

const tools = [
  {
    icon: Plane,
    title: 'Immigration Path Finder',
    description:
      'Answer a few questions about your passport, goal, and preferred destination and instantly see which immigration pathways match your profile - work visas, residency programmes, digital nomad visas, and more.',
    status: 'available',
    href: '/path-finder',
    color: 'blue',
    badge: 'Most Popular',
    features: [
      'Filters by passport nationality',
      'Matches 8 immigration goals',
      'Covers 52 destination countries',
      'Shows eligibility requirements',
    ],
    cta: 'Find My Pathway',
  },
  {
    icon: Calculator,
    title: 'Immigration Cost Calculator',
    description:
      'Get a transparent, itemised breakdown of every cost involved in your chosen immigration pathway - government fees, legal costs, medical exams, relocation expenses, and proof-of-funds requirements.',
    status: 'available',
    href: '/immigration-cost-calculator',
    color: 'teal',
    badge: 'Most Detailed',
    features: [
      'Government fee data for 40+ countries',
      'Legal and agent cost estimates',
      'Proof-of-funds requirements',
      'Low / mid / high cost scenarios',
    ],
    cta: 'Estimate My Costs',
  },
  {
    icon: FileCheck,
    title: 'Document Checklist Generator',
    description:
      'Generate a comprehensive, printable checklist of every document you need for your chosen visa or immigration pathway. Check items off as you gather them and track your preparation progress.',
    status: 'available',
    href: '/document-checklist',
    color: 'green',
    badge: '',
    features: [
      'Checklists for 6+ visa types',
      'Mark items as gathered or not needed',
      'Covers identity, financial, and supporting docs',
      'Printable and interactive',
    ],
    cta: 'Build My Checklist',
  },
  {
    icon: MapPin,
    title: 'Country Comparison Tool',
    description:
      'Side-by-side comparison of up to 4 countries across the metrics that matter most: cost of living, processing times, visa pathways available, language requirements, and overall ease of immigration.',
    status: 'available',
    href: '/country-comparison',
    color: 'amber',
    badge: '',
    features: [
      'Compare up to 4 countries simultaneously',
      'Cost of living and salary data',
      'Healthcare and education quality',
      'Available visa pathway types',
    ],
    cta: 'Compare Countries',
  },
];

const colorMap: Record<string, { iconBg: string; iconText: string; badge: string; btn: string; border: string }> = {
  blue:  { iconBg: 'bg-blue-100',  iconText: 'text-blue-600',  badge: 'bg-blue-100 text-blue-700',  btn: 'bg-blue-600 hover:bg-blue-700',  border: 'hover:border-blue-300' },
  teal:  { iconBg: 'bg-teal-100',  iconText: 'text-teal-600',  badge: 'bg-teal-100 text-teal-700',  btn: 'bg-teal-600 hover:bg-teal-700',  border: 'hover:border-teal-300' },
  green: { iconBg: 'bg-green-100', iconText: 'text-green-600', badge: 'bg-green-100 text-green-700', btn: 'bg-green-600 hover:bg-green-700', border: 'hover:border-green-300' },
  amber: { iconBg: 'bg-amber-100', iconText: 'text-amber-600', badge: 'bg-amber-100 text-amber-700', btn: 'bg-amber-600 hover:bg-amber-700', border: 'hover:border-amber-300' },
};

const stats = [
  { value: '52', label: 'Countries Covered', icon: Globe },
  { value: '300+', label: 'Immigration Pathways', icon: TrendingUp },
  { value: '100%', label: 'Free to Use', icon: Shield },
  { value: '8', label: 'Immigration Goals', icon: Users },
];

const howItWorks = [
  { step: '1', title: 'Select your tool', description: 'Choose the tool that matches your current stage in the immigration planning process.' },
  { step: '2', title: 'Enter your details', description: 'Provide your passport nationality, target country, immigration goal, and other relevant criteria.' },
  { step: '3', title: 'Review your results', description: 'Get personalised recommendations, cost breakdowns, document requirements, or country comparisons.' },
  { step: '4', title: 'Plan your next steps', description: 'Use your results to prepare your application, gather documents, or research your chosen pathway further.' },
];

const faqs = [
  {
    question: 'Are these immigration tools free to use?',
    answer: 'Yes, all tools on ImmigrationInfoGuide.com are completely free. There are no sign-ups, subscriptions, or hidden fees. We believe everyone should have access to clear, accurate immigration information.',
  },
  {
    question: 'How accurate is the immigration cost calculator?',
    answer: 'Our cost calculator uses researched government fee schedules, typical legal cost ranges, and proof-of-funds thresholds sourced from official immigration authority websites. Costs are presented as ranges (low/mid/high) to reflect real-world variation. We recommend verifying final fees directly with the relevant immigration authority before applying.',
  },
  {
    question: 'Which countries does the Path Finder cover?',
    answer: 'The Immigration Path Finder covers 52 destination countries across Europe, North America, Oceania, Asia, Latin America, the Middle East, and Africa. It matches your passport and immigration goal against hundreds of visa and residency pathways.',
  },
  {
    question: 'Can I use these tools to apply for a visa?',
    answer: 'These tools are designed to help you research, plan, and prepare - not to submit official visa applications. All applications must be submitted directly to the relevant government immigration authority or consulate. We provide links to official application portals in our Resources section.',
  },
  {
    question: 'How often is the information updated?',
    answer: 'We review and update our pathway data, fee schedules, and eligibility requirements on a rolling basis as immigration policies change. Each pathway page includes a last-verified date. For time-sensitive applications, always cross-check with the official government source.',
  },
  {
    question: 'What is the Document Checklist tool used for?',
    answer: 'The Document Checklist tool generates a comprehensive list of every document typically required for a given visa type - including identity documents, financial evidence, employment records, health certificates, and more. You can tick items off as you gather them, making it easy to track your application preparation.',
  },
];

const relatedLinks = [
  { title: 'Immigration Guides by Country', href: '/immigration-guides', description: 'In-depth guides for 52 destinations' },
  { title: 'Resources & Checklists', href: '/resources', description: 'Official links, timelines, and requirements' },
  { title: 'Blog & Immigration News', href: '/blog', description: 'Latest immigration tips and updates' },
  { title: 'Country Finder', href: '/country-finder', description: 'Explore all 52 covered countries' },
];



export default function ToolsPage() {
  return (
    <>
      <StructuredData type="FAQPage" faqs={faqs} />
      <div className="min-h-screen bg-white">

        {/* Hero */}
        <section className="bg-gradient-to-b from-slate-50 to-white border-b border-gray-100 py-16 sm:py-20">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8">
            <div className="text-center max-w-3xl mx-auto">
              <div className="inline-flex items-center gap-2 bg-blue-50 text-blue-700 text-sm font-medium px-4 py-1.5 rounded-full mb-5 border border-blue-100">
                <Shield className="w-4 h-4" />
                100% Free - No Account Required
              </div>
              <h1 className="text-4xl sm:text-5xl font-bold text-gray-900 mb-5 leading-tight">
                Free Immigration Planning Tools
              </h1>
              <p className="text-lg sm:text-xl text-gray-600 leading-relaxed mb-8">
                Four purpose-built tools to help you research immigration options, estimate costs, organise your documents, and compare countries - all in one place, completely free.
              </p>
              <div className="flex flex-wrap justify-center gap-3">
                <Link
                  href="/path-finder"
                  className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-3 rounded-lg transition-colors"
                >
                  <Plane className="w-4 h-4" />
                  Start with Path Finder
                </Link>
                <Link
                  href="#tools"
                  className="inline-flex items-center gap-2 bg-white hover:bg-gray-50 text-gray-700 font-semibold px-6 py-3 rounded-lg border border-gray-200 transition-colors"
                >
                  See All Tools
                  <ChevronDown className="w-4 h-4" />
                </Link>
              </div>
            </div>
          </div>
        </section>

        {/* Stats Bar */}
        <section className="border-b border-gray-100 bg-white">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-8">
            <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
              {stats.map((stat) => {
                const Icon = stat.icon;
                return (
                  <div key={stat.label} className="text-center">
                    <div className="inline-flex items-center justify-center w-10 h-10 bg-slate-100 rounded-lg mb-2">
                      <Icon className="w-5 h-5 text-slate-600" />
                    </div>
                    <div className="text-2xl font-bold text-gray-900">{stat.value}</div>
                    <div className="text-sm text-gray-500">{stat.label}</div>
                  </div>
                );
              })}
            </div>
          </div>
        </section>

        {/* Tool Cards */}
        <section id="tools" className="py-16 bg-white">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8">
            <div className="text-center mb-12">
              <h2 className="text-3xl font-bold text-gray-900 mb-4">Choose Your Tool</h2>
              <p className="text-gray-600 max-w-2xl mx-auto text-lg">
                Each tool is designed for a specific part of the immigration planning process. Use one or all four to plan your move with confidence.
              </p>
            </div>

            <div className="grid md:grid-cols-2 gap-6">
              {tools.map((tool) => {
                const Icon = tool.icon;
                const colors = colorMap[tool.color];
                return (
                  <article
                    key={tool.title}
                    className={`bg-white rounded-xl border border-gray-200 p-6 sm:p-8 hover:shadow-lg ${colors.border} transition-all duration-200 flex flex-col`}
                  >
                    <div className="flex items-start gap-4 mb-4">
                      <div className={`inline-flex p-3 rounded-xl ${colors.iconBg} shrink-0`}>
                        <Icon className={`h-6 w-6 ${colors.iconText}`} />
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 flex-wrap mb-1">
                          <h2 className="text-xl font-bold text-gray-900">{tool.title}</h2>
                          {tool.badge && (
                            <span className={`text-xs font-semibold px-2.5 py-0.5 rounded-full ${colors.badge}`}>
                              {tool.badge}
                            </span>
                          )}
                        </div>
                      </div>
                    </div>

                    <p className="text-gray-600 leading-relaxed mb-5">{tool.description}</p>

                    <ul className="space-y-2 mb-6 flex-1">
                      {tool.features.map((feature) => (
                        <li key={feature} className="flex items-start gap-2.5 text-sm text-gray-700">
                          <CheckCircle2 className={`w-4 h-4 mt-0.5 shrink-0 ${colors.iconText}`} />
                          {feature}
                        </li>
                      ))}
                    </ul>

                    <Link
                      href={tool.href}
                      className={`inline-flex items-center justify-center gap-2 ${colors.btn} text-white text-sm font-semibold py-3 px-5 rounded-lg transition-colors`}
                    >
                      {tool.cta}
                      <ArrowRight className="w-4 h-4" />
                    </Link>
                  </article>
                );
              })}
            </div>
          </div>
        </section>

        {/* How It Works */}
        <section className="py-16 bg-slate-50 border-y border-gray-100">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8">
            <div className="text-center mb-12">
              <h2 className="text-3xl font-bold text-gray-900 mb-4">How the Tools Work</h2>
              <p className="text-gray-600 max-w-2xl mx-auto">
                Our tools are designed to be simple and self-explanatory. Here is the typical process for first-time users.
              </p>
            </div>

            <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
              {howItWorks.map((item) => (
                <div key={item.step} className="bg-white rounded-xl border border-gray-200 p-6">
                  <div className="w-10 h-10 rounded-full bg-blue-600 text-white font-bold text-lg flex items-center justify-center mb-4">
                    {item.step}
                  </div>
                  <h3 className="font-semibold text-gray-900 mb-2">{item.title}</h3>
                  <p className="text-sm text-gray-600 leading-relaxed">{item.description}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* SEO Content */}
        <section className="py-16 bg-white">
          <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8">
            <h2 className="text-3xl font-bold text-gray-900 mb-8">About Our Immigration Planning Tools</h2>

            <div className="grid md:grid-cols-2 gap-8 mb-10">
              <div>
                <h3 className="text-xl font-semibold text-gray-900 mb-3 flex items-center gap-2">
                  <Plane className="w-5 h-5 text-blue-600 shrink-0" />
                  Immigration Path Finder
                </h3>
                <p className="text-gray-600 leading-relaxed text-sm">
                  The Immigration Path Finder is the fastest way to discover which visa and residency programmes you are eligible for. By entering your passport nationality and immigration goal - whether work, study, retirement, digital nomad, family, or investment - the tool matches you against hundreds of immigration pathways across 52 countries. Each result shows key eligibility criteria, typical processing times, and estimated costs.
                </p>
              </div>

              <div>
                <h3 className="text-xl font-semibold text-gray-900 mb-3 flex items-center gap-2">
                  <Calculator className="w-5 h-5 text-teal-600 shrink-0" />
                  Immigration Cost Calculator
                </h3>
                <p className="text-gray-600 leading-relaxed text-sm">
                  One of the most overlooked aspects of immigration planning is the true total cost. The Immigration Cost Calculator gives you a detailed breakdown of every financial requirement: government application fees, biometric and document processing charges, legal and agent costs, medical examination fees, relocation expenses, and the proof-of-funds threshold you must demonstrate. Costs are shown in low, mid, and high scenarios to reflect real-world variation.
                </p>
              </div>

              <div>
                <h3 className="text-xl font-semibold text-gray-900 mb-3 flex items-center gap-2">
                  <FileCheck className="w-5 h-5 text-green-600 shrink-0" />
                  Document Checklist Generator
                </h3>
                <p className="text-gray-600 leading-relaxed text-sm">
                  A missing or incorrectly prepared document is the most common reason visa applications are delayed or refused. Our Document Checklist Generator helps you stay organised by producing a complete list of required documents for your chosen pathway - covering identity, employment, financial, health, and supporting paperwork. Mark items as gathered or not applicable, and track your preparation progress at a glance.
                </p>
              </div>

              <div>
                <h3 className="text-xl font-semibold text-gray-900 mb-3 flex items-center gap-2">
                  <MapPin className="w-5 h-5 text-amber-600 shrink-0" />
                  Country Comparison Tool
                </h3>
                <p className="text-gray-600 leading-relaxed text-sm">
                  Choosing between two or more potential destinations is one of the hardest decisions in the immigration journey. The Country Comparison Tool lets you place up to four countries side by side and compare them across the factors that matter most: cost of living, average salaries, quality of healthcare, education options, available immigration pathways, language requirements, and overall ease of obtaining residency.
                </p>
              </div>
            </div>

            <div className="bg-blue-50 rounded-xl border border-blue-100 p-6 mb-6">
              <h3 className="text-base font-semibold text-gray-900 mb-2 flex items-center gap-2">
                <BookOpen className="w-5 h-5 text-blue-600 shrink-0" />
                Important Disclaimer
              </h3>
              <p className="text-gray-700 text-sm leading-relaxed">
                All tools on ImmigrationInfoGuide.com are for research and planning purposes only. The information provided does not constitute legal advice. Immigration rules change frequently - always verify requirements directly with the relevant government authority or a qualified immigration lawyer before submitting an application. See our{' '}
                <Link href="/methodology" className="text-blue-600 hover:underline">Methodology</Link>{' '}
                and{' '}
                <Link href="/data-sources" className="text-blue-600 hover:underline">Data Sources</Link>{' '}
                pages for more information on how we compile and maintain our data.
              </p>
            </div>

            <div className="bg-slate-50 rounded-xl border border-gray-200 p-6">
              <div className="flex items-start gap-3">
                <Clock className="w-5 h-5 text-gray-500 mt-0.5 shrink-0" />
                <div>
                  <h3 className="text-base font-semibold text-gray-900 mb-1">Keeping Data Current</h3>
                  <p className="text-gray-600 text-sm leading-relaxed">
                    Immigration rules, fee schedules, and eligibility requirements are reviewed and updated on a rolling basis. Each country guide and pathway page includes a last-verified date. For time-sensitive applications, always cross-check the information presented here with the official government immigration portal for your destination country.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* FAQ Section */}
        <section className="py-16 bg-slate-50 border-t border-gray-100">
          <div className="mx-auto max-w-3xl px-4 sm:px-6 lg:px-8">
            <div className="text-center mb-10">
              <h2 className="text-3xl font-bold text-gray-900 mb-4">Frequently Asked Questions</h2>
              <p className="text-gray-600">Common questions about our immigration tools and how to use them.</p>
            </div>

            <div className="space-y-4">
              {faqs.map((faq) => (
                <div key={faq.question} className="bg-white rounded-xl border border-gray-200 p-6">
                  <h3 className="text-base font-semibold text-gray-900 mb-3 flex items-start gap-2">
                    <span className="w-5 h-5 rounded-full bg-blue-100 text-blue-700 text-xs font-bold flex items-center justify-center shrink-0 mt-0.5">Q</span>
                    {faq.question}
                  </h3>
                  <p className="text-gray-600 text-sm leading-relaxed pl-7">{faq.answer}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Related Resources */}
        <section className="py-16 bg-white border-t border-gray-100">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8">
            <div className="text-center mb-10">
              <h2 className="text-3xl font-bold text-gray-900 mb-4">Explore More Resources</h2>
              <p className="text-gray-600">Complement our planning tools with in-depth guides, official government links, and the latest immigration news.</p>
            </div>

            <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-5">
              {relatedLinks.map((link) => (
                <Link
                  key={link.href}
                  href={link.href}
                  className="group bg-white border border-gray-200 rounded-xl p-5 hover:shadow-md hover:border-blue-200 transition-all duration-200"
                >
                  <h3 className="font-semibold text-gray-900 group-hover:text-blue-600 transition-colors mb-1.5">
                    {link.title}
                  </h3>
                  <p className="text-sm text-gray-500 mb-3">{link.description}</p>
                  <div className="flex items-center gap-1 text-sm font-medium text-blue-600">
                    Explore
                    <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-1 transition-transform" />
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </section>

      </div>
    </>
  );
}
