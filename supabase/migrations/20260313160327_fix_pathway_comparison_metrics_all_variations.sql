/*
  # Fix Immigration Pathways Comparison Metrics - All Variations

  1. Updates
    - Handle all pathway_type variations (Work, Work Visa, etc.)
    - Add metrics to ALL pathways regardless of exact naming
    - Based on goal field as well

  2. Strategy
    - Update by both pathway_type and goal fields
    - Cover all naming variations
*/

-- Work-related pathways (any variation)
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '3-6'),
  language_requirement = COALESCE(language_requirement, 'Varies by country'),
  popularity_score = COALESCE(popularity_score, 75)
WHERE (
  pathway_type ILIKE '%work%' OR 
  goal ILIKE '%work%'
) AND processing_time_months IS NULL;

-- Study-related pathways
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '2-4'),
  language_requirement = COALESCE(language_requirement, 'Required for most programs'),
  popularity_score = COALESCE(popularity_score, 70)
WHERE (
  pathway_type ILIKE '%study%' OR 
  goal ILIKE '%study%'
) AND processing_time_months IS NULL;

-- Digital nomad pathways
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '1-3'),
  language_requirement = COALESCE(language_requirement, 'Usually not required'),
  popularity_score = COALESCE(popularity_score, 80),
  min_income_requirement_usd = COALESCE(min_income_requirement_usd, 2500)
WHERE (
  pathway_type ILIKE '%digital%nomad%' OR 
  pathway_type ILIKE '%nomad%' OR
  goal ILIKE '%digital%nomad%'
) AND processing_time_months IS NULL;

-- Retirement pathways
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '2-6'),
  language_requirement = COALESCE(language_requirement, 'Basic proficiency recommended'),
  popularity_score = COALESCE(popularity_score, 65),
  min_income_requirement_usd = COALESCE(min_income_requirement_usd, 2000)
WHERE (
  pathway_type ILIKE '%retirement%' OR 
  goal ILIKE '%retirement%'
) AND processing_time_months IS NULL;

-- Investor/Business pathways
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '6-12'),
  language_requirement = COALESCE(language_requirement, 'Varies by program'),
  popularity_score = COALESCE(popularity_score, 60),
  min_investment_usd = COALESCE(min_investment_usd, 100000)
WHERE (
  pathway_type ILIKE '%investor%' OR 
  pathway_type ILIKE '%business%' OR
  goal ILIKE '%investor%' OR
  goal ILIKE '%business%'
) AND processing_time_months IS NULL;

-- Permanent residency pathways
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '12-24'),
  language_requirement = COALESCE(language_requirement, 'Usually required'),
  popularity_score = COALESCE(popularity_score, 85)
WHERE (
  pathway_type ILIKE '%permanent%' OR 
  pathway_type ILIKE '%residency%' OR
  goal ILIKE '%permanent%' OR
  goal ILIKE '%residency%'
) AND processing_time_months IS NULL;

-- Family sponsorship pathways
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '6-18'),
  language_requirement = COALESCE(language_requirement, 'Varies'),
  popularity_score = COALESCE(popularity_score, 70)
WHERE (
  pathway_type ILIKE '%family%' OR 
  goal ILIKE '%family%'
) AND processing_time_months IS NULL;

-- Visit/Tourist pathways
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '1-2'),
  language_requirement = COALESCE(language_requirement, 'Not required'),
  popularity_score = COALESCE(popularity_score, 60)
WHERE (
  pathway_type ILIKE '%visit%' OR 
  pathway_type ILIKE '%tourist%' OR
  goal ILIKE '%visit%' OR
  goal ILIKE '%tourist%'
) AND processing_time_months IS NULL;

-- Any remaining pathways without metrics
UPDATE immigration_pathways SET
  processing_time_months = COALESCE(processing_time_months, '3-6'),
  language_requirement = COALESCE(language_requirement, 'Check requirements'),
  popularity_score = COALESCE(popularity_score, 50)
WHERE processing_time_months IS NULL;

-- Update pathway_type to normalized values for better querying
UPDATE immigration_pathways 
SET pathway_type = 'work'
WHERE pathway_type ILIKE '%work%' AND pathway_type != 'work';

UPDATE immigration_pathways 
SET pathway_type = 'study'
WHERE pathway_type ILIKE '%study%' AND pathway_type != 'study';

UPDATE immigration_pathways 
SET pathway_type = 'digital-nomad'
WHERE (pathway_type ILIKE '%digital%nomad%' OR pathway_type ILIKE '%nomad%') AND pathway_type != 'digital-nomad';

UPDATE immigration_pathways 
SET pathway_type = 'retirement'
WHERE pathway_type ILIKE '%retirement%' AND pathway_type != 'retirement';

UPDATE immigration_pathways 
SET pathway_type = 'investor'
WHERE (pathway_type ILIKE '%investor%' OR pathway_type ILIKE '%business%') AND pathway_type != 'investor';

UPDATE immigration_pathways 
SET pathway_type = 'permanent-residency'
WHERE (pathway_type ILIKE '%permanent%' OR pathway_type ILIKE '%residency%') AND pathway_type NOT IN ('permanent-residency', 'work', 'study', 'investor');

UPDATE immigration_pathways 
SET pathway_type = 'family'
WHERE pathway_type ILIKE '%family%' AND pathway_type != 'family';

UPDATE immigration_pathways 
SET pathway_type = 'visit'
WHERE (pathway_type ILIKE '%visit%' OR pathway_type ILIKE '%tourist%') AND pathway_type != 'visit';
