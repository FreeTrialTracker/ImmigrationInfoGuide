import { createClient } from '@supabase/supabase-js';
import type { Database } from './database.types';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

export const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey);

export const SEED_PASSPORTS = [
  { slug: 'us', name: 'United States' },
  { slug: 'gb', name: 'United Kingdom' },
  { slug: 'ca', name: 'Canada' },
  { slug: 'au', name: 'Australia' },
  { slug: 'de', name: 'Germany' },
  { slug: 'fr', name: 'France' },
  { slug: 'jp', name: 'Japan' },
  { slug: 'in', name: 'India' },
  { slug: 'br', name: 'Brazil' },
  { slug: 'mx', name: 'Mexico' },
];

export const SEED_COUNTRIES = [
  { slug: 'us', name: 'United States', region: 'North America' },
  { slug: 'ca', name: 'Canada', region: 'North America' },
  { slug: 'gb', name: 'United Kingdom', region: 'Europe' },
  { slug: 'de', name: 'Germany', region: 'Europe' },
  { slug: 'fr', name: 'France', region: 'Europe' },
  { slug: 'es', name: 'Spain', region: 'Europe' },
  { slug: 'pt', name: 'Portugal', region: 'Europe' },
  { slug: 'au', name: 'Australia', region: 'Oceania' },
  { slug: 'nz', name: 'New Zealand', region: 'Oceania' },
  { slug: 'jp', name: 'Japan', region: 'Asia' },
  { slug: 'sg', name: 'Singapore', region: 'Asia' },
  { slug: 'ae', name: 'United Arab Emirates', region: 'Middle East' },
  { slug: 'mx', name: 'Mexico', region: 'North America' },
  { slug: 'cr', name: 'Costa Rica', region: 'Central America' },
];

export const PATHWAY_TYPES = [
  'Work',
  'Study',
  'Visit',
  'Residency',
  'Digital Nomad',
  'Investor',
  'Retirement',
];

export const STAY_LENGTH_OPTIONS = [
  '0-3-months',
  '3-6-months',
  '6-12-months',
  '1-3-years',
  '3-years-plus',
];

export async function getCountries() {
  const { data, error } = await supabase
    .from('countries')
    .select('slug, name, region')
    .order('name');

  if (error || !data) {
    return SEED_COUNTRIES;
  }

  return data;
}

export async function getPassports() {
  const { data, error } = await supabase
    .from('passports')
    .select('slug, name')
    .order('name');

  if (error || !data) {
    return SEED_PASSPORTS;
  }

  return data;
}

export async function getCountryBySlug(slug: string) {
  const { data, error } = await supabase
    .from('countries')
    .select('*')
    .eq('slug', slug)
    .maybeSingle();

  return { data, error };
}

export async function getImmigrationPathways(destination_slug: string) {
  const { data, error } = await supabase
    .from('immigration_pathways')
    .select('*')
    .eq('destination_slug', destination_slug)
    .order('pathway_type');

  return { data: data || [], error };
}
