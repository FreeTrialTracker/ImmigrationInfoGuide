/*
  # Batch 1 Group 5: Philippines, Vietnam, South Africa, Nigeria, Peru
  
  Adds all 6 goal pathways for these destinations.
*/

INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type, processing_time, validity_period, last_updated)
VALUES

-- PHILIPPINES
('any', 'philippines', 'Work', 'Alien Employment Permit (AEP) + 9(g) Visa',
 'Non-immigrant foreign nationals working in the Philippines require an Alien Employment Permit from DOLE (Department of Labor and Employment) and a 9(g) Pre-arranged Employment Visa. The AEP certifies that no qualified Filipino is available for the position.',
 'Must have a specific job offer from a Philippine employer. Employer must demonstrate the position cannot be filled by a Filipino national (for most positions). Certain nationalities and positions are exempt from AEP requirements.',
 'Employer''s application for AEP from DOLE, employment contract, valid passport, passport photos, tax identification from home country, medical examination.',
 'AEP: typically 4–6 weeks; 9(g) visa: 2–4 weeks additional', 'PHP 9,000 (AEP) + PHP 7,000 (9g visa)',
 'work', '6–10 weeks total', '1–3 years, renewable', CURRENT_DATE),

('any', 'philippines', 'Study', 'Student Visa (9(f))',
 'International students enrolled at DepEd/CHED-recognized schools in the Philippines for courses lasting 6+ months. The Philippines is a popular destination for English language study and affordable medical/nursing programs.',
 'Must be enrolled at a DepEd or CHED-recognized institution. Must have a school acceptance letter. Must pass a medical examination. Financial proof of USD 1,000/year + tuition.',
 'Acceptance letter from school, proof of financial support, valid passport, passport photos, medical examination, academic records.',
 'Typically 2–4 weeks (BID application)', 'PHP 6,000–10,000',
 'study', '2–4 weeks', 'Duration of studies (typically 1 year renewable)', CURRENT_DATE),

('any', 'philippines', 'Digital Nomad', 'SRRV (Special Resident Retiree''s Visa) or Balikbayan / Visa Extension',
 '⚠️ The Philippines does not have a dedicated digital nomad visa as of 2025. Options include: Extended tourist visa (multiple 59-day extensions, up to 36 months maximum stay), SRRV for those 35+, or business visa. The Philippines is a popular informal digital nomad destination, especially Cebu and El Nido.',
 'Tourist visa extension: available to all nationalities (fees apply per extension). SRRV: age 35+, USD 10,000–20,000 deposit in Philippine bank.',
 'Tourist extension: valid passport, extension fee payment at BI office. SRRV: see retirement pathway below.',
 'Tourist extension: same-day to 1 week per extension', 'PHP 4,100–10,000 per extension (tourist)',
 'digital_nomad', 'Same day to 1 week', 'Tourist extensions: up to 36 months maximum total', CURRENT_DATE),

('any', 'philippines', 'Retirement', 'Special Resident Retiree''s Visa (SRRV)',
 'The SRRV is managed by the Philippine Retirement Authority (PRA) and offers lifetime visa status to qualifying foreigners. Multiple packages depending on age and investment. Popular package: SRRV Classic — USD 20,000 deposit for age 50+ (with pension); USD 50,000 for 35–49.',
 'Minimum age 35. SRRV Classic (most popular): age 50+ with pension (USD 800/month or foreign pension): USD 10,000 bank deposit; age 50+ without pension: USD 20,000; age 35–49: USD 50,000. Must not have criminal record. Medical examination required.',
 'Philippine Retirement Authority application, fixed deposit in PRA-accredited Philippine bank, proof of pension (if applicable), passport, criminal background check, medical examination, passport photos.',
 'Typically 1–3 months (PRA processing)', 'USD 1,400 (enrollment fee) + USD 360 (annual fee) + bank deposit (returnable)',
 'retirement', '1–3 months', 'Lifetime (renewable annually, small fee)', CURRENT_DATE),

('any', 'philippines', 'Investor', 'Special Investor''s Resident Visa (SIRV)',
 'The SIRV is issued to foreign nationals investing at least USD 75,000 in BOI-registered or export-oriented Philippine companies. Managed by the Board of Investments (BOI). Provides investor and immediate family members (spouse + children) with permanent resident status.',
 'Must invest minimum USD 75,000 in a BOI-registered enterprise or in specific priority areas. Investment must be in productive activities. Must submit detailed investment plan to BOI.',
 'BOI investment registration, proof of USD 75,000+ investment transfer, business registration documents, valid passport, criminal background check.',
 'Typically 3–6 months', 'USD 1,000–2,000',
 'investor', '3–6 months', 'Permanent residency (renewable annually)', CURRENT_DATE),

('any', 'philippines', 'Family', '13-Series Immigrant Visas (Spouse/Child of Filipino)',
 'Foreign nationals who are spouses or children of Philippine citizens can apply for a 13-series immigrant visa granting permanent resident status. 13(a) is for spouses; 13(b) for unmarried children under 21.',
 'Must be the legally married spouse (13a) or unmarried child under 21 (13b) of a Philippine citizen. Marriage must be valid under Philippine law. Civil or religious ceremony both recognized.',
 'Marriage certificate (PSA-authenticated), birth certificate of Filipino spouse/parent (PSA-authenticated), proof of Filipino citizenship, valid passports, immigration photos, medical examination, police clearance.',
 'Typically 1–3 months (Bureau of Immigration)', 'PHP 30,000–50,000',
 'family', '1–3 months', 'Permanent residency (I-Card issued)', CURRENT_DATE),

-- VIETNAM
('any', 'vietnam', 'Work', 'Work Permit (Giấy phép lao động)',
 'Foreign workers in Vietnam need a Work Permit from DOLISA (Department of Labor, Invalids and Social Affairs). Employers must demonstrate no Vietnamese national is available for the position. The Labor Code of Vietnam sets specific requirements and permitted occupations.',
 'Must be employed by a Vietnamese enterprise, foreign company operating in Vietnam, or representative office. Must hold a relevant degree or professional certificate and have 3+ years of work experience. Health certificate required.',
 'Employer''s application to DOLISA, employment contract, passport, degree/professional certificate (apostilled), police clearance from last country of residence, health certificate, passport photos.',
 'Typically 2–4 weeks (DOLISA processing)', 'VND 600,000',
 'work', '2–4 weeks', '2 years, renewable once', CURRENT_DATE),

('any', 'vietnam', 'Study', 'Student Visa (DH)',
 'International students studying at Vietnamese universities or educational institutions require a student visa (type DH — meaning "study"). Vietnam is an increasingly popular destination for English-language programs and medical studies.',
 'Must be enrolled at a Vietnamese Ministry of Education-recognized institution. Enrollment letter or acceptance letter required. Must have adequate financial means.',
 'Enrollment/acceptance letter from Vietnamese institution, valid passport, passport photos, visa on arrival pre-approval or embassy application.',
 'Typically 1–2 weeks', 'USD 25–80 (visa fee)',
 'study', '1–2 weeks', '1 year, renewable', CURRENT_DATE),

('any', 'vietnam', 'Digital Nomad', 'E-Visa or Tourist Visa (Remote Work)',
 'Vietnam introduced an e-visa system allowing a 90-day stay (extendable once) for 80+ nationalities. There is no dedicated digital nomad visa. Many digital nomads stay on tourist visas or e-visas and work remotely for foreign companies. Ho Chi Minh City and Hanoi are popular hubs.',
 'E-visa: citizens of 80+ eligible countries can apply online. Must not be conducting work for Vietnamese companies. Working remotely for foreign employers is in a legal grey area — not explicitly prohibited for tourists.',
 'E-visa: valid passport (6+ months validity), passport photo, debit/credit card for fee payment. Online application at evisa.xuatnhapcanh.gov.vn.',
 'E-visa: typically 3 business days', 'USD 25 (e-visa)',
 'digital_nomad', '3 business days (e-visa)', 'E-visa: 90 days, extendable once', CURRENT_DATE),

('any', 'vietnam', 'Retirement', 'Temporary Residence Card (TRC) / Repeated Tourist Stays',
 '⚠️ Vietnam does not have a dedicated retirement visa. Long-term options: obtaining a Temporary Residence Card (TRC) sponsored by Vietnamese family, investing in Vietnamese business, or repeated tourist/e-visa entries. Da Nang and Hoi An are popular informal retirement destinations.',
 'TRC via family: must be married to Vietnamese citizen or have Vietnamese citizen children. TRC via business: must have Vietnamese business. Repeated tourist entries: e-visa 90 days, renewable.',
 'TRC: Vietnamese family sponsorship letter, marriage/birth certificate. Repeated tourist: valid passport.',
 'TRC: typically 1–3 months; Tourist: immediate/3 days (e-visa)', 'TRC: USD 25–100; E-visa: USD 25',
 'retirement', '1–3 months (TRC) or 3 days (e-visa)', 'TRC: 1–2 years; E-visa: 90 days extendable', CURRENT_DATE),

('any', 'vietnam', 'Investor', 'Investment Visa (ĐT) / Investor Residence',
 'Foreign investors in Vietnam who register an investment project can obtain an Investment Visa (type ĐT) and subsequently a Temporary Residence Card. Vietnam is one of Southeast Asia''s fastest growing investment destinations, especially manufacturing and tech.',
 'Must have a registered investment project in Vietnam through the National Investment Information System (MPI) or provincial Investment Registration Certificate. Minimum investment not legally specified, but projects must be viable.',
 'Investment Registration Certificate (IRC), Enterprise Registration Certificate (ERC), investment transfer proof, valid passport, passport photos.',
 'Typically 1–3 months (including business registration)', 'USD 50–200 (visa/TRC fees) + business registration costs',
 'investor', '1–3 months', 'TRC: 1–2 years, renewable', CURRENT_DATE),

('any', 'vietnam', 'Family', 'Temporary Residence Card via Vietnamese Spouse/Family',
 'Foreign nationals who are spouses or parents of Vietnamese citizens can apply for a Temporary Residence Card (TRC) sponsored by their Vietnamese family member. This provides multi-year residence without requiring work permits.',
 'Must be the legally married spouse or parent of a Vietnamese citizen. Marriage must be officially recognized. Must have proof of family relationship.',
 'Marriage certificate (translated and notarized), Vietnamese spouse''s ID and household registration (hộ khẩu), valid passport, passport photos, police clearance.',
 'Typically 1–2 months (at local Immigration Department)', 'USD 25–50',
 'family', '1–2 months', '2–3 years, renewable', CURRENT_DATE),

-- SOUTH AFRICA
('any', 'south-africa', 'Work', 'General Work Visa / Critical Skills Work Visa',
 'South Africa offers two primary work visas: the General Work Visa (employer-sponsored, requires proof no South African is available) and the Critical Skills Work Visa (no employer sponsorship needed for designated shortage occupations). Critical skills list includes engineers, IT specialists, doctors, and more.',
 'General Work Visa: Must have employment offer and employer must prove no South African is available (DOL advertisement for 30+ days). Critical Skills Visa: Must be in an occupation on the Critical Skills List, have 3+ years experience, and be registered with relevant professional body.',
 'Valid passport, degree/qualification (SAQA-evaluated), job offer letter or evidence of critical skills, medical examination, radiology report, yellow fever vaccination certificate (if from endemic country), police clearances from all countries lived in for 12+ months since age 18.',
 'Typically 4–8 weeks (at South African embassy)', 'ZAR 1,520',
 'work', '4–8 weeks', 'General: up to 3 years; Critical Skills: up to 5 years — both renewable', CURRENT_DATE),

('any', 'south-africa', 'Study', 'Study Visa',
 'For non-South African nationals enrolled at a public or accredited private South African educational institution for programs of 3+ months. South Africa has several world-ranked universities including UCT, Wits, and Stellenbosch.',
 'Must be provisionally or unconditionally accepted by an accredited South African institution. Must demonstrate financial means (ZAR 35,000/year minimum). Must have comprehensive health insurance.',
 'Acceptance letter from South African institution, financial proof (ZAR 35,000/year), medical examination, radiology report, yellow fever vaccination (if applicable), police clearance, return ticket or proof of funds to return.',
 'Typically 4–8 weeks', 'ZAR 1,520',
 'study', '4–8 weeks', 'Duration of studies, renewable', CURRENT_DATE),

('any', 'south-africa', 'Digital Nomad', 'Remote Work Visa',
 'South Africa launched a dedicated Remote Work Visa in 2024, making it one of the few African countries with an official digital nomad visa. Cape Town and other South African cities are becoming major remote work hubs. Valid for 3 years.',
 'Must work remotely for a company or clients registered outside South Africa with income generated outside South Africa. Must have a monthly income of at least ZAR 65,000 (approximately USD 3,500) or annual income of ZAR 780,000. Must have medical insurance.',
 'Employment contract or freelance client contracts (non-South African), bank statements showing ZAR 65,000+/month income, medical insurance, valid passport (6+ months), police clearance.',
 'Typically 4–8 weeks (at South African mission)', 'ZAR 1,520',
 'digital_nomad', '4–8 weeks', '3 years (non-renewable, but can re-apply)', CURRENT_DATE),

('any', 'south-africa', 'Retirement', 'Retired Person Visa',
 'South Africa offers a Retired Person Visa for people aged 60+ who meet income requirements. Popular destinations: Cape Town, the Garden Route, Franschhoek. South Africa''s favorable climate and exchange rate make it an attractive retirement destination.',
 'Must be at least 60 years old. Must demonstrate a net monthly income of at least ZAR 37,000 per month (from pension, annuity, savings, or investment) — approximately USD 2,000/month. Must have adequate health insurance.',
 'Proof of monthly income (pension letters, bank statements showing ZAR 37,000+/month), health insurance, valid passport (6+ months), medical examination, radiology report, police clearance.',
 'Typically 4–8 weeks', 'ZAR 1,520',
 'retirement', '4–8 weeks', '4 years, renewable', CURRENT_DATE),

('any', 'south-africa', 'Investor', 'Business Visa',
 'For foreign nationals who intend to establish a business in South Africa. Minimum capital investment required: ZAR 5,000,000. Must create and maintain a minimum of 60% South African employment in the business.',
 'Investment of at least ZAR 5,000,000 in South Africa (from foreign capital). Business must create employment for South African citizens (at least 60% of employees must be South African citizens or permanent residents). Business plan required.',
 'Business plan, proof of ZAR 5,000,000 investment capital (attested financial statements from home country), incorporation documents (or plan), valid passport, police clearance, medical examination, recommendation from relevant government department.',
 'Typically 4–8 weeks', 'ZAR 1,520',
 'investor', '4–8 weeks', '3 years, renewable', CURRENT_DATE),

('any', 'south-africa', 'Family', 'Spousal / Relatives Visa',
 'Spouses or dependants of South African citizens or permanent residents can obtain a spousal or relatives visa. For immediate family joining a South African citizen: spousal visa (marriage) or life partner visa (cohabitation 2+ years). Children under 18: dependent relatives permit.',
 'Must be legally married to a South African citizen or permanent resident (Spousal Visa), OR be an unmarried life partner (2+ years cohabitation for Life Partner Permit), OR be an unmarried child under 21 (Relatives Permit).',
 'Marriage certificate (apostilled) or proof of cohabitation (for life partner), sponsor''s South African identity/residence documents, financial undertaking by sponsor, valid passports, medical examination, police clearance.',
 'Typically 4–8 weeks', 'ZAR 1,520',
 'family', '4–8 weeks', '3 years, renewable (Permanent Residence eligible after 5 years)', CURRENT_DATE),

-- NIGERIA
('any', 'nigeria', 'Work', 'Combined Expatriate Residence Permit and Aliens Card (CERPAC)',
 'Foreign nationals working in Nigeria require a CERPAC (Combined Expatriate Residence Permit and Aliens Card). The employer must also obtain a Business Permit and an Expatriate Quota (QUOTA) position from the Ministry of Interior before hiring a foreign national.',
 'Must have a job offer from a Nigerian-registered company. Company must hold an Expatriate Quota (EQ) position for the role. Company must demonstrate the position requires foreign expertise not locally available.',
 'Employer''s Expatriate Quota approval, company''s Business Permit, employment contract, valid passport, STR Visa (Subject-to-Regularisation) obtained at Nigerian embassy abroad first, passport photos.',
 'Typically 2–4 months (including Quota and STR visa)', 'USD 1,000–2,000 (CERPAC fee)',
 'work', '2–4 months', '2 years, renewable', CURRENT_DATE),

('any', 'nigeria', 'Study', 'Student Visa (STR/Regularization)',
 'International students studying in Nigeria obtain an STR (Subject-to-Regularization) visa at a Nigerian embassy and then regularize to a CERPAC for students at accredited Nigerian institutions. Limited international students come to Nigeria — mostly diaspora returning or scholarship students.',
 'Must be admitted to an accredited Nigerian university or institution recognized by the NUC (National Universities Commission). Acceptance letter required. Financial proof required.',
 'Acceptance letter from Nigerian institution, proof of financial support, valid passport, passport photos.',
 'Typically 2–4 weeks (STR visa)', 'USD 100–300',
 'study', '2–4 weeks', '1 year (renewable per academic year)', CURRENT_DATE),

('any', 'nigeria', 'Digital Nomad', 'Business Visa / Tourist Visa Extended Stays',
 '⚠️ Nigeria does not have a digital nomad visa as of 2025. Short-term remote workers typically use tourist or business visas (30–90 days). Nigeria is not a major digital nomad destination, but Lagos has a growing tech ecosystem. Visa-on-arrival available for 37 countries (up to 30 days).',
 'Tourist/Business visa: Must be visiting for legitimate purpose. Visa-on-arrival (VoA): Available to citizens of 37 eligible countries for up to 30 days. Business visa: requires invitation letter from Nigerian company.',
 'Valid passport, invitation letter (business) or hotel bookings (tourist), return ticket, proof of funds, yellow fever vaccination certificate (mandatory for all).',
 'Business/tourist visa: typically 2–4 weeks at embassy; VoA: on arrival', 'USD 120–200 (tourist/business visa)',
 'digital_nomad', '2–4 weeks', 'Tourist: 30–90 days; Business: 30–90 days', CURRENT_DATE),

('any', 'nigeria', 'Retirement', 'CERPAC (Retired/Non-Working)',
 '⚠️ Nigeria does not have a specific retirement visa. Retired foreign nationals with Nigerian family connections or business interests typically obtain a CERPAC in the "non-working" category. Nigeria is not a major retirement destination for international retirees.',
 'Must have a legitimate reason to reside in Nigeria (family connection, investment, etc.). Must have sufficient passive income to support self without working in Nigeria.',
 'Proof of retirement status, sufficient financial means, valid passport, health insurance, Nigerian family connection documents (if applicable).',
 'Typically 2–4 months', 'USD 500–1,500',
 'retirement', '2–4 months', '2 years, renewable', CURRENT_DATE),

('any', 'nigeria', 'Investor', 'Business/Investment CERPAC',
 'Foreign nationals investing in Nigerian businesses can obtain a CERPAC under the investor category. Nigeria requires all foreign companies to be registered with CAC (Corporate Affairs Commission). Oil and gas, fintech, and agricultural sectors attract significant foreign investment.',
 'Must have registered a business in Nigeria with CAC. Business must have minimum paid-up capital (varies by sector — typically USD 100,000 for general businesses; higher for banking, oil & gas). Business must have economic merit.',
 'CAC company registration certificate, NAFDAC approval (if applicable), minimum capital proof, valid passport, passport photos.',
 'Typically 2–4 months', 'USD 500–1,500 (CERPAC)',
 'investor', '2–4 months', '2 years, renewable', CURRENT_DATE),

('any', 'nigeria', 'Family', 'CERPAC (Dependant/Family)',
 'Dependents of CERPAC holders can obtain a dependent CERPAC. Spouse and children of an employed foreign national with a valid CERPAC can reside in Nigeria as dependents.',
 'Must be the spouse or minor child under 18 of a valid CERPAC holder. Sponsor''s CERPAC must be current. Marriage certificate or birth certificates required.',
 'Sponsor''s valid CERPAC, marriage certificate or birth certificates, valid passports for all family members.',
 'Typically 2–4 months', 'USD 500–1,000',
 'family', '2–4 months', 'Tied to sponsor''s CERPAC validity', CURRENT_DATE),

-- PERU
('any', 'peru', 'Work', 'Resident Visa – Designated Worker (Trabajador Designado)',
 'Foreign workers in Peru can obtain a Resident Visa in the "Designated Worker" category. Peru has relatively straightforward immigration rules, especially for MERCOSUR and Pacific Alliance country nationals who benefit from simplified procedures.',
 'Must have an employment contract with a Peruvian-registered employer. Employer must be registered with SUNAT. MERCOSUR/Pacific Alliance nationals (Chile, Colombia, Ecuador, Mexico, Bolivia, Brazil, Argentina, Paraguay, Uruguay) have simplified procedures.',
 'Employment contract, valid passport (6+ months validity), criminal background check (apostilled), police clearance, immigration application form, passport photos.',
 'Typically 4–8 weeks', 'PEN 60–140 (approximately USD 15–40)',
 'work', '4–8 weeks', '1 year, renewable; permanent residency after 1 year', CURRENT_DATE),

('any', 'peru', 'Study', 'Student Visa',
 'International students enrolled at Peruvian universities or educational institutions for more than 6 months require a student visa. Lima and Arequipa are major university cities.',
 'Must be enrolled at a SUNEDU-registered Peruvian educational institution. Enrollment certificate required. Must demonstrate financial means.',
 'Enrollment certificate from Peruvian institution, financial proof (bank statements), valid passport, criminal background check, passport photos.',
 'Typically 4–8 weeks', 'PEN 60–140',
 'study', '4–8 weeks', 'Duration of studies (1 year renewable)', CURRENT_DATE),

('any', 'peru', 'Digital Nomad', 'Tourist Visa / Andean Community Free Movement',
 '⚠️ Peru does not have a dedicated digital nomad visa as of 2025. Most nationalities can enter Peru visa-free for up to 90 days (extendable to 180 days/year). Digital nomads typically use tourist visa extensions. Andean Community nationals (Bolivia, Colombia, Ecuador) have full free movement rights.',
 'Tourist: citizens of 130+ countries can enter visa-free. Extension: must not exceed 183 days/year. Working remotely for foreign employers is in a legal grey area but generally tolerated.',
 'Valid passport, return ticket, proof of sufficient funds, accommodation details.',
 'Visa-free: immediate; Extension: apply at Migrations before expiry', 'Tourist extension: PEN 40',
 'digital_nomad', 'Immediate (visa-free)', 'Up to 90 days, extendable to 180 days/year', CURRENT_DATE),

('any', 'peru', 'Retirement', 'Resident Visa – Pensioner (Pensionista)',
 'Peru''s Pensioner Resident Visa is available to those receiving a pension or retirement income. Peru is a popular retirement destination in South America with a low cost of living and rich culture. Minimum monthly pension requirement is very accessible.',
 'Must be receiving a monthly pension or retirement income of at least USD 1,000/month from a recognized pension fund or retirement plan. No minimum age requirement.',
 'Proof of pension/retirement income (notarized, apostilled pension letter showing USD 1,000+/month), valid passport, criminal background check (apostilled), police clearance, immigration application form.',
 'Typically 4–8 weeks', 'PEN 60–140',
 'retirement', '4–8 weeks', '1 year, renewable; permanent residency after 1 year', CURRENT_DATE),

('any', 'peru', 'Investor', 'Resident Visa – Investor',
 'Foreign investors in Peru can obtain a resident visa in the investor category. Peru offers favorable investment conditions and a growing economy. The Pacific Alliance membership provides additional trade and mobility benefits.',
 'Must have made a minimum investment of USD 25,000 in Peru (in business or real estate). Investment must be registered with the relevant Peruvian authority. Must have a viable business plan.',
 'Investment documentation (company registration, bank transfer proof), valid passport, criminal background check (apostilled), police clearance, business plan.',
 'Typically 4–8 weeks', 'PEN 60–140',
 'investor', '4–8 weeks', '1 year, renewable; permanent residency after 1 year', CURRENT_DATE),

('any', 'peru', 'Family', 'Resident Visa – Family Reunification',
 'Foreign nationals who are spouses or children of Peruvian citizens or legal residents can apply for family reunification. Peru has inclusive family reunification rules, recognizing marriages and registered partnerships.',
 'Must be the spouse, unmarried child under 18, or dependent adult child of a Peruvian citizen or legal resident. Marriage certificate or birth certificate required (apostilled).',
 'Marriage certificate or birth certificate (apostilled), sponsor''s Peruvian citizenship or residence documents, financial proof (sponsor), valid passport, criminal background check.',
 'Typically 4–8 weeks', 'PEN 60–140',
 'family', '4–8 weeks', '1 year, renewable; permanent residency after 1 year', CURRENT_DATE)

ON CONFLICT DO NOTHING;
