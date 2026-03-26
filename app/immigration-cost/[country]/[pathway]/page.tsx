import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion';
import { Alert, AlertDescription } from '@/components/ui/alert';
import { Calculator, ArrowRight, Chrome as Home, Calendar, CircleAlert as AlertCircle, Globe, Compass, FileText, ChartBar as BarChart2, BookOpen } from 'lucide-react';
import BackNavigation from '@/components/BackNavigation';
import { getAllBlogPosts } from '@/lib/blogData';
import { getCostPathwayRelatedLinks } from '@/lib/seo/relatedLinks';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';
import {
  getPathwayByCountryAndSlug,
  getCostProfileByPathwayId,
  getVisaGuideLinksByPathwayId,
  getPathwayCostContent,
  getPathwaysByCountrySlug,
} from '@/lib/immigrationCostData';
import { formatCurrencyByCode } from '@/lib/immigrationCostCalculator';

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
  const pathway = await getPathwayByCountryAndSlug(params.country, params.pathway);

  if (!pathway) {
    return {
      title: 'Pathway Not Found',
    };
  }

  const title = pathway.seo_title || `${pathway.country.name} ${pathway.pathway_name} Cost | Immigration Calculator`;
  const description =
    pathway.seo_description ||
    `Calculate the cost of ${pathway.pathway_name} for ${pathway.country.name}. Detailed breakdown of visa fees, medical exams, documents, and all immigration costs.`;

  const canonicalUrl = `https://immigrationinfoguide.com/immigration-cost/${params.country}/${params.pathway}`;

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

export default async function ImmigrationCostPathwayPage({
  params,
}: {
  params: { country: string; pathway: string };
}) {
  const pathway = await getPathwayByCountryAndSlug(params.country, params.pathway);

  if (!pathway) {
    notFound();
  }

  const [costProfile, visaGuides, content, siblingPathways, blogPosts] = await Promise.all([
    getCostProfileByPathwayId(pathway.id),
    getVisaGuideLinksByPathwayId(pathway.id),
    getPathwayCostContent(pathway.id),
    getPathwaysByCountrySlug(params.country),
    getAllBlogPosts().catch(() => []),
  ]);

  const relatedLinksGroups = getCostPathwayRelatedLinks({
    countrySlug: params.country,
    pathwaySlug: params.pathway,
    siblingPathwaySlugs: siblingPathways.map((p) => p.pathway_slug),
    blogPosts: blogPosts.map((p) => ({ slug: p.slug, title: p.title, tags: p.tags, category: p.category })),
  });

  return (
    <div className="min-h-screen bg-gradient-to-b from-background to-muted/20">
      <div className="container mx-auto px-4 py-12 md:py-16">
        <div className="max-w-4xl mx-auto space-y-8">
          <BackNavigation fallbackUrl={`/immigration-cost/${params.country}`} label="Back" />
          <div className="flex items-center gap-2 text-sm text-muted-foreground">
            <Link href="/" className="hover:text-foreground">
              <Home className="w-4 h-4" />
            </Link>
            <span>/</span>
            <Link href="/immigration-cost" className="hover:text-foreground">
              Immigration Cost
            </Link>
            <span>/</span>
            <Link href={`/immigration-cost/${params.country}`} className="hover:text-foreground">
              {pathway.country.name}
            </Link>
            <span>/</span>
            <span className="text-foreground">{pathway.pathway_name}</span>
          </div>

          <div className="space-y-4">
            <div className="flex items-center gap-3 flex-wrap">
              <Badge variant="secondary">{pathway.country.region}</Badge>
              <Badge variant="outline">{pathway.category}</Badge>
              {pathway.is_popular && <Badge>Popular</Badge>}
            </div>
            <h1 className="text-4xl md:text-5xl font-bold tracking-tight">
              {pathway.country.name} {pathway.pathway_name} Cost
            </h1>
            {pathway.short_description && (
              <p className="text-lg text-muted-foreground">{pathway.short_description}</p>
            )}
            {content?.intro_md && <p className="text-muted-foreground">{content.intro_md}</p>}
          </div>

          <Card className="bg-muted/40">
            <CardHeader>
              <CardTitle className="text-lg">Full Immigration Cost Stack</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-sm text-muted-foreground mb-3">
                This page covers the complete cost of {pathway.pathway_name} for {pathway.country.name} — not just the visa fee.
                Includes government application fees, medical examinations, language tests, legal fees, and proof of funds requirements.
              </p>
              <div className="flex flex-wrap gap-2">
                {['Visa application fees', 'Medical exams', 'Language tests', 'Legal fees', 'Proof of funds'].map((item) => (
                  <span key={item} className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-primary/10 text-primary">
                    {item}
                  </span>
                ))}
              </div>
            </CardContent>
          </Card>

          {costProfile ? (
            <>
              <Card className="border-2">
                <CardHeader>
                  <CardTitle className="flex items-center justify-between">
                    <span>Fee Overview</span>
                    {costProfile.is_estimate && <Badge variant="secondary">Estimated</Badge>}
                  </CardTitle>
                  <CardDescription>
                    Key costs for {pathway.pathway_name}
                  </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                  {(costProfile.visa_fee_min !== null || costProfile.visa_fee_max !== null) && (
                    <div className="flex justify-between items-baseline">
                      <span className="text-muted-foreground">Visa Application Fee</span>
                      <span className="text-xl font-bold">
                        {formatCurrencyByCode(costProfile.visa_fee_min || 0, costProfile.currency_code)} -{' '}
                        {formatCurrencyByCode(costProfile.visa_fee_max || 0, costProfile.currency_code)}
                      </span>
                    </div>
                  )}

                  {(costProfile.medical_fee_min !== null || costProfile.medical_fee_max !== null) && (
                    <div className="flex justify-between items-baseline">
                      <span className="text-muted-foreground">Medical Examination</span>
                      <span className="font-semibold">
                        {formatCurrencyByCode(costProfile.medical_fee_min || 0, costProfile.currency_code)} -{' '}
                        {formatCurrencyByCode(costProfile.medical_fee_max || 0, costProfile.currency_code)}
                      </span>
                    </div>
                  )}

                  {(costProfile.language_test_fee_min !== null || costProfile.language_test_fee_max !== null) && (
                    <div className="flex justify-between items-baseline">
                      <span className="text-muted-foreground">Language Test</span>
                      <span className="font-semibold">
                        {formatCurrencyByCode(costProfile.language_test_fee_min || 0, costProfile.currency_code)} -{' '}
                        {formatCurrencyByCode(costProfile.language_test_fee_max || 0, costProfile.currency_code)}
                      </span>
                    </div>
                  )}

                  {(costProfile.legal_fee_min !== null || costProfile.legal_fee_max !== null) && (
                    <div className="flex justify-between items-baseline">
                      <span className="text-muted-foreground">Legal Fees (optional)</span>
                      <span className="font-semibold">
                        {formatCurrencyByCode(costProfile.legal_fee_min || 0, costProfile.currency_code)} -{' '}
                        {formatCurrencyByCode(costProfile.legal_fee_max || 0, costProfile.currency_code)}
                      </span>
                    </div>
                  )}

                  {costProfile.proof_of_funds_single !== null && (
                    <div className="pt-4 border-t">
                      <div className="flex justify-between items-baseline">
                        <span className="text-muted-foreground">Proof of Funds (single)</span>
                        <span className="text-xl font-bold text-primary">
                          {formatCurrencyByCode(costProfile.proof_of_funds_single, costProfile.currency_code)}
                        </span>
                      </div>
                      <p className="text-xs text-muted-foreground mt-1">
                        Not a payable fee - must be demonstrated in bank account
                      </p>
                    </div>
                  )}

                  {costProfile.last_verified_at && (
                    <div className="flex items-center gap-2 text-sm text-muted-foreground pt-2">
                      <Calendar className="w-4 h-4" />
                      <span>Last verified: {new Date(costProfile.last_verified_at).toLocaleDateString()}</span>
                    </div>
                  )}

                  {costProfile.source_label && (
                    <p className="text-xs text-muted-foreground">Source: {costProfile.source_label}</p>
                  )}
                </CardContent>
              </Card>

              {costProfile.notes && (
                <Alert>
                  <AlertCircle className="h-4 w-4" />
                  <AlertDescription className="text-sm">{costProfile.notes}</AlertDescription>
                </Alert>
              )}
            </>
          ) : (
            <Card>
              <CardHeader>
                <CardTitle>Cost Data Not Available</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground">
                  Detailed cost information for this pathway is not yet available.
                  Please check official government sources or contact an immigration professional.
                </p>
              </CardContent>
            </Card>
          )}

          {visaGuides.length > 0 && (
            <Card>
              <CardHeader>
                <CardTitle>Related Visa Guides</CardTitle>
                <CardDescription>
                  Learn more about requirements and application process
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-2">
                  {visaGuides.map((guide) => (
                    <Link key={guide.id} href={guide.guide_url}>
                      <div className="flex items-center justify-between p-3 rounded-lg hover:bg-muted transition-colors">
                        <span className="font-medium">{guide.guide_title}</span>
                        <ArrowRight className="w-4 h-4 text-muted-foreground" />
                      </div>
                    </Link>
                  ))}
                </div>
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
                      <AccordionTrigger className="text-left">{faq.question}</AccordionTrigger>
                      <AccordionContent className="text-muted-foreground">{faq.answer}</AccordionContent>
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

          <div className="flex flex-col sm:flex-row gap-4 pt-8">
            <Link href={`/immigration-cost-calculator?destination=${params.country}&pathway=${pathway.id}`} className="flex-1">
              <Button size="lg" className="w-full gap-2">
                <Calculator className="w-5 h-5" />
                Calculate Full Costs
              </Button>
            </Link>
            <Link href={`/immigration-cost/${params.country}`} className="flex-1">
              <Button size="lg" variant="outline" className="w-full gap-2">
                View All {pathway.country.name} Pathways
              </Button>
            </Link>
          </div>

          <div className="border-t pt-8 mt-4">
            <h2 className="text-xl font-bold mb-4">More Resources for {pathway.country.name}</h2>
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
                  <p className="text-xs text-muted-foreground mt-0.5">Side-by-side destination comparison</p>
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
