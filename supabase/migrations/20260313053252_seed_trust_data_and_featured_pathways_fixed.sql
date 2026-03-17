/*
  # Seed Trust Data and Featured Pathways - Fixed
  
  1. Updates
    - Set verification_status, fee_model, review priorities for all profiles
    - Mark next_review_due_at for high-priority countries
    - Add source notes and assumptions
  
  2. Seed Data
    - Add inclusions for major pathways
    - Add exclusions for major pathways
    - Mark featured/high-intent pathways
  
  3. Featured Countries
    - Canada, Australia, UK, US, Portugal, Germany, Spain, NZ, UAE, Thailand
*/

-- Update all existing cost profiles with default trust metadata
UPDATE immigration_cost_profiles icp
SET 
  fee_model = CASE 
    WHEN icp.visa_fee_min = icp.visa_fee_max THEN 'exact'
    WHEN icp.visa_fee_min IS NOT NULL AND icp.visa_fee_max IS NOT NULL THEN 'range'
    ELSE 'unknown'
  END,
  verification_status = 'estimated',
  last_verified_at = CURRENT_DATE - INTERVAL '30 days',
  next_review_due_at = CURRENT_DATE + INTERVAL '180 days',
  source_label = COALESCE(icp.source_label, 'Editorial Research'),
  legal_assumption_note = 'Legal fees vary by case complexity and service level. These are typical ranges for standard applications.',
  relocation_assumption_note = 'Relocation costs include economy airfare, temporary accommodation, and initial setup expenses.',
  settlement_assumption_note = 'Settlement buffer represents typical first-month expenses including housing deposit and basic necessities.'
WHERE icp.fee_model IS NULL;

-- Mark high-priority pathways for editorial review based on joined pathway data
UPDATE immigration_cost_profiles icp
SET 
  verification_status = 'editorial_reviewed',
  review_priority = 200,
  next_review_due_at = CURRENT_DATE + INTERVAL '90 days'
FROM immigration_pathways ip
WHERE icp.pathway_id = ip.id
AND ip.destination_slug IN ('canada', 'australia', 'portugal', 'germany', 'spain', 'united-kingdom')
AND ip.goal IN ('Work', 'Residency', 'Digital Nomad', 'Retirement');

-- Set higher review priority for top destination countries
UPDATE immigration_cost_profiles icp
SET review_priority = 100
FROM immigration_pathways ip
WHERE icp.pathway_id = ip.id
AND ip.destination_slug IN ('canada', 'australia', 'united-kingdom', 'united-states', 'portugal', 'germany', 'spain', 'new-zealand', 'uae', 'thailand')
AND icp.review_priority < 100;

-- Seed featured pathway popularity for high-demand routes
INSERT INTO immigration_pathway_popularity (pathway_id, popularity_score, is_featured, is_high_intent)
SELECT ip.id, 1000, true, true
FROM immigration_pathways ip
WHERE (ip.destination_slug = 'canada' AND ip.goal IN ('Work', 'Residency'))
   OR (ip.destination_slug = 'australia' AND ip.goal = 'Work')
   OR (ip.destination_slug = 'united-kingdom' AND ip.goal = 'Work')
   OR (ip.destination_slug = 'portugal' AND ip.goal IN ('Digital Nomad', 'Retirement'))
   OR (ip.destination_slug = 'germany' AND ip.goal = 'Work')
   OR (ip.destination_slug = 'spain' AND ip.goal = 'Digital Nomad')
   OR (ip.destination_slug = 'uae' AND ip.goal = 'Work')
   OR (ip.destination_slug = 'new-zealand' AND ip.goal = 'Work')
   OR (ip.destination_slug = 'thailand' AND ip.goal = 'Retirement')
ON CONFLICT (pathway_id) DO UPDATE
SET popularity_score = 1000, is_featured = true, is_high_intent = true, updated_at = now();

-- Seed medium-popularity pathways for all work/study/investor routes
INSERT INTO immigration_pathway_popularity (pathway_id, popularity_score, is_featured, is_high_intent)
SELECT ip.id, 500, false, true
FROM immigration_pathways ip
WHERE ip.goal IN ('Work', 'Study', 'Digital Nomad', 'Retirement', 'Investor')
AND NOT EXISTS (SELECT 1 FROM immigration_pathway_popularity ipp WHERE ipp.pathway_id = ip.id)
ON CONFLICT (pathway_id) DO NOTHING;

-- Seed standard-popularity for remaining pathways
INSERT INTO immigration_pathway_popularity (pathway_id, popularity_score, is_featured, is_high_intent)
SELECT ip.id, 100, false, false
FROM immigration_pathways ip
WHERE NOT EXISTS (SELECT 1 FROM immigration_pathway_popularity ipp WHERE ipp.pathway_id = ip.id)
ON CONFLICT (pathway_id) DO NOTHING;

-- Seed inclusions for all pathways (generic starter set)
INSERT INTO immigration_cost_inclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Government application fee', 'Official visa or permit application fee paid to immigration authorities', 1
FROM immigration_pathways ip;

INSERT INTO immigration_cost_inclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Biometrics fee', 'Fingerprinting and photo capture where required by immigration authorities', 2
FROM immigration_pathways ip
WHERE ip.goal IN ('Work', 'Study', 'Residency', 'Investor');

INSERT INTO immigration_cost_inclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Medical exam estimate', 'Basic immigration medical examination by approved panel physician', 3
FROM immigration_pathways ip
WHERE ip.goal IN ('Work', 'Residency', 'Permanent Residence');

INSERT INTO immigration_cost_inclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Document translation estimate', 'Certified translation of key documents to destination language', 4
FROM immigration_pathways ip;

INSERT INTO immigration_cost_inclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Language test estimate', 'English or local language proficiency test (IELTS, TOEFL, or equivalent)', 5
FROM immigration_pathways ip
WHERE ip.goal IN ('Work', 'Study', 'Residency', 'Permanent Residence');

INSERT INTO immigration_cost_inclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Police clearance certificate', 'Background check documentation from country of residence', 6
FROM immigration_pathways ip
WHERE ip.goal IN ('Work', 'Residency', 'Permanent Residence', 'Investor');

-- Seed exclusions for all pathways (generic transparency set)
INSERT INTO immigration_cost_exclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Courier and mailing fees', 'Document delivery, certified mail, and application shipping costs', 1
FROM immigration_pathways ip;

INSERT INTO immigration_cost_exclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Retake fees for failed tests', 'Additional costs if language or other qualification tests need to be repeated', 2
FROM immigration_pathways ip
WHERE ip.goal IN ('Work', 'Study', 'Residency');

INSERT INTO immigration_cost_exclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Premium or expedited processing', 'Optional fast-track services offered by some immigration authorities', 3
FROM immigration_pathways ip;

INSERT INTO immigration_cost_exclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Cost of maintaining proof of funds', 'Bank fees, investment management costs, or interest lost on locked funds', 4
FROM immigration_pathways ip
WHERE ip.goal IN ('Residency', 'Investor', 'Retirement', 'Study');

INSERT INTO immigration_cost_exclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Lost income during relocation', 'Opportunity cost of time spent on application and relocation process', 5
FROM immigration_pathways ip;

INSERT INTO immigration_cost_exclusions (pathway_id, label, description, display_order)
SELECT ip.id, 'Housing deposits beyond initial settlement', 'Long-term rental deposits, property down payments, or ongoing housing costs', 6
FROM immigration_pathways ip;