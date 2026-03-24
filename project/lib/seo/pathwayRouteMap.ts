import { COUNTRIES_52 } from '@/data/countries52';
import { PATHWAY_TYPES, PathwayType } from '@/lib/pathwayTypes';

const BASE_URL = 'https://immigrationinfoguide.com';

const COUNTRY_SLUGS = new Set(COUNTRIES_52.map((c) => c.slug));
const PATHWAY_SLUGS = new Set(PATHWAY_TYPES.map((pt) => pt.slug));

export interface ParsedPathwayRoute {
  countrySlug: string;
  pathwaySlug: string;
}

export function getHierarchicalPathwayUrl(countrySlug: string, pathwaySlug: string): string {
  return `${BASE_URL}/immigrate-to/${countrySlug}/${pathwaySlug}`;
}

export function getHierarchicalPathwayPath(countrySlug: string, pathwaySlug: string): string {
  return `/immigrate-to/${countrySlug}/${pathwaySlug}`;
}

export function isValidPathwayRoute(countrySlug: string, pathwaySlug: string): boolean {
  return COUNTRY_SLUGS.has(countrySlug) && PATHWAY_SLUGS.has(pathwaySlug);
}

/**
 * Deterministically parse a fused pathway-country slug (e.g. "work-visa-south-korea")
 * into { countrySlug, pathwaySlug }.
 *
 * Uses longest-country-slug suffix match against the approved country dictionary,
 * then validates the prefix is a known pathway slug. No brittle naive split.
 */
export function parseFusedPathwaySlug(fused: string): ParsedPathwayRoute | null {
  if (!fused) return null;

  const sortedCountries = [...COUNTRIES_52].sort(
    (a, b) => b.slug.length - a.slug.length
  );

  for (const country of sortedCountries) {
    const suffix = `-${country.slug}`;
    if (fused.endsWith(suffix)) {
      const pathwaySlug = fused.slice(0, fused.length - suffix.length);
      if (PATHWAY_SLUGS.has(pathwaySlug)) {
        return { countrySlug: country.slug, pathwaySlug };
      }
    }
  }

  return null;
}

/**
 * Given a fused slug, return the canonical hierarchical URL if mappable.
 * Returns null if the mapping is not safe or deterministic.
 */
export function getCanonicalForFusedSlug(fused: string): string | null {
  const parsed = parseFusedPathwaySlug(fused);
  if (!parsed) return null;
  return getHierarchicalPathwayUrl(parsed.countrySlug, parsed.pathwaySlug);
}

export function getPathwayTypeBySlugFromMap(pathwaySlug: string): PathwayType | undefined {
  return PATHWAY_TYPES.find((pt) => pt.slug === pathwaySlug);
}

export function getCountryNameFromMap(countrySlug: string): string {
  const country = COUNTRIES_52.find((c) => c.slug === countrySlug);
  return (
    country?.name ??
    countrySlug
      .split('-')
      .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
      .join(' ')
  );
}
