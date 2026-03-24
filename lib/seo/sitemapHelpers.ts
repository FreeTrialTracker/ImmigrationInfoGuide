import { createClient } from '@supabase/supabase-js';
import { INDEXABLE_PASSPORTS } from '@/lib/passport/passportData';

const BASE_URL = 'https://immigrationinfoguide.com';

const FALLBACK_DATE = '2025-01-01';

const PRIORITY_DESTINATIONS = new Set([
  'canada', 'united-states', 'united-kingdom', 'australia', 'germany',
  'france', 'spain', 'portugal', 'new-zealand', 'ireland',
  'netherlands', 'italy', 'singapore', 'japan', 'thailand',
  'malaysia', 'mexico', 'brazil', 'argentina', 'south-africa',
]);

export interface SitemapEntry {
  url: string;
  lastmod: string;
  changefreq: string;
  priority: number;
}

function getClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );
}

function toISODate(val: string | Date | null | undefined): string {
  if (!val) return FALLBACK_DATE;
  try {
    const d = new Date(val);
    if (isNaN(d.getTime())) return FALLBACK_DATE;
    return d.toISOString().split('T')[0];
  } catch {
    return FALLBACK_DATE;
  }
}

export function buildXML(entries: SitemapEntry[]): string {
  const urls = entries
    .map(
      (e) =>
        `  <url>\n    <loc>${e.url}</loc>\n    <lastmod>${e.lastmod}</lastmod>\n    <changefreq>${e.changefreq}</changefreq>\n    <priority>${e.priority.toFixed(1)}</priority>\n  </url>`
    )
    .join('\n');
  return `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${urls}\n</urlset>`;
}

export function buildIndexXML(children: string[]): string {
  const sitemaps = children
    .map((url) => `  <sitemap>\n    <loc>${url}</loc>\n  </sitemap>`)
    .join('\n');
  return `<?xml version="1.0" encoding="UTF-8"?>\n<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${sitemaps}\n</sitemapindex>`;
}

export function xmlResponse(xml: string): Response {
  return new Response(xml, {
    headers: {
      'Content-Type': 'application/xml; charset=utf-8',
      'Cache-Control': 'public, max-age=3600, stale-while-revalidate=86400',
    },
  });
}

export async function getStaticEntries(): Promise<SitemapEntry[]> {
  const today = new Date().toISOString().split('T')[0];
  return [
    { url: BASE_URL, lastmod: today, changefreq: 'daily', priority: 1.0 },
    { url: `${BASE_URL}/immigration-cost`, lastmod: today, changefreq: 'weekly', priority: 0.9 },
    { url: `${BASE_URL}/immigration-cost-calculator`, lastmod: today, changefreq: 'weekly', priority: 0.9 },
    { url: `${BASE_URL}/immigration-guides`, lastmod: today, changefreq: 'weekly', priority: 0.8 },
    { url: `${BASE_URL}/blog`, lastmod: today, changefreq: 'daily', priority: 0.8 },
    { url: `${BASE_URL}/path-finder`, lastmod: today, changefreq: 'weekly', priority: 0.8 },
    { url: `${BASE_URL}/country-finder`, lastmod: today, changefreq: 'weekly', priority: 0.8 },
    { url: `${BASE_URL}/country-comparison`, lastmod: today, changefreq: 'weekly', priority: 0.7 },
    { url: `${BASE_URL}/tools`, lastmod: today, changefreq: 'weekly', priority: 0.7 },
    { url: `${BASE_URL}/global-travel-resources`, lastmod: today, changefreq: 'monthly', priority: 0.7 },
    { url: `${BASE_URL}/visa-entry-guides`, lastmod: today, changefreq: 'weekly', priority: 0.7 },
    { url: `${BASE_URL}/document-checklist`, lastmod: today, changefreq: 'monthly', priority: 0.7 },
    { url: `${BASE_URL}/passports`, lastmod: today, changefreq: 'weekly', priority: 0.8 },
    { url: `${BASE_URL}/about`, lastmod: today, changefreq: 'monthly', priority: 0.5 },
    { url: `${BASE_URL}/methodology`, lastmod: today, changefreq: 'monthly', priority: 0.5 },
    { url: `${BASE_URL}/data-sources`, lastmod: today, changefreq: 'monthly', priority: 0.5 },
    { url: `${BASE_URL}/legal`, lastmod: today, changefreq: 'monthly', priority: 0.4 },
    { url: `${BASE_URL}/privacy-policy`, lastmod: today, changefreq: 'monthly', priority: 0.4 },
    { url: `${BASE_URL}/terms-of-use`, lastmod: today, changefreq: 'monthly', priority: 0.4 },
  ];
}

export async function getCountryEntries(): Promise<SitemapEntry[]> {
  const supabase = getClient();
  const entries: SitemapEntry[] = [];

  const { data: countries } = await supabase
    .from('countries')
    .select('slug, updated_at, created_at')
    .order('slug');

  const { data: guides } = await supabase
    .from('country_guides')
    .select('country_slug, last_updated')
    .order('country_slug');

  const guideMap = new Map<string, string>();
  if (guides) {
    for (const g of guides) {
      guideMap.set((g as any).country_slug, (g as any).last_updated);
    }
  }

  for (const c of countries || []) {
    const country = c as any;
    const lastmod = toISODate(
      country.updated_at || country.created_at
    );
    const guideLastmod = toISODate(guideMap.get(country.slug));

    entries.push({
      url: `${BASE_URL}/immigrate-to/${country.slug}`,
      lastmod,
      changefreq: 'weekly',
      priority: 0.9,
    });

    if (guideMap.has(country.slug)) {
      entries.push({
        url: `${BASE_URL}/country/${country.slug}`,
        lastmod: guideLastmod,
        changefreq: 'weekly',
        priority: 0.85,
      });
    }
  }

  return entries;
}

export async function getPathwayEntries(): Promise<SitemapEntry[]> {
  const supabase = getClient();
  const entries: SitemapEntry[] = [];

  const { data: pathways } = await supabase
    .from('immigration_pathways')
    .select('id, destination_slug, pathway_type, last_updated')
    .order('destination_slug');

  const { data: qualityMetrics } = await supabase
    .from('pathway_quality_metrics')
    .select('pathway_id, is_indexable, content_richness_score');

  const qualityMap = new Map<string, { is_indexable: boolean; score: number }>();
  if (qualityMetrics) {
    for (const qm of qualityMetrics as any[]) {
      qualityMap.set(qm.pathway_id, {
        is_indexable: qm.is_indexable,
        score: qm.content_richness_score,
      });
    }
  }

  const pathwayTypeToSlug: Record<string, string> = {
    'Work': 'work-visa',
    'Study': 'study-visa',
    'Digital Nomad': 'digital-nomad-visa',
    'Retirement': 'retirement-visa',
    'Investor': 'investor-visa',
    'Family': 'family-visa',
  };

  for (const pw of pathways || []) {
    const p = pw as any;
    const quality = qualityMap.get(p.id);
    if (!quality?.is_indexable) continue;

    const urlSlug = pathwayTypeToSlug[p.pathway_type];
    if (!urlSlug) continue;

    entries.push({
      url: `${BASE_URL}/immigrate-to/${p.destination_slug}/${urlSlug}`,
      lastmod: toISODate(p.last_updated),
      changefreq: 'weekly',
      priority: quality.score >= 70 ? 0.85 : 0.75,
    });
  }

  return entries;
}

export async function getCostEntries(): Promise<SitemapEntry[]> {
  const supabase = getClient();
  const entries: SitemapEntry[] = [];

  const { data: countries } = await supabase
    .from('immigration_cost_countries')
    .select('id, slug, updated_at, created_at')
    .eq('is_active', true)
    .eq('is_destination', true)
    .order('slug');

  const countryList = (countries || []) as any[];
  const countryIdToSlug = new Map(countryList.map((c) => [c.id, c.slug]));
  const countrySlugToDate = new Map(
    countryList.map((c) => [c.slug, toISODate(c.updated_at || c.created_at)])
  );

  const { data: pathways } = await supabase
    .from('immigration_cost_pathways')
    .select('country_id, pathway_slug, updated_at, created_at')
    .eq('is_active', true);

  const pathwayList = (pathways || []) as any[];

  const { data: profiles } = await supabase
    .from('immigration_cost_profiles')
    .select('pathway_id, updated_at, last_verified_at')
    .order('pathway_id');

  const profileMap = new Map<string, string>();
  for (const prof of (profiles || []) as any[]) {
    const date = toISODate(prof.last_verified_at || prof.updated_at);
    profileMap.set(prof.pathway_id, date);
  }

  const { data: costPathwayIds } = await supabase
    .from('immigration_cost_pathways')
    .select('id, country_id, pathway_slug')
    .eq('is_active', true);

  const pathwayIdMap = new Map<string, string>();
  for (const p of (costPathwayIds || []) as any[]) {
    pathwayIdMap.set(`${p.country_id}:${p.pathway_slug}`, p.id);
  }

  const { data: proofFundsData } = await supabase
    .from('immigration_cost_profiles')
    .select('pathway_id, proof_of_funds_single')
    .not('proof_of_funds_single', 'is', null);

  const proofFundsMap = new Map<string, boolean>();
  for (const pf of (proofFundsData || []) as any[]) {
    proofFundsMap.set(pf.pathway_id, true);
  }

  const pathwaysByCountry = new Map<string, number>();
  for (const p of pathwayList) {
    const slug = countryIdToSlug.get(p.country_id);
    if (slug) {
      pathwaysByCountry.set(slug, (pathwaysByCountry.get(slug) ?? 0) + 1);
    }
  }

  for (const country of countryList) {
    const countryPathwayCount = pathwaysByCountry.get(country.slug) ?? 0;
    const costHubLastmod = countrySlugToDate.get(country.slug) ?? FALLBACK_DATE;

    entries.push({
      url: `${BASE_URL}/immigration-cost/${country.slug}`,
      lastmod: costHubLastmod,
      changefreq: 'weekly',
      priority: 0.85,
    });

    const hasDistinctContent =
      countryPathwayCount >= 2 &&
      [...pathwayList]
        .filter((p) => p.country_id === country.id)
        .some((p) => {
          const pid = pathwayIdMap.get(`${country.id}:${p.pathway_slug}`);
          return pid ? proofFundsMap.has(pid) : false;
        });

    if (hasDistinctContent) {
      entries.push({
        url: `${BASE_URL}/cost-to-immigrate/${country.slug}`,
        lastmod: costHubLastmod,
        changefreq: 'weekly',
        priority: 0.8,
      });
    }
  }

  for (const pathway of pathwayList) {
    const countrySlug = countryIdToSlug.get(pathway.country_id);
    if (!countrySlug) continue;

    const pid = pathwayIdMap.get(`${pathway.country_id}:${pathway.pathway_slug}`);
    const profileDate = pid ? (profileMap.get(pid) ?? FALLBACK_DATE) : FALLBACK_DATE;
    const pathwayDate = toISODate(pathway.updated_at || pathway.created_at);
    const lastmod = profileDate !== FALLBACK_DATE ? profileDate : pathwayDate;

    entries.push({
      url: `${BASE_URL}/immigration-cost/${countrySlug}/${pathway.pathway_slug}`,
      lastmod,
      changefreq: 'weekly',
      priority: 0.8,
    });
  }

  return entries;
}

export async function getComparisonEntries(): Promise<SitemapEntry[]> {
  const supabase = getClient();
  const entries: SitemapEntry[] = [];
  const today = new Date().toISOString().split('T')[0];

  const { data: countries } = await supabase
    .from('immigration_cost_countries')
    .select('id, slug')
    .eq('is_active', true)
    .eq('is_destination', true)
    .order('slug');

  const countryList = (countries || []) as any[];

  const { data: pathways } = await supabase
    .from('immigration_cost_pathways')
    .select('country_id')
    .eq('is_active', true);

  const pathwayCountByCountry = new Map<string, number>();
  for (const p of (pathways || []) as any[]) {
    pathwayCountByCountry.set(p.country_id, (pathwayCountByCountry.get(p.country_id) ?? 0) + 1);
  }

  const priorityCountries = countryList
    .filter((c) => PRIORITY_DESTINATIONS.has(c.slug))
    .sort((a, b) => (pathwayCountByCountry.get(b.id) ?? 0) - (pathwayCountByCountry.get(a.id) ?? 0))
    .slice(0, 15);

  for (let i = 0; i < priorityCountries.length; i++) {
    for (let j = i + 1; j < priorityCountries.length; j++) {
      entries.push({
        url: `${BASE_URL}/immigration-cost-compare/${priorityCountries[i].slug}-vs-${priorityCountries[j].slug}`,
        lastmod: today,
        changefreq: 'monthly',
        priority: 0.65,
      });
    }
  }

  return entries;
}

export async function getBlogEntries(): Promise<SitemapEntry[]> {
  const supabase = getClient();

  const { data: posts } = await supabase
    .from('blog_posts')
    .select('slug, updated_at, published_at')
    .eq('is_published', true)
    .order('published_at', { ascending: false });

  return (posts || []).map((post: any) => ({
    url: `${BASE_URL}/blog/${post.slug}`,
    lastmod: toISODate(post.updated_at || post.published_at),
    changefreq: 'monthly',
    priority: 0.75,
  }));
}

export function getPassportEntries(): SitemapEntry[] {
  const today = new Date().toISOString().split('T')[0];
  return INDEXABLE_PASSPORTS.map((slug) => ({
    url: `${BASE_URL}/passport/${slug}`,
    lastmod: today,
    changefreq: 'weekly' as const,
    priority: 0.8,
  }));
}
