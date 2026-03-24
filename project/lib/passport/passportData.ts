import { COUNTRIES_52 } from '@/data/countries52';
import { PATHWAY_TYPES } from '@/lib/pathwayTypes';

const BASE_URL = 'https://immigrationinfoguide.com';

export interface PassportMeta {
  slug: string;
  name: string;
  citizenLabel: string;
  region: string;
  isIndexable: boolean;
  popularDestinations: string[];
  contextNote: string;
}

const COUNTRY_SLUG_SET = new Set(COUNTRIES_52.map((c) => c.slug));

/**
 * High-value passports with curated data to ensure quality gating passes.
 * Each entry includes 4-8 popular immigration destinations and a context note.
 */
const PASSPORT_OVERRIDES: Record<
  string,
  {
    popularDestinations: string[];
    contextNote: string;
    citizenLabel?: string;
  }
> = {
  'united-states': {
    popularDestinations: ['canada', 'portugal', 'spain', 'germany', 'mexico', 'australia', 'new-zealand', 'ireland'],
    contextNote: 'US citizens enjoy strong travel freedom and are eligible for numerous long-stay, retirement, and remote-work programs abroad.',
    citizenLabel: 'US citizens',
  },
  'united-kingdom': {
    popularDestinations: ['canada', 'australia', 'new-zealand', 'spain', 'portugal', 'ireland', 'germany', 'france'],
    contextNote: 'UK passport holders have access to UK-specific working holiday agreements and are actively targeted by many European retirement and digital nomad programs.',
    citizenLabel: 'UK citizens',
  },
  'canada': {
    popularDestinations: ['portugal', 'spain', 'germany', 'australia', 'new-zealand', 'mexico', 'united-kingdom', 'ireland'],
    contextNote: 'Canadian passport holders rank highly for global mobility and are well-positioned for European long-stay, working holiday, and investor programs.',
    citizenLabel: 'Canadian citizens',
  },
  'australia': {
    popularDestinations: ['united-kingdom', 'canada', 'new-zealand', 'germany', 'portugal', 'spain', 'ireland', 'singapore'],
    contextNote: 'Australian citizens benefit from working holiday agreements with many countries and are eligible for a wide range of skilled migration pathways.',
    citizenLabel: 'Australian citizens',
  },
  'india': {
    popularDestinations: ['canada', 'united-states', 'united-kingdom', 'australia', 'germany', 'singapore', 'new-zealand', 'ireland'],
    contextNote: 'Indian passport holders are one of the most active groups pursuing skilled work migration and permanent residency abroad, particularly in English-speaking countries and Germany.',
    citizenLabel: 'Indian passport holders',
  },
  'china': {
    popularDestinations: ['canada', 'australia', 'united-states', 'portugal', 'germany', 'singapore', 'new-zealand', 'japan'],
    contextNote: 'Chinese passport holders are among the most active investor and skilled work visa applicants globally, with strong demand for programs in Canada, Australia, and Europe.',
    citizenLabel: 'Chinese passport holders',
  },
  'germany': {
    popularDestinations: ['portugal', 'spain', 'canada', 'australia', 'new-zealand', 'switzerland', 'netherlands', 'united-states'],
    contextNote: 'German passport holders benefit from EU freedom of movement and have excellent access to working holiday and retirement programs in Australia, New Zealand, and the Americas.',
    citizenLabel: 'German citizens',
  },
  'france': {
    popularDestinations: ['canada', 'australia', 'spain', 'portugal', 'switzerland', 'new-zealand', 'united-states', 'singapore'],
    contextNote: 'French citizens have EU freedom of movement and active working holiday agreements, making them well-positioned for relocation to English-speaking countries and the Americas.',
    citizenLabel: 'French citizens',
  },
  'brazil': {
    popularDestinations: ['portugal', 'spain', 'germany', 'canada', 'united-states', 'ireland', 'italy', 'france'],
    contextNote: 'Brazilian citizens have growing immigration opportunities in Europe, particularly Portugal and Spain, due to cultural and language ties. Canada and Germany are also popular destinations.',
    citizenLabel: 'Brazilian citizens',
  },
  'nigeria': {
    popularDestinations: ['canada', 'united-kingdom', 'united-states', 'germany', 'ireland', 'australia', 'netherlands', 'norway'],
    contextNote: 'Nigerian passport holders are a major source of skilled immigration to Canada, the UK, and Germany, with strong demand for work visas, study permits, and permanent residency pathways.',
    citizenLabel: 'Nigerian passport holders',
  },
  'philippines': {
    popularDestinations: ['canada', 'united-states', 'australia', 'united-kingdom', 'singapore', 'new-zealand', 'germany', 'norway'],
    contextNote: 'Filipino passport holders are one of the largest groups of economic migrants globally, with strong immigration channels to Canada, the US, Australia, and the Gulf states.',
    citizenLabel: 'Filipino passport holders',
  },
  'south-africa': {
    popularDestinations: ['united-kingdom', 'australia', 'canada', 'new-zealand', 'germany', 'netherlands', 'portugal', 'ireland'],
    contextNote: 'South African passport holders have strong emigration rates toward the UK, Australia, and New Zealand. Germany and the Netherlands are popular destinations for skilled workers.',
    citizenLabel: 'South African passport holders',
  },
  'mexico': {
    popularDestinations: ['canada', 'spain', 'portugal', 'germany', 'united-states', 'colombia', 'argentina', 'chile'],
    contextNote: 'Mexican citizens are increasingly exploring work and digital nomad immigration in Europe, particularly Spain and Germany, as well as retirement options in South America.',
    citizenLabel: 'Mexican citizens',
  },
  'japan': {
    popularDestinations: ['canada', 'australia', 'new-zealand', 'germany', 'spain', 'portugal', 'united-states', 'ireland'],
    contextNote: 'Japanese passport holders have exceptional global mobility and benefit from working holiday agreements with many countries, particularly Australia, Canada, and New Zealand.',
    citizenLabel: 'Japanese citizens',
  },
  'south-korea': {
    popularDestinations: ['australia', 'canada', 'new-zealand', 'germany', 'spain', 'portugal', 'united-states', 'ireland'],
    contextNote: 'South Korean citizens hold one of the world\'s strongest passports and are eligible for working holiday programs with Australia, Canada, New Zealand, and many European countries.',
    citizenLabel: 'South Korean citizens',
  },
};

/** Passports that are indexable because they have override data. */
const INDEXABLE_PASSPORT_SLUGS = new Set(Object.keys(PASSPORT_OVERRIDES));

/**
 * Default popular destinations for passports without specific overrides.
 * Used for non-indexable starter pages.
 */
const DEFAULT_DESTINATIONS = [
  'canada', 'germany', 'portugal', 'australia', 'spain',
];

export function getPassportMeta(slug: string): PassportMeta | null {
  const country = COUNTRIES_52.find((c) => c.slug === slug);
  if (!country) return null;

  const override = PASSPORT_OVERRIDES[slug];
  const isIndexable = INDEXABLE_PASSPORT_SLUGS.has(slug);

  return {
    slug: country.slug,
    name: country.name,
    citizenLabel: override?.citizenLabel ?? `${country.name} passport holders`,
    region: country.region,
    isIndexable,
    popularDestinations: override?.popularDestinations ?? DEFAULT_DESTINATIONS,
    contextNote: override?.contextNote ?? `${country.name} passport holders can explore immigration and long-term stay options across a range of countries.`,
  };
}

export function isValidPassportSlug(slug: string): boolean {
  return COUNTRY_SLUG_SET.has(slug);
}

export function isIndexablePassport(slug: string): boolean {
  return INDEXABLE_PASSPORT_SLUGS.has(slug);
}

/** All indexable passport slugs, ordered by perceived demand. */
export const INDEXABLE_PASSPORTS = [
  'united-states', 'united-kingdom', 'india', 'canada', 'australia',
  'china', 'germany', 'brazil', 'nigeria', 'philippines',
  'france', 'south-africa', 'mexico', 'japan', 'south-korea',
] as const;

export type IndexablePassportSlug = typeof INDEXABLE_PASSPORTS[number];

export function getPassportHubUrl(slug: string): string {
  return `${BASE_URL}/passport/${slug}`;
}

export function getPassportHubPath(slug: string): string {
  return `/passport/${slug}`;
}

/** Returns destination info for a given slug from COUNTRIES_52 */
export function getDestinationName(slug: string): string {
  const country = COUNTRIES_52.find((c) => c.slug === slug);
  return country?.name ?? slug.split('-').map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
}

/** Returns the region of a country slug. */
export function getRegionForSlug(slug: string): string | null {
  return COUNTRIES_52.find((c) => c.slug === slug)?.region ?? null;
}

export const ALL_PATHWAY_TYPES = PATHWAY_TYPES;
