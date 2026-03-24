const BASE_URL = 'https://immigrationinfoguide.com';

export type RouteFamily =
  | 'country-hub'
  | 'country-guide'
  | 'cost-hub'
  | 'cost-editorial'
  | 'pathway-cost-full'
  | 'pathway-cost-fees'
  | 'pathway-guide'
  | 'pathway-guide-legacy';

export interface CanonicalDecision {
  canonical: string;
  isSelfCanonical: boolean;
  noindex: boolean;
  robotsContent: string;
}

export function getCountryHubCanonical(slug: string): CanonicalDecision {
  const canonical = `${BASE_URL}/immigrate-to/${slug}`;
  return {
    canonical,
    isSelfCanonical: true,
    noindex: false,
    robotsContent: 'index,follow',
  };
}

export function getCountryGuideCanonical(slug: string): CanonicalDecision {
  const canonical = `${BASE_URL}/country/${slug}`;
  return {
    canonical,
    isSelfCanonical: true,
    noindex: false,
    robotsContent: 'index,follow',
  };
}

export function getCostHubCanonical(slug: string): CanonicalDecision {
  const canonical = `${BASE_URL}/immigration-cost/${slug}`;
  return {
    canonical,
    isSelfCanonical: true,
    noindex: false,
    robotsContent: 'index,follow',
  };
}

export function getCostEditorialCanonical(
  slug: string,
  hasDistinctContent: boolean
): CanonicalDecision {
  if (hasDistinctContent) {
    return {
      canonical: `${BASE_URL}/cost-to-immigrate/${slug}`,
      isSelfCanonical: true,
      noindex: false,
      robotsContent: 'index,follow',
    };
  }
  return {
    canonical: `${BASE_URL}/immigration-cost/${slug}`,
    isSelfCanonical: false,
    noindex: false,
    robotsContent: 'index,follow',
  };
}

export function getPathwayCostFullCanonical(
  countrySlug: string,
  pathwaySlug: string
): CanonicalDecision {
  const canonical = `${BASE_URL}/immigration-cost/${countrySlug}/${pathwaySlug}`;
  return {
    canonical,
    isSelfCanonical: true,
    noindex: false,
    robotsContent: 'index,follow',
  };
}

export function getPathwayCostFeesCanonical(
  countrySlug: string,
  pathwaySlug: string
): CanonicalDecision {
  return {
    canonical: `${BASE_URL}/immigration-cost/${countrySlug}/${pathwaySlug}`,
    isSelfCanonical: false,
    noindex: false,
    robotsContent: 'index,follow',
  };
}

export function getPathwayGuideCanonical(
  countrySlug: string,
  pathwaySlug: string,
  isIndexable: boolean
): CanonicalDecision {
  const canonical = `${BASE_URL}/immigrate-to/${countrySlug}/${pathwaySlug}`;
  return {
    canonical,
    isSelfCanonical: true,
    noindex: !isIndexable,
    robotsContent: isIndexable ? 'index,follow' : 'noindex,follow',
  };
}

export function getLegacyPathwayCanonical(
  countrySlug: string,
  pathwaySlug: string
): CanonicalDecision {
  const canonical = `${BASE_URL}/immigrate-to/${countrySlug}/${pathwaySlug}`;
  return {
    canonical,
    isSelfCanonical: false,
    noindex: true,
    robotsContent: 'noindex,follow',
  };
}

export function hasCostEditorialDistinctContent(snapshot: {
  pathways: unknown[];
  costRange: { min: number; max: number } | null;
  avgProofOfFunds: number | null;
} | null): boolean {
  if (!snapshot) return false;
  return (
    snapshot.pathways.length >= 2 &&
    snapshot.costRange !== null &&
    snapshot.avgProofOfFunds !== null &&
    snapshot.avgProofOfFunds > 0
  );
}
