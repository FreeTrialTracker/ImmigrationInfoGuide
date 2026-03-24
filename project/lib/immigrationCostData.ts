import { createClient } from '@supabase/supabase-js';
import {
  ImmigrationCostCountry,
  ImmigrationCostPathway,
  ImmigrationCostProfile,
  ImmigrationCostVisaGuide,
  ImmigrationCostContent,
  PathwayWithCountry,
  PathwayWithCostProfile,
  CountryWithPathways,
} from './immigrationCostTypes';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;
const supabase = createClient(supabaseUrl, supabaseKey);

export async function getActiveDestinationCountries(): Promise<ImmigrationCostCountry[]> {
  const { data, error } = await supabase
    .from('immigration_cost_countries')
    .select('*')
    .eq('is_active', true)
    .eq('is_destination', true)
    .order('name');

  if (error) throw error;
  return data || [];
}

export async function getActivePassportCountries(): Promise<ImmigrationCostCountry[]> {
  const { data, error } = await supabase
    .from('immigration_cost_countries')
    .select('*')
    .eq('is_active', true)
    .eq('is_passport_source', true)
    .order('name');

  if (error) throw error;
  return data || [];
}

export async function getCountryBySlug(slug: string): Promise<ImmigrationCostCountry | null> {
  const { data, error } = await supabase
    .from('immigration_cost_countries')
    .select('*')
    .eq('slug', slug)
    .eq('is_active', true)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getPathwaysByCountrySlug(countrySlug: string): Promise<ImmigrationCostPathway[]> {
  const country = await getCountryBySlug(countrySlug);
  if (!country) return [];

  const { data, error } = await supabase
    .from('immigration_cost_pathways')
    .select('*')
    .eq('country_id', country.id)
    .eq('is_active', true)
    .order('display_order');

  if (error) throw error;
  return data || [];
}

export async function getPathwayByCountryAndSlug(
  countrySlug: string,
  pathwaySlug: string
): Promise<PathwayWithCountry | null> {
  const country = await getCountryBySlug(countrySlug);
  if (!country) return null;

  const { data, error } = await supabase
    .from('immigration_cost_pathways')
    .select('*')
    .eq('country_id', country.id)
    .eq('pathway_slug', pathwaySlug)
    .eq('is_active', true)
    .maybeSingle();

  if (error) throw error;
  if (!data) return null;

  return { ...data, country };
}

export async function getCostProfileByPathwayId(pathwayId: string): Promise<ImmigrationCostProfile | null> {
  const { data, error } = await supabase
    .from('immigration_cost_profiles')
    .select('*')
    .eq('pathway_id', pathwayId)
    .eq('is_active', true)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getVisaGuideLinksByPathwayId(pathwayId: string): Promise<ImmigrationCostVisaGuide[]> {
  const { data, error } = await supabase
    .from('immigration_cost_visa_guides')
    .select('*')
    .eq('pathway_id', pathwayId)
    .order('is_primary', { ascending: false });

  if (error) throw error;
  return data || [];
}

export async function getCountryCostContent(countryId: string): Promise<ImmigrationCostContent | null> {
  const { data, error } = await supabase
    .from('immigration_cost_content')
    .select('*')
    .eq('country_id', countryId)
    .is('pathway_id', null)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getPathwayCostContent(pathwayId: string): Promise<ImmigrationCostContent | null> {
  const { data, error } = await supabase
    .from('immigration_cost_content')
    .select('*')
    .eq('pathway_id', pathwayId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getAllCountriesWithPathways(): Promise<CountryWithPathways[]> {
  const countries = await getActiveDestinationCountries();

  const countriesWithPathways = await Promise.all(
    countries.map(async (country) => {
      const { data: pathways } = await supabase
        .from('immigration_cost_pathways')
        .select('*')
        .eq('country_id', country.id)
        .eq('is_active', true)
        .order('display_order');

      return {
        ...country,
        pathways: pathways || [],
      };
    })
  );

  return countriesWithPathways;
}

export async function getPopularPathways(limit: number = 10): Promise<PathwayWithCostProfile[]> {
  const { data, error } = await supabase
    .from('immigration_cost_pathways')
    .select(`
      *,
      country:immigration_cost_countries!immigration_cost_pathways_country_id_fkey(*),
      cost_profile:immigration_cost_profiles(*)
    `)
    .eq('is_active', true)
    .eq('is_popular', true)
    .order('display_order')
    .limit(limit);

  if (error) throw error;

  return (data || []).map((item: any) => ({
    ...item,
    country: item.country,
    cost_profile: item.cost_profile?.[0] || null,
  }));
}

export async function getPathwayById(pathwayId: string): Promise<PathwayWithCountry | null> {
  const { data, error } = await supabase
    .from('immigration_cost_pathways')
    .select(`
      *,
      country:immigration_cost_countries!immigration_cost_pathways_country_id_fkey(*)
    `)
    .eq('id', pathwayId)
    .eq('is_active', true)
    .maybeSingle();

  if (error) throw error;
  if (!data) return null;

  return {
    ...data,
    country: data.country,
  };
}

export async function getCountriesByRegion(): Promise<Record<string, ImmigrationCostCountry[]>> {
  const countries = await getActiveDestinationCountries();

  const byRegion: Record<string, ImmigrationCostCountry[]> = {};

  countries.forEach((country) => {
    if (!byRegion[country.region]) {
      byRegion[country.region] = [];
    }
    byRegion[country.region].push(country);
  });

  return byRegion;
}

export async function getPathwaysByCountryId(countryId: string): Promise<ImmigrationCostPathway[]> {
  const { data, error } = await supabase
    .from('immigration_cost_pathways')
    .select('*')
    .eq('country_id', countryId)
    .eq('is_active', true)
    .order('display_order');

  if (error) throw error;
  return data || [];
}

export interface CalculatorHydrationPayload {
  passportCountries: ImmigrationCostCountry[];
  destinationCountries: ImmigrationCostCountry[];
  initialDestinationSlug?: string;
  initialDestinationCountry?: ImmigrationCostCountry;
  initialPathways?: ImmigrationCostPathway[];
  initialPathwaySlug?: string;
  initialPathway?: ImmigrationCostPathway;
  initialPassportSlug?: string;
  initialApplicantType?: string;
  initialChildren?: number;
  initialLegal?: boolean;
  initialRelocation?: boolean;
  initialSettlement?: boolean;
}

export async function getInitialCalculatorHydrationPayload(
  searchParams: { [key: string]: string | string[] | undefined }
): Promise<CalculatorHydrationPayload> {
  const [passportCountries, destinationCountries] = await Promise.all([
    getActivePassportCountries(),
    getActiveDestinationCountries(),
  ]);

  const destinationSlug = typeof searchParams.destination === 'string' ? searchParams.destination : undefined;
  const pathwaySlug = typeof searchParams.pathway === 'string' ? searchParams.pathway : undefined;
  const passportSlug = typeof searchParams.passport === 'string' ? searchParams.passport : undefined;
  const applicantType = typeof searchParams.applicantType === 'string' ? searchParams.applicantType : undefined;
  const children = typeof searchParams.children === 'string' ? parseInt(searchParams.children, 10) : undefined;
  const legal = searchParams.legal === 'true';
  const relocation = searchParams.relocation === 'true';
  const settlement = searchParams.settlement === 'true';

  let initialDestinationCountry: ImmigrationCostCountry | undefined;
  let initialPathways: ImmigrationCostPathway[] | undefined;
  let initialPathway: ImmigrationCostPathway | undefined;

  if (destinationSlug) {
    try {
      initialDestinationCountry = await getCountryBySlug(destinationSlug) || undefined;

      if (initialDestinationCountry) {
        initialPathways = await getPathwaysByCountryId(initialDestinationCountry.id);

        if (pathwaySlug && initialPathways) {
          initialPathway = initialPathways.find(p => p.pathway_slug === pathwaySlug);
        }
      }
    } catch (error) {
      console.error('Error loading initial calculator state:', error);
    }
  }

  return {
    passportCountries,
    destinationCountries,
    initialDestinationSlug: destinationSlug,
    initialDestinationCountry,
    initialPathways,
    initialPathwaySlug: pathwaySlug,
    initialPathway,
    initialPassportSlug: passportSlug,
    initialApplicantType: applicantType,
    initialChildren: children,
    initialLegal: legal,
    initialRelocation: relocation,
    initialSettlement: settlement,
  };
}
