/*
  # Create Country Immigration Guides Table
  
  1. New Tables
    - `country_guides`
      - `id` (uuid, primary key)
      - `country_slug` (text, references countries.slug)
      - `overview` (text) - Brief overview of immigration to this country
      - `why_immigrate` (text) - Key reasons to move to this country
      - `popular_pathways` (jsonb) - Array of popular pathway types
      - `cost_of_living` (text) - Description of cost of living
      - `language_requirements` (text) - Language requirements info
      - `climate_lifestyle` (text) - Climate and lifestyle description
      - `employment_opportunities` (text) - Job market information
      - `healthcare_system` (text) - Healthcare information
      - `education_system` (text) - Education system overview
      - `visa_free_travel` (text) - Information about visa-free travel with citizenship
      - `key_facts` (jsonb) - Array of key facts
      - `official_resources` (jsonb) - Array of official links
      - `last_updated` (date)
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)
  
  2. Security
    - Enable RLS on `country_guides` table
    - Add policy for public read access (guides are public information)
*/

CREATE TABLE IF NOT EXISTS country_guides (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  country_slug text NOT NULL REFERENCES countries(slug),
  overview text NOT NULL,
  why_immigrate text NOT NULL,
  popular_pathways jsonb DEFAULT '[]'::jsonb,
  cost_of_living text,
  language_requirements text,
  climate_lifestyle text,
  employment_opportunities text,
  healthcare_system text,
  education_system text,
  visa_free_travel text,
  key_facts jsonb DEFAULT '[]'::jsonb,
  official_resources jsonb DEFAULT '[]'::jsonb,
  last_updated date DEFAULT CURRENT_DATE,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(country_slug)
);

ALTER TABLE country_guides ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Country guides are publicly readable"
  ON country_guides FOR SELECT
  TO public
  USING (true);

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS idx_country_guides_slug ON country_guides(country_slug);
