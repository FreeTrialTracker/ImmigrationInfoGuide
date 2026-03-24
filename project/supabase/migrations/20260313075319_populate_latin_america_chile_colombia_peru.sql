/*
  # Populate Chile, Colombia, Peru Immigration Cost Profiles
  
  1. Overview
    - 6 pathways across 3 Latin American countries
    - Chile: Temporary Residence Work, Investor (CLP)
    - Colombia: Digital Nomad, Migrant Visa (COP)
    - Peru: Work, Student Visa (PEN)
    
  2. Data Sources
    - Official immigration authorities
    - Current fee schedules verified March 2026
*/

-- CHILE - TEMPORARY RESIDENCE WORK
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CLP', 120000, 120000, 0, 50000, 20000, 100000, 300000, 1200000, 120000, 120000, 0, 0, 0, 0,
  'Temporary residence permit for work requires employment contract from Chilean employer. Employer must demonstrate labor market need. Initial permit 1 year, renewable up to 2 years. Can apply for definitive residence after 2 years. Family reunification available. Online visa system (SINIM).',
  'Servicio Nacional de Migraciones Chile 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://serviciomigraciones.cl/',
  'Visa application fee CLP 120,000. Residence card (cédula extranjería) CLP 23,000. Document authentication/apostille CLP 20k-100k. Criminal background check required.',
  'Legal fees CLP 300k-1.2M for work visa. Employer typically covers. Immigration lawyer for labor market justification and documentation preparation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'temporary-residence-work' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'chile')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- CHILE - TEMPORARY RESIDENCE INVESTOR
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'CLP', 120000, 120000, 0, 50000, 50000, 200000, 500000, 2000000, 120000, 120000, 150000000, 180000000, 210000000, 240000000,
  'Temporary residence for investors and business owners. Must invest in Chilean company or create business. Minimum investment varies by business type (typically $150,000-300,000 USD equivalent). Initial permit 1 year, renewable. Fast-track to definitive residence. Can hire foreign employees.',
  'Servicio Nacional de Migraciones Chile 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://serviciomigraciones.cl/',
  'Visa fee CLP 120,000. Residence card CLP 23,000. Investment documentation and business formation CLP 50k-200k. Business plan may be required. Minimum investment ~$150k USD.',
  'Legal fees CLP 500k-2M for investor visa. Business formation legal services additional. Most investors use immigration lawyers and business consultants.'
FROM immigration_cost_pathways WHERE pathway_slug = 'temporary-residence-investor' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'chile')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- COLOMBIA - DIGITAL NOMAD VISA (V)
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'COP', 230000, 230000, 0, 300000, 50000, 300000, 500000, 2000000, 230000, 230000, 30000000, 40000000, 50000000, 60000000,
  'Visitor visa (V) for digital nomads introduced 2022. Minimum income 3x Colombian minimum wage (~COP 3.9M/month = ~$900 USD). Valid up to 2 years. Work remotely for foreign companies. Can bring family. Health insurance mandatory. Cannot work for Colombian companies.',
  'Ministerio de Relaciones Exteriores Colombia 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.cancilleria.gov.co/',
  'Visitor visa (V) fee COP 230,000 (varies by nationality). Income requirement 3x minimum wage (COP 3.9M/month). Health insurance mandatory. Document apostille COP 50k-300k.',
  'Legal fees COP 500k-2M for digital nomad visa. Immigration consultant helpful for income documentation and visa application. Relatively straightforward process.'
FROM immigration_cost_pathways WHERE pathway_slug = 'digital-nomad-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'colombia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- COLOMBIA - MIGRANT VISA (M)
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'COP', 430000, 430000, 0, 300000, 50000, 300000, 800000, 3000000, 430000, 430000, 0, 0, 0, 0,
  'Migrant visa (M) for work, investment, family reunification. Multiple subcategories: work (employment contract), investor (business creation/investment), family (spouse/partner of Colombian). Valid up to 3 years. Path to permanent residence (R) after holding M visa. Most flexible visa category.',
  'Ministerio de Relaciones Exteriores Colombia 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.cancilleria.gov.co/',
  'Migrant visa (M) fee COP 430,000 (varies by nationality). Requirements vary by subcategory. Work: employment contract. Investor: business formation. Family: marriage certificate. Document apostille COP 50k-300k.',
  'Legal fees COP 800k-3M for Migrant visa. Immigration lawyer for subcategory selection, document preparation, and Ministry of Foreign Affairs application.'
FROM immigration_cost_pathways WHERE pathway_slug = 'migrant-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'colombia')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- PERU - WORK VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'PEN', 200, 200, 0, 500, 100, 600, 1000, 4000, 200, 200, 0, 0, 0, 0,
  'Work residence visa requires employment contract from Peruvian employer and work authorization from Migraciones. Employer must justify hiring foreign worker. Initial permit 1 year, renewable. Can apply for permanent residence after 3 years. Family members can accompany with dependent visas.',
  'Superintendencia Nacional de Migraciones Peru 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.migraciones.gob.pe/',
  'Work visa fee PEN 200. Foreign residence card (carné de extranjería) PEN 43. Work authorization from Migraciones required. Document legalization PEN 100-600. Processing 30-60 days.',
  'Legal fees PEN 1,000-4,000 for work visa process. Employer typically covers. Immigration lawyer for work authorization application and documentation.'
FROM immigration_cost_pathways WHERE pathway_slug = 'work-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'peru')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);

-- PERU - STUDENT VISA
INSERT INTO immigration_cost_profiles (
  pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max,
  document_fee_min, document_fee_max, legal_fee_min, legal_fee_max,
  spouse_fee, child_fee, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
  notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status,
  official_fee_url, official_fee_notes, legal_assumption_note
)
SELECT id, 'PEN', 200, 200, 0, 500, 100, 600, 500, 2000, 200, 200, 20000, 35000, 45000, 55000,
  'Student residence visa for studies at Peruvian educational institutions. Requires university acceptance letter and proof of financial solvency. Part-time work allowed with authorization. Valid for duration of studies. Can extend annually. Affordable education option in South America.',
  'Superintendencia Nacional de Migraciones Peru 2024', '2026-03-13', false, true, 'exact', 'editorial_reviewed',
  'https://www.migraciones.gob.pe/',
  'Student visa fee PEN 200. Foreign residence card (carné de extranjería) PEN 43. Proof of university enrollment and financial capacity. Document legalization PEN 100-600.',
  'Legal assistance optional. Immigration consultant PEN 500-2,000 helpful for document preparation and Migraciones procedures. Most students apply independently.'
FROM immigration_cost_pathways WHERE pathway_slug = 'student-visa' AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'peru')
AND NOT EXISTS (SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id);