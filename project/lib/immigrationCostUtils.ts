import { supabase } from './supabaseClient';

export interface PathwayWithPopularity {
  id: string;
  pathway_name: string;
  destination_slug: string;
  goal: string;
  popularity_score: number;
  is_featured: boolean;
  is_high_intent: boolean;
}

export interface CostProfileWithTrust {
  id: string;
  pathway_id: string;
  currency_code: string;
  fee_model: string;
  verification_status: string;
  last_verified_at: string;
  review_priority: number;
  official_fee_url?: string;
  official_fee_notes?: string;
}

export interface CostInclusion {
  id: string;
  pathway_id: string;
  label: string;
  description: string;
  display_order: number;
}

export interface CostExclusion {
  id: string;
  pathway_id: string;
  label: string;
  description: string;
  display_order: number;
}

/**
 * Get featured pathways sorted by popularity
 */
export async function getFeaturedPathways(limit: number = 12): Promise<PathwayWithPopularity[]> {
  const { data, error } = await supabase
    .from('immigration_pathways')
    .select(`
      id,
      pathway_name,
      destination_slug,
      goal,
      immigration_pathway_popularity (
        popularity_score,
        is_featured,
        is_high_intent
      )
    `)
    .eq('immigration_pathway_popularity.is_featured', true)
    .order('immigration_pathway_popularity.popularity_score', { ascending: false })
    .limit(limit);

  if (error) {
    console.error('Error fetching featured pathways:', error);
    return [];
  }

  return (data || []).map((item: any) => ({
    id: item.id,
    pathway_name: item.pathway_name,
    destination_slug: item.destination_slug,
    goal: item.goal,
    popularity_score: item.immigration_pathway_popularity?.[0]?.popularity_score || 0,
    is_featured: item.immigration_pathway_popularity?.[0]?.is_featured || false,
    is_high_intent: item.immigration_pathway_popularity?.[0]?.is_high_intent || false,
  }));
}

/**
 * Get popular pathways for a specific country sorted by popularity
 */
export async function getPopularPathwaysForCountry(
  countrySlug: string,
  limit: number = 10
): Promise<PathwayWithPopularity[]> {
  const { data, error } = await supabase
    .from('immigration_pathways')
    .select(`
      id,
      pathway_name,
      destination_slug,
      goal,
      immigration_pathway_popularity (
        popularity_score,
        is_featured,
        is_high_intent
      )
    `)
    .eq('destination_slug', countrySlug)
    .order('immigration_pathway_popularity.popularity_score', { ascending: false })
    .limit(limit);

  if (error) {
    console.error('Error fetching popular pathways for country:', error);
    return [];
  }

  return (data || []).map((item: any) => ({
    id: item.id,
    pathway_name: item.pathway_name,
    destination_slug: item.destination_slug,
    goal: item.goal,
    popularity_score: item.immigration_pathway_popularity?.[0]?.popularity_score || 0,
    is_featured: item.immigration_pathway_popularity?.[0]?.is_featured || false,
    is_high_intent: item.immigration_pathway_popularity?.[0]?.is_high_intent || false,
  }));
}

/**
 * Get top priority countries for editorial review
 */
export async function getTopPriorityCountries(): Promise<string[]> {
  const { data, error } = await supabase
    .from('immigration_cost_profiles')
    .select('pathway_id')
    .gte('review_priority', 100)
    .order('review_priority', { ascending: false });

  if (error) {
    console.error('Error fetching top priority countries:', error);
    return [];
  }

  // Get unique country slugs from pathways
  const pathwayIds = (data || []).map((p: any) => p.pathway_id);

  if (pathwayIds.length === 0) return [];

  const { data: pathways } = await supabase
    .from('immigration_pathways')
    .select('destination_slug')
    .in('id', pathwayIds);

  const countrySet = new Set<string>();
  (pathways || []).forEach((p: any) => {
    countrySet.add(p.destination_slug);
  });
  return Array.from(countrySet);
}

/**
 * Get cost profiles that need review (overdue or never verified)
 */
export async function getProfilesNeedingReview() {
  const today = new Date().toISOString().split('T')[0];

  const { data, error } = await supabase
    .from('immigration_cost_profiles')
    .select(`
      id,
      pathway_id,
      currency_code,
      fee_model,
      verification_status,
      last_verified_at,
      next_review_due_at,
      review_priority,
      immigration_pathways (
        pathway_name,
        destination_slug
      )
    `)
    .or(`next_review_due_at.lt.${today},next_review_due_at.is.null,verification_status.eq.needs_review`)
    .order('review_priority', { ascending: false })
    .order('next_review_due_at', { ascending: true });

  if (error) {
    console.error('Error fetching profiles needing review:', error);
    return [];
  }

  return data || [];
}

/**
 * Get overdue cost profiles
 */
export async function getOverdueCostProfiles() {
  const today = new Date().toISOString().split('T')[0];

  const { data, error } = await supabase
    .from('immigration_cost_profiles')
    .select(`
      id,
      pathway_id,
      fee_model,
      verification_status,
      next_review_due_at,
      review_priority,
      immigration_pathways (
        pathway_name,
        destination_slug
      )
    `)
    .lt('next_review_due_at', today)
    .order('review_priority', { ascending: false })
    .order('next_review_due_at', { ascending: true });

  if (error) {
    console.error('Error fetching overdue profiles:', error);
    return [];
  }

  return data || [];
}

/**
 * Get pathways suitable for comparison with the current pathway
 */
export async function getComparisonCandidatesForCountry(
  countrySlug: string,
  excludePathwayId?: string
): Promise<PathwayWithPopularity[]> {
  let query = supabase
    .from('immigration_pathways')
    .select(`
      id,
      pathway_name,
      destination_slug,
      goal,
      immigration_pathway_popularity (
        popularity_score,
        is_featured,
        is_high_intent
      )
    `)
    .eq('destination_slug', countrySlug)
    .order('immigration_pathway_popularity.popularity_score', { ascending: false });

  if (excludePathwayId) {
    query = query.neq('id', excludePathwayId);
  }

  const { data, error } = await query.limit(5);

  if (error) {
    console.error('Error fetching comparison candidates:', error);
    return [];
  }

  return (data || []).map((item: any) => ({
    id: item.id,
    pathway_name: item.pathway_name,
    destination_slug: item.destination_slug,
    goal: item.goal,
    popularity_score: item.immigration_pathway_popularity?.[0]?.popularity_score || 0,
    is_featured: item.immigration_pathway_popularity?.[0]?.is_featured || false,
    is_high_intent: item.immigration_pathway_popularity?.[0]?.is_high_intent || false,
  }));
}

/**
 * Get cost inclusions for a pathway
 */
export async function getCostInclusions(pathwayId: string): Promise<CostInclusion[]> {
  const { data, error } = await supabase
    .from('immigration_cost_inclusions')
    .select('*')
    .eq('pathway_id', pathwayId)
    .order('display_order', { ascending: true });

  if (error) {
    console.error('Error fetching cost inclusions:', error);
    return [];
  }

  return data || [];
}

/**
 * Get cost exclusions for a pathway
 */
export async function getCostExclusions(pathwayId: string): Promise<CostExclusion[]> {
  const { data, error } = await supabase
    .from('immigration_cost_exclusions')
    .select('*')
    .eq('pathway_id', pathwayId)
    .order('display_order', { ascending: true });

  if (error) {
    console.error('Error fetching cost exclusions:', error);
    return [];
  }

  return data || [];
}

/**
 * Get trust badge text based on verification status
 */
export function getVerificationBadgeText(verificationStatus: string): string {
  switch (verificationStatus) {
    case 'official':
      return 'Official Fees';
    case 'editorial_reviewed':
      return 'Reviewed';
    case 'estimated':
      return 'Estimate';
    case 'needs_review':
      return 'Needs Review';
    default:
      return 'Estimate';
  }
}

/**
 * Get trust badge color class based on verification status
 */
export function getVerificationBadgeColor(verificationStatus: string): string {
  switch (verificationStatus) {
    case 'official':
      return 'bg-green-100 text-green-800 border-green-200';
    case 'editorial_reviewed':
      return 'bg-blue-100 text-blue-800 border-blue-200';
    case 'estimated':
      return 'bg-yellow-100 text-yellow-800 border-yellow-200';
    case 'needs_review':
      return 'bg-red-100 text-red-800 border-red-200';
    default:
      return 'bg-gray-100 text-gray-800 border-gray-200';
  }
}

/**
 * Get confidence message based on verification status and fee model
 */
export function getConfidenceMessage(verificationStatus: string, feeModel: string): string {
  if (verificationStatus === 'official') {
    return 'Official fee data available for key components';
  }

  if (verificationStatus === 'editorial_reviewed' && feeModel === 'mixed') {
    return 'Combination of official fees and editorial estimates';
  }

  if (verificationStatus === 'editorial_reviewed') {
    return 'Editorial estimate based on recent research';
  }

  if (verificationStatus === 'needs_review') {
    return 'This pathway needs manual review before relying on the estimate';
  }

  return 'Editorial estimate only - verify before applying';
}

/**
 * Format currency with proper symbol and formatting
 */
export function formatCurrency(amount: number, currencyCode: string): string {
  try {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: currencyCode,
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(amount);
  } catch {
    return `${currencyCode} ${amount.toLocaleString()}`;
  }
}

/**
 * Get profiles with missing official fee URLs
 */
export async function getProfilesMissingOfficialUrl() {
  const { data, error } = await supabase
    .from('immigration_cost_profiles')
    .select(`
      id,
      pathway_id,
      verification_status,
      official_fee_url,
      review_priority,
      immigration_pathways (
        pathway_name,
        destination_slug
      )
    `)
    .is('official_fee_url', null)
    .gte('review_priority', 50)
    .order('review_priority', { ascending: false });

  if (error) {
    console.error('Error fetching profiles missing official URLs:', error);
    return [];
  }

  return data || [];
}

/**
 * Get estimated-only profiles for quality review
 */
export async function getEstimatedOnlyProfiles() {
  const { data, error } = await supabase
    .from('immigration_cost_profiles')
    .select(`
      id,
      pathway_id,
      verification_status,
      fee_model,
      review_priority,
      immigration_pathways (
        pathway_name,
        destination_slug
      )
    `)
    .eq('verification_status', 'estimated')
    .gte('review_priority', 50)
    .order('review_priority', { ascending: false });

  if (error) {
    console.error('Error fetching estimated-only profiles:', error);
    return [];
  }

  return data || [];
}
