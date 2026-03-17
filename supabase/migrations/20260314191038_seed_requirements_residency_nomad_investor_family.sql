/*
  # Seed Requirements Database - Residency, Digital Nomad, Investor & Family Visas
  
  Adds requirement data for:
  - Permanent residency: Germany, Spain, Portugal, Australia, Canada, New Zealand
  - Digital nomad visas: Portugal, Spain, Germany, Costa Rica, Georgia
  - Investor/Golden visas: Portugal, Spain, Greece, UAE, Singapore
  - Family reunification: UK, Germany, Canada
*/

-- ============================================================
-- PORTUGAL - DIGITAL NOMAD VISA (D8)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, language_required, health_insurance_required, criminal_check_required, notes)
  VALUES ('Portugal', 'portugal', 'Europe', 'Digital Nomad Visa (D8)', 'nomad', 'easy', 18, 3480, NULL, true, true, 'Monthly income must be 4× Portuguese minimum wage (€3,480/month in 2024). Initial 4-month visa; convert to 2-year residence permit in Portugal.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Minimum 3 months validity beyond intended stay', true, 1),
  (v_id, 'identity',    'Visa application form',                          'Completed and signed; submitted to Portuguese consulate', true, 2),
  (v_id, 'identity',    '2 passport-size photos',                         'Recent colour photos, plain background', true, 3),
  (v_id, 'financial',   'Proof of remote income (€3,480+/month)',         'Last 3 months'' bank statements, contracts, invoices, or employer letter', true, 1),
  (v_id, 'financial',   'NHR tax regime application (optional)',          'Non-Habitual Resident flat 20% tax; apply after getting NIF', false, 2),
  (v_id, 'employment',  'Employment contract or freelance contracts',     'Showing ongoing remote work; or proof of self-employment/company ownership', true, 1),
  (v_id, 'employment',  'Company registration or freelancer registration', 'Business registration documents if self-employed', false, 2),
  (v_id, 'health',      'Travel and health insurance',                    'Minimum €30,000 coverage throughout Schengen area', true, 1),
  (v_id, 'legal',       'Criminal record certificate',                    'From country of residence; apostilled and translated into Portuguese if needed', true, 1),
  (v_id, 'accommodation','Proof of accommodation in Portugal',            'Rental agreement or booking confirmation for initial period', true, 1),
  (v_id, 'other',       'NIF (Portuguese tax number)',                    'Can be obtained via consulate or tax office in Portugal', false, 1),
  (v_id, 'other',       'Cover letter',                                   'Explaining nature of remote work and intention to reside in Portugal', false, 2);
END $$;

-- ============================================================
-- SPAIN - DIGITAL NOMAD VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, language_required, health_insurance_required, criminal_check_required, notes)
  VALUES ('Spain', 'spain', 'Europe', 'Digital Nomad Visa', 'nomad', 'moderate', 18, 2646, NULL, true, true, 'Income must be 200% of monthly Spanish minimum wage (~€2,646/month in 2024). Max 20% of income from Spanish clients. 1-year visa extendable to 3-year residence permit.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Minimum 1 year validity from application date', true, 1),
  (v_id, 'identity',    'Completed visa application form',                'Modelo EX-01 or national visa form', true, 2),
  (v_id, 'identity',    '2 recent passport-size photos',                  'Colour, plain white background', true, 3),
  (v_id, 'financial',   'Proof of income (200% minimum wage)',            'Last 3 months'' bank statements; payslips, invoices, or company accounts', true, 1),
  (v_id, 'employment',  'Employment contract or client contracts',        'Proving remote work; must show less than 20% of work is for Spanish entities', true, 1),
  (v_id, 'employment',  'Company registration (if self-employed)',        'Business registration documents; proof you have operated for 1+ year', false, 2),
  (v_id, 'health',      'Private health insurance in Spain',              'Full coverage in Spain; not limited to emergencies', true, 1),
  (v_id, 'legal',       'Background check / criminal record certificate', 'From every country of residence in last 5 years; apostilled', true, 1),
  (v_id, 'accommodation','Proof of accommodation in Spain',               'Rental contract for initial residence; required at application', true, 1),
  (v_id, 'other',       'NIE (Número de Identificación de Extranjero)',   'Obtained in Spain; required for tax registration', false, 1);
END $$;

-- ============================================================
-- GEORGIA - REMOTELY FROM GEORGIA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, health_insurance_required, criminal_check_required, notes)
  VALUES ('Georgia', 'georgia', 'Europe', 'Remotely From Georgia Program', 'nomad', 'easy', 18, 2000, true, false, 'One of the easiest nomad visas. No formal government application — just arrive and apply for the program. 1-year stay with possible extension. Many nationalities get 365 days visa-free.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Most nationalities receive 365-day visa-free entry to Georgia', true, 1),
  (v_id, 'financial',   'Proof of remote income ($2,000+/month)',          'Bank statements, invoices, or employer letter', true, 1),
  (v_id, 'employment',  'Proof of remote employment or business',         'Contract, client invoices, or self-employment registration', true, 1),
  (v_id, 'health',      'Health insurance',                               'International health insurance or Georgian private plan', true, 1),
  (v_id, 'accommodation','Accommodation booking or rental',               'Hotel booking or apartment rental for initial period', true, 1),
  (v_id, 'other',       'Online program application',                     'Register at remotelyfromgeorgia.com after entering the country', true, 1);
END $$;

-- ============================================================
-- COSTA RICA - DIGITAL NOMAD VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, health_insurance_required, criminal_check_required, medical_exam_required, notes)
  VALUES ('Costa Rica', 'costa-rica', 'Latin America', 'Digital Nomad Visa', 'nomad', 'moderate', 18, 3000, true, true, false, 'Income of $3,000+/month required ($4,000 if applying with dependents). 1-year visa extendable to 2 years. Tax-exempt on foreign-sourced income.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Must be valid for at least 1 year from application', true, 1),
  (v_id, 'identity',    'Digital or printed passport photos',             'Recent colour photos meeting consular specifications', true, 2),
  (v_id, 'financial',   'Proof of income ($3,000+/month)',                 'Bank statements (last 3 months), payslips, or company dividends', true, 1),
  (v_id, 'financial',   'Bank solvency letter',                           'Letter from your bank confirming account standing and balance', true, 2),
  (v_id, 'employment',  'Employment letter or client contracts',           'Proving remote, non-Costa Rican-sourced income', true, 1),
  (v_id, 'health',      'International health insurance',                 'Must cover medical expenses in Costa Rica for full visa duration', true, 1),
  (v_id, 'legal',       'Police clearance certificate',                   'From your country of residence; apostilled', true, 1),
  (v_id, 'other',       'Application form (DGME)',                        'Costa Rican immigration form submitted in person or via agent', true, 1);
END $$;

-- ============================================================
-- PORTUGAL - GOLDEN VISA (ARI - Now Closed to Property)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_savings_usd, health_insurance_required, criminal_check_required, notes)
  VALUES ('Portugal', 'portugal', 'Europe', 'Golden Visa (Investment Route)', 'investor', 'moderate', 18, 540000, true, true, 'Property investment route closed in 2023. Investment fund option remains: minimum €500,000 in qualifying investment funds. Leads to residency and path to citizenship in 5 years.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  '6 months minimum validity', true, 1),
  (v_id, 'identity',    '2 recent passport-size photographs',              'Colour, plain background', true, 2),
  (v_id, 'financial',   'Proof of qualifying investment',                 'Investment fund subscription agreement; minimum €500,000 commitment', true, 1),
  (v_id, 'financial',   'Source of funds declaration',                    'Bank-certified statement explaining origin of investment funds', true, 2),
  (v_id, 'financial',   'Bank statements showing transfer of funds',      'Confirming funds arrived in Portugal', true, 3),
  (v_id, 'legal',       'Criminal record certificate',                    'From country of nationality and country of residence; apostilled', true, 1),
  (v_id, 'health',      'Health insurance in Portugal',                   'Valid Portuguese or international policy covering Portugal', true, 1),
  (v_id, 'other',       'NIF (Portuguese tax number)',                    'Obtained in Portugal or via consulate; required for investment', true, 1),
  (v_id, 'other',       'Portuguese bank account',                        'Required to make qualifying investment; opens with NIF', true, 2),
  (v_id, 'other',       'Investment certification from fund manager',     'Confirming your participation in qualifying fund', true, 3);
END $$;

-- ============================================================
-- SPAIN - GOLDEN VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_savings_usd, health_insurance_required, criminal_check_required, notes)
  VALUES ('Spain', 'spain', 'Europe', 'Golden Visa (Investor Visa)', 'investor', 'moderate', 18, 540000, true, true, 'Real estate investment of €500,000 minimum still allowed (unlike Portugal). Also possible via €1M in Spanish company shares or €2M in Spanish public debt. 2-year initial visa.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Minimum 1 year validity', true, 1),
  (v_id, 'identity',    '2 recent passport-size photos',                  'Colour, plain white background, recent', true, 2),
  (v_id, 'financial',   'Proof of qualifying investment (€500k+)',        'Real estate deed, bank transfer evidence, share certificates', true, 1),
  (v_id, 'financial',   'Source of funds documentation',                  'Bank statements, audit reports, inheritance/sale records as applicable', true, 2),
  (v_id, 'financial',   'No tax debts in Spain',                         'Certificate from Spanish Tax Agency (AEAT) confirming no liabilities', true, 3),
  (v_id, 'legal',       'Criminal record certificate',                    'From country of residence and/or nationality; apostilled and translated', true, 1),
  (v_id, 'legal',       'No Spanish entry prohibition',                  'Declaration that you are not prohibited from entering Spain', true, 2),
  (v_id, 'health',      'Private health insurance in Spain',              'Full coverage (not just emergency) in Spain', true, 1),
  (v_id, 'other',       'NIE number',                                     'Spanish foreigner identity number; obtained at consulate or in Spain', true, 1),
  (v_id, 'other',       'Property registration or investment certificate','Nota simple from Registro de la Propiedad or investment confirmation', true, 2);
END $$;

-- ============================================================
-- GREECE - GOLDEN VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_savings_usd, health_insurance_required, criminal_check_required, notes)
  VALUES ('Greece', 'greece', 'Europe', 'Golden Visa (Real Estate)', 'investor', 'easy', 18, 270000, true, true, 'Minimum €250,000 (now €800,000 in Athens, Thessaloniki, Mykonos, Santorini from 2024). 5-year renewable permit. No physical residence requirement. Includes family members.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport (all family members)',            '6+ months validity for each applicant', true, 1),
  (v_id, 'identity',    'Recent passport photos',                         '4 photos per applicant, colour, plain background', true, 2),
  (v_id, 'financial',   'Property purchase contract / deed',              'Title deed and proof of payment showing €250k+ (or zone-appropriate threshold)', true, 1),
  (v_id, 'financial',   'Greek bank account / transfer evidence',         'Confirming investment funds sourced and transferred', true, 2),
  (v_id, 'financial',   'Source of funds declaration',                    'Notarised statement on origin of funds', true, 3),
  (v_id, 'legal',       'Criminal record certificate',                    'From country of residence; apostilled and translated', true, 1),
  (v_id, 'health',      'Health insurance in Greece',                     'Full-coverage insurance for all applicants', true, 1),
  (v_id, 'other',       'Greek tax number (AFM)',                         'Obtained at local tax office (IRS) or via representative', true, 1),
  (v_id, 'other',       'Power of attorney (if using agent)',             'Notarised PoA to lawyer to act on your behalf', false, 2),
  (v_id, 'family',      'Marriage and birth certificates (dependents)',   'Apostilled and translated for spouse and children', false, 1);
END $$;

-- ============================================================
-- SINGAPORE - EMPLOYMENT PASS
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, language_required, health_insurance_required, criminal_check_required, job_offer_required, sponsor_required, notes)
  VALUES ('Singapore', 'singapore', 'Asia', 'Employment Pass (EP)', 'work', 'moderate', 21, 5000, NULL, true, false, true, true, 'Minimum salary SGD $5,000/month (SGD $5,500 for financial services). COMPASS points framework applies for new EP applications. Employer-sponsored.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Must be valid throughout EP duration', true, 1),
  (v_id, 'identity',    'Digital passport photograph',                    'Uploaded during EP online application', true, 2),
  (v_id, 'employment',  'Job offer from Singapore employer',              'EP application submitted by employer via EP Online (MOM portal)', true, 1),
  (v_id, 'employment',  'Salary of at least SGD $5,000/month',           'Higher for financial sector ($5,500); and increases with age/experience', true, 2),
  (v_id, 'education',   'Degree or professional qualifications',         'From accredited institutions; MOM uses COMPASS framework to evaluate', true, 1),
  (v_id, 'education',   'Transcripts and certificates',                   'May be requested during assessment; official certified copies', false, 2),
  (v_id, 'financial',   'Salary documentation',                          'Offer letter clearly stating fixed monthly salary', true, 1),
  (v_id, 'health',      'Medical insurance',                              'Employer must provide insurance covering inpatient care', true, 1),
  (v_id, 'health',      'Medical examination',                           'Required on arrival for long-stay pass; done at approved clinic', false, 2),
  (v_id, 'other',       'Fixed Address in Singapore',                    'Required for pass registration after arrival', true, 1),
  (v_id, 'other',       'In-Principle Approval (IPA) letter',            'Issued by MOM before travel to Singapore', true, 2);
END $$;

-- ============================================================
-- GERMANY - PERMANENT RESIDENCE (Niederlassungserlaubnis)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, language_required, health_insurance_required, criminal_check_required, notes)
  VALUES ('Germany', 'germany', 'Europe', 'Permanent Residence Permit', 'residency', 'moderate', 18, 'German B1', true, true, 'After 5 years of legal residence (4 for EU Blue Card holders). Must demonstrate integration, stable income, pension contributions, and German language proficiency.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Current valid national passport', true, 1),
  (v_id, 'identity',    'Current residence permit',                       'Existing German residence permit (Aufenthaltserlaubnis)', true, 2),
  (v_id, 'identity',    'Anmeldung (registration)',                       'Current registered address in Germany', true, 3),
  (v_id, 'employment',  'Proof of stable employment',                     'Employment contract or self-employment income evidence', true, 1),
  (v_id, 'employment',  'Pay slips (last 3–6 months)',                   'Demonstrating sufficient and stable income', true, 2),
  (v_id, 'financial',   'Pension insurance contribution records',         'Nachweis über Rentenversicherungsbeiträge — 60 months paid', true, 1),
  (v_id, 'financial',   'Proof of financial self-sufficiency',            'No current receipt of social benefits (ALG II / Bürgergeld)', true, 2),
  (v_id, 'language',    'German B1 language certificate',                 'Goethe-Institut, telc, ÖSD, or DSD certificate at B1 level minimum', true, 1),
  (v_id, 'health',      'Health insurance coverage',                      'Statutory or private health insurance', true, 1),
  (v_id, 'legal',       'Certificate of good conduct (Führungszeugnis)', 'German federal criminal record certificate from Bundesamt für Justiz', true, 1),
  (v_id, 'other',       'Integration course certificate (if applicable)','DTZ (Deutsch-Test für Zuwanderer) or equivalent integration course', false, 1),
  (v_id, 'other',       'Proof of 5 years lawful residence',              'Copies of all previous permits showing 5-year residency', true, 2);
END $$;

-- ============================================================
-- CANADA - PERMANENT RESIDENCE (Express Entry FSW)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, language_required, health_insurance_required, criminal_check_required, medical_exam_required, notes)
  VALUES ('Canada', 'canada', 'North America', 'Permanent Residence (Express Entry)', 'residency', 'hard', 18, 'English CLB 7 / French NCLC 7', false, true, true, 'Comprehensive Ranking System (CRS) based. Minimum 67 points for eligibility. ITA required. Includes Federal Skilled Worker, Canadian Experience Class, and Federal Skilled Trades programs.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport (all family members)',            'Must be valid at time of application and for at least 6 months post-entry', true, 1),
  (v_id, 'identity',    'Photo meeting IRCC specifications',             'For each applicant; digital format for e-application', true, 2),
  (v_id, 'employment',  'Proof of skilled work experience',              'At least 1 year in NOC TEER 0-3 occupation; reference letters, pay stubs, T4s', true, 1),
  (v_id, 'employment',  'Employer reference letters',                    'On letterhead; detailing title, duties, salary, hours', true, 2),
  (v_id, 'education',   'Educational Credential Assessment (ECA)',       'From WES, ICAS, or other IRCC-recognized organization', true, 1),
  (v_id, 'education',   'Degree certificates and transcripts',           'Official; translated if not in English or French', true, 2),
  (v_id, 'language',    'IELTS General or CELPIP (English)',             'CLB 7 minimum; or TEF Canada / TCF Canada for French', true, 1),
  (v_id, 'financial',   'Proof of settlement funds',                    'Unless valid Canadian job offer; amount per family size (e.g. $13,757 for 1 person, 2024)', false, 1),
  (v_id, 'legal',       'Police clearance certificates',                 'For each country of residence 6+ months since age 18', true, 1),
  (v_id, 'health',      'Immigration medical exam (IME)',                'By IRCC-designated panel physician; valid 12 months', true, 1),
  (v_id, 'family',      'Marriage/common-law documentation',             'Marriage certificate; statutory declaration for common-law partners', false, 1),
  (v_id, 'family',      'Birth certificates (children)',                 'For all dependent children included in application', false, 2),
  (v_id, 'other',       'Invitation to Apply (ITA)',                    'Must receive ITA before submitting full PR application', true, 1);
END $$;

-- ============================================================
-- AUSTRALIA - PERMANENT RESIDENCE (Subclass 189)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, max_age, language_required, health_insurance_required, criminal_check_required, medical_exam_required, notes)
  VALUES ('Australia', 'australia', 'Oceania', 'Permanent Residence (Subclass 189)', 'residency', 'hard', 18, 44, 'English Competent (IELTS 6)', false, true, true, 'Points-tested permanent residency. 65+ points required. No employer or state sponsorship needed. Occupation must be on the Medium and Long-term Strategic Skills List (MLTSSL).')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'All passports held in last 10 years may be required', true, 1),
  (v_id, 'identity',    'Biometric passport photo',                       'Colour, recent, meets Department of Home Affairs specs', true, 2),
  (v_id, 'employment',  'Positive skills assessment',                    'From relevant Australian assessing authority (e.g. Engineers Australia, ACS)', true, 1),
  (v_id, 'employment',  'Employment references and evidence',             'Payslips, tax records, references covering points-claimed experience', true, 2),
  (v_id, 'education',   'Academic qualifications',                        'Degree and transcripts; may require NOOSR assessment', true, 1),
  (v_id, 'language',    'English test (IELTS, PTE, TOEFL, or OET)',       'Minimum Competent English (6 each band IELTS); higher scores earn more points', true, 1),
  (v_id, 'health',      'Medical examination',                            'Through eMedical system; includes chest X-ray for TB-risk countries', true, 1),
  (v_id, 'legal',       'Police clearance certificates',                  'For each country of residence 12+ months since age 16', true, 1),
  (v_id, 'family',      'Marriage certificate (if including partner)',    'Official document; translated and certified if not in English', false, 1),
  (v_id, 'family',      'Birth certificates (dependent children)',        'Official documents with certified translation if needed', false, 2),
  (v_id, 'other',       'Expression of Interest via SkillSelect',        'Submit EOI before receiving invitation to apply', true, 1),
  (v_id, 'other',       'Health insurance (until Medicare eligible)',     'Private health insurance until you can access Medicare', false, 2);
END $$;

-- ============================================================
-- UK - FAMILY VISA (Partner Route)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, language_required, health_insurance_required, criminal_check_required, sponsor_required, notes)
  VALUES ('United Kingdom', 'united-kingdom', 'Europe', 'Family Visa (Partner Route)', 'family', 'hard', 18, 29000, 'English A1', false, false, true, 'Sponsor (UK partner) must earn £29,000/year (2024 threshold, increasing to £38,700 by 2025). Both partners must be 18+. Initial 2.5-year visa then further leave.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Applicant''s passport with sufficient validity', true, 1),
  (v_id, 'identity',    'Biometric enrolment',                            'At a UK visa application centre (VAC)', true, 2),
  (v_id, 'family',      'Proof of relationship',                          'Marriage certificate, civil partnership certificate, or evidence of genuine cohabiting relationship (2+ years)', true, 1),
  (v_id, 'family',      'UK sponsor''s British/settled status proof',    'Passport, BRP, or indefinite leave to remain documentation', true, 2),
  (v_id, 'family',      'Photographs together as a couple',              'Evidence of genuine relationship — photos, messages, travel history together', true, 3),
  (v_id, 'financial',   'Sponsor income evidence (£29,000+/year)',       'P60, payslips (6 months), employer letter; savings can substitute', true, 1),
  (v_id, 'financial',   'Financial statement / savings evidence',        'If using savings: £16,000 minimum threshold over 6 months', false, 2),
  (v_id, 'language',    'English language proof (A1 CEFR)',              'Approved secure English language test (SELT) from UKVI-approved provider', true, 1),
  (v_id, 'accommodation','Adequate accommodation proof',                  'Rental agreement, mortgage statement, or letter from homeowner', true, 1),
  (v_id, 'other',       'Immigration Health Surcharge payment',          '£1,035/year; paid online as part of application', true, 1),
  (v_id, 'other',       'Visa fee payment',                              'Online payment as part of the application process', true, 2);
END $$;

-- ============================================================
-- GERMANY - FAMILY REUNIFICATION
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, language_required, health_insurance_required, criminal_check_required, sponsor_required, notes)
  VALUES ('Germany', 'germany', 'Europe', 'Family Reunification Visa', 'family', 'moderate', 18, 'German A1 (spouses)', true, false, true, 'Spouse joining German citizen or permanent resident. Must hold A1 German language certificate unless exceptions apply (e.g. academic degree, hardship cases).')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Must be valid for the entire intended duration of stay', true, 1),
  (v_id, 'identity',    '2 biometric passport photos',                   '35×45mm, plain background, recent', true, 2),
  (v_id, 'identity',    'Completed visa application form',               'Available at German embassy/consulate in home country', true, 3),
  (v_id, 'family',      'Marriage certificate (apostilled)',              'Officially certified and translated into German', true, 1),
  (v_id, 'family',      'Sponsor''s proof of German residency status',   'German passport, Niederlassungserlaubnis, or residence permit', true, 2),
  (v_id, 'family',      'Sponsor''s income proof',                       'Payslips, employment contract; sufficient to support family without social benefits', true, 3),
  (v_id, 'language',    'German A1 language certificate',                'From Goethe-Institut, telc, or ÖSD; exceptions may apply', true, 1),
  (v_id, 'health',      'Travel health insurance',                       'Valid for initial entry; statutory health insurance required after arrival', true, 1),
  (v_id, 'accommodation','Proof of suitable accommodation',              'At least 12m² per person; rental agreement or property ownership docs', true, 1),
  (v_id, 'other',       'Birth certificates (for children)',             'If children are included in the application; apostilled and translated', false, 1);
END $$;

-- ============================================================
-- THAILAND - THAILAND LONG TERM RESIDENT (LTR) VISA
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, min_income_usd, language_required, health_insurance_required, criminal_check_required, notes)
  VALUES ('Thailand', 'thailand', 'Asia', 'Long Term Resident (LTR) Visa', 'nomad', 'moderate', 20, 3000, NULL, true, true, '$80,000+ annual income (Wealthy Global Citizen: $1M assets). 10-year visa (2 × 5 years). Work permits via Digital Work Permit. Various categories including Remote Worker, Wealthy Pensioner.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Minimum 1 year validity from application date', true, 1),
  (v_id, 'identity',    'Passport-size photo',                            'Recent colour photo on white background', true, 2),
  (v_id, 'financial',   'Income proof ($80,000/year for Remote Worker)', 'Bank statements, payslips, or tax returns for last 2 years; or $40,000/year with $250,000 assets', true, 1),
  (v_id, 'employment',  'Employment contract or company registration',   'Proving remote work for foreign entity; not working in Thailand', true, 1),
  (v_id, 'health',      'Health insurance (min $50,000 coverage)',       'International or Thai health insurance with $50,000 inpatient minimum', true, 1),
  (v_id, 'legal',       'Criminal background check',                     'From country of nationality and current residence; apostilled', true, 1),
  (v_id, 'health',      'Medical certificate (no prohibited diseases)',  'Issued by licensed physician within 3 months of application', true, 2),
  (v_id, 'other',       'LTR visa application (BOI portal)',             'Applied through Thailand Board of Investment (BOI) official portal', true, 1),
  (v_id, 'financial',   'Tax returns (last 2 years)',                    'For Remote Worker category; proof of qualifying foreign income', true, 2);
END $$;

-- ============================================================
-- NEW ZEALAND - SKILLED MIGRANT CATEGORY (SMC)
-- ============================================================
DO $$
DECLARE v_id uuid;
BEGIN
  INSERT INTO visa_requirements (country, country_slug, region, visa_type, visa_category, difficulty, min_age, max_age, language_required, health_insurance_required, criminal_check_required, medical_exam_required, notes)
  VALUES ('New Zealand', 'new-zealand', 'Oceania', 'Skilled Migrant Category (SMC)', 'work', 'hard', 18, NULL, 'English (IELTS 6.5)', false, true, true, 'Points-based residency. Expression of Interest (EOI) pooling. Job offer in NZ significantly increases points. 160 points minimum to enter pool. Currently being reviewed by Immigration NZ.')
  RETURNING id INTO v_id;

  INSERT INTO requirement_items (visa_requirement_id, category_id, label, detail, is_mandatory, sort_order) VALUES
  (v_id, 'identity',    'Valid passport',                                  'Must be valid 3+ months beyond intended stay', true, 1),
  (v_id, 'identity',    'Recent passport photo',                          'Meets INZ specifications; submitted with application', true, 2),
  (v_id, 'employment',  'Skills assessment or occupation evidence',      'For regulated occupations; registration with NZ authority (e.g. NZMC, NZRA)', false, 1),
  (v_id, 'employment',  'Employment references and evidence',             'NZ job offer is highly desirable for points; overseas experience documented', true, 2),
  (v_id, 'education',   'Academic qualifications (NZQA assessed)',       'NZ Qualifications Authority assessment for foreign qualifications', true, 1),
  (v_id, 'education',   'Transcripts and degree certificates',           'Official certified copies; translated if not in English', true, 2),
  (v_id, 'language',    'English language evidence (IELTS 6.5)',         'IELTS Academic 6.5 overall; or equivalent Cambridge/OET', true, 1),
  (v_id, 'health',      'Medical examination',                            'By INZ-approved physician; chest X-ray required for TB-risk applicants', true, 1),
  (v_id, 'legal',       'Police clearance certificates',                  'For every country lived in for 5+ years since age 17', true, 1),
  (v_id, 'family',      'Evidence of partner/family (if applicable)',    'Marriage certificate, de facto evidence, birth certificates', false, 1),
  (v_id, 'other',       'Expression of Interest (EOI) selection',        'Must be selected from pool by INZ before lodging residence application', true, 1);
END $$;
