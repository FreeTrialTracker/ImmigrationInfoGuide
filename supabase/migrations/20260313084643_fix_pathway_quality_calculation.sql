/*
  # Fix Pathway Quality Calculation Function
  
  The existing function was not properly calculating word counts. This updates it to work correctly.
*/

CREATE OR REPLACE FUNCTION calculate_pathway_quality(p_pathway_id uuid)
RETURNS void AS $$
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
    v_score >= 15, -- Index pages with score >= 15 (at least 250 words)
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
$$ LANGUAGE plpgsql;

-- Recalculate all pathway quality scores
DO $$
DECLARE
  pathway_record RECORD;
BEGIN
  FOR pathway_record IN SELECT id FROM immigration_pathways
  LOOP
    PERFORM calculate_pathway_quality(pathway_record.id);
  END LOOP;
END $$;

-- Check results
SELECT 
  COUNT(*) as total_metrics,
  COUNT(CASE WHEN is_indexable = true THEN 1 END) as indexable_count,
  COUNT(CASE WHEN is_indexable = false THEN 1 END) as not_indexable_count,
  ROUND(AVG(content_richness_score), 2) as avg_score,
  ROUND(MIN(content_richness_score), 2) as min_score,
  ROUND(MAX(content_richness_score), 2) as max_score,
  ROUND(AVG(total_word_count), 0) as avg_word_count
FROM pathway_quality_metrics;
