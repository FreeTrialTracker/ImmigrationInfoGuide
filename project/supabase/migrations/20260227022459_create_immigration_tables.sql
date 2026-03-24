/*
  # Create Immigration Info Guide Tables

  ## Overview
  This migration creates the core tables for the Immigration Info Guide application.

  ## New Tables
  
  ### 1. passports
  Stores passport/nationality information for the source country selection.
  - `slug` (text, primary key) - Country code (e.g., 'us', 'gb')
  - `name` (text, not null) - Full country name (e.g., 'United States')
  
  ### 2. countries
  Stores destination country information.
  - `slug` (text, primary key) - Country code (e.g., 'us', 'de')
  - `name` (text, not null) - Full country name
  - `region` (text, not null) - Geographic region
  
  ### 3. immigration_pathways
  Stores immigration pathway information for different combinations of passport, destination, and goals.
  - `id` (uuid, primary key)
  - `passport_slug` (text, not null) - References passport country
  - `destination_slug` (text, not null) - References destination country
  - `goal` (text, not null) - Purpose (Work, Study, Retire, etc.)
  - `pathway_name` (text, not null) - Name of the immigration pathway
  - `summary` (text, not null) - Brief overview
  - `eligibility` (text, not null) - Who qualifies
  - `key_requirements` (text, not null) - Main requirements
  - `typical_timeline` (text, not null) - Processing time
  - `estimated_fees` (text, not null) - Cost information
  - `official_links` (jsonb, default '[]') - Array of {label, url} objects
  - `last_updated` (date, default now())
  - `created_at` (timestamptz, default now())

  ## Security
  - All tables have RLS enabled
  - Public read access policies for authenticated and anonymous users
  - No write access via policies (admin only through service role)

  ## Notes
  - Tables are designed to be populated by admins via service role
  - Users only need read access to browse pathways
  - official_links field stores structured JSON for flexibility
*/

-- Create passports table
CREATE TABLE IF NOT EXISTS passports (
  slug text PRIMARY KEY,
  name text NOT NULL
);

-- Create countries table
CREATE TABLE IF NOT EXISTS countries (
  slug text PRIMARY KEY,
  name text NOT NULL,
  region text NOT NULL
);

-- Create immigration_pathways table
CREATE TABLE IF NOT EXISTS immigration_pathways (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  passport_slug text NOT NULL,
  destination_slug text NOT NULL,
  goal text NOT NULL,
  pathway_name text NOT NULL,
  summary text NOT NULL,
  eligibility text NOT NULL,
  key_requirements text NOT NULL,
  typical_timeline text NOT NULL,
  estimated_fees text NOT NULL,
  official_links jsonb DEFAULT '[]'::jsonb,
  last_updated date DEFAULT CURRENT_DATE,
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE passports ENABLE ROW LEVEL SECURITY;
ALTER TABLE countries ENABLE ROW LEVEL SECURITY;
ALTER TABLE immigration_pathways ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access
CREATE POLICY "Allow public read access to passports"
  ON passports
  FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Allow public read access to countries"
  ON countries
  FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Allow public read access to immigration pathways"
  ON immigration_pathways
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_immigration_pathways_passport 
  ON immigration_pathways(passport_slug);

CREATE INDEX IF NOT EXISTS idx_immigration_pathways_destination 
  ON immigration_pathways(destination_slug);

CREATE INDEX IF NOT EXISTS idx_immigration_pathways_goal 
  ON immigration_pathways(goal);

CREATE INDEX IF NOT EXISTS idx_immigration_pathways_lookup 
  ON immigration_pathways(passport_slug, destination_slug, goal);

-- Insert seed data for passports
INSERT INTO passports (slug, name) VALUES
  ('us', 'United States'),
  ('gb', 'United Kingdom'),
  ('ca', 'Canada'),
  ('au', 'Australia'),
  ('de', 'Germany'),
  ('fr', 'France'),
  ('jp', 'Japan'),
  ('in', 'India'),
  ('br', 'Brazil'),
  ('mx', 'Mexico')
ON CONFLICT (slug) DO NOTHING;

-- Insert seed data for countries
INSERT INTO countries (slug, name, region) VALUES
  ('us', 'United States', 'North America'),
  ('ca', 'Canada', 'North America'),
  ('gb', 'United Kingdom', 'Europe'),
  ('de', 'Germany', 'Europe'),
  ('fr', 'France', 'Europe'),
  ('es', 'Spain', 'Europe'),
  ('pt', 'Portugal', 'Europe'),
  ('au', 'Australia', 'Oceania'),
  ('nz', 'New Zealand', 'Oceania'),
  ('jp', 'Japan', 'Asia'),
  ('sg', 'Singapore', 'Asia'),
  ('ae', 'United Arab Emirates', 'Middle East'),
  ('mx', 'Mexico', 'North America'),
  ('cr', 'Costa Rica', 'Central America')
ON CONFLICT (slug) DO NOTHING;
