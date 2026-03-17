/*
  # Populate Asia Immigration Cost Profiles - China, India, Russia
  
  1. Overview
    - 6 pathways across 3 countries
    - China: Z Work Visa, X Study Visa (CNY)
    - India: Employment Visa, Student Visa (INR)
    - Russia: Work Permit, Student Visa (RUB)
    
  2. Data Sources
    - Official immigration authorities
    - Current fee schedules verified March 2026
*/

-- CHINA - Z VISA WORK
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CNY', 400, 400, 500, 1000, 500, 3000, 5000, 30000, 400, 400, 0, 0, 0, 0,
  'Z visa for work requires employer sponsorship and work permit from provincial Human Resources and Social Security Bureau. Must have invitation letter from Chinese employer. Initial visa 30-90 days, then convert to residence permit (1-5 years). Medical exam and police certificate required. Strict requirements for qualifications and experience.',
  'National Immigration Administration China 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'http://www.nia.gov.cn/',
  'Z visa CNY 400 (varies by nationality). Work permit notification letter required. Medical exam CNY 500-1,000. Residence permit CNY 400/year. Document authentication CNY 500-3,000.',
  'Legal fees CNY 5,000-30,000 for Z visa process. Employer typically covers. Agency for work permit application, document authentication, and local bureau procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'z-visa-work' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'china')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- CHINA - X VISA STUDY
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CNY', 400, 400, 500, 1000, 500, 3000, 2000, 10000, 400, 400, 80000, 140000, 190000, 240000,
  'X1 visa for long-term study (>180 days) at Chinese universities. Requires admission notice and JW202 form from university. Medical exam mandatory. Convert to residence permit within 30 days of arrival. Valid for duration of studies. Part-time work typically not allowed. Must register with local police within 24 hours.',
  'National Immigration Administration China 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'http://www.nia.gov.cn/',
  'X1 visa CNY 400 (varies by nationality). JW202 form from university required. Medical exam CNY 500-1,000. Residence permit CNY 400/year. Document authentication CNY 500-3,000.',
  'Legal assistance optional. Agency fees CNY 2,000-10,000 helpful for university application, JW202 processing, and visa procedures. Many students apply independently.'
FROM immigration_cost_pathways WHERE pathway_slug = 'x-visa-study' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'china')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- INDIA - EMPLOYMENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'INR', 8000, 8000, 1000, 3000, 1000, 5000, 10000, 50000, 8000, 8000, 0, 0, 0, 0,
  'Employment visa requires job offer from Indian company and minimum salary $25,000/year. Employer must be registered. Initial visa 1 year (can be up to 5 years for certain roles). Must register with FRRO within 14 days. Can sponsor family on dependent visa. Extension possible. OCI card option for people of Indian origin.',
  'Ministry of Home Affairs India 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.mha.gov.in/',
  'Employment visa INR 8,000 (varies by nationality, duration). Minimum salary $25,000/year required. FRRO registration mandatory. Medical exam INR 1,000-3,000. Document attestation INR 1,000-5,000.',
  'Legal fees INR 10,000-50,000 for employment visa. Employer typically covers. Immigration consultant for FRRO registration and Ministry procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'employment-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'india')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- INDIA - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'INR', 8000, 8000, 1000, 3000, 1000, 5000, 5000, 20000, 8000, 8000, 200000, 350000, 470000, 590000,
  'Student visa for studies at recognized Indian educational institutions. Requires admission letter and proof of financial means. Must register with FRRO within 14 days. Valid for duration of studies or 5 years (whichever is less). Part-time work typically not allowed. Can extend. Affordable education option.',
  'Ministry of Home Affairs India 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.mha.gov.in/',
  'Student visa INR 8,000 (varies by nationality, duration). FRRO registration mandatory within 14 days. Proof of financial means required. Medical exam INR 1,000-3,000. Document attestation INR 1,000-5,000.',
  'Legal assistance optional. Immigration consultant INR 5,000-20,000 helpful for FRRO registration and document preparation. Many students apply independently.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'india')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- RUSSIA - WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'RUB', 5000, 5000, 3000, 8000, 2000, 10000, 20000, 100000, 5000, 5000, 0, 0, 0, 0,
  'Work permit requires employer sponsorship and quota allocation (unless highly qualified specialist). Employer must obtain invitation and work permit from Ministry of Internal Affairs. Medical exam and police certificate mandatory. Initial permit 1 year, renewable. Temporary residence permit required. Complex registration system.',
  'Ministry of Internal Affairs Russia 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://мвд.рф/',
  'Work visa RUB 5,000. Work permit varies (RUB 3,500-10,000). Temporary residence permit RUB 1,600. Medical exam/police certificate RUB 3,000-8,000. Mandatory registration. Document apostille RUB 2,000-10,000.',
  'Legal fees RUB 20,000-100,000 for work permit. Employer typically covers. Agency essential for quota system, Ministry procedures, and registration requirements.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'russia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- RUSSIA - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'RUB', 5000, 5000, 3000, 8000, 2000, 10000, 10000, 50000, 5000, 5000, 150000, 270000, 360000, 450000,
  'Student visa for studies at Russian universities. Requires admission invitation from accredited institution. Medical exam and police certificate required. Must register within 7 days of arrival. Valid for duration of studies (1 year initially, renewable). Part-time work allowed with permit. Affordable education, especially in state universities.',
  'Ministry of Internal Affairs Russia 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://мвд.рф/',
  'Student visa RUB 5,000. Medical exam/insurance RUB 3,000-8,000. Mandatory registration within 7 days. Document apostille RUB 2,000-10,000. Processing 1-2 months.',
  'Legal assistance optional. Agency fees RUB 10,000-50,000 helpful for invitation processing, registration, and document preparation. Many students apply independently.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'russia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);