/*
  # Rich Pathway Content Enhancement Schema
  
  This migration addresses thin content issues by adding comprehensive content tables
  to support rich, unique content for immigration pathway pages.
  
  ## 1. New Tables
  
  ### `pathway_content_sections`
  Stores detailed content sections for each pathway page
  - `id` (uuid, primary key)
  - `pathway_id` (uuid, foreign key to immigration_pathways)
  - `section_type` (text) - e.g., 'overview', 'step_by_step', 'common_mistakes', 'timeline'
  - `title` (text)
  - `content` (text) - Rich markdown content
  - `display_order` (integer)
  - `created_at`, `updated_at` (timestamptz)
  
  ### `pathway_faqs`
  Frequently asked questions specific to each pathway
  - `id` (uuid, primary key)
  - `pathway_id` (uuid, foreign key)
  - `question` (text)
  - `answer` (text)
  - `display_order` (integer)
  - `created_at`, `updated_at` (timestamptz)
  
  ### `pathway_case_studies`
  Real-world examples and success stories
  - `id` (uuid, primary key)
  - `pathway_id` (uuid, foreign key)
  - `title` (text)
  - `summary` (text)
  - `full_story` (text)
  - `applicant_profile` (jsonb) - age, profession, timeline, etc.
  - `created_at`, `updated_at` (timestamptz)
  
  ### `pathway_cost_breakdown`
  Detailed cost analysis
  - `id` (uuid, primary key)
  - `pathway_id` (uuid, foreign key)
  - `cost_category` (text)
  - `amount_min` (numeric)
  - `amount_max` (numeric)
  - `currency` (text)
  - `description` (text)
  - `is_mandatory` (boolean)
  - `created_at`, `updated_at` (timestamptz)
  
  ### `pathway_quality_metrics`
  Content quality tracking for SEO management
  - `pathway_id` (uuid, primary key, foreign key)
  - `total_word_count` (integer)
  - `has_faqs` (boolean)
  - `has_case_studies` (boolean)
  - `has_cost_breakdown` (boolean)
  - `has_step_by_step` (boolean)
  - `content_richness_score` (numeric) - 0-100 scale
  - `is_indexable` (boolean) - whether to allow search engine indexing
  - `last_calculated` (timestamptz)
  
  ## 2. Security
  - Enable RLS on all new tables
  - Public read access (authenticated and anon users)
  - Admin-only write access
  
  ## 3. Indexes
  - pathway_id indexes for fast lookup
  - quality score index for filtering
*/

-- Create pathway_content_sections table
CREATE TABLE IF NOT EXISTS pathway_content_sections (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  section_type text NOT NULL,
  title text NOT NULL,
  content text NOT NULL,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_content_sections_pathway ON pathway_content_sections(pathway_id);
CREATE INDEX IF NOT EXISTS idx_content_sections_type ON pathway_content_sections(section_type);

-- Create pathway_faqs table
CREATE TABLE IF NOT EXISTS pathway_faqs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  question text NOT NULL,
  answer text NOT NULL,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_faqs_pathway ON pathway_faqs(pathway_id);

-- Create pathway_case_studies table
CREATE TABLE IF NOT EXISTS pathway_case_studies (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  title text NOT NULL,
  summary text NOT NULL,
  full_story text NOT NULL,
  applicant_profile jsonb DEFAULT '{}'::jsonb,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_case_studies_pathway ON pathway_case_studies(pathway_id);

-- Create pathway_cost_breakdown table
CREATE TABLE IF NOT EXISTS pathway_cost_breakdown (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  cost_category text NOT NULL,
  amount_min numeric,
  amount_max numeric,
  currency text DEFAULT 'USD',
  description text,
  is_mandatory boolean DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_cost_breakdown_pathway ON pathway_cost_breakdown(pathway_id);

-- Create pathway_quality_metrics table
CREATE TABLE IF NOT EXISTS pathway_quality_metrics (
  pathway_id uuid PRIMARY KEY REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  total_word_count integer DEFAULT 0,
  has_faqs boolean DEFAULT false,
  has_case_studies boolean DEFAULT false,
  has_cost_breakdown boolean DEFAULT false,
  has_step_by_step boolean DEFAULT false,
  content_richness_score numeric DEFAULT 0,
  is_indexable boolean DEFAULT false,
  last_calculated timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_quality_metrics_score ON pathway_quality_metrics(content_richness_score);
CREATE INDEX IF NOT EXISTS idx_quality_metrics_indexable ON pathway_quality_metrics(is_indexable);

-- Enable RLS on all tables
ALTER TABLE pathway_content_sections ENABLE ROW LEVEL SECURITY;
ALTER TABLE pathway_faqs ENABLE ROW LEVEL SECURITY;
ALTER TABLE pathway_case_studies ENABLE ROW LEVEL SECURITY;
ALTER TABLE pathway_cost_breakdown ENABLE ROW LEVEL SECURITY;
ALTER TABLE pathway_quality_metrics ENABLE ROW LEVEL SECURITY;

-- RLS Policies: Public read access for all tables

-- pathway_content_sections policies
CREATE POLICY "Anyone can view content sections"
  ON pathway_content_sections FOR SELECT
  TO public
  USING (true);

-- pathway_faqs policies
CREATE POLICY "Anyone can view FAQs"
  ON pathway_faqs FOR SELECT
  TO public
  USING (true);

-- pathway_case_studies policies
CREATE POLICY "Anyone can view case studies"
  ON pathway_case_studies FOR SELECT
  TO public
  USING (true);

-- pathway_cost_breakdown policies
CREATE POLICY "Anyone can view cost breakdown"
  ON pathway_cost_breakdown FOR SELECT
  TO public
  USING (true);

-- pathway_quality_metrics policies
CREATE POLICY "Anyone can view quality metrics"
  ON pathway_quality_metrics FOR SELECT
  TO public
  USING (true);

-- Function to automatically calculate quality metrics
CREATE OR REPLACE FUNCTION calculate_pathway_quality(p_pathway_id uuid)
RETURNS void AS $$
DECLARE
  v_word_count integer;
  v_has_faqs boolean;
  v_has_case_studies boolean;
  v_has_cost_breakdown boolean;
  v_has_step_by_step boolean;
  v_score numeric;
BEGIN
  -- Count total words from main pathway content
  SELECT 
    LENGTH(summary || ' ' || eligibility || ' ' || requirements) - 
    LENGTH(REPLACE(summary || ' ' || eligibility || ' ' || requirements, ' ', '')) + 1
  INTO v_word_count
  FROM immigration_pathways
  WHERE id = p_pathway_id;
  
  -- Add words from content sections
  SELECT 
    COALESCE(SUM(LENGTH(content) - LENGTH(REPLACE(content, ' ', '')) + 1), 0)
  INTO v_word_count
  FROM pathway_content_sections
  WHERE pathway_id = p_pathway_id;
  
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
    v_word_count,
    v_has_faqs,
    v_has_case_studies,
    v_has_cost_breakdown,
    v_has_step_by_step,
    v_score,
    v_score >= 50, -- Only index pages with score >= 50
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

-- Create trigger to auto-calculate quality on pathway changes
CREATE OR REPLACE FUNCTION trigger_calculate_quality()
RETURNS trigger AS $$
BEGIN
  PERFORM calculate_pathway_quality(NEW.id);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER pathway_quality_update
AFTER INSERT OR UPDATE ON immigration_pathways
FOR EACH ROW
EXECUTE FUNCTION trigger_calculate_quality();

-- Initialize quality metrics for existing pathways
INSERT INTO pathway_quality_metrics (pathway_id, is_indexable)
SELECT id, false FROM immigration_pathways
ON CONFLICT (pathway_id) DO NOTHING;
