import { supabase } from './supabaseClient';

export interface PathwayQualityMetrics {
  pathway_id: string;
  total_word_count: number;
  has_faqs: boolean;
  has_case_studies: boolean;
  has_cost_breakdown: boolean;
  has_step_by_step: boolean;
  content_richness_score: number;
  is_indexable: boolean;
  last_calculated: string;
}

export interface PathwayContentSection {
  id: string;
  pathway_id: string;
  section_type: string;
  title: string;
  content: string;
  display_order: number;
}

export interface PathwayFAQ {
  id: string;
  pathway_id: string;
  question: string;
  answer: string;
  display_order: number;
}

export interface PathwayCostBreakdown {
  id: string;
  pathway_id: string;
  cost_category: string;
  amount_min: number | null;
  amount_max: number | null;
  currency: string;
  description: string | null;
  is_mandatory: boolean;
}

export interface PathwayCaseStudy {
  id: string;
  pathway_id: string;
  title: string;
  summary: string;
  full_story: string;
  applicant_profile: Record<string, any>;
}

export interface EnrichedPathwayContent {
  contentSections: PathwayContentSection[];
  faqs: PathwayFAQ[];
  costBreakdown: PathwayCostBreakdown[];
  caseStudies: PathwayCaseStudy[];
}

export async function getPathwayQualityMetrics(pathwayId: string): Promise<PathwayQualityMetrics | null> {
  try {
    const { data, error } = await supabase
      .from('pathway_quality_metrics')
      .select('*')
      .eq('pathway_id', pathwayId)
      .maybeSingle();

    if (error) throw error;
    return data;
  } catch (error) {
    console.error('Error fetching pathway quality metrics:', error);
    return null;
  }
}

export async function getPathwayEnrichedContent(pathwayId: string): Promise<EnrichedPathwayContent> {
  const result: EnrichedPathwayContent = {
    contentSections: [],
    faqs: [],
    costBreakdown: [],
    caseStudies: [],
  };

  try {
    const [sectionsRes, faqsRes, costsRes, casesRes] = await Promise.all([
      supabase
        .from('pathway_content_sections')
        .select('*')
        .eq('pathway_id', pathwayId)
        .order('display_order', { ascending: true }),
      supabase
        .from('pathway_faqs')
        .select('*')
        .eq('pathway_id', pathwayId)
        .order('display_order', { ascending: true }),
      supabase
        .from('pathway_cost_breakdown')
        .select('*')
        .eq('pathway_id', pathwayId)
        .order('is_mandatory', { ascending: false }),
      supabase
        .from('pathway_case_studies')
        .select('*')
        .eq('pathway_id', pathwayId),
    ]);

    if (sectionsRes.data) result.contentSections = sectionsRes.data;
    if (faqsRes.data) result.faqs = faqsRes.data;
    if (costsRes.data) result.costBreakdown = costsRes.data;
    if (casesRes.data) result.caseStudies = casesRes.data;
  } catch (error) {
    console.error('Error fetching enriched pathway content:', error);
  }

  return result;
}

export function getQualityScoreLabel(score: number): { label: string; color: string } {
  if (score >= 70) return { label: 'Comprehensive', color: 'green' };
  if (score >= 50) return { label: 'Good', color: 'blue' };
  if (score >= 30) return { label: 'Basic', color: 'yellow' };
  return { label: 'Limited', color: 'red' };
}

export function getContentQualityRecommendations(metrics: PathwayQualityMetrics): string[] {
  const recommendations: string[] = [];

  if (metrics.total_word_count < 1000) {
    recommendations.push('Add more detailed content (aim for 1000+ words)');
  }

  if (!metrics.has_faqs) {
    recommendations.push('Add frequently asked questions');
  }

  if (!metrics.has_cost_breakdown) {
    recommendations.push('Include detailed cost breakdown');
  }

  if (!metrics.has_step_by_step) {
    recommendations.push('Add step-by-step application guide');
  }

  if (!metrics.has_case_studies) {
    recommendations.push('Include real-world examples or case studies');
  }

  return recommendations;
}
