
/*
  # Add Americas Batch 1 Countries

  Adds 11 missing Caribbean and Latin American countries to the immigration cost calculator.

  ## New Countries
  - Bahamas (BS / BHS) - Caribbean
  - Barbados (BB / BRB) - Caribbean
  - Bolivia (BO / BOL) - South America
  - Costa Rica (CR / CRI) - Central America
  - Cuba (CU / CUB) - Caribbean
  - Dominican Republic (DO / DOM) - Caribbean
  - Ecuador (EC / ECU) - South America
  - Jamaica (JM / JAM) - Caribbean
  - Panama (PA / PAN) - Central America
  - Paraguay (PY / PRY) - South America
  - Uruguay (UY / URY) - South America

  ## Structure per country
  - 1 row in immigration_cost_countries
  - 3-4 pathways in immigration_cost_pathways (Work Visa, Student Visa, Retirement/Residency, Digital Nomad where applicable)
  - 1 cost profile per pathway in immigration_cost_profiles

  ## Security
  - No RLS changes needed (existing policies cover new rows)
*/

-- ============================================================
-- STEP 1: INSERT COUNTRIES
-- ============================================================

INSERT INTO immigration_cost_countries (name, slug, region, iso2, iso3, is_destination, is_passport_source, is_active, display_order)
VALUES
  ('Bahamas',            'bahamas',            'Caribbean',      'BS', 'BHS', true, true, true, 620),
  ('Barbados',           'barbados',           'Caribbean',      'BB', 'BRB', true, true, true, 621),
  ('Bolivia',            'bolivia',            'South America',  'BO', 'BOL', true, true, true, 622),
  ('Costa Rica',         'costa-rica',         'Central America','CR', 'CRI', true, true, true, 623),
  ('Cuba',               'cuba',               'Caribbean',      'CU', 'CUB', true, true, true, 624),
  ('Dominican Republic', 'dominican-republic', 'Caribbean',      'DO', 'DOM', true, true, true, 625),
  ('Ecuador',            'ecuador',            'South America',  'EC', 'ECU', true, true, true, 626),
  ('Jamaica',            'jamaica',            'Caribbean',      'JM', 'JAM', true, true, true, 627),
  ('Panama',             'panama',             'Central America','PA', 'PAN', true, true, true, 628),
  ('Paraguay',           'paraguay',           'South America',  'PY', 'PRY', true, true, true, 629),
  ('Uruguay',            'uruguay',            'South America',  'UY', 'URY', true, true, true, 630)
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- STEP 2: INSERT PATHWAYS
-- ============================================================

-- BAHAMAS
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Permit',            'work-permit',            'Work Visa',   'Employment authorization for foreign nationals.',        true, true,  10 FROM immigration_cost_countries WHERE slug = 'bahamas'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Bahamian educational institutions.',            true, true,  20 FROM immigration_cost_countries WHERE slug = 'bahamas'
UNION ALL
SELECT id, 'Residency by Investment','residency-by-investment', 'Investor',    'Permanent residency through qualifying investment.',     true, true,  30 FROM immigration_cost_countries WHERE slug = 'bahamas'
UNION ALL
SELECT id, 'Annual Residence Permit','annual-residence-permit', 'Retirement',  'Long-stay permit for retirees and remote workers.',     true, false, 40 FROM immigration_cost_countries WHERE slug = 'bahamas';

-- BARBADOS
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Permit',            'work-permit',            'Work Visa',   'Employment authorization in Barbados.',                  true, true,  10 FROM immigration_cost_countries WHERE slug = 'barbados'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at institutions in Barbados.',                    true, true,  20 FROM immigration_cost_countries WHERE slug = 'barbados'
UNION ALL
SELECT id, 'Welcome Stamp',          'welcome-stamp',          'Digital Nomad','12-month remote work visa for digital nomads.',        true, true,  30 FROM immigration_cost_countries WHERE slug = 'barbados'
UNION ALL
SELECT id, 'Retirement Visa',        'retirement-visa',        'Retirement',  'Residency for retirees with qualifying income.',        true, false, 40 FROM immigration_cost_countries WHERE slug = 'barbados';

-- BOLIVIA
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Visa',              'work-visa',              'Work Visa',   'Temporary residency for employment in Bolivia.',        true, true,  10 FROM immigration_cost_countries WHERE slug = 'bolivia'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Bolivian universities.',                       true, true,  20 FROM immigration_cost_countries WHERE slug = 'bolivia'
UNION ALL
SELECT id, 'Rentista Visa',          'rentista-visa',          'Retirement',  'Residency through passive income or pension.',          true, true,  30 FROM immigration_cost_countries WHERE slug = 'bolivia'
UNION ALL
SELECT id, 'Permanent Residency',    'permanent-residency',    'Permanent Residency','Permanent residence after qualifying period.',   true, false, 40 FROM immigration_cost_countries WHERE slug = 'bolivia';

-- COSTA RICA
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Permit',            'work-permit',            'Work Visa',   'Employment authorization in Costa Rica.',               true, true,  10 FROM immigration_cost_countries WHERE slug = 'costa-rica'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Costa Rican educational institutions.',        true, true,  20 FROM immigration_cost_countries WHERE slug = 'costa-rica'
UNION ALL
SELECT id, 'Pensionado Visa',        'pensionado-visa',        'Retirement',  'Retirement visa for those with qualifying pension.',    true, true,  30 FROM immigration_cost_countries WHERE slug = 'costa-rica'
UNION ALL
SELECT id, 'Rentista Visa',          'rentista-visa',          'Retirement',  'Residency through passive investment income.',          true, true,  40 FROM immigration_cost_countries WHERE slug = 'costa-rica'
UNION ALL
SELECT id, 'Investor Visa',          'investor-visa',          'Investor',    'Residency through qualifying business investment.',     true, false, 50 FROM immigration_cost_countries WHERE slug = 'costa-rica';

-- CUBA
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Visa',              'work-visa',              'Work Visa',   'Authorization to work in Cuba.',                        true, true,  10 FROM immigration_cost_countries WHERE slug = 'cuba'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Cuban universities.',                          true, true,  20 FROM immigration_cost_countries WHERE slug = 'cuba'
UNION ALL
SELECT id, 'Temporary Residency',    'temporary-residency',    'Long-Stay',   'Extended stay permit for foreign nationals.',           true, false, 30 FROM immigration_cost_countries WHERE slug = 'cuba';

-- DOMINICAN REPUBLIC
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Permit',            'work-permit',            'Work Visa',   'Employment authorization in the Dominican Republic.',   true, true,  10 FROM immigration_cost_countries WHERE slug = 'dominican-republic'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Dominican educational institutions.',          true, true,  20 FROM immigration_cost_countries WHERE slug = 'dominican-republic'
UNION ALL
SELECT id, 'Retirement Visa',        'retirement-visa',        'Retirement',  'Residency for retirees with qualifying income.',        true, true,  30 FROM immigration_cost_countries WHERE slug = 'dominican-republic'
UNION ALL
SELECT id, 'Investor Residency',     'investor-residency',     'Investor',    'Residency through qualifying investment.',              true, false, 40 FROM immigration_cost_countries WHERE slug = 'dominican-republic';

-- ECUADOR
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Visa',              'work-visa',              'Work Visa',   'Employment authorization in Ecuador.',                  true, true,  10 FROM immigration_cost_countries WHERE slug = 'ecuador'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Ecuadorian universities.',                     true, true,  20 FROM immigration_cost_countries WHERE slug = 'ecuador'
UNION ALL
SELECT id, 'Pensioner Visa',         'pensioner-visa',         'Retirement',  'Residency for retirees with qualifying pension.',       true, true,  30 FROM immigration_cost_countries WHERE slug = 'ecuador'
UNION ALL
SELECT id, 'Professional Visa',      'professional-visa',      'Work Visa',   'For skilled professionals and self-employed workers.',  true, false, 40 FROM immigration_cost_countries WHERE slug = 'ecuador';

-- JAMAICA
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Permit',            'work-permit',            'Work Visa',   'Employment authorization in Jamaica.',                  true, true,  10 FROM immigration_cost_countries WHERE slug = 'jamaica'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Jamaican educational institutions.',           true, true,  20 FROM immigration_cost_countries WHERE slug = 'jamaica'
UNION ALL
SELECT id, 'Temporary Residence',    'temporary-residence',    'Long-Stay',   'Extended stay for retirees and long-term visitors.',    true, false, 30 FROM immigration_cost_countries WHERE slug = 'jamaica';

-- PANAMA
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Permit',            'work-permit',            'Work Visa',   'Employment authorization in Panama.',                   true, true,  10 FROM immigration_cost_countries WHERE slug = 'panama'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Panamanian educational institutions.',         true, true,  20 FROM immigration_cost_countries WHERE slug = 'panama'
UNION ALL
SELECT id, 'Pensionado Visa',        'pensionado-visa',        'Retirement',  'Retirement visa with significant discounts.',           true, true,  30 FROM immigration_cost_countries WHERE slug = 'panama'
UNION ALL
SELECT id, 'Friendly Nations Visa',  'friendly-nations-visa',  'Permanent Residency','Fast-track residency for 50 friendly nations.',  true, true,  40 FROM immigration_cost_countries WHERE slug = 'panama'
UNION ALL
SELECT id, 'Investor Visa',          'investor-visa',          'Investor',    'Residency through qualifying business investment.',     true, false, 50 FROM immigration_cost_countries WHERE slug = 'panama';

-- PARAGUAY
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Visa',              'work-visa',              'Work Visa',   'Employment authorization in Paraguay.',                 true, true,  10 FROM immigration_cost_countries WHERE slug = 'paraguay'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Paraguayan universities.',                     true, true,  20 FROM immigration_cost_countries WHERE slug = 'paraguay'
UNION ALL
SELECT id, 'Rentista Visa',          'rentista-visa',          'Retirement',  'Residency through passive income.',                     true, true,  30 FROM immigration_cost_countries WHERE slug = 'paraguay'
UNION ALL
SELECT id, 'Permanent Residency',    'permanent-residency',    'Permanent Residency','One of the most accessible permanent residencies in the Americas.', true, true, 40 FROM immigration_cost_countries WHERE slug = 'paraguay';

-- URUGUAY
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Visa',              'work-visa',              'Work Visa',   'Employment authorization in Uruguay.',                  true, true,  10 FROM immigration_cost_countries WHERE slug = 'uruguay'
UNION ALL
SELECT id, 'Student Visa',           'student-visa',           'Student',     'Study at Uruguayan universities.',                      true, true,  20 FROM immigration_cost_countries WHERE slug = 'uruguay'
UNION ALL
SELECT id, 'Rentista Visa',          'rentista-visa',          'Retirement',  'Residency through passive income or pension.',          true, true,  30 FROM immigration_cost_countries WHERE slug = 'uruguay'
UNION ALL
SELECT id, 'Investor Residency',     'investor-residency',     'Investor',    'Residency through qualifying investment.',              true, false, 40 FROM immigration_cost_countries WHERE slug = 'uruguay';

-- ============================================================
-- STEP 3: INSERT COST PROFILES
-- ============================================================

-- BAHAMAS - Work Permit
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, police_fee_min, police_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BSD', 250, 1000, 100, 300, 50, 100, 100, 300, 500, 2000, 5000, 7000, 9000, 11000, 250, 100,
  'Work permits in the Bahamas are employer-sponsored. Permit fees vary by occupation category. Annual renewal required. Government fee structure applies.',
  'Bahamas Department of Immigration 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'bahamas' AND pw.pathway_slug = 'work-permit';

-- BAHAMAS - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BSD', 100, 200, 50, 200, 0, 500, 8000, 10000, 12000, 15000,
  'Student visa for enrollment at accredited Bahamian institutions. Must show sufficient funds for tuition and living expenses.',
  'Bahamas Department of Immigration 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'bahamas' AND pw.pathway_slug = 'student-visa';

-- BAHAMAS - Residency by Investment
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BSD', 1000, 5000, 500, 2000, 3000, 10000, 500000, 500000, 500000, 500000,
  'Permanent residency through real estate investment of BSD 500,000+. Accelerated residency available for BSD 1.5M+ investment. One of the most popular routes to Bahamian residency.',
  'Bahamas Department of Immigration 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'bahamas' AND pw.pathway_slug = 'residency-by-investment';

-- BAHAMAS - Annual Residence Permit
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BSD', 1000, 1000, 100, 300, 500, 2000, 20000, 25000, 30000, 35000,
  'Annual residence permit for those not working locally. Renewable each year. Popular with retirees and those with foreign income.',
  'Bahamas Department of Immigration 2024', '2026-03-15', true, true, 'exact', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'bahamas' AND pw.pathway_slug = 'annual-residence-permit';

-- BARBADOS - Work Permit
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BBD', 500, 2000, 200, 500, 200, 600, 1000, 4000, 10000, 14000, 18000, 22000, 500, 200,
  'Work permits require employer sponsorship. Fees vary by occupation category. Short-term permits (under 6 months) and long-term permits available. Non-refundable application fee.',
  'Barbados Immigration Department 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'barbados' AND pw.pathway_slug = 'work-permit';

-- BARBADOS - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BBD', 200, 400, 100, 400, 15000, 18000, 22000, 26000,
  'Student permit for accredited institutions in Barbados. Must provide proof of enrollment, financial support, and accommodation.',
  'Barbados Immigration Department 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'barbados' AND pw.pathway_slug = 'student-visa';

-- BARBADOS - Welcome Stamp (Digital Nomad)
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 2000, 2000, 100, 300, 0, 500, 50000, 50000, 50000, 50000, 2000, 500,
  'Barbados Welcome Stamp: 12-month remote work visa costing USD 2,000 per person (USD 3,000 for family). Must earn at least USD 50,000/year. No Barbados income tax on foreign income. Renewable for another 12 months.',
  'Barbados Immigration Department 2024', '2026-03-15', false, true, 'exact', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'barbados' AND pw.pathway_slug = 'welcome-stamp';

-- BARBADOS - Retirement Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BBD', 500, 1000, 200, 600, 1000, 3000, 24000, 30000, 36000, 42000,
  'Special Entry Permit for retirees. Must demonstrate sufficient income. Permits issued for 5 years initially and are renewable.',
  'Barbados Immigration Department 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'barbados' AND pw.pathway_slug = 'retirement-visa';

-- BOLIVIA - Work Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BOB', 300, 800, 200, 600, 200, 600, 1000, 4000, 10000, 14000, 18000, 22000, 300, 200,
  'Work visa for foreign employees in Bolivia. Employer sponsorship required. Initial duration 1 year, renewable. Must register with SEGEMIG (migration service).',
  'Servicio de Migración Bolivia 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'bolivia' AND pw.pathway_slug = 'work-visa';

-- BOLIVIA - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BOB', 150, 300, 100, 400, 6000, 8000, 10000, 12000,
  'Student visa for enrollment at Bolivian universities. One of South Americas most affordable study destinations. Low cost of living makes Bolivia attractive for budget-conscious students.',
  'Servicio de Migración Bolivia 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'bolivia' AND pw.pathway_slug = 'student-visa';

-- BOLIVIA - Rentista Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BOB', 200, 500, 200, 600, 500, 2000, 18000, 24000, 30000, 36000,
  'Temporary residency through passive income. Minimum ~$800/month income required. Very affordable country with low cost of living. Path to permanent residency.',
  'Servicio de Migración Bolivia 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'bolivia' AND pw.pathway_slug = 'rentista-visa';

-- BOLIVIA - Permanent Residency
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'BOB', 400, 800, 200, 600, 1000, 3000, 0, 0, 0, 0,
  'Permanent residency available after 2 years of temporary residency. Relatively straightforward process. Bolivia offers one of the most accessible paths to permanent residency in South America.',
  'Servicio de Migración Bolivia 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'bolivia' AND pw.pathway_slug = 'permanent-residency';

-- COSTA RICA - Work Permit
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'CRC', 150000, 400000, 50000, 150000, 50000, 200000, 200000, 800000, 3000000, 4000000, 5000000, 6000000, 150000, 75000,
  'Work permit requires employer sponsorship or a labor market test showing no suitable local candidate. Fees in CRC (Costa Rican Colon). CAJA (social security) registration required.',
  'Dirección General de Migración y Extranjería Costa Rica 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'costa-rica' AND pw.pathway_slug = 'work-permit';

-- COSTA RICA - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'CRC', 100000, 200000, 30000, 100000, 1500000, 2000000, 2500000, 3000000,
  'Student visa for accredited institutions. Fees in Costa Rican Colones. Must demonstrate enrollment and sufficient financial support.',
  'Dirección General de Migración y Extranjería Costa Rica 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'costa-rica' AND pw.pathway_slug = 'student-visa';

-- COSTA RICA - Pensionado Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 200, 400, 100, 400, 500, 2000, 12000, 15000, 18000, 21000,
  'Pensionado visa requires $1,000/month minimum pension income. Popular with North American retirees. Benefits include 20% discounts on utilities, transportation, and entertainment. Path to permanent residency.',
  'Dirección General de Migración y Extranjería Costa Rica 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'costa-rica' AND pw.pathway_slug = 'pensionado-visa';

-- COSTA RICA - Rentista Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 200, 400, 100, 400, 500, 2000, 30000, 30000, 30000, 30000,
  'Rentista visa requires $2,500/month passive income or $60,000 deposited in Costa Rican bank. Popular alternative to pensionado for those without traditional pensions.',
  'Dirección General de Migración y Extranjería Costa Rica 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'costa-rica' AND pw.pathway_slug = 'rentista-visa';

-- COSTA RICA - Investor Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 500, 1000, 200, 600, 2000, 8000, 150000, 150000, 150000, 150000,
  'Investor residency through $150,000 USD investment in Costa Rican enterprise. Tourism, real estate, and agriculture investments qualify. Popular due to stable democracy and natural beauty.',
  'Dirección General de Migración y Extranjería Costa Rica 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'costa-rica' AND pw.pathway_slug = 'investor-visa';

-- CUBA - Work Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'CUP', 500, 2000, 300, 1000, 200, 800, 20000, 28000, 36000, 44000,
  'Work authorization in Cuba is highly controlled and primarily for professionals invited by Cuban government or state enterprises. Process is bureaucratic with limited private sector options.',
  'Dirección de Inmigración y Extranjería Cuba 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'cuba' AND pw.pathway_slug = 'work-visa';

-- CUBA - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 100, 200, 100, 300, 5000, 7000, 9000, 11000,
  'Cuban universities accept foreign students, particularly in medicine. ELAM (Latin American Medical School) offers scholarships. Fees often subsidized through bilateral agreements. Apply through Cuban embassy.',
  'Dirección de Inmigración y Extranjería Cuba 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'cuba' AND pw.pathway_slug = 'student-visa';

-- CUBA - Temporary Residency
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 300, 800, 200, 600, 500, 2000, 15000, 20000, 25000, 30000,
  'Temporary residency for foreign nationals with ties to Cuba (family, business, or academic). Complex process due to US-Cuba relations. Limited options for most nationalities. Consult immigration specialist.',
  'Dirección de Inmigración y Extranjería Cuba 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'cuba' AND pw.pathway_slug = 'temporary-residency';

-- DOMINICAN REPUBLIC - Work Permit
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'DOP', 8000, 25000, 3000, 8000, 3000, 10000, 10000, 40000, 200000, 280000, 360000, 440000, 8000, 4000,
  'Work permit requires employer sponsorship. Foreign workers limited to 20% of company workforce. Fees in Dominican Pesos. Annual renewal required.',
  'Dirección General de Migración República Dominicana 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'dominican-republic' AND pw.pathway_slug = 'work-permit';

-- DOMINICAN REPUBLIC - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'DOP', 3000, 6000, 2000, 5000, 80000, 100000, 120000, 150000,
  'Student visa for accredited Dominican institutions. Fees in Dominican Pesos. Must show enrollment acceptance and financial support.',
  'Dirección General de Migración República Dominicana 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'dominican-republic' AND pw.pathway_slug = 'student-visa';

-- DOMINICAN REPUBLIC - Retirement Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 200, 400, 150, 500, 800, 3000, 15000, 20000, 25000, 30000,
  'Retirement residency requires $1,500/month pension income. 50% tax exemption on imported goods. Popular Caribbean retirement destination with warm climate and affordable living.',
  'Dirección General de Migración República Dominicana 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'dominican-republic' AND pw.pathway_slug = 'retirement-visa';

-- DOMINICAN REPUBLIC - Investor Residency
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 500, 1500, 200, 600, 2000, 8000, 200000, 200000, 200000, 200000,
  'Investor residency through $200,000 USD investment. Tourism real estate projects popular. Growing economy with significant US expat community. Benefits include duty-free imports for establishing business.',
  'Dirección General de Migración República Dominicana 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'dominican-republic' AND pw.pathway_slug = 'investor-residency';

-- ECUADOR - Work Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 230, 450, 100, 300, 100, 400, 500, 2000, 10000, 14000, 18000, 22000, 230, 115,
  'Ecuadorian temporary work visa (visa de trabajo). Employer sponsorship required. Ecuador uses USD as currency. Must apostille documents from home country. IESS (social security) enrollment required.',
  'Ministerio de Relaciones Exteriores Ecuador 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'ecuador' AND pw.pathway_slug = 'work-visa';

-- ECUADOR - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 50, 230, 100, 300, 5000, 7000, 9000, 11000,
  'Student visa for accredited Ecuadorian institutions. Low application fee. Must show enrollment acceptance and financial support. Ecuador dollarized economy makes budgeting straightforward.',
  'Ministerio de Relaciones Exteriores Ecuador 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'ecuador' AND pw.pathway_slug = 'student-visa';

-- ECUADOR - Pensioner Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 450, 450, 150, 500, 500, 2000, 9600, 12000, 14400, 16800,
  'Pensioner visa requires $800/month pension income. Very affordable cost of living. Popular with North American retirees. Cuenca known as top retirement city. Benefits include 50% discounts on transportation, utilities, and entertainment.',
  'Ministerio de Relaciones Exteriores Ecuador 2024', '2026-03-15', false, true, 'exact', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'ecuador' AND pw.pathway_slug = 'pensioner-visa';

-- ECUADOR - Professional Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 450, 450, 100, 300, 500, 2000, 10000, 14000, 18000, 22000,
  'Professional visa for qualified professionals. Credential recognition required for regulated professions. Ecuador uses USD so no currency conversion needed. Annual renewal required initially.',
  'Ministerio de Relaciones Exteriores Ecuador 2024', '2026-03-15', false, true, 'exact', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'ecuador' AND pw.pathway_slug = 'professional-visa';

-- JAMAICA - Work Permit
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'JMD', 30000, 100000, 10000, 30000, 10000, 30000, 50000, 200000, 1500000, 2000000, 2500000, 3000000, 30000, 15000,
  'Work permit requires employer sponsorship and proof that no suitable Jamaican worker is available. Annual fee structure applies. Ministry of Labour approval required.',
  'Ministry of National Security Jamaica 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'jamaica' AND pw.pathway_slug = 'work-permit';

-- JAMAICA - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'JMD', 10000, 20000, 5000, 15000, 600000, 800000, 1000000, 1200000,
  'Student visa for University of the West Indies and other accredited institutions. Fees in Jamaican dollars. Must demonstrate enrollment and financial support.',
  'Ministry of National Security Jamaica 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'jamaica' AND pw.pathway_slug = 'student-visa';

-- JAMAICA - Temporary Residence
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'JMD', 15000, 40000, 8000, 25000, 30000, 120000, 1200000, 1600000, 2000000, 2400000,
  'Temporary residence permit for long-stay visitors, retirees, and those with Jamaican family ties. Renewable annually. Growing retiree community drawn by climate and English language.',
  'Ministry of National Security Jamaica 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'jamaica' AND pw.pathway_slug = 'temporary-residence';

-- PANAMA - Work Permit
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 250, 800, 100, 300, 200, 600, 800, 3000, 8000, 11000, 14000, 17000, 250, 100,
  'Work permit requires employer sponsorship. Panama Canal Zone and international business hub. Labour market test may be required. Foreign worker quota restrictions apply.',
  'Servicio Nacional de Migración Panamá 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'panama' AND pw.pathway_slug = 'work-permit';

-- PANAMA - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 100, 250, 100, 300, 6000, 8000, 10000, 12000,
  'Student visa for accredited Panamanian institutions. Panama City growing as regional education hub. Must show enrollment and financial support.',
  'Servicio Nacional de Migración Panamá 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'panama' AND pw.pathway_slug = 'student-visa';

-- PANAMA - Pensionado Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 250, 400, 100, 400, 500, 2000, 12000, 15000, 18000, 21000,
  'Pensionado visa requires $1,000/month pension income. Considered one of the best retirement visas globally. Benefits include 50% off entertainment, 30% off transportation, 20% off medical, 15% off hospital care. No restrictions on staying abroad.',
  'Servicio Nacional de Migración Panamá 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'panama' AND pw.pathway_slug = 'pensionado-visa';

-- PANAMA - Friendly Nations Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 500, 1000, 100, 400, 1500, 5000, 5000, 7000, 9000, 11000,
  'Friendly Nations Visa for citizens of 50 specified countries (including US, EU). Requires economic ties to Panama (bank account, property, or employment). One of the fastest paths to Panamanian residency. 2-year temporary residency leading to permanent.',
  'Servicio Nacional de Migración Panamá 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'panama' AND pw.pathway_slug = 'friendly-nations-visa';

-- PANAMA - Investor Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 500, 1500, 100, 400, 2000, 8000, 300000, 300000, 300000, 300000,
  'Investor residency through $300,000 minimum investment in Panama. Real estate, agribusiness, or reforestation investments qualify. Attractive tax regime with territorial taxation.',
  'Servicio Nacional de Migración Panamá 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'panama' AND pw.pathway_slug = 'investor-visa';

-- PARAGUAY - Work Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'PYG', 300000, 800000, 100000, 300000, 100000, 400000, 3000000, 4000000, 5000000, 6000000, 300000, 150000,
  'Work visa for employment in Paraguay. Fees in Paraguayan Guarani. Employer sponsorship required. Paraguay has very low cost of living and simple immigration procedures.',
  'Dirección General de Migraciones Paraguay 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'paraguay' AND pw.pathway_slug = 'work-visa';

-- PARAGUAY - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'PYG', 100000, 300000, 80000, 250000, 3000000, 4000000, 5000000, 6000000,
  'Student visa for Paraguayan universities. Among the most affordable in South America. National university fees very low for foreign students.',
  'Dirección General de Migraciones Paraguay 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'paraguay' AND pw.pathway_slug = 'student-visa';

-- PARAGUAY - Rentista Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 100, 300, 100, 400, 500, 2000, 6000, 9000, 12000, 15000,
  'Rentista visa requires $500/month passive income. Very low income threshold by South American standards. Simple process with short processing time. Paraguay offers 0% tax on foreign income.',
  'Dirección General de Migraciones Paraguay 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'paraguay' AND pw.pathway_slug = 'rentista-visa';

-- PARAGUAY - Permanent Residency
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 200, 500, 150, 500, 500, 2000, 0, 0, 0, 0,
  'Paraguay offers one of the most accessible permanent residencies in the Americas. Can apply directly for permanent residency without temporary stage. Requirements: clean background, proof of income, and basic documentation. Popular with low-tax seekers.',
  'Dirección General de Migraciones Paraguay 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'paraguay' AND pw.pathway_slug = 'permanent-residency';

-- URUGUAY - Work Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, medical_fee_min, medical_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'UYU', 3000, 8000, 1500, 5000, 2000, 6000, 8000, 25000, 200000, 280000, 360000, 440000, 3000, 1500,
  'Work visa for Uruguay requires employer sponsorship. Fees in Uruguayan Pesos. Highly stable country with strong rule of law. Known as Switzerland of South America. BPS (social security) registration required.',
  'Dirección Nacional de Migración Uruguay 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'uruguay' AND pw.pathway_slug = 'work-visa';

-- URUGUAY - Student Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'UYU', 1500, 4000, 1500, 5000, 100000, 140000, 180000, 220000,
  'Student visa for Uruguayan universities. UdelaR (national university) is free for all students including foreigners. High quality public education system.',
  'Dirección Nacional de Migración Uruguay 2024', '2026-03-15', true, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'uruguay' AND pw.pathway_slug = 'student-visa';

-- URUGUAY - Rentista Visa
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 200, 500, 150, 500, 500, 2000, 18000, 24000, 30000, 36000,
  'Rentista visa requires ~$1,500/month income. Uruguay has very stable democracy, strong institutions, and high human development index. Tax benefits for new residents (foreign income exempt for 5 years). Path to permanent residency after 3 years.',
  'Dirección Nacional de Migración Uruguay 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'uruguay' AND pw.pathway_slug = 'rentista-visa';

-- URUGUAY - Investor Residency
INSERT INTO immigration_cost_profiles (pathway_id, currency_code, visa_fee_min, visa_fee_max, document_fee_min, document_fee_max, legal_fee_min, legal_fee_max, proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4, notes, source_label, last_verified_at, is_estimate, is_active, fee_model, verification_status)
SELECT pw.id, 'USD', 500, 1500, 200, 600, 2000, 8000, 500000, 500000, 500000, 500000,
  'Investor residency through qualifying investment in Uruguay. Real estate and agricultural investments popular. Uruguay offers territorial tax system with 5-year foreign income exemption for new residents.',
  'Dirección Nacional de Migración Uruguay 2024', '2026-03-15', false, true, 'range', 'editorial_reviewed'
FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id = pw.country_id
WHERE c.slug = 'uruguay' AND pw.pathway_slug = 'investor-residency';
