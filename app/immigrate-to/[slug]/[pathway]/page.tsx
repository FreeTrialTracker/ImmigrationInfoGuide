import { notFound } from 'next/navigation';
import { getCountryBySlug, getImmigrationPathways } from '@/lib/supabaseClient';
import { generateStarterPathways } from '@/lib/generateStarterPathways';
import { getPathwayTypeBySlug } from '@/lib/pathwayTypes';
import { getPathwayQualityMetrics, getPathwayEnrichedContent } from '@/lib/pathwayContentHelpers';
import { getAllBlogPosts } from '@/lib/blogData';
import { getPathwayCountryRelatedLinks } from '@/lib/seo/relatedLinks';
import { getHierarchicalPathwayUrl, isValidPathwayRoute } from '@/lib/seo/pathwayRouteMap';
import PathwayGuidePage from '@/components/PathwayGuidePage';

export const revalidate = 86400;
export const dynamicParams = true;

export async function generateStaticParams() {
  return [];
}

export async function generateMetadata({
  params,
}: {
  params: { slug: string; pathway: string };
}) {
  const { slug: countrySlug, pathway: pathwaySlug } = params;

  if (!isValidPathwayRoute(countrySlug, pathwaySlug)) {
    return {
      title: 'Immigration Pathway | ImmigrationInfoGuide',
      robots: { index: false, follow: true },
    };
  }

  const pathwayType = getPathwayTypeBySlug(pathwaySlug);
  if (!pathwayType) {
    return {
      title: 'Immigration Pathway | ImmigrationInfoGuide',
      robots: { index: false, follow: true },
    };
  }

  let countryName = countrySlug
    .split('-')
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(' ');
  let shouldIndex = false;

  try {
    const { data: country } = await getCountryBySlug(countrySlug);
    if (country) {
      countryName = (country as any).name;
    }

    const { data: pathways } = await getImmigrationPathways(countrySlug);
    if (pathways && pathways.length > 0) {
      const matchingPathway = (pathways as any[]).find(
        (p) => p.pathway_type === pathwayType.type
      );
      if (matchingPathway?.id) {
        const quality = await getPathwayQualityMetrics(matchingPathway.id);
        shouldIndex = quality?.is_indexable || false;
      }
    }
  } catch {
    // fallback to formatted slug
  }

  const title = `${pathwayType.title} in ${countryName} (2026 Guide)`;
  const description = `Learn about ${pathwayType.type} immigration pathways, eligibility, requirements, and application process in ${countryName}.`;
  const canonicalUrl = getHierarchicalPathwayUrl(countrySlug, pathwaySlug);

  return {
    title: `${title} | ImmigrationInfoGuide`,
    description,
    robots: { index: shouldIndex, follow: true },
    alternates: { canonical: canonicalUrl },
    ...(shouldIndex && {
      openGraph: {
        title: `${title} | ImmigrationInfoGuide`,
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
    }),
  };
}

export default async function HierarchicalPathwayPage({
  params,
}: {
  params: { slug: string; pathway: string };
}) {
  const { slug: countrySlug, pathway: pathwaySlug } = params;

  if (!isValidPathwayRoute(countrySlug, pathwaySlug)) {
    notFound();
  }

  const pathwayType = getPathwayTypeBySlug(pathwaySlug);
  if (!pathwayType) {
    notFound();
  }

  const { data: country, error: countryError } = await getCountryBySlug(countrySlug);
  if (countryError || !country) {
    notFound();
  }

  const countryData = country as { slug: string; name: string; region: string };

  let pathwaysData: any[] = [];
  let usingStarter = false;
  let qualityMetrics = null;
  let enrichedContent = null;

  try {
    const { data: pathways } = await getImmigrationPathways(countrySlug);

    if (pathways && pathways.length > 0) {
      pathwaysData = (pathways as any[]).filter(
        (p) => p.pathway_type === pathwayType.type
      );

      if (
        pathwaysData.length > 0 &&
        pathwaysData[0].id &&
        !pathwaysData[0].id.startsWith('starter-')
      ) {
        qualityMetrics = await getPathwayQualityMetrics(pathwaysData[0].id);
        enrichedContent = await getPathwayEnrichedContent(pathwaysData[0].id);
      }
    }

    if (pathwaysData.length === 0) {
      const generated = generateStarterPathways(countrySlug, countryData.name);
      pathwaysData = generated
        .filter((p) => p.pathway_type === pathwayType.type)
        .map((p, i) => ({ ...p, id: `starter-${i}` }));
      usingStarter = true;
    }
  } catch {
    const generated = generateStarterPathways(countrySlug, countryData.name);
    pathwaysData = generated
      .filter((p) => p.pathway_type === pathwayType.type)
      .map((p, i) => ({ ...p, id: `starter-${i}` }));
    usingStarter = true;
  }

  const blogPosts = await getAllBlogPosts().catch(() => []);
  const relatedLinksGroups = getPathwayCountryRelatedLinks({
    countrySlug,
    pathwaySlug,
    blogPosts: blogPosts.map((p) => ({
      slug: p.slug,
      title: p.title,
      tags: p.tags,
      category: p.category,
    })),
  });

  return (
    <PathwayGuidePage
      countrySlug={countrySlug}
      countryName={countryData.name}
      pathwayType={pathwayType}
      pathwaysData={pathwaysData}
      usingStarter={usingStarter}
      qualityMetrics={qualityMetrics}
      enrichedContent={enrichedContent}
      relatedLinksGroups={relatedLinksGroups}
    />
  );
}
