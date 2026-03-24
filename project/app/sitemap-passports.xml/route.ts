import { getPassportEntries, buildXML, xmlResponse } from '@/lib/seo/sitemapHelpers';

export const revalidate = 86400;
export const dynamic = 'force-static';

export async function GET() {
  const entries = getPassportEntries();
  return xmlResponse(buildXML(entries));
}
