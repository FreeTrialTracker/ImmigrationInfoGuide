/*
  # Add Missing Passports

  1. Purpose
    - Adds Brazil and India passports to complete the 52-passport list

  2. Changes
    - Inserts Brazil and India into passports table
*/

INSERT INTO passports (slug, name) VALUES
  ('brazil', 'Brazil'),
  ('india', 'India')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name;
