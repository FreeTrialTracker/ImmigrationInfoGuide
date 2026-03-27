import Link from 'next/link';
import { Globe, FileText, Calculator, Search, BookOpen, Map } from 'lucide-react';

export default function SEOContentSection() {
  return (
    <section className="bg-gradient-to-b from-white to-gray-50 py-12">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-10">
          <h2 className="text-4xl font-bold text-gray-900 mb-4">
            Immigration Guides, Tools, and Pathway Research
          </h2>
          <p className="text-lg text-gray-600 max-w-3xl mx-auto">
            Research legal immigration pathways across 52 countries. Compare routes by purpose, eligibility, cost, and long-term settlement potential — from work permits to permanent residence.
          </p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-10">
          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-amber-100 rounded-lg flex items-center justify-center mr-4">
                <Calculator className="w-6 h-6 text-amber-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Immigration Cost Calculator</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Estimate total immigration costs by country and pathway. Covers visa fees, medical examinations, language testing, proof-of-funds requirements, and government processing charges.
            </p>
            <Link
              href="/immigration-cost-calculator"
              className="text-amber-600 hover:text-amber-700 font-medium inline-flex items-center"
            >
              Calculate Your Immigration Costs
            </Link>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center mr-4">
                <Search className="w-6 h-6 text-blue-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Immigration Path Finder</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Enter your passport and destination country to surface the immigration routes most relevant to your goal — work authorization, long-term residence, study, retirement, or investment.
            </p>
            <Link
              href="/path-finder"
              className="text-blue-600 hover:text-blue-700 font-medium inline-flex items-center"
            >
              Find Pathways for Your Situation
            </Link>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center mr-4">
                <Globe className="w-6 h-6 text-green-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Country Immigration Guides</h3>
            </div>
            <p className="text-gray-600 mb-4">
              In-depth immigration hub pages for 52 countries. Each guide covers the main stay routes, temporary vs. permanent distinctions, eligibility themes, and links to specific pathway pages.
            </p>
            <Link
              href="/immigration-guides"
              className="text-green-600 hover:text-green-700 font-medium inline-flex items-center"
            >
              Browse Country Guides
            </Link>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-sky-100 rounded-lg flex items-center justify-center mr-4">
                <FileText className="w-6 h-6 text-sky-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Visa Entry Requirements</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Check tourist visa requirements, visa-free access, and short-stay rules before planning a scouting trip or initial entry. Useful for understanding entry conditions separately from long-term immigration.
            </p>
            <Link
              href="/visa-entry-guides"
              className="text-sky-600 hover:text-sky-700 font-medium inline-flex items-center"
            >
              Check Visa Entry Requirements
            </Link>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center mr-4">
                <BookOpen className="w-6 h-6 text-orange-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Research Methodology</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Understand how we source and verify immigration information. All pathway data references official government portals and immigration authority publications.
            </p>
            <Link
              href="/methodology"
              className="text-orange-600 hover:text-orange-700 font-medium inline-flex items-center"
            >
              Read Our Methodology
            </Link>
          </div>

          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-cyan-100 rounded-lg flex items-center justify-center mr-4">
                <Map className="w-6 h-6 text-cyan-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Country Comparison Tool</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Compare immigration destinations side by side. Filter by region, language, cost of living, and available pathways. Useful for narrowing down two or three serious candidates.
            </p>
            <Link
              href="/country-finder"
              className="text-cyan-600 hover:text-cyan-700 font-medium inline-flex items-center"
            >
              Compare Countries
            </Link>
          </div>
        </div>

        <div className="max-w-5xl mx-auto">
          <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
            <h3 className="text-2xl font-bold text-gray-900 mb-6">
              How Immigration Pathways Work: Key Distinctions
            </h3>

            <div className="prose prose-lg max-w-none text-gray-700 space-y-4">
              <p>
                Immigration pathways are not interchangeable. A <strong>visa</strong> is typically an entry authorization. A <strong>permit</strong> is the document that governs your right to stay and work once you are in the country. A <strong>temporary residence permit</strong> grants legal stay for a defined period and may need to be renewed. <strong>Permanent residence</strong> grants indefinite stay rights without regular renewal. <strong>Citizenship</strong> is a separate legal status entirely, often requiring years of prior residence and a separate application.
              </p>
              <p>
                Understanding where your chosen pathway sits in this hierarchy is essential before committing to an application process. Use our <Link href="/path-finder" className="text-brand-primary hover:underline">Immigration Path Finder</Link> to identify which routes match your goals, then check the detailed pathway pages to understand whether each route leads to temporary stay, permanent residence, or neither.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Work-Based Immigration Pathways</h4>
              <p>
                Skilled worker programs allow foreign nationals to live and work legally under employer sponsorship or points-based systems. Key destinations include{' '}
                <Link href="/immigrate-to/canada" className="text-brand-primary hover:underline">Canada</Link>,{' '}
                <Link href="/immigrate-to/australia" className="text-brand-primary hover:underline">Australia</Link>,{' '}
                <Link href="/immigrate-to/germany" className="text-brand-primary hover:underline">Germany</Link>, and{' '}
                <Link href="/immigrate-to/united-kingdom" className="text-brand-primary hover:underline">the United Kingdom</Link>. Work authorization is typically tied to a specific employer or role at first, with pathways to independent permanent residence after a qualifying period.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Digital Nomad and Remote Work Visas</h4>
              <p>
                Digital nomad visa programs are designed for location-independent professionals who earn income from foreign sources. These are generally temporary stay authorizations, not permanent residence routes. Key destinations with established programs include{' '}
                <Link href="/immigrate-to/portugal" className="text-brand-primary hover:underline">Portugal</Link>,{' '}
                <Link href="/immigrate-to/spain" className="text-brand-primary hover:underline">Spain</Link>,{' '}
                <Link href="/immigrate-to/croatia" className="text-brand-primary hover:underline">Croatia</Link>, and{' '}
                <Link href="/immigrate-to/thailand" className="text-brand-primary hover:underline">Thailand</Link>. Applicants typically need to demonstrate minimum monthly income from remote employment or freelancing.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Student Visas and Post-Study Routes</h4>
              <p>
                Student visas authorize study at an enrolled institution and often permit limited part-time work during the academic term. Countries including{' '}
                <Link href="/immigrate-to/united-states" className="text-brand-primary hover:underline">the United States</Link>,{' '}
                <Link href="/immigrate-to/canada" className="text-brand-primary hover:underline">Canada</Link>,{' '}
                <Link href="/immigrate-to/australia" className="text-brand-primary hover:underline">Australia</Link>, and{' '}
                <Link href="/immigrate-to/new-zealand" className="text-brand-primary hover:underline">New Zealand</Link> offer post-study work permits that provide a transitional route from study to employment-based residence.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Retirement and Passive Income Visas</h4>
              <p>
                Retirement visa programs typically require proof of pension income or savings above a defined threshold. They usually authorize residence without work rights and do not automatically lead to permanent residence. Common destinations include{' '}
                <Link href="/immigrate-to/portugal" className="text-brand-primary hover:underline">Portugal</Link>,{' '}
                <Link href="/immigrate-to/mexico" className="text-brand-primary hover:underline">Mexico</Link>,{' '}
                <Link href="/immigrate-to/thailand" className="text-brand-primary hover:underline">Thailand</Link>, and{' '}
                <Link href="/immigrate-to/panama" className="text-brand-primary hover:underline">Panama</Link>.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Regional Pathways Worth Comparing</h4>
              <p>
                <strong>European Union:</strong> Non-EU nationals can access the EU Blue Card for highly skilled workers, country-specific startup visas, and long-term residence permits that may eventually convert to permanent residence. Key destinations include{' '}
                <Link href="/immigrate-to/france" className="text-brand-primary hover:underline">France</Link>,{' '}
                <Link href="/immigrate-to/netherlands" className="text-brand-primary hover:underline">the Netherlands</Link>,{' '}
                <Link href="/immigrate-to/italy" className="text-brand-primary hover:underline">Italy</Link>, and{' '}
                <Link href="/immigrate-to/ireland" className="text-brand-primary hover:underline">Ireland</Link>.
              </p>
              <p>
                <strong>Asia-Pacific:</strong> High-skilled employment programs, investment migration, and long-stay options exist across{' '}
                <Link href="/immigrate-to/singapore" className="text-brand-primary hover:underline">Singapore</Link>,{' '}
                <Link href="/immigrate-to/japan" className="text-brand-primary hover:underline">Japan</Link>,{' '}
                <Link href="/immigrate-to/south-korea" className="text-brand-primary hover:underline">South Korea</Link>, and{' '}
                <Link href="/immigrate-to/malaysia" className="text-brand-primary hover:underline">Malaysia</Link>. Each has distinct eligibility criteria and limits on dependents and family inclusion.
              </p>
              <p>
                <strong>Latin America:</strong>{' '}
                <Link href="/immigrate-to/chile" className="text-brand-primary hover:underline">Chile</Link>,{' '}
                <Link href="/immigrate-to/colombia" className="text-brand-primary hover:underline">Colombia</Link>,{' '}
                <Link href="/immigrate-to/argentina" className="text-brand-primary hover:underline">Argentina</Link>, and{' '}
                <Link href="/immigrate-to/brazil" className="text-brand-primary hover:underline">Brazil</Link> offer relatively accessible immigration thresholds with lower proof-of-funds requirements compared to Western Europe and North America.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Starting Your Research</h4>
              <p>
                Use the <Link href="/path-finder" className="text-brand-primary hover:underline">Immigration Path Finder</Link> to surface routes based on your passport and goals. Then review the relevant{' '}
                <Link href="/immigration-guides" className="text-brand-primary hover:underline">country immigration hub</Link> to understand the full landscape of available routes, temporary vs. permanent options, and major eligibility requirements before committing to a specific pathway.
              </p>
              <p>
                All information on this platform is for research purposes. Immigration requirements change frequently and vary by individual circumstances. Always verify current rules with official government sources or a licensed immigration professional. See our <Link href="/data-sources" className="text-brand-primary hover:underline">data sources page</Link> for reference materials.
              </p>
            </div>
          </div>

          <div className="bg-gradient-to-r from-brand-primary to-cyan-600 rounded-lg p-8 text-center text-white">
            <h3 className="text-2xl font-bold mb-4">Find the Right Route for Your Situation</h3>
            <p className="text-lg mb-6 text-blue-50">
              Use the Path Finder to match routes to your passport and destination, or browse the cost calculator to understand financial requirements before you apply.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Link
                href="/path-finder"
                className="bg-white text-brand-primary px-8 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-colors"
              >
                Find Your Pathway
              </Link>
              <Link
                href="/immigration-cost-calculator"
                className="bg-brand-primary text-white border-2 border-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-800 transition-colors"
              >
                Estimate Immigration Costs
              </Link>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
