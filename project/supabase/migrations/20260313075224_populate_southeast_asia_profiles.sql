/*
  # Populate Southeast Asia Immigration Cost Profiles
  
  1. Overview
    - 8 pathways across 4 Southeast Asian countries
    - Malaysia: Employment Pass, MM2H Retirement (MYR)
    - Indonesia: KITAS Work, Business Visa (IDR)
    - Vietnam: Work Permit, Business Visa (VND)
    - Philippines: Work Visa 9G, SRRV Retirement (PHP)
    
  2. Data Sources
    - Official immigration authorities
    - Current fee schedules verified March 2026
*/

-- MALAYSIA - EMPLOYMENT PASS
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'MYR', 500, 500, 100, 300, 200, 800, 2000, 8000, 500, 500, 0, 0, 0, 0,
  'Employment Pass for professional, managerial, technical positions. Minimum salary RM 5,000-12,000 depending on position/location. Employer sponsorship required. Initial pass 2 years, renewable. Dependents can accompany. Path to permanent residence (PR) after working several years.',
  'Immigration Department of Malaysia 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.imi.gov.my/',
  'Employment Pass RM 500 (Category I-III). EMGS processing fee RM 4,000 if applicable. Medical exam RM 100-300. Document certification RM 200-800. Minimum salary RM 5,000-12,000.',
  'Legal/agency fees RM 2,000-8,000 for Employment Pass. Employer typically covers. Immigration agent for document preparation and submission to Immigration Department.'
FROM immigration_cost_pathways WHERE pathway_slug = 'employment-pass' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'malaysia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- MALAYSIA - MM2H RETIREMENT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'MYR', 5000, 5000, 100, 300, 500, 2000, 5000, 20000, 2500, 2500, 1800000, 1800000, 1800000, 1800000,
  'Malaysia My Second Home (MM2H) long-term social visit pass for retirees. Requirements tightened 2021: offshore income RM 40,000/month OR minimum RM 1.5M liquid assets + RM 150,000 fixed deposit. 5-year renewable pass. Can bring dependents. Must stay 90 days/year minimum.',
  'Ministry of Tourism Malaysia 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://mm2h.gov.my/',
  'Application fee RM 5,000. Fixed deposit RM 150,000 required. Pass fee RM 500/year. Medical exam RM 100-300. Financial requirements strict: RM 40k/month income OR RM 1.5M assets.',
  'Legal fees RM 5,000-20,000 for MM2H application. Licensed MM2H agent mandatory for most applicants. Financial documentation preparation critical.'
FROM immigration_cost_pathways WHERE pathway_slug = 'mm2h-retirement' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'malaysia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- INDONESIA - KITAS WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'IDR', 9000000, 9000000, 500000, 1000000, 1000000, 5000000, 5000000, 20000000, 4500000, 4500000, 0, 0, 0, 0,
  'KITAS (Limited Stay Permit) for employment requires employer sponsorship and Ministry of Manpower work permit (IMTA). Initial permit 1-2 years, renewable. Family dependents can accompany with their own KITAS. Expensive sponsorship process. KITAS/KITAP (permanent) after working several years.',
  'Directorate General of Immigration Indonesia 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.imigrasi.go.id/',
  'KITAS processing IDR 9,000,000. Work permit (IMTA) ~IDR 10,000,000/year. Medical exam IDR 500k-1M. MERP (exit/re-entry permit) IDR 1,500,000. Sponsorship documentation IDR 1M-5M.',
  'Legal/agency fees IDR 5M-20M for KITAS work permit. Employer typically covers. Agency handles complex Ministry of Manpower and Immigration processes.'
FROM immigration_cost_pathways WHERE pathway_slug = 'kitas-work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'indonesia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- INDONESIA - BUSINESS VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'IDR', 8000000, 8000000, 500000, 1000000, 500000, 3000000, 3000000, 12000000, 4000000, 4000000, 50000000, 80000000, 100000000, 120000000,
  'Business visa (B211A) for business activities, meetings, conferences. Requires sponsorship from Indonesian company. Initial 60 days, extendable to 6 months total. Cannot work for Indonesian company. Popular entry point before converting to KITAS. Multiple entry options available.',
  'Directorate General of Immigration Indonesia 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.imigrasi.go.id/',
  'B211A visa IDR 8,000,000 for 60 days (extendable). Sponsorship letter required from Indonesian company. Extensions IDR 1,500,000 each (4x possible = 6 months total). VOA not suitable for business.',
  'Agency fees IDR 3M-12M for business visa sponsorship and processing. Agency finds sponsor company and handles immigration procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'business-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'indonesia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- VIETNAM - WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'VND', 1200000, 1200000, 500000, 1500000, 500000, 3000000, 5000000, 20000000, 1200000, 1200000, 0, 0, 0, 0,
  'Work permit requires employer sponsorship and Department of Labour approval. Must have qualifications/experience. Initial permit 2 years. Business visa (DN) or work visa required first, then work permit. Temporary residence card (TRC) issued. Family visas available for dependents.',
  'Vietnam Department of Immigration 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://xuatnhapcanh.gov.vn/',
  'Work permit VND 1,200,000. Work visa (LD) ~$135 USD. Temporary residence card VND 1,000,000. Medical exam VND 500k-1.5M. Document legalization VND 500k-3M.',
  'Legal/agency fees VND 5M-20M for work permit process. Employer covers. Agency handles Department of Labour application, consular legalization, and immigration procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'vietnam')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- VIETNAM - BUSINESS VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'VND', 2500000, 2500000, 0, 1500000, 500000, 2000000, 3000000, 12000000, 2500000, 2500000, 30000000, 50000000, 65000000, 80000000,
  'Business visa (DN) for business activities, meetings, consulting. Requires visa approval letter from Vietnamese sponsor/company. Single/multiple entry options. Valid 1-12 months. Cannot perform regular employment. Can extend in-country. E-visa available for many nationalities (90 days).',
  'Vietnam Department of Immigration 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://xuatnhapcanh.gov.vn/',
  'Business visa VND 2,500,000 (12-month multiple entry). E-visa $25 USD (90 days single entry). Visa approval letter VND 500k-1M. Extension VND 1,000,000-2,000,000.',
  'Agency fees VND 3M-12M for business visa sponsorship. Agency provides approval letter from Vietnamese company and handles visa processing.'
FROM immigration_cost_pathways WHERE pathway_slug = 'business-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'vietnam')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- PHILIPPINES - WORK VISA 9G
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'PHP', 10000, 10000, 2000, 5000, 2000, 10000, 15000, 60000, 10000, 10000, 0, 0, 0, 0,
  '9G work visa (Pre-Arranged Employment) requires employer sponsorship and Alien Employment Permit (AEP) from Department of Labour. Initial visa 1-3 years. Quota system for work permits. Family dependents can join. Processing involves DOLE, BI, and SEC. Path to permanent residence (SRRV) available.',
  'Bureau of Immigration Philippines 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://immigration.gov.ph/',
  'Work visa 9G PHP 10,000. Alien Employment Permit (AEP) ~PHP 5,000. ACR I-Card PHP 3,000. Medical exam PHP 2k-5k. NBI clearance PHP 155. Processing 2-4 months.',
  'Legal/agency fees PHP 15k-60k for 9G work visa. Employer typically covers. Agency handles DOLE work permit, BI visa processing, and compliance.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa-9g' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'philippines')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- PHILIPPINES - SRRV RETIREMENT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'PHP', 3600, 3600, 2000, 5000, 2000, 10000, 10000, 40000, 3600, 3600, 600000, 600000, 600000, 600000,
  'Special Resident Retiree Visa (SRRV) offers permanent residence for retirees 35+. Two options: SRRV Smile (deposit $10,000-20,000 non-convertible) or SRRV Classic (deposit $10,000-50,000 convertible to condo). Can work. Popular affordable retirement option. Multiple re-entry privileges.',
  'Philippine Retirement Authority 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.pra.gov.ph/',
  'SRRV application $360. Deposit $10,000-50,000 (varies by age/dependents). Annual fee $360. Medical exam PHP 2k-5k. ACR I-Card PHP 3,000. Processing 4-8 weeks.',
  'Legal/agency fees PHP 10k-40k for SRRV processing. Many applicants use PRA-accredited agents for application, document preparation, and deposit placement.'
FROM immigration_cost_pathways WHERE pathway_slug = 'srrv-retirement' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'philippines')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);