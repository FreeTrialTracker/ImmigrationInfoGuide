/*
  # Add Missing Countries to Complete 52-Country List

  1. Purpose
    - Adds all missing countries from the 52-country list
    - Ensures both countries and passports tables are complete

  2. Missing Countries
    Australia, Canada, France, Germany, Japan, Mexico, New Zealand, Portugal,
    Russia, Singapore, Spain, United Arab Emirates, United Kingdom, United States

  3. Notes
    - Uses ON CONFLICT DO UPDATE to safely handle existing entries
*/

-- Insert missing countries
INSERT INTO countries (slug, name, region) VALUES
  ('australia', 'Australia', 'Oceania'),
  ('canada', 'Canada', 'North America'),
  ('france', 'France', 'Europe'),
  ('germany', 'Germany', 'Europe'),
  ('japan', 'Japan', 'Asia'),
  ('mexico', 'Mexico', 'North America'),
  ('new-zealand', 'New Zealand', 'Oceania'),
  ('portugal', 'Portugal', 'Europe'),
  ('russia', 'Russia', 'Europe'),
  ('singapore', 'Singapore', 'Asia'),
  ('spain', 'Spain', 'Europe'),
  ('united-arab-emirates', 'United Arab Emirates', 'Middle East'),
  ('united-kingdom', 'United Kingdom', 'Europe'),
  ('united-states', 'United States', 'North America')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  region = EXCLUDED.region;

-- Insert corresponding passports
INSERT INTO passports (slug, name) VALUES
  ('australia', 'Australia'),
  ('canada', 'Canada'),
  ('france', 'France'),
  ('germany', 'Germany'),
  ('japan', 'Japan'),
  ('mexico', 'Mexico'),
  ('new-zealand', 'New Zealand'),
  ('portugal', 'Portugal'),
  ('russia', 'Russia'),
  ('singapore', 'Singapore'),
  ('spain', 'Spain'),
  ('united-arab-emirates', 'United Arab Emirates'),
  ('united-kingdom', 'United Kingdom'),
  ('united-states', 'United States')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name;
