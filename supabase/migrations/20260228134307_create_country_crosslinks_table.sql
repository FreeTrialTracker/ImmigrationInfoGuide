/*
  # Create country cross-domain URL mapping table

  1. New Tables
    - `country_crosslinks`
      - `id` (uuid, primary key)
      - `country_name` (text, not null) - Human-readable country name
      - `country_code` (text, not null, unique) - ISO2 code (US, TH, GB, etc.)
      - `visa_url` (text, not null) - Full canonical URL on visainfoguide.com
      - `immigration_url` (text, not null) - Full canonical URL on immigrationinfoguide.com
      - `is_active` (boolean, not null, default true) - Toggle for active links
      - `updated_at` (timestamptz, not null, default now()) - Last update timestamp

  2. Security
    - Enable RLS on `country_crosslinks` table
    - Add policy for anonymous users to read active links only
    - Block inserts/updates/deletes for anonymous users

  3. Indexes
    - Unique index on country_code
    - Index on is_active for filtering
    - Index on country_code + is_active for common queries
*/

CREATE TABLE IF NOT EXISTS country_crosslinks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  country_name text NOT NULL,
  country_code text NOT NULL UNIQUE,
  visa_url text NOT NULL,
  immigration_url text NOT NULL,
  is_active boolean NOT NULL DEFAULT true,
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_country_crosslinks_code 
  ON country_crosslinks(country_code);

CREATE INDEX IF NOT EXISTS idx_country_crosslinks_active 
  ON country_crosslinks(is_active) 
  WHERE is_active = true;

CREATE INDEX IF NOT EXISTS idx_country_crosslinks_code_active 
  ON country_crosslinks(country_code, is_active) 
  WHERE is_active = true;

ALTER TABLE country_crosslinks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anonymous read for active links"
  ON country_crosslinks
  FOR SELECT
  TO anon
  USING (is_active = true);

CREATE POLICY "Block anonymous inserts"
  ON country_crosslinks
  FOR INSERT
  TO anon
  WITH CHECK (false);

CREATE POLICY "Block anonymous updates"
  ON country_crosslinks
  FOR UPDATE
  TO anon
  USING (false)
  WITH CHECK (false);

CREATE POLICY "Block anonymous deletes"
  ON country_crosslinks
  FOR DELETE
  TO anon
  USING (false);

-- Seed data with example countries (URLs need to be verified and updated)
INSERT INTO country_crosslinks (country_name, country_code, visa_url, immigration_url, is_active) VALUES
  ('United States', 'US', 'https://www.visainfoguide.com/destinations/united-states', 'https://www.immigrationinfoguide.com/immigrate-to/us', true),
  ('Thailand', 'TH', 'https://www.visainfoguide.com/destinations/thailand', 'https://www.immigrationinfoguide.com/immigrate-to/thailand', true),
  ('United Kingdom', 'GB', 'https://www.visainfoguide.com/destinations/united-kingdom', 'https://www.immigrationinfoguide.com/immigrate-to/gb', true),
  ('Japan', 'JP', 'https://www.visainfoguide.com/destinations/japan', 'https://www.immigrationinfoguide.com/immigrate-to/japan', true),
  ('Germany', 'DE', 'https://www.visainfoguide.com/destinations/germany', 'https://www.immigrationinfoguide.com/immigrate-to/germany', true),
  ('South Korea', 'KR', 'https://www.visainfoguide.com/destinations/south-korea', 'https://www.immigrationinfoguide.com/immigrate-to/south-korea', true),
  ('Canada', 'CA', 'https://www.visainfoguide.com/destinations/canada', 'https://www.immigrationinfoguide.com/immigrate-to/ca', true),
  ('Australia', 'AU', 'https://www.visainfoguide.com/destinations/australia', 'https://www.immigrationinfoguide.com/immigrate-to/au', true),
  ('Singapore', 'SG', 'https://www.visainfoguide.com/destinations/singapore', 'https://www.immigrationinfoguide.com/immigrate-to/singapore', true),
  ('New Zealand', 'NZ', 'https://www.visainfoguide.com/destinations/new-zealand', 'https://www.immigrationinfoguide.com/immigrate-to/nz', true)
ON CONFLICT (country_code) DO NOTHING;
