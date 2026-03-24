
/*
  # Add Africa & Asia Batch 3 Countries

  Adds 20 countries:

  ## Africa (7)
  - Algeria (DZ/DZA) - North Africa
  - Ethiopia (ET/ETH) - East Africa
  - Ghana (GH/GHA) - West Africa
  - Kenya (KE/KEN) - East Africa
  - Tanzania (TZ/TZA) - East Africa
  - Tunisia (TN/TUN) - North Africa
  - Zimbabwe (ZW/ZWE) - Southern Africa

  ## Asia (13)
  - Armenia (AM/ARM) - Western Asia / Caucasus
  - Azerbaijan (AZ/AZE) - Western Asia / Caucasus
  - Bangladesh (BD/BGD) - South Asia
  - Cambodia (KH/KHM) - Southeast Asia
  - Kazakhstan (KZ/KAZ) - Central Asia
  - Laos (LA/LAO) - Southeast Asia
  - Maldives (MV/MDV) - South Asia
  - Mongolia (MN/MNG) - East Asia
  - Myanmar (MM/MMR) - Southeast Asia
  - Nepal (NP/NPL) - South Asia
  - Pakistan (PK/PAK) - South Asia
  - Sri Lanka (LK/LKA) - South Asia
  - Uzbekistan (UZ/UZB) - Central Asia
*/

-- ============================================================
-- STEP 1: COUNTRIES
-- ============================================================
INSERT INTO immigration_cost_countries (name, slug, region, iso2, iso3, is_destination, is_passport_source, is_active, display_order)
VALUES
  ('Algeria',    'algeria',    'North Africa',     'DZ', 'DZA', true, true, true, 647),
  ('Ethiopia',   'ethiopia',   'East Africa',      'ET', 'ETH', true, true, true, 648),
  ('Ghana',      'ghana',      'West Africa',      'GH', 'GHA', true, true, true, 649),
  ('Kenya',      'kenya',      'East Africa',      'KE', 'KEN', true, true, true, 650),
  ('Tanzania',   'tanzania',   'East Africa',      'TZ', 'TZA', true, true, true, 651),
  ('Tunisia',    'tunisia',    'North Africa',     'TN', 'TUN', true, true, true, 652),
  ('Zimbabwe',   'zimbabwe',   'Southern Africa',  'ZW', 'ZWE', true, true, true, 653),
  ('Armenia',    'armenia',    'Western Asia',     'AM', 'ARM', true, true, true, 654),
  ('Azerbaijan', 'azerbaijan', 'Western Asia',     'AZ', 'AZE', true, true, true, 655),
  ('Bangladesh', 'bangladesh', 'South Asia',       'BD', 'BGD', true, true, true, 656),
  ('Cambodia',   'cambodia',   'Southeast Asia',   'KH', 'KHM', true, true, true, 657),
  ('Kazakhstan', 'kazakhstan', 'Central Asia',     'KZ', 'KAZ', true, true, true, 658),
  ('Laos',       'laos',       'Southeast Asia',   'LA', 'LAO', true, true, true, 659),
  ('Maldives',   'maldives',   'South Asia',       'MV', 'MDV', true, true, true, 660),
  ('Mongolia',   'mongolia',   'East Asia',        'MN', 'MNG', true, true, true, 661),
  ('Myanmar',    'myanmar',    'Southeast Asia',   'MM', 'MMR', true, true, true, 662),
  ('Nepal',      'nepal',      'South Asia',       'NP', 'NPL', true, true, true, 663),
  ('Pakistan',   'pakistan',   'South Asia',       'PK', 'PAK', true, true, true, 664),
  ('Sri Lanka',  'sri-lanka',  'South Asia',       'LK', 'LKA', true, true, true, 665),
  ('Uzbekistan', 'uzbekistan', 'Central Asia',     'UZ', 'UZB', true, true, true, 666)
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- STEP 2: PATHWAYS
-- ============================================================
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
-- ALGERIA
SELECT id,'Work Visa',         'work-visa',         'Work Visa',    'Employment authorization in Algeria.',                    true, true,  10 FROM immigration_cost_countries WHERE slug='algeria'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Algerian universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug='algeria'
UNION ALL SELECT id,'Business Visa',     'business-visa',     'Long-Stay',    'Long-stay visa for business activities.',                 true, false, 30 FROM immigration_cost_countries WHERE slug='algeria'
-- ETHIOPIA
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Ethiopia.',                   true, true,  10 FROM immigration_cost_countries WHERE slug='ethiopia'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Ethiopian universities.',                        true, true,  20 FROM immigration_cost_countries WHERE slug='ethiopia'
UNION ALL SELECT id,'Investment Permit', 'investment-permit', 'Investor',     'Residency through qualifying investment in Ethiopia.',     true, true,  30 FROM immigration_cost_countries WHERE slug='ethiopia'
-- GHANA
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Ghana.',                      true, true,  10 FROM immigration_cost_countries WHERE slug='ghana'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Ghanaian universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug='ghana'
UNION ALL SELECT id,'Investor Permit',   'investor-permit',   'Investor',     'Residency through qualifying investment.',                true, true,  30 FROM immigration_cost_countries WHERE slug='ghana'
UNION ALL SELECT id,'Resident Permit',   'resident-permit',   'Long-Stay',    'Long-term resident permit for various categories.',       true, false, 40 FROM immigration_cost_countries WHERE slug='ghana'
-- KENYA
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Kenya.',                      true, true,  10 FROM immigration_cost_countries WHERE slug='kenya'
UNION ALL SELECT id,'Student Pass',      'student-pass',      'Student',      'Study at Kenyan universities.',                           true, true,  20 FROM immigration_cost_countries WHERE slug='kenya'
UNION ALL SELECT id,'Investor Permit',   'investor-permit',   'Investor',     'Residency through qualifying investment in Kenya.',       true, true,  30 FROM immigration_cost_countries WHERE slug='kenya'
UNION ALL SELECT id,'Special Pass',      'special-pass',      'Long-Stay',    'Short-term stay for various purposes.',                   true, false, 40 FROM immigration_cost_countries WHERE slug='kenya'
-- TANZANIA
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Tanzania.',                   true, true,  10 FROM immigration_cost_countries WHERE slug='tanzania'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Tanzanian universities.',                        true, true,  20 FROM immigration_cost_countries WHERE slug='tanzania'
UNION ALL SELECT id,'Investor Permit',   'investor-permit',   'Investor',     'Residency through qualifying investment.',                true, true,  30 FROM immigration_cost_countries WHERE slug='tanzania'
-- TUNISIA
UNION ALL SELECT id,'Work Visa',         'work-visa',         'Work Visa',    'Employment authorization in Tunisia.',                    true, true,  10 FROM immigration_cost_countries WHERE slug='tunisia'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Tunisian universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug='tunisia'
UNION ALL SELECT id,'Retirement Visa',   'retirement-visa',   'Retirement',   'Long-stay residency for retirees.',                       true, true,  30 FROM immigration_cost_countries WHERE slug='tunisia'
UNION ALL SELECT id,'Digital Nomad Visa','digital-nomad-visa','Digital Nomad','Remote work visa for freelancers.',                       true, true,  40 FROM immigration_cost_countries WHERE slug='tunisia'
-- ZIMBABWE
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Zimbabwe.',                   true, true,  10 FROM immigration_cost_countries WHERE slug='zimbabwe'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Zimbabwean universities.',                       true, true,  20 FROM immigration_cost_countries WHERE slug='zimbabwe'
UNION ALL SELECT id,'Residence Permit',  'residence-permit',  'Long-Stay',    'Long-term residency for various categories.',             true, false, 30 FROM immigration_cost_countries WHERE slug='zimbabwe'
-- ARMENIA
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Armenia.',                    true, true,  10 FROM immigration_cost_countries WHERE slug='armenia'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Armenian universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug='armenia'
UNION ALL SELECT id,'Residence Permit',  'residence-permit',  'Long-Stay',    'Long-term residency for remote workers and investors.',   true, true,  30 FROM immigration_cost_countries WHERE slug='armenia'
UNION ALL SELECT id,'Investor Visa',     'investor-visa',     'Investor',     'Residency through qualifying investment.',                true, false, 40 FROM immigration_cost_countries WHERE slug='armenia'
-- AZERBAIJAN
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Azerbaijan.',                 true, true,  10 FROM immigration_cost_countries WHERE slug='azerbaijan'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Azerbaijani universities.',                      true, true,  20 FROM immigration_cost_countries WHERE slug='azerbaijan'
UNION ALL SELECT id,'Temporary Residence','temporary-residence','Long-Stay',  'Temporary residency for various purposes.',               true, true,  30 FROM immigration_cost_countries WHERE slug='azerbaijan'
-- BANGLADESH
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Bangladesh.',                 true, true,  10 FROM immigration_cost_countries WHERE slug='bangladesh'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Bangladeshi universities.',                      true, true,  20 FROM immigration_cost_countries WHERE slug='bangladesh'
UNION ALL SELECT id,'Investor Visa',     'investor-visa',     'Investor',     'Residency through qualifying investment.',                true, false, 30 FROM immigration_cost_countries WHERE slug='bangladesh'
-- CAMBODIA
UNION ALL SELECT id,'Business/Work Visa','business-work-visa','Work Visa',    'Business E-class visa for employment.',                   true, true,  10 FROM immigration_cost_countries WHERE slug='cambodia'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Cambodian universities.',                        true, true,  20 FROM immigration_cost_countries WHERE slug='cambodia'
UNION ALL SELECT id,'Retirement Visa',   'retirement-visa',   'Retirement',   'Long-stay visa for retirees aged 55+.',                   true, true,  30 FROM immigration_cost_countries WHERE slug='cambodia'
UNION ALL SELECT id,'Investor Visa',     'investor-visa',     'Investor',     'Residency through qualifying investment.',                true, true,  40 FROM immigration_cost_countries WHERE slug='cambodia'
-- KAZAKHSTAN
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Kazakhstan.',                 true, true,  10 FROM immigration_cost_countries WHERE slug='kazakhstan'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Kazakhstani universities.',                      true, true,  20 FROM immigration_cost_countries WHERE slug='kazakhstan'
UNION ALL SELECT id,'Digital Nomad Visa','digital-nomad-visa','Digital Nomad','Remote work visa for freelancers.',                       true, true,  30 FROM immigration_cost_countries WHERE slug='kazakhstan'
UNION ALL SELECT id,'Investor Visa',     'investor-visa',     'Investor',     'Residency through qualifying investment.',                true, false, 40 FROM immigration_cost_countries WHERE slug='kazakhstan'
-- LAOS
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Laos.',                       true, true,  10 FROM immigration_cost_countries WHERE slug='laos'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Lao universities.',                              true, true,  20 FROM immigration_cost_countries WHERE slug='laos'
UNION ALL SELECT id,'Long-Stay Visa',    'long-stay-visa',    'Long-Stay',    'Long-stay permit for remote workers and retirees.',       true, true,  30 FROM immigration_cost_countries WHERE slug='laos'
-- MALDIVES
UNION ALL SELECT id,'Work Visa',         'work-visa',         'Work Visa',    'Employment authorization in the Maldives.',               true, true,  10 FROM immigration_cost_countries WHERE slug='maldives'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study in the Maldives.',                                  true, false, 20 FROM immigration_cost_countries WHERE slug='maldives'
UNION ALL SELECT id,'Investor Residency','investor-residency','Investor',     'Residency through property or business investment.',      true, true,  30 FROM immigration_cost_countries WHERE slug='maldives'
-- MONGOLIA
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Mongolia.',                   true, true,  10 FROM immigration_cost_countries WHERE slug='mongolia'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Mongolian universities.',                        true, true,  20 FROM immigration_cost_countries WHERE slug='mongolia'
UNION ALL SELECT id,'Long-Term Residence','long-term-residence','Long-Stay',  'Long-term residency for investors and business people.',  true, false, 30 FROM immigration_cost_countries WHERE slug='mongolia'
-- MYANMAR
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Myanmar.',                    true, true,  10 FROM immigration_cost_countries WHERE slug='myanmar'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Myanmar universities.',                          true, true,  20 FROM immigration_cost_countries WHERE slug='myanmar'
UNION ALL SELECT id,'Business Visa',     'business-visa',     'Long-Stay',    'Long-stay business visa.',                                true, false, 30 FROM immigration_cost_countries WHERE slug='myanmar'
-- NEPAL
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Nepal.',                      true, true,  10 FROM immigration_cost_countries WHERE slug='nepal'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Nepalese universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug='nepal'
UNION ALL SELECT id,'Residence Permit',  'residence-permit',  'Long-Stay',    'Long-term residency for various categories.',             true, false, 30 FROM immigration_cost_countries WHERE slug='nepal'
-- PAKISTAN
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Pakistan.',                   true, true,  10 FROM immigration_cost_countries WHERE slug='pakistan'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Pakistani universities.',                        true, true,  20 FROM immigration_cost_countries WHERE slug='pakistan'
UNION ALL SELECT id,'Investor Visa',     'investor-visa',     'Investor',     'Residency through qualifying investment.',                true, false, 30 FROM immigration_cost_countries WHERE slug='pakistan'
-- SRI LANKA
UNION ALL SELECT id,'Employment Visa',   'employment-visa',   'Work Visa',    'Employment authorization in Sri Lanka.',                  true, true,  10 FROM immigration_cost_countries WHERE slug='sri-lanka'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Sri Lankan universities.',                       true, true,  20 FROM immigration_cost_countries WHERE slug='sri-lanka'
UNION ALL SELECT id,'Retirement Visa',   'retirement-visa',   'Retirement',   'Long-stay visa for retirees.',                            true, true,  30 FROM immigration_cost_countries WHERE slug='sri-lanka'
UNION ALL SELECT id,'Digital Nomad Visa','digital-nomad-visa','Digital Nomad','Remote work visa for freelancers.',                       true, true,  40 FROM immigration_cost_countries WHERE slug='sri-lanka'
-- UZBEKISTAN
UNION ALL SELECT id,'Work Permit',       'work-permit',       'Work Visa',    'Employment authorization in Uzbekistan.',                 true, true,  10 FROM immigration_cost_countries WHERE slug='uzbekistan'
UNION ALL SELECT id,'Student Visa',      'student-visa',      'Student',      'Study at Uzbekistani universities.',                      true, true,  20 FROM immigration_cost_countries WHERE slug='uzbekistan'
UNION ALL SELECT id,'Digital Nomad Visa','digital-nomad-visa','Digital Nomad','Remote work visa for digital nomads.',                    true, true,  30 FROM immigration_cost_countries WHERE slug='uzbekistan'
UNION ALL SELECT id,'Investor Visa',     'investor-visa',     'Investor',     'Residency through qualifying investment.',                true, false, 40 FROM immigration_cost_countries WHERE slug='uzbekistan';

-- ============================================================
-- STEP 3: COST PROFILES (via DO block for safety)
-- ============================================================
DO $$
DECLARE pw_id uuid;
BEGIN

  -- ALGERIA Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='algeria' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'DZD',5000,20000,3000,10000,3000,10000,15000,60000,300000,400000,500000,600000,5000,2500,'Work visa for Algeria requires employer sponsorship and ANEM (labour office) approval. Oil/gas, construction, and tech sectors. Hydrocarbons sector dominant. Algeria large market with growing tech scene.','Direction Générale de la Sûreté Nationale Algeria 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ALGERIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='algeria' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'DZD',3000,8000,2000,6000,150000,200000,250000,300000,'Student visa for Algerian universities. University of Algiers and other institutions. French widely used in higher education. Very affordable tuition for accepted international students.','Direction Générale de la Sûreté Nationale Algeria 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ALGERIA Business Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='algeria' AND pw.pathway_slug='business-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'DZD',8000,25000,3000,10000,20000,80000,400000,550000,700000,850000,'Long-stay business visa for Algeria. Requires formal invitation from Algerian company. Oil/gas and construction attract most foreign investment. Complex bureaucracy but large market opportunity.','Direction Générale de la Sûreté Nationale Algeria 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ETHIOPIA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='ethiopia' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'ETB',1000,5000,500,2000,500,2000,2000,10000,100000,140000,180000,220000,1000,500,'Work permit in Ethiopia requires employer sponsorship through EIC. Fast-growing economy with industrial park opportunities. NGO and development sector significant. Addis Ababa growing as regional business hub. Processing 3-4 weeks.','Ethiopian Investment Commission 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ETHIOPIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='ethiopia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'ETB',500,2000,500,1500,60000,80000,100000,120000,'Student visa for Addis Ababa University and other institutions. English widely used. Very affordable tuition and cost of living. Ethiopia fastest-growing economies in Africa.','Immigration and Citizenship Service Ethiopia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ETHIOPIA Investment Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='ethiopia' AND pw.pathway_slug='investment-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',500,2000,200,800,1000,5000,200000,200000,200000,200000,'Investment permit for foreign investors. Minimum USD 200,000 investment. Ethiopia offers tax holidays in priority sectors. Industrial parks with pre-built facilities. Addis Ababa AU headquarters attracts global organizations.','Ethiopian Investment Commission 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- GHANA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='ghana' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'GHS',500,2000,200,800,200,800,500,3000,15000,20000,25000,30000,500,250,'Work permit in Ghana. GIPC quota system applies. Employer sponsorship required. Ghana one of Africa''s most stable democracies. English speaking. Oil/gas, mining, finance, and tech sectors growing. Accra major West Africa hub.','Ghana Immigration Service 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- GHANA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='ghana' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'GHS',200,600,100,400,6000,8000,10000,12000,'Student visa for University of Ghana, KNUST and other institutions. English medium instruction. Affordable tuition. Ghana known as ''Gateway to Africa''. Growing university sector with international programs.','Ghana Immigration Service 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- GHANA Investor Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='ghana' AND pw.pathway_slug='investor-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',1000,3000,200,800,1000,5000,500000,500000,500000,500000,'Investor permit through GIPC. Minimum USD 500,000 investment for foreign investors (USD 200,000 with Ghanaian partner). Indefinite stay. Ghana Investment Promotion Centre manages applications. Mining and oil sector opportunities.','Ghana Investment Promotion Centre 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- GHANA Resident Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='ghana' AND pw.pathway_slug='resident-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'GHS',1000,4000,200,800,500,3000,20000,28000,36000,44000,'Indefinite/long-term resident permit in Ghana. Available for those married to Ghanaians, dependents, or after long residence. English speaking country. Good infrastructure and stable democratic governance.','Ghana Immigration Service 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- KENYA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kenya' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KES',20000,80000,3000,15000,3000,12000,10000,50000,600000,800000,1000000,1200000,20000,10000,'Work permit Class G (employer sponsorship) most common. Kenya one of Africa''s strongest economies. Nairobi is East Africa''s tech hub (Silicon Savannah). English widely spoken. 90-day processing typical.','Department of Immigration Services Kenya 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- KENYA Student Pass
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kenya' AND pw.pathway_slug='student-pass';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KES',5000,15000,2000,8000,200000,280000,360000,440000,'Student pass for University of Nairobi and other institutions. English instruction. Nairobi cosmopolitan city with growing university sector. Wildlife safaris and coastal beaches additional draw.','Department of Immigration Services Kenya 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- KENYA Investor Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kenya' AND pw.pathway_slug='investor-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',2000,5000,300,1000,1000,6000,100000,100000,100000,100000,'Class G Investment permit. Minimum KES 500,000 (~USD 3,500) investment historically, though Class G requires substantial business. Kenya Investment Authority incentives available. Tech, agriculture, tourism major sectors.','Kenya Investment Authority 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- KENYA Special Pass
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kenya' AND pw.pathway_slug='special-pass';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KES',5000,20000,2000,8000,150000,200000,250000,300000,'Special Pass for various short-term stays. 3-month renewable. Kenya eTA system introduced. Nairobi increasingly popular with digital nomads and expats for its infrastructure and climate.','Department of Immigration Services Kenya 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- TANZANIA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='tanzania' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'TZS',200000,600000,50000,200000,50000,200000,100000,500000,3000000,4000000,5000000,6000000,200000,100000,'Work permit Class A (employers) or Class B (employment) in Tanzania. Tourism, mining, and agriculture major sectors. Dar es Salaam and Zanzibar attract expats. Tanzanian English widely used.','Immigration Department Tanzania 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- TANZANIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='tanzania' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'TZS',50000,150000,30000,100000,1500000,2000000,2500000,3000000,'Student visa for University of Dar es Salaam and other institutions. Swahili and English used. Affordable costs. Tanzania famous for Kilimanjaro, Serengeti, and Zanzibar. Growing university sector.','Immigration Department Tanzania 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- TANZANIA Investor Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='tanzania' AND pw.pathway_slug='investor-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',1000,4000,200,800,1000,6000,500000,500000,500000,500000,'Investment permit through Tanzania Investment Centre (TIC). Minimum USD 500,000 investment. Priority sectors: tourism, manufacturing, agriculture. TIC provides one-stop facilitation.','Tanzania Investment Centre 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- TUNISIA Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='tunisia' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'TND',50,200,20,80,20,80,50,300,10000,14000,18000,22000,50,25,'Work visa for Tunisia requires employer and government approval. French and Arabic used in business. Mediterranean climate. IT, automotive, and tourism sectors growing. Close to European markets.','Ministry of Interior Tunisia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- TUNISIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='tunisia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'TND',30,100,15,50,4000,5500,7000,8500,'Student visa for Tunisian universities. French widely used. Affordable Mediterranean living. Tunis University and private institutions. Close to Europe and North Africa markets.','Ministry of Interior Tunisia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- TUNISIA Retirement Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='tunisia' AND pw.pathway_slug='retirement-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'TND',100,300,30,100,100,600,12000,16000,20000,24000,'Long-stay residency for retirees with qualifying income. Tunisia popular with French and European retirees. Mediterranean beaches, Roman ruins, and low costs. Must import pension income through Tunisian bank. French spoken widely.','Ministry of Interior Tunisia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- TUNISIA Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='tunisia' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'TND',100,300,30,100,100,500,15000,20000,25000,30000,'Digital nomad visa for remote workers. Tunisia among most affordable Mediterranean destinations. Fast internet in Tunis. Vibrant coworking scene. Visa requires proof of income from abroad. Close proximity to Europe.','Ministry of Interior Tunisia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ZIMBABWE Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='zimbabwe' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',300,1000,100,400,100,400,200,1500,10000,14000,18000,22000,300,150,'Work permit in Zimbabwe. USD widely used alongside ZWL. Employer sponsorship required. Tourism, mining, agriculture, and NGO sectors. Harare and Victoria Falls expat communities. English official language.','Department of Immigration Zimbabwe 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ZIMBABWE Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='zimbabwe' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',100,400,100,300,4000,5500,7000,8500,'Student visa for University of Zimbabwe and other institutions. English instruction. Affordable costs. Zimbabwe has high literacy rate. Victoria Falls and wildlife major attractions.','Department of Immigration Zimbabwe 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ZIMBABWE Residence Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='zimbabwe' AND pw.pathway_slug='residence-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',500,2000,100,400,300,2000,12000,16000,20000,24000,'Long-term residence permit for investors, retirees, and those with Zimbabwean connections. Temporary residence leads to permanent after qualifying period. Tourism and wildlife sector opportunities.','Department of Immigration Zimbabwe 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ARMENIA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='armenia' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'AMD',15000,50000,5000,20000,5000,20000,20000,80000,600000,800000,1000000,1200000,15000,8000,'Work permit in Armenia. Growing tech and startup hub in Yerevan. Many Russian-speaking IT professionals relocated here. Low cost of living. Citizens of 60+ countries can enter visa-free. Flat 20% income tax.','Police of the Republic of Armenia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ARMENIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='armenia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'AMD',10000,30000,5000,15000,400000,550000,700000,850000,'Student visa for Yerevan State University and other institutions. English and Russian programs available. Very affordable living costs. Yerevan vibrant city with ancient history and modern culture.','Police of the Republic of Armenia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ARMENIA Residence Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='armenia' AND pw.pathway_slug='residence-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'AMD',20000,60000,5000,20000,15000,60000,600000,800000,1000000,1200000,'Temporary residence permit for remote workers, investors, and business people. Armenia very popular with digital nomads since 2022. Simple residency process. Low cost of living. Mountain landscapes and ancient monasteries.','Police of the Republic of Armenia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ARMENIA Investor Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='armenia' AND pw.pathway_slug='investor-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'AMD',30000,100000,5000,20000,30000,120000,3000000,3000000,3000000,3000000,'Investor residency through qualifying investment. Armenia IT sector offers significant tax incentives (0% VAT, 0% profit tax for qualifying IT firms). Growing startup ecosystem. Yerevan affordable EU-adjacent hub.','Armenian Development Agency 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- AZERBAIJAN Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='azerbaijan' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'AZN',200,600,50,200,50,200,200,1000,8000,11000,14000,17000,200,100,'Work permit in Azerbaijan requires SSMU approval. Oil/gas sector dominant. Baku modern city with good infrastructure. ASAN service centers streamline bureaucracy. Some sectors restricted to Azerbaijani nationals.','State Migration Service Azerbaijan 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- AZERBAIJAN Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='azerbaijan' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'AZN',80,250,50,150,3000,4000,5000,6000,'Student visa for Baku State University and other institutions. Azerbaijani and Russian widely used; some English programs. Baku modern city on Caspian Sea. Growing higher education sector.','State Migration Service Azerbaijan 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- AZERBAIJAN Temporary Residence
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='azerbaijan' AND pw.pathway_slug='temporary-residence';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'AZN',150,500,50,200,100,600,6000,8000,10000,12000,'Temporary residence permit for various categories including business, investment, and family. ASAN e-visa and ASAN service centers efficient. Baku strategic location between Europe and Asia. F1 Grand Prix host city.','State Migration Service Azerbaijan 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- BANGLADESH Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bangladesh' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BDT',5000,20000,2000,8000,2000,8000,5000,25000,300000,400000,500000,600000,5000,2500,'Work permit in Bangladesh requires BIDA (Bangladesh Investment Development Authority) approval. Garment, textile, and tech sectors growing. Dhaka major South Asian business hub. Low cost of living.','Bangladesh Investment Development Authority 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- BANGLADESH Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bangladesh' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BDT',3000,10000,2000,6000,120000,160000,200000,250000,'Student visa for University of Dhaka and private institutions. English medium programs available. Very affordable tuition and costs. Dhaka rapidly developing tech and startup ecosystem.','Department of Immigration and Passports Bangladesh 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- BANGLADESH Investor Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bangladesh' AND pw.pathway_slug='investor-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',1000,4000,300,1000,1000,6000,250000,250000,250000,250000,'Investor visa through BIDA. Minimum USD 250,000 investment for Special Economic Zones. Bangladesh growing economy with demographic dividend. Garment/textile sector plus emerging tech/pharmaceutical sectors.','Bangladesh Investment Development Authority 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- CAMBODIA Business/Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cambodia' AND pw.pathway_slug='business-work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',35,300,50,200,30,150,100,600,5000,7000,9000,11000,35,35,'E-class (business) visa USD 35 on arrival, extendable for 1-year. No formal work permit for many roles. Cambodia very expat-friendly with simple visa system. Phnom Penh and Siem Reap growing expat hubs. USD widely used.','General Department of Immigration Cambodia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- CAMBODIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cambodia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',35,150,30,100,3000,4000,5000,6000,'Student visa for Royal University of Phnom Penh and private institutions. English widely used. Very affordable costs. Angkor Wat heritage and growing tourism industry. Simple visa extension system.','General Department of Immigration Cambodia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- CAMBODIA Retirement Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cambodia' AND pw.pathway_slug='retirement-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',35,300,50,200,100,500,15000,20000,25000,30000,'Retirement visa (E-class extension) for those aged 55+. Must show USD 1,500/month income or USD 60,000 deposit. Popular Southeast Asian retirement destination. Very affordable costs. Warm climate year-round.','General Department of Immigration Cambodia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- CAMBODIA Investor Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cambodia' AND pw.pathway_slug='investor-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',500,3000,100,400,500,3000,100000,100000,100000,100000,'Investor residency through CDC (Council for Development of Cambodia). Low tax environment (20% corporate). Special Economic Zones available. Phnom Penh growing as regional business hub. Property purchase available to foreigners (above ground floor).','Council for Development of Cambodia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- KAZAKHSTAN Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kazakhstan' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KZT',20000,80000,5000,20000,5000,20000,20000,100000,1200000,1600000,2000000,2400000,20000,10000,'Work permit in Kazakhstan. Oil/gas, mining, and financial sectors. Almaty and Nur-Sultan (Astana) major business cities. Futuristic Astana architecture. Growing tech hub. Visa-free for 60+ countries. Flat 10% income tax.','Ministry of Labour and Social Protection Kazakhstan 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- KAZAKHSTAN Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kazakhstan' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KZT',5000,20000,3000,12000,600000,800000,1000000,1200000,'Student visa for Nazarbayev University and other institutions. English and Russian programs available. Growing quality university sector. Affordable costs compared to Europe. Kazakhstan vast landscapes and nomadic culture.','Ministry of Internal Affairs Kazakhstan 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- KAZAKHSTAN Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kazakhstan' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KZT',10000,40000,3000,12000,10000,50000,1500000,2000000,2500000,3000000,'Digital nomad visa for remote workers. Kazakhstan growing popularity with digital nomads. Almaty vibrant cosmopolitan city. Low costs and good infrastructure. 10% flat income tax. Central Asia gateway.','Ministry of Digital Development Kazakhstan 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- KAZAKHSTAN Investor Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kazakhstan' AND pw.pathway_slug='investor-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',1000,5000,300,1000,1000,8000,300000,300000,300000,300000,'Investor residency through Astana International Financial Centre (AIFC) or standard FDI route. Kazakhstan offers investment incentives in priority sectors. AIFC modeled on London law. Strategic Central Asia location.','Kazakh Invest 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LAOS Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='laos' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'LAK',500000,2000000,100000,500000,100000,500000,500000,2000000,5000000,7000000,9000000,11000000,500000,250000,'Work permit in Laos requires employer sponsorship. Tourism, NGO, and hydropower sectors. Vientiane quiet capital with expat community. Luang Prabang UNESCO heritage city. Simple lifestyle. Annual permit renewal required.','Department of Labour Laos 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- LAOS Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='laos' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'LAK',200000,600000,100000,300000,2000000,3000000,4000000,5000000,'Student visa for National University of Laos. Very affordable living costs. Lao language dominant; some English programs. Luang Prabang temple city. Buddhist culture. Mekong River scenery.','Department of Immigration Laos 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- LAOS Long-Stay Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='laos' AND pw.pathway_slug='long-stay-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'LAK',400000,1500000,100000,400000,200000,1000000,6000000,8000000,10000000,12000000,'Long-stay permit for retirees and remote workers. Annual renewal. Very low cost of living. Laos peaceful and friendly. Popular with budget-conscious expats. Vientiane and Vang Vieng growing nomad communities.','Department of Immigration Laos 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- MALDIVES Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='maldives' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'MVR',1000,5000,500,2000,500,2000,1000,5000,30000,40000,50000,60000,1000,500,'Work visa for Maldives requires employer sponsorship. Tourism and hospitality sector dominant. Resort island jobs major employer of expats. High cost of living but tax-free income. English widely spoken in tourism.','Department of Immigration Maldives 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- MALDIVES Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='maldives' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'MVR',500,2000,300,1000,15000,20000,25000,30000,'Student visa for Maldives National University. Limited higher education options locally. English instruction available. Very high cost of living. Most students study abroad instead.','Department of Immigration Maldives 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- MALDIVES Investor Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='maldives' AND pw.pathway_slug='investor-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',5000,20000,500,2000,3000,15000,1000000,1000000,1000000,1000000,'Investor residency through tourism/resort investment. Maldives world''s premier luxury resort destination. Property investment on designated islands for foreigners. No income tax. Climate vulnerability is major consideration.','Maldives Inland Revenue Authority 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- MONGOLIA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='mongolia' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'MNT',50000,200000,20000,80000,20000,80000,50000,250000,1500000,2000000,2500000,3000000,50000,25000,'Work permit in Mongolia requires employer sponsorship. Mining sector dominant. Ulaanbaatar rapidly modernizing capital. Citizens of 45+ countries can enter visa-free for 30-90 days. Extreme continental climate.','General Authority for Border Protection Mongolia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- MONGOLIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='mongolia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'MNT',20000,80000,10000,40000,600000,800000,1000000,1200000,'Student visa for National University of Mongolia. English programs available. Affordable costs. Mongolian nomadic culture and Gobi Desert unique attractions. Ulaanbaatar growing student hub.','General Authority for Border Protection Mongolia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- MONGOLIA Long-Term Residence
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='mongolia' AND pw.pathway_slug='long-term-residence';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'MNT',80000,300000,20000,80000,40000,200000,1500000,2000000,2500000,3000000,'Long-term residence permit for investors and business people. Mongolia major mining sector with significant foreign investment. Gobi Desert copper and coal resources. Growing economy.','General Authority for Border Protection Mongolia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- MYANMAR Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='myanmar' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',100,500,50,200,50,200,200,1500,5000,7000,9000,11000,100,50,'Work permit in Myanmar. Note: political situation remains complex following 2021 military coup. For those who do work in Myanmar: manufacturing, tourism, and energy sectors. USD used alongside Kyat. Consult current advisories before applying.','Ministry of Labour Myanmar 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- MYANMAR Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='myanmar' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',50,200,30,100,2000,3000,4000,5000,'Student visa for University of Yangon and other institutions. English programs available. Very affordable costs. Note: current political situation requires careful consideration. Consult current travel advisories.','Ministry of Labour Myanmar 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- MYANMAR Business Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='myanmar' AND pw.pathway_slug='business-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',70,400,50,200,100,800,5000,7000,9000,11000,'Business visa (multiple entry) for Myanmar. Check current travel advisories before applying. Yangon previously major ASEAN business hub. Tourism and energy sectors historically significant. Political risk must be assessed.','Ministry of Labour Myanmar 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- NEPAL Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='nepal' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'NPR',5000,20000,2000,8000,2000,8000,5000,25000,200000,280000,360000,440000,5000,2500,'Work permit in Nepal requires Department of Labour approval. Tourism, trekking, NGO, and education sectors. Kathmandu Valley growing tech scene. Very affordable cost of living. Himalayas and Everest major draw.','Department of Immigration Nepal 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- NEPAL Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='nepal' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'NPR',3000,10000,2000,6000,100000,140000,180000,220000,'Student visa for Tribhuvan University and private institutions. English medium programs available. Very affordable tuition and costs. Kathmandu Valley rich cultural heritage. Trekking and mountaineering opportunities.','Department of Immigration Nepal 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- NEPAL Residence Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='nepal' AND pw.pathway_slug='residence-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'NPR',5000,20000,2000,8000,5000,25000,200000,280000,360000,440000,'Residential visa/permit for various categories. Non-resident Nepali (NRN) program for diaspora. Foreign investors and long-term residents. Nepal among world''s most affordable destinations. Yoga and meditation retreats popular.','Department of Immigration Nepal 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- PAKISTAN Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='pakistan' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'PKR',10000,50000,5000,20000,5000,20000,10000,60000,600000,800000,1000000,1200000,10000,5000,'Work permit (NOC + visa) for Pakistan. Employer sponsorship required. Ministry of Interior approval. Karachi, Lahore, and Islamabad main business cities. Tech and textile sectors growing. English widely used in business.','Directorate General of Immigration and Passports Pakistan 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- PAKISTAN Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='pakistan' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'PKR',5000,20000,3000,12000,250000,350000,450000,550000,'Student visa for University of Punjab, Lahore and other institutions. English medium instruction at major universities. Very affordable tuition. NUST and LUMS top-ranked. Growing tech education sector.','Directorate General of Immigration and Passports Pakistan 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- PAKISTAN Investor Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='pakistan' AND pw.pathway_slug='investor-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',1000,5000,300,1000,1000,8000,100000,100000,100000,100000,'Investor visa for Pakistan. RDA (Roshan Digital Account) allows overseas investment. SIFC (Special Investment Facilitation Council) streamlining foreign investment. Tech, agriculture, and energy sectors focus areas.','Board of Investment Pakistan 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SRI LANKA Employment Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='sri-lanka' AND pw.pathway_slug='employment-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'LKR',10000,40000,3000,12000,3000,12000,5000,30000,600000,800000,1000000,1200000,10000,5000,'Employment (E1) visa for Sri Lanka. Employer sponsorship required from BOI-registered company. Tourism, IT, and tea/apparel sectors. Colombo modern capital. English widely spoken. Affordable living with beautiful landscapes.','Department of Immigration and Emigration Sri Lanka 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- SRI LANKA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='sri-lanka' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'LKR',5000,20000,2000,8000,300000,400000,500000,600000,'Student visa for University of Colombo and other institutions. English widely used. Affordable costs. Buddhist temples, beaches, and tea highlands. Sri Lanka recovering and growing post-2022 economic crisis.','Department of Immigration and Emigration Sri Lanka 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- SRI LANKA Retirement Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='sri-lanka' AND pw.pathway_slug='retirement-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',200,500,100,400,200,1200,30000,40000,50000,60000,'Resident Guest visa for retirees. Requires USD 2,000/month income or deposit USD 30,000 in Sri Lanka bank. 2-year renewable permit. Beautiful beaches and hill country. Growing expat retirement community. English widely spoken.','Department of Immigration and Emigration Sri Lanka 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SRI LANKA Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='sri-lanka' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',100,300,100,300,100,800,24000,32000,40000,48000,'Digital nomad long-stay visa for remote workers. Sri Lanka popular with nomads for its affordability, English language, beaches, and culture. 1-year permit available. Colombo and Galle growing nomad hubs.','Department of Immigration and Emigration Sri Lanka 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- UZBEKISTAN Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='uzbekistan' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'UZS',200000,800000,50000,200000,50000,200000,200000,1000000,3000000,4000000,5000000,6000000,200000,100000,'Work permit in Uzbekistan. Employer sponsorship required. Tashkent modernizing rapidly. IT sector growing fast with government incentives. Tourism to Silk Road cities (Samarkand, Bukhara) growing. Citizens of 90+ countries visa-free.','Ministry of Employment Uzbekistan 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- UZBEKISTAN Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='uzbekistan' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'UZS',100000,400000,50000,150000,1500000,2000000,2500000,3000000,'Student visa for Tashkent State Technical University and other institutions. Uzbek and Russian programs; English growing. Very affordable tuition and costs. Silk Road heritage cities UNESCO World Heritage. Growing tech education.','Ministry of Higher Education Uzbekistan 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- UZBEKISTAN Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='uzbekistan' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'UZS',150000,600000,50000,200000,100000,500000,3000000,4000000,5000000,6000000,'Digital nomad permit for remote workers. Uzbekistan actively courting tech talent and digital nomads. IT Park Uzbekistan offers 0% tax for tech companies. Very affordable costs. Tashkent modern city with good infrastructure.','IT Park Uzbekistan 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- UZBEKISTAN Investor Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='uzbekistan' AND pw.pathway_slug='investor-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'USD',1000,5000,300,1000,1000,8000,300000,300000,300000,300000,'Investor residency through qualifying investment. Uzbekistan opened economy significantly post-2016. Special Economic Zones offer tax incentives. IT Park 0% tax. Tourism, agriculture, and energy sectors growing. Silk Road heritage tourism major opportunity.','Uzbekistan Investment Promotion Agency 2024','2026-03-15',false,true,'range','editorial_reviewed');

END $$;
