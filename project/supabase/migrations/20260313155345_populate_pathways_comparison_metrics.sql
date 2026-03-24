/*
  # Populate Immigration Pathways Comparison Metrics

  1. Updates
    - Add processing_time_months, language_requirement, popularity_score
    - Add min_investment_usd and min_income_requirement_usd where applicable
    - Based on pathway_type and destination

  2. Strategy
    - Set realistic values based on pathway type
    - Popularity scores based on common pathways
*/

-- Work visa pathways - general metrics
UPDATE immigration_pathways SET
  processing_time_months = '3-6',
  language_requirement = 'Varies by country',
  popularity_score = 75
WHERE pathway_type = 'work' AND processing_time_months IS NULL;

-- Study visa pathways
UPDATE immigration_pathways SET
  processing_time_months = '2-4',
  language_requirement = 'Required for most programs',
  popularity_score = 70
WHERE pathway_type = 'study' AND processing_time_months IS NULL;

-- Digital nomad pathways
UPDATE immigration_pathways SET
  processing_time_months = '1-3',
  language_requirement = 'Usually not required',
  popularity_score = 80,
  min_income_requirement_usd = 2500
WHERE pathway_type = 'digital-nomad' AND processing_time_months IS NULL;

-- Retirement pathways
UPDATE immigration_pathways SET
  processing_time_months = '2-6',
  language_requirement = 'Basic proficiency recommended',
  popularity_score = 65,
  min_income_requirement_usd = 2000
WHERE pathway_type = 'retirement' AND processing_time_months IS NULL;

-- Investor/Business pathways
UPDATE immigration_pathways SET
  processing_time_months = '6-12',
  language_requirement = 'Varies by program',
  popularity_score = 60,
  min_investment_usd = 100000
WHERE pathway_type = 'investor' AND processing_time_months IS NULL;

-- Permanent residency pathways
UPDATE immigration_pathways SET
  processing_time_months = '12-24',
  language_requirement = 'Usually required',
  popularity_score = 85
WHERE pathway_type = 'permanent-residency' AND processing_time_months IS NULL;

-- Family sponsorship pathways
UPDATE immigration_pathways SET
  processing_time_months = '6-18',
  language_requirement = 'Varies',
  popularity_score = 70
WHERE pathway_type = 'family' AND processing_time_months IS NULL;

-- Country-specific adjustments for popular destinations

-- Canada - Popular destination, higher scores
UPDATE immigration_pathways SET
  popularity_score = popularity_score + 10
WHERE destination_slug = 'canada' AND popularity_score IS NOT NULL;

-- Update Canada Express Entry
UPDATE immigration_pathways SET
  processing_time_months = '6-8',
  language_requirement = 'IELTS or CELPIP required',
  popularity_score = 95,
  min_income_requirement_usd = 13000
WHERE destination_slug = 'canada' AND pathway_name ILIKE '%express entry%';

-- United States pathways
UPDATE immigration_pathways SET
  processing_time_months = '6-12',
  language_requirement = 'English proficiency beneficial'
WHERE destination_slug = 'united-states' AND processing_time_months IS NULL;

-- Update H-1B
UPDATE immigration_pathways SET
  popularity_score = 90,
  processing_time_months = '3-6'
WHERE destination_slug = 'united-states' AND pathway_name ILIKE '%H-1B%';

-- Australia points-based
UPDATE immigration_pathways SET
  processing_time_months = '8-12',
  language_requirement = 'IELTS required',
  popularity_score = 88
WHERE destination_slug = 'australia' AND pathway_name ILIKE '%skilled%';

-- UK pathways
UPDATE immigration_pathways SET
  processing_time_months = '3-8',
  language_requirement = 'English proficiency required'
WHERE destination_slug = 'united-kingdom' AND processing_time_months IS NULL;

-- Germany Blue Card
UPDATE immigration_pathways SET
  processing_time_months = '2-3',
  language_requirement = 'German beneficial but not always required',
  popularity_score = 85,
  min_income_requirement_usd = 58000
WHERE destination_slug = 'germany' AND pathway_name ILIKE '%blue card%';

-- Portugal D7 (passive income)
UPDATE immigration_pathways SET
  processing_time_months = '2-4',
  language_requirement = 'Basic Portuguese recommended',
  popularity_score = 82,
  min_income_requirement_usd = 9120
WHERE destination_slug = 'portugal' AND (pathway_name ILIKE '%D7%' OR pathway_name ILIKE '%passive income%');

-- Spain Digital Nomad
UPDATE immigration_pathways SET
  processing_time_months = '3-4',
  language_requirement = 'Spanish beneficial',
  popularity_score = 88,
  min_income_requirement_usd = 2400
WHERE destination_slug = 'spain' AND pathway_name ILIKE '%digital nomad%';

-- Thailand DTV
UPDATE immigration_pathways SET
  processing_time_months = '1-2',
  language_requirement = 'Not required',
  popularity_score = 92,
  min_income_requirement_usd = 1500
WHERE destination_slug = 'thailand' AND pathway_name ILIKE '%destination thailand%';

-- UAE investor visa
UPDATE immigration_pathways SET
  processing_time_months = '2-3',
  language_requirement = 'English widely spoken',
  min_investment_usd = 200000,
  popularity_score = 75
WHERE destination_slug = 'uae' AND pathway_type = 'investor';

-- Singapore Employment Pass
UPDATE immigration_pathways SET
  processing_time_months = '1-2',
  language_requirement = 'English required',
  popularity_score = 80,
  min_income_requirement_usd = 5000
WHERE destination_slug = 'singapore' AND pathway_name ILIKE '%employment pass%';

-- New Zealand points-based
UPDATE immigration_pathways SET
  processing_time_months = '6-12',
  language_requirement = 'IELTS required',
  popularity_score = 83
WHERE destination_slug = 'new-zealand' AND pathway_name ILIKE '%skilled migrant%';

-- Mexico temporary resident
UPDATE immigration_pathways SET
  processing_time_months = '1-3',
  language_requirement = 'Spanish beneficial',
  popularity_score = 87,
  min_income_requirement_usd = 2700
WHERE destination_slug = 'mexico' AND pathway_name ILIKE '%temporary resident%';

-- Japan work visa
UPDATE immigration_pathways SET
  processing_time_months = '1-3',
  language_requirement = 'Japanese beneficial for most jobs',
  popularity_score = 72
WHERE destination_slug = 'japan' AND pathway_type = 'work';

-- Ireland Critical Skills
UPDATE immigration_pathways SET
  processing_time_months = '2-4',
  language_requirement = 'English required',
  popularity_score = 79,
  min_income_requirement_usd = 35000
WHERE destination_slug = 'ireland' AND pathway_name ILIKE '%critical skills%';

-- France Talent Passport
UPDATE immigration_pathways SET
  processing_time_months = '2-4',
  language_requirement = 'French beneficial',
  popularity_score = 76
WHERE destination_slug = 'france' AND pathway_name ILIKE '%talent passport%';

-- Netherlands highly skilled migrant
UPDATE immigration_pathways SET
  processing_time_months = '2-4',
  language_requirement = 'English widely spoken, Dutch beneficial',
  popularity_score = 81,
  min_income_requirement_usd = 45000
WHERE destination_slug = 'netherlands' AND pathway_name ILIKE '%highly skilled%';

-- Italy investor visa
UPDATE immigration_pathways SET
  processing_time_months = '3-6',
  language_requirement = 'Italian beneficial',
  min_investment_usd = 270000,
  popularity_score = 68
WHERE destination_slug = 'italy' AND pathway_type = 'investor';

-- Switzerland work permit
UPDATE immigration_pathways SET
  processing_time_months = '2-6',
  language_requirement = 'Depends on canton (German/French/Italian)',
  popularity_score = 65,
  min_income_requirement_usd = 90000
WHERE destination_slug = 'switzerland' AND pathway_type = 'work';
