/*
  # Add Immigration Pathways Comparison Fields V2

  1. New Fields
    - Add comparison fields to immigration_pathways
    - Add display fields to countries

  2. Strategy
    - Work with existing slug-based structure
    - Add fields without changing primary keys
*/

-- Add new fields to immigration_pathways
ALTER TABLE immigration_pathways
ADD COLUMN IF NOT EXISTS min_investment_usd numeric,
ADD COLUMN IF NOT EXISTS min_income_requirement_usd numeric,
ADD COLUMN IF NOT EXISTS processing_time_months text,
ADD COLUMN IF NOT EXISTS language_requirement text,
ADD COLUMN IF NOT EXISTS popularity_score integer;

-- Add display fields to countries
ALTER TABLE countries
ADD COLUMN IF NOT EXISTS official_language text,
ADD COLUMN IF NOT EXISTS currency text,
ADD COLUMN IF NOT EXISTS capital_city text,
ADD COLUMN IF NOT EXISTS id uuid DEFAULT gen_random_uuid() UNIQUE;

-- Add destination_country_id to pathways that references countries.id
ALTER TABLE immigration_pathways
ADD COLUMN IF NOT EXISTS destination_country_id uuid;

-- Add indexes
CREATE INDEX IF NOT EXISTS idx_immigration_pathways_destination_slug ON immigration_pathways(destination_slug);
CREATE INDEX IF NOT EXISTS idx_immigration_pathways_popularity ON immigration_pathways(popularity_score);
CREATE INDEX IF NOT EXISTS idx_countries_id ON countries(id);

-- Update countries with basic data
UPDATE countries SET official_language = 'English', currency = 'USD', capital_city = 'Washington D.C.' WHERE slug = 'united-states';
UPDATE countries SET official_language = 'English, French', currency = 'CAD', capital_city = 'Ottawa' WHERE slug = 'canada';
UPDATE countries SET official_language = 'English', currency = 'GBP', capital_city = 'London' WHERE slug = 'united-kingdom';
UPDATE countries SET official_language = 'English', currency = 'AUD', capital_city = 'Canberra' WHERE slug = 'australia';
UPDATE countries SET official_language = 'German', currency = 'EUR', capital_city = 'Berlin' WHERE slug = 'germany';
UPDATE countries SET official_language = 'French', currency = 'EUR', capital_city = 'Paris' WHERE slug = 'france';
UPDATE countries SET official_language = 'Spanish', currency = 'EUR', capital_city = 'Madrid' WHERE slug = 'spain';
UPDATE countries SET official_language = 'Portuguese', currency = 'EUR', capital_city = 'Lisbon' WHERE slug = 'portugal';
UPDATE countries SET official_language = 'Italian', currency = 'EUR', capital_city = 'Rome' WHERE slug = 'italy';
UPDATE countries SET official_language = 'Dutch', currency = 'EUR', capital_city = 'Amsterdam' WHERE slug = 'netherlands';
UPDATE countries SET official_language = 'English', currency = 'EUR', capital_city = 'Dublin' WHERE slug = 'ireland';
UPDATE countries SET official_language = 'German, French, Italian', currency = 'CHF', capital_city = 'Bern' WHERE slug = 'switzerland';
UPDATE countries SET official_language = 'Japanese', currency = 'JPY', capital_city = 'Tokyo' WHERE slug = 'japan';
UPDATE countries SET official_language = 'English, Malay, Chinese, Tamil', currency = 'SGD', capital_city = 'Singapore' WHERE slug = 'singapore';
UPDATE countries SET official_language = 'Korean', currency = 'KRW', capital_city = 'Seoul' WHERE slug = 'south-korea';
UPDATE countries SET official_language = 'English', currency = 'NZD', capital_city = 'Wellington' WHERE slug = 'new-zealand';
UPDATE countries SET official_language = 'Spanish', currency = 'MXN', capital_city = 'Mexico City' WHERE slug = 'mexico';
UPDATE countries SET official_language = 'Thai', currency = 'THB', capital_city = 'Bangkok' WHERE slug = 'thailand';
UPDATE countries SET official_language = 'Malay', currency = 'MYR', capital_city = 'Kuala Lumpur' WHERE slug = 'malaysia';
UPDATE countries SET official_language = 'Arabic', currency = 'AED', capital_city = 'Abu Dhabi' WHERE slug = 'uae';

-- Link immigration_pathways to countries via destination_country_id
UPDATE immigration_pathways ip
SET destination_country_id = c.id
FROM countries c
WHERE ip.destination_slug = c.slug;
