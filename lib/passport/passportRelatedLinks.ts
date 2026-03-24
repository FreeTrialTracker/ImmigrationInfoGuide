import type { RelatedLink, RelatedLinkGroup } from '@/lib/seo/relatedLinks';
import { PATHWAY_TYPES } from '@/lib/pathwayTypes';
import { getDestinationName, INDEXABLE_PASSPORTS, getPassportHubPath } from './passportData';

export type { RelatedLink, RelatedLinkGroup };

interface BlogPostStub {
  slug: string;
  title: string;
  tags?: string[];
  category?: string;
}

function matchBlogPosts(
  allPosts: BlogPostStub[],
  passportSlug: string,
  limit = 3,
): RelatedLink[] {
  if (!allPosts || allPosts.length === 0) return [];
  const countryKeyword = passportSlug.replace(/-/g, ' ');
  const scored = allPosts.map((post) => {
    const text = `${post.title} ${(post.tags ?? []).join(' ')} ${post.category ?? ''}`.toLowerCase();
    let score = 0;
    if (text.includes(countryKeyword)) score += 3;
    if (text.includes('immigrat') || text.includes('visa') || text.includes('relocat')) score += 1;
    return { post, score };
  });
  return scored
    .filter((s) => s.score > 0)
    .sort((a, b) => b.score - a.score)
    .slice(0, limit)
    .map((s) => ({
      href: `/blog/${s.post.slug}`,
      label: s.post.title,
    }));
}

export function getPassportRelatedLinks(opts: {
  passportSlug: string;
  popularDestinations: string[];
  blogPosts?: BlogPostStub[];
}): RelatedLinkGroup[] {
  const { passportSlug, popularDestinations, blogPosts = [] } = opts;

  const groups: RelatedLinkGroup[] = [];

  const destinationLinks: RelatedLink[] = popularDestinations.slice(0, 8).map((d) => ({
    href: `/immigrate-to/${d}`,
    label: `Immigrate to ${getDestinationName(d)}`,
    description: `Pathways, residency, and visa options for ${getDestinationName(d)}`,
  }));
  if (destinationLinks.length > 0) {
    groups.push({ heading: 'Top Destination Guides', links: destinationLinks });
  }

  const pathwayLinks: RelatedLink[] = popularDestinations.slice(0, 3).flatMap((dest) =>
    PATHWAY_TYPES.slice(0, 2).map((pt) => ({
      href: `/immigrate-to/${dest}/${pt.slug}`,
      label: `${pt.type} visa for ${getDestinationName(dest)}`,
      description: pt.description,
    }))
  );
  if (pathwayLinks.length > 0) {
    groups.push({ heading: 'Pathway Guides', links: pathwayLinks.slice(0, 6) });
  }

  const costLinks: RelatedLink[] = popularDestinations.slice(0, 5).map((d) => ({
    href: `/immigration-cost/${d}`,
    label: `Cost to immigrate to ${getDestinationName(d)}`,
    description: `Government fees, proof-of-funds, and total move costs`,
  }));
  if (costLinks.length > 0) {
    groups.push({ heading: 'Cost Planning', links: costLinks });
  }

  const blogLinks = matchBlogPosts(blogPosts, passportSlug, 4);
  if (blogLinks.length > 0) {
    groups.push({ heading: 'Related Articles', links: blogLinks });
  }

  return groups;
}

/**
 * Returns contextually relevant passport links to surface on country/pathway pages.
 * Only includes passports that are indexable and have curated data.
 */
export function getRelatedPassportLinks(
  countrySlug: string,
  limit = 4,
): RelatedLink[] {
  const prioritized = [...INDEXABLE_PASSPORTS].filter(
    (p) => p !== countrySlug
  );

  return prioritized.slice(0, limit).map((p) => ({
    href: getPassportHubPath(p),
    label: `Immigration options for ${formatPassportLabel(p)}`,
    description: `Pathways and destinations for ${formatPassportLabel(p)}`,
  }));
}

function formatPassportLabel(slug: string): string {
  const map: Record<string, string> = {
    'united-states': 'US citizens',
    'united-kingdom': 'UK citizens',
    'india': 'Indian passport holders',
    'canada': 'Canadians',
    'australia': 'Australians',
    'china': 'Chinese passport holders',
    'germany': 'German citizens',
    'brazil': 'Brazilians',
    'nigeria': 'Nigerian passport holders',
    'philippines': 'Filipino passport holders',
    'france': 'French citizens',
    'south-africa': 'South African passport holders',
    'mexico': 'Mexican citizens',
    'japan': 'Japanese citizens',
    'south-korea': 'South Korean citizens',
  };
  return map[slug] ?? `${slug.split('-').map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')} passport holders`;
}
