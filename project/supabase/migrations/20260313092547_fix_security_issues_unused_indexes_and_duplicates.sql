/*
  # Fix Security and Performance Issues
  
  This migration addresses:
  1. Removes unused indexes to improve write performance and reduce storage
  2. Removes duplicate indexes
  3. Fixes function search path mutability issues
  
  ## Changes
  - Drop unused indexes on immigration_cost_* tables
  - Drop duplicate index on country_crosslinks
  - Fix search_path for functions to be immutable
*/

-- Drop unused indexes on immigration_cost_pathways
DROP INDEX IF EXISTS idx_cost_pathways_category;
DROP INDEX IF EXISTS idx_cost_pathways_is_active;
DROP INDEX IF EXISTS idx_cost_pathways_is_popular;

-- Drop unused indexes on immigration_cost_profiles
DROP INDEX IF EXISTS idx_cost_profiles_currency_code;
DROP INDEX IF EXISTS idx_cost_profiles_is_active;
DROP INDEX IF EXISTS immigration_cost_profiles_review_priority_idx;
DROP INDEX IF EXISTS immigration_cost_profiles_next_review_idx;

-- Drop unused indexes on immigration_cost_visa_guides
DROP INDEX IF EXISTS idx_cost_visa_guides_is_primary;

-- Drop unused indexes on immigration_cost_countries
DROP INDEX IF EXISTS idx_cost_countries_slug;
DROP INDEX IF EXISTS idx_cost_countries_region;
DROP INDEX IF EXISTS idx_cost_countries_is_destination;
DROP INDEX IF EXISTS idx_cost_countries_is_passport_source;
DROP INDEX IF EXISTS idx_cost_countries_is_active;
DROP INDEX IF EXISTS idx_cost_countries_display_order;

-- Drop unused indexes on other tables
DROP INDEX IF EXISTS immigration_cost_change_log_changed_at_idx;
DROP INDEX IF EXISTS immigration_pathway_popularity_score_idx;
DROP INDEX IF EXISTS immigration_pathway_popularity_featured_idx;
DROP INDEX IF EXISTS idx_quality_metrics_indexable;

-- Drop duplicate index (keep the unique constraint, drop the regular index)
DROP INDEX IF EXISTS idx_country_crosslinks_visa_slug;

-- Fix function search_path mutability issues
-- Recreate calculate_pathway_quality with explicit search_path
CREATE OR REPLACE FUNCTION calculate_pathway_quality(p_pathway_id uuid)
RETURNS void 
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
DECLARE
  v_word_count integer;
  v_has_faqs boolean;
  v_has_case_studies boolean;
  v_has_cost_breakdown boolean;
  v_has_step_by_step boolean;
  v_score numeric;
  v_summary_text text;
  v_eligibility_text text;
  v_requirements_text text;
BEGIN
  -- Get pathway texts
  SELECT 
    COALESCE(summary, ''),
    COALESCE(eligibility, ''),
    COALESCE(requirements, '')
  INTO v_summary_text, v_eligibility_text, v_requirements_text
  FROM immigration_pathways
  WHERE id = p_pathway_id;
  
  -- Count words in main pathway content (simple word count by spaces)
  v_word_count := (
    SELECT 
      array_length(regexp_split_to_array(
        v_summary_text || ' ' || v_eligibility_text || ' ' || v_requirements_text,
        '\s+'
      ), 1)
  );
  
  -- Check for FAQs
  SELECT EXISTS(SELECT 1 FROM pathway_faqs WHERE pathway_id = p_pathway_id LIMIT 1)
  INTO v_has_faqs;
  
  -- Check for case studies
  SELECT EXISTS(SELECT 1 FROM pathway_case_studies WHERE pathway_id = p_pathway_id LIMIT 1)
  INTO v_has_case_studies;
  
  -- Check for cost breakdown
  SELECT EXISTS(SELECT 1 FROM pathway_cost_breakdown WHERE pathway_id = p_pathway_id LIMIT 1)
  INTO v_has_cost_breakdown;
  
  -- Check for step-by-step content
  SELECT EXISTS(SELECT 1 FROM pathway_content_sections 
                WHERE pathway_id = p_pathway_id AND section_type = 'step_by_step' LIMIT 1)
  INTO v_has_step_by_step;
  
  -- Calculate richness score (0-100)
  v_score := 0;
  
  -- Word count contribution (max 40 points)
  IF v_word_count >= 2000 THEN
    v_score := v_score + 40;
  ELSIF v_word_count >= 1500 THEN
    v_score := v_score + 30;
  ELSIF v_word_count >= 1000 THEN
    v_score := v_score + 20;
  ELSIF v_word_count >= 500 THEN
    v_score := v_score + 10;
  ELSIF v_word_count >= 250 THEN
    v_score := v_score + 5;
  END IF;
  
  -- Feature bonuses (15 points each)
  IF v_has_faqs THEN v_score := v_score + 15; END IF;
  IF v_has_case_studies THEN v_score := v_score + 15; END IF;
  IF v_has_cost_breakdown THEN v_score := v_score + 15; END IF;
  IF v_has_step_by_step THEN v_score := v_score + 15; END IF;
  
  -- Insert or update quality metrics
  INSERT INTO pathway_quality_metrics (
    pathway_id,
    total_word_count,
    has_faqs,
    has_case_studies,
    has_cost_breakdown,
    has_step_by_step,
    content_richness_score,
    is_indexable,
    last_calculated
  ) VALUES (
    p_pathway_id,
    COALESCE(v_word_count, 0),
    v_has_faqs,
    v_has_case_studies,
    v_has_cost_breakdown,
    v_has_step_by_step,
    v_score,
    v_score >= 5,
    now()
  )
  ON CONFLICT (pathway_id) DO UPDATE SET
    total_word_count = EXCLUDED.total_word_count,
    has_faqs = EXCLUDED.has_faqs,
    has_case_studies = EXCLUDED.has_case_studies,
    has_cost_breakdown = EXCLUDED.has_cost_breakdown,
    has_step_by_step = EXCLUDED.has_step_by_step,
    content_richness_score = EXCLUDED.content_richness_score,
    is_indexable = EXCLUDED.is_indexable,
    last_calculated = now();
END;
$$;

-- Recreate trigger function with explicit search_path
CREATE OR REPLACE FUNCTION trigger_calculate_quality()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  PERFORM calculate_pathway_quality(NEW.id);
  RETURN NEW;
END;
$$;

-- Add comment explaining the security improvements
COMMENT ON FUNCTION calculate_pathway_quality IS 'Calculate content quality score for pathway with secure search_path';
COMMENT ON FUNCTION trigger_calculate_quality IS 'Trigger to calculate quality on pathway changes with secure search_path';
