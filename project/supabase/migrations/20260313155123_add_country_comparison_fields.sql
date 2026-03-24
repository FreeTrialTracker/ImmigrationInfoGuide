/*
  # Add Country Comparison Fields

  1. New Fields
    - quality_of_life_score: integer (0-100)
    - ease_of_immigration_score: integer (0-100)
    - cost_of_living_index: integer (where 100 = NYC baseline)
    - healthcare_quality: text
    - climate: text
    - popular_cities: text array

  2. Notes
    - All fields nullable to allow gradual population
    - Scores use 0-100 scale for consistency
*/

-- Add new fields to country_guides
ALTER TABLE country_guides
ADD COLUMN IF NOT EXISTS quality_of_life_score integer,
ADD COLUMN IF NOT EXISTS ease_of_immigration_score integer,
ADD COLUMN IF NOT EXISTS cost_of_living_index integer,
ADD COLUMN IF NOT EXISTS healthcare_quality text,
ADD COLUMN IF NOT EXISTS climate text,
ADD COLUMN IF NOT EXISTS popular_cities text[];

-- Add check constraints for score ranges
ALTER TABLE country_guides
ADD CONSTRAINT quality_of_life_score_range CHECK (quality_of_life_score IS NULL OR (quality_of_life_score >= 0 AND quality_of_life_score <= 100)),
ADD CONSTRAINT ease_of_immigration_score_range CHECK (ease_of_immigration_score IS NULL OR (ease_of_immigration_score >= 0 AND ease_of_immigration_score <= 100)),
ADD CONSTRAINT cost_of_living_index_positive CHECK (cost_of_living_index IS NULL OR cost_of_living_index > 0);

-- Add index for common queries
CREATE INDEX IF NOT EXISTS idx_country_guides_quality_score ON country_guides(quality_of_life_score);
CREATE INDEX IF NOT EXISTS idx_country_guides_immigration_score ON country_guides(ease_of_immigration_score);
CREATE INDEX IF NOT EXISTS idx_country_guides_cost_index ON country_guides(cost_of_living_index);
