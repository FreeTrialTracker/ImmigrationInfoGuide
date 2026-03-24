/*
  # Populate Central/Eastern Europe Immigration Cost Profiles
  
  1. Overview
    - 8 pathways across 4 countries
    - Austria: Student, Red-White-Red Card (EUR)
    - Belgium: Student, Work Permit Type B (EUR)
    - Romania: Student, Work Permit (RON)
    - Hungary: Student, Work Permit (HUF)
    
  2. Data Sources
    - Official immigration authorities
    - Current fee schedules verified March 2026
*/

-- AUSTRIA - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 120, 120, 0, 100, 100, 500, 1000, 5000, 120, 120, 12000, 21600, 28800, 36000,
  'Student residence permit for studies at Austrian universities. Proof of funds €1,000/month (€12,000/year) required. Part-time work allowed 20 hrs/week. Valid for duration of studies (1-2 years initially). Can extend. Job seeking visa (6 months) after graduation. Public universities low/no tuition for EU/EEA.',
  'Austrian Federal Ministry of Interior 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.bmi.gv.at/',
  'Residence permit €120. Proof of funds €1,000/month. Health insurance mandatory (EU card or private €50-80/month). Document translation/certification €100-500.',
  'Legal assistance optional. Immigration consultant €1,000-5,000 helpful for complex cases or appeals. Most students apply independently.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'austria')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- AUSTRIA - RED-WHITE-RED CARD
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 160, 160, 0, 100, 100, 500, 3000, 15000, 160, 160, 0, 0, 0, 0,
  'Red-White-Red (RWR) Card for qualified workers. Three categories: Very Highly Qualified (points), Skilled Workers in Shortage Occupations, Other Key Workers. Minimum salary requirements vary (€40,000-50,000+). Initial card 1-2 years. Family can join. Path to permanent residence (Niederlassungsbewilligung) and citizenship.',
  'Austrian Federal Ministry of Interior 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.migration.gv.at/',
  'RWR Card €160. Points-based or shortage occupation. Minimum salary €40,000-50,000+ depending on qualification. Health insurance mandatory. Document translation €100-500.',
  'Legal fees €3,000-15,000 for RWR Card. Employer may cover. Immigration lawyer for points calculation, salary verification, and application process.'
FROM immigration_cost_pathways WHERE pathway_slug = 'red-white-red-card' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'austria')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- BELGIUM - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 215, 215, 0, 100, 100, 500, 1000, 5000, 215, 215, 10800, 19440, 25920, 32400,
  'Student residence permit for studies at Belgian universities. Proof of funds €900/month (€10,800/year) required. Part-time work allowed 20 hrs/week (student job). Valid for 1 year, renewable annually. Job seeking visa (12 months) after graduation. Three language communities: French, Dutch, German.',
  'Belgian Immigration Office 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.ibz.rrn.fgov.be/',
  'Residence permit €215. Proof of funds €900/month. Health insurance mandatory (EU card or private Mutuelle). Document legalization €100-500. Processing 1-3 months.',
  'Legal assistance optional. Immigration consultant €1,000-5,000 helpful for commune registration and document requirements. Most students apply independently.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'belgium')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- BELGIUM - WORK PERMIT TYPE B
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 215, 215, 0, 100, 100, 500, 3000, 15000, 215, 215, 0, 0, 0, 0,
  'Work Permit B for employees with specific employer. Employer must obtain work permit first from regional authority (Flanders, Wallonia, Brussels). Labor market test required unless shortage occupation. Initial permit 1 year, renewable. After 4 years work, can apply for unlimited Permit C. Family reunification available.',
  'Belgian Immigration Office 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.ibz.rrn.fgov.be/',
  'Professional card/residence €215. Work Permit B fee varies by region (€90-215). Labor market test by regional authority. Document legalization €100-500. Processing 2-4 months.',
  'Legal fees €3,000-15,000 for work permit. Employer typically covers. Immigration lawyer for regional work permit application and labor market compliance.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit-type-b' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'belgium')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ROMANIA - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'RON', 240, 240, 0, 500, 200, 1000, 2000, 8000, 240, 240, 40000, 70000, 95000, 120000,
  'Long-stay visa for studies at Romanian universities. Requires university acceptance and proof of financial means (RON 3,000-4,000/month). Part-time work allowed. Valid for duration of studies. Can extend annually. Affordable EU education. Public universities low tuition for EU/EEA, moderate for non-EU.',
  'Romanian Immigration Office 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://igi.mai.gov.ro/',
  'Long-stay visa RON 240. Temporary residence permit RON 500. Proof of funds RON 3,000-4,000/month. Health insurance mandatory. Document apostille RON 200-1,000.',
  'Legal assistance optional. Immigration consultant RON 2,000-8,000 helpful for embassy procedures and General Inspectorate for Immigration (IGI) documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'romania')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ROMANIA - WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'RON', 240, 240, 0, 500, 200, 1000, 3000, 12000, 240, 240, 0, 0, 0, 0,
  'Work permit requires employer sponsorship and General Inspectorate for Immigration approval. Labor market test by county employment agency unless EU Blue Card or intra-company transfer. Initial permit 1 year, renewable. Temporary residence issued. Family reunification available. Path to permanent residence after 5 years.',
  'Romanian Immigration Office 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://igi.mai.gov.ro/',
  'Long-stay work visa RON 240. Temporary residence permit RON 500. Work authorization included. Document apostille RON 200-1,000. Processing 2-4 months.',
  'Legal fees RON 3,000-12,000 for work permit. Employer typically covers. Immigration lawyer for IGI application and employment agency labor market test.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'romania')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- HUNGARY - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'HUF', 60000, 60000, 0, 30000, 5000, 30000, 50000, 200000, 60000, 60000, 2400000, 4200000, 5600000, 7000000,
  'Residence permit for studies at Hungarian universities. Requires university acceptance and proof of financial means (HUF 200,000/month). Part-time work allowed 24 hrs/week. Valid for duration of studies (max 2 years, renewable). Can extend. Job seeking permit (9 months) after graduation. Affordable EU education.',
  'National Directorate-General for Aliens Policing Hungary 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.bmbah.hu/',
  'Residence permit HUF 60,000. Proof of funds HUF 200,000/month minimum. Health insurance mandatory (EU card or private HUF 20,000-40,000/year). Document apostille HUF 5,000-30,000.',
  'Legal assistance optional. Immigration consultant HUF 50,000-200,000 helpful for application and regional directorate procedures. Many students apply independently.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'hungary')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- HUNGARY - WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'HUF', 60000, 60000, 0, 30000, 5000, 30000, 100000, 400000, 60000, 60000, 0, 0, 0, 0,
  'Work permit and residence permit requires employer sponsorship. Employer must obtain employment approval from labour office unless EU Blue Card or ICT permit. Initial permit 1-2 years, renewable. Single permit system combines work authorization and residence. Family reunification available. Path to permanent residence.',
  'National Directorate-General for Aliens Policing Hungary 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.bmbah.hu/',
  'Single permit (work + residence) HUF 60,000. EU Blue Card HUF 90,000. Employment approval by labour office. Document apostille HUF 5,000-30,000. Processing 1-3 months.',
  'Legal fees HUF 100,000-400,000 for work permit. Employer typically covers. Immigration lawyer for labour office approval and regional directorate procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'hungary')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);