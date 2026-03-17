import Link from 'next/link';
import { Globe, FileText, Calculator, Search, BookOpen, Map } from 'lucide-react';

export default function SEOContentSection() {
  return (
    <section className="bg-gradient-to-b from-white to-gray-50 py-12">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        {/* Main Content Header */}
        <div className="text-center mb-10">
          <h2 className="text-4xl font-bold text-gray-900 mb-4">
            Comprehensive Immigration Resources & Tools
          </h2>
          <p className="text-lg text-gray-600 max-w-3xl mx-auto">
            Navigate your immigration journey with confidence using our extensive library of country guides,
            pathway information, and cost calculators. Whether you're planning to work abroad, retire overseas,
            or explore digital nomad opportunities, we provide the information you need.
          </p>
        </div>

        {/* Content Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-10">
          {/* Immigration Cost Calculator */}
          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center mr-4">
                <Calculator className="w-6 h-6 text-brand-primary" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Cost Calculator</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Estimate the total cost of immigrating to your desired destination. Our comprehensive calculator
              includes visa fees, proof of funds requirements, processing costs, and more.
            </p>
            <Link
              href="/immigration-cost-calculator"
              className="text-brand-primary hover:text-indigo-700 font-medium inline-flex items-center"
            >
              Calculate Immigration Costs
            </Link>
          </div>

          {/* Path Finder Tool */}
          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center mr-4">
                <Search className="w-6 h-6 text-blue-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Pathway Finder</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Find immigration pathways tailored to your passport, destination country, and goals. Discover work
              visas, study permits, digital nomad visas, and permanent residency options.
            </p>
            <Link
              href="/path-finder"
              className="text-blue-600 hover:text-blue-700 font-medium inline-flex items-center"
            >
              Find Your Pathway
            </Link>
          </div>

          {/* Country Guides */}
          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center mr-4">
                <Globe className="w-6 h-6 text-green-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Country Guides</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Explore detailed guides for 52 countries covering immigration requirements, cost of living,
              healthcare systems, and popular pathways for different goals.
            </p>
            <Link
              href="/immigration-guides"
              className="text-green-600 hover:text-green-700 font-medium inline-flex items-center"
            >
              Browse Country Guides
            </Link>
          </div>

          {/* Visa Entry Guides */}
          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mr-4">
                <FileText className="w-6 h-6 text-purple-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Visa Requirements</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Check visa requirements and entry regulations for destinations worldwide. Understand tourist visa
              rules, visa-free access, and short-term stay options.
            </p>
            <Link
              href="/visa-entry-guides"
              className="text-purple-600 hover:text-purple-700 font-medium inline-flex items-center"
            >
              Check Visa Requirements
            </Link>
          </div>

          {/* Methodology */}
          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center mr-4">
                <BookOpen className="w-6 h-6 text-orange-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Our Methodology</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Learn how we research and compile immigration information. Our data comes from official government
              sources, immigration authorities, and verified resources.
            </p>
            <Link
              href="/methodology"
              className="text-orange-600 hover:text-orange-700 font-medium inline-flex items-center"
            >
              Read Our Methodology
            </Link>
          </div>

          {/* Country Finder */}
          <div className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-lg transition-shadow">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-cyan-100 rounded-lg flex items-center justify-center mr-4">
                <Map className="w-6 h-6 text-cyan-600" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900">Country Finder</h3>
            </div>
            <p className="text-gray-600 mb-4">
              Compare immigration destinations side by side. Filter by region, language, cost of living, and
              available pathways to find your ideal destination.
            </p>
            <Link
              href="/country-finder"
              className="text-cyan-600 hover:text-cyan-700 font-medium inline-flex items-center"
            >
              Compare Countries
            </Link>
          </div>
        </div>

        {/* Rich Text Content for SEO */}
        <div className="max-w-5xl mx-auto">
          <div className="bg-white rounded-lg border border-gray-200 p-8 mb-8">
            <h3 className="text-2xl font-bold text-gray-900 mb-6">
              Understanding Immigration Pathways and Visa Options
            </h3>

            <div className="prose prose-lg max-w-none text-gray-700 space-y-4">
              <p>
                Immigration pathways vary significantly depending on your goals, qualifications, and target destination.
                Whether you're seeking <Link href="/path-finder" className="text-brand-primary hover:underline">work opportunities abroad</Link>,
                planning to <Link href="/immigration-guides" className="text-brand-primary hover:underline">retire in a new country</Link>,
                or exploring <strong>digital nomad visa programs</strong>, understanding the available options is crucial for a successful
                immigration journey.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Popular Immigration Categories</h4>

              <p>
                <strong>Work Visas and Employment-Based Immigration:</strong> Many countries offer skilled worker programs that allow
                foreign nationals to live and work legally. Popular destinations like{' '}
                <Link href="/country/canada" className="text-brand-primary hover:underline">Canada</Link>,{' '}
                <Link href="/country/australia" className="text-brand-primary hover:underline">Australia</Link>,{' '}
                <Link href="/country/germany" className="text-brand-primary hover:underline">Germany</Link>, and{' '}
                <Link href="/country/united-kingdom" className="text-brand-primary hover:underline">the United Kingdom</Link> have well-established
                skilled migration programs with clear pathways to permanent residency.
              </p>

              <p>
                <strong>Digital Nomad Visas:</strong> An increasing number of countries recognize remote workers and freelancers with
                specialized digital nomad visa programs. Destinations such as{' '}
                <Link href="/country/portugal" className="text-brand-primary hover:underline">Portugal</Link>,{' '}
                <Link href="/country/spain" className="text-brand-primary hover:underline">Spain</Link>,{' '}
                <Link href="/country/croatia" className="text-brand-primary hover:underline">Croatia</Link>, and{' '}
                <Link href="/country/thailand" className="text-brand-primary hover:underline">Thailand</Link> offer visa options specifically
                designed for location-independent professionals.
              </p>

              <p>
                <strong>Student Visas and Study Permits:</strong> Pursuing higher education abroad can open doors to work opportunities
                and eventual permanent residency. Countries like{' '}
                <Link href="/country/united-states" className="text-brand-primary hover:underline">the United States</Link>,{' '}
                <Link href="/country/canada" className="text-brand-primary hover:underline">Canada</Link>,{' '}
                <Link href="/country/australia" className="text-brand-primary hover:underline">Australia</Link>, and{' '}
                <Link href="/country/new-zealand" className="text-brand-primary hover:underline">New Zealand</Link> often allow international
                students to work part-time during studies and full-time after graduation.
              </p>

              <p>
                <strong>Retirement and Pensioner Visas:</strong> Several countries welcome retirees with special visa programs that require
                proof of pension income or savings. Popular retirement destinations include{' '}
                <Link href="/country/portugal" className="text-brand-primary hover:underline">Portugal</Link>,{' '}
                <Link href="/country/mexico" className="text-brand-primary hover:underline">Mexico</Link>,{' '}
                <Link href="/country/thailand" className="text-brand-primary hover:underline">Thailand</Link>, and{' '}
                <Link href="/country/panama" className="text-brand-primary hover:underline">Panama</Link>, each offering attractive tax benefits
                and cost of living advantages.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Immigration Cost Considerations</h4>

              <p>
                Understanding the <Link href="/immigration-cost-calculator" className="text-brand-primary hover:underline">total cost of immigration</Link> is
                essential for proper planning. Costs typically include visa application fees, government processing charges, medical examinations,
                police certificates, translation services, and proof of funds requirements. Some pathways also require significant financial investments,
                such as investor visas or startup visa programs.
              </p>

              <p>
                Use our <Link href="/immigration-cost-calculator" className="text-brand-primary hover:underline">Immigration Cost Calculator</Link> to
                estimate expenses for specific pathways. The calculator provides detailed breakdowns including required documentation costs,
                application fees, biometric fees, and settlement funds requirements for major immigration destinations.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Regional Immigration Opportunities</h4>

              <p>
                <strong>European Union:</strong> EU citizens enjoy freedom of movement across member states, but non-EU nationals can access various
                pathways including Blue Card programs for highly skilled workers, startup visas, and country-specific work permits. Explore opportunities in{' '}
                <Link href="/country/france" className="text-brand-primary hover:underline">France</Link>,{' '}
                <Link href="/country/netherlands" className="text-brand-primary hover:underline">the Netherlands</Link>,{' '}
                <Link href="/country/italy" className="text-brand-primary hover:underline">Italy</Link>, and{' '}
                <Link href="/country/ireland" className="text-brand-primary hover:underline">Ireland</Link>.
              </p>

              <p>
                <strong>Asia-Pacific:</strong> Countries in this region offer diverse immigration pathways from high-skilled employment programs to
                investment migration. Key destinations include{' '}
                <Link href="/country/singapore" className="text-brand-primary hover:underline">Singapore</Link>,{' '}
                <Link href="/country/japan" className="text-brand-primary hover:underline">Japan</Link>,{' '}
                <Link href="/country/south-korea" className="text-brand-primary hover:underline">South Korea</Link>, and{' '}
                <Link href="/country/malaysia" className="text-brand-primary hover:underline">Malaysia</Link>, each with unique requirements and benefits.
              </p>

              <p>
                <strong>Latin America:</strong> Several countries in Central and South America offer accessible immigration pathways with lower
                financial thresholds. Consider{' '}
                <Link href="/country/chile" className="text-brand-primary hover:underline">Chile</Link>,{' '}
                <Link href="/country/colombia" className="text-brand-primary hover:underline">Colombia</Link>,{' '}
                <Link href="/country/argentina" className="text-brand-primary hover:underline">Argentina</Link>, and{' '}
                <Link href="/country/brazil" className="text-brand-primary hover:underline">Brazil</Link> for entrepreneurial ventures or lifestyle migration.
              </p>

              <h4 className="text-xl font-semibold text-gray-900 mt-8 mb-4">Getting Started with Your Immigration Journey</h4>

              <p>
                Begin by using our <Link href="/path-finder" className="text-brand-primary hover:underline">Immigration Path Finder</Link> tool to
                identify suitable pathways based on your current passport, desired destination, and immigration goals. Then, review the detailed{' '}
                <Link href="/immigration-guides" className="text-brand-primary hover:underline">country guides</Link> to understand specific requirements,
                timelines, and costs.
              </p>

              <p>
                Our platform provides comprehensive information to help you make informed decisions, but always verify current requirements with
                official government sources or licensed immigration professionals. Immigration policies change frequently, and individual circumstances
                vary significantly. Visit our <Link href="/data-sources" className="text-brand-primary hover:underline">data sources page</Link> to
                learn more about our research methodology and official reference materials.
              </p>
            </div>
          </div>

          {/* Call to Action */}
          <div className="bg-gradient-to-r from-indigo-500 to-cyan-600 rounded-lg p-8 text-center text-white">
            <h3 className="text-2xl font-bold mb-4">Ready to Start Your Immigration Journey?</h3>
            <p className="text-lg mb-6 text-indigo-50">
              Use our tools to find the right pathway, calculate costs, and explore destination countries.
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
                className="bg-brand-primary text-white border-2 border-white px-8 py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors"
              >
                Calculate Costs
              </Link>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
