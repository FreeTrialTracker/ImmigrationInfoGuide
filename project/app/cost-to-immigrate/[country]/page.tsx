import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Alert, AlertDescription } from '@/components/ui/alert';
import { Calculator, ArrowRight, TrendingUp, CircleAlert as AlertCircle, Users, DollarSign, FileText } from 'lucide-react';
import { getAllBlogPosts } from '@/lib/blogData';
import { getCostVariantRelatedLinks } from '@/lib/seo/relatedLinks';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';
import { getCountryCostSnapshot, generateCountryFAQs } from '@/lib/seoHelpers';
import { getActiveDestinationCountries } from '@/lib/immigrationCostData';
import { formatCurrencyByCode } from '@/lib/immigrationCostCalculator';
import { getCostEditorialCanonical, hasCostEditorialDistinctContent } from '@/lib/seo/canonicalStrategy';
import { SEOBreadcrumbs } from '@/components/SEOBreadcrumbs';
import { SEOFAQSection } from '@/components/SEOFAQSection';
import { StructuredData } from '@/components/StructuredData';

export const revalidate = 86400;

export async function generateStaticParams() {
  try {
    const countries = await getActiveDestinationCountries();
    return countries.map((c) => ({ country: c.slug }));
  } catch {
    return [];
  }
}

export async function generateMetadata({ params }: { params: { country: string } }): Promise<Metadata> {
  const snapshot = await getCountryCostSnapshot(params.country);

  if (!snapshot) {
    return {
      title: 'Country Not Found',
    };
  }

  const { country } = snapshot;
  const { canonical } = getCostEditorialCanonical(params.country, hasCostEditorialDistinctContent(snapshot));

  return {
    title: `${country.name} Immigration Budget Guide | Hidden Costs & Financial Planning`,
    description: `A practical budgeting guide to immigrating to ${country.name}. Covers hidden expenses, proof of funds, pre-arrival costs, post-arrival settlement budgets, and financial planning tips.`,
    alternates: { canonical },
    openGraph: {
      title: `${country.name} Immigration Budget Guide`,
      description: `What does it really cost to immigrate to ${country.name}? Hidden fees, proof of funds, relocation expenses and budgeting advice.`,
      url: canonical,
    },
  };
}

export default async function CostToImmigratePage({ params }: { params: { country: string } }) {
  const snapshot = await getCountryCostSnapshot(params.country);

  if (!snapshot) {
    notFound();
  }

  const { country, costRange, popularPathways, pathways, avgProofOfFunds } = snapshot;
  const currency = costRange?.currency || 'USD';
  const faqs = generateCountryFAQs(snapshot);

  const blogPosts = await getAllBlogPosts().catch(() => []);
  const relatedLinksGroups = getCostVariantRelatedLinks({
    countrySlug: params.country,
    pathwaySlugs: popularPathways.map((p) => p.pathway_slug),
    blogPosts: blogPosts.map((p) => ({ slug: p.slug, title: p.title, tags: p.tags, category: p.category })),
  });

  const breadcrumbs = [
    { label: 'Immigration Cost', href: '/immigration-cost' },
    { label: country.name, href: `/cost-to-immigrate/${params.country}` },
  ];

  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://immigrationinfoguide.com';
  const pageUrl = `${baseUrl}/cost-to-immigrate/${params.country}`;

  return (
    <>
      <StructuredData
        type="BreadcrumbList"
        breadcrumbs={[
          { name: 'Home', url: baseUrl },
          { name: 'Immigration Cost', url: `${baseUrl}/immigration-cost` },
          { name: country.name, url: pageUrl },
        ]}
      />
      <StructuredData type="FAQPage" faqs={faqs} />
      <StructuredData
        type="WebPage"
        webpage={{
          name: `Cost to Immigrate to ${country.name}`,
          description: `Comprehensive guide to all immigration costs for ${country.name} including visa fees, proof of funds, and hidden expenses.`,
          url: pageUrl,
        }}
      />

      <div className="min-h-screen bg-gradient-to-b from-background to-muted/20">
        <div className="container mx-auto px-4 py-12 md:py-16">
          <div className="max-w-5xl mx-auto space-y-12">
            <SEOBreadcrumbs items={breadcrumbs} />

            <div className="space-y-6">
              <div className="flex items-center gap-3 flex-wrap">
                <Badge variant="secondary" className="text-sm">{country.region}</Badge>
                {pathways.length > 0 && (
                  <Badge variant="outline" className="text-sm">
                    {pathways.length} immigration pathways
                  </Badge>
                )}
              </div>

              <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold tracking-tight">
                {country.name} Immigration Budget Guide
              </h1>

              <p className="text-xl text-muted-foreground leading-relaxed">
                Most immigration cost guides only show visa fees. This guide covers the full picture — hidden pre-arrival costs,
                proof of funds requirements, what you'll actually spend in the first months after arrival, and the financial
                mistakes that catch first-time immigrants off guard. Use it to build a realistic budget before you apply.
              </p>

              {costRange && (
                <div className="flex gap-4 pt-2">
                  <Link href={`/immigration-cost-calculator?destination=${params.country}`}>
                    <Button size="lg" className="gap-2">
                      <Calculator className="w-5 h-5" />
                      Calculate Your Costs
                    </Button>
                  </Link>
                  <Link href={`/immigration-cost/${params.country}`}>
                    <Button size="lg" variant="outline" className="gap-2">
                      View All Pathways
                      <ArrowRight className="w-5 h-5" />
                    </Button>
                  </Link>
                </div>
              )}
            </div>

            {costRange && (
              <Card className="border-2 border-primary/20">
                <CardHeader>
                  <div className="flex items-center gap-3">
                    <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
                      <DollarSign className="w-6 h-6 text-primary" />
                    </div>
                    <div>
                      <CardTitle className="text-2xl">Estimated Cost Snapshot</CardTitle>
                      <CardDescription>
                        Typical visa application fee ranges across all pathways
                      </CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div>
                    <div className="text-4xl font-bold text-primary">
                      {formatCurrencyByCode(costRange.min, currency)} - {formatCurrencyByCode(costRange.max, currency)}
                    </div>
                    <p className="text-sm text-muted-foreground mt-2">
                      Visa application fees only. Total costs including medical exams, language tests, documents,
                      and other fees will be higher.
                    </p>
                  </div>

                  <Alert>
                    <AlertCircle className="h-4 w-4" />
                    <AlertDescription className="text-sm">
                      These estimates are based on official government fee schedules and verified immigration data.
                      Your actual costs may vary based on your specific circumstances, exchange rates, and whether
                      you use professional immigration services. Always verify current fees before applying.
                    </AlertDescription>
                  </Alert>
                </CardContent>
              </Card>
            )}

            {popularPathways.length > 0 && (
              <div className="space-y-6">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center">
                    <TrendingUp className="w-5 h-5 text-primary" />
                  </div>
                  <div>
                    <h2 className="text-3xl font-bold">Featured Immigration Pathways</h2>
                    <p className="text-muted-foreground">Most popular routes to {country.name}</p>
                  </div>
                </div>

                <div className="grid gap-4">
                  {popularPathways.map((pathway) => (
                    <Link
                      key={pathway.id}
                      href={`/visa-cost/${params.country}/${pathway.pathway_slug}`}
                    >
                      <Card className="hover:border-primary transition-colors">
                        <CardHeader>
                          <div className="flex items-start justify-between gap-4">
                            <div className="space-y-2 flex-1">
                              <div className="flex items-center gap-2 flex-wrap">
                                <CardTitle className="text-xl">{pathway.pathway_name}</CardTitle>
                                <Badge variant="secondary" className="text-xs">Popular</Badge>
                              </div>
                              <CardDescription className="text-base">
                                {pathway.short_description}
                              </CardDescription>
                            </div>
                            <ArrowRight className="w-5 h-5 text-muted-foreground flex-shrink-0 mt-1" />
                          </div>
                        </CardHeader>
                        {pathway.costProfile && (
                          <CardContent>
                            <div className="flex items-baseline gap-2 flex-wrap">
                              <span className="text-sm text-muted-foreground">Visa fee:</span>
                              <span className="text-lg font-semibold">
                                {formatCurrencyByCode(
                                  pathway.costProfile.visa_fee_min || 0,
                                  pathway.costProfile.currency_code
                                )}{' '}
                                -{' '}
                                {formatCurrencyByCode(
                                  pathway.costProfile.visa_fee_max || 0,
                                  pathway.costProfile.currency_code
                                )}
                              </span>
                              {pathway.costProfile.proof_of_funds_single && (
                                <>
                                  <span className="text-muted-foreground">-</span>
                                  <span className="text-sm text-muted-foreground">
                                    Proof of funds: {formatCurrencyByCode(
                                      pathway.costProfile.proof_of_funds_single,
                                      pathway.costProfile.currency_code
                                    )}
                                  </span>
                                </>
                              )}
                            </div>
                          </CardContent>
                        )}
                      </Card>
                    </Link>
                  ))}
                </div>

                <Link href={`/immigration-cost/${params.country}`}>
                  <Button variant="outline" size="lg" className="w-full gap-2">
                    View All {pathways.length} Immigration Pathways
                    <ArrowRight className="w-5 h-5" />
                  </Button>
                </Link>
              </div>
            )}

            {avgProofOfFunds && avgProofOfFunds > 0 && (
              <Card>
                <CardHeader>
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center">
                      <TrendingUp className="w-5 h-5 text-primary" />
                    </div>
                    <div>
                      <CardTitle className="text-2xl">Proof of Funds Requirements</CardTitle>
                      <CardDescription>Money you must demonstrate, not pay</CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div>
                    <div className="text-3xl font-bold">
                      {formatCurrencyByCode(avgProofOfFunds, currency)}+
                    </div>
                    <p className="text-sm text-muted-foreground mt-1">
                      Average proof of funds for single applicants
                    </p>
                  </div>

                  <div className="space-y-3 text-muted-foreground">
                    <p>
                      Proof of funds is <strong className="text-foreground">not a fee you pay</strong> to the government.
                      It's money you must demonstrate you have available in your bank account to prove you can support
                      yourself after arrival in {country.name}.
                    </p>
                    <p>
                      This money must be readily accessible, cannot be borrowed, and must remain in your account
                      throughout the application process. The amount increases significantly when including family members.
                    </p>
                    <p>
                      Requirements vary by pathway. Some pathways like sponsored employment may have reduced or
                      waived proof of funds requirements.
                    </p>
                  </div>
                </CardContent>
              </Card>
            )}

            <Card className="border-amber-200 dark:border-amber-900 bg-amber-50 dark:bg-amber-950/20">
              <CardHeader>
                <div className="flex items-center gap-3">
                  <AlertCircle className="w-6 h-6 text-amber-600 dark:text-amber-500" />
                  <CardTitle className="text-amber-900 dark:text-amber-100">
                    Common Hidden Costs
                  </CardTitle>
                </div>
              </CardHeader>
              <CardContent>
                <div className="grid md:grid-cols-2 gap-4 text-sm">
                  <div className="space-y-2">
                    <h4 className="font-semibold text-amber-900 dark:text-amber-100">Pre-Arrival Costs</h4>
                    <ul className="space-y-1 text-amber-800 dark:text-amber-200">
                      <li>- Medical examinations ($200-$500 per person)</li>
                      <li>- Language tests ($200-$400)</li>
                      <li>- Document translation ($500-$2,000)</li>
                      <li>- Police certificates ($50-$100)</li>
                      <li>- Educational credential assessments ($200-$300)</li>
                      <li>- Biometrics fees ($85 per person)</li>
                    </ul>
                  </div>
                  <div className="space-y-2">
                    <h4 className="font-semibold text-amber-900 dark:text-amber-100">Post-Arrival Costs</h4>
                    <ul className="space-y-1 text-amber-800 dark:text-amber-200">
                      <li>- Flight tickets (varies by origin)</li>
                      <li>- Temporary accommodation (first 1-3 months)</li>
                      <li>- Shipping belongings ($2,000-$10,000)</li>
                      <li>- Health insurance until coverage starts</li>
                      <li>- Driver's license conversion ($100-$200)</li>
                      <li>- Initial settlement costs ($5,000-$15,000)</li>
                    </ul>
                  </div>
                </div>
                <p className="text-amber-800 dark:text-amber-200 mt-4 font-medium">
                  Budget an additional 30-50% above visa fees for these hidden costs that applicants often overlook.
                </p>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle className="text-2xl">Immigration Budgeting Timeline</CardTitle>
                <p className="text-sm text-muted-foreground">
                  When you'll actually incur each cost during the immigration process
                </p>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {[
                    { phase: '12–6 months before', label: 'Preparation phase', items: ['Language test registration & preparation ($200–400)', 'Educational credential assessment ($200–300)', 'Professional skills assessment if required ($300–600)'] },
                    { phase: '6–3 months before', label: 'Application phase', items: ['Visa application fees (varies by pathway)', 'Document translation & notarization ($500–2,000)', 'Medical examination ($200–500 per person)', 'Biometrics ($85 per person where required)', 'Police clearance certificates ($50–100)'] },
                    { phase: '0–1 months before', label: 'Pre-departure phase', items: ['Flight bookings (varies by origin)', 'Shipping or storage of belongings ($2,000–10,000)', 'First month accommodation deposit'] },
                    { phase: 'Month 1–3 after arrival', label: 'Settlement phase', items: ['Temporary accommodation ($1,500–4,000/month)', 'Local registration and documentation ($200–500)', 'Health insurance until employer coverage starts', 'Setting up banking, utilities, and transport'] },
                  ].map(({ phase, label, items }) => (
                    <div key={phase} className="border-l-2 border-primary/30 pl-4 pb-2">
                      <div className="text-xs font-semibold text-primary mb-0.5">{phase}</div>
                      <div className="text-sm font-medium text-foreground mb-1">{label}</div>
                      <ul className="space-y-0.5">
                        {items.map((item) => (
                          <li key={item} className="text-sm text-muted-foreground">– {item}</li>
                        ))}
                      </ul>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center">
                    <Users className="w-5 h-5 text-primary" />
                  </div>
                  <div>
                    <CardTitle className="text-2xl">Best Pathways by Applicant Type</CardTitle>
                    <CardDescription>Find the right immigration route for your situation</CardDescription>
                  </div>
                </div>
              </CardHeader>
              <CardContent>
                <div className="grid md:grid-cols-2 gap-6">
                  <div className="space-y-2">
                    <h4 className="font-semibold">Skilled Workers</h4>
                    <p className="text-sm text-muted-foreground">
                      {pathways.filter(p => p.category === 'Work').slice(0, 2).map(p => p.pathway_name).join(', ') || 'Express Entry, Skilled Worker visas'}
                    </p>
                  </div>
                  <div className="space-y-2">
                    <h4 className="font-semibold">Students</h4>
                    <p className="text-sm text-muted-foreground">
                      {pathways.filter(p => p.category === 'Study').slice(0, 2).map(p => p.pathway_name).join(', ') || 'Student visas with work rights'}
                    </p>
                  </div>
                  <div className="space-y-2">
                    <h4 className="font-semibold">Investors & Entrepreneurs</h4>
                    <p className="text-sm text-muted-foreground">
                      {pathways.filter(p => p.category === 'Business').slice(0, 2).map(p => p.pathway_name).join(', ') || 'Startup visas, investor programs'}
                    </p>
                  </div>
                  <div className="space-y-2">
                    <h4 className="font-semibold">Families</h4>
                    <p className="text-sm text-muted-foreground">
                      {pathways.filter(p => p.category === 'Family').slice(0, 2).map(p => p.pathway_name).join(', ') || 'Family sponsorship, spouse visas'}
                    </p>
                  </div>
                </div>
                <div className="mt-6">
                  <Link href="/path-finder">
                    <Button variant="outline" className="w-full gap-2">
                      <FileText className="w-4 h-4" />
                      Find Your Best Immigration Pathway
                    </Button>
                  </Link>
                </div>
              </CardContent>
            </Card>

            <SEOFAQSection faqs={faqs} />

            <Card className="bg-primary/5 border-primary/20">
              <CardContent className="pt-8 pb-8 text-center space-y-6">
                <div className="space-y-4">
                  <h3 className="text-2xl font-bold">Ready to Calculate Your Exact {country.name} Immigration Costs?</h3>
                  <p className="text-muted-foreground max-w-2xl mx-auto">
                    Use our interactive calculator to get a personalized cost estimate based on your specific pathway,
                    family size, and circumstances. Includes government fees, testing costs, and optional services.
                  </p>
                </div>
                <div className="flex flex-col sm:flex-row gap-4 justify-center">
                  <Link href={`/immigration-cost-calculator?destination=${params.country}`}>
                    <Button size="lg" className="gap-2">
                      <Calculator className="w-5 h-5" />
                      Calculate {country.name} Immigration Costs
                    </Button>
                  </Link>
                  <Link href={`/immigration-cost/${params.country}`}>
                    <Button size="lg" variant="outline" className="gap-2">
                      View All Pathways
                    </Button>
                  </Link>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle>Related Immigration Cost Guides</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="grid sm:grid-cols-2 gap-3">
                  <Link href="/immigration-cost">
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">All Countries</div>
                      <div className="text-sm text-muted-foreground">Compare immigration costs worldwide</div>
                    </div>
                  </Link>
                  <Link href="/path-finder">
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">Path Finder</div>
                      <div className="text-sm text-muted-foreground">Find your best immigration pathway</div>
                    </div>
                  </Link>
                  <Link href={`/immigrate-to/${params.country}`}>
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">{country.name} Immigration Guide</div>
                      <div className="text-sm text-muted-foreground">Comprehensive country information</div>
                    </div>
                  </Link>
                  <Link href="/immigration-cost-calculator">
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">Cost Calculator</div>
                      <div className="text-sm text-muted-foreground">Interactive cost estimator</div>
                    </div>
                  </Link>
                </div>
              </CardContent>
            </Card>

            <div className="px-1">
              <RelatedLinksSection groups={relatedLinksGroups} />
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
