/*
  # Visa Requirements Batch 1

  Adds comprehensive visa requirement records for 12 countries:
  Japan, France, Italy, Brazil, Mexico, South Korea, Ireland, India,
  Switzerland, Sweden, Norway, Denmark

  Each country gets 4-6 visa types covering: work, study, digital nomad,
  retirement/passive income, and residency/permanent pathways.

  All records include:
  - difficulty rating
  - minimum income/savings thresholds in USD
  - language requirements
  - boolean flags for health insurance, criminal check, medical exam, job offer, sponsor
  - notes field with key nuances
*/

INSERT INTO visa_requirements (
  country, country_slug, region, visa_type, visa_category,
  difficulty, min_age, max_age, min_income_usd, min_savings_usd,
  language_required, health_insurance_required, criminal_check_required,
  medical_exam_required, job_offer_required, sponsor_required, notes
) VALUES

-- Japan
('Japan', 'japan', 'Asia', 'Highly Skilled Professional (HSP)', 'work',
 'hard', NULL, NULL, 42000, NULL,
 'Japanese N3 or equivalent preferred (not mandatory)',
 true, true, false, false, true,
 'Points-based system (70+ points required). Certificate of Eligibility from Immigration Services Agency. Sponsor must be Japanese employer or institution.'),

('Japan', 'japan', 'Asia', 'Engineer / Specialist in Humanities', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'None mandatory; Japanese skills improve approval odds',
 false, true, false, true, true,
 'Most common work visa category. Employer must sponsor. Degree or 10 years work experience required. Certificate of Eligibility processed by ISA.'),

('Japan', 'japan', 'Asia', 'Student Visa', 'study',
 'easy', NULL, NULL, NULL, 10000,
 'N5 minimum recommended; school may require higher',
 false, false, false, false, true,
 'School issues Certificate of Eligibility. Proof of funds to cover tuition and living expenses required. Language school or university acceptance needed.'),

('Japan', 'japan', 'Asia', 'Spouse of Japanese National', 'family',
 'moderate', NULL, NULL, NULL, NULL,
 'None mandatory',
 false, true, false, false, false,
 'Marriage certificate with apostille required. Sponsor (Japanese spouse) income assessed. Certificate of Eligibility or consular visa.'),

('Japan', 'japan', 'Asia', 'Permanent Residence', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Japanese N3 or above strongly recommended',
 true, true, false, false, false,
 'Typically 10 years legal stay (reduced to 1-3 years under HSP points system). Good tax compliance and no criminal record essential. ISA review is thorough.'),

-- France
('France', 'france', 'Europe', 'Talent Passport - Employee on Assignment', 'work',
 'moderate', NULL, NULL, 56000, NULL,
 'French B1 recommended; not always mandatory for initial visa',
 true, true, false, true, true,
 'For high-skilled employees assigned by multinational. Salary must exceed 1.5x average French wage. Consulate issues visa; prefecture issues multi-year residence card.'),

('France', 'france', 'Europe', 'Talent Passport - Innovative Entrepreneur', 'work',
 'hard', NULL, NULL, NULL, 30000,
 'French B1 recommended',
 true, true, false, false, false,
 'Business project must be assessed by Business France or a regional innovation body. 4-year renewable residence permit.'),

('France', 'france', 'Europe', 'Long-Stay Student Visa (VLS-TS)', 'study',
 'easy', NULL, NULL, NULL, 7200,
 'French B2 for most programmes; A2 minimum for language schools',
 false, false, false, false, false,
 'Campus France pre-registration required for nationals of most non-EU countries. Proof of EUR 615/month during stay. OFII validation required after arrival.'),

('France', 'france', 'Europe', 'Long-Stay Visitor Visa', 'digital_nomad',
 'moderate', NULL, NULL, 36000, NULL,
 'French A2 recommended',
 true, true, false, false, false,
 'No work permitted for French employers; remote work for foreign clients tolerated. Proof of accommodation and sufficient passive/remote income required.'),

('France', 'france', 'Europe', 'Permanent Residence (10-year card)', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'French B1 mandatory (DELF certificate)',
 true, true, false, false, false,
 'After 5 years legal and continuous stay. Civic integration contract (CAI) compliance required. Prefecture processes; integration criteria assessed.'),

-- Italy
('Italy', 'italy', 'Europe', 'Self-Employment / Digital Nomad Visa', 'digital_nomad',
 'moderate', NULL, NULL, 30000, NULL,
 'Italian B1 recommended; not always mandatory',
 true, true, false, false, false,
 'Introduced formally 2024. Proof of remote income from non-Italian clients. Tax code (codice fiscale) and Italian accommodation proof required.'),

('Italy', 'italy', 'Europe', 'Work Visa (decreto flussi)', 'work',
 'hard', NULL, NULL, NULL, NULL,
 'Italian A2+ preferred',
 false, true, false, true, true,
 'Annual quota system. Applications open in batches (click day). Employer must have pre-authorisation. Backlogs and website crashes common. Questura issues residence permit after entry.'),

('Italy', 'italy', 'Europe', 'Student Visa (Type D)', 'study',
 'easy', NULL, NULL, NULL, 6000,
 'Italian B2 for Italian-language courses; English B2 for international programmes',
 false, false, false, false, false,
 'University pre-enrolment via Italian consulate required. Proof of EUR 448.10/month or equivalent in bank. Questura residence permit must be obtained within 8 days of arrival.'),

('Italy', 'italy', 'Europe', 'Elective Residence Visa', 'retirement',
 'moderate', NULL, NULL, 43000, NULL,
 'Italian A2 recommended',
 true, true, false, false, false,
 'No work permitted; for those with substantial passive income (pension, investments, property rental). Proof of EUR 3,000/month and accommodation required.'),

('Italy', 'italy', 'Europe', 'Long-Term EU Residence Permit', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Italian A2 mandatory (tested at Questura)',
 true, true, false, false, false,
 'After 5 years continuous legal stay. Questura processing infamous for long backlogs in Milan, Rome, and Naples. Proof of income above social allowance threshold required.'),

-- Brazil
('Brazil', 'brazil', 'Latin America', 'VITEM V (Work Visa)', 'work',
 'moderate', NULL, NULL, 18000, NULL,
 'Portuguese B1 recommended; not always mandatory',
 false, true, false, true, true,
 'Employer must be Brazilian company. Work contract required. Consulate processes; Federal Police registers upon arrival. Valid up to 2 years.'),

('Brazil', 'brazil', 'Latin America', 'VITEM IV (Investor/Business Visa)', 'investor',
 'moderate', NULL, NULL, NULL, 150000,
 'Portuguese A2 recommended',
 false, true, false, false, false,
 'Investment of BRL 500,000+ (or BRL 150,000 for innovation/tech). CNPJ registration required. Federal Police processes residence after entry.'),

('Brazil', 'brazil', 'Latin America', 'Digital Nomad Visa (VITEM I)', 'digital_nomad',
 'easy', NULL, NULL, 18000, NULL,
 'None mandatory',
 false, true, false, false, false,
 'Introduced 2022. Proof of income from non-Brazilian employer/clients (USD 1,500/month or USD 18,000 savings). Valid 1 year, renewable once.'),

('Brazil', 'brazil', 'Latin America', 'Student Visa (VITEM IV - student)', 'study',
 'easy', NULL, NULL, NULL, 5000,
 'Portuguese B1 for Portuguese-language courses',
 false, false, false, false, false,
 'Letter of acceptance from Brazilian institution required. Proof of financial means for duration of study. Federal Police registration upon arrival.'),

('Brazil', 'brazil', 'Latin America', 'Permanent Residence (CRNM)', 'residency',
 'moderate', NULL, NULL, NULL, NULL,
 'Portuguese B2 recommended',
 false, true, false, false, false,
 'Pathways: investment, marriage to Brazilian, 4+ years on temporary visa, or treaty rights (Mercosur nationals). Federal Police processes CRNM card.'),

-- Mexico
('Mexico', 'mexico', 'Latin America', 'Temporary Resident Visa', 'digital_nomad',
 'easy', NULL, NULL, 24000, 43000,
 'Spanish A1 recommended',
 false, true, false, false, false,
 'Financial solvency threshold: approx MXN 48,000/month income OR MXN 800,000 in savings. Consulate issues visa; INM processes residence card in Mexico within 30 days.'),

('Mexico', 'mexico', 'Latin America', 'Work Permit (Oferta de Trabajo)', 'work',
 'moderate', NULL, NULL, NULL, NULL,
 'Spanish A2 preferred',
 false, true, false, true, true,
 'Employer obtains INM authorisation first. Consulate issues visa. INM processes FM3-equivalent residence card after arrival. Valid up to 1 year; renewable.'),

('Mexico', 'mexico', 'Latin America', 'Student Visa', 'study',
 'easy', NULL, NULL, NULL, 4000,
 'Spanish B1 for Spanish-medium programmes',
 false, false, false, false, false,
 'Acceptance letter from Mexican institution required. Proof of financial means. INM processes student residence card.'),

('Mexico', 'mexico', 'Latin America', 'Permanent Resident Visa', 'residency',
 'moderate', NULL, NULL, 48000, NULL,
 'Spanish A2 recommended',
 false, true, false, false, false,
 'Pathways: 4+ years as temporary resident, retirement income threshold (approx MXN 100,000/month), or family ties. INM processes.'),

-- South Korea
('South Korea', 'south-korea', 'Asia', 'E-7 Specific Activities Visa', 'work',
 'hard', NULL, NULL, 28000, NULL,
 'Korean TOPIK Level 2 recommended; field-specific requirements vary',
 false, true, false, true, true,
 'Occupation must be on the E-7 permitted list. Employer-sponsored. Ministry of Justice processes. Quota system applies to some occupations.'),

('South Korea', 'south-korea', 'Asia', 'D-8 Corporate Investment Visa', 'investor',
 'moderate', NULL, NULL, NULL, 100000,
 'Korean TOPIK Level 2 recommended',
 false, true, false, false, false,
 'Investment of KRW 100 million (approx USD 75,000) in a Korean corporation. Business registration required. Ministry of Justice processes.'),

('South Korea', 'south-korea', 'Asia', 'D-2 Student Visa', 'study',
 'easy', NULL, NULL, NULL, 10000,
 'Korean TOPIK Level 3 for Korean-medium courses; English B2 for international programmes',
 false, false, false, false, false,
 'Acceptance from Korean university or language institute required. Proof of USD 10,000+ in bank. Consulate processes; ARC registered in Korea.'),

('South Korea', 'south-korea', 'Asia', 'F-2 Long-Term Resident Visa', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Korean TOPIK Level 3+',
 false, true, false, false, false,
 'Points-based system. Requires stable income, Korean language, and years of prior legal stay. Min 120 points required. Immigration office processes.'),

('South Korea', 'south-korea', 'Asia', 'F-5 Permanent Residence', 'residency',
 'hard', NULL, NULL, 30000, NULL,
 'Korean TOPIK Level 3 mandatory',
 true, true, false, false, false,
 'Typically 5+ years of legal stay in qualifying status. Points assessment. Good tax compliance essential. Immigration office processes.'),

-- Ireland
('Ireland', 'ireland', 'Europe', 'Critical Skills Employment Permit', 'work',
 'moderate', NULL, NULL, 38000, NULL,
 'English C1 (for regulated professions)',
 false, true, false, true, true,
 'Occupation must be on the Critical Skills list. Salary threshold EUR 38,000 (most occupations) or EUR 30,000 (shortage categories). DETE issues permit.'),

('Ireland', 'ireland', 'Europe', 'General Employment Permit', 'work',
 'hard', NULL, NULL, 30000, NULL,
 'English B2',
 false, true, false, true, true,
 'Labour Market Needs Test required (advertise for 4 weeks). Employer must be registered with Revenue. DETE processes. Slower than Critical Skills.'),

('Ireland', 'ireland', 'Europe', 'Student Visa (Study)', 'study',
 'easy', NULL, NULL, NULL, 10000,
 'English B2 (IELTS 5.5 or equivalent)',
 false, false, false, false, false,
 'Acceptance from recognised Irish institution required. Proof of EUR 10,000 in bank for first year. GNIB/IRP registration in Ireland after arrival.'),

('Ireland', 'ireland', 'Europe', 'Join Family', 'family',
 'hard', NULL, NULL, 28000, NULL,
 'English B1',
 true, true, false, false, true,
 'Sponsor must have Stamp 4 or Irish citizenship and meet income threshold. Application to INIS; long backlogs (6-12 months). Means assessment conducted.'),

('Ireland', 'ireland', 'Europe', 'Stamp 4 (Permanent Residence Equivalent)', 'residency',
 'moderate', NULL, NULL, NULL, NULL,
 'English B2',
 false, true, false, false, false,
 'After 5 years legal stay (various stamps). INIS processes. No language test per se but employment history and integration assessed. Allows work without permit.'),

-- India
('India', 'india', 'Asia', 'Employment Visa (E Visa)', 'work',
 'moderate', NULL, NULL, 25000, NULL,
 'English (de facto working language)',
 false, true, false, true, true,
 'Salary threshold USD 25,000/year (exceptions for ethnic chefs, language teachers). Employer must be Indian company. FRRO registration within 14 days of arrival.'),

('India', 'india', 'Asia', 'Business Visa (B Visa)', 'work',
 'easy', NULL, NULL, NULL, NULL,
 'English',
 false, true, false, false, false,
 'For business activities, not employment. Valid up to 5 years multiple entry. Indian company invitation letter required. FRRO registration if staying over 180 days.'),

('India', 'india', 'Asia', 'Student Visa (S Visa)', 'study',
 'easy', NULL, NULL, NULL, 5000,
 'English B2 for English-medium programmes',
 false, false, false, false, false,
 'Letter of acceptance from recognised Indian institution required. Proof of financial means. FRRO registration within 14 days of arrival.'),

('India', 'india', 'Asia', 'Research Visa (R Visa)', 'study',
 'moderate', NULL, NULL, NULL, NULL,
 'English',
 false, true, false, false, true,
 'Institutional affiliation required. Prior clearance from Ministry of Home Affairs for research in sensitive areas/border states. FRRO registration required.'),

-- Switzerland
('Switzerland', 'switzerland', 'Europe', 'B Permit (Annual Residence - Skilled Worker)', 'work',
 'hard', NULL, NULL, 60000, NULL,
 'German/French/Italian B1 (canton-dependent)',
 true, true, false, true, true,
 'Quota system: 8,500 annual permits for non-EU/EFTA nationals. Cantonal migration office assesses. Employer must prove no suitable EU/EFTA candidate. High salary threshold expected.'),

('Switzerland', 'switzerland', 'Europe', 'L Permit (Short-term Residence)', 'work',
 'moderate', NULL, NULL, 50000, NULL,
 'German/French/Italian A2 (canton-dependent)',
 true, true, false, true, true,
 'For contracts up to 1 year. Quota applies. Cantonal approval required. Employer-sponsored. Preference given to EU/EFTA nationals.'),

('Switzerland', 'switzerland', 'Europe', 'Student Visa (D Visa)', 'study',
 'moderate', NULL, NULL, NULL, 20000,
 'Language of instruction: B2 minimum',
 false, false, false, false, false,
 'University or language school acceptance required. Proof of CHF 21,000/year in bank (approx). Cantonal migration office processes. Health insurance mandatory after arrival.'),

('Switzerland', 'switzerland', 'Europe', 'C Permit (Settlement)', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'German/French/Italian B1 mandatory',
 true, true, false, false, false,
 'After 5-10 years on B permit (5 years for EU/EFTA treaty nationals; 10 years for others). Language integration requirement. Cantonal assessment.'),

-- Sweden
('Sweden', 'sweden', 'Europe', 'Work Permit', 'work',
 'moderate', NULL, NULL, 26000, NULL,
 'English B2 (Swedish helpful but not required for most roles)',
 false, true, false, true, true,
 'Employer must advertise for 10 days in EU/EEA. Salary must meet sector collective agreement minimums. Migrationsverket processes. Family can accompany on same application.'),

('Sweden', 'sweden', 'Europe', 'EU Blue Card', 'work',
 'moderate', NULL, NULL, 50000, NULL,
 'English B2',
 false, true, false, true, true,
 'Salary must exceed 1.5x average Swedish wage. University degree required. Faster recognition across EU. Migrationsverket issues.'),

('Sweden', 'sweden', 'Europe', 'Student Residence Permit', 'study',
 'easy', NULL, NULL, NULL, 8000,
 'Swedish B2 for Swedish-medium programmes; English B2 for international',
 false, false, false, false, false,
 'Full-time study programme required. SEK 8,514/month demonstrated (approx USD 800). Migrationsverket processes. Health insurance recommended.'),

('Sweden', 'sweden', 'Europe', 'Permanent Residence Permit', 'residency',
 'hard', NULL, NULL, 30000, NULL,
 'Swedish A2 minimum (higher helps)',
 false, true, false, false, false,
 'After 4 years on valid work permit within 7 years. Continuous employment requirement. Migrationsverket assesses self-sufficiency. No formal language test but Swedish integration tracked.'),

-- Norway
('Norway', 'norway', 'Europe', 'Skilled Worker Permit', 'work',
 'moderate', NULL, NULL, 44000, NULL,
 'Norwegian A1 (higher required for some regulated professions)',
 false, true, false, true, true,
 'Qualification must match job. Employer sponsorship required. UDI processing. Salary must meet minimum sectoral standards. Apply before entry if possible.'),

('Norway', 'norway', 'Europe', 'Self-employed / Independent Contractor Permit', 'work',
 'hard', NULL, NULL, 40000, NULL,
 'Norwegian A2 recommended',
 false, true, false, false, false,
 'Must document viable business and sufficient income. Business plan and client contracts required. UDI assesses case-by-case.'),

('Norway', 'norway', 'Europe', 'Student Residence Permit', 'study',
 'easy', NULL, NULL, NULL, 12000,
 'Norwegian B2 for Norwegian-medium; English B2 for international programmes',
 false, false, false, false, false,
 'Full-time study required. NOK 137,907/year (approx USD 12,000) in bank. Letter of admission from Norwegian institution. UDI processes.'),

('Norway', 'norway', 'Europe', 'Permanent Residence', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Norwegian A2 mandatory (oral test)',
 false, true, false, false, false,
 'After 3 years continuous residence on work/study permits. 300 hours Norwegian language training (or exemption). No serious criminal offences. UDI assesses.'),

-- Denmark
('Denmark', 'denmark', 'Europe', 'Pay Limit Scheme', 'work',
 'moderate', NULL, NULL, 64000, NULL,
 'English B2 (Danish not required)',
 false, true, false, true, true,
 'Annual salary must exceed DKK 448,000 (approx USD 64,000). Fast-track 1-2 months. SIRI processes. Employer must be registered in Denmark.'),

('Denmark', 'denmark', 'Europe', 'Positive List (Shortage Occupation)', 'work',
 'moderate', NULL, NULL, 48000, NULL,
 'English B2',
 false, true, false, true, true,
 'Occupation must be on the Positive List. Salary and qualification criteria apply. SIRI fast-track. Employer sponsorship required.'),

('Denmark', 'denmark', 'Europe', 'Standard Work Permit', 'work',
 'hard', NULL, NULL, 40000, NULL,
 'Danish A2 recommended',
 false, true, false, true, true,
 'Labour market test: employer must prove no suitable Danish/EU candidate. SIRI processes. Slower than Pay Limit or Positive List routes.'),

('Denmark', 'denmark', 'Europe', 'Student Visa', 'study',
 'easy', NULL, NULL, NULL, 9000,
 'Danish B2 for Danish-medium; English B2 for international programmes',
 false, false, false, false, false,
 'Acceptance from Danish educational institution required. DKK 6,397/month (approx USD 900) in bank. SIRI processes residence permit.'),

('Denmark', 'denmark', 'Europe', 'Permanent Residence', 'residency',
 'hard', NULL, NULL, NULL, NULL,
 'Danish language test (PD3 or Proevedansk 3) mandatory',
 false, true, false, false, false,
 'Ordinarily 8 years legal stay; 4 years via fast-track (strong integration). Self-sufficiency requirement. Criminal record checked. SIRI processes.')

ON CONFLICT DO NOTHING;
