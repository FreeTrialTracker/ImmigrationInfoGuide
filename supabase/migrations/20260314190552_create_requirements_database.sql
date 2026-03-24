/*
  # Create Requirements Database

  ## Overview
  Creates a comprehensive requirements database for immigration visa types across countries.

  ## New Tables

  ### `requirement_categories`
  - `id` (text, PK) - e.g. 'identity', 'financial', 'health'
  - `label` (text) - Display label
  - `icon` (text) - Icon name identifier
  - `sort_order` (int)

  ### `visa_requirements`
  - `id` (uuid, PK)
  - `country` (text) - Country name
  - `country_slug` (text) - URL-friendly slug
  - `region` (text) - Geographic region
  - `visa_type` (text) - e.g. 'Skilled Work Visa', 'Student Visa'
  - `visa_category` (text) - e.g. 'work', 'study', 'residency', 'nomad', 'family', 'investor'
  - `difficulty` (text) - 'easy', 'moderate', 'hard'
  - `min_age` (int, nullable)
  - `max_age` (int, nullable)
  - `min_income_usd` (int, nullable) - Minimum monthly income in USD
  - `min_savings_usd` (int, nullable) - Minimum savings/proof of funds in USD
  - `language_required` (text, nullable) - e.g. 'English B2', 'German A1'
  - `health_insurance_required` (boolean)
  - `criminal_check_required` (boolean)
  - `medical_exam_required` (boolean)
  - `job_offer_required` (boolean)
  - `sponsor_required` (boolean)
  - `notes` (text, nullable)
  - `created_at` (timestamptz)

  ### `requirement_items`
  - `id` (uuid, PK)
  - `visa_requirement_id` (uuid, FK -> visa_requirements.id)
  - `category_id` (text, FK -> requirement_categories.id)
  - `label` (text) - Document/requirement label
  - `detail` (text, nullable) - Additional detail
  - `is_mandatory` (boolean) - true = mandatory, false = conditional/optional
  - `condition` (text, nullable) - When this is required (e.g. 'If employed')
  - `sort_order` (int)

  ## Security
  - RLS enabled on all tables
  - Public read access (immigration data is public information)
*/

CREATE TABLE IF NOT EXISTS requirement_categories (
  id text PRIMARY KEY,
  label text NOT NULL,
  icon text NOT NULL DEFAULT 'file',
  sort_order int NOT NULL DEFAULT 0
);

ALTER TABLE requirement_categories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read requirement categories"
  ON requirement_categories FOR SELECT
  TO anon, authenticated
  USING (true);

INSERT INTO requirement_categories (id, label, icon, sort_order) VALUES
  ('identity',    'Identity & Travel',     'passport',   1),
  ('financial',   'Financial Proof',       'banknote',   2),
  ('employment',  'Employment & Skills',   'briefcase',  3),
  ('education',   'Education & Qualifications', 'graduation', 4),
  ('health',      'Health & Insurance',    'heart',      5),
  ('legal',       'Legal & Background',    'shield',     6),
  ('language',    'Language Proficiency',  'speech',     7),
  ('accommodation','Accommodation',        'home',       8),
  ('family',      'Family & Relationships','users',      9),
  ('other',       'Other Documents',       'file',       10)
ON CONFLICT (id) DO NOTHING;

CREATE TABLE IF NOT EXISTS visa_requirements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  country text NOT NULL,
  country_slug text NOT NULL,
  region text NOT NULL,
  visa_type text NOT NULL,
  visa_category text NOT NULL,
  difficulty text NOT NULL DEFAULT 'moderate' CHECK (difficulty IN ('easy', 'moderate', 'hard')),
  min_age int,
  max_age int,
  min_income_usd int,
  min_savings_usd int,
  language_required text,
  health_insurance_required boolean NOT NULL DEFAULT false,
  criminal_check_required boolean NOT NULL DEFAULT false,
  medical_exam_required boolean NOT NULL DEFAULT false,
  job_offer_required boolean NOT NULL DEFAULT false,
  sponsor_required boolean NOT NULL DEFAULT false,
  notes text,
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_visa_requirements_country ON visa_requirements(country_slug);
CREATE INDEX IF NOT EXISTS idx_visa_requirements_category ON visa_requirements(visa_category);
CREATE INDEX IF NOT EXISTS idx_visa_requirements_region ON visa_requirements(region);

ALTER TABLE visa_requirements ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read visa requirements"
  ON visa_requirements FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE TABLE IF NOT EXISTS requirement_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  visa_requirement_id uuid NOT NULL REFERENCES visa_requirements(id) ON DELETE CASCADE,
  category_id text NOT NULL REFERENCES requirement_categories(id),
  label text NOT NULL,
  detail text,
  is_mandatory boolean NOT NULL DEFAULT true,
  condition text,
  sort_order int NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_requirement_items_visa ON requirement_items(visa_requirement_id);
CREATE INDEX IF NOT EXISTS idx_requirement_items_category ON requirement_items(category_id);

ALTER TABLE requirement_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read requirement items"
  ON requirement_items FOR SELECT
  TO anon, authenticated
  USING (true);
