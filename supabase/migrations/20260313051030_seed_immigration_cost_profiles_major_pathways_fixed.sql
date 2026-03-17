/*
  # Seed Immigration Cost Profiles - Major Pathways
  
  Realistic cost estimates for major immigration pathways.
  All amounts in respective currencies or USD equivalent.
*/

-- Canada Express Entry
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  biometrics_fee_min, biometrics_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  language_test_fee_min, language_test_fee_max,
  credential_assessment_fee_min, credential_assessment_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  spouse_fee, child_fee,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'CAD',
  850, 1325,
  85, 170,
  200, 500,
  50, 150,
  100, 300,
  300, 350,
  200, 250,
  2000, 5000,
  2000, 8000,
  2000, 5000,
  13310, 16570, 20371, 24553,
  850, 230,
  'Includes Express Entry fees for principal applicant. Language tests (IELTS/CELPIP) and ECA required. Proof of funds required at time of application.',
  'IRCC Official Fees 2026',
  '2026-03-01',
  false
FROM immigration_cost_pathways 
WHERE pathway_slug = 'express-entry-skilled-worker' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'canada');

-- Canada PNP
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  biometrics_fee_min, biometrics_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  language_test_fee_min, language_test_fee_max,
  credential_assessment_fee_min, credential_assessment_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  spouse_fee, child_fee,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'CAD',
  1500, 2325,
  85, 170,
  200, 500,
  50, 150,
  100, 300,
  300, 350,
  200, 250,
  3000, 7000,
  2000, 8000,
  2000, 5000,
  13310, 16570, 20371, 24553,
  850, 230,
  'Includes provincial nomination fee plus federal PR application. Requirements vary by province.',
  'Provincial and federal official fees',
  '2026-03-01',
  false
FROM immigration_cost_pathways 
WHERE pathway_slug = 'provincial-nominee-program' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'canada');

-- US Employment-Based Green Card
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  biometrics_fee_min, biometrics_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  spouse_fee, child_fee,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'USD',
  1760, 2805,
  85, 85,
  200, 500,
  50, 100,
  100, 500,
  5000, 15000,
  2000, 10000,
  2000, 8000,
  1140, 750,
  'Includes PERM labor certification, I-140, and I-485 fees. Attorney fees vary significantly.',
  'USCIS Official Fees 2026',
  '2026-03-01',
  true
FROM immigration_cost_pathways 
WHERE pathway_slug = 'employment-based-green-card' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-states');

-- Australia Skilled Independent 189
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  language_test_fee_min, language_test_fee_max,
  credential_assessment_fee_min, credential_assessment_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3,
  spouse_fee, child_fee,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'AUD',
  4640, 4640,
  300, 600,
  50, 200,
  100, 500,
  330, 385,
  500, 1200,
  3000, 8000,
  3000, 10000,
  3000, 8000,
  15000, 25000, 35000,
  2320, 1160,
  'Skills assessment required. IELTS or PTE for English. Must demonstrate settlement capacity.',
  'Department of Home Affairs Official Fees',
  '2026-03-01',
  false
FROM immigration_cost_pathways 
WHERE pathway_slug = 'skilled-independent-visa-189' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'australia');

-- UK Skilled Worker
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  spouse_fee, child_fee,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'GBP',
  719, 1420,
  200, 400,
  50, 150,
  100, 300,
  1500, 5000,
  2000, 8000,
  2000, 5000,
  719, 719,
  'Visa fee varies by duration. Immigration Health Surcharge £1035/year additional (paid upfront for full duration). Certificate of Sponsorship from employer required.',
  'UK Home Office Official Fees',
  '2026-03-01',
  false
FROM immigration_cost_pathways 
WHERE pathway_slug = 'skilled-worker-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-kingdom');

-- Germany EU Blue Card
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  proof_of_funds_single,
  spouse_fee, child_fee,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'EUR',
  100, 140,
  100, 300,
  150, 500,
  1000, 4000,
  2000, 8000,
  2000, 5000,
  5000,
  100, 50,
  'Residence permit fee €100-140. Recognition of qualifications may cost €200-600. Health insurance mandatory. Minimum salary threshold €45,300 (2026).',
  'German Federal Office Fees',
  '2026-03-01',
  true
FROM immigration_cost_pathways 
WHERE pathway_slug = 'eu-blue-card' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'germany');

-- Portugal D7
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  proof_of_funds_single, proof_of_funds_couple,
  spouse_fee,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'EUR',
  90, 90,
  100, 200,
  50, 150,
  200, 800,
  1500, 5000,
  2000, 6000,
  2000, 5000,
  9870, 14805,
  90,
  'Must show passive income of minimum €9,870/year. Criminal record check required. NIF and Portuguese bank account needed.',
  'SEF and AIMA Official Fees',
  '2026-03-01',
  true
FROM immigration_cost_pathways 
WHERE pathway_slug = 'd7-passive-income-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'portugal');

-- Spain Digital Nomad
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  proof_of_funds_single,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'EUR',
  80, 80,
  100, 200,
  50, 150,
  200, 600,
  1500, 4000,
  2000, 6000,
  28800,
  'Must demonstrate minimum income of 200% Spanish minimum wage (€2,400/month or €28,800/year). Health insurance required.',
  'Spanish Immigration Fees',
  '2026-03-01',
  true
FROM immigration_cost_pathways 
WHERE pathway_slug = 'digital-nomad-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'spain');

-- New Zealand Skilled Migrant
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  credential_assessment_fee_min, credential_assessment_fee_max,
  language_test_fee_min, language_test_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3,
  spouse_fee, child_fee,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'NZD',
  4890, 4890,
  300, 700,
  50, 200,
  100, 500,
  300, 800,
  300, 385,
  2000, 6000,
  3000, 10000,
  3000, 8000,
  20000, 35000, 50000,
  2445, 1630,
  'EOI submission fee $670 additional. Medical and police certificates required. Settlement funds recommended.',
  'Immigration New Zealand Official Fees',
  '2026-03-01',
  false
FROM immigration_cost_pathways 
WHERE pathway_slug = 'skilled-migrant-category' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'new-zealand');

-- Singapore Employment Pass
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'SGD',
  105, 225,
  80, 150,
  50, 200,
  800, 3000,
  2000, 8000,
  'Application fee SGD $105, issuance fee $225. Minimum salary ~$5,000/month. Medical examination required.',
  'Singapore MOM Official Fees',
  '2026-03-01',
  false
FROM immigration_cost_pathways 
WHERE pathway_slug = 'employment-pass' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'singapore');

-- Japan Work Visa
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  settlement_fee_min, settlement_fee_max,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'JPY',
  0, 3000,
  10000, 30000,
  2000, 10000,
  10000, 50000,
  100000, 500000,
  200000, 800000,
  100000, 500000,
  'COE application is free. Visa application fee varies by nationality. Translation and notarization of documents required.',
  'Japanese Immigration Bureau Fees',
  '2026-03-01',
  true
FROM immigration_cost_pathways 
WHERE pathway_slug = 'engineer-humanities-work-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'japan');

-- UAE Employment Visa
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  relocation_fee_min, relocation_fee_max,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'AED',
  3000, 7000,
  300, 600,
  500, 1500,
  0, 3000,
  3000, 12000,
  'Includes entry permit, medical test, Emirates ID, visa stamping, and typing center fees. Employer typically covers costs.',
  'UAE Federal Authority Fees',
  '2026-03-01',
  true
FROM immigration_cost_pathways 
WHERE pathway_slug = 'employment-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-arab-emirates');

-- Thailand Retirement Visa
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  proof_of_funds_single,
  notes, source_label, last_verified_at, is_estimate
)
SELECT 
  id, 'THB',
  2000, 10000,
  1000, 5000,
  1000, 5000,
  5000, 30000,
  800000,
  'Non-O visa ฿2,000, annual extension ฿1,900. Must be 50+ years old. Bank deposit of ฿800,000 or monthly income ฿65,000 required.',
  'Thai Immigration Bureau Fees',
  '2026-03-01',
  true
FROM immigration_cost_pathways 
WHERE pathway_slug = 'non-o-retirement-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'thailand');