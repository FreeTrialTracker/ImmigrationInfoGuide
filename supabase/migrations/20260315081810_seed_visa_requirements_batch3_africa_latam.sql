/*
  # Visa Requirements Batch 3

  Adds visa requirement records for 8 countries:
  South Africa, Nigeria, Egypt, Morocco, Argentina, Colombia, Chile, Peru
*/

INSERT INTO visa_requirements (
  country, country_slug, region, visa_type, visa_category,
  difficulty, min_age, max_age, min_income_usd, min_savings_usd,
  language_required, health_insurance_required, criminal_check_required,
  medical_exam_required, job_offer_required, sponsor_required, notes
) VALUES

('South Africa', 'south-africa', 'Africa', 'Critical Skills Work Visa', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'English B2',
 false, true, true, false, false,
 'Occupation must be on the Critical Skills list. Evaluation from relevant professional body required. DHA processes. Medical exam and radiological report required. 3-5 year validity.'),

('South Africa', 'south-africa', 'Africa', 'General Work Visa', 'work',
 'hard', NULL, NULL, NULL, NULL,
 'English B2',
 false, true, true, true, true,
 'LMTD from DOEL required. Proof no suitable South African available. DHA processing notorious for backlogs. Employer-sponsored.'),

('South Africa', 'south-africa', 'Africa', 'Retirement Visa', 'retirement',
 'easy', NULL, NULL, 24000, NULL,
 'English B2',
 true, true, true, false, false,
 'Net monthly income of ZAR 37,000 approx USD 2,000 from pension or annuity required. Medical and radiological exam required. DHA processes. 4-year validity.'),

('South Africa', 'south-africa', 'Africa', 'Study Visa', 'study',
 'easy', NULL, NULL, NULL, 8000,
 'English B2',
 false, false, true, false, false,
 'Acceptance from South African institution required. Proof of financial means for full duration. Medical and radiological certificates required. DHA processes.'),

('South Africa', 'south-africa', 'Africa', 'Permanent Residence Permit', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'English B2',
 false, true, true, false, false,
 'Pathways: 5 years critical skills, spouse of SA citizen, business investment. DHA severely backlogged; realistic timeline 2-4 years. Radiological certificate required.'),

('Nigeria', 'nigeria', 'Africa', 'STR Visa (Subject to Regularisation)', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'English B2',
 false, true, true, true, true,
 'Employer applies for expatriate quota from Federal Ministry of Interior first. STR visa from embassy. NIS issues CERPAC after medical exam and biometrics.'),

('Nigeria', 'nigeria', 'Africa', 'CERPAC (Combined Expatriate Residence Permit)', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'English B2',
 false, true, true, false, true,
 'Issued by NIS after STR visa entry. Employer must maintain valid expatriate quota. Biometrics at NIS state command. Valid 1-2 years.'),

('Nigeria', 'nigeria', 'Africa', 'Business Visa', 'work',
 'easy', NULL, NULL, NULL, NULL,
 'English B2',
 false, true, false, false, false,
 'Invitation letter from Nigerian company required. Short-stay for business meetings and training. 30-90 days. Nigerian embassy issues.'),

('Nigeria', 'nigeria', 'Africa', 'Student Visa', 'study',
 'easy', NULL, NULL, NULL, 3000,
 'English B2',
 false, false, true, false, false,
 'Acceptance from Nigerian institution required. NUC approval may be needed. Medical exam at embassy.'),

('Egypt', 'egypt', 'Africa', 'Work Permit', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'Arabic A2 recommended',
 false, true, true, true, true,
 'Ministry of Manpower issues. Employer must prove preference to Egyptian nationals. Annual renewal. Tied to employer. Medical exam at designated clinics.'),

('Egypt', 'egypt', 'Africa', 'Annual Residence Visa', 'digital_nomad',
 'easy', NULL, NULL, NULL, 10000,
 'Arabic A1 helpful',
 true, false, false, false, false,
 'Interior Ministry processes. Linked to work contract, investment, property, or family. Renewable annually. Proof of accommodation required.'),

('Egypt', 'egypt', 'Africa', 'Investor Visa', 'investor',
 'moderate', NULL, NULL, NULL, 50000,
 'Arabic A1 recommended',
 false, true, false, false, false,
 'GAFI facilitates. Investment vehicle registration required. Annual residence permit linked to investment status.'),

('Egypt', 'egypt', 'Africa', 'Student Visa', 'study',
 'easy', NULL, NULL, NULL, 3000,
 'Arabic B2 for Arabic-medium; English B2 for international',
 false, false, true, false, false,
 'University acceptance required. Interior Ministry processes. Medical certificate from Egyptian embassy clinic required.'),

('Morocco', 'morocco', 'Africa', 'Work Permit', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'French B2',
 false, true, false, true, true,
 'ANAPEC labour market test required. Employer advertises for Moroccan candidates for 45 days. Ministry of Labour approves. Annual renewal.'),

('Morocco', 'morocco', 'Africa', 'Carte de Sejour (Residence Card)', 'digital_nomad',
 'easy', NULL, NULL, 12000, NULL,
 'French A2',
 true, true, false, false, false,
 'Applied at prefecture after entry. Required for stays over 90 days. Proof of income and accommodation required. Annual renewal.'),

('Morocco', 'morocco', 'Africa', 'Student Visa', 'study',
 'easy', NULL, NULL, NULL, 3000,
 'French B2 for French-medium programmes',
 false, false, false, false, false,
 'University acceptance required. French consulate system applies for Francophone universities. Carte de Sejour applied for in Morocco.'),

('Morocco', 'morocco', 'Africa', 'Investor Visa', 'investor',
 'moderate', NULL, NULL, NULL, 100000,
 'French B1 recommended',
 false, true, false, false, false,
 'Investment via AMDIE (Moroccan Investment and Export Development Agency). Property or business investment. Residence permit linked to investment.'),

('Argentina', 'argentina', 'Latin America', 'Temporary Residence - Work', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'Spanish B1 recommended',
 false, true, false, true, true,
 'Employer must be Argentine company. Apostilled documents required. DNM processes online. One-year validity; renewable.'),

('Argentina', 'argentina', 'Latin America', 'Rentista Visa', 'retirement',
 'easy', NULL, NULL, 24000, NULL,
 'Spanish A2 recommended',
 false, true, false, false, false,
 'Proof of passive income (pension, dividends, property rental). Approx USD 2,000/month considered sufficient. DNM processes.'),

('Argentina', 'argentina', 'Latin America', 'Digital Nomad Visa', 'digital_nomad',
 'easy', NULL, NULL, 18000, NULL,
 'Spanish A2 recommended',
 false, false, false, false, false,
 'Introduced 2022. Proof of remote income from non-Argentine employer. USD 1,500/month minimum. Ministry of Interior processes. 6-month validity, renewable.'),

('Argentina', 'argentina', 'Latin America', 'Permanent Residence', 'residency',
 'moderate', NULL, NULL, NULL, NULL,
 'Spanish B1 recommended',
 false, true, false, false, false,
 'After 2 years temporary residence. Mercosur nationals qualify faster (6 months). DNM processes. Apostilled criminal record required.'),

('Colombia', 'colombia', 'Latin America', 'Migrant Visa (M) - Employee', 'work',
 'easy', NULL, NULL, 10000, NULL,
 'Spanish A2 recommended',
 false, true, false, true, true,
 'Cancilleria processes entirely online. Employment contract required. Minimum salary 10x Colombian minimum wage approx USD 3,000/month. Valid up to 3 years.'),

('Colombia', 'colombia', 'Latin America', 'Migrant Visa (M) - Pensioner', 'retirement',
 'easy', NULL, NULL, 9000, NULL,
 'Spanish A2 recommended',
 false, true, false, false, false,
 'Proof of pension or passive income min 3x Colombian minimum wage approx USD 900/month. Cancilleria online portal. Valid up to 3 years.'),

('Colombia', 'colombia', 'Latin America', 'Digital Nomad Migrant Visa (M)', 'digital_nomad',
 'easy', NULL, NULL, 9000, NULL,
 'Spanish A2 recommended',
 false, true, false, false, false,
 'Remote work income from non-Colombian company. Minimum 3x Colombian minimum wage. Cancilleria online processing.'),

('Colombia', 'colombia', 'Latin America', 'Student Visa (V)', 'study',
 'easy', NULL, NULL, NULL, 3000,
 'Spanish B1 for Spanish-medium; English B2 for international',
 false, false, false, false, false,
 'Acceptance from Colombian institution required. Cancilleria processes. Valid for duration of studies.'),

('Colombia', 'colombia', 'Latin America', 'Resident Visa (R)', 'residency',
 'moderate', NULL, NULL, NULL, NULL,
 'Spanish B1 recommended',
 false, true, false, false, false,
 'After 5 years on Migrant (M) visa. Or via investment, Colombian parent or child, marriage. Cancilleria processes. Indefinite validity.'),

('Chile', 'chile', 'Latin America', 'Temporary Residence Visa - Work', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'Spanish B1 recommended',
 false, true, false, true, false,
 'Employment contract or job offer required. DEM processes. Extranjeria online portal. Valid 1-2 years.'),

('Chile', 'chile', 'Latin America', 'Digital Nomad Visa', 'digital_nomad',
 'easy', NULL, NULL, 24000, NULL,
 'Spanish A2 recommended',
 true, true, false, false, false,
 'Launched 2023. Proof of remote income from non-Chilean employer, USD 2,000/month minimum. 1-year validity, renewable once. Extranjeria portal.'),

('Chile', 'chile', 'Latin America', 'Retirement Visa', 'retirement',
 'easy', NULL, NULL, 12000, NULL,
 'Spanish A2 recommended',
 true, true, false, false, false,
 'Proof of stable passive income, pension, or investments. Approx USD 1,000/month considered sufficient. DEM processes.'),

('Chile', 'chile', 'Latin America', 'Student Visa', 'study',
 'easy', NULL, NULL, NULL, 4000,
 'Spanish B2 for Chilean-medium; English B2 for international',
 false, false, false, false, false,
 'Acceptance from Chilean institution required. Consulate issues visa; DEM processes residence card in Chile.'),

('Chile', 'chile', 'Latin America', 'Permanent Residence', 'residency',
 'moderate', NULL, NULL, NULL, NULL,
 'Spanish B1 recommended',
 false, true, false, false, false,
 'After 1 year temporary residence for certain categories or 2 years general. DEM processes. Clean criminal record and financial means required.'),

('Peru', 'peru', 'Latin America', 'Worker Migration Status', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'Spanish B1 recommended',
 false, true, false, true, true,
 'Work contract required. Ministry of Foreign Affairs issues visa; Migraciones processes residence. Foreign qualifications must be apostilled. Annual renewal.'),

('Peru', 'peru', 'Latin America', 'Investor Migration Status', 'investor',
 'moderate', NULL, NULL, NULL, 30000,
 'Spanish A2 recommended',
 false, true, false, false, false,
 'Investment of USD 30,000+ in Peruvian company. SUNARP registration required. Migraciones processes. Valid 1 year; renewable.'),

('Peru', 'peru', 'Latin America', 'Digital Nomad Visa', 'digital_nomad',
 'easy', NULL, NULL, 12000, NULL,
 'Spanish A2 recommended',
 false, true, false, false, false,
 'Income from non-Peruvian employer or clients. USD 1,000/month minimum. Migraciones online portal. 6-month validity.'),

('Peru', 'peru', 'Latin America', 'Student Migration Status', 'study',
 'easy', NULL, NULL, NULL, 4000,
 'Spanish B2 for Peruvian-medium; English B2 for international',
 false, false, false, false, false,
 'Acceptance from Peruvian institution required. Consulate processes. Migraciones registers after arrival.'),

('Peru', 'peru', 'Latin America', 'Permanent Residence', 'residency',
 'moderate', NULL, NULL, NULL, NULL,
 'Spanish B1 recommended',
 false, true, false, false, false,
 'After 3 years as resident migrant. Migraciones discretionary approval. Criminal record and proof of financial stability required.')

ON CONFLICT DO NOTHING;
