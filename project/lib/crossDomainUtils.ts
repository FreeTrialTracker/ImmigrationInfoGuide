import { supabase } from './supabaseClient';

const VERIFIED_CROSS_DOMAIN_COUNTRIES = [
  'us',
  'ca',
  'gb',
  'de',
  'fr',
  'es',
  'pt',
  'au',
  'nz',
  'jp',
  'sg',
  'ae',
  'mx',
  'cr',
  'ie',
  'it',
  'nl',
  'th',
  'kr',
  'my',
  'panama',
  'chile',
  'colombia',
  'brazil',
  'vietnam',
  'indonesia',
  'norway',
  'sweden',
  'denmark',
  'south-africa',
];

export async function isCountryInBothSystems(countrySlug: string): Promise<boolean> {
  if (VERIFIED_CROSS_DOMAIN_COUNTRIES.includes(countrySlug)) {
    return true;
  }

  const { data, error } = await supabase
    .from('country_guides')
    .select('country_slug')
    .eq('country_slug', countrySlug)
    .maybeSingle();

  return !error && !!data;
}

export function getRandomAnchorText(
  texts: string[],
  countryName: string
): string {
  const randomIndex = Math.floor(Math.random() * texts.length);
  return texts[randomIndex].replace('{country}', countryName);
}
