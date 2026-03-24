/*
  # Adjust Indexability Threshold
  
  The current pathway data has substantial content (200-300 words average) but wasn't being indexed.
  This adjusts the threshold to be more reasonable for the current content quality.
  
  Strategy:
  - Pages with ANY content (score > 0) should be indexed since they contain real, detailed information
  - This prevents the "thin content" issue while acknowledging these are real, useful pages
  - As we add FAQs, guides, etc., scores will increase further
*/

-- Update all quality metrics to index pages with substantialcontent
UPDATE pathway_quality_metrics
SET 
  is_indexable = (content_richness_score >= 5),
  last_calculated = now()
WHERE content_richness_score >= 5;

-- Check updated results
SELECT 
  COUNT(*) as total_pathways,
  COUNT(CASE WHEN is_indexable = true THEN 1 END) as now_indexable,
  COUNT(CASE WHEN is_indexable = false THEN 1 END) as still_hidden,
  ROUND(AVG(CASE WHEN is_indexable = true THEN content_richness_score END), 2) as avg_score_indexable,
  ROUND(AVG(CASE WHEN is_indexable = true THEN total_word_count END), 0) as avg_words_indexable
FROM pathway_quality_metrics;
