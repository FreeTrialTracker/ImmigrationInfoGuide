import { COUNTRIES_52 } from '@/data/countries52';
import { PATHWAY_TYPES } from '@/lib/pathwayTypes';

export interface RelatedLink {
  href: string;
  label: string;
  description?: string;
}

export interface RelatedLinkGroup {
  heading: string;
  links: RelatedLink[];
}

const TOP_COMPARISON_DESTINATIONS = [
  'canada', 'united-states', 'australia', 'united-kingdom', 'germany',
  'portugal', 'spain', 'france', 'netherlands', 'new-zealand',
  'ireland', 'italy', 'sweden', 'norway', 'denmark',
  'switzerland', 'austria', 'singapore', 'japan', 'thailand',
];

function getCountryName(slug: string): string {
  const country = COUNTRIES_52.find((c) => c.slug === slug);
  return country?.name ?? slug.split('-').map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
}

function getComparisonPartners(countrySlug: string, limit = 3): RelatedLink[] {
  const candidates = TOP_COMPARISON_DESTINATIONS.filter((c) => c !== countrySlug).slice(0, 10);
  const countryName = getCountryName(countrySlug);
  const links: RelatedLink[] = [];

  for (const partner of candidates) {
    if (links.length >= limit) break;
    const partnerName = getCountryName(partner);
    const pair = [countrySlug, partner].sort();
    links.push({
      href: `/immigration-cost-compare/${pair[0]}-vs-${pair[1]}`,
      label: `${countryName} vs ${partnerName}`,
      description: `Compare immigration costs and pathways`,
    });
  }
  return links;
}

function getPathwayLinks(countrySlug: string, excludePathwaySlug?: string): RelatedLink[] {
  const countryName = getCountryName(countrySlug);
  return PATHWAY_TYPES.filter((pt) => pt.slug !== excludePathwaySlug).map((pt) => ({
    href: `/immigrate-to/${countrySlug}/${pt.slug}`,
    label: `${pt.type} immigration to ${countryName}`,
    description: pt.description,
  }));
}

function matchBlogPosts(
  allPosts: Array<{ slug: string; title: string; tags?: string[]; category?: string }>,
  countrySlug: string,
  pathwaySlug?: string,
  limit = 3,
): RelatedLink[] {
  if (!allPosts || allPosts.length === 0) return [];

  const countryName = getCountryName(countrySlug);
  const countryKeywords = [countryName.toLowerCase(), countrySlug.toLowerCase()];
  const pathwayKeywords = pathwaySlug
    ? [pathwaySlug.toLowerCase(), pathwaySlug.replace(/-/g, ' ')]
    : [];

  const scored = allPosts.map((post) => {
    const text = `${post.title} ${(post.tags || []).join(' ')} ${post.category || ''}`.toLowerCase();
    let score = 0;
    for (const kw of countryKeywords) {
      if (text.includes(kw)) score += 2;
    }
    for (const kw of pathwayKeywords) {
      if (text.includes(kw)) score += 1;
    }
    return { post, score };
  });

  return scored
    .filter((s) => s.score > 0)
    .sort((a, b) => b.score - a.score)
    .slice(0, limit)
    .map(({ post }) => ({
      href: `/blog/${post.slug}`,
      label: post.title,
      description: post.category,
    }));
}

export interface CountryHubLinksInput {
  countrySlug: string;
  blogPosts?: Array<{ slug: string; title: string; tags?: string[]; category?: string }>;
}

export function getCountryHubRelatedLinks(input: CountryHubLinksInput): RelatedLinkGroup[] {
  const { countrySlug, blogPosts = [] } = input;
  const countryName = getCountryName(countrySlug);
  const groups: RelatedLinkGroup[] = [];

  const pathwayLinks = getPathwayLinks(countrySlug).slice(0, 5);
  if (pathwayLinks.length > 0) {
    groups.push({
      heading: `Immigration pathways to ${countryName}`,
      links: pathwayLinks,
    });
  }

  groups.push({
    heading: `Costs and financial planning`,
    links: [
      {
        href: `/immigration-cost/${countrySlug}`,
        label: `Immigration costs for ${countryName}`,
        description: `Visa fees, medical exams, and proof of funds`,
      },
      {
        href: `/cost-to-immigrate/${countrySlug}`,
        label: `Cost to immigrate to ${countryName}`,
        description: `Full cost guide with hidden expenses`,
      },
    ],
  });

  const comparisons = getComparisonPartners(countrySlug, 3);
  if (comparisons.length > 0) {
    groups.push({
      heading: `Compare ${countryName} with other destinations`,
      links: comparisons,
    });
  }

  const blogLinks = matchBlogPosts(blogPosts, countrySlug, undefined, 3);
  if (blogLinks.length > 0) {
    groups.push({
      heading: `Related immigration guides`,
      links: blogLinks,
    });
  }

  return groups;
}

export interface CountryGuideLinksInput {
  countrySlug: string;
  blogPosts?: Array<{ slug: string; title: string; tags?: string[]; category?: string }>;
}

export function getCountryGuideRelatedLinks(input: CountryGuideLinksInput): RelatedLinkGroup[] {
  const { countrySlug, blogPosts = [] } = input;
  const countryName = getCountryName(countrySlug);
  const groups: RelatedLinkGroup[] = [];

  groups.push({
    heading: `Immigration pathways for ${countryName}`,
    links: [
      {
        href: `/immigrate-to/${countrySlug}`,
        label: `Immigrate to ${countryName}`,
        description: `All immigration routes and residency options`,
      },
      ...getPathwayLinks(countrySlug).slice(0, 3),
    ],
  });

  groups.push({
    heading: `Costs and financial planning`,
    links: [
      {
        href: `/immigration-cost/${countrySlug}`,
        label: `${countryName} immigration costs`,
        description: `Visa fees, medical exams, legal costs`,
      },
      {
        href: `/cost-to-immigrate/${countrySlug}`,
        label: `Cost to immigrate to ${countryName}`,
        description: `Complete cost guide including hidden expenses`,
      },
    ],
  });

  const comparisons = getComparisonPartners(countrySlug, 3);
  if (comparisons.length > 0) {
    groups.push({
      heading: `Compare destinations`,
      links: comparisons,
    });
  }

  const blogLinks = matchBlogPosts(blogPosts, countrySlug, undefined, 3);
  if (blogLinks.length > 0) {
    groups.push({
      heading: `Related articles`,
      links: blogLinks,
    });
  }

  return groups;
}

export interface PathwayCountryLinksInput {
  countrySlug: string;
  pathwaySlug: string;
  blogPosts?: Array<{ slug: string; title: string; tags?: string[]; category?: string }>;
}

export function getPathwayCountryRelatedLinks(input: PathwayCountryLinksInput): RelatedLinkGroup[] {
  const { countrySlug, pathwaySlug, blogPosts = [] } = input;
  const countryName = getCountryName(countrySlug);
  const groups: RelatedLinkGroup[] = [];

  const siblingLinks = getPathwayLinks(countrySlug, pathwaySlug).slice(0, 4);
  if (siblingLinks.length > 0) {
    groups.push({
      heading: `Other immigration pathways to ${countryName}`,
      links: siblingLinks,
    });
  }

  groups.push({
    heading: `Costs for this pathway`,
    links: [
      {
        href: `/immigration-cost/${countrySlug}`,
        label: `${countryName} immigration costs`,
        description: `All pathway cost breakdowns`,
      },
      {
        href: `/cost-to-immigrate/${countrySlug}`,
        label: `Cost to immigrate to ${countryName}`,
        description: `Full cost guide with hidden expenses`,
      },
    ],
  });

  groups.push({
    heading: `${countryName} country resources`,
    links: [
      {
        href: `/immigrate-to/${countrySlug}`,
        label: `All immigration routes to ${countryName}`,
        description: `Complete overview of pathways`,
      },
      {
        href: `/country/${countrySlug}`,
        label: `${countryName} immigration guide`,
        description: `Cost of living, jobs, culture`,
      },
    ],
  });

  const comparisons = getComparisonPartners(countrySlug, 2);
  if (comparisons.length > 0) {
    groups.push({
      heading: `Compare destinations`,
      links: comparisons,
    });
  }

  const blogLinks = matchBlogPosts(blogPosts, countrySlug, pathwaySlug, 3);
  if (blogLinks.length > 0) {
    groups.push({
      heading: `Helpful guides`,
      links: blogLinks,
    });
  }

  return groups;
}

export interface CostCountryLinksInput {
  countrySlug: string;
  pathwaySlugs?: string[];
  blogPosts?: Array<{ slug: string; title: string; tags?: string[]; category?: string }>;
}

export function getCostCountryRelatedLinks(input: CostCountryLinksInput): RelatedLinkGroup[] {
  const { countrySlug, pathwaySlugs = [], blogPosts = [] } = input;
  const countryName = getCountryName(countrySlug);
  const groups: RelatedLinkGroup[] = [];

  groups.push({
    heading: `Explore immigration routes to ${countryName}`,
    links: [
      {
        href: `/immigrate-to/${countrySlug}`,
        label: `Immigrate to ${countryName}`,
        description: `All residency and visa options`,
      },
      {
        href: `/country/${countrySlug}`,
        label: `${countryName} country guide`,
        description: `Cost of living, jobs, culture`,
      },
    ],
  });

  if (pathwaySlugs.length > 0) {
    groups.push({
      heading: `Cost by pathway`,
      links: pathwaySlugs.slice(0, 4).map((ps) => ({
        href: `/immigration-cost/${countrySlug}/${ps}`,
        label: `${countryName} ${ps.replace(/-/g, ' ')} cost`,
        description: `Detailed fee breakdown`,
      })),
    });
  }

  const comparisons = getComparisonPartners(countrySlug, 3);
  if (comparisons.length > 0) {
    groups.push({
      heading: `Compare immigration costs`,
      links: comparisons,
    });
  }

  const blogLinks = matchBlogPosts(blogPosts, countrySlug, undefined, 3);
  if (blogLinks.length > 0) {
    groups.push({
      heading: `Related planning guides`,
      links: blogLinks,
    });
  }

  return groups;
}

export interface CostPathwayLinksInput {
  countrySlug: string;
  pathwaySlug: string;
  siblingPathwaySlugs?: string[];
  blogPosts?: Array<{ slug: string; title: string; tags?: string[]; category?: string }>;
}

export function getCostPathwayRelatedLinks(input: CostPathwayLinksInput): RelatedLinkGroup[] {
  const { countrySlug, pathwaySlug, siblingPathwaySlugs = [], blogPosts = [] } = input;
  const countryName = getCountryName(countrySlug);
  const groups: RelatedLinkGroup[] = [];

  groups.push({
    heading: `Full guide for this pathway`,
    links: [
      {
        href: `/immigrate-to/${countrySlug}`,
        label: `Immigrate to ${countryName} — all pathways`,
        description: `Requirements, eligibility, and application process`,
      },
      {
        href: `/country/${countrySlug}`,
        label: `${countryName} country guide`,
        description: `Cost of living, employment, and lifestyle`,
      },
    ],
  });

  const siblingLinks = siblingPathwaySlugs
    .filter((s) => s !== pathwaySlug)
    .slice(0, 3)
    .map((s) => ({
      href: `/immigration-cost/${countrySlug}/${s}`,
      label: `${countryName} ${s.replace(/-/g, ' ')} cost`,
      description: `Compare this alternative`,
    }));
  if (siblingLinks.length > 0) {
    groups.push({
      heading: `Other pathways in ${countryName}`,
      links: [
        {
          href: `/immigration-cost/${countrySlug}`,
          label: `All ${countryName} pathway costs`,
          description: `Full list of immigration options`,
        },
        ...siblingLinks,
      ],
    });
  }

  const comparisons = getComparisonPartners(countrySlug, 2);
  if (comparisons.length > 0) {
    groups.push({
      heading: `Compare total costs`,
      links: comparisons,
    });
  }

  const blogLinks = matchBlogPosts(blogPosts, countrySlug, pathwaySlug, 3);
  if (blogLinks.length > 0) {
    groups.push({
      heading: `Related articles`,
      links: blogLinks,
    });
  }

  return groups;
}

export interface CostVariantLinksInput {
  countrySlug: string;
  pathwaySlugs?: string[];
  blogPosts?: Array<{ slug: string; title: string; tags?: string[]; category?: string }>;
}

export function getCostVariantRelatedLinks(input: CostVariantLinksInput): RelatedLinkGroup[] {
  const { countrySlug, pathwaySlugs = [], blogPosts = [] } = input;
  const countryName = getCountryName(countrySlug);
  const groups: RelatedLinkGroup[] = [];

  groups.push({
    heading: `Detailed cost resources for ${countryName}`,
    links: [
      {
        href: `/immigration-cost/${countrySlug}`,
        label: `${countryName} immigration cost calculator`,
        description: `Interactive fee calculator with full breakdown`,
      },
      {
        href: `/immigrate-to/${countrySlug}`,
        label: `Immigration guide for ${countryName}`,
        description: `Pathways, requirements, and eligibility`,
      },
    ],
  });

  if (pathwaySlugs.length > 0) {
    groups.push({
      heading: `Pathway cost pages`,
      links: pathwaySlugs.slice(0, 4).map((ps) => ({
        href: `/visa-cost/${countrySlug}/${ps}`,
        label: `${countryName} ${ps.replace(/-/g, ' ')} — full cost`,
        description: `Complete fee breakdown`,
      })),
    });
  }

  const comparisons = getComparisonPartners(countrySlug, 3);
  if (comparisons.length > 0) {
    groups.push({
      heading: `Compare with other destinations`,
      links: comparisons,
    });
  }

  const blogLinks = matchBlogPosts(blogPosts, countrySlug, undefined, 3);
  if (blogLinks.length > 0) {
    groups.push({
      heading: `Related guides`,
      links: blogLinks,
    });
  }

  return groups;
}

export interface VisaCostPathwayLinksInput {
  countrySlug: string;
  pathwaySlug: string;
  siblingPathwaySlugs?: string[];
  blogPosts?: Array<{ slug: string; title: string; tags?: string[]; category?: string }>;
}

export function getVisaCostPathwayRelatedLinks(input: VisaCostPathwayLinksInput): RelatedLinkGroup[] {
  const { countrySlug, pathwaySlug, siblingPathwaySlugs = [], blogPosts = [] } = input;
  const countryName = getCountryName(countrySlug);
  const groups: RelatedLinkGroup[] = [];

  groups.push({
    heading: `${countryName} immigration resources`,
    links: [
      {
        href: `/cost-to-immigrate/${countrySlug}`,
        label: `All ${countryName} immigration costs`,
        description: `Overview of every pathway's costs`,
      },
      {
        href: `/immigrate-to/${countrySlug}`,
        label: `Immigrate to ${countryName}`,
        description: `Full pathway guide and requirements`,
      },
    ],
  });

  const siblingLinks = siblingPathwaySlugs
    .filter((s) => s !== pathwaySlug)
    .slice(0, 3)
    .map((s) => ({
      href: `/visa-cost/${countrySlug}/${s}`,
      label: `${countryName} ${s.replace(/-/g, ' ')} cost`,
      description: `Alternative pathway`,
    }));
  if (siblingLinks.length > 0) {
    groups.push({
      heading: `Alternative pathways in ${countryName}`,
      links: siblingLinks,
    });
  }

  const comparisons = getComparisonPartners(countrySlug, 2);
  if (comparisons.length > 0) {
    groups.push({
      heading: `Compare destinations`,
      links: comparisons,
    });
  }

  const blogLinks = matchBlogPosts(blogPosts, countrySlug, pathwaySlug, 3);
  if (blogLinks.length > 0) {
    groups.push({
      heading: `Related guides`,
      links: blogLinks,
    });
  }

  return groups;
}

export interface BlogRelatedLinksInput {
  slug: string;
  title: string;
  tags?: string[];
  category?: string;
  allPosts?: Array<{ slug: string; title: string; tags?: string[]; category?: string }>;
}

export function getBlogRelatedLinks(input: BlogRelatedLinksInput): RelatedLinkGroup[] {
  const { slug, title, tags = [], category = '', allPosts = [] } = input;
  const groups: RelatedLinkGroup[] = [];

  const text = `${slug} ${title} ${tags.join(' ')} ${category}`.toLowerCase();

  const detectedCountries = COUNTRIES_52.filter((c) => {
    const name = c.name.toLowerCase();
    const s = c.slug.toLowerCase();
    return text.includes(name) || text.includes(s);
  }).slice(0, 3);

  const detectedPathways = PATHWAY_TYPES.filter((pt) => {
    return text.includes(pt.type.toLowerCase()) || text.includes(pt.slug.replace(/-/g, ' '));
  }).slice(0, 2);

  if (detectedCountries.length > 0) {
    const immigrationLinks: RelatedLink[] = [];
    for (const country of detectedCountries) {
      immigrationLinks.push({
        href: `/immigrate-to/${country.slug}`,
        label: `Immigrate to ${country.name}`,
        description: `Pathways, requirements, and eligibility`,
      });
      if (immigrationLinks.length === 1 && detectedCountries.length === 1) {
        immigrationLinks.push({
          href: `/country/${country.slug}`,
          label: `${country.name} immigration guide`,
          description: `Cost of living, employment, culture`,
        });
      }
    }
    if (immigrationLinks.length > 0) {
      groups.push({
        heading: `Related immigration guides`,
        links: immigrationLinks.slice(0, 4),
      });
    }

    const costLinks: RelatedLink[] = detectedCountries.map((country) => ({
      href: `/immigration-cost/${country.slug}`,
      label: `${country.name} immigration costs`,
      description: `Visa fees and proof of funds`,
    }));

    if (detectedPathways.length > 0 && detectedCountries.length === 1) {
      for (const pt of detectedPathways) {
        costLinks.push({
          href: `/immigrate-to/${detectedCountries[0].slug}/${pt.slug}`,
          label: `${pt.type} pathways to ${detectedCountries[0].name}`,
          description: pt.description,
        });
      }
    }

    if (costLinks.length > 0) {
      groups.push({
        heading: `You may also need`,
        links: costLinks.slice(0, 4),
      });
    }
  } else {
    groups.push({
      heading: `Immigration planning tools`,
      links: [
        { href: '/path-finder', label: 'Immigration Path Finder', description: 'Personalised pathway recommendations' },
        { href: '/immigration-cost-calculator', label: 'Cost Calculator', description: 'Estimate your total immigration costs' },
        { href: '/immigration-guides', label: 'Country Guides', description: 'Browse 50+ destination guides' },
      ],
    });
  }

  return groups;
}
