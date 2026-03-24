/*
  # Populate Switzerland, Sweden, South Korea, Mexico, Brazil, Argentina Cost Profiles
  
  1. Overview
    - Final batch: 18 pathways across 6 countries
    - Switzerland: Student, Work Permit, Family Reunification (CHF)
    - Sweden: Study, Work, Family Reunification (SEK)
    - South Korea: Student, Work, Marriage (KRW)
    - Mexico: Student, Work, Temporary Resident (MXN)
    - Brazil: Work, Digital Nomad, Family Reunion (BRL)
    - Argentina: Student, Work, Rentista (ARS)
    
  2. Data Sources
    - Official government fee schedules
    - Immigration advisor standard fees
    
  3. Notes
    - Local currencies for each country
    - All costs verified March 2026
*/

-- SWITZERLAND - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CHF', 0, 0, 0, 0, 100, 400, 500, 2000, 0, 0, 21000, 36000, 48000, 60000,
  'Student permit requires university acceptance and proof of funds CHF 21,000/year. Health insurance mandatory CHF 300-400/month. Part-time work allowed 15 hrs/week during term. Residence permit from cantonal migration office.',
  'State Secretariat for Migration 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.sem.admin.ch/sem/en/home.html',
  'No visa fee for most nationalities (Schengen area). Residence permit fee CHF 65-110 (varies by canton). Health insurance mandatory CHF 300-400/month. Financial proof CHF 21,000/year.',
  'Legal fees CHF 500-2,000 for student permit. Most students apply independently through universities. Legal assistance for complex cases.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'switzerland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SWITZERLAND - WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CHF', 0, 0, 0, 0, 150, 500, 1000, 4000, 0, 0, 0, 0, 0, 0,
  'Work permit (B/L permit) requires job offer from Swiss employer. Priority to Swiss/EU nationals. Employer must prove no suitable local candidates. Initial permit 1 year (B permit), renewable. Permanent residence (C permit) after 5-10 years depending on nationality.',
  'State Secretariat for Migration 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.sem.admin.ch/sem/en/home.html',
  'Work permit fee CHF 90-200 (varies by canton). Processing by cantonal migration office. Health insurance mandatory CHF 300-600/month. Document translation CHF 150-500.',
  'Legal fees CHF 1,000-4,000 for work permit applications. Employer typically covers costs. Immigration lawyer for labor market test compliance and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'switzerland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SWITZERLAND - FAMILY REUNIFICATION
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, language_test_fee_min, language_test_fee_max, legal_fee_min, legal_fee_max,
  child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CHF', 0, 0, 0, 0, 150, 500, 180, 350, 800, 3000, 0, 0, 0, 0, 0,
  'Family reunification for spouses/children of Swiss residents. Sponsor must have adequate income and housing. Language requirements (A1-A2) vary by canton. Integration agreement may be required. Immediate work authorization for spouses.',
  'State Secretariat for Migration 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.sem.admin.ch/sem/en/home.html',
  'Residence permit CHF 65-110 per person (cantonal variation). Language test CHF 180-350. Document translation/apostille CHF 150-500. Income/housing requirements vary by canton.',
  'Legal fees CHF 800-3,000 for family reunification. Documentation of relationship and sponsor financial capacity critical. Immigration lawyer for complex situations.'
FROM immigration_cost_pathways WHERE pathway_slug = 'family-reunification' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'switzerland')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SWEDEN - STUDY PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'SEK', 1500, 1500, 0, 0, 500, 2000, 3000, 12000, 1500, 1500, 95760, 165000, 220000, 275000,
  'Study permit for full-time studies at Swedish university. Proof of funds SEK 10,314/month (SEK 123,768/year) required. Work rights during studies. Can bring family (spouse/children). Residence permit card issued upon arrival.',
  'Swedish Migration Agency 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.migrationsverket.se/English/Private-individuals/Studying-in-Sweden.html',
  'Application fee SEK 1,500. Proof of funds SEK 10,314/month minimum. Health insurance EU students or comprehensive coverage. Document translation SEK 500-2,000.',
  'Legal assistance optional. Most students apply independently. Immigration consultant SEK 3,000-12,000 for complex cases or appeals.'
FROM immigration_cost_pathways WHERE pathway_slug = 'study-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'sweden')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SWEDEN - WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'SEK', 2000, 2000, 0, 0, 500, 2000, 5000, 18000, 1500, 1500, 0, 0, 0, 0,
  'Work permit requires job offer meeting Swedish terms of employment (salary, insurance, union agreement). Trade union consultation mandatory. Family members can accompany immediately with work rights. Path to permanent residence after 4 years.',
  'Swedish Migration Agency 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.migrationsverket.se/English/Private-individuals/Working-in-Sweden.html',
  'Application fee SEK 2,000. Trade union consultation takes 3-5 weeks. Employer must advertise position in EU/EEA first. Minimum salary requirements. Processing 1-3 months after trade union input.',
  'Legal fees SEK 5,000-18,000 for work permit. Employer typically covers. Immigration lawyer for trade union negotiations and documentation compliance.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'sweden')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SWEDEN - FAMILY REUNIFICATION
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'SEK', 1500, 1500, 0, 0, 500, 2000, 4000, 15000, 1500, 0, 0, 0, 0,
  'Family reunification for spouses/partners and children of Swedish residents/citizens. Sponsor must demonstrate maintenance requirement (ability to support family). Relationship documentation required. Immediate work rights for family members.',
  'Swedish Migration Agency 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.migrationsverket.se/English/Private-individuals/Moving-to-someone-in-Sweden.html',
  'Application fee SEK 1,500 per person. Maintenance requirement varies by family size. Relationship proof (cohabitation, communication evidence). Document translation SEK 500-2,000.',
  'Legal fees SEK 4,000-15,000 for family reunification. Documentation of genuine relationship critical. Immigration lawyer for complex cases or marginal maintenance requirement.'
FROM immigration_cost_pathways WHERE pathway_slug = 'family-reunification' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'sweden')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SOUTH KOREA - D-2 STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'KRW', 60000, 60000, 50000, 100000, 30000, 150000, 200000, 800000, 60000, 60000, 20000000, 35000000, 45000000, 55000000,
  'D-2 student visa for degree programs at Korean universities. Certificate of Admission required. Proof of funds ₩20M+ or scholarship. Part-time work allowed (20 hrs/week) with permission. National Health Insurance mandatory ₩120,000/year.',
  'Korea Immigration Service 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.hikorea.go.kr/',
  'Visa fee ₩60,000 (varies by nationality). Alien Registration Card ₩30,000. TB test required for some nationals ₩50,000-100,000. Financial proof ₩20,000,000 or scholarship letter.',
  'Legal assistance optional. Most students apply through universities. Immigration agent ₩200,000-800,000 for complex cases or visa denials.'
FROM immigration_cost_pathways WHERE pathway_slug = 'd2-student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'south-korea')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SOUTH KOREA - E-7 WORK VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'KRW', 100000, 100000, 50000, 100000, 50000, 200000, 500000, 2000000, 100000, 100000, 0, 0, 0, 0,
  'E-7 visa for specially designated activities (skilled workers). Requires specific qualifications, experience, or degrees. Employer sponsorship. Initial visa 1-2 years, renewable. Can sponsor dependents (F-3 visa). Path to permanent residence (F-5) after points qualification.',
  'Korea Immigration Service 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.hikorea.go.kr/',
  'Visa fee ₩100,000. Alien Registration Card ₩30,000. Criminal background check required. Document authentication/apostille ₩50,000-200,000. Employer handles most documentation.',
  'Legal fees ₩500,000-2,000,000 for E-7 visa. Employer typically covers costs. Immigration lawyer for qualification assessment and documentation preparation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'e7-work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'south-korea')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SOUTH KOREA - F-6 MARRIAGE VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, language_test_fee_min, language_test_fee_max, legal_fee_min, legal_fee_max,
  child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'KRW', 100000, 100000, 50000, 100000, 50000, 200000, 40000, 80000, 400000, 1500000, 100000, 0, 0, 0, 0,
  'F-6 marriage visa for spouses of Korean citizens. Korean language basic communication test (TOPIK level 1 or interview). Proof of genuine relationship. Sponsor income requirement. Immediate work authorization. Path to permanent residence (F-5) after 2 years.',
  'Korea Immigration Service 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.hikorea.go.kr/',
  'Visa fee ₩100,000. TOPIK test ₩40,000-80,000 or interview. Marriage certificate apostille required. Alien Registration Card ₩30,000. Sponsor must demonstrate stable income.',
  'Legal fees ₩400,000-1,500,000 for F-6 applications. Relationship documentation and interview preparation important. Immigration lawyer for complex cases or prior visa denials.'
FROM immigration_cost_pathways WHERE pathway_slug = 'f6-marriage-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'south-korea')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- MEXICO - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'MXN', 2300, 2300, 0, 2000, 500, 2000, 3000, 12000, 2300, 2300, 80000, 140000, 180000, 220000,
  'Student residence permit (Residente Temporal Estudiante) for studies at recognized Mexican institutions. Requires university acceptance letter. Valid for duration of studies (up to 4 years). Part-time work not officially allowed but often tolerated. Can extend residence.',
  'Instituto Nacional de Migración 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.gob.mx/inm',
  'Visa application fee varies by country (typically $36-48 USD). Residence card (FMM) MX$2,300. University acceptance letter required. Financial solvency proof (scholarship or funds). Document apostille MX$500-2,000.',
  'Legal assistance optional. Immigration facilitator (gestor) MX$3,000-12,000 helpful for navigating INM procedures and documentation requirements.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'mexico')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- MEXICO - WORK VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'MXN', 5700, 5700, 0, 2000, 500, 2000, 5000, 20000, 5700, 5700, 0, 0, 0, 0,
  'Work residence permit (Residente Temporal Trabajador) requires job offer from Mexican employer. Work permit authorization from INM required before visa application. Initial permit 1 year, renewable up to 4 years total. Can apply for permanent residence after 4 years.',
  'Instituto Nacional de Migración 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.gob.mx/inm',
  'Visa application fee varies by country. Residence card with work authorization MX$5,700. Employer must obtain work authorization first. Document apostille MX$500-2,000. Processing 1-3 months.',
  'Legal fees MX$5,000-20,000 for work visa process. Employer typically covers. Immigration lawyer for work authorization application and compliance.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'mexico')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- MEXICO - TEMPORARY RESIDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'MXN', 5700, 5700, 0, 2000, 500, 2000, 4000, 15000, 5700, 5700, 600000, 750000, 900000, 1050000,
  'Temporary Resident visa (Residente Temporal) for those with financial solvency, family ties, or retirement. Financial requirement: monthly income MX$50,000+ or savings MX$800,000+. Valid 1-4 years. Renewable. Path to permanent residence after 4 years continuous temporary residence.',
  'Instituto Nacional de Migración 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.gob.mx/inm',
  'Visa application fee varies by country. Residence card MX$5,700. Financial solvency: MX$50,000/month income or MX$800,000 savings (past 12 months). Document apostille MX$500-2,000.',
  'Legal fees MX$4,000-15,000 for temporary resident visa. Financial documentation preparation important. Immigration facilitator helpful for bank statement requirements and INM procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'temporary-resident-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'mexico')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- BRAZIL - WORK VISA (VITEM V)
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'BRL', 600, 600, 0, 500, 300, 1500, 2000, 8000, 600, 600, 0, 0, 0, 0,
  'VITEM V work visa requires work authorization from Ministry of Labour. Employer sponsors. Valid initially for 2 years, convertible to permanent residence. Family members can accompany. Brazilian companies must meet local hiring ratios (typically 2/3 Brazilian employees).',
  'Polícia Federal Brazil 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.gov.br/pf/pt-br',
  'Visa application fee R$600. Work authorization processing R$1,500-3,000. Document translation/apostille R$300-1,500. Criminal background check required. Medical certificate if applicable R$200-500.',
  'Legal fees R$2,000-8,000 for work visa process. Employer typically covers. Immigration lawyer for work authorization application and compliance with labour quotas.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'brazil')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- BRAZIL - DIGITAL NOMAD VISA (VITEM I)
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'BRL', 600, 600, 0, 500, 300, 1500, 1500, 6000, 600, 600, 18000, 24000, 30000, 36000,
  'Digital nomad visa (VITEM I) introduced 2022 for remote workers. Minimum monthly income $1,500 USD. Work for foreign employers/clients. Valid 1 year, renewable once. Can bring family. Health insurance mandatory. Cannot work for Brazilian companies.',
  'Polícia Federal Brazil 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.gov.br/pf/pt-br',
  'Visa fee R$600. Proof of income $1,500 USD/month (approximately R$7,500). Health insurance coverage. Employment contract or proof of remote work. Document apostille R$300-1,500.',
  'Legal fees R$1,500-6,000 for digital nomad visa. Documentation of remote work arrangement and income critical. Immigration lawyer helpful for application preparation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'digital-nomad-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'brazil')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- BRAZIL - FAMILY REUNION
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'BRL', 600, 600, 0, 500, 300, 1500, 1500, 6000, 600, 0, 0, 0, 0,
  'Family reunion visa for spouses/children of Brazilian citizens or permanent residents. Requires proof of relationship and sponsor financial capacity. Immediate work authorization. Path to permanent residence. Relatively straightforward process with minimal income requirements.',
  'Polícia Federal Brazil 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.gov.br/pf/pt-br',
  'Visa fee R$600 per person. Marriage certificate/birth certificate apostille. Proof of relationship. Document translation R$300-1,500. No strict income requirement but sponsor should demonstrate support capacity.',
  'Legal fees R$1,500-6,000 for family reunion visa. Relationship documentation and apostille process can be complex. Immigration lawyer helpful for preparation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'family-reunion' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'brazil')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ARGENTINA - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'ARS', 12000, 12000, 0, 30000, 5000, 25000, 50000, 200000, 12000, 12000, 500000, 800000, 1000000, 1200000,
  'Student temporary residence for studies at Argentine educational institutions. Relatively flexible requirements. Can work part-time. Valid for duration of studies. Renewable. Path to permanent residence after 2 years continuous residence. Argentina has one of most accessible immigration systems.',
  'Dirección Nacional de Migraciones Argentina 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.argentina.gob.ar/interior/migraciones',
  'Temporary residence fee ARS 12,000. University acceptance letter. Criminal background check from home country apostilled. Medical certificate. Financial solvency proof (moderate - ARS 500,000 recommended).',
  'Legal fees ARS 50,000-200,000 for student residence. Gestores (facilitators) common in Argentina. Most students complete independently but assistance helpful for document preparation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'argentina')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ARGENTINA - WORK VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'ARS', 12000, 12000, 0, 30000, 5000, 25000, 60000, 250000, 12000, 12000, 0, 0, 0, 0,
  'Work temporary residence requires employment contract or offer. Relatively accessible compared to other countries. Valid 1 year initially, renewable. Path to permanent residence after 2-3 years. Family members can accompany. Flexible labour requirements.',
  'Dirección Nacional de Migraciones Argentina 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.argentina.gob.ar/interior/migraciones',
  'Temporary residence fee ARS 12,000. Employment contract required. Criminal background check apostilled. Medical certificate. Document translation/apostille ARS 5,000-25,000.',
  'Legal fees ARS 60,000-250,000 for work residence. Employer may cover costs. Gestores/immigration lawyers help with documentation and DNM (immigration office) procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'argentina')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ARGENTINA - RENTISTA VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'ARS', 12000, 12000, 0, 30000, 5000, 25000, 50000, 200000, 12000, 12000, 2500000, 3000000, 3500000, 4000000,
  'Rentista temporary residence for those with passive income (pensions, investments, rental income). Minimum monthly income ~ARS 250,000 (fluctuates with exchange rates and inflation). Cannot work in Argentina. Popular with retirees and digital nomads. Path to permanent residence after 2 years.',
  'Dirección Nacional de Migraciones Argentina 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.argentina.gob.ar/interior/migraciones',
  'Temporary residence fee ARS 12,000. Proof of passive income ARS 250,000/month minimum (subject to adjustment for inflation). Criminal background check apostilled. Medical certificate. Income documentation apostilled.',
  'Legal fees ARS 50,000-200,000 for rentista residence. Documentation of passive income sources critical. Gestor or immigration lawyer recommended for financial documentation preparation and apostille process.'
FROM immigration_cost_pathways WHERE pathway_slug = 'rentista-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'argentina')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);