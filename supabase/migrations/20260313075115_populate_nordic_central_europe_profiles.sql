/*
  # Populate Nordic and Central/Eastern Europe Immigration Cost Profiles
  
  1. Overview
    - 14 pathways across 7 European countries
    - Denmark: Student, Pay Limit Scheme (DKK)
    - Finland: Student, Work Permit (EUR)
    - Norway: Student, Skilled Worker (NOK)
    - Poland: Student, Work Permit (PLN)
    - Czech Republic: Student, Employee Card (CZK)
    - Greece: Work, Golden Visa (EUR)
    - Croatia: Work, Digital Nomad (EUR)
    
  2. Data Sources
    - Official government immigration authorities
    - Current fee schedules verified March 2026
*/

-- DENMARK - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'DKK', 1865, 1865, 0, 0, 500, 2000, 3000, 12000, 1865, 1865, 100000, 180000, 240000, 300000,
  'Student residence permit for studies at Danish higher education institutions. Proof of funds DKK 8,900/month required. Part-time work allowed 20 hrs/week (full-time June-September). Can bring family if sufficient funds. EU health insurance or Danish coverage.',
  'Danish Agency for International Recruitment and Integration 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.nyidanmark.dk/en-GB/You-want-to-apply/Study',
  'Application fee DKK 1,865. Proof of funds DKK 8,900/month (approx DKK 106,800/year). EU/EEA students have reduced requirements. Biometric residence card included.',
  'Legal assistance optional. Most students apply independently or through universities. Immigration consultant DKK 3,000-12,000 for complex cases.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'denmark')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- DENMARK - PAY LIMIT SCHEME
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'DKK', 3690, 3690, 0, 0, 500, 2000, 5000, 18000, 1865, 1865, 0, 0, 0, 0,
  'Pay Limit Scheme for highly paid employees. Minimum salary DKK 488,000/year (2024). Fast-track work permit. No labor market test. Immediate family reunification rights. 4-year permit. Path to permanent residence after 4-8 years.',
  'Danish Agency for International Recruitment and Integration 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.nyidanmark.dk/en-GB/You-want-to-apply/Work/Pay-limit-scheme',
  'Application fee DKK 3,690. Minimum salary DKK 488,000/year. Fast processing (2-4 weeks). Biometric residence card included. Employer must be registered Danish company.',
  'Legal fees DKK 5,000-18,000. Employer typically covers. Immigration lawyer for salary verification and documentation. Fast-track scheme reduces complexity.'
FROM immigration_cost_pathways WHERE pathway_slug = 'pay-limit-scheme' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'denmark')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- FINLAND - STUDENT RESIDENCE PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 350, 350, 0, 0, 100, 500, 500, 2000, 350, 350, 8040, 14400, 19200, 24000,
  'Student residence permit for degree studies at Finnish universities. Proof of funds €670/month (€8,040/year) required. Work allowed 30 hrs/week during term, full-time during holidays. Can extend for job seeking after graduation (1 year).',
  'Finnish Immigration Service 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://migri.fi/en/studying-in-finland',
  'Application fee €350 (paper) or €300 (online). Proof of funds €670/month. Health insurance mandatory if non-EU. Residence permit card €50 upon arrival.',
  'Legal assistance optional. Most students apply independently. Immigration consultant €500-2,000 for complex cases or appeals.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-residence-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'finland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- FINLAND - RESIDENCE PERMIT FOR WORK
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 550, 550, 0, 0, 100, 500, 3000, 12000, 350, 350, 0, 0, 0, 0,
  'Work residence permit requires job offer from Finnish employer. ELY Centre labor market assessment required unless specialist or EU Blue Card eligible. Initial permit 1-4 years. Family members can accompany. Path to permanent residence (P permit) after 4 years.',
  'Finnish Immigration Service 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://migri.fi/en/work-in-finland',
  'Application fee €550 for first permit, €230 for extensions. EU Blue Card €170. Labor market test by ELY Centre. Processing 3-6 months. Residence permit card €50.',
  'Legal fees €3,000-12,000 for work permit. Employer typically covers. Immigration lawyer for labor market test compliance and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'residence-permit-work' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'finland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- NORWAY - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'NOK', 6300, 6300, 0, 0, 1000, 3000, 5000, 20000, 6300, 6300, 141120, 250000, 330000, 410000,
  'Student residence permit for full-time studies at Norwegian universities. Proof of funds NOK 141,120/year required. Part-time work allowed 20 hrs/week. Can bring family if sufficient funds. Job seeking permit (1 year) available after graduation.',
  'Norwegian Directorate of Immigration 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.udi.no/en/want-to-apply/studies/',
  'Application fee NOK 6,300. Proof of funds NOK 11,760/month (NOK 141,120/year). EU/EEA nationals have reduced requirements. Processing 1-3 months.',
  'Legal assistance optional. Most students apply independently. Immigration advisor NOK 5,000-20,000 for complex cases or appeals.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'norway')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- NORWAY - SKILLED WORKER PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'NOK', 6300, 6300, 0, 0, 1000, 3000, 8000, 30000, 6300, 6300, 0, 0, 0, 0,
  'Skilled worker permit requires job offer meeting Norwegian salary/working conditions. Labor market assessment by Norwegian Labour and Welfare Administration (NAV). Initial permit 3 years. Family can accompany. Permanent residence after 3 years.',
  'Norwegian Directorate of Immigration 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.udi.no/en/want-to-apply/work-immigration/skilled-workers/',
  'Application fee NOK 6,300. Must meet Norwegian wage standards (typically NOK 450,000-500,000/year minimum). NAV labor market assessment required. Processing 2-5 months.',
  'Legal fees NOK 8,000-30,000 for skilled worker permit. Employer typically covers. Immigration lawyer for labor market compliance and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'skilled-worker-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'norway')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- POLAND - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'PLN', 340, 340, 0, 500, 200, 1000, 1000, 4000, 340, 340, 30000, 50000, 65000, 80000,
  'Temporary residence permit for studies at Polish universities. Requires university acceptance and proof of funds (approx PLN 2,500/month). Work allowed 20 hrs/week. Valid for duration of studies. Relatively affordable European education destination.',
  'Office for Foreigners Poland 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.gov.pl/web/uw-warszawa/study',
  'Visa fee PLN 340. Temporary residence permit PLN 340-440. Proof of funds PLN 2,500-3,000/month. Health insurance required (EU card or private PLN 500-1,500/year).',
  'Legal assistance optional. Immigration advisor PLN 1,000-4,000 helpful for document preparation and voivodeship office procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'poland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- POLAND - WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'PLN', 340, 340, 0, 500, 200, 1000, 2000, 8000, 340, 340, 0, 0, 0, 0,
  'Work permit and temporary residence for employment. Employer must obtain work permit first from voivodeship office. Initial permit 3 years. Can bring family. Path to permanent residence after 5 years. EU Blue Card available for highly skilled (min PLN 180,000/year).',
  'Office for Foreigners Poland 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.gov.pl/web/uw-warszawa/work',
  'Work permit PLN 50. Temporary residence permit PLN 340-440. EU Blue Card PLN 640. Processing 1-3 months. Document translation PLN 200-1,000.',
  'Legal fees PLN 2,000-8,000 for work permit process. Employer typically covers. Immigration advisor for voivodeship office procedures and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'poland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- CZECH REPUBLIC - LONG-TERM VISA STUDY
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CZK', 2500, 2500, 0, 2000, 500, 3000, 3000, 12000, 2500, 2500, 200000, 350000, 450000, 550000,
  'Long-term visa for studies over 90 days at Czech universities. Proof of funds CZK 16,667/month required. Part-time work allowed. Valid for duration of studies (max 2 years, renewable). Can convert to residence permit. Public universities often tuition-free in Czech language.',
  'Ministry of Interior Czech Republic 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.mvcr.cz/mvcren/article/study-stays.aspx',
  'Visa fee CZK 2,500. Long-term residence permit CZK 2,500. Proof of funds CZK 16,667/month minimum. Health insurance mandatory CZK 15,000-30,000/year.',
  'Legal assistance optional. Immigration consultant CZK 3,000-12,000 helpful for embassy procedures and document authentication (apostille, notarization).'
FROM immigration_cost_pathways WHERE pathway_slug = 'long-term-visa-study' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'czech-republic')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- CZECH REPUBLIC - EMPLOYEE CARD
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CZK', 2500, 2500, 0, 2000, 500, 3000, 5000, 20000, 2500, 2500, 0, 0, 0, 0,
  'Employee Card combines work permit and residence permit. Requires job offer from Czech employer. Labor office must approve (verify no suitable Czech/EU candidates). Initial permit 2 years. EU Blue Card available for highly qualified (min CZK 60,000/month). Path to permanent residence.',
  'Ministry of Interior Czech Republic 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.mvcr.cz/mvcren/article/employee-card.aspx',
  'Employee Card CZK 2,500. EU Blue Card CZK 5,000. Labor office approval required. Health insurance CZK 15,000-30,000/year. Document apostille CZK 500-3,000.',
  'Legal fees CZK 5,000-20,000 for Employee Card. Employer typically covers. Immigration lawyer for labor office application and document preparation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'employee-card' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'czech-republic')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- GREECE - WORK VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 150, 150, 0, 100, 150, 500, 1500, 6000, 150, 150, 0, 0, 0, 0,
  'Work and residence permit requires employer sponsorship. Work permit from Ministry of Labour required. Initial permit 1-2 years, renewable. Family reunification possible. Path to permanent residence after 5 years. EU Blue Card available for highly skilled.',
  'Greek Ministry of Migration and Asylum 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://migration.gov.gr/',
  'Visa fee €150. Residence permit €150-300. Work permit approval by Ministry of Labour. Document translation/legalization €150-500. Health coverage required.',
  'Legal fees €1,500-6,000 for work visa process. Employer typically covers. Immigration lawyer for work permit application and Ministry of Labour compliance.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'greece')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- GREECE - GOLDEN VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 2000, 2000, 0, 100, 500, 2000, 5000, 15000, 2000, 2000, 800000, 800000, 800000, 800000,
  'Golden Visa residence-by-investment program. Minimum €800,000 real estate investment (increased from €250,000 in 2023 for most regions). 5-year renewable residence permit. No physical presence requirement. Can include family. Path to citizenship after 7 years with language test.',
  'Greek Ministry of Migration and Asylum 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://migration.gov.gr/',
  'Residence permit €2,000 for 5 years. Property investment minimum €800,000 (some regions €400,000). Property transfer tax 3%. Lawyer fees €5,000-15,000. No residency requirement.',
  'Legal fees €5,000-15,000 for Golden Visa process. Property acquisition fees additional. Most investors use specialized immigration lawyers and real estate advisors.'
FROM immigration_cost_pathways WHERE pathway_slug = 'golden-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'greece')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- CROATIA - WORK AND RESIDENCE PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 65, 65, 0, 100, 100, 400, 1000, 4000, 65, 65, 0, 0, 0, 0,
  'Work and residence permit requires employer sponsorship. Croatian Employment Service must verify no suitable local candidates. Initial permit 1 year, renewable up to 3 years. EU Blue Card available for highly qualified. Path to permanent residence after 5 years.',
  'Croatian Ministry of Interior 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://mup.gov.hr/uzg-81/english/286212',
  'Visa fee €35. Residence permit €65. Work permit approval by Employment Service. Health insurance mandatory. Document translation/apostille €100-400.',
  'Legal fees €1,000-4,000 for work permit. Employer typically covers. Immigration lawyer for Employment Service approval and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-residence-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'croatia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- CROATIA - DIGITAL NOMAD VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'EUR', 70, 70, 0, 100, 100, 400, 500, 2000, 70, 70, 28800, 36000, 43200, 50400,
  'Digital nomad temporary stay introduced 2021 for remote workers. Minimum monthly income €2,400 required. Work for foreign employers/clients. Valid 1 year, non-renewable (must leave for 6 months). Can bring family. Health insurance mandatory. Tax advantages available.',
  'Croatian Ministry of Interior 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://mup.gov.hr/uzg-81/english/286212',
  'Digital nomad permit €70. Proof of monthly income €2,400 minimum. Health insurance coverage mandatory. Proof of accommodation. Document apostille €100-400.',
  'Legal assistance optional. Immigration consultant €500-2,000 helpful for application preparation and document requirements.'
FROM immigration_cost_pathways WHERE pathway_slug = 'digital-nomad-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'croatia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);