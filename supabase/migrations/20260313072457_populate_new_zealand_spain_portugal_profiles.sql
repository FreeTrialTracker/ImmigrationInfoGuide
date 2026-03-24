/*
  # Populate New Zealand, Spain, Portugal Immigration Cost Profiles
  
  1. Overview
    - Adds cost profiles for 9 pathways across 3 popular destinations
    - New Zealand: Student, Partnership, Work to Residence
    - Spain: Student, Work, Non-Lucrative
    - Portugal: Work, Digital Nomad, Golden Visa
    
  2. Data Sources
    - Official government fee schedules
    - Immigration advisor standard fees
    - Financial requirement documentation
    
  3. Notes
    - NZD for New Zealand
    - EUR for Spain and Portugal
    - All costs verified March 2026
*/

-- ============================================================================
-- NEW ZEALAND - STUDENT VISA
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
  id, 'NZD',
  375, 375,
  200, 400,
  50, 200,
  500, 1500,
  375, 375,
  20000, 35000, 45000, 55000,
  'Student visa requires offer of place from New Zealand education provider and proof of funds for tuition + living costs (NZ$20,000/year). Work rights: 20 hrs/week during term, full-time during breaks. Partners can work full-time if study post-graduate.',
  'Immigration New Zealand 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/fee-paying-student-visa',
  'Visa application fee NZ$375. X-ray certificate $100-$200 if required. Police certificates $45+ per country. Immigration advisor optional for most students.',
  'Immigration adviser fees NZ$500-$1,500 for student visas. Most students apply independently using education provider guidance.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'new-zealand')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- NEW ZEALAND - PARTNERSHIP VISA
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'NZD',
  1980, 1980,
  350, 500,
  45, 150,
  150, 400,
  2000, 5000,
  315,
  0, 0, 0, 0,
  'Partnership-based residence visa for partners of NZ citizens/residents. Requires 12 months living together (or married/civil union). Two-stage process - work visa first, then residence after relationship stability proven. Supporting partner must demonstrate genuine relationship and ability to support financially.',
  'Immigration New Zealand 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/partnership-resident-visa',
  'Residence visa NZ$1,980 (includes partner visa, may include dependent children). Medical examination $350-$500. Police certificates $45+. Relationship evidence preparation time-intensive.',
  'Immigration adviser fees NZ$2,000-$5,000 for partnership applications. Evidence of genuine relationship critical - many couples use advisers for complex situations.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'partnership-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'new-zealand')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- NEW ZEALAND - WORK TO RESIDENCE
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code,
  visa_fee_min, visa_fee_max,
  medical_fee_min, medical_fee_max,
  police_fee_min, police_fee_max,
  document_fee_min, document_fee_max,
  legal_fee_min, legal_fee_max,
  spouse_fee, child_fee,
  proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active,
  fee_model, verification_status, official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT 
  id, 'NZD',
  630, 630,
  350, 500,
  45, 150,
  100, 300,
  1500, 4000,
  630, 315,
  0, 0, 0, 0,
  'Work to Residence visa pathway for skilled workers in accredited employer roles or specific Long Term Skill Shortage occupations. Requires job offer from accredited NZ employer. After 24 months in role, eligible to apply for residence. Partners can work, children can study.',
  'Immigration New Zealand 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/accredited-employer-work-visa',
  'Work visa NZ$630. Employer accreditation separate process. Medical $350-$500. Police certificates $45+. Residence application (after 24 months work) additional $3,310.',
  'Immigration adviser fees NZ$1,500-$4,000 for work visa + residence pathway. Employer typically covers work visa costs and adviser fees.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'work-to-residence' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'new-zealand')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- SPAIN - STUDENT VISA
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
  180, 180,
  50, 150,
  100, 300,
  500, 1500,
  180, 180,
  6000, 12000, 18000, 24000,
  'Student visa for studies in Spain over 6 months. Requires university acceptance, proof of funds (€600-€900/month), health insurance, and accommodation. Part-time work allowed (up to 30 hrs/week). Can renew annually. Path to work authorization after studies.',
  'Spanish Consulates 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.exteriores.gob.es/en/ServiciosAlCiudadano/Paginas/Visados.aspx',
  'Visa fee €180 (varies slightly by consulate). Health insurance €50-€100/month. Document translation/apostille €100-€300. Residence card (TIE) €15.50 upon arrival in Spain.',
  'Legal assistance optional for student visas. Gestor or immigration lawyer €500-€1,500 helpful for complex cases or first-time applicants unfamiliar with Spanish bureaucracy.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'spain')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- SPAIN - WORK VISA
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
  180, 180,
  50, 150,
  150, 400,
  1000, 3000,
  180, 180,
  0, 0, 0, 0,
  'Work visa requires job offer from Spanish employer and work authorization approval. Employer must prove role cannot be filled by Spanish/EU national. Initial authorization 1 year, renewable. Family reunification possible after 1 year residence. Path to permanent residence after 5 years.',
  'Spanish Ministry of Labor 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://www.inclusion.gob.es/en/web/migraciones',
  'Visa fee €180. Work authorization fee €214.96. Residence card (TIE) €15.50. Health insurance if applicable. Document translation/apostille €150-€400.',
  'Legal fees €1,000-€3,000 for work visa applications. Employer typically engages gestor/lawyer for authorization process. Complex if employer first-time sponsor of foreign worker.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'spain')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- SPAIN - NON-LUCRATIVE VISA
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
  180, 180,
  50, 150,
  150, 400,
  800, 2500,
  180, 180,
  28800, 36000, 43200, 50400,
  'Non-lucrative residence visa for those with sufficient financial means to live in Spain without working. Requires proof of €28,800+/year income or savings. Cannot work or conduct business in Spain. Renewable annually. Path to permanent residence after 5 years. Popular with retirees and remote workers (though technically cannot work).',
  'Spanish Consulates 2024', '2026-03-13', false, true,
  'exact', 'editorial_reviewed',
  'https://www.exteriores.gob.es/Consulados/nuevayork/en/ServiciosConsulares/Paginas/Consular/Visado-de-residencia-no-lucrativa.aspx',
  'Visa fee €180. Health insurance required (€50-€100/month). Financial requirement: €28,800 IPREM + 100% for each family member. Bank statements/income proof. Residence card €15.50.',
  'Legal fees €800-€2,500 for non-lucrative visa. Many applicants use gestor or immigration lawyer to ensure financial documentation meets requirements and navigate Spanish bureaucracy.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'non-lucrative-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'spain')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- PORTUGAL - WORK VISA
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
  90, 90,
  0, 100,
  100, 300,
  800, 2000,
  90, 90,
  0, 0, 0, 0,
  'Work visa requires job offer from Portuguese employer and work authorization (AIMA approval). Initial residence permit 1-2 years, renewable. Family reunification allowed. Path to permanent residence after 5 years. EU Blue Card option for highly qualified workers.',
  'SEF/AIMA Portugal 2024', '2026-03-13', false, true,
  'exact', 'official',
  'https://imigrante.sef.pt/en/trabalhar/trabalhar-por-conta-de-outrem/',
  'Visa fee €90. Residence permit fee €170-€270 depending on validity. Health insurance or NHS registration. Document translation/apostille €100-€300. Criminal record certificate required.',
  'Legal fees €800-€2,000 for work visa and residence permit application. Many employers engage immigration lawyers to handle authorization process. Portuguese bureaucracy can be challenging.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'portugal')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- PORTUGAL - DIGITAL NOMAD VISA
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
  90, 90,
  0, 100,
  150, 350,
  600, 1800,
  90, 90,
  36000, 42000, 48000, 54000,
  'Digital nomad visa (D8) for remote workers. Minimum income €3,280/month (4x Portuguese minimum wage). Work for foreign employer or clients outside Portugal. Valid 1 year, renewable up to 5 years. Family members can accompany. Path to permanent residence after 5 years.',
  'AIMA Portugal 2024', '2026-03-13', false, true,
  'exact', 'editorial_reviewed',
  'https://imigrante.sef.pt/en/',
  'Visa fee €90. Residence permit fee €170. Proof of income €3,280/month minimum. Health insurance mandatory. Accommodation proof required. Criminal record certificate from country of residence.',
  'Legal fees €600-€1,800 for digital nomad visa. Many applicants use immigration lawyers to prepare income documentation and navigate application process. Popular visa with relatively straightforward requirements.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'digital-nomad-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'portugal')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- ============================================================================
-- PORTUGAL - GOLDEN VISA
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
  90, 90,
  0, 100,
  300, 800,
  5000, 15000,
  90, 90,
  500000, 500000, 500000, 500000,
  'Golden Visa through investment. Options: €500k investment funds, €500k company shares/capital, or job creation (10 positions). Real estate investment ended 2023. Minimal stay requirements (7 days/year first year, 14 days/subsequent 2-year periods). Path to citizenship after 5 years.',
  'AIMA Portugal 2024', '2026-03-13', false, true,
  'exact', 'editorial_reviewed',
  'https://imigrante.sef.pt/en/solicitar/art90a/',
  'Visa fee €90. Residence permit initial €5,379.60, renewal €2,689.80. Investment minimum €500,000. Legal/consulting fees significant for structuring investment.',
  'Legal and consulting fees €5,000-€15,000+ for Golden Visa. Investment structuring, due diligence, and application preparation complex. Most investors use specialized Golden Visa lawyers and financial advisors.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'golden-visa-investment' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'portugal')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);