import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Calculator, ArrowRight, TrendingUp, DollarSign, Check, X, FileText, Plane } from 'lucide-react';
import BackNavigation from '@/components/BackNavigation';
import { getCountryComparison, generateComparisonFAQs } from '@/lib/seoHelpers';
import { formatCurrencyByCode } from '@/lib/immigrationCostCalculator';
import { SEOBreadcrumbs } from '@/components/SEOBreadcrumbs';
import { SEOFAQSection } from '@/components/SEOFAQSection';
import { StructuredData } from '@/components/StructuredData';

export async function generateMetadata({
  params,
}: {
  params: { comparison: string };
}): Promise<Metadata> {
  const parts = params.comparison.split('-vs-');
  if (parts.length !== 2) {
    return { title: 'Invalid Comparison' };
  }

  const comparison = await getCountryComparison(parts[0], parts[1]);

  if (!comparison) {
    return {
      title: 'Comparison Not Found',
    };
  }

  const { country1, country2 } = comparison;

  const title = `Immigration Cost: ${country1.name} vs ${country2.name} | Which is Cheaper?`;
  const description = `Compare immigration costs between ${country1.name} and ${country2.name}. Visa fees, proof of funds, pathways, and total expenses compared side by side.`;
  const canonicalUrl = `https://immigrationinfoguide.com/immigration-cost-compare/${params.comparison}`;

  return {
    title,
    description,
    alternates: { canonical: canonicalUrl },
    openGraph: {
      title: `${country1.name} vs ${country2.name} Immigration Cost Comparison`,
      description,
      type: 'article',
      url: canonicalUrl,
      images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
    },
    twitter: {
      card: 'summary_large_image',
      title,
      description,
      images: ['/og-image.webp'],
    },
  };
}

export default async function ImmigrationCostComparePage({
  params,
}: {
  params: { comparison: string };
}) {
  const parts = params.comparison.split('-vs-');
  if (parts.length !== 2) {
    notFound();
  }

  const comparison = await getCountryComparison(parts[0], parts[1]);

  if (!comparison) {
    notFound();
  }

  const { country1, country2, pathways1, pathways2, costRange1, costRange2 } = comparison;
  const faqs = generateComparisonFAQs(comparison);

  const breadcrumbs = [
    { label: 'Immigration Cost', href: '/immigration-cost' },
    { label: 'Compare', href: '/immigration-cost' },
    {
      label: `${country1.name} vs ${country2.name}`,
      href: `/immigration-cost-compare/${params.comparison}`,
    },
  ];

  const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://immigrationinfoguide.com';
  const pageUrl = `${baseUrl}/immigration-cost-compare/${params.comparison}`;

  const cheaper =
    costRange1 && costRange2
      ? costRange1.min < costRange2.min
        ? country1
        : country2
      : null;

  return (
    <>
      <StructuredData
        type="BreadcrumbList"
        breadcrumbs={[
          { name: 'Home', url: baseUrl },
          { name: 'Immigration Cost', url: `${baseUrl}/immigration-cost` },
          { name: `${country1.name} vs ${country2.name}`, url: pageUrl },
        ]}
      />
      <StructuredData type="FAQPage" faqs={faqs} />
      <StructuredData
        type="WebPage"
        webpage={{
          name: `${country1.name} vs ${country2.name} Immigration Cost Comparison`,
          description: `Compare immigration costs between ${country1.name} and ${country2.name}`,
          url: pageUrl,
        }}
      />

      <div className="min-h-screen bg-gradient-to-b from-background to-muted/20">
        <div className="container mx-auto px-4 py-12 md:py-16">
          <div className="max-w-6xl mx-auto space-y-12">
            <BackNavigation fallbackUrl="/country-comparison" label="Back to Comparisons" />
            <SEOBreadcrumbs items={breadcrumbs} />

            <div className="space-y-6">
              <div className="flex items-center gap-3 flex-wrap">
                <Badge variant="secondary" className="text-sm">{country1.region}</Badge>
                <span className="text-muted-foreground">vs</span>
                <Badge variant="secondary" className="text-sm">{country2.region}</Badge>
              </div>

              <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold tracking-tight">
                {country1.name} vs {country2.name}: Immigration Cost Comparison
              </h1>

              <p className="text-xl text-muted-foreground leading-relaxed">
                Side-by-side comparison of immigration costs for {country1.name} and {country2.name}. Covers visa application fees across key pathways, proof-of-funds requirements, medical exam costs, and other typical expenses. For eligibility and pathway details, see the full immigration hubs for each country.
              </p>

              {cheaper && (
                <div className="bg-primary/10 border border-primary/20 rounded-lg p-6">
                  <div className="flex items-center gap-3">
                    <TrendingUp className="w-6 h-6 text-primary" />
                    <p className="text-lg font-semibold">
                      <span className="text-primary">{cheaper.name}</span> generally has lower immigration costs
                      based on visa application fees.
                    </p>
                  </div>
                  <p className="text-sm text-muted-foreground mt-2 ml-9">
                    However, total costs depend on your chosen pathway, family size, and individual circumstances.
                    Both countries offer various options at different price points.
                  </p>
                </div>
              )}

              <div className="flex gap-4 pt-2">
                <Link href="/immigration-cost-calculator">
                  <Button size="lg" className="gap-2">
                    <Calculator className="w-5 h-5" />
                    Calculate Costs
                  </Button>
                </Link>
              </div>

              <div className="grid sm:grid-cols-2 gap-4 mt-2 p-5 bg-sky-50 border border-sky-200 rounded-xl">
                <a
                  href="https://www.visainfoguide.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-start gap-3 group"
                >
                  <FileText className="h-5 w-5 text-sky-600 mt-0.5 flex-shrink-0" />
                  <div>
                    <p className="text-sm font-semibold text-sky-900 group-hover:text-sky-700 transition-colors">Check entry visa requirements →</p>
                    <p className="text-xs text-sky-700 mt-0.5">Planning a scouting visit? Check tourist visa requirements for {country1.name} and {country2.name} on VisaInfoGuide.com.</p>
                  </div>
                </a>
                <a
                  href="https://www.restinairport.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-start gap-3 group"
                >
                  <Plane className="h-5 w-5 text-sky-600 mt-0.5 flex-shrink-0" />
                  <div>
                    <p className="text-sm font-semibold text-sky-900 group-hover:text-sky-700 transition-colors">Find airport transit hotels →</p>
                    <p className="text-xs text-sky-700 mt-0.5">Traveling to compare these destinations in person? Find airside hotels for long-haul layovers at RestInAirport.com.</p>
                  </div>
                </a>
              </div>
            </div>

            {costRange1 && costRange2 && (
              <Card className="border-2">
                <CardHeader>
                  <div className="flex items-center gap-3">
                    <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
                      <DollarSign className="w-6 h-6 text-primary" />
                    </div>
                    <div>
                      <CardTitle className="text-2xl">Visa Fee Comparison</CardTitle>
                      <CardDescription>
                        Typical application fees across all pathways
                      </CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="grid md:grid-cols-2 gap-8">
                    <div className="space-y-3">
                      <div className="flex items-center justify-between">
                        <h3 className="text-lg font-semibold">{country1.name}</h3>
                        <Badge variant="secondary">{country1.region}</Badge>
                      </div>
                      <div className="text-3xl font-bold text-primary">
                        {formatCurrencyByCode(costRange1.min, costRange1.currency)} -{' '}
                        {formatCurrencyByCode(costRange1.max, costRange1.currency)}
                      </div>
                      <p className="text-sm text-muted-foreground">
                        Visa application fee range for {pathways1.length}+ pathways
                      </p>
                      <Link href={`/cost-to-immigrate/${parts[0]}`}>
                        <Button variant="outline" size="sm" className="w-full mt-4 gap-2">
                          View {country1.name} Details
                          <ArrowRight className="w-4 h-4" />
                        </Button>
                      </Link>
                    </div>

                    <div className="space-y-3">
                      <div className="flex items-center justify-between">
                        <h3 className="text-lg font-semibold">{country2.name}</h3>
                        <Badge variant="secondary">{country2.region}</Badge>
                      </div>
                      <div className="text-3xl font-bold text-primary">
                        {formatCurrencyByCode(costRange2.min, costRange2.currency)} -{' '}
                        {formatCurrencyByCode(costRange2.max, costRange2.currency)}
                      </div>
                      <p className="text-sm text-muted-foreground">
                        Visa application fee range for {pathways2.length}+ pathways
                      </p>
                      <Link href={`/cost-to-immigrate/${parts[1]}`}>
                        <Button variant="outline" size="sm" className="w-full mt-4 gap-2">
                          View {country2.name} Details
                          <ArrowRight className="w-4 h-4" />
                        </Button>
                      </Link>
                    </div>
                  </div>
                </CardContent>
              </Card>
            )}

            <Card>
              <CardHeader>
                <CardTitle className="text-2xl">Popular Immigration Pathways</CardTitle>
                <CardDescription>Compare available routes to each country</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="grid md:grid-cols-2 gap-6">
                  <div className="space-y-4">
                    <h3 className="font-semibold text-lg border-b pb-2">{country1.name}</h3>
                    <div className="space-y-3">
                      {pathways1.slice(0, 5).map((pathway) => (
                        <Link
                          key={pathway.id}
                          href={`/visa-cost/${parts[0]}/${pathway.pathway_slug}`}
                        >
                          <div className="p-3 rounded-lg border hover:border-primary transition-colors">
                            <div className="flex items-center justify-between">
                              <div className="space-y-1 flex-1">
                                <div className="font-medium text-sm">{pathway.pathway_name}</div>
                                {pathway.costProfile && (
                                  <div className="text-xs text-muted-foreground">
                                    From {formatCurrencyByCode(
                                      pathway.costProfile.visa_fee_min || 0,
                                      pathway.costProfile.currency_code
                                    )}
                                  </div>
                                )}
                              </div>
                              <ArrowRight className="w-4 h-4 text-muted-foreground flex-shrink-0" />
                            </div>
                          </div>
                        </Link>
                      ))}
                    </div>
                  </div>

                  <div className="space-y-4">
                    <h3 className="font-semibold text-lg border-b pb-2">{country2.name}</h3>
                    <div className="space-y-3">
                      {pathways2.slice(0, 5).map((pathway) => (
                        <Link
                          key={pathway.id}
                          href={`/visa-cost/${parts[1]}/${pathway.pathway_slug}`}
                        >
                          <div className="p-3 rounded-lg border hover:border-primary transition-colors">
                            <div className="flex items-center justify-between">
                              <div className="space-y-1 flex-1">
                                <div className="font-medium text-sm">{pathway.pathway_name}</div>
                                {pathway.costProfile && (
                                  <div className="text-xs text-muted-foreground">
                                    From {formatCurrencyByCode(
                                      pathway.costProfile.visa_fee_min || 0,
                                      pathway.costProfile.currency_code
                                    )}
                                  </div>
                                )}
                              </div>
                              <ArrowRight className="w-4 h-4 text-muted-foreground flex-shrink-0" />
                            </div>
                          </div>
                        </Link>
                      ))}
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle className="text-2xl">Cost Factors Comparison</CardTitle>
                <CardDescription>Key cost considerations for each country</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="overflow-x-auto">
                  <table className="w-full">
                    <thead>
                      <tr className="border-b">
                        <th className="text-left p-4 font-semibold">Factor</th>
                        <th className="text-center p-4 font-semibold">{country1.name}</th>
                        <th className="text-center p-4 font-semibold">{country2.name}</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y">
                      <tr>
                        <td className="p-4">
                          <div className="font-medium">Visa Application Fees</div>
                          <div className="text-sm text-muted-foreground">Government processing costs</div>
                        </td>
                        <td className="p-4 text-center">
                          {costRange1 ? (
                            <div className="text-sm font-medium">
                              {formatCurrencyByCode(costRange1.min, costRange1.currency)}+
                            </div>
                          ) : (
                            <span className="text-muted-foreground">Varies</span>
                          )}
                        </td>
                        <td className="p-4 text-center">
                          {costRange2 ? (
                            <div className="text-sm font-medium">
                              {formatCurrencyByCode(costRange2.min, costRange2.currency)}+
                            </div>
                          ) : (
                            <span className="text-muted-foreground">Varies</span>
                          )}
                        </td>
                      </tr>
                      <tr>
                        <td className="p-4">
                          <div className="font-medium">Medical Exams Required</div>
                          <div className="text-sm text-muted-foreground">Health screening costs</div>
                        </td>
                        <td className="p-4 text-center">
                          <Check className="w-5 h-5 text-green-600 mx-auto" />
                        </td>
                        <td className="p-4 text-center">
                          <Check className="w-5 h-5 text-green-600 mx-auto" />
                        </td>
                      </tr>
                      <tr>
                        <td className="p-4">
                          <div className="font-medium">Language Tests</div>
                          <div className="text-sm text-muted-foreground">Proficiency exam requirements</div>
                        </td>
                        <td className="p-4 text-center">
                          <Check className="w-5 h-5 text-green-600 mx-auto" />
                        </td>
                        <td className="p-4 text-center">
                          <Check className="w-5 h-5 text-green-600 mx-auto" />
                        </td>
                      </tr>
                      <tr>
                        <td className="p-4">
                          <div className="font-medium">Proof of Funds</div>
                          <div className="text-sm text-muted-foreground">Money to demonstrate</div>
                        </td>
                        <td className="p-4 text-center">
                          <div className="text-sm font-medium">Required</div>
                        </td>
                        <td className="p-4 text-center">
                          <div className="text-sm font-medium">Required</div>
                        </td>
                      </tr>
                      <tr>
                        <td className="p-4">
                          <div className="font-medium">Legal Fees (Optional)</div>
                          <div className="text-sm text-muted-foreground">Immigration lawyer costs</div>
                        </td>
                        <td className="p-4 text-center">
                          <div className="text-sm">$2,000-$10,000</div>
                        </td>
                        <td className="p-4 text-center">
                          <div className="text-sm">$2,000-$10,000</div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </CardContent>
            </Card>

            <Card className="border-primary/20 bg-primary/5">
              <CardHeader>
                <CardTitle className="text-2xl">Which Destination is Right for You?</CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <p className="text-sm text-muted-foreground">
                  Immigration cost is one factor. The more decisive factors are usually eligibility, long-term settlement potential, and the specific rights each route grants. Use the guidance below to narrow down your decision.
                </p>
                <div className="grid md:grid-cols-2 gap-6">
                  <div className="space-y-4 bg-background rounded-lg p-5">
                    <h3 className="font-semibold text-lg border-b pb-2">Consider {country1.name} if:</h3>
                    <ul className="space-y-3 text-sm text-muted-foreground">
                      <li className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
                        Your qualifications match {country1.name}&apos;s available pathway types — verify specific eligibility criteria on the {country1.name} immigration hub.
                      </li>
                      <li className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
                        You need a specific outcome (work authorization, permanent residence, or citizenship) that {country1.name}&apos;s routes support on your timeline.
                      </li>
                      <li className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
                        You have professional connections, a job offer, or existing family ties in {country1.name} — these are significant eligibility advantages.
                      </li>
                      <li className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
                        The language of official business and daily life in {country1.name} is manageable for your situation.
                      </li>
                    </ul>
                  </div>

                  <div className="space-y-4 bg-background rounded-lg p-5">
                    <h3 className="font-semibold text-lg border-b pb-2">Consider {country2.name} if:</h3>
                    <ul className="space-y-3 text-sm text-muted-foreground">
                      <li className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
                        {country2.name}&apos;s immigration pathway types align more closely with your purpose — verify eligibility on the {country2.name} immigration hub.
                      </li>
                      <li className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
                        The proof-of-funds and financial requirements of {country2.name}&apos;s routes are more compatible with your financial profile.
                      </li>
                      <li className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
                        You prefer the employment market conditions, healthcare access, or long-term settlement conditions in {country2.region}.
                      </li>
                      <li className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
                        {country2.name}&apos;s processing timelines and visa categories are more practical for your planned arrival date.
                      </li>
                    </ul>
                  </div>
                </div>

                <div className="bg-background rounded-lg p-6 space-y-3 border border-border">
                  <p className="font-medium">Key decision factors beyond cost</p>
                  <p className="text-sm text-muted-foreground">
                    Immigration cost comparisons are useful for budgeting, but your actual eligibility, language requirements, long-term settlement rights, and work authorization conditions matter more. Use our{' '}
                    <Link href="/path-finder" className="text-primary hover:underline">Immigration Path Finder</Link>{' '}
                    to compare which routes you qualify for in both countries, and review the full immigration hubs for{' '}
                    <Link href={`/immigrate-to/${parts[0]}`} className="text-primary hover:underline">{country1.name}</Link>{' '}
                    and{' '}
                    <Link href={`/immigrate-to/${parts[1]}`} className="text-primary hover:underline">{country2.name}</Link>{' '}
                    before making a decision.
                  </p>
                </div>
              </CardContent>
            </Card>

            <SEOFAQSection faqs={faqs} />

            <Card className="bg-primary/5 border-primary/20">
              <CardContent className="pt-8 pb-8 text-center space-y-6">
                <div className="space-y-4">
                  <h3 className="text-2xl font-bold">Calculate Your Exact Immigration Costs</h3>
                  <p className="text-muted-foreground max-w-2xl mx-auto">
                    Use our interactive calculator to compare personalized cost estimates for both countries
                    based on your pathway, family size, and circumstances.
                  </p>
                </div>
                <div className="flex flex-col sm:flex-row gap-4 justify-center">
                  <Link href={`/immigration-cost-calculator?destination=${parts[0]}`}>
                    <Button size="lg" className="gap-2">
                      <Calculator className="w-5 h-5" />
                      Calculate {country1.name} Costs
                    </Button>
                  </Link>
                  <Link href={`/immigration-cost-calculator?destination=${parts[1]}`}>
                    <Button size="lg" variant="outline" className="gap-2">
                      <Calculator className="w-5 h-5" />
                      Calculate {country2.name} Costs
                    </Button>
                  </Link>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle>More Country Comparisons</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="grid sm:grid-cols-2 gap-3">
                  <Link href="/immigration-cost">
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">All Countries</div>
                      <div className="text-sm text-muted-foreground">Compare worldwide immigration costs</div>
                    </div>
                  </Link>
                  <Link href="/path-finder">
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">Path Finder Tool</div>
                      <div className="text-sm text-muted-foreground">Find your best pathway</div>
                    </div>
                  </Link>
                  <Link href={`/immigrate-to/${parts[0]}`}>
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">{country1.name} Guide</div>
                      <div className="text-sm text-muted-foreground">Full immigration information</div>
                    </div>
                  </Link>
                  <Link href={`/immigrate-to/${parts[1]}`}>
                    <div className="p-4 rounded-lg border hover:border-primary transition-colors">
                      <div className="font-medium">{country2.name} Guide</div>
                      <div className="text-sm text-muted-foreground">Full immigration information</div>
                    </div>
                  </Link>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </>
  );
}
