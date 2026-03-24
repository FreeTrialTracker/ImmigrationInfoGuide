import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion';
import { Calculator, ArrowRight, Chrome as Home, Globe, Compass, FileText, ChartBar as BarChart2, BookOpen } from 'lucide-react';
import { getAllBlogPosts } from '@/lib/blogData';
import { getCostCountryRelatedLinks } from '@/lib/seo/relatedLinks';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';
import {
  getCountryBySlug,
  getPathwaysByCountrySlug,
  getCountryCostContent,
  getCostProfileByPathwayId,
  getActiveDestinationCountries,
} from '@/lib/immigrationCostData';
import { formatCurrencyByCode } from '@/lib/immigrationCostCalculator';

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
  const country = await getCountryBySlug(params.country);

  if (!country) {
    return {
      title: 'Country Not Found',
    };
  }

  const canonicalUrl = `https://immigrationinfoguide.com/immigration-cost/${params.country}`;
  const title = `Cost to Immigrate to ${country.name} | Immigration Cost Calculator`;
  const description = `Calculate the total cost of immigrating to ${country.name}. Visa fees, medical exams, legal costs, and proof of funds for all immigration pathways.`;

  return {
    title,
    description,
    alternates: { canonical: canonicalUrl },
    openGraph: {
      title,
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

export default async function ImmigrationCostCountryPage({ params }: { params: { country: string } }) {
  const country = await getCountryBySlug(params.country);

  if (!country) {
    notFound();
  }

  const [pathways, content, blogPosts] = await Promise.all([
    getPathwaysByCountrySlug(params.country),
    getCountryCostContent(country.id),
    getAllBlogPosts().catch(() => []),
  ]);

  const pathwaysWithCosts = await Promise.all(
    pathways.map(async (pathway) => {
      const costProfile = await getCostProfileByPathwayId(pathway.id);
      return { ...pathway, costProfile };
    })
  );

  const avgCostRange =
    pathwaysWithCosts.length > 0
      ? pathwaysWithCosts.reduce(
          (acc, p) => {
            if (p.costProfile) {
              const min = p.costProfile.visa_fee_min || 0;
              const max = p.costProfile.visa_fee_max || 0;
              return {
                min: Math.min(acc.min, min),
                max: Math.max(acc.max, max),
                currency: p.costProfile.currency_code,
              };
            }
            return acc;
          },
          { min: Infinity, max: 0, currency: 'USD' }
        )
      : null;

  const relatedLinksGroups = getCostCountryRelatedLinks({
    countrySlug: params.country,
    pathwaySlugs: pathways.map((p) => p.pathway_slug),
    blogPosts: blogPosts.map((p) => ({ slug: p.slug, title: p.title, tags: p.tags, category: p.category })),
  });

  return (
    <div className="min-h-screen bg-gradient-to-b from-background to-muted/20">
      <div className="container mx-auto px-4 py-12 md:py-16">
        <div className="max-w-4xl mx-auto space-y-8">
          <div className="flex items-center gap-2 text-sm text-muted-foreground">
            <Link href="/" className="hover:text-foreground">
              <Home className="w-4 h-4" />
            </Link>
            <span>/</span>
            <Link href="/immigration-cost" className="hover:text-foreground">
              Immigration Cost
            </Link>
            <span>/</span>
            <span className="text-foreground">{country.name}</span>
          </div>

          <div className="space-y-4">
            <div className="flex items-center gap-3">
              <Badge variant="secondary">{country.region}</Badge>
              <Badge variant="outline">{pathways.length} pathways available</Badge>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold tracking-tight">
              Cost to Immigrate to {country.name}
            </h1>
            {content?.intro_md && (
              <p className="text-lg text-muted-foreground">{content.intro_md}</p>
            )}
          </div>

          {avgCostRange && avgCostRange.min !== Infinity && (
            <Card>
              <CardHeader>
                <CardTitle>Typical Cost Range</CardTitle>
                <CardDescription>
                  Average visa application fees across all pathways
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="text-3xl font-bold">
                  {formatCurrencyByCode(avgCostRange.min, avgCostRange.currency)} -{' '}
                  {formatCurrencyByCode(avgCostRange.max, avgCostRange.currency)}
                </div>
                <p className="text-sm text-muted-foreground mt-2">
                  This is for visa application fees only. Total costs including medical exams,
                  documents, and other fees will be higher.
                </p>
              </CardContent>
            </Card>
          )}

          <div>
            <div className="flex items-center justify-between mb-3">
              <h2 className="text-3xl font-bold">Pathway Cost Comparison</h2>
              <Link href={`/immigration-cost-calculator?destination=${params.country}`}>
                <Button variant="outline" size="sm" className="gap-2">
                  <Calculator className="w-4 h-4" />
                  Calculate Costs
                </Button>
              </Link>
            </div>
            <p className="text-sm text-muted-foreground mb-6">
              Compare visa fees across all available immigration pathways to {country.name}. Select a pathway for the full cost breakdown including medical, legal, and proof of funds requirements.
            </p>

            <div className="grid gap-4">
              {pathwaysWithCosts.map((pathway) => (
                <Link key={pathway.id} href={`/immigration-cost/${params.country}/${pathway.pathway_slug}`}>
                  <Card className="hover:border-primary transition-colors">
                    <CardHeader>
                      <div className="flex items-start justify-between">
                        <div className="space-y-1">
                          <CardTitle className="flex items-center gap-2">
                            {pathway.pathway_name}
                            {pathway.is_popular && (
                              <Badge variant="secondary" className="text-xs">Popular</Badge>
                            )}
                          </CardTitle>
                          <CardDescription>{pathway.short_description}</CardDescription>
                        </div>
                        <ArrowRight className="w-5 h-5 text-muted-foreground flex-shrink-0" />
                      </div>
                    </CardHeader>
                    {pathway.costProfile && (
                      <CardContent>
                        <div className="flex items-baseline gap-2">
                          <span className="text-sm text-muted-foreground">Estimated cost:</span>
                          <span className="font-semibold">
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
                          <span className="text-xs text-muted-foreground">visa fee only</span>
                        </div>
                      </CardContent>
                    )}
                  </Card>
                </Link>
              ))}
            </div>
          </div>

          {content?.warning_md && (
            <Card className="border-amber-200 dark:border-amber-900 bg-amber-50 dark:bg-amber-950/20">
              <CardHeader>
                <CardTitle className="text-amber-900 dark:text-amber-100">Important Information</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-amber-800 dark:text-amber-200">{content.warning_md}</p>
              </CardContent>
            </Card>
          )}

          {content?.faq_json && content.faq_json.length > 0 && (
            <Card>
              <CardHeader>
                <CardTitle>Frequently Asked Questions</CardTitle>
              </CardHeader>
              <CardContent>
                <Accordion type="single" collapsible className="w-full">
                  {content.faq_json.map((faq, index) => (
                    <AccordionItem key={index} value={`faq-${index}`}>
                      <AccordionTrigger className="text-left">
                        {faq.question}
                      </AccordionTrigger>
                      <AccordionContent className="text-muted-foreground">
                        {faq.answer}
                      </AccordionContent>
                    </AccordionItem>
                  ))}
                </Accordion>
              </CardContent>
            </Card>
          )}

          {content?.next_steps_md && (
            <Card>
              <CardHeader>
                <CardTitle>Next Steps</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground">{content.next_steps_md}</p>
              </CardContent>
            </Card>
          )}

          <div className="flex justify-center pt-8">
            <Link href={`/immigration-cost-calculator?destination=${params.country}`}>
              <Button size="lg" className="gap-2">
                <Calculator className="w-5 h-5" />
                Calculate Your {country.name} Immigration Costs
              </Button>
            </Link>
          </div>

          <div className="border-t pt-8 mt-4">
            <h2 className="text-xl font-bold mb-4">More Resources for {country.name}</h2>
            <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-3">
              <Link
                href={`/immigrate-to/${params.country}`}
                className="flex items-start gap-3 rounded-lg border border-border p-4 hover:border-primary hover:shadow-sm transition-all group"
              >
                <Compass className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                <div>
                  <p className="text-sm font-semibold group-hover:text-primary">Immigration Pathways</p>
                  <p className="text-xs text-muted-foreground mt-0.5">Work, residency & digital nomad</p>
                </div>
              </Link>
              <Link
                href={`/country/${params.country}`}
                className="flex items-start gap-3 rounded-lg border border-border p-4 hover:border-primary hover:shadow-sm transition-all group"
              >
                <Globe className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                <div>
                  <p className="text-sm font-semibold group-hover:text-primary">Country Guide</p>
                  <p className="text-xs text-muted-foreground mt-0.5">Cost of living, jobs & culture</p>
                </div>
              </Link>
              <Link
                href={`/path-finder?destination=${params.country}`}
                className="flex items-start gap-3 rounded-lg border border-border p-4 hover:border-primary hover:shadow-sm transition-all group"
              >
                <Compass className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                <div>
                  <p className="text-sm font-semibold group-hover:text-primary">Path Finder</p>
                  <p className="text-xs text-muted-foreground mt-0.5">Personalised pathway recommendations</p>
                </div>
              </Link>
              <Link
                href="/document-checklist"
                className="flex items-start gap-3 rounded-lg border border-border p-4 hover:border-primary hover:shadow-sm transition-all group"
              >
                <FileText className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                <div>
                  <p className="text-sm font-semibold group-hover:text-primary">Document Checklist</p>
                  <p className="text-xs text-muted-foreground mt-0.5">Prepare your application documents</p>
                </div>
              </Link>
              <Link
                href="/country-comparison"
                className="flex items-start gap-3 rounded-lg border border-border p-4 hover:border-primary hover:shadow-sm transition-all group"
              >
                <BarChart2 className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                <div>
                  <p className="text-sm font-semibold group-hover:text-primary">Compare Countries</p>
                  <p className="text-xs text-muted-foreground mt-0.5">Side-by-side cost comparison</p>
                </div>
              </Link>
              <Link
                href="/immigration-guides"
                className="flex items-start gap-3 rounded-lg border border-border p-4 hover:border-primary hover:shadow-sm transition-all group"
              >
                <BookOpen className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                <div>
                  <p className="text-sm font-semibold group-hover:text-primary">Country Guides</p>
                  <p className="text-xs text-muted-foreground mt-0.5">Deep-dive immigration research</p>
                </div>
              </Link>
            </div>
          </div>

          <RelatedLinksSection groups={relatedLinksGroups} />
        </div>
      </div>
    </div>
  );
}
