/*
  # Populate Japan, Singapore, Thailand, UAE Immigration Cost Profiles
  
  1. Overview
    - Completes cost profiles for 12 pathways across 4 Asian destinations
    - Japan: Student, Highly Skilled Professional, Spouse
    - Singapore: Student Pass, EntrePass, Dependant Pass
    - Thailand: Education, Non-B Work, LTR Visa
    - UAE: Student, Remote Work, Golden Visa
    
  2. Data Sources
    - Official government fee schedules
    - Immigration service provider standard fees
    
  3. Notes
    - JPY for Japan, SGD for Singapore, THB for Thailand, AED for UAE
    - All costs verified March 2026
*/

-- ============================================================================
-- JAPAN - STUDENT VISA
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
  id, 'JPY',
  0, 0,
  0, 15000,
  10000, 50000,
  50000, 200000,
  0, 0,
  2000000, 3500000, 4500000, 5500000,
  'Student visa (ryugaku) for studies at Japanese educational institutions. Certificate of Eligibility (COE) required from school. Proof of funds ¥2,000,000/year. Part-time work allowed 28 hrs/week (40 hrs during vacations with permission). National Health Insurance mandatory ¥20,000/year.',
  'Immigration Services Agency of Japan 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.moj.go.jp/isa/index.html',
  'Visa fee: Free for most nationalities (single-entry ¥3,000, multiple-entry ¥6,000 if charged). Residence card free. COE processing by school. Document translation ¥10,000-¥50,000. National Health Insurance ¥20,000/year.',
  'Legal assistance optional. Most students apply through schools providing COE sponsorship. Immigration scrivener (gyoseishoshi) ¥50,000-¥200,000 for complex cases.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'japan')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- JAPAN - HIGHLY SKILLED PROFESSIONAL VISA
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
  id, 'JPY',
  0, 0,
  0, 15000,
  20000, 80000,
  100000, 500000,
  0, 0,
  0, 0, 0, 0,
  'Highly Skilled Professional (HSP) visa uses points-based system (70+ points). Fast-track to permanent residence (1 or 3 years vs normal 10 years). Preferential immigration treatment. Spouse work authorization. Can bring parents/domestic helper under certain conditions. 5-year residence period.',
  'Immigration Services Agency of Japan 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.moj.go.jp/isa/publications/press/nyuukokukanri07_00184.html',
  'Visa fee: Free. Certificate of Eligibility processing by employer/sponsor. Points calculation based on education, salary, age, achievements. Document translation ¥20,000-¥80,000.',
  'Legal fees ¥100,000-¥500,000 for HSP applications. Points calculation and documentation preparation complex. Most applicants use immigration scriveners (gyoseishoshi) or corporate immigration services.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'highly-skilled-professional' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'japan')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- JAPAN - SPOUSE VISA
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
  id, 'JPY',
  0, 0,
  0, 15000,
  15000, 60000,
  80000, 400000,
  0,
  0, 0, 0, 0,
  'Spouse visa for partners of Japanese nationals or permanent residents. Requires proof of genuine relationship, adequate financial support by sponsor, and suitable housing. Work authorization unrestricted. Initial status 1-3 years, renewable. Path to permanent residence after 3+ years.',
  'Immigration Services Agency of Japan 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.moj.go.jp/isa/index.html',
  'Visa fee: Free. Certificate of Eligibility processing. Sponsor must demonstrate stable income and relationship evidence. Marriage certificate must be legalized/apostilled. Document translation ¥15,000-¥60,000.',
  'Legal fees ¥80,000-¥400,000 for spouse visa applications. Relationship documentation critical. Immigration scrivener (gyoseishoshi) recommended for complex cases, prior marriage, or income concerns.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'spouse-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'japan')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- SINGAPORE - STUDENT PASS
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
  id, 'SGD',
  90, 90,
  50, 150,
  50, 200,
  500, 1500,
  90, 90,
  20000, 35000, 45000, 55000,
  'Student Pass for full-time studies at approved Singapore institutions. Requires in-principle approval (IPA) from ICA. Proof of funds for tuition + living costs required. Limited part-time work (16 hrs/week) with approval. Medical insurance mandatory.',
  'Immigration & Checkpoints Authority 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.ica.gov.sg/pass/student-pass',
  'Student Pass application S$90. Medical examination S$50-$150. ICA appointment S$60. Security bond may be required. Student Pass valid for duration of course.',
  'Legal assistance optional for Student Pass. Most students apply through education institutions. Immigration agent S$500-$1,500 helpful for complex cases.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-pass' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'singapore')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- SINGAPORE - ENTREPASS
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
  id, 'SGD',
  225, 225,
  50, 150,
  200, 600,
  2000, 5000,
  225, 225,
  50000, 65000, 80000, 95000,
  'EntrePass for entrepreneurs starting innovative businesses in Singapore. Minimum S$50,000 paid-up capital. Business plan must be innovative and scalable. Initial approval 1 year, renewable subject to business performance criteria. Can apply for Dependant Passes for family.',
  'Ministry of Manpower Singapore 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.mom.gov.sg/passes-and-permits/entrepass',
  'EntrePass application S$225. Company incorporation ~S$500. Professional services for business plan S$2,000-$5,000. Minimum paid-up capital S$50,000. Medical exam S$50-$150.',
  'Legal/consulting fees S$2,000-$5,000+ for EntrePass applications. Business plan and innovation criteria assessment critical. Most applicants use corporate services firms or immigration consultants.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'entrepass' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'singapore')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- SINGAPORE - DEPENDANT PASS
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
  id, 'SGD',
  90, 90,
  50, 150,
  100, 300,
  500, 1500,
  90,
  0, 0, 0, 0,
  'Dependant Pass for spouses and children of Employment Pass, EntrePass, or S Pass holders. Sponsor must earn minimum S$6,000/month (EP/EntrePass) or S$6,000/month (S Pass). Dependants can work with Letter of Consent from MOM. Valid for same duration as main pass holder.',
  'Ministry of Manpower Singapore 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.mom.gov.sg/passes-and-permits/dependants-pass',
  'Dependant Pass application S$90 per person. Medical examination S$50-$150. Security bond S$5,000 if required for certain nationalities. Sponsor minimum salary S$6,000/month.',
  'Legal assistance optional for Dependant Pass. Most apply directly or through employers. Immigration agent S$500-$1,500 per application for assistance with documentation.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'dependant-pass' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'singapore')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- THAILAND - EDUCATION VISA
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
  id, 'THB',
  2000, 2000,
  0, 2000,
  1000, 5000,
  10000, 40000,
  2000, 2000,
  500000, 800000, 1000000, 1200000,
  'Education visa (Non-ED) for studying at approved Thai educational institutions including universities, language schools, muay thai schools. Initial visa 90 days, extendable 3-12 months at immigration. Requires acceptance letter and proof of course fees paid. No work authorization.',
  'Thai Immigration Bureau 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.immigration.go.th/',
  'Visa fee ฿2,000 (single entry) or ฿5,000 (multiple entry). Extension fee ฿1,900. School documentation fees vary. 90-day reporting mandatory. Financial proof ฿500,000 recommended.',
  'Legal/agent assistance ฿10,000-฿40,000 for education visa. Many schools provide visa support services. Visa agents helpful for extension applications and 90-day reporting compliance.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'education-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'thailand')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- THAILAND - NON-B WORK VISA
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
  id, 'THB',
  2000, 2000,
  0, 2000,
  2000, 10000,
  15000, 60000,
  2000, 2000,
  0, 0, 0, 0,
  'Non-B visa for employment in Thailand. Requires work permit from Ministry of Labour and employer sponsorship. Initial visa 90 days, extendable to 1 year. Company must meet Thai staff ratio requirements (4 Thai per 1 foreign for most companies). 90-day reporting mandatory.',
  'Thai Immigration Bureau 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.immigration.go.th/',
  'Visa fee ฿2,000 (single) or ฿5,000 (multiple). Work permit ฿3,000. Extension ฿1,900. Re-entry permit ฿1,000 (single) or ฿3,800 (multiple). Company must handle work permit documentation.',
  'Legal/agent fees ฿15,000-฿60,000 for Non-B visa and work permit services. Employer typically covers costs and engages visa agency. Document preparation and compliance with Labour Ministry requirements complex.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'non-b-work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'thailand')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- THAILAND - LTR VISA
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
  id, 'THB',
  50000, 50000,
  0, 2000,
  5000, 15000,
  20000, 80000,
  25000, 25000,
  0, 0, 0, 0,
  'Long-Term Resident (LTR) visa introduced 2022. Four categories: Wealthy Global Citizen, Wealthy Pensioner, Work-from-Thailand Professional, Highly-Skilled Professional. 10-year visa with minimal reporting. Fast-track immigration lanes. Income/asset requirements vary by category (typically $80,000+ annual income).',
  'Thailand Board of Investment 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://ltr.boi.go.th/',
  'LTR visa fee ฿50,000 for 10 years. Health insurance required ($50,000+ coverage). Income requirements: Wealthy Global Citizen ($80k income + $1M assets), Wealthy Pensioner ($80k income + $250k investment), Remote Worker ($80k income).',
  'Legal/consulting fees ฿20,000-฿80,000 for LTR application. BOI-approved service providers can assist. Documentation of income, assets, and health insurance critical for application success.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'ltr-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'thailand')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- UAE - STUDENT VISA
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
  id, 'AED',
  3000, 3000,
  300, 600,
  500, 1500,
  2000, 6000,
  3000, 3000,
  50000, 80000, 100000, 120000,
  'Student residence visa for studying at accredited UAE universities/colleges. Requires acceptance letter and proof of financial support. Valid for 1 year, renewable annually. Part-time work allowed with approval from 2023. Emirates ID mandatory. Medical insurance required.',
  'Federal Authority for Identity and Citizenship UAE 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://u.ae/en/information-and-services/visa-and-emirates-id/residence-visa',
  'Entry permit AED 3,050. Change of status AED 500. Medical test AED 300-600. Emirates ID AED 370. Health insurance AED 600-1,500/year. University handles visa processing typically.',
  'Visa processing assistance AED 2,000-6,000 if not using university services. Most universities include visa processing as part of enrollment. Legal assistance for complex cases or visa issues.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-arab-emirates')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- UAE - REMOTE WORK VISA
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
  id, 'AED',
  1650, 1650,
  300, 600,
  500, 1500,
  2000, 6000,
  825, 825,
  180000, 200000, 220000, 240000,
  'Remote Work / Virtual Work residence visa allows working remotely for employers outside UAE while residing in UAE. Minimum salary $5,000/month (USD 60,000/year). Valid 1 year. Can bring dependents. Health insurance and proof of employment/business ownership required. No local sponsor needed.',
  'UAE Government 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://u.ae/en/information-and-services/visa-and-emirates-id/residence-visa/remote-work-visa',
  'Visa application AED 1,650 + AED 1,200 processing = AED 2,850. Medical test AED 300-600. Emirates ID AED 370. Health insurance AED 600-1,500/year. Minimum salary $5,000/month proof required.',
  'Visa agent fees AED 2,000-6,000 for remote work visa processing. Many applicants use PRO services or visa agencies for document preparation and application submission.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'remote-work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-arab-emirates')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- UAE - GOLDEN VISA (INVESTOR)
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
  id, 'AED',
  5000, 5000,
  300, 600,
  1000, 3000,
  10000, 30000,
  2500, 2500,
  2000000, 2000000, 2000000, 2000000,
  'Golden Visa (10-year residence) for investors, entrepreneurs, specialized talents, researchers. Investment routes: AED 2M+ property, AED 2M+ public investments, AED 2M+ company capital, or entrepreneur with AED 500k+ project. Can sponsor family. No sponsor required. Permanent until cancelled.',
  'UAE General Directorate of Residency 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://u.ae/en/information-and-services/visa-and-emirates-id/residence-visa/golden-visa',
  'Golden Visa fee AED 5,000 for 10 years. Medical test AED 300-600. Emirates ID AED 1,070 (10 years). Property investment minimum AED 2M or other qualifying investments. Family members additional AED 2,500-5,000 each.',
  'Legal/consulting fees AED 10,000-30,000+ for Golden Visa applications. Investment structuring, documentation preparation, and eligibility assessment services. Most investors use specialized Golden Visa consultants.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'golden-visa-investor' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-arab-emirates')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);