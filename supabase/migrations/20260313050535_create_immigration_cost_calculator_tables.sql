/*
  # Immigration Cost Calculator Schema
  
  1. New Tables
    - `immigration_cost_countries`
      - Stores all countries (both destination and passport source)
      - Supports regional grouping
      - Flags for destination vs passport source
      
    - `immigration_cost_pathways`
      - Immigration pathways per destination country
      - Categorized (skilled worker, student, family, investor, etc.)
      - SEO-ready with slugs and metadata
      
    - `immigration_cost_profiles`
      - Detailed cost breakdown per pathway
      - Ranges for all fee types
      - Proof of funds by household size
      - Currency and verification metadata
      
    - `immigration_cost_visa_guides`
      - Links pathways to existing visa guide pages
      - Supports multiple guides per pathway
      
    - `immigration_cost_content`
      - SEO content blocks for country and pathway pages
      - Intro text, FAQs, warnings, next steps
      
  2. Security
    - Enable RLS on all tables
    - Public read access for active records
    - Write access restricted to service role only
    
  3. Indexes
    - Optimized for lookups by slug, country, pathway
    - Supports efficient filtering by region and status
*/

-- Create immigration_cost_countries table
CREATE TABLE IF NOT EXISTS immigration_cost_countries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE,
  slug text NOT NULL UNIQUE,
  region text NOT NULL,
  iso2 text,
  iso3 text,
  is_destination boolean NOT NULL DEFAULT true,
  is_passport_source boolean NOT NULL DEFAULT false,
  is_active boolean NOT NULL DEFAULT true,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create indexes for immigration_cost_countries
CREATE INDEX IF NOT EXISTS idx_cost_countries_slug ON immigration_cost_countries(slug);
CREATE INDEX IF NOT EXISTS idx_cost_countries_region ON immigration_cost_countries(region);
CREATE INDEX IF NOT EXISTS idx_cost_countries_is_destination ON immigration_cost_countries(is_destination);
CREATE INDEX IF NOT EXISTS idx_cost_countries_is_passport_source ON immigration_cost_countries(is_passport_source);
CREATE INDEX IF NOT EXISTS idx_cost_countries_is_active ON immigration_cost_countries(is_active);
CREATE INDEX IF NOT EXISTS idx_cost_countries_display_order ON immigration_cost_countries(display_order);

-- Create immigration_cost_pathways table
CREATE TABLE IF NOT EXISTS immigration_cost_pathways (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  country_id uuid NOT NULL REFERENCES immigration_cost_countries(id) ON DELETE CASCADE,
  pathway_name text NOT NULL,
  pathway_slug text NOT NULL,
  category text NOT NULL,
  short_description text,
  is_active boolean NOT NULL DEFAULT true,
  is_popular boolean NOT NULL DEFAULT false,
  display_order integer DEFAULT 0,
  seo_title text,
  seo_description text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  CONSTRAINT unique_country_pathway_slug UNIQUE(country_id, pathway_slug)
);

-- Create indexes for immigration_cost_pathways
CREATE INDEX IF NOT EXISTS idx_cost_pathways_country_id ON immigration_cost_pathways(country_id);
CREATE INDEX IF NOT EXISTS idx_cost_pathways_category ON immigration_cost_pathways(category);
CREATE INDEX IF NOT EXISTS idx_cost_pathways_is_active ON immigration_cost_pathways(is_active);
CREATE INDEX IF NOT EXISTS idx_cost_pathways_is_popular ON immigration_cost_pathways(is_popular);
CREATE INDEX IF NOT EXISTS idx_cost_pathways_slug ON immigration_cost_pathways(pathway_slug);

-- Create immigration_cost_profiles table
CREATE TABLE IF NOT EXISTS immigration_cost_profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid NOT NULL REFERENCES immigration_cost_pathways(id) ON DELETE CASCADE,
  currency_code text NOT NULL DEFAULT 'USD',
  visa_fee_min numeric(12,2),
  visa_fee_max numeric(12,2),
  biometrics_fee_min numeric(12,2),
  biometrics_fee_max numeric(12,2),
  medical_fee_min numeric(12,2),
  medical_fee_max numeric(12,2),
  police_fee_min numeric(12,2),
  police_fee_max numeric(12,2),
  document_fee_min numeric(12,2),
  document_fee_max numeric(12,2),
  language_test_fee_min numeric(12,2),
  language_test_fee_max numeric(12,2),
  credential_assessment_fee_min numeric(12,2),
  credential_assessment_fee_max numeric(12,2),
  legal_fee_min numeric(12,2),
  legal_fee_max numeric(12,2),
  relocation_fee_min numeric(12,2),
  relocation_fee_max numeric(12,2),
  settlement_fee_min numeric(12,2),
  settlement_fee_max numeric(12,2),
  proof_of_funds_single numeric(12,2),
  proof_of_funds_couple numeric(12,2),
  proof_of_funds_family_3 numeric(12,2),
  proof_of_funds_family_4 numeric(12,2),
  dependent_fee_each numeric(12,2),
  spouse_fee numeric(12,2),
  child_fee numeric(12,2),
  notes text,
  source_label text,
  last_verified_at date,
  is_estimate boolean NOT NULL DEFAULT true,
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create indexes for immigration_cost_profiles
CREATE INDEX IF NOT EXISTS idx_cost_profiles_pathway_id ON immigration_cost_profiles(pathway_id);
CREATE INDEX IF NOT EXISTS idx_cost_profiles_currency_code ON immigration_cost_profiles(currency_code);
CREATE INDEX IF NOT EXISTS idx_cost_profiles_is_active ON immigration_cost_profiles(is_active);

-- Create immigration_cost_visa_guides table
CREATE TABLE IF NOT EXISTS immigration_cost_visa_guides (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid NOT NULL REFERENCES immigration_cost_pathways(id) ON DELETE CASCADE,
  guide_title text NOT NULL,
  guide_url text NOT NULL,
  guide_type text,
  anchor_text text,
  is_primary boolean NOT NULL DEFAULT false,
  created_at timestamptz DEFAULT now()
);

-- Create indexes for immigration_cost_visa_guides
CREATE INDEX IF NOT EXISTS idx_cost_visa_guides_pathway_id ON immigration_cost_visa_guides(pathway_id);
CREATE INDEX IF NOT EXISTS idx_cost_visa_guides_is_primary ON immigration_cost_visa_guides(is_primary);

-- Create immigration_cost_content table
CREATE TABLE IF NOT EXISTS immigration_cost_content (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  country_id uuid NOT NULL REFERENCES immigration_cost_countries(id) ON DELETE CASCADE,
  pathway_id uuid REFERENCES immigration_cost_pathways(id) ON DELETE CASCADE,
  intro_md text,
  faq_json jsonb,
  warning_md text,
  next_steps_md text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create indexes for immigration_cost_content
CREATE INDEX IF NOT EXISTS idx_cost_content_country_id ON immigration_cost_content(country_id);
CREATE INDEX IF NOT EXISTS idx_cost_content_pathway_id ON immigration_cost_content(pathway_id);

-- Enable Row Level Security
ALTER TABLE immigration_cost_countries ENABLE ROW LEVEL SECURITY;
ALTER TABLE immigration_cost_pathways ENABLE ROW LEVEL SECURITY;
ALTER TABLE immigration_cost_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE immigration_cost_visa_guides ENABLE ROW LEVEL SECURITY;
ALTER TABLE immigration_cost_content ENABLE ROW LEVEL SECURITY;

-- Public read policies for active records
CREATE POLICY "Public can read active countries"
  ON immigration_cost_countries
  FOR SELECT
  TO public
  USING (is_active = true);

CREATE POLICY "Public can read active pathways"
  ON immigration_cost_pathways
  FOR SELECT
  TO public
  USING (is_active = true);

CREATE POLICY "Public can read active cost profiles"
  ON immigration_cost_profiles
  FOR SELECT
  TO public
  USING (is_active = true);

CREATE POLICY "Public can read visa guides"
  ON immigration_cost_visa_guides
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Public can read cost content"
  ON immigration_cost_content
  FOR SELECT
  TO public
  USING (true);