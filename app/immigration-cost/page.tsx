import { Metadata } from 'next';
import Link from 'next/link';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Calculator, TrendingUp, FileText, ArrowRight } from 'lucide-react';
import { getAllCountriesWithPathways, getCountriesByRegion } from '@/lib/immigrationCostData';

export const metadata: Metadata = {
  title: 'Immigration Cost Calculator | Estimate Visa & Immigration Fees',
  description: 'Calculate the total cost of immigrating to your destination. Transparent visa fees, medical exam costs, legal fees, and proof of funds for 50+ countries.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/immigration-cost',
  },
  openGraph: {
    title: 'Immigration Cost Calculator | Estimate Visa & Immigration Fees',
    description: 'Calculate the total cost of immigrating to your destination. Transparent visa fees, medical exam costs, and proof of funds for 50+ countries.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/immigration-cost',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Immigration Cost Calculator | Estimate Visa & Immigration Fees',
    description: 'Calculate the total cost of immigrating to your destination. Transparent visa fees, medical exam costs, and proof of funds for 50+ countries.',
    images: ['/og-image.webp'],
  },
};

export default async function ImmigrationCostHubPage() {
  const countriesByRegion = await getCountriesByRegion();
  const regions = Object.keys(countriesByRegion).sort();

  const featuredCountries = ['canada', 'united-states', 'australia', 'united-kingdom', 'germany', 'portugal'];

  return (
    <div className="min-h-screen bg-gradient-to-b from-background to-muted/20">
      <div className="container mx-auto px-4 py-12 md:py-16">
        <div className="max-w-6xl mx-auto space-y-12">
          <div className="text-center space-y-4">
            <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-primary/10 mb-4">
              <Calculator className="w-8 h-8 text-primary" />
            </div>
            <h1 className="text-4xl md:text-5xl font-bold tracking-tight">
              Immigration Cost Calculator
            </h1>
            <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
              Understand the true cost of immigrating before you start. Get transparent estimates
              for visa fees, medical exams, language tests, legal fees, and proof of funds requirements.
            </p>
            <div className="flex flex-wrap gap-4 justify-center pt-4">
              <Link href="/immigration-cost-calculator">
                <Button size="lg" className="gap-2">
                  <Calculator className="w-5 h-5" />
                  Calculate Your Costs
                </Button>
              </Link>
            </div>
          </div>

          <div className="grid md:grid-cols-3 gap-6">
            <Card>
              <CardHeader>
                <Calculator className="w-10 h-10 text-primary mb-2" />
                <CardTitle>Transparent Estimates</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground">
                  Get detailed breakdowns of all immigration costs including government fees,
                  testing, documents, and optional services.
                </p>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <TrendingUp className="w-10 h-10 text-primary mb-2" />
                <CardTitle>Proof of Funds</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground">
                  See exact proof of funds requirements by country and pathway.
                  Plan your finances with confidence.
                </p>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <FileText className="w-10 h-10 text-primary mb-2" />
                <CardTitle>50+ Countries</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground">
                  Comprehensive cost data for major immigration destinations worldwide
                  across multiple visa types.
                </p>
              </CardContent>
            </Card>
          </div>

          <div>
            <h2 className="text-3xl font-bold mb-6">Popular Destinations</h2>
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
              {featuredCountries.map((slug) => {
                const country = Object.values(countriesByRegion)
                  .flat()
                  .find((c) => c.slug === slug);

                if (!country) return null;

                return (
                  <Link key={slug} href={`/immigration-cost/${slug}`}>
                    <Card className="hover:border-primary transition-colors h-full">
                      <CardHeader>
                        <CardTitle className="flex items-center justify-between">
                          {country.name}
                          <ArrowRight className="w-5 h-5 text-muted-foreground" />
                        </CardTitle>
                        <CardDescription>{country.region}</CardDescription>
                      </CardHeader>
                    </Card>
                  </Link>
                );
              })}
            </div>
          </div>

          <div>
            <h2 className="text-3xl font-bold mb-6">All Countries by Region</h2>
            <div className="space-y-8">
              {regions.map((region) => (
                <div key={region}>
                  <h3 className="text-xl font-semibold mb-4 flex items-center gap-2">
                    {region}
                    <Badge variant="secondary">{countriesByRegion[region].length}</Badge>
                  </h3>
                  <div className="grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3">
                    {countriesByRegion[region].map((country) => (
                      <Link key={country.slug} href={`/immigration-cost/${country.slug}`}>
                        <Card className="hover:border-primary transition-colors">
                          <CardHeader className="p-4">
                            <CardTitle className="text-base flex items-center justify-between">
                              {country.name}
                              <ArrowRight className="w-4 h-4 text-muted-foreground" />
                            </CardTitle>
                          </CardHeader>
                        </Card>
                      </Link>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          </div>

          <Card>
            <CardHeader>
              <CardTitle>Frequently Asked Questions</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <h3 className="font-semibold mb-2">How accurate are these cost estimates?</h3>
                <p className="text-muted-foreground text-sm">
                  Our estimates are based on official government fee schedules and industry averages.
                  However, individual costs can vary based on your circumstances, exchange rates,
                  and whether you use professional services. Always verify current fees before applying.
                </p>
              </div>
              <div>
                <h3 className="font-semibold mb-2">What is proof of funds?</h3>
                <p className="text-muted-foreground text-sm">
                  Proof of funds is money you must demonstrate in your bank account to show you can
                  support yourself after arrival. This is not a fee you pay, but funds you must have available.
                </p>
              </div>
              <div>
                <h3 className="font-semibold mb-2">Are legal fees required?</h3>
                <p className="text-muted-foreground text-sm">
                  No, you can apply for most immigration pathways yourself. However, many applicants
                  choose to use immigration lawyers or consultants, especially for complex cases.
                  Our calculator lets you include or exclude these optional costs.
                </p>
              </div>
              <div>
                <h3 className="font-semibold mb-2">Do costs vary by nationality?</h3>
                <p className="text-muted-foreground text-sm">
                  Some countries have different fees or requirements based on your nationality.
                  Our calculator provides general estimates that apply to most applicants, but
                  you should verify specific requirements for your situation.
                </p>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}
