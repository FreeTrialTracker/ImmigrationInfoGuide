/*
  # Seed Requirements Database - Work & Study Visas
  
  Populates visa_requirements and requirement_items for major destinations:
  - Work visas: Germany, UK, Canada, Australia, USA, Netherlands, Portugal, UAE
  - Study visas: UK, Australia, Canada, Germany, USA
  
  All data is based on publicly available official government immigration information.
*/

-- ============================================================
-- GERMANY - SKILLED WORKER VISA (§18a/18b AufenthG)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, language_required, health_insurance_required, criminal_check_required, job_offer_required, notes)
  VALUES ('Germany', 'germany', 'Europe', 'Skilled Worker Visa', 'work', 'moderate', 18, 'German A1 (role dependent)', true, true, true, 'Requires recognition of foreign qualifications. EU Blue Card available for high-earners.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',     'Valid national passport',                        'Must be valid for the entire duration of stay', true, 1),
  (v_id, 'identity',     'Biometric passport photos',                      '2 photos, 35×45mm, plain background', true, 2),
  (v_id, 'identity',     'Completed visa application form',                'Form downloadable from German embassy website', true, 3),
  (v_id, 'employment',   'Signed employment contract or binding job offer','Must specify salary, role, and start date', true, 1),
  (v_id, 'employment',   'Recognized foreign qualification',               'ANABIN database or Statement of Comparability from anabin.kmk.org', true, 2),
  (v_id, 'employment',   'Proof of professional experience',               'Employment certificates, reference letters', true, 3),
  (v_id, 'financial',    'Proof of salary meeting minimum threshold',      'EU Blue Card: €45,300/year (2024); general skilled worker varies by field', true, 1),
  (v_id, 'financial',    'Bank statements (last 3 months)',                'To demonstrate financial stability', false, 2),
  (v_id, 'health',       'Health insurance coverage',                      'German statutory or private insurance from day of entry', true, 1),
  (v_id, 'language',     'German language certificate (if required)',      'Level depends on profession; healthcare requires B2/C1', false, 1),
  (v_id, 'legal',        'Criminal record certificate',                    'From country of residence and any country lived in for 5+ years', true, 1),
  (v_id, 'accommodation','Proof of accommodation in Germany',              'Rental agreement or letter of commitment from employer/host', true, 1),
  (v_id, 'other',        'Curriculum vitae (CV)',                          'Detailed CV in German or English', true, 1),
  (v_id, 'other',        'Cover letter / motivation letter',               'Explaining purpose of stay and career plans', false, 2);
END $$;

-- ============================================================
-- UNITED KINGDOM - SKILLED WORKER VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, language_required, health_insurance_required, criminal_check_required, job_offer_required, sponsor_required, notes)
  VALUES ('United Kingdom', 'united-kingdom', 'Europe', 'Skilled Worker Visa', 'work', 'moderate', 18, 38700, 'English B1', false, true, true, true, 'Sponsor must hold a valid UK Skilled Worker sponsor licence. Healthcare surcharge applies.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Must be valid throughout your stay', true, 1),
  (v_id, 'identity',    'Biometric information',                           'Enrolled at visa application centre (VAC)', true, 2),
  (v_id, 'employment',  'Certificate of Sponsorship (CoS)',               'Reference number provided by UK-licensed employer sponsor', true, 1),
  (v_id, 'employment',  'Job at appropriate skill level',                  'RQF Level 3 or above (A-level equivalent)', true, 2),
  (v_id, 'financial',   'Salary of £38,700+ per year',                    'Or going rate for occupation, whichever is higher (2024 threshold)', true, 1),
  (v_id, 'financial',   'Personal savings of £1,270',                     'If employer does not certify maintenance; held for 28 consecutive days', false, 2),
  (v_id, 'language',    'English language proof (B1 CEFR)',               'IELTS, Trinity SELT, or degree from English-speaking country', true, 1),
  (v_id, 'legal',       'Criminal record certificate',                    'Required for roles involving vulnerable groups or from certain countries', false, 1),
  (v_id, 'health',      'Tuberculosis (TB) test result',                  'If applying from a listed country (e.g. India, Pakistan, Nigeria)', false, 1),
  (v_id, 'other',       'Immigration Health Surcharge payment',           '£1,035/year; paid as part of application', true, 1),
  (v_id, 'other',       'Application fee payment',                        'Online payment as part of the visa application', true, 2);
END $$;

-- ============================================================
-- CANADA - FEDERAL SKILLED WORKER (Express Entry)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, language_required, health_insurance_required, criminal_check_required, medical_exam_required, notes)
  VALUES ('Canada', 'canada', 'North America', 'Federal Skilled Worker (Express Entry)', 'work', 'hard', 18, 'English or French CLB 7', false, true, true, 'Points-based CRS system. Minimum 67/100 points required. ITA needed before applying.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Must be valid for at least 6 months after expected entry', true, 1),
  (v_id, 'identity',    'Digital photo meeting specifications',            'Must meet IRCC photo requirements', true, 2),
  (v_id, 'employment',  'Work experience documentation',                  'At least 1 year of skilled work experience in past 10 years (NOC TEER 0/1/2/3)', true, 1),
  (v_id, 'employment',  'Reference letters from employers',               'On company letterhead, signed, detailing duties and dates', true, 2),
  (v_id, 'education',   'Educational Credential Assessment (ECA)',         'From IRCC-designated organization (e.g. WES, ICAS)', true, 1),
  (v_id, 'education',   'Transcripts and degree certificates',             'Officially translated if not in English/French', true, 2),
  (v_id, 'language',    'IELTS or CELPIP (English) / TEF or TCF (French)', 'CLB 7 minimum in all four abilities for FSW', true, 1),
  (v_id, 'financial',   'Proof of settlement funds',                      'Unless you have valid Canadian work offer; amount depends on family size', false, 1),
  (v_id, 'legal',       'Police certificates',                            'From each country lived in for 6+ months since age 18', true, 1),
  (v_id, 'health',      'Medical examination',                            'By IRCC-designated physician (panel physician)', true, 1),
  (v_id, 'other',       'Invitation to Apply (ITA)',                      'Issued by IRCC based on CRS score; required before submitting full application', true, 1),
  (v_id, 'other',       'Use of Representative form (if applicable)',     'IMM 5476 if using an immigration consultant or lawyer', false, 2);
END $$;

-- ============================================================
-- AUSTRALIA - SKILLED INDEPENDENT VISA (Subclass 189)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, max_age, language_required, health_insurance_required, criminal_check_required, medical_exam_required, notes)
  VALUES ('Australia', 'australia', 'Oceania', 'Skilled Independent Visa (Subclass 189)', 'work', 'hard', 18, 44, 'English Competent (IELTS 6)', false, true, true, 'Points-tested visa. Must score 65+ points. Occupation must be on the skilled occupation list (SOL). No employer sponsor needed.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'All passports held in the past 10 years may be required', true, 1),
  (v_id, 'identity',    'Passport-size photos',                           'Recent, meeting Australian visa photo requirements', true, 2),
  (v_id, 'employment',  'Skills assessment from assessing authority',     'Positive assessment from the relevant body (e.g. Engineers Australia, ACS, TRA)', true, 1),
  (v_id, 'employment',  'Evidence of work experience',                    'Employment references, payslips, tax records for points claim', true, 2),
  (v_id, 'education',   'Academic qualifications',                        'Degree/diploma certificates and transcripts', true, 1),
  (v_id, 'language',    'English language test result',                   'IELTS, PTE, TOEFL or OET; minimum Competent English (IELTS 6 each band)', true, 1),
  (v_id, 'health',      'Medical examination',                            'Through eMedical system with a panel physician', true, 1),
  (v_id, 'legal',       'Police clearance certificates',                  'For each country lived in for 12+ months in past 10 years (since age 16)', true, 1),
  (v_id, 'other',       'Expression of Interest (EOI) via SkillSelect',  'Submitted online; must receive invitation before lodging visa application', true, 1),
  (v_id, 'other',       'Statement of claims',                            'Completed online in ImmiAccount', true, 2),
  (v_id, 'family',      'Evidence of family members (if including)',      'Birth certificates, marriage certificate, adoption papers as applicable', false, 1);
END $$;

-- ============================================================
-- UNITED STATES - H-1B SPECIALTY OCCUPATION VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, language_required, health_insurance_required, criminal_check_required, job_offer_required, sponsor_required, notes)
  VALUES ('United States', 'united-states', 'North America', 'H-1B Specialty Occupation Visa', 'work', 'hard', 18, NULL, false, false, true, true, 'Subject to annual lottery cap (65,000 + 20,000 for US master''s). Employer files petition. Three-year initial period, extendable to 6 years.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Valid at time of visa application', true, 1),
  (v_id, 'identity',    'DS-160 nonimmigrant visa application form',      'Completed online at ceac.state.gov', true, 2),
  (v_id, 'identity',    'Visa application fee payment receipt (MRV)',     'Machine readable visa fee paid before interview', true, 3),
  (v_id, 'employment',  'Approved Form I-129 petition',                  'Filed by employer/sponsor; approval notice from USCIS', true, 1),
  (v_id, 'employment',  'Labor Condition Application (LCA)',              'Approved by Department of Labor; included with I-129', true, 2),
  (v_id, 'employment',  'Offer letter / employment contract',             'Detailing job duties, salary, location, and duration', true, 3),
  (v_id, 'education',   'Bachelor''s degree or equivalent',               'In the specialty occupation field; foreign degrees may require evaluation', true, 1),
  (v_id, 'education',   'Official transcripts and degree certificates',   'Foreign credentials may need NACES-member evaluation', true, 2),
  (v_id, 'financial',   'Prevailing wage documentation',                  'Employer must pay at least the prevailing wage for the occupation/location', true, 1),
  (v_id, 'legal',       'Prior visa history and immigration records',     'All prior US visas, I-94 records, any immigration violations', false, 1),
  (v_id, 'other',       'DS-2019 or notice of action',                   'Supporting petition documents from employer', true, 1),
  (v_id, 'other',       'Visa interview preparation',                    'Attend consular interview with all original documents', true, 2);
END $$;

-- ============================================================
-- NETHERLANDS - HIGHLY SKILLED MIGRANT (Kennismigrant)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, language_required, health_insurance_required, criminal_check_required, job_offer_required, sponsor_required, notes)
  VALUES ('Netherlands', 'netherlands', 'Europe', 'Highly Skilled Migrant (Kennismigrant)', 'work', 'easy', 18, 4752, NULL, true, false, true, true, 'Employer must be IND-recognised sponsor. Salary threshold ~€4,752/month (2024, under 30: €3,480). Fast-track processing (2 weeks).')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Valid for at least 6 months; all pages must be scannable', true, 1),
  (v_id, 'identity',    'Passport-size photo',                            'Colour, recent, plain white background', true, 2),
  (v_id, 'employment',  'Employment contract with recognised sponsor',    'IND-registered employer must initiate application on your behalf', true, 1),
  (v_id, 'employment',  'Salary meeting minimum threshold',               '€4,752/month (age 30+), €3,480/month (under 30), or €2,801 for after-study graduates (2024)', true, 2),
  (v_id, 'employment',  'Employer''s IND sponsor number',                 'Provided by the recognised sponsor', true, 3),
  (v_id, 'health',      'Dutch health insurance',                         'Must arrange within 4 months of arrival', true, 1),
  (v_id, 'accommodation','Proof of address in the Netherlands',           'Rental contract or employer-provided housing letter', true, 1),
  (v_id, 'other',       'Antecedents certificate (MVV application)',      'Required if home country requires entry visa; MVV sticker in passport', false, 1),
  (v_id, 'other',       'DigiD registration after arrival',              'Digital ID for Dutch government services', false, 2);
END $$;

-- ============================================================
-- PORTUGAL - D3 HIGHLY QUALIFIED ACTIVITY VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, language_required, health_insurance_required, criminal_check_required, job_offer_required, notes)
  VALUES ('Portugal', 'portugal', 'Europe', 'D3 Highly Qualified Activity Visa', 'work', 'moderate', 18, NULL, true, true, true, 'For highly qualified workers. Leads to 2-year residence permit. Must earn at least 1.5x minimum wage (~€1,710/month in 2024).')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Valid for at least 3 months beyond intended stay', true, 1),
  (v_id, 'identity',    'Visa application form',                          'Completed and signed', true, 2),
  (v_id, 'identity',    '2 passport-size photos',                         'Recent, plain background', true, 3),
  (v_id, 'employment',  'Employment contract or binding job offer',       'Signed by Portuguese employer; must include salary information', true, 1),
  (v_id, 'employment',  'Academic / professional qualification proof',    'Recognised degree or certification for the role', true, 2),
  (v_id, 'financial',   'Proof of sufficient income',                     'At least 1.5× minimum wage (€1,140/month; approx. €1,710/month 2024)', true, 1),
  (v_id, 'health',      'Travel and health insurance',                    'Minimum €30,000 coverage; valid throughout Schengen area', true, 1),
  (v_id, 'legal',       'Portuguese criminal record certificate',         'Obtainable in Portugal after arrival; some consulates require home country certificate', false, 1),
  (v_id, 'legal',       'Criminal record from country of residence',      'Apostilled and translated into Portuguese if applicable', true, 2),
  (v_id, 'accommodation','Proof of accommodation',                        'Rental agreement or signed declaration of accommodation', true, 1),
  (v_id, 'other',       'NIF (Portuguese tax number)',                    'Can be obtained in Portugal or via Portuguese consulate abroad', false, 1);
END $$;

-- ============================================================
-- UAE - GOLDEN VISA (Skilled Professional)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, language_required, health_insurance_required, criminal_check_required, medical_exam_required, notes)
  VALUES ('United Arab Emirates', 'united-arab-emirates', 'Middle East', 'Golden Visa (Skilled Professional)', 'work', 'moderate', 18, 4000, NULL, true, true, true, '10-year renewable residency visa. For specialists in science, engineering, arts, culture. Salary AED 30,000/month minimum for some categories.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Minimum 6 months validity', true, 1),
  (v_id, 'identity',    'Passport-size photo on white background',        'Recent, clear, colour photo', true, 2),
  (v_id, 'employment',  'Employment contract in UAE',                     'From an entity in the first or second occupational level (MOHRE classification)', true, 1),
  (v_id, 'employment',  'Proof of specialised skills / profession',       'Professional licence, certificates, portfolio where applicable', true, 2),
  (v_id, 'financial',   'Salary statement (AED 30,000/month minimum)',    'Bank statement or payroll showing qualifying income', true, 1),
  (v_id, 'health',      'Medical fitness test',                           'Conducted at approved UAE medical centre; includes blood tests and chest X-ray', true, 1),
  (v_id, 'health',      'UAE health insurance',                           'Mandatory for all residents in UAE', true, 2),
  (v_id, 'legal',       'Good conduct certificate',                       'Police clearance from home country and/or UAE', true, 1),
  (v_id, 'education',   'Academic qualifications (Bachelor minimum)',     'Degree certificate; may require attestation and translation', true, 1),
  (v_id, 'other',       'Emirates ID registration',                       'Biometric registration at ICA service centre after arrival', true, 1),
  (v_id, 'other',       'Visa fee payment',                               'Paid via ICA or GDRFA online portal', true, 2);
END $$;

-- ============================================================
-- UK - STUDENT VISA (formerly Tier 4)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_savings_usd, language_required, health_insurance_required, criminal_check_required, sponsor_required, notes)
  VALUES ('United Kingdom', 'united-kingdom', 'Europe', 'Student Visa', 'study', 'easy', 16, 1334, 'English B2 (SELT)', false, false, true, 'CAS (Confirmation of Acceptance for Studies) required. Healthcare surcharge (£776/year). 20 hrs/week work permitted during term.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Valid for the full duration of your course', true, 1),
  (v_id, 'identity',    'Biometric information',                           'Enrolled at a visa application centre (VAC)', true, 2),
  (v_id, 'education',   'Confirmation of Acceptance for Studies (CAS)',   'CAS number from your UK UKVI-licensed university or college', true, 1),
  (v_id, 'education',   'Academic qualifications and transcripts',        'Previous degrees, diplomas or A-level equivalent', true, 2),
  (v_id, 'education',   'ATAS certificate (if required)',                  'Academic Technology Approval Scheme — for certain postgraduate courses', false, 3),
  (v_id, 'language',    'English language test (B2 CEFR)',               'IELTS UKVI, PTE Academic UKVI, or equivalent SELT', true, 1),
  (v_id, 'financial',   'Proof of funds (tuition + living costs)',        '£1,334/month (London) or £1,023/month (elsewhere) for 9 months + first-year tuition fees', true, 1),
  (v_id, 'financial',   'Bank statements (28 consecutive days)',          'Funds must have been held continuously for 28 days before application', true, 2),
  (v_id, 'health',      'Tuberculosis test result (if applicable)',       'Required for applicants from certain countries (e.g. India, Pakistan)', false, 1),
  (v_id, 'other',       'Immigration Health Surcharge payment',           '£776/year; paid as part of the application', true, 1),
  (v_id, 'accommodation','Proof of accommodation',                        'University accommodation letter or signed tenancy agreement for first term', false, 1);
END $$;

-- ============================================================
-- AUSTRALIA - STUDENT VISA (Subclass 500)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_savings_usd, language_required, health_insurance_required, criminal_check_required, medical_exam_required, sponsor_required, notes)
  VALUES ('Australia', 'australia', 'Oceania', 'Student Visa (Subclass 500)', 'study', 'easy', 6, 21000, 'English (IELTS 5.5)', true, false, false, true, 'Requires CoE from registered institution (CRICOS). Overseas Student Health Cover (OSHC) mandatory. Up to 48 hrs/fortnight work permitted.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Australian authorities prefer validity for full course duration', true, 1),
  (v_id, 'identity',    'Recent passport-size photograph',                'Colour, plain background, meet Australian requirements', true, 2),
  (v_id, 'education',   'Confirmation of Enrolment (CoE)',               'From CRICOS-registered institution; prerequisite for visa application', true, 1),
  (v_id, 'education',   'Academic transcripts and certificates',          'Previous educational qualifications relevant to course', true, 2),
  (v_id, 'language',    'English language test result',                   'IELTS, PTE, TOEFL, or CAE; minimum varies by course (typically 5.5–6.5 IELTS)', true, 1),
  (v_id, 'financial',   'Proof of financial capacity',                    'AUD $21,041/year (2024 threshold) for living costs + tuition + travel', true, 1),
  (v_id, 'financial',   'Bank statements or scholarship letter',          'Showing sufficient funds in applicant''s or guardian''s name', true, 2),
  (v_id, 'health',      'Overseas Student Health Cover (OSHC)',           'Must be purchased before visa grant; covers duration of CoE', true, 1),
  (v_id, 'health',      'Medical examination',                            'Required for applicants from certain countries or those studying health-related fields', false, 2),
  (v_id, 'legal',       'Character declaration',                          'Self-declaration form 1221; police certificate may be required', false, 1),
  (v_id, 'other',       'Genuine Temporary Entrant (GTE) statement',     'Personal statement explaining why you want to study in Australia', true, 1);
END $$;

-- ============================================================
-- CANADA - STUDY PERMIT
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_savings_usd, language_required, health_insurance_required, criminal_check_required, medical_exam_required, sponsor_required, notes)
  VALUES ('Canada', 'canada', 'North America', 'Study Permit', 'study', 'moderate', 17, 20635, 'English CLB 4 / French NCLC 4', false, false, true, true, 'Letter of Acceptance (LOA) from a Designated Learning Institution (DLI) required. 20 hrs/week work permitted off-campus during academic session.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Must be valid for the full duration of your studies', true, 1),
  (v_id, 'identity',    'Photographs meeting IRCC requirements',          'Recent digital photo submitted with online application', true, 2),
  (v_id, 'education',   'Letter of Acceptance (LOA) from a DLI',         'From a Designated Learning Institution (Government of Canada list)', true, 1),
  (v_id, 'education',   'Transcripts from previous institutions',        'Official transcripts showing academic history', true, 2),
  (v_id, 'language',    'Language test results (if required)',            'IELTS, TOEFL, TEF, TCF; required for admission; not always for permit itself', false, 1),
  (v_id, 'financial',   'Proof of funds (tuition + living)',              'CAD $20,635/year (2024) for living costs + tuition fees + travel', true, 1),
  (v_id, 'financial',   'Bank statements, scholarship or sponsor letter', 'Funds must be accessible; GIC option available for SDS stream', true, 2),
  (v_id, 'health',      'Medical examination',                            'If studying for 6+ months or from certain countries; by IRCC panel physician', false, 1),
  (v_id, 'legal',       'Police certificates',                            'If required based on country of residence', false, 1),
  (v_id, 'other',       'Statement of purpose / study plan',              'Explaining why you''re studying in Canada and your post-graduation plans', true, 1),
  (v_id, 'other',       'Quebec Acceptance Certificate (CAQ)',           'Required only if studying in Quebec; obtained before study permit', false, 2);
END $$;

-- ============================================================
-- GERMANY - STUDENT VISA (Studienvisum)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_savings_usd, language_required, health_insurance_required, criminal_check_required, notes)
  VALUES ('Germany', 'germany', 'Europe', 'Student Visa (Studienvisum)', 'study', 'moderate', 17, 11208, 'German B2 or English (course-dependent)', true, false, 'Blocked account (Sperrkonto) of €11,208/year (2024) required. Free tuition at most public universities.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Must be valid for at least 1 year beyond visa start', true, 1),
  (v_id, 'identity',    'Biometric passport photos',                      '2 photos, 35×45mm, plain background', true, 2),
  (v_id, 'identity',    'Completed visa application form',                'Downloadable from German embassy website', true, 3),
  (v_id, 'education',   'University admission letter',                    'Conditional or unconditional offer from a German university (Zulassungsbescheid)', true, 1),
  (v_id, 'education',   'Academic certificates and transcripts',          'Apostilled and certified German or English translation', true, 2),
  (v_id, 'language',    'German language certificate',                    'B2 level (DSH, TestDaF, Goethe); or English proof if course is in English', true, 1),
  (v_id, 'financial',   'Blocked account (Sperrkonto) proof',             '€11,208 deposited in recognized German blocked account (e.g. Deutsche Bank, Fintiba, Expatrio)', true, 1),
  (v_id, 'health',      'Health insurance confirmation',                  'German statutory student health insurance (e.g. TK, AOK, Barmer); approx. €120/month', true, 1),
  (v_id, 'accommodation','Proof of accommodation',                        'University hall of residence booking or signed rental contract', true, 1),
  (v_id, 'other',       'CV / Motivation letter',                        'Explaining academic goals and course of study', true, 1),
  (v_id, 'other',       'APS certificate (Chinese/Indian/Vietnamese)',   'Akademische Prüfstelle certification required for applicants from these countries', false, 2);
END $$;

-- ============================================================
-- USA - F-1 STUDENT VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, language_required, health_insurance_required, criminal_check_required, sponsor_required, notes)
  VALUES ('United States', 'united-states', 'North America', 'F-1 Student Visa', 'study', 'moderate', 18, NULL, false, false, true, 'SEVIS I-20 from SEVP-approved school required. Must demonstrate ties to home country and non-immigrant intent. On-campus work 20 hrs/week permitted.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Valid at least 6 months into the future', true, 1),
  (v_id, 'identity',    'DS-160 nonimmigrant visa form',                 'Completed online at ceac.state.gov', true, 2),
  (v_id, 'identity',    'Photo meeting DS-160 requirements',              'Uploaded during form completion', true, 3),
  (v_id, 'education',   'Form I-20 from SEVP-approved school',           'Issued by your US school after acceptance', true, 1),
  (v_id, 'education',   'Acceptance letter from institution',             'Official admission letter from the school', true, 2),
  (v_id, 'education',   'Academic transcripts and test scores',           'SAT/ACT, GRE/GMAT, plus high school/university transcripts', true, 3),
  (v_id, 'financial',   'Proof of financial support',                    'Bank statements, scholarship award letters; must cover full cost of attendance', true, 1),
  (v_id, 'financial',   'Sponsor''s financial documents (if sponsored)', 'Affidavit of support, sponsor''s bank statements and employment letter', false, 2),
  (v_id, 'language',    'English language test scores',                  'TOEFL, IELTS, or Duolingo English Test (institution-dependent)', true, 1),
  (v_id, 'other',       'SEVIS fee payment receipt (Form I-901)',        'Fee paid at fmjfee.com before visa interview', true, 1),
  (v_id, 'other',       'Visa application fee (MRV) receipt',            'Paid before scheduling consular interview', true, 2),
  (v_id, 'other',       'Evidence of ties to home country',              'Property, family, employment guaranteeing return; strengthens non-immigrant intent', false, 3);
END $$;
