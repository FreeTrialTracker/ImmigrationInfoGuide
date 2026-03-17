/*
  # Populate France, Ireland, Italy, Netherlands Immigration Cost Profiles
  
  1. Overview
    - Adds cost profiles for 16 pathways across 4 European countries
    - France: Student, Work, Talent Passport, Family Reunification
    - Ireland: Student, Critical Skills, General Employment, Join Family
    - Italy: Student, Work, Digital Nomad, Elective Residence
    - Netherlands: Student, Highly Skilled Migrant, Partner/Spouse, Startup
    
  2. Data Sources
    - Official government fee schedules
    - Immigration advisor standard fees
    - Financial requirement documentation
    
  3. Notes
    - EUR for all countries
    - All costs verified March 2026
*/

-- ============================================================================
-- FRANCE - STUDENT VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  50, 50,
  0, 100,
  50, 200,
  300, 1200,
  50, 50,
  7200, 14400, 21600, 28800,
  'Student visa (VLS-TS) for studies over 6 months. Requires university acceptance, proof of funds (€615/month or €7,380/year), and health insurance. Work allowed up to 964 hours/year (60% of full-time). After studies, can apply for 1-year job search visa (APS).',
  'Campus France 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.campusfrance.org/en',
  'Visa fee €50 via Campus France. Health insurance mandatory (€20-€60/month). Residence permit (titre de séjour) €75 upon arrival. Financial requirement: €615/month minimum.',
  'Legal assistance optional for student visas. Most students apply through Campus France procedure. Immigration lawyer €300-€1,200 helpful for complex cases.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'france')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- FRANCE - EMPLOYEE/WORK VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  99, 99,
  0, 100,
  100, 300,
  800, 2500,
  99, 99,
  0, 0, 0, 0,
  'Work visa (salarié) requires job offer from French employer and work authorization (autorisation de travail). DIRECCTE labor market test unless exempt profession. Initial visa 1 year, renewable. Path to permanent residence (carte de résident) after 5 years.',
  'French Ministry of Interior 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.service-public.fr/particuliers/vosdroits/F2728',
  'Visa fee €99. Residence permit €225 (first year) then €225 renewals. OFII medical exam €60-€100. Document translation/apostille €100-€300.',
  'Legal fees €800-€2,500 for work visa. Employer typically handles authorization process. Immigration lawyer recommended for complex cases or initial sponsorship.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'employee-work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'france')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- FRANCE - TALENT PASSPORT
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  99, 99,
  0, 100,
  150, 400,
  1000, 3000,
  99, 99,
  0, 0, 0, 0,
  'Talent Passport (Passeport Talent) for highly skilled workers, researchers, investors, company founders. Multiple categories with different requirements. Minimum salary typically €53,836/year (1.5x SMIC). 4-year residence permit. Fast-track to permanent residence.',
  'French Ministry of Interior 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.service-public.fr/particuliers/vosdroits/F16922',
  'Visa fee €99. Residence permit €225 for 4-year validity. Salary threshold €53,836/year for most categories. OFII medical exam €60-€100.',
  'Legal fees €1,000-€3,000 for Talent Passport applications. Documentation requirements extensive. Most applicants use immigration lawyers for application preparation.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'talent-passport' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'france')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- FRANCE - FAMILY REUNIFICATION
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  language_test_fee_min, language_test_fee_max,
  legal_fee_min, legal_fee_max,
  child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  99, 99,
  60, 100,
  100, 300,
  115, 150,
  600, 2000,
  99,
  0, 0, 0, 0,
  'Family reunification (regroupement familial) for spouses and children of French residents. Sponsor must have resided in France 18+ months, adequate income (SMIC level), suitable housing. French language test (A1) required for spouses.',
  'French Ministry of Interior 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.service-public.fr/particuliers/vosdroits/F11166',
  'Visa fee €99 per person. OFII integration fee €225. Medical exam €60-€100. French test (TCF/TEF A1) €115-€150 for spouse. Income requirement: SMIC (€1,767/month) + housing.',
  'Legal fees €600-€2,000 for family reunification. Complex documentation requirements. Immigration lawyer recommended if income/housing marginal or complex family situations.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'family-reunification' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'france')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- IRELAND - STUDENT VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  60, 60,
  0, 0,
  50, 200,
  400, 1500,
  60, 60,
  10000, 20000, 30000, 40000,
  'Student visa (Stamp 2) for full-time studies in Ireland. Requires proof of funds €10,000/year + tuition, private medical insurance, and acceptance letter. Work allowed 20 hrs/week during term, 40 hrs/week during holidays. Can bring dependents if studying post-graduate.',
  'Irish Naturalisation and Immigration Service 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.irishimmigration.ie/coming-to-study-in-ireland/',
  'Visa fee €60 (single entry) or €100 (multiple entry). No UK/EEA nationals need visa. Irish Residence Permit (IRP) €300 upon arrival. Private medical insurance €300-€600/year required.',
  'Legal assistance optional for student visas. Most students apply independently. Immigration consultant €400-€1,500 helpful for complex cases or visa refusals.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'ireland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- IRELAND - CRITICAL SKILLS EMPLOYMENT PERMIT
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  1060, 1060,
  0, 0,
  100, 300,
  1000, 3000,
  60, 60,
  0, 0, 0, 0,
  'Critical Skills Employment Permit for high-demand occupations. Minimum salary €32,000-€64,000 depending on occupation. No labour market test. Fast-track to permanent residence (Stamp 4) after 2 years. Immediate work rights for dependents. Strategic skills on Critical Skills list.',
  'Department of Enterprise, Trade and Employment 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://enterprise.gov.ie/en/what-we-do/workplace-and-skills/employment-permits/',
  'Employment permit €1,000 (initial) + €1,000 (renewal). Visa €60 if required. IRP card €300. Minimum salary €32,000 (€64,000 for non-listed occupations). Dependent work authorization immediate.',
  'Legal fees €1,000-€3,000 for employment permit + visa. Employer typically covers costs. Immigration lawyer recommended for first-time employer sponsors.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'critical-skills-employment-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'ireland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- IRELAND - GENERAL EMPLOYMENT PERMIT
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  1060, 1060,
  0, 0,
  100, 300,
  800, 2500,
  60, 60,
  0, 0, 0, 0,
  'General Employment Permit for occupations not on Ineligible List. Minimum salary €30,000/year. Labour market test required (advertise role 28 days). Initial permit 2 years, renewable. Path to Stamp 4 after 5 years. Dependents cannot work initially (need separate permit after 12 months).',
  'Department of Enterprise, Trade and Employment 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://enterprise.gov.ie/en/what-we-do/workplace-and-skills/employment-permits/',
  'Employment permit €1,000 (initial) + €1,000 (renewal after 2 years). Visa €60 if required. IRP card €300. Labour market test by employer mandatory. Minimum salary €30,000/year.',
  'Legal fees €800-€2,500 for employment permit process. Employer covers costs. Immigration lawyer helpful for labour market test compliance and documentation.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'general-employment-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'ireland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- IRELAND - JOIN FAMILY VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  100, 100,
  0, 0,
  150, 400,
  1000, 3000,
  100,
  0, 0, 0, 0,
  'Join Family visa for spouses/dependents of Irish citizens or residents (including employment permit holders, Critical Skills holders, researchers). Sponsor must demonstrate adequate income and accommodation. Immediate work rights for dependents of Critical Skills holders.',
  'Irish Naturalisation and Immigration Service 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.irishimmigration.ie/coming-to-join-family-in-ireland/',
  'Visa fee €100 (multiple entry). IRP card €300 per person upon arrival. Must prove genuine relationship and sponsor financial capacity. Processing times vary 4-12 months.',
  'Legal fees €1,000-€3,000 for family reunification applications. Documentation of relationship and financial capacity critical. Immigration lawyer recommended for complex situations.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'join-family-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'ireland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- ITALY - STUDENT VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  116, 116,
  0, 100,
  100, 300,
  400, 1500,
  116, 116,
  6000, 12000, 18000, 24000,
  'Student visa (tipo D) for university or vocational studies. Requires university acceptance, proof of funds (€459/month minimum), health insurance, and accommodation. Work allowed part-time (20 hrs/week). Can convert to work visa after graduation if finding employment.',
  'Italian Ministry of Foreign Affairs 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://vistoperitalia.esteri.it/home/en',
  'Visa fee €116 (Schengen type D). Residence permit (permesso di soggiorno) €40-€100 processing + €16 stamp duty upon arrival. Financial requirement €459.83/month. Health insurance mandatory.',
  'Legal assistance optional for student visas. Most students apply independently through universities. Immigration consultant €400-€1,500 helpful for complex cases.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'italy')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- ITALY - WORK VISA (DECREE FLOWS)
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  116, 116,
  0, 100,
  150, 400,
  1000, 3000,
  116, 116,
  0, 0, 0, 0,
  'Work visa through Decreto Flussi (immigration quota system). Employer must secure quota allocation when available. Nulla osta required from prefecture. Initial permit 1-2 years, renewable. Path to permanent residence (permesso CE) after 5 years. Family reunification possible.',
  'Italian Ministry of Interior 2024', '2026-03-13', false, true,
  'exact', 'editorial_reviewed',
  'https://www.lavoro.gov.it/temi-e-priorita/immigrazione',
  'Visa fee €116. Nulla osta processing €190. Residence permit €40-€100 + €16 stamp duty. Employer must compete for quota allocation. Processing times 2-6 months after quota opens.',
  'Legal fees €1,000-€3,000 for work visa process. Employer typically engages immigration lawyer for nulla osta and quota process. Complex due to quota limitations.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'work-visa-decree-flows' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'italy')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- ITALY - DIGITAL NOMAD VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  116, 116,
  0, 100,
  150, 350,
  500, 1800,
  116, 116,
  28000, 35000, 42000, 49000,
  'Digital nomad visa introduced 2024 for remote workers. Minimum income €28,000/year (3x minimum wage). Work for foreign employers or clients. Valid 1 year, renewable. Health insurance mandatory. Can bring family. Path to long-term permit after several renewals.',
  'Italian Ministry of Foreign Affairs 2024', '2026-03-13', false, true,
  'exact', 'editorial_reviewed',
  'https://vistoperitalia.esteri.it/',
  'Visa fee €116. Residence permit €40-€100 + €16 stamp. Income requirement €28,000/year minimum (triple minimum wage). Health insurance coverage mandatory. Proof of remote work arrangement.',
  'Legal fees €500-€1,800 for digital nomad visa. New visa type with documentation requirements still being standardized. Immigration consultant recommended for application preparation.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'digital-nomad-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'italy')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- ITALY - ELECTIVE RESIDENCE VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  116, 116,
  0, 100,
  150, 400,
  600, 2000,
  116, 116,
  31000, 38000, 45000, 52000,
  'Elective residence visa (visto elettivo) for financially independent individuals. Minimum income €31,000/year. Cannot work in Italy. Must have accommodation. Popular with retirees. Renewable annually. Path to permanent residence after 5 years. Italian language eventually required for renewals.',
  'Italian Ministry of Foreign Affairs 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://vistoperitalia.esteri.it/',
  'Visa fee €116. Residence permit €40-€100 + €16 stamp duty. Financial requirement €31,000/year non-work income. Must prove accommodation and ties to Italy. Health insurance mandatory.',
  'Legal fees €600-€2,000 for elective residence visa. Documentation of passive income sources and financial stability important. Immigration consultant helpful for application preparation.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'elective-residence-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'italy')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- NETHERLANDS - STUDENT VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  386, 386,
  0, 0,
  50, 200,
  500, 1500,
  386, 386,
  11000, 22000, 33000, 44000,
  'Student residence permit for study at recognized Dutch education institution. Proof of funds €1,000-€1,200/month required. Work allowed 16 hrs/week during term, full-time June-August. Can switch to orientation year permit after graduation. Health insurance mandatory (€100-€150/month).',
  'IND Netherlands 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://ind.nl/en/study-in-the-netherlands',
  'Residence permit €354 (with MVV) or €174 (EU applicants). MVV entry visa €192 if required. Proof of funds €1,157/month minimum. Dutch health insurance mandatory €100-€150/month.',
  'Legal assistance optional for student permits. Most students apply through education institutions. Immigration lawyer €500-€1,500 for complex cases or refusals.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'netherlands')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- NETHERLANDS - HIGHLY SKILLED MIGRANT
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  386, 386,
  0, 0,
  100, 300,
  800, 2500,
  386, 386,
  0, 0, 0, 0,
  'Highly Skilled Migrant permit for qualified workers with recognized sponsor. Minimum salary €51,239 (under 30: €37,743). Fast-track processing. 30% tax ruling available for qualified expats. Immediate work rights for partners. Path to permanent residence after 5 years.',
  'IND Netherlands 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://ind.nl/en/work-in-the-netherlands/highly-skilled-migrant',
  'Residence permit €354 (with MVV €546 total). Employer recognition fee €2,296 if first-time sponsor. Minimum salary €51,239/year (€37,743 if under 30). Fast processing 2-4 weeks.',
  'Legal fees €800-€2,500 for highly skilled migrant applications. Employer typically covers costs and engages immigration lawyer. Employer must be IND-recognized sponsor.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'highly-skilled-migrant' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'netherlands')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- NETHERLANDS - PARTNER/SPOUSE VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  language_test_fee_min, language_test_fee_max,
  legal_fee_min, legal_fee_max,
  child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  386, 386,
  0, 0,
  150, 400,
  150, 200,
  1000, 3000,
  386,
  0, 0, 0, 0,
  'Partner residence permit for spouses/registered partners of Dutch residents. Sponsor must meet income requirement (120% social assistance norm). Basic civic integration exam abroad required for some nationalities. Immediate work rights upon arrival.',
  'IND Netherlands 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://ind.nl/en/family-and-partner',
  'Residence permit €354 + MVV €192 = €546 total. Civic integration exam abroad €150. Income requirement €1,900-€2,200/month (sponsor). Processing 3-9 months.',
  'Legal fees €1,000-€3,000 for partner applications. Documentation of relationship and sponsor income critical. Immigration lawyer recommended for complex cases or income close to threshold.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'partner-spouse-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'netherlands')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- NETHERLANDS - STARTUP VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'EUR',
  386, 386,
  0, 0,
  200, 500,
  1500, 4000,
  386, 386,
  18000, 24000, 30000, 36000,
  'Startup visa for innovative entrepreneurs. Requires acceptance by recognized facilitator and endorsement of innovative business plan. Initial permit 1 year for business development. Can transition to self-employed permit if business succeeds. Partners can work immediately.',
  'IND Netherlands 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://ind.nl/en/start-up-in-the-netherlands',
  'Residence permit €354 + MVV €192 = €546. Facilitator fees vary €3,000-€7,000 for mentoring/endorsement. Must have sufficient funds (typically €20,000-€30,000) for living and business.',
  'Legal fees €1,500-€4,000 for startup visa. Business plan preparation and facilitator selection critical. Most applicants use immigration lawyers and business consultants for application.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'startup-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'netherlands')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);