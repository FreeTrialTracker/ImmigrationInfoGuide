/*
  # Visa Requirements Batch 2

  Adds comprehensive visa requirement records for 10 countries:
  Poland, Austria, Belgium, Czech Republic, Hungary, Turkey,
  Malaysia, Indonesia, Philippines, Vietnam

  Covers work, study, digital nomad, investor, and residency visa categories.
*/

INSERT INTO visa_requirements (
  country, country_slug, region, visa_type, visa_category,
  difficulty, min_age, max_age, min_income_usd, min_savings_usd,
  language_required, health_insurance_required, criminal_check_required,
  medical_exam_required, job_offer_required, sponsor_required, notes
) VALUES

-- Poland
('Poland', 'poland', 'Europe', 'Work Visa (Type D - National)', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'Polish A1 recommended; not always mandatory',
 false, true, false, true, true,
 'Employer obtains zezwolenie (work permit) from voivode first. Consulate issues D visa. Residence card applied for at voivode office after arrival. Quotas apply for some nationalities.'),

('Poland', 'poland', 'Europe', 'EU Blue Card', 'work',
 'moderate', NULL, NULL, 36000, NULL,
 'English B2 (Polish A1 recommended)',
 false, true, false, true, true,
 'Salary must exceed 1.5x average Polish wage. University degree required. Voivodeship office processes. Faster than standard work permit in theory.'),

('Poland', 'poland', 'Europe', 'Student Visa (Type D)', 'study',
 'easy', NULL, NULL, NULL, 3000,
 'Polish B2 for Polish-medium; English B2 for international programmes',
 false, false, false, false, false,
 'Acceptance from Polish university required. Proof of financial means (PLN 1,200/month approx). Consulate issues visa; voivode registers after arrival.'),

('Poland', 'poland', 'Europe', 'Temporary Residence Permit', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Polish A2 recommended',
 false, true, false, false, false,
 'Applied at voivodeship office after entry. Notorious backlogs (3-12 months) in Warsaw, Krakow, Wroclaw. Proof of purpose (work, study, family) required.'),

('Poland', 'poland', 'Europe', 'Permanent Residence Permit', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Polish B1 mandatory (state exam)',
 false, true, false, false, false,
 'After 5 years legal continuous stay. Polish language exam required. Voivodeship office processes. Criminal record and financial self-sufficiency assessed.'),

-- Austria
('Austria', 'austria', 'Europe', 'Red-White-Red Card (Skilled Worker)', 'work',
 'moderate', NULL, NULL, 40000, NULL,
 'German A2 (B1 required for obtaining settlement permit later)',
 false, true, false, false, false,
 'Points-based system: 70+ points required. AMS labour market test (proof no suitable local candidate). BFA processes within 8 weeks. Valid 2 years.'),

('Austria', 'austria', 'Europe', 'EU Blue Card', 'work',
 'moderate', NULL, NULL, 45000, NULL,
 'German A2 (B1 for extension)',
 false, true, false, true, false,
 'Salary must exceed 1.5x average Austrian wage. University degree required. BFA processes. Valid 2 years.'),

('Austria', 'austria', 'Europe', 'Student Visa (Type C/D)', 'study',
 'easy', NULL, NULL, NULL, 11000,
 'German B2 for German-medium; English B2 for international programmes',
 true, false, false, false, false,
 'University acceptance required. Proof of EUR 929/month for Vienna (approx). Health insurance mandatory. Austrian embassy processes.'),

('Austria', 'austria', 'Europe', 'Long-Stay Visa (D)', 'digital_nomad',
 'moderate', NULL, NULL, 30000, NULL,
 'German A2 recommended',
 true, true, false, false, false,
 'For stays over 90 days without employment in Austria. Proof of sufficient income and accommodation required. Processed at Austrian embassy.'),

('Austria', 'austria', 'Europe', 'Settlement Permit (Niederlassungsbewilligung)', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'German B1 mandatory',
 true, true, false, false, false,
 'After 5 years on Red-White-Red Card. B1 German language and civic integration exam required. BFA processes.'),

-- Belgium
('Belgium', 'belgium', 'Europe', 'Single Permit (Work + Residence)', 'work',
 'hard', NULL, NULL, 30000, NULL,
 'Dutch/French/German B1 (region-dependent)',
 false, true, false, true, true,
 'Combined application processed by regional employment authority and CGVS. Wallonia: SPW; Flanders: VDAB; Brussels: Actiris. Processing 3-5 months typical.'),

('Belgium', 'belgium', 'Europe', 'EU Blue Card', 'work',
 'hard', NULL, NULL, 55000, NULL,
 'Dutch/French/German B1',
 false, true, false, true, true,
 'Salary threshold highest in EU for Belgium. University degree required. SPF Employment and CGVS process.'),

('Belgium', 'belgium', 'Europe', 'Student Visa (Type D)', 'study',
 'easy', NULL, NULL, NULL, 8000,
 'French/Dutch B2 for respective language programmes; English B2 for international',
 false, false, false, false, false,
 'Acceptance from Belgian institution required. Proof of EUR 650/month approx. Belgian embassy processes. Commune registration required on arrival.'),

('Belgium', 'belgium', 'Europe', 'Professional Card (Self-Employment)', 'work',
 'hard', NULL, NULL, NULL, 20000,
 'Dutch/French B2 (region-dependent)',
 false, true, false, false, false,
 'Business viability and public interest assessed by regional authorities. Can take 3-6 months. Separate from work permit; for self-employed.'),

('Belgium', 'belgium', 'Europe', 'Long-Stay Residence (Unlimited)', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Dutch/French/German A2 (integration courses required)',
 false, true, false, false, false,
 'After 5 years legal stay. Integration conditions vary by region. Commune registers; CGVS/Office of Foreigners processes.'),

-- Czech Republic
('Czech Republic', 'czech-republic', 'Europe', 'Employee Card', 'work',
 'hard', NULL, NULL, 20000, NULL,
 'Czech A1 (B1 required after 2 years)',
 false, true, false, true, true,
 'Combined work + residence permit. Czech embassy abroad processes first phase. MOI completes second phase in Czech Republic. Quotas for some nationalities. 2-year validity.'),

('Czech Republic', 'czech-republic', 'Europe', 'EU Blue Card', 'work',
 'moderate', NULL, NULL, 30000, NULL,
 'Czech A1 (B1 for extension)',
 false, true, false, true, false,
 'Salary at least 1.5x average Czech wage. University degree (3+ years). MOI processes. 2-year validity.'),

('Czech Republic', 'czech-republic', 'Europe', 'Long-Stay Student Visa', 'study',
 'easy', NULL, NULL, NULL, 4000,
 'Czech B2 for Czech-medium; English B2 for international',
 false, false, false, false, false,
 'Acceptance from Czech institution required. Proof of funds (CZK 110,000/year approx). Czech embassy processes.'),

('Czech Republic', 'czech-republic', 'Europe', 'Trade License (Zivno) Visa', 'work',
 'hard', NULL, NULL, NULL, NULL,
 'Czech B1 recommended',
 false, true, false, false, false,
 'Trade license must be obtained from Trade Licensing Office first. Then MOI issues long-stay visa for self-employment. Time-consuming process.'),

('Czech Republic', 'czech-republic', 'Europe', 'Permanent Residence Permit', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Czech A1 mandatory (state exam)',
 true, true, false, false, false,
 'After 5 years continuous stay. Czech language exam (A1 level) and Czech cultural knowledge test required. MOI processes.'),

-- Hungary
('Hungary', 'hungary', 'Europe', 'Guest Worker Visa', 'work',
 'easy', NULL, NULL, NULL, NULL,
 'None mandatory',
 false, true, false, true, true,
 'For nationals of bilateral partner countries. Employer handles most of application. National Directorate General for Aliens Policing (NDGAP) processes quickly.'),

('Hungary', 'hungary', 'Europe', 'White Card (Digital Nomad Visa)', 'digital_nomad',
 'easy', NULL, NULL, 36000, NULL,
 'English B2 (Hungarian not required)',
 true, true, false, false, false,
 'Introduced January 2022. Income EUR 3,000/month from non-Hungarian employer. Valid 1 year; renewable once. NDGAP processes.'),

('Hungary', 'hungary', 'Europe', 'Single Permit (Work + Residence)', 'work',
 'moderate', NULL, NULL, 18000, NULL,
 'Hungarian A1 recommended',
 false, true, false, true, true,
 'Employer-initiated. NDGAP processes. Labour market test may apply for certain nationalities. Valid 2 years.'),

('Hungary', 'hungary', 'Europe', 'Student Residence Permit', 'study',
 'easy', NULL, NULL, NULL, 5000,
 'Hungarian B2 for Hungarian-medium; English B2 for international',
 false, false, false, false, false,
 'Entry on national D visa; apply for residence permit at regional NDGAP office. University acceptance required.'),

('Hungary', 'hungary', 'Europe', 'Permanent Residence Permit', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Hungarian B1 recommended',
 false, true, false, false, false,
 'After 3 years continuous legal stay. Financial self-sufficiency and housing proof required. NDGAP discretionary decision.'),

-- Turkey
('Turkey', 'turkey', 'Middle East', 'Work Permit', 'work',
 'moderate', NULL, NULL, 18000, NULL,
 'Turkish A2 recommended; B1 for some regulated professions',
 false, true, false, true, true,
 'Employer must have at least 5 Turkish citizens per 1 foreign worker. Ministry of Labour processes. Application via e-permit system. Valid up to 3 years.'),

('Turkey', 'turkey', 'Middle East', 'Short-Term Residence Permit', 'digital_nomad',
 'easy', NULL, NULL, NULL, 2000,
 'None mandatory',
 true, false, false, false, false,
 'For tourism, remote work, property ownership, or language study. Online application or at PDMM office. Valid up to 2 years. Cheap and fast.'),

('Turkey', 'turkey', 'Middle East', 'Student Residence Permit', 'study',
 'easy', NULL, NULL, NULL, 3000,
 'Turkish B1 for Turkish-medium; English B2 for international',
 false, false, false, false, false,
 'University or language school acceptance required. PDMM processes. Valid for duration of study.'),

('Turkey', 'turkey', 'Middle East', 'Long-Term Residence Permit', 'residency',
 'moderate', NULL, NULL, NULL, NULL,
 'Turkish A2 recommended',
 false, true, false, false, false,
 'After 8 years continuous legal stay. No violation of short-term permit conditions. PDMM processes. Indefinite validity once granted.'),

('Turkey', 'turkey', 'Middle East', 'Turkish Citizenship by Investment', 'investor',
 'moderate', NULL, NULL, NULL, 400000,
 'None mandatory',
 false, true, false, false, false,
 'USD 400,000 real estate (held 3 years) OR USD 500,000 bank deposit. Presidency of the Republic processes. Path to full citizenship. ~3-6 months total processing.'),

-- Malaysia
('Malaysia', 'malaysia', 'Asia', 'Employment Pass (EP)', 'work',
 'moderate', NULL, NULL, 18000, NULL,
 'English B2 (Malay not required)',
 false, true, false, true, true,
 'Three categories: Cat 1 (MYR 10,000+/month), Cat 2 (MYR 5,000-9,999), Cat 3 (MYR 3,000-4,999). ESD (Expatriate Services Division) processes. Employer-sponsored.'),

('Malaysia', 'malaysia', 'Asia', 'DE Rantau (Digital Nomad Pass)', 'digital_nomad',
 'easy', NULL, NULL, 24000, NULL,
 'English B2',
 true, true, false, false, false,
 'Malaysia Digital Economy Corp (MDEC) programme. USD 24,000/year remote income from non-Malaysian employer. 3+12 month pass. Malaysia Tech City ecosystem access.'),

('Malaysia', 'malaysia', 'Asia', 'Malaysia My Second Home (MM2H)', 'retirement',
 'hard', NULL, NULL, 120000, NULL,
 'English B2',
 true, true, true, false, false,
 'Strict requirements since 2021 restructure: MYR 500,000 offshore income/year, MYR 1,000,000 liquid assets, MYR 1,000,000 fixed deposit. Ministry of Tourism processes.'),

('Malaysia', 'malaysia', 'Asia', 'Student Pass', 'study',
 'easy', NULL, NULL, NULL, 5000,
 'English B2 for international programmes',
 true, false, true, false, false,
 'EMGS (Education Malaysia Global Services) handles medical screening and pass issuance. University or college acceptance required. Medical exam mandatory.'),

('Malaysia', 'malaysia', 'Asia', 'Permanent Residence (PR)', 'residency',
 'hard', NULL, NULL, 36000, NULL,
 'Malay B1 recommended',
 false, true, false, false, false,
 'Very limited approvals. JPN (National Registration Dept) processes. Typically requires 10+ years continuous EP holder status, Malaysian spouse, or exceptional talent.'),

-- Indonesia
('Indonesia', 'indonesia', 'Asia', 'KITAS - Work (Limited Stay Permit)', 'work',
 'moderate', NULL, NULL, 30000, NULL,
 'Indonesian A2 recommended (mandatory for certain roles)',
 false, true, true, true, true,
 'Employer obtains RPTKA (foreign worker utilization plan) from Ministry of Manpower. VITAS then KITAS issued by Immigration Directorate General. Medical exam required.'),

('Indonesia', 'indonesia', 'Asia', 'Retirement KITAS', 'retirement',
 'easy', 55, NULL, 18000, NULL,
 'None mandatory',
 true, true, true, false, false,
 'Must be 55+. Proof of pension or passive income USD 1,500/month. Health insurance mandatory. Social/cultural visa basis. Annual renewal.'),

('Indonesia', 'indonesia', 'Asia', 'Investor KITAS (Business Visa)', 'investor',
 'moderate', NULL, NULL, NULL, 70000,
 'Indonesian A1 recommended',
 false, true, false, false, false,
 'Investment via BKPM/OSS (Online Single Submission) system. Minimum investment IDR 1 billion (approx USD 65,000). KITAS valid 2 years.'),

('Indonesia', 'indonesia', 'Asia', 'Student VITAS/KITAS', 'study',
 'easy', NULL, NULL, NULL, 5000,
 'Indonesian B2 for Indonesian-medium; English B2 for international',
 false, false, false, false, true,
 'Sponsor letter from educational institution required. Embassy issues VITAS; student converts to KITAS in Indonesia. DAPT (Education Ministry) approval for some programmes.'),

('Indonesia', 'indonesia', 'Asia', 'KITAP (Permanent Stay Permit)', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Indonesian B1 recommended',
 false, true, false, false, false,
 'After 5 continuous years on KITAS (work), or via marriage to Indonesian citizen (2 years). Immigration Directorate General approval required. 5-year validity.'),

-- Philippines
('Philippines', 'philippines', 'Asia', '9(g) Pre-arranged Employment Visa', 'work',
 'moderate', NULL, NULL, 24000, NULL,
 'English B2 (official language)',
 false, true, false, true, true,
 'DOLE AEP (Alien Employment Permit) required first. BI then issues 9(g) visa. Employer sponsorship essential. AEP confirms no qualified Filipino available for role.'),

('Philippines', 'philippines', 'Asia', 'SRRV Classic (Retirement Visa)', 'retirement',
 'easy', 35, NULL, NULL, 20000,
 'English B2',
 true, true, true, false, false,
 'PRA (Philippine Retirement Authority) administers. USD 20,000 bank deposit for 50+; USD 10,000 if USD 1,000/month pension. Medical exam required.'),

('Philippines', 'philippines', 'Asia', '9(f) Student Visa', 'study',
 'easy', NULL, NULL, NULL, 3000,
 'English B2 (English is main medium of instruction)',
 false, false, false, false, true,
 'School must sponsor application to BI. Acceptance letter required. BI processes. Valid for duration of study with annual confirmation of enrollment.'),

('Philippines', 'philippines', 'Asia', 'Special Investor Resident Visa (SIRV)', 'investor',
 'moderate', NULL, NULL, NULL, 75000,
 'English B2',
 false, true, false, false, false,
 'USD 75,000 minimum investment in BOI-registered enterprise. BOI endorses; BI issues visa. Lifetime visa once issued.'),

('Philippines', 'philippines', 'Asia', 'Special Work Permit (SWP)', 'work',
 'easy', NULL, NULL, NULL, NULL,
 'English B2',
 false, true, false, false, true,
 'Short-term authorization (up to 6 months). BI processes. For specific projects, performances, trainings. Faster than full 9(g) employment visa.'),

-- Vietnam
('Vietnam', 'vietnam', 'Asia', 'Work Permit', 'work',
 'moderate', NULL, NULL, 18000, NULL,
 'Vietnamese A2 recommended (some roles require local language)',
 false, true, true, true, true,
 'DOLISA (Dept of Labour, Invalids and Social Affairs) issues. Employer must prove no suitable Vietnamese candidate. Foreign qualifications require apostille. 2-year validity.'),

('Vietnam', 'vietnam', 'Asia', 'Temporary Residence Card (TRC) - Work', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'Vietnamese A1 recommended',
 false, true, false, false, true,
 'Obtained after entry with work permit. Immigration Dept issues. Valid 2 years (linked to work permit). Required for stays over 90 days.'),

('Vietnam', 'vietnam', 'Asia', 'Business Visa (DN)', 'work',
 'easy', NULL, NULL, NULL, NULL,
 'None mandatory (English widely used in business)',
 false, false, false, false, false,
 'E-visa valid 90 days or visa-on-arrival letter. For business activities not employment. Annual renewals possible. Widely used by entrepreneurs and investors.'),

('Vietnam', 'vietnam', 'Asia', 'Student Visa (DH)', 'study',
 'easy', NULL, NULL, NULL, 3000,
 'Vietnamese B2 for Vietnamese-medium; English B2 for international',
 false, false, false, false, true,
 'Approval letter from Vietnamese institution required. Embassy issues DH visa. TRC applied for in Vietnam after entry.'),

('Vietnam', 'vietnam', 'Asia', 'Investor TRC', 'investor',
 'moderate', NULL, NULL, NULL, 100000,
 'Vietnamese A1 recommended',
 false, true, false, false, false,
 'VND 3 billion+ investment (approx USD 120,000). Investment registration certificate required from DPI. TRC linked to investment duration. Immigration Dept issues.')

ON CONFLICT DO NOTHING;
