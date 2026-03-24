
/*
  # Add Europe & Middle East Batch 2 Countries (v3)

  Adds 16 countries: Bulgaria, Cyprus, Estonia, Georgia, Iceland, Latvia, Lithuania,
  Luxembourg, Malta, Serbia, Slovakia, Slovenia, Bahrain, Jordan, Kuwait, Oman.
*/

-- ============================================================
-- STEP 1: COUNTRIES
-- ============================================================
INSERT INTO immigration_cost_countries (name, slug, region, iso2, iso3, is_destination, is_passport_source, is_active, display_order)
VALUES
  ('Bulgaria',   'bulgaria',   'Eastern Europe',      'BG', 'BGR', true, true, true, 631),
  ('Cyprus',     'cyprus',     'Southern Europe',     'CY', 'CYP', true, true, true, 632),
  ('Estonia',    'estonia',    'Northern Europe',     'EE', 'EST', true, true, true, 633),
  ('Georgia',    'georgia',    'Eastern Europe',      'GE', 'GEO', true, true, true, 634),
  ('Iceland',    'iceland',    'Northern Europe',     'IS', 'ISL', true, true, true, 635),
  ('Latvia',     'latvia',     'Northern Europe',     'LV', 'LVA', true, true, true, 636),
  ('Lithuania',  'lithuania',  'Northern Europe',     'LT', 'LTU', true, true, true, 637),
  ('Luxembourg', 'luxembourg', 'Western Europe',      'LU', 'LUX', true, true, true, 638),
  ('Malta',      'malta',      'Southern Europe',     'MT', 'MLT', true, true, true, 639),
  ('Serbia',     'serbia',     'Southeastern Europe', 'RS', 'SRB', true, true, true, 640),
  ('Slovakia',   'slovakia',   'Central Europe',      'SK', 'SVK', true, true, true, 641),
  ('Slovenia',   'slovenia',   'Central Europe',      'SI', 'SVN', true, true, true, 642),
  ('Bahrain',    'bahrain',    'Middle East',         'BH', 'BHR', true, true, true, 643),
  ('Jordan',     'jordan',     'Middle East',         'JO', 'JOR', true, true, true, 644),
  ('Kuwait',     'kuwait',     'Middle East',         'KW', 'KWT', true, true, true, 645),
  ('Oman',       'oman',       'Middle East',         'OM', 'OMN', true, true, true, 646)
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- STEP 2: PATHWAYS
-- ============================================================
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_active, is_popular, display_order)
SELECT id, 'Work Visa',           'work-visa',           'Work Visa',       'EU Blue Card or national work permit.',                    true, true,  10 FROM immigration_cost_countries WHERE slug = 'bulgaria'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Bulgarian universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug = 'bulgaria'
UNION ALL SELECT id, 'Digital Nomad Visa', 'digital-nomad-visa', 'Digital Nomad',   'Remote work visa for digital nomads.',                     true, true,  30 FROM immigration_cost_countries WHERE slug = 'bulgaria'
UNION ALL SELECT id, 'Investor Residency', 'investor-residency', 'Investor',        'Residency through qualifying investment.',                 true, false, 40 FROM immigration_cost_countries WHERE slug = 'bulgaria'
UNION ALL SELECT id, 'Retirement Visa',    'retirement-visa',    'Retirement',      'Residency for financially independent retirees.',          true, false, 50 FROM immigration_cost_countries WHERE slug = 'bulgaria'
UNION ALL SELECT id, 'Work Permit',        'work-permit',        'Work Visa',       'Employment authorization in Cyprus.',                      true, true,  10 FROM immigration_cost_countries WHERE slug = 'cyprus'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Cypriot universities.',                           true, true,  20 FROM immigration_cost_countries WHERE slug = 'cyprus'
UNION ALL SELECT id, 'Category F Visa',    'category-f-visa',    'Retirement',      'Long-stay visa for financially independent persons.',      true, true,  30 FROM immigration_cost_countries WHERE slug = 'cyprus'
UNION ALL SELECT id, 'Digital Nomad Visa', 'digital-nomad-visa', 'Digital Nomad',   'Remote work visa for non-EU nationals.',                   true, true,  40 FROM immigration_cost_countries WHERE slug = 'cyprus'
UNION ALL SELECT id, 'Investor Residency', 'investor-residency', 'Investor',        'Fast-track permanent residency through investment.',       true, false, 50 FROM immigration_cost_countries WHERE slug = 'cyprus'
UNION ALL SELECT id, 'Work Visa',          'work-visa',          'Work Visa',       'Employment-based residence permit.',                       true, true,  10 FROM immigration_cost_countries WHERE slug = 'estonia'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Estonian universities.',                          true, true,  20 FROM immigration_cost_countries WHERE slug = 'estonia'
UNION ALL SELECT id, 'Digital Nomad Visa', 'digital-nomad-visa', 'Digital Nomad',   'World-first official digital nomad visa.',                 true, true,  30 FROM immigration_cost_countries WHERE slug = 'estonia'
UNION ALL SELECT id, 'Startup Visa',       'startup-visa',       'Investor',        'Residence permit for startup founders.',                   true, true,  40 FROM immigration_cost_countries WHERE slug = 'estonia'
UNION ALL SELECT id, 'Work Permit',        'work-permit',        'Work Visa',       'Employment authorization in Georgia.',                     true, true,  10 FROM immigration_cost_countries WHERE slug = 'georgia'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Georgian universities.',                          true, true,  20 FROM immigration_cost_countries WHERE slug = 'georgia'
UNION ALL SELECT id, 'Residence Permit',   'residence-permit',   'Long-Stay',       'Long-term residency for income earners or property.',      true, true,  30 FROM immigration_cost_countries WHERE slug = 'georgia'
UNION ALL SELECT id, 'Virtual Zone Status','virtual-zone-status','Digital Nomad',   '0% income tax for IT companies and remote workers.',       true, true,  40 FROM immigration_cost_countries WHERE slug = 'georgia'
UNION ALL SELECT id, 'Work Permit',        'work-permit',        'Work Visa',       'Employment-based residence permit.',                       true, true,  10 FROM immigration_cost_countries WHERE slug = 'iceland'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Icelandic universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug = 'iceland'
UNION ALL SELECT id, 'Long-Term Visa',     'long-term-visa',     'Long-Stay',       'Long-stay permit for remote workers and retirees.',        true, false, 30 FROM immigration_cost_countries WHERE slug = 'iceland'
UNION ALL SELECT id, 'Work Visa',          'work-visa',          'Work Visa',       'EU Blue Card or national work permit.',                    true, true,  10 FROM immigration_cost_countries WHERE slug = 'latvia'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Latvian universities.',                           true, true,  20 FROM immigration_cost_countries WHERE slug = 'latvia'
UNION ALL SELECT id, 'Investor Residency', 'investor-residency', 'Investor',        'Temporary residency through qualifying investment.',       true, true,  30 FROM immigration_cost_countries WHERE slug = 'latvia'
UNION ALL SELECT id, 'Startup Visa',       'startup-visa',       'Investor',        'Residence permit for startup founders.',                   true, false, 40 FROM immigration_cost_countries WHERE slug = 'latvia'
UNION ALL SELECT id, 'Work Visa',          'work-visa',          'Work Visa',       'EU Blue Card or national work permit.',                    true, true,  10 FROM immigration_cost_countries WHERE slug = 'lithuania'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Lithuanian universities.',                        true, true,  20 FROM immigration_cost_countries WHERE slug = 'lithuania'
UNION ALL SELECT id, 'Startup Visa',       'startup-visa',       'Investor',        'Residence permit for startup founders.',                   true, true,  30 FROM immigration_cost_countries WHERE slug = 'lithuania'
UNION ALL SELECT id, 'Digital Nomad Visa', 'digital-nomad-visa', 'Digital Nomad',   'Remote work permit for non-EU nationals.',                 true, false, 40 FROM immigration_cost_countries WHERE slug = 'lithuania'
UNION ALL SELECT id, 'Work Permit',        'work-permit',        'Work Visa',       'Employment authorization in Luxembourg.',                  true, true,  10 FROM immigration_cost_countries WHERE slug = 'luxembourg'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at the University of Luxembourg.',                   true, true,  20 FROM immigration_cost_countries WHERE slug = 'luxembourg'
UNION ALL SELECT id, 'EU Blue Card',       'eu-blue-card',       'Work Visa',       'EU Blue Card for highly skilled non-EU workers.',          true, true,  30 FROM immigration_cost_countries WHERE slug = 'luxembourg'
UNION ALL SELECT id, 'Investor Visa',      'investor-visa',      'Investor',        'Residency through qualifying business investment.',        true, false, 40 FROM immigration_cost_countries WHERE slug = 'luxembourg'
UNION ALL SELECT id, 'Work Permit',        'work-permit',        'Work Visa',       'Single Permit for employment in Malta.',                   true, true,  10 FROM immigration_cost_countries WHERE slug = 'malta'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at the University of Malta.',                        true, true,  20 FROM immigration_cost_countries WHERE slug = 'malta'
UNION ALL SELECT id, 'Digital Nomad Visa', 'digital-nomad-visa', 'Digital Nomad',   'Nomad Residence Permit for remote workers.',               true, true,  30 FROM immigration_cost_countries WHERE slug = 'malta'
UNION ALL SELECT id, 'MRVP Programme',     'mrvp-programme',     'Investor',        'Malta Residency by investment programme.',                 true, true,  40 FROM immigration_cost_countries WHERE slug = 'malta'
UNION ALL SELECT id, 'Work Permit',        'work-permit',        'Work Visa',       'Employment authorization in Serbia.',                      true, true,  10 FROM immigration_cost_countries WHERE slug = 'serbia'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Serbian universities.',                           true, true,  20 FROM immigration_cost_countries WHERE slug = 'serbia'
UNION ALL SELECT id, 'Temporary Residence','temporary-residence','Long-Stay',       'Long-term residency for remote workers and retirees.',     true, true,  30 FROM immigration_cost_countries WHERE slug = 'serbia'
UNION ALL SELECT id, 'Investor Visa',      'investor-visa',      'Investor',        'Residency through qualifying investment.',                 true, false, 40 FROM immigration_cost_countries WHERE slug = 'serbia'
UNION ALL SELECT id, 'Work Visa',          'work-visa',          'Work Visa',       'EU Blue Card or national work permit.',                    true, true,  10 FROM immigration_cost_countries WHERE slug = 'slovakia'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Slovak universities.',                            true, true,  20 FROM immigration_cost_countries WHERE slug = 'slovakia'
UNION ALL SELECT id, 'Long-Term Residence','long-term-residence','Long-Stay',       'Long-term residence permit for non-EU nationals.',         true, false, 30 FROM immigration_cost_countries WHERE slug = 'slovakia'
UNION ALL SELECT id, 'Work Permit',        'work-permit',        'Work Visa',       'Employment authorization in Slovenia.',                    true, true,  10 FROM immigration_cost_countries WHERE slug = 'slovenia'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Slovenian universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug = 'slovenia'
UNION ALL SELECT id, 'Digital Nomad Visa', 'digital-nomad-visa', 'Digital Nomad',   'Remote work permit for non-EU nationals.',                 true, true,  30 FROM immigration_cost_countries WHERE slug = 'slovenia'
UNION ALL SELECT id, 'EU Blue Card',       'eu-blue-card',       'Work Visa',       'EU Blue Card for highly skilled workers.',                 true, false, 40 FROM immigration_cost_countries WHERE slug = 'slovenia'
UNION ALL SELECT id, 'Work Visa',          'work-visa',          'Work Visa',       'Employment authorization in Bahrain.',                     true, true,  10 FROM immigration_cost_countries WHERE slug = 'bahrain'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Bahraini universities.',                          true, true,  20 FROM immigration_cost_countries WHERE slug = 'bahrain'
UNION ALL SELECT id, 'Golden Residency',   'golden-residency',   'Investor',        '10-year residency for investors and retirees.',            true, true,  30 FROM immigration_cost_countries WHERE slug = 'bahrain'
UNION ALL SELECT id, 'Retirement Visa',    'retirement-visa',    'Retirement',      'Long-term residency for retirees.',                        true, false, 40 FROM immigration_cost_countries WHERE slug = 'bahrain'
UNION ALL SELECT id, 'Work Permit',        'work-permit',        'Work Visa',       'Employment authorization in Jordan.',                      true, true,  10 FROM immigration_cost_countries WHERE slug = 'jordan'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Jordanian universities.',                         true, true,  20 FROM immigration_cost_countries WHERE slug = 'jordan'
UNION ALL SELECT id, 'Retirement Residency','retirement-residency','Retirement',    'Residency for retirees with qualifying income.',           true, true,  30 FROM immigration_cost_countries WHERE slug = 'jordan'
UNION ALL SELECT id, 'Investor Residency', 'investor-residency', 'Investor',        'Residency through qualifying investment.',                 true, false, 40 FROM immigration_cost_countries WHERE slug = 'jordan'
UNION ALL SELECT id, 'Work Visa',          'work-visa',          'Work Visa',       'Employment authorization via employer sponsorship.',       true, true,  10 FROM immigration_cost_countries WHERE slug = 'kuwait'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Kuwaiti universities.',                           true, true,  20 FROM immigration_cost_countries WHERE slug = 'kuwait'
UNION ALL SELECT id, 'Family Residency',   'family-residency',   'Long-Stay',       'Residency through family sponsorship.',                    true, false, 30 FROM immigration_cost_countries WHERE slug = 'kuwait'
UNION ALL SELECT id, 'Work Visa',          'work-visa',          'Work Visa',       'Employment authorization in Oman.',                        true, true,  10 FROM immigration_cost_countries WHERE slug = 'oman'
UNION ALL SELECT id, 'Student Visa',       'student-visa',       'Student',         'Study at Omani universities.',                             true, true,  20 FROM immigration_cost_countries WHERE slug = 'oman'
UNION ALL SELECT id, 'Investor Residency', 'investor-residency', 'Investor',        'Residency through qualifying investment in Oman.',         true, true,  30 FROM immigration_cost_countries WHERE slug = 'oman'
UNION ALL SELECT id, 'Retirement Visa',    'retirement-visa',    'Retirement',      'Long-term residency for retirees.',                        true, false, 40 FROM immigration_cost_countries WHERE slug = 'oman';

-- ============================================================
-- STEP 3: COST PROFILES
-- All inserts use explicit column lists matching the VALUES
-- ============================================================

-- Helper: define a DO block to insert all profiles using consistent column sets

DO $$
DECLARE
  pw_id uuid;
BEGIN

  -- BULGARIA Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bulgaria' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BGN',200,600,100,300,100,400,500,2000,6000,8000,10000,12000,200,100,'EU Blue Card or national work permit in Bulgaria. One of the most affordable EU destinations. Requires job offer above national average salary. Flat 10% income tax.','Migration Directorate Bulgaria 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- BULGARIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bulgaria' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BGN',100,250,80,300,6000,8000,10000,12000,'Most affordable EU study destination. English-taught programs available. Sofia University attracts international students.','Migration Directorate Bulgaria 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- BULGARIA Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bulgaria' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BGN',150,300,100,300,300,1000,12000,16000,20000,24000,'Bulgaria Type D digital nomad visa. 1-year renewable residency. Very low cost of living vs Western Europe. Sofia growing tech hub. Flat 10% income tax.','Migration Directorate Bulgaria 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- BULGARIA Investor Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bulgaria' AND pw.pathway_slug='investor-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',1000,3000,200,600,3000,10000,511292,511292,511292,511292,'Investor residency through BGN 1,000,000 (~EUR 511,292) in government bonds or business. EU member state. Path to citizenship.','Migration Directorate Bulgaria 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- BULGARIA Retirement Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bulgaria' AND pw.pathway_slug='retirement-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BGN',150,400,100,300,300,1500,12000,16000,20000,24000,'Long-stay retirement visa for financially independent persons. Very affordable EU country. Black Sea coast popular with retirees. Warm summers and ski resorts.','Migration Directorate Bulgaria 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- CYPRUS Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cyprus' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',400,1000,150,400,200,600,800,3000,15000,20000,25000,30000,400,200,'Work permit for non-EU nationals. Employer must demonstrate no suitable EU candidate. Cyprus EU member with English widely spoken. Tax incentives for new residents.','Civil Registry and Migration Department Cyprus 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- CYPRUS Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cyprus' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',200,400,150,400,8000,11000,14000,17000,'Student visa for Cypriot universities. English-language programs widely available. Mediterranean climate and EU member. University of Cyprus accepts international students.','Civil Registry and Migration Department Cyprus 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- CYPRUS Category F Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cyprus' AND pw.pathway_slug='category-f-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',500,1000,200,600,1000,4000,30000,40000,50000,60000,'Category F (financially independent persons) visa. Requires EUR 2,500/month income and EUR 30,000 in Cypriot bank. Popular EU residency option. 60 days processing time.','Civil Registry and Migration Department Cyprus 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- CYPRUS Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cyprus' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',400,700,150,400,500,2000,43200,54000,64800,75600,'Digital nomad visa for non-EU remote workers. Requires EUR 3,500/month minimum income. 1-year renewable permit. English widely spoken EU country.','Civil Registry and Migration Department Cyprus 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- CYPRUS Investor Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='cyprus' AND pw.pathway_slug='investor-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',2000,5000,300,800,5000,20000,300000,300000,300000,300000,'Fast-track permanent residency through EUR 300,000 real estate investment. Processing in ~2 months. Permanent residency for life with annual visit requirement.','Civil Registry and Migration Department Cyprus 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- ESTONIA Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='estonia' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',100,290,100,300,100,400,500,2000,14400,19200,24000,28800,100,65,'Employment-based temporary residence permit. State fee EUR 100. Must have employment contract above Estonian average salary. EU Blue Card available for high earners.','Police and Border Guard Board Estonia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- ESTONIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='estonia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',80,160,80,250,6000,8000,10000,12000,'Affordable EU study with many English-language programs. Tallinn medieval old town and growing tech startup scene make it a unique study destination.','Police and Border Guard Board Estonia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- ESTONIA Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='estonia' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',100,100,80,250,200,800,43200,57600,72000,86400,'World-first official digital nomad visa (D-type). 1-year permit requiring EUR 3,504/month income. Apply at Estonian embassies. e-Residency available separately.','Police and Border Guard Board Estonia 2024','2026-03-15',false,true,'exact','editorial_reviewed');

  -- ESTONIA Startup Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='estonia' AND pw.pathway_slug='startup-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',200,400,100,300,500,3000,16800,22400,28000,33600,'Startup visa for founders of innovative companies. Must be endorsed by accredited organization. EUR 1,400/month minimum income. Estonia world leader in startups per capita.','Enterprise Estonia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- GEORGIA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='georgia' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'GEL',400,1000,100,400,100,400,12000,16000,20000,24000,400,200,'Work permit in Georgia. Very simple process. Citizens of 95+ countries can enter visa-free for 365 days then apply for residence. Very business-friendly with flat 20% income tax.','Public Service Hall Georgia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- GEORGIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='georgia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'GEL',200,500,100,300,5000,7000,9000,11000,'Student visa for Georgian universities. Very low tuition fees. Tbilisi emerging as affordable study destination. Free university education available through competitive exams.','Public Service Hall Georgia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- GEORGIA Residence Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='georgia' AND pw.pathway_slug='residence-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'GEL',300,800,100,400,200,1000,12000,16000,20000,24000,'Long-term residence permit for property owners, income earners, or investors. Property investment GEL 100,000+ qualifies. One of the most accessible residency programs globally.','Public Service Hall Georgia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- GEORGIA Virtual Zone Status
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='georgia' AND pw.pathway_slug='virtual-zone-status';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'GEL',500,1500,100,300,500,2000,12000,16000,20000,24000,'Virtual Zone Person (VZP) status for IT companies. 0% corporate tax on internationally earned income. 0% dividend tax. Popular with tech entrepreneurs and digital nomads.','Revenue Service of Georgia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ICELAND Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='iceland' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'ISK',15000,50000,10000,30000,10000,30000,50000,150000,2500000,3500000,4500000,5500000,15000,8000,'Residence permit based on employment in Iceland. Part of EEA. Very high cost of living but exceptional wages and quality of life. Must have secured employment before applying.','Directorate of Immigration Iceland 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ICELAND Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='iceland' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'ISK',10000,25000,8000,25000,1800000,2400000,3000000,3600000,'Student residence permit for Icelandic universities. University of Iceland in Reykjavik. Very high cost of living. English-taught programs available. Unique natural environment.','Directorate of Immigration Iceland 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- ICELAND Long-Term Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='iceland' AND pw.pathway_slug='long-term-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'ISK',15000,40000,8000,25000,30000,100000,3000000,4000000,5000000,6000000,'Long-stay residence permit for financially independent persons. Very high income threshold. Iceland part of Schengen area. Clean air, unique landscapes, high quality of life.','Directorate of Immigration Iceland 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- LATVIA Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='latvia' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',100,300,100,300,100,400,400,1800,10000,14000,18000,22000,100,65,'Work permit in Latvia. EU Blue Card available for high earners. Riga growing as Baltic hub with lower costs than Tallinn or Vilnius.','Office of Citizenship and Migration Affairs Latvia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LATVIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='latvia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',80,200,80,250,5000,7000,9000,11000,'Affordable EU study destination. University of Latvia and Riga Technical University popular. English-taught programs available.','Office of Citizenship and Migration Affairs Latvia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LATVIA Investor Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='latvia' AND pw.pathway_slug='investor-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',1000,3000,200,600,2000,8000,250000,250000,250000,250000,'Investor residency through EUR 250,000 real estate in Riga or EUR 50,000 in Latvian company capital. Temporary permit leads to permanent residency. EU Schengen access.','Office of Citizenship and Migration Affairs Latvia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LATVIA Startup Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='latvia' AND pw.pathway_slug='startup-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',200,500,100,300,500,2500,15000,20000,25000,30000,'Startup visa for innovative business founders. Must register company in Latvia and demonstrate viable business plan. 1-year initial permit renewable.','Investment and Development Agency of Latvia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LITHUANIA Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='lithuania' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',86,240,100,300,100,400,400,1800,10800,14400,18000,21600,86,43,'Work permit in Lithuania. National fee EUR 86. EU Blue Card for high earners. Vilnius growing as Baltic tech hub with competitive salaries and lower cost than Western EU.','Migration Department Lithuania 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LITHUANIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='lithuania' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',80,160,80,250,5000,7000,9000,11000,'Vilnius University and Kaunas University of Technology popular. English-taught programs available. Among the more affordable EU study destinations.','Migration Department Lithuania 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LITHUANIA Startup Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='lithuania' AND pw.pathway_slug='startup-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',200,500,100,300,500,2500,16800,22400,28000,33600,'Startup visa through Business Lithuania. Must pitch to national committee. EUR 1,400/month minimum income. Lithuania one of fastest-growing startup ecosystems in Baltics.','Business Lithuania 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LITHUANIA Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='lithuania' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',120,240,100,300,300,1200,18000,24000,30000,36000,'Digital nomad residence permit for remote workers. Must demonstrate stable income from foreign sources. 1-year permit renewable. Vilnius affordable vs other EU capitals.','Migration Department Lithuania 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LUXEMBOURG Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='luxembourg' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',75,300,100,300,150,500,1000,4000,36000,48000,60000,72000,75,38,'Work permit in Luxembourg. Highest average salary in EU. Very high cost of living but exceptional quality of life. Multilingual environment. EU Blue Card widely used.','Ministry of Foreign and European Affairs Luxembourg 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LUXEMBOURG Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='luxembourg' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',75,200,100,400,15000,20000,25000,30000,'University of Luxembourg with trilingual instruction (EN/FR/DE). Very high cost of living. Strong EU job market access post-graduation.','Ministry of Foreign and European Affairs Luxembourg 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LUXEMBOURG EU Blue Card
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='luxembourg' AND pw.pathway_slug='eu-blue-card';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',75,150,100,300,500,2000,36000,48000,60000,72000,'EU Blue Card for highly qualified non-EU workers. Requires annual salary EUR 78,836+. Luxembourg has highest Blue Card salary threshold in EU. Fast-track to EU permanent residence.','Ministry of Foreign and European Affairs Luxembourg 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- LUXEMBOURG Investor Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='luxembourg' AND pw.pathway_slug='investor-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',500,2000,200,600,3000,12000,500000,500000,500000,500000,'Investor residency through qualifying investment. Luxembourg is EU financial hub with advantageous fund structures and favorable tax treaty network.','Ministry of Foreign and European Affairs Luxembourg 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- MALTA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='malta' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',280,800,100,350,150,500,600,2500,15000,20000,25000,30000,280,140,'Single Permit for employment in Malta. English-speaking EU member. iGaming, finance, and tech sectors major employers. 5% flat tax available for qualifying residents.','Identity Malta Agency 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- MALTA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='malta' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',150,300,100,400,8000,11000,14000,17000,'University of Malta and private institutions. English the primary language. Mediterranean location. English language schools also popular. EU student rights after graduation.','Identity Malta Agency 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- MALTA Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='malta' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',300,300,100,400,300,1200,42000,56000,70000,84000,'Nomad Residence Permit. EUR 300 application fee. Must earn EUR 2,700/month net. 1-year renewable permit. English-speaking EU country with Mediterranean lifestyle.','Identity Malta Agency 2024','2026-03-15',false,true,'exact','editorial_reviewed');

  -- MALTA MRVP Programme
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='malta' AND pw.pathway_slug='mrvp-programme';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',40000,68000,300,800,5000,20000,500000,500000,500000,500000,'MRVP: Government contribution EUR 30,000 (south/Gozo) or EUR 58,000 (north). Plus 5-year property rental EUR 10,000+/year or purchase EUR 300,000+. Non-dom tax regime. Schengen access.','Identity Malta Agency 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SERBIA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='serbia' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'RSD',5000,15000,3000,8000,3000,10000,10000,40000,300000,400000,500000,600000,5000,2500,'Work permit in Serbia. Very affordable cost of living. Belgrade growing as tech hub. Non-EU country. Flat income tax of 10%. Employers can sponsor foreign workers.','Ministry of Interior Serbia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- SERBIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='serbia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'RSD',2000,6000,2000,6000,120000,160000,200000,250000,'University of Belgrade one of oldest in the region. Very affordable tuition. Belgrade vibrant student city with low cost of living.','Ministry of Interior Serbia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- SERBIA Temporary Residence
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='serbia' AND pw.pathway_slug='temporary-residence';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'RSD',3000,8000,2000,6000,8000,30000,200000,280000,360000,440000,'Temporary residence permit for remote workers, retirees, and those with Serbian ties. Simple process. Serbia popular with digital nomads. Very low cost of living and vibrant Belgrade scene.','Ministry of Interior Serbia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- SERBIA Investor Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='serbia' AND pw.pathway_slug='investor-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',500,2000,200,600,1500,6000,200000,200000,200000,200000,'Investor residency through business investment in Serbia. Low corporate tax (15%) and attractive investment incentives. Serbia offers subsidies for FDI.','Development Agency of Serbia 2024','2026-03-15',true,true,'range','editorial_reviewed');

  -- SLOVAKIA Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='slovakia' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',165,400,100,300,100,400,500,2000,10800,14400,18000,21600,165,82,'Work permit in Slovakia. EU Blue Card for high earners. Central European location. Bratislava growing business hub close to Vienna and Budapest.','Bureau of Border and Alien Police Slovakia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SLOVAKIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='slovakia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',80,165,80,250,5000,7000,9000,11000,'Comenius University and Slovak Technical University popular. Affordable living costs. Slovak language required for most programs; some English programs available.','Bureau of Border and Alien Police Slovakia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SLOVAKIA Long-Term Residence
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='slovakia' AND pw.pathway_slug='long-term-residence';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',165,330,100,300,400,1800,8400,11200,14000,16800,'Long-term residence permit for non-EU nationals. Requires proof of accommodation, income, and purpose of stay. Slovakia EU member with Schengen access. Path to permanent residence after 5 years.','Bureau of Border and Alien Police Slovakia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SLOVENIA Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='slovenia' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',200,500,100,300,100,400,500,2000,14400,19200,24000,28800,200,100,'Work permit in Slovenia. EU Blue Card for highly qualified workers. Ljubljana one of most livable European capitals. Very high quality of life with Alpine and Mediterranean access.','Administrative Unit Slovenia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SLOVENIA Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='slovenia' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',100,200,80,250,7000,10000,13000,16000,'University of Ljubljana top-ranked. English programs available. Affordable costs vs Western Europe. Outdoor lifestyle with Alps and Adriatic coast nearby.','Administrative Unit Slovenia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SLOVENIA Digital Nomad Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='slovenia' AND pw.pathway_slug='digital-nomad-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',200,400,100,300,400,1500,32400,43200,54000,64800,'Digital nomad permit for non-EU remote workers. Requires EUR 2,700/month income. 1-year permit. Ljubljana affordable, compact, and beautiful.','Administrative Unit Slovenia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- SLOVENIA EU Blue Card
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='slovenia' AND pw.pathway_slug='eu-blue-card';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'EUR',200,400,100,300,500,2000,18000,24000,30000,36000,'EU Blue Card for highly qualified non-EU workers. Annual salary threshold approx EUR 1.5x national average. Transferable across EU after 18 months.','Administrative Unit Slovenia 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- BAHRAIN Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bahrain' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BHD',50,200,20,80,30,100,100,500,3000,4000,5000,6000,50,25,'Work visa requires employer sponsorship. Bahrain most liberal Gulf state. No personal income tax. Financial services, tourism, and oil sectors major employers. LMRA manages permits.','Labour Market Regulatory Authority Bahrain 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- BAHRAIN Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bahrain' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BHD',30,80,20,60,3000,4000,5000,6000,'Student visa for Bahraini universities. University of Bahrain and private institutions. English widely used in education. Most affordable Gulf state for students.','Nationality, Passports and Residence Affairs Bahrain 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- BAHRAIN Golden Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bahrain' AND pw.pathway_slug='golden-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BHD',1000,3000,100,300,500,3000,200000,200000,200000,200000,'Golden Residency for 10 years for investors, retirees, and property owners. Real estate investment BHD 200,000+ qualifies. No income tax. Bahrain most open Gulf economy.','Nationality, Passports and Residence Affairs Bahrain 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- BAHRAIN Retirement Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='bahrain' AND pw.pathway_slug='retirement-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'BHD',500,1500,80,250,200,1500,36000,48000,60000,72000,'Retirement residency for those aged 50+. Requires BHD 500/month income or lump sum deposit. No income tax. Liberal social environment vs other Gulf states. 5-year renewable permit.','Nationality, Passports and Residence Affairs Bahrain 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- JORDAN Work Permit
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='jordan' AND pw.pathway_slug='work-permit';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'JOD',100,400,30,100,30,100,150,600,5000,7000,9000,11000,100,50,'Work permit in Jordan requires employer sponsorship. Ministry of Labour approval needed. Jordan relatively stable Middle Eastern country. Tech and NGO sectors significant employers.','Ministry of Labour Jordan 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- JORDAN Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='jordan' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'JOD',30,80,20,60,4000,5500,7000,8500,'University of Jordan and Jordan University of Science and Technology top-ranked. Affordable tuition and living costs. English widely used in higher education.','Ministry of Interior Jordan 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- JORDAN Retirement Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='jordan' AND pw.pathway_slug='retirement-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'JOD',150,400,50,150,100,600,18000,24000,30000,36000,'Retirement residency for those aged 60+ with qualifying income. Must deposit JOD 30,000 in Jordanian bank or show monthly pension JOD 1,500+. Jordan historically welcoming to expats.','Ministry of Interior Jordan 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- JORDAN Investor Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='jordan' AND pw.pathway_slug='investor-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'JOD',500,2000,100,300,500,3000,70000,70000,70000,70000,'Investor residency through JOD 70,000+ investment. Property, business, or government bonds qualify. Jordan has duty-free trade agreements with US and EU. Growing tech sector.','Jordan Investment Commission 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- KUWAIT Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kuwait' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KWD',50,200,20,80,20,80,50,300,5000,7000,9000,11000,50,25,'Work visa (iqama) requires employer sponsorship through kafala system. No personal income tax. Oil sector, healthcare, and construction major employers. Must have job offer before arrival.','General Directorate of Residency Affairs Kuwait 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- KUWAIT Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kuwait' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KWD',30,80,15,50,5000,7000,9000,11000,'Student visa for Kuwait University and private institutions. Must have admission letter. English used in many programs. High cost of living offset by subsidized student housing.','Ministry of Interior Kuwait 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- KUWAIT Family Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='kuwait' AND pw.pathway_slug='family-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'KWD',100,300,20,80,100,500,12000,15000,18000,21000,'Family residency for dependents of Kuwait work visa holders. Sponsor must meet minimum salary threshold. Annual renewal required. No income tax. Limited path to permanent residency.','General Directorate of Residency Affairs Kuwait 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- OMAN Work Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='oman' AND pw.pathway_slug='work-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,medical_fee_min,medical_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,spouse_fee,child_fee,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'OMR',50,200,15,60,20,80,50,300,5000,7000,9000,11000,50,25,'Work visa in Oman requires employer sponsorship. No personal income tax. Oil and gas, tourism, and logistics sectors. Muscat growing as regional business hub.','Royal Oman Police 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- OMAN Student Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='oman' AND pw.pathway_slug='student-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'OMR',25,70,15,50,4000,6000,8000,10000,'Student visa for Sultan Qaboos University and private institutions. English widely used. Oman safe and welcoming. Affordable costs compared to UAE and Qatar.','Royal Oman Police 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- OMAN Investor Residency
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='oman' AND pw.pathway_slug='investor-residency';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'OMR',500,2000,100,300,500,3000,250000,250000,250000,250000,'Investor residency through OMR 250,000+ property investment in Integrated Tourism Complexes (ITCs). 10-year renewable residency. Oman Vision 2040 driving economic diversification.','Ministry of Commerce, Industry and Investment Promotion Oman 2024','2026-03-15',false,true,'range','editorial_reviewed');

  -- OMAN Retirement Visa
  SELECT pw.id INTO pw_id FROM immigration_cost_pathways pw JOIN immigration_cost_countries c ON c.id=pw.country_id WHERE c.slug='oman' AND pw.pathway_slug='retirement-visa';
  INSERT INTO immigration_cost_profiles (pathway_id,currency_code,visa_fee_min,visa_fee_max,document_fee_min,document_fee_max,legal_fee_min,legal_fee_max,proof_of_funds_single,proof_of_funds_couple,proof_of_funds_family_3,proof_of_funds_family_4,notes,source_label,last_verified_at,is_estimate,is_active,fee_model,verification_status)
  VALUES (pw_id,'OMR',300,1000,50,150,200,1500,24000,32000,40000,48000,'Retirement residency for those aged 55+ investing OMR 250,000 in property or depositing in Omani bank. No income tax. Warm climate and growing expat retirement community.','Royal Oman Police 2024','2026-03-15',false,true,'range','editorial_reviewed');

END $$;
