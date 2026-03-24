import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Alert, AlertDescription } from '@/components/ui/alert';
import { Calculator, ArrowRight, DollarSign, Users, CircleAlert as AlertCircle, TrendingUp, Calendar } from 'lucide-react';
import { getAllBlogPosts } from '@/lib/blogData';
import { getVisaCostPathwayRelatedLinks } from '@/lib/seo/relatedLinks';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';
import { getPathwayCostSnapshot, generatePathwayFAQs } from '@/lib/seoHelpers';
import { getPathwayCostFeesCanonical } from '@/lib/seo/canonicalStrategy';
import { formatCurrencyByCode } from '@/lib/immigrationCostCalculator';
import { SEOBreadcrumbs } from '@/components/SEOBreadcrumbs';
import { SEOFAQSection } from '@/components/SEOFAQSection';
import { StructuredData } from '@/components/StructuredData';

export const revalidate = 86400;
export const dynamicParams = true;

export async function generateStaticParams() {
  return [];
}

export async function generateMetadata({
  params,
}: {
  params: { country: string; pathway: string };
}): Promise<Metadata> {
  const snapshot = await getPathwayCostSnapshot(params.country, params.pathway);

  if (!snapshot) {
    return {
      title: 'Pathway Not Found',
    };
  }

  const { country, pathway } = snapshot;
  const { canonical } = getPathwayCostFeesCanonical(params.country, params.pathway);

  return {
    title: `${country.name} ${pathway.pathway_name} Visa Fees | Official Government Fees`,
    description: `Official visa fees and government charges for ${pathway.pathway_name} to ${country.name}. Biometric fees, filing fees, and fee-specific notes.`,
    alternates: { canonical },
    openGraph: {
      title: `${country.name} ${pathway.pathway_name} Visa Fees`,
      description: `Official visa application fees, biometric fees, and filing fees for ${pathway.pathway_name} to ${country.name}.`,
      url: canonical,
    },
  };
}

export default async function VisaCostPage({
  params,
}: {
  params: { country: string; pathway: string };
}) {
  const snapshot = await getPathwayCostSnapshot(params.country, params.pathway);

  if (!snapshot) {
    notFound();
  }

  const { country, pathway, costProfile, alternativePathways } = snapshot;
  const currency = costProfile?.currency_code || 'USD';
  const faqs = generatePathwayFAQs(snapshot);
  const canonicalUrl = getPathwayCostFeesCanonical(params.country, params.pathway).canonical;

  const blogPosts = await getAllBlogPosts().catch(() => []);
  const relatedLinksGroups = getVisaCostPathwayRelatedLinks({
    countrySlug: params.country,
    pathwaySlug: params.pathway,
    siblingPathwaySlugs: alternativePathways.map((p) => p.pathway_slug),
    blogPosts: blogPosts.map((p) => ({ slug: p.slug, title: p.title, tags: p.tags, category: p.category })),
  });

  const breadcrumbs = [
    { label: 'Visa Cost', href: '/immigration-cost' },
    { label: country.name, href: `/cost-to-immigrate/${params.country}` },
    { label: pathway.pathway_name, href: `/visa-cost/${params.country}/${params.pathway}` },
  ];

  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://immigrationinfoguide.com';
  const pageUrl = `${baseUrl}/visa-cost/${params.country}/${params.pathway}`;

  const totalCostMin = costProfile
    ? (costProfile.visa_fee_min || 0) +
      (costProfile.medical_fee_min || 0) +
      (costProfile.language_test_fee_min || 0)
    : 0;

  const totalCostMax = costProfile
    ? (costProfile.visa_fee_max || 0) +
      (costProfile.medical_fee_max || 0) +
      (costProfile.language_test_fee_max || 0)
    : 0;

  return (
    <>
      <StructuredData
        type="BreadcrumbList"
        breadcrumbs={[
          { name: 'Home', url: baseUrl },
          { name: 'Visa Cost', url: `${baseUrl}/immigration-cost` },
          { name: country.name, url: `${baseUrl}/cost-to-immigrate/${params.country}` },
          { name: pathway.pathway_name, url: pageUrl },
        ]}
      />
      <StructuredData type="FAQPage" faqs={faqs} />
      <StructuredData
        type="WebPage"
        webpage={{
          name: `${country.name} ${pathway.pathway_name} Visa Fees`,
          description: `Official visa fees and government charges for ${pathway.pathway_name} to ${country.name}`,
          url: canonicalUrl,
        }}
      />

      <div className="min-h-screen bg-gradient-to-b from-background to-muted/20">
        <div className="container mx-auto px-4 py-12 md:py-16">
          <div className="max-w-5xl mx-auto space-y-12">
            <SEOBreadcrumbs items={breadcrumbs} />

            <div className="space-y-6">
              <div className="flex items-center gap-3 flex-wrap">
                <Badge variant="secondary" className="text-sm">{country.region}</Badge>
                <Badge variant="outline" className="text-sm">{pathway.category}</Badge>
                {pathway.is_popular && <Badge className="text-sm">Popular</Badge>}
              </div>

              <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold tracking-tight">
                {country.name} {pathway.pathway_name} Cost
              </h1>

              <p className="text-xl text-muted-foreground leading-relaxed">
                {pathway.short_description || `The ${pathway.pathway_name} is one of ${country.name}'s immigration pathways.`}
                {' '}Understanding the true cost helps you budget accurately and avoid surprises during the application process.
                This guide covers all fees, requirements, and hidden costs you need to know.
              </p>

              <div className="flex gap-4 pt-2">
                <Link href={`/immigration-cost-calculator?destination=${params.country}&pathway=${pathway.id}`}>
                  <Button size="lg" className="gap-2">
                    <Calculator className="w-5 h-5" />
                    Calculate Total Costs
                  </Button>
                </Link>
                <Link href={`/immigration-cost/${params.country}/${params.pathway}`}>
                  <Button size="lg" variant="outline" className="gap-2">
                    View Requirements
                    <ArrowRight className="w-5 h-5" />
                  </Button>
                </Link>
              </div>
            </div>

            {costProfile && (
              <Card className="border-2 border-primary/20">
                <CardHeader>
                  <div className="flex items-center gap-3">
                    <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
                      <DollarSign className="w-6 h-6 text-primary" />
                    </div>
                    <div>
                      <CardTitle className="text-2xl">Typical Total Cost Range</CardTitle>
                      <CardDescription>
                        Estimated costs for single applicant (families cost more)
                      </CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="space-y-6">
                  <div>
                    <div className="text-4xl font-bold text-primary">
                      {formatCurrencyByCode(totalCostMin, currency)} - {formatCurrencyByCode(totalCostMax, currency)}
                    </div>
                    <p className="text-sm text-muted-foreground mt-2">
                      Includes visa fees, medical exams, and language tests. Does not include legal fees,
                      relocation, or settlement costs.
                    </p>
                  </div>

                  {costProfile.is_estimate && (
                    <Alert>
                      <AlertCircle className="h-4 w-4" />
                      <AlertDescription className="text-sm">
                        These are estimated costs based on typical applications. Your actual costs may vary based on
                        your specific circumstances, family size, and current exchange rates.
                      </AlertDescription>
                    </Alert>
                  )}
                </CardContent>
              </Card>
            )}

            {costProfile && (
              <Card>
                <CardHeader>
                  <CardTitle className="text-2xl">Government Fees Breakdown</CardTitle>
                  <CardDescription>Official fees required for {pathway.pathway_name}</CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                  {(costProfile.visa_fee_min !== null || costProfile.visa_fee_max !== null) && (
                    <div className="flex justify-between items-center pb-3 border-b">
                      <div>
                        <div className="font-medium">Visa Application Fee</div>
                        <div className="text-sm text-muted-foreground">Main government processing fee</div>
                      </div>
                      <div className="text-right">
                        <div className="text-xl font-bold">
                          {formatCurrencyByCode(costProfile.visa_fee_min || 0, currency)} -{' '}
                          {formatCurrencyByCode(costProfile.visa_fee_max || 0, currency)}
                        </div>
                      </div>
                    </div>
                  )}

                  {(costProfile.medical_fee_min !== null || costProfile.medical_fee_max !== null) && (
                    <div className="flex justify-between items-center pb-3 border-b">
                      <div>
                        <div className="font-medium">Medical Examination</div>
                        <div className="text-sm text-muted-foreground">Required health check by approved doctors</div>
                      </div>
                      <div className="text-right">
                        <div className="font-semibold">
                          {formatCurrencyByCode(costProfile.medical_fee_min || 0, currency)} -{' '}
                          {formatCurrencyByCode(costProfile.medical_fee_max || 0, currency)}
                        </div>
                      </div>
                    </div>
                  )}

                  {(costProfile.language_test_fee_min !== null || costProfile.language_test_fee_max !== null) && (
                    <div className="flex justify-between items-center pb-3 border-b">
                      <div>
                        <div className="font-medium">Language Test</div>
                        <div className="text-sm text-muted-foreground">IELTS, TOEFL, or equivalent proficiency exam</div>
                      </div>
                      <div className="text-right">
                        <div className="font-semibold">
                          {formatCurrencyByCode(costProfile.language_test_fee_min || 0, currency)} -{' '}
                          {formatCurrencyByCode(costProfile.language_test_fee_max || 0, currency)}
                        </div>
                      </div>
                    </div>
                  )}

                  {(costProfile.legal_fee_min !== null || costProfile.legal_fee_max !== null) && (
                    <div className="flex justify-between items-center">
                      <div>
                        <div className="font-medium">Legal Fees (Optional)</div>
                        <div className="text-sm text-muted-foreground">Immigration lawyer or consultant services</div>
                      </div>
                      <div className="text-right">
                        <div className="font-semibold">
                          {formatCurrencyByCode(costProfile.legal_fee_min || 0, currency)} -{' '}
                          {formatCurrencyByCode(costProfile.legal_fee_max || 0, currency)}
                        </div>
                      </div>
                    </div>
                  )}

                  {costProfile.last_verified_at && (
                    <div className="flex items-center gap-2 text-sm text-muted-foreground pt-4 border-t">
                      <Calendar className="w-4 h-4" />
                      <span>Last verified: {new Date(costProfile.last_verified_at).toLocaleDateString()}</span>
                    </div>
                  )}

                  {costProfile.source_label && (
                    <p className="text-xs text-muted-foreground pt-2">
                      Source: {costProfile.source_label}
                    </p>
                  )}
                </CardContent>
              </Card>
            )}

            <Card className="border-amber-200 dark:border-amber-900 bg-amber-50 dark:bg-amber-950/20">
              <CardHeader>
                <div className="flex items-center gap-3">
                  <AlertCircle className="w-6 h-6 text-amber-600 dark:text-amber-500" />
                  <CardTitle className="text-amber-900 dark:text-amber-100">
                    Hidden Costs to Budget For
                  </CardTitle>
                </div>
              </CardHeader>
              <CardContent>
                <div className="space-y-4 text-sm text-amber-800 dark:text-amber-200">
                  <div>
                    <h4 className="font-semibold mb-2">Document Preparation ($500-$2,000)</h4>
                    <ul className="space-y-1 ml-4">
                      <li>- Professional translation of documents</li>
                      <li>- Notarization and certification</li>
                      <li>- Educational credential assessment</li>
                      <li>- Police clearance certificates from all countries lived in</li>
                    </ul>
                  </div>
                  <div>
                    <h4 className="font-semibold mb-2">Travel & Processing ($200-$1,000)</h4>
                    <ul className="space-y-1 ml-4">
                      <li>- Biometrics appointment (if required)</li>
                      <li>- Passport photos</li>
                      <li>- Courier services for document submission</li>
                      <li>- Travel for interviews or medical exams</li>
                    </ul>
                  </div>
                  <div>
                    <h4 className="font-semibold mb-2">Relocation Expenses ($5,000-$20,000)</h4>
                    <ul className="space-y-1 ml-4">
                      <li>- Flight tickets for family</li>
                      <li>- Temporary accommodation (1-3 months)</li>
                      <li>- Shipping or storage of belongings</li>
                      <li>- Initial settlement costs (furniture, deposits, etc.)</li>
                    </ul>
                  </div>
                </div>
              </CardContent>
            </Card>

            {costProfile?.proof_of_funds_single && (
              <Card>
                <CardHeader>
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center">
                      <TrendingUp className="w-5 h-5 text-primary" />
                    </div>
                    <div>
                      <CardTitle className="text-2xl">Proof of Funds Requirements</CardTitle>
                      <CardDescription>Money you must have available (not paid as a fee)</CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div>
                    <div className="text-3xl font-bold">
                      {formatCurrencyByCode(costProfile.proof_of_funds_single, currency)}
                    </div>
                    <p className="text-sm text-muted-foreground mt-1">
                      Minimum for single applicant (increases with family size)
                    </p>
                  </div>

                  <div className="space-y-3 text-muted-foreground">
                    <p>
                      <strong className="text-foreground">Proof of funds is NOT a fee you pay.</strong> It's money
                      you must demonstrate in your bank account to prove you can support yourself in {country.name}
                      after arrival.
                    </p>
                    <p>
                      This money must be readily accessible, cannot be borrowed, and should have been in your account
                      for several months before applying. You'll need to provide bank statements as evidence.
                    </p>
                    <p>
                      If you have a job offer in {country.name}, proof of funds requirements may be reduced or waived
                      for certain pathways.
                    </p>
                  </div>
                </CardContent>
              </Card>
            )}

            {costProfile && (
              <Card>
                <CardHeader>
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center">
                      <Users className="w-5 h-5 text-primary" />
                    </div>
                    <div>
                      <CardTitle className="text-2xl">Family Cost Considerations</CardTitle>
                      <CardDescription>How costs increase with family size</CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="grid md:grid-cols-2 gap-6">
                    <div className="space-y-3">
                      <h4 className="font-semibold">Per-Person Costs</h4>
                      <ul className="space-y-2 text-sm text-muted-foreground">
                        <li>- Visa fees typically apply per person</li>
                        <li>- Medical exams required for each family member</li>
                        <li>- Separate passport photos and biometrics</li>
                        <li>- Flight tickets and travel expenses multiply</li>
                      </ul>
                    </div>
                    <div className="space-y-3">
                      <h4 className="font-semibold">Typical Family Multipliers</h4>
                      <ul className="space-y-2 text-sm text-muted-foreground">
                        <li>- Couple: 1.5-2x single person costs</li>
                        <li>- Couple + 1 child: 2-2.5x single costs</li>
                        <li>- Couple + 2 children: 2.5-3x single costs</li>
                        <li>- Proof of funds increases significantly</li>
                      </ul>
                    </div>
                  </div>
                  <Alert>
                    <AlertCircle className="h-4 w-4" />
                    <AlertDescription className="text-sm">
                      Use our calculator to get exact family cost estimates based on your specific situation.
                    </AlertDescription>
                  </Alert>
                </CardContent>
              </Card>
            )}

            {alternativePathways.length > 0 && (
              <Card>
                <CardHeader>
                  <CardTitle className="text-2xl">Compare Alternative Pathways</CardTitle>
                  <CardDescription>
                    Other {country.name} immigration options you may be eligible for
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    {alternativePathways.map((alt) => (
                      <Link
                        key={alt.id}
                        href={`/visa-cost/${params.country}/${alt.pathway_slug}`}
                      >
                        <div className="flex items-center justify-between p-4 rounded-lg border hover:border-primary transition-colors">
                          <div className="space-y-1">
                            <div className="font-medium">{alt.pathway_name}</div>
                            <div className="text-sm text-muted-foreground">
                              {alt.short_description}
                            </div>
                          </div>
                          <div className="flex items-center gap-3">
                            {alt.costProfile && (
                              <div className="text-right">
                                <div className="text-sm font-semibold">
                                  {formatCurrencyByCode(
                                    alt.costProfile.visa_fee_min || 0,
                                    alt.costProfile.currency_code
                                  )}+
                                </div>
                              </div>
                            )}
                            <ArrowRight className="w-5 h-5 text-muted-foreground flex-shrink-0" />
                          </div>
                        </div>
                      </Link>
                    ))}
                  </div>
                  <div className="mt-6">
                    <Link href={`/cost-to-immigrate/${params.country}`}>
                      <Button variant="outline" className="w-full">
                        View All {country.name} Pathways
                      </Button>
                    </Link>
                  </div>
                </CardContent>
              </Card>
            )}

            <SEOFAQSection faqs={faqs} />

            <Card className="bg-primary/5 border-primary/20">
              <CardContent className="pt-8 pb-8 text-center space-y-6">
                <div className="space-y-4">
                  <h3 className="text-2xl font-bold">
                    Get Your Personalized Cost Estimate
                  </h3>
                  <p className="text-muted-foreground max-w-2xl mx-auto">
                    Calculate exact costs for {pathway.pathway_name} based on your family size, optional services,
                    and specific circumstances. Free interactive calculator with instant results.
                  </p>
                </div>
                <div className="flex flex-col sm:flex-row gap-4 justify-center">
                  <Link href={`/immigration-cost-calculator?destination=${params.country}&pathway=${pathway.id}`}>
                    <Button size="lg" className="gap-2">
                      <Calculator className="w-5 h-5" />
                      Calculate Your Total Costs
                    </Button>
                  </Link>
                  <Link href={`/immigration-cost/${params.country}`}>
                    <Button size="lg" variant="outline">
                      Compare All Pathways
                    </Button>
                  </Link>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle>Related Resources</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="grid sm:grid-cols-2 gap-3">
                  <Link href={`/cost-to-immigrate/${params.country}`}>
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">{country.name} Immigration Costs</div>
                      <div className="text-sm text-muted-foreground">All pathway costs overview</div>
                    </div>
                  </Link>
                  <Link href={`/immigrate-to/${params.country}`}>
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">{country.name} Immigration Guide</div>
                      <div className="text-sm text-muted-foreground">Requirements and process</div>
                    </div>
                  </Link>
                  <Link href="/path-finder">
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">Immigration Path Finder</div>
                      <div className="text-sm text-muted-foreground">Find your best route</div>
                    </div>
                  </Link>
                  <Link href="/immigration-cost">
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">All Countries</div>
                      <div className="text-sm text-muted-foreground">Compare worldwide costs</div>
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
