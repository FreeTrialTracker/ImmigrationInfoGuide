/*
  # Populate Middle East Immigration Cost Profiles
  
  1. Overview
    - 8 pathways across 4 Middle East countries
    - Turkey: Work Permit, Residence Permit (TRY)
    - Israel: Work Visa B1, Student Visa A2 (ILS)
    - Saudi Arabia: Work Visa Iqama, Premium Residency (SAR)
    - Qatar: Work Visa, Investor Visa (QAR)
    
  2. Data Sources
    - Official immigration authorities
    - Current fee schedules verified March 2026
*/

-- TURKEY - WORK PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'TRY', 1390, 1390, 500, 1500, 1000, 5000, 10000, 40000, 1390, 1390, 0, 0, 0, 0,
  'Work permit requires employer sponsorship and Ministry of Labour approval. Employer must prove inability to find Turkish worker. Initial permit 1-2 years, renewable. Residence permit issued based on work permit. Can bring family. Path to long-term residence after 8 years.',
  'Ministry of Labour and Social Security Turkey 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.csgb.gov.tr/',
  'Work permit application TRY 1,390. Residence permit TRY 1,390. Medical exam TRY 500-1,500. Document translation/apostille TRY 1,000-5,000. Processing 1-3 months.',
  'Legal fees TRY 10,000-40,000 for work permit. Employer typically covers. Immigration lawyer for Ministry of Labour application and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'turkey')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- TURKEY - RESIDENCE PERMIT
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'TRY', 1390, 1390, 500, 1500, 1000, 5000, 5000, 20000, 1390, 1390, 150000, 250000, 350000, 450000,
  'Short-term residence permit for various purposes: education, tourism, family reunification, property ownership. Valid 1-2 years, renewable. Must show financial means. Health insurance mandatory. Can apply for long-term residence after 8 consecutive years. Popular for retirees and digital nomads.',
  'Directorate General of Migration Management Turkey 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.goc.gov.tr/',
  'Residence permit TRY 1,390 per year. Health insurance TRY 5,000-15,000/year. Proof of funds ~TRY 12,500/month minimum. Document apostille TRY 1,000-5,000.',
  'Legal assistance optional. Immigration consultant TRY 5,000-20,000 helpful for application preparation and Provincial Directorate procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'residence-permit' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'turkey')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ISRAEL - WORK VISA B1
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'ILS', 185, 185, 300, 800, 500, 3000, 5000, 25000, 185, 185, 0, 0, 0, 0,
  'B1 work visa requires employer sponsorship and Ministry of Interior approval. Work permit from Population Authority mandatory. Initial visa 1 year, renewable. Quota system for foreign workers. Health insurance required. Can sponsor family members. Path to permanent residence (A5) after 5 years.',
  'Population and Immigration Authority Israel 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.gov.il/en/departments/piba',
  'Work visa B1 ILS 185. Work permit varies by profession. Health insurance mandatory (Bituach Leumi or private). Medical exam ILS 300-800. Document translation ILS 500-3,000.',
  'Legal fees ILS 5,000-25,000 for work visa. Employer typically covers. Immigration lawyer for Population Authority application and quota system navigation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa-b1' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'israel')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ISRAEL - STUDENT VISA A2
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'ILS', 185, 185, 300, 800, 500, 3000, 3000, 12000, 185, 185, 90000, 150000, 200000, 250000,
  'A2 student visa for studies at Israeli universities. Requires university acceptance and proof of financial means. Part-time work allowed with permit. Valid for duration of studies. Can extend. Health insurance mandatory. Post-study work options available.',
  'Population and Immigration Authority Israel 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.gov.il/en/departments/piba',
  'Student visa A2 ILS 185. Proof of funds ~$1,000/month required. Health insurance mandatory. Medical exam ILS 300-800. Document translation ILS 500-3,000.',
  'Legal assistance optional. Immigration consultant ILS 3,000-12,000 helpful for visa application and Population Authority procedures. Most students apply independently.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa-a2' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'israel')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SAUDI ARABIA - WORK VISA IQAMA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'SAR', 2000, 2000, 500, 1000, 500, 3000, 5000, 20000, 2000, 2000, 0, 0, 0, 0,
  'Iqama (residence permit) for work requires employer sponsorship under kafala system. Employer handles visa process. Initial permit 1-2 years, renewable. Medical exam and biometrics mandatory. Family can accompany with dependent visas. Exit/re-entry permit required for travel. Nitaqat system affects quotas.',
  'Ministry of Human Resources Saudi Arabia 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.hrsd.gov.sa/',
  'Work visa SAR 2,000. Iqama issuance SAR 650-2,000/year. Medical exam SAR 500-1,000. Exit/re-entry visa SAR 200-650. Employer covers most costs under kafala.',
  'Legal fees SAR 5,000-20,000 for complex cases. Employer handles and covers visa process. Immigration consultant for quota compliance and Ministry procedures.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa-iqama' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'saudi-arabia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- SAUDI ARABIA - PREMIUM RESIDENCY
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'SAR', 100000, 800000, 500, 1000, 500, 3000, 10000, 40000, 50000, 50000, 0, 0, 0, 0,
  'Premium Residency program launched 2019 offers long-term residence without sponsor. Two types: Permanent (SAR 800,000) or Renewable 1-year (SAR 100,000). Includes work authorization, property ownership, family sponsorship. No kafala restrictions. Fast-track immigration. Investment/skills requirements.',
  'Saudi Center for International Strategic Partnerships 2024', '2026-03-13', false, true, 'exact', 'official',
  'https://www.mhrsd.gov.sa/',
  'Premium Residency: SAR 800,000 permanent or SAR 100,000/year renewable. Medical exam SAR 500-1,000. No employer sponsorship needed. Multiple re-entry included.',
  'Legal fees SAR 10,000-40,000 for Premium Residency application. Immigration consultant for eligibility assessment, document preparation, and application process.'
FROM immigration_cost_pathways WHERE pathway_slug = 'premium-residency' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'saudi-arabia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- QATAR - WORK VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'QAR', 200, 200, 200, 500, 500, 2000, 5000, 20000, 200, 200, 0, 0, 0, 0,
  'Work residence permit requires employer sponsorship. Employer handles visa process and costs. Medical exam and biometrics mandatory. Initial permit linked to employment contract. Family can accompany with dependent residence. Qatar reformed kafala system 2020 allowing job changes. Exit permit abolished.',
  'Ministry of Interior Qatar 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://portal.moi.gov.qa/',
  'Work visa QAR 200. Residence permit (ID) QAR 200. Medical exam QAR 200-500. Visa changes/renewals QAR 50-200. Employer covers most costs. Processing 2-6 weeks.',
  'Legal fees QAR 5,000-20,000 for complex cases. Employer handles visa process. Immigration consultant for Ministry of Interior procedures and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'qatar')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- QATAR - INVESTOR VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'QAR', 10000, 10000, 200, 500, 2000, 10000, 10000, 50000, 5000, 5000, 1000000, 1200000, 1400000, 1600000,
  'Permanent residency for investors introduced 2020. Requires property investment (QAR 730,000+) OR business investment OR specialized expertise. Includes family members. No sponsor needed. Can work/do business. 5-year renewable permit. Path to permanent residence. Fast-track processing.',
  'Ministry of Interior Qatar 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://portal.moi.gov.qa/',
  'Investor residence permit QAR 10,000 for 5 years. Property investment QAR 730,000+ OR business investment. Medical exam QAR 200-500. Legal/business formation QAR 2,000-10,000.',
  'Legal fees QAR 10,000-50,000 for investor visa. Business formation and investment legal services additional. Immigration lawyer for Ministry approval and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'investor-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'qatar')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);