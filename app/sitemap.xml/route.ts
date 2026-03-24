import { buildIndexXML, xmlResponse } from '@/lib/seo/sitemapHelpers';

export const revalidate = 86400;
export const dynamic = 'force-static';

const BASE_URL = 'https://immigrationinfoguide.com';

export async function GET() {
  const children = [
    `${BASE_URL}/sitemap-static.xml`,
    `${BASE_URL}/sitemap-countries.xml`,
    `${BASE_URL}/sitemap-pathways.xml`,
    `${BASE_URL}/sitemap-costs.xml`,
    `${BASE_URL}/sitemap-comparisons.xml`,
    `${BASE_URL}/sitemap-blog.xml`,
    `${BASE_URL}/sitemap-passports.xml`,
  ];
  return xmlResponse(buildIndexXML(children));
}
