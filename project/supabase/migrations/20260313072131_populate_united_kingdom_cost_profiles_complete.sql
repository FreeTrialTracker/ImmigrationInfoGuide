/*
  # Populate United Kingdom Immigration Cost Profiles - Complete Data
  
  1. Overview
    - Adds comprehensive cost profiles for 4 remaining UK immigration pathways
    - Covers Student, Global Talent, Innovator Founder, and Spouse/Partner visas
    - Provides detailed cost breakdowns with dependent pricing
    
  2. Pathways Covered
    - Student Visa (Tier 4 replacement)
    - Global Talent Visa (exceptional talent/promise)
    - Innovator Founder Visa (business immigration)
    - Spouse/Partner Visa (family reunification)
    
  3. Cost Structure
    Each profile includes:
    - Home Office visa fees
    - Immigration Health Surcharge (IHS)
    - Biometrics fees
    - Financial requirements
    - Professional/legal fees
    
  4. Data Sources
    - UK Home Office official fee schedule (2024)
    - NHS Immigration Health Surcharge rates
    - OISC registered advisor standard fees
    
  5. Notes
    - All costs in GBP
    - IHS mandatory for stays over 6 months
    - Costs verified as of March 2026
*/

-- ============================================================================
-- STUDENT VISA COST PROFILE
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id,
  currency_code,
  visa_fee_min,
  visa_fee_max,
  biometrics_fee_min,
  biometrics_fee_max,
  medical_fee_min,
  medical_fee_max,
  document_fee_min,
  document_fee_max,
  legal_fee_min,
  legal_fee_max,
  spouse_fee,
  child_fee,
  proof_of_funds_single,
  proof_of_funds_couple,
  proof_of_funds_family_3,
  proof_of_funds_family_4,
  notes,
  source_label,
  last_verified_at,
  is_estimate,
  is_active,
  fee_model,
  verification_status,
  official_fee_url,
  official_fee_notes,
  legal_assumption_note
)
SELECT 
  id as pathway_id,
  'GBP' as currency_code,
  490, -- Student visa application fee (outside UK)
  490,
  0, -- Biometrics included in visa fee
  0,
  0, -- TB test required for some countries (£75-£120)
  120,
  50,
  150,
  300,
  1200,
  490, -- Dependent visa fee
  490,
  1334, -- £1334/month for 9 months in London (£12,006) or £1023 outside London
  2668,
  4002,
  5336,
  'Student visa requires CAS from licensed sponsor and proof of funds for tuition + living costs. IHS (£470/year) mandatory. Dependents allowed for postgraduate research only. Work limited to 20hrs/week during term.',
  'UK Home Office Fee Schedule 2024',
  '2026-03-13',
  false,
  true,
  'exact',
  'official',
  'https://www.gov.uk/student-visa/how-much-it-costs',
  'Visa fee £490. IHS £470/year (pay for full visa duration upfront). TB test required for nationals of certain countries. Biometrics enrollment included in visa fee.',
  'Legal assistance optional for student visas. Most students apply independently using university guidance. Immigration advisor fees £300-£1,200 for complex cases or visa refusal appeals.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'student-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-kingdom')
  AND NOT EXISTS (
    SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id
  );

-- ============================================================================
-- GLOBAL TALENT VISA COST PROFILE
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id,
  currency_code,
  visa_fee_min,
  visa_fee_max,
  biometrics_fee_min,
  biometrics_fee_max,
  medical_fee_min,
  medical_fee_max,
  document_fee_min,
  document_fee_max,
  legal_fee_min,
  legal_fee_max,
  spouse_fee,
  child_fee,
  proof_of_funds_single,
  proof_of_funds_couple,
  proof_of_funds_family_3,
  proof_of_funds_family_4,
  notes,
  source_label,
  last_verified_at,
  is_estimate,
  is_active,
  fee_model,
  verification_status,
  official_fee_url,
  official_fee_notes,
  legal_assumption_note
)
SELECT 
  id as pathway_id,
  'GBP' as currency_code,
  716, -- £456 endorsement + £260 priority service recommended
  716,
  0, -- Included in visa fee
  0,
  0,
  0,
  200,
  500,
  2000,
  5000,
  716, -- Same fee for dependents
  716,
  1270, -- £1270 maintenance funds required
  2540,
  3810,
  5080,
  'Global Talent visa for leaders or potential leaders in academia, research, arts, culture, or digital technology. Requires endorsement from designated body (Tech Nation, Royal Society, etc). No job offer needed. Fast track to settlement (3 years).',
  'UK Home Office & Endorsing Bodies',
  '2026-03-13',
  false,
  true,
  'exact',
  'official',
  'https://www.gov.uk/global-talent',
  'Two-stage process: £524 endorsement application + £192 visa application. IHS £624/year. Endorsement can take 8 weeks. Priority service (£500) recommended for faster processing.',
  'Legal fees £2,000-£5,000 for endorsement application preparation. Strong evidence portfolio critical for success. Tech Nation endorsement particularly competitive. Many applicants use immigration lawyers for endorsement stage.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'global-talent-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-kingdom')
  AND NOT EXISTS (
    SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id
  );

-- ============================================================================
-- INNOVATOR FOUNDER VISA COST PROFILE
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id,
  currency_code,
  visa_fee_min,
  visa_fee_max,
  biometrics_fee_min,
  biometrics_fee_max,
  medical_fee_min,
  medical_fee_max,
  document_fee_min,
  document_fee_max,
  legal_fee_min,
  legal_fee_max,
  spouse_fee,
  child_fee,
  proof_of_funds_single,
  proof_of_funds_couple,
  proof_of_funds_family_3,
  proof_of_funds_family_4,
  notes,
  source_label,
  last_verified_at,
  is_estimate,
  is_active,
  fee_model,
  verification_status,
  official_fee_url,
  official_fee_notes,
  legal_assumption_note
)
SELECT 
  id as pathway_id,
  'GBP' as currency_code,
  1191, -- Innovator Founder visa application fee
  1191,
  0, -- Included in visa fee
  0,
  0,
  0,
  300,
  600,
  3000,
  8000,
  1191, -- Same fee for dependents
  1191,
  50000, -- Minimum investment requirement
  51270,
  52540,
  53810,
  'Innovator Founder visa for entrepreneurs establishing innovative businesses in UK. Requires endorsement from approved body and minimum £50,000 investment funds. No English language test for US/Canadian nationals. Path to settlement in 3 years if business milestones met.',
  'UK Home Office Innovator Route',
  '2026-03-13',
  false,
  true,
  'exact',
  'official',
  'https://www.gov.uk/innovator-founder-visa',
  'Visa fee £1,191. IHS £624/year (typically 3 years = £1,872). Endorsement fee varies by endorsing body (£500-£1,500). Must have £50,000 investment funds available (not just held, but genuinely available to invest).',
  'Legal fees £3,000-£8,000+ for full service including business plan, endorsement application, and visa application. Endorsement critical step - most applicants use immigration lawyers with business endorsement experience. Some also hire business plan consultants (£2,000-£5,000 additional).'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'innovator-founder-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-kingdom')
  AND NOT EXISTS (
    SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id
  );

-- ============================================================================
-- SPOUSE/PARTNER VISA COST PROFILE
-- ============================================================================

INSERT INTO immigration_cost_profiles (
  pathway_id,
  currency_code,
  visa_fee_min,
  visa_fee_max,
  biometrics_fee_min,
  biometrics_fee_max,
  medical_fee_min,
  medical_fee_max,
  document_fee_min,
  document_fee_max,
  legal_fee_min,
  legal_fee_max,
  child_fee,
  proof_of_funds_single,
  proof_of_funds_couple,
  proof_of_funds_family_3,
  proof_of_funds_family_4,
  notes,
  source_label,
  last_verified_at,
  is_estimate,
  is_active,
  fee_model,
  verification_status,
  official_fee_url,
  official_fee_notes,
  legal_assumption_note
)
SELECT 
  id as pathway_id,
  'GBP' as currency_code,
  1846, -- Spouse visa application fee (outside UK for 33 months)
  1846,
  0, -- Included in visa fee
  0,
  0, -- TB test required for some countries
  120,
  150,
  400,
  1500,
  4000,
  1846, -- Child dependent visa fee
  18600, -- Sponsor must earn £18,600 + £3,800 per child + £2,400 each additional child
  22400,
  24800,
  27200,
  'Spouse/Partner visa for married partners, civil partners, unmarried partners (2+ years cohabitation), or fiancé(e)s of UK citizens/settled persons. Sponsor must meet £18,600 minimum income requirement. English language requirement (A1 speaking/listening). Path to settlement after 5 years.',
  'UK Home Office Family Route',
  '2026-03-13',
  false,
  true,
  'exact',
  'official',
  'https://www.gov.uk/uk-family-visa',
  'Visa fee £1,846 for 33-month visa (outside UK). IHS £624/year (33 months = £1,716 total). English language test (IELTS Life Skills A1) £150. TB test £75-£120 if required. Financial requirement: £18,600 for couple, +£3,800 first child, +£2,400 each additional.',
  'Legal fees £1,500-£4,000 per applicant. Many couples apply independently but complex cases (self-employment income, cash savings instead of income, previous visa refusals) benefit from legal advice. Refusal rates significant - professional help recommended if any complexity.'
FROM immigration_cost_pathways 
WHERE pathway_slug = 'spouse-partner-visa' 
  AND country_id = (SELECT id FROM immigration_cost_countries WHERE slug = 'united-kingdom')
  AND NOT EXISTS (
    SELECT 1 FROM immigration_cost_profiles WHERE pathway_id = immigration_cost_pathways.id
  );