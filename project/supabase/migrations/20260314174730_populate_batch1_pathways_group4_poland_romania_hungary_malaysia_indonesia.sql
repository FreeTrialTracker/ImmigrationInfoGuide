/*
  # Batch 1 Group 4: Poland, Romania, Hungary, Malaysia, Indonesia
  
  Adds all 6 goal pathways for these destinations.
*/

INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type, processing_time, validity_period, last_updated)
VALUES

-- POLAND
('any', 'poland', 'Work', 'Temporary Residence and Work Permit',
 'Non-EU/EEA workers in Poland require a combined Temporary Residence and Work Permit (Zezwolenie na pobyt czasowy i pracę). Poland has become a major destination for workers, especially from Ukraine, Belarus, and Asia. Processing times have improved significantly.',
 'Must have a concrete job offer from a Polish employer. No labor market test required for most occupations (Poland simplified requirements). Salary must meet minimum wage requirements (PLN 4,300/month gross in 2024). Employer must be registered in Poland.',
 'Employment contract or job offer letter, valid passport, accommodation proof, employer''s company registration documents (KRS extract), educational qualifications (if required for the profession).',
 'Typically 1–3 months', 'PLN 440',
 'work', '1–3 months', '1–3 years, renewable', CURRENT_DATE),

('any', 'poland', 'Study', 'Temporary Residence Permit for Study',
 'Non-EU/EEA students studying full-time at Polish universities or colleges must obtain a temporary residence permit. Poland has numerous English-language programs and relatively affordable tuition.',
 'Must be enrolled full-time at an accredited Polish educational institution. Must demonstrate financial means: at least PLN 776/month (social assistance threshold) — approximately EUR 175/month. Must have health insurance.',
 'Enrollment confirmation from Polish institution, financial proof, health insurance, passport, accommodation proof, academic transcripts.',
 'Typically 1–3 months (apply at local Voivodeship Office)', 'PLN 440',
 'study', '1–3 months', 'Duration of studies, renewable', CURRENT_DATE),

('any', 'poland', 'Digital Nomad', 'Poland Digital Nomad Visa',
 'Poland launched a dedicated Digital Nomad Visa in 2024, valid for up to 1 year. Allows remote workers employed by or providing services to foreign companies to reside in Poland. Poland is becoming a major digital nomad destination due to its central European location and relatively low costs.',
 'Must be employed by or provide services exclusively to a company or entities registered outside Poland. Must have stable income sufficient to cover living expenses in Poland (approximately EUR 1,500/month). Must have health insurance.',
 'Proof of employment or contracts with non-Polish companies, last 3 months income documentation, health insurance (covering entire stay), valid passport, accommodation proof.',
 'Typically 2–4 weeks at Polish consulate', 'PLN 80 (visa fee)',
 'digital_nomad', '2–4 weeks', 'Up to 1 year (can apply for temporary residence permit for further stay)', CURRENT_DATE),

('any', 'poland', 'Retirement', 'Temporary Residence Permit (Other Reasons)',
 '⚠️ Poland does not have a specific retirement visa. Retirees may apply for a general temporary residence permit under the "other justified circumstances" category. EU/EEA citizens have full right of residence. Non-EU/EEA retirees face limited options outside of family reunification.',
 'Must have passive income sufficient to cover living costs without working or accessing Polish social benefits. Must have comprehensive health insurance. Family-based option: be a family member of a Polish citizen or resident.',
 'Proof of substantial passive income (pension records, investment income, bank statements), health insurance, valid passport, accommodation proof.',
 'Typically 2–4 months', 'PLN 440',
 'retirement', '2–4 months', '1–3 years, renewable; permanent residence after 5 years', CURRENT_DATE),

('any', 'poland', 'Investor', 'Residence Permit for Business Activity',
 'Non-EU/EEA entrepreneurs and investors running a business in Poland can apply for a residence permit for business activity. Poland is a major business hub in Central Europe with competitive corporate tax rates.',
 'Must be running a business activity in Poland (registered company or sole proprietorship). Must demonstrate the business provides an adequate livelihood. Company must be established and operational in Poland.',
 'Polish company registration documents (KRS), financial statements showing business income, valid passport, accommodation proof, health insurance, business plan.',
 'Typically 1–3 months', 'PLN 440',
 'investor', '1–3 months', '1–3 years, renewable; permanent residence after 5 years', CURRENT_DATE),

('any', 'poland', 'Family', 'Temporary Residence Permit for Family Members',
 'Family members of Polish citizens or persons legally residing in Poland can apply for family reunification. Poland has relatively straightforward family reunification for spouses and minor children.',
 'Must be the spouse or unmarried child under 18 of a Polish citizen or a person with a valid Polish residence permit. Sponsor must have stable income and adequate accommodation.',
 'Marriage certificate or birth certificate (apostilled/legalized), sponsor''s Polish citizenship or residence permit, sponsor''s income proof, accommodation proof, valid passport, health insurance.',
 'Typically 1–3 months', 'PLN 440',
 'family', '1–3 months', '1–3 years (same as or linked to sponsor''s permit)', CURRENT_DATE),

-- ROMANIA
('any', 'romania', 'Work', 'Long-Stay Visa for Employment (D/AM)',
 'Romania''s work visa for non-EU/EEA nationals. Romania became an EU member in 2007 and a Schengen member in March 2024. The employer must first obtain a work authorization from the General Inspectorate for Immigration.',
 'Must have a job offer from a Romanian employer. Employer must first obtain a work authorization (aviz de angajare) from the General Inspectorate for Immigration (IGI). Annual immigration quota applies (6,000 non-EU permits/year as of recent years).',
 'Employer''s work authorization (aviz de angajare), employment contract, valid passport, proof of qualifications, criminal background check, accommodation proof.',
 'Typically 2–4 months (including employer work authorization)', 'EUR 120 (visa fee)',
 'work', '2–4 months', '1 year, renewable', CURRENT_DATE),

('any', 'romania', 'Study', 'Long-Stay Visa for Study (D/SD)',
 'For non-EU/EEA students enrolled at Romanian universities or schools for more than 90 days. Romania has numerous public universities with English-language programs and relatively affordable tuition.',
 'Must be admitted to an accredited Romanian educational institution. Must demonstrate financial means (approximately EUR 500/month). Must have health insurance.',
 'Admission letter from Romanian institution, financial proof, health insurance, valid passport, accommodation proof, academic records.',
 'Typically 4–8 weeks', 'EUR 120 (visa fee)',
 'study', '4–8 weeks', 'Duration of studies, renewable', CURRENT_DATE),

('any', 'romania', 'Digital Nomad', 'Romania Digital Nomad Visa',
 'Romania launched one of Europe''s first dedicated digital nomad visas in 2021. Valid for 1 year and renewable once (total 2 years). Romania is popular with digital nomads due to its very fast internet, low cost of living, and central European location.',
 'Must be employed by a company registered outside Romania or own a company registered outside Romania with no business activities in Romania. Minimum income: EUR 3,300/month (3× average gross salary in Romania).',
 'Employment contract or proof of company ownership (for non-Romanian companies), last 3 months payslips or bank statements showing EUR 3,300+/month, health insurance, valid passport, accommodation proof.',
 'Typically 4–8 weeks at Romanian consulate', 'EUR 120 (visa fee)',
 'digital_nomad', '4–8 weeks', '1 year, renewable once (total 2 years)', CURRENT_DATE),

('any', 'romania', 'Retirement', 'Long-Stay Visa for Other Purposes (D/AS)',
 '⚠️ Romania does not have a dedicated retirement visa. Retirees can apply for a general long-stay visa under the "other purposes" category if they can demonstrate sufficient passive income. EU/EEA pensioners can reside freely.',
 'Must demonstrate passive income sufficient to cover living costs without working in Romania. Health insurance required. Some family connection to Romania may help the application.',
 'Proof of passive income (pension statements, bank statements), health insurance, valid passport, accommodation proof.',
 'Typically 4–8 weeks', 'EUR 120 (visa fee)',
 'retirement', '4–8 weeks', '1 year, renewable', CURRENT_DATE),

('any', 'romania', 'Investor', 'Long-Stay Visa for Business (D/AF)',
 'Non-EU/EEA investors and entrepreneurs can obtain a business visa for establishing or managing a company in Romania. Romania has a competitive flat corporate tax rate of 16% and is a growing business destination in Eastern Europe.',
 'Must be establishing or managing a business in Romania. Company must be registered in Romania. Must demonstrate sufficient funds for business operation and personal support.',
 'Company registration documents (if already established) or business plan (if starting), valid passport, proof of funds, accommodation proof.',
 'Typically 4–8 weeks', 'EUR 120 (visa fee)',
 'investor', '4–8 weeks', '1 year, renewable', CURRENT_DATE),

('any', 'romania', 'Family', 'Long-Stay Visa for Family Reunification (D/VF)',
 'For family members of Romanian citizens or legal residents. Family reunification is available for spouses, minor children, and dependent parents.',
 'Must be the spouse, minor child under 18, or dependent parent of a Romanian citizen or person with valid long-term residence permit in Romania.',
 'Proof of family relationship (marriage/birth certificates — apostilled), sponsor''s Romanian citizenship or residence permit, sponsor''s financial means, accommodation proof, valid passport, health insurance.',
 'Typically 4–8 weeks', 'EUR 120 (visa fee)',
 'family', '4–8 weeks', '1 year, renewable', CURRENT_DATE),

-- HUNGARY
('any', 'hungary', 'Work', 'Single Permit (Residence and Work Permit)',
 'Hungary issues a combined residence and work permit for non-EU/EEA workers. Hungary launched a "Guest Worker" program for certain nationalities. EU Blue Card is available for highly qualified workers. Hungary is a competitive cost destination in Central Europe.',
 'Must have a concrete job offer from a Hungarian employer. The employer must typically demonstrate no qualified Hungarian/EU candidate was available (labor market test) for non-exempt occupations. Some nationalities have bilateral agreements with Hungary.',
 'Employment contract, valid passport, employer''s company registration, educational qualifications, criminal background check, accommodation proof.',
 'Typically 2–4 months', 'HUF 18,000 (approximately EUR 45)',
 'work', '2–4 months', '1–2 years, renewable', CURRENT_DATE),

('any', 'hungary', 'Study', 'Student Residence Permit',
 'For non-EU/EEA students at Hungarian universities and colleges. Hungary''s Stipendium Hungaricum scholarship program offers fully funded studies for students from dozens of countries — highly competitive but free if awarded.',
 'Must be admitted to an accredited Hungarian educational institution. Financial requirement: at least EUR 500/month. Must have health insurance.',
 'Admission letter, financial proof (EUR 500/month), health insurance, valid passport, accommodation proof.',
 'Typically 1–2 months', 'HUF 18,000',
 'study', '1–2 months', 'Duration of studies, renewable', CURRENT_DATE),

('any', 'hungary', 'Digital Nomad', 'White Card (White-Card Program for Digital Nomads)',
 'Hungary launched the "White Card" digital nomad visa program in 2024, targeted at IT and digital professionals working for non-Hungarian companies. Valid for 1 year and renewable.',
 'Must work for a company registered outside Hungary in IT, fintech, or digital sectors. Must demonstrate sufficient monthly income. Specific income thresholds announced by the Hungarian government.',
 'Employment contract or proof of freelance income from non-Hungarian sources, income documentation, health insurance, valid passport, accommodation proof.',
 'Typically 2–4 weeks', 'HUF 18,000',
 'digital_nomad', '2–4 weeks', '1 year, renewable', CURRENT_DATE),

('any', 'hungary', 'Retirement', 'Residence Permit for Private Purposes',
 '⚠️ Hungary does not have a dedicated retirement visa. Retirees can apply for a residence permit for "private purposes" or "guest investor" programs. The Guest Investor Visa (GIV) allows real estate investors to reside without working.',
 'Must demonstrate passive income sufficient to cover living costs. The Guest Investor Visa requires EUR 500,000 in Hungarian real estate fund units or EUR 1,000,000 in real estate. Private purposes permit requires financial self-sufficiency.',
 'Proof of passive income or investment documentation, health insurance, valid passport, accommodation proof.',
 'Typically 1–3 months', 'HUF 18,000–100,000 (varies by permit type)',
 'retirement', '1–3 months', '1–2 years, renewable', CURRENT_DATE),

('any', 'hungary', 'Investor', 'Guest Investor Visa (GIV)',
 'Hungary''s Guest Investor Visa (GIV), launched in 2024, grants 10-year renewable residency to non-EU investors. Three investment routes: EUR 500,000 in a pre-approved residential real estate investment fund; EUR 1,000,000 direct real estate investment; or EUR 1,000,000 donation to a Hungarian public trust foundation.',
 'Must make a qualifying investment of at least EUR 500,000 in an approved real estate investment fund, or EUR 1,000,000 in direct real estate or public interest donation. No work requirement — pure investment residency. Must not have criminal convictions.',
 'Investment documentation (fund certificates, real estate purchase contracts, or donation records), valid passport, proof of funds and their legal origin, health insurance, accommodation documentation.',
 'Typically 1–3 months', 'HUF 100,000–200,000',
 'investor', '1–3 months', '10 years, renewable', CURRENT_DATE),

('any', 'hungary', 'Family', 'Residence Permit for Family Reunification',
 'Family members of Hungarian citizens or legal residents can apply for family reunification permits. Hungary recognizes marriages and registered partnerships for immigration purposes.',
 'Must be the spouse, minor child under 18, or dependent adult child of a Hungarian citizen or person with valid Hungarian long-term residence permit. Sponsor must demonstrate adequate income and accommodation.',
 'Proof of family relationship (apostilled documents), sponsor''s status proof, financial means documentation, accommodation proof, valid passport, health insurance.',
 'Typically 1–3 months', 'HUF 18,000',
 'family', '1–3 months', '1–2 years, renewable', CURRENT_DATE),

-- MALAYSIA
('any', 'malaysia', 'Work', 'Employment Pass (EP)',
 'Malaysia''s Employment Pass is for skilled foreign nationals in professional and managerial roles. Three categories: Category I (monthly salary ≥ MYR 10,000), Category II (MYR 5,000–MYR 9,999), Category III (MYR 3,000–MYR 4,999, limited duration).',
 'Must have a job offer from a Malaysian employer. Salary must meet the minimum threshold for the relevant category. Employer must be registered with SSM (Companies Commission) and apply through ESD (Expatriate Services Division) or MDEC (for tech sector).',
 'Employment contract, valid passport, educational qualifications, employer''s company profile and business license, passport photos.',
 'Typically 3–6 weeks', 'MYR 900–3,000 (varies by category)',
 'work', '3–6 weeks', 'Cat I: up to 5 years; Cat II: up to 2 years; Cat III: up to 12 months', CURRENT_DATE),

('any', 'malaysia', 'Study', 'Student Pass',
 'For international students enrolled in approved Malaysian private or public educational institutions for programs lasting more than 6 months. Malaysian universities offer affordable English-language programs in medicine, engineering, and business.',
 'Must be enrolled at a Malaysian Education Ministry-approved institution. Must demonstrate financial means (approx. MYR 2,500–4,000/month). Must have health insurance.',
 'Acceptance letter from Malaysian institution, financial proof, health insurance, valid passport, passport photos, medical examination.',
 'Typically 4–6 weeks', 'MYR 60–200',
 'study', '4–6 weeks', 'Duration of studies, typically 1 year renewable', CURRENT_DATE),

('any', 'malaysia', 'Digital Nomad', 'DE Rantau Digital Nomad Pass',
 'Malaysia''s DE Rantau Digital Nomad Pass was launched in 2022, targeting tech and digital professionals. Valid for 3 months initially, extendable to 12 months total. Designed for a younger demographic — strong community infrastructure.',
 'Must be working as a tech professional (software developer, UI/UX designer, data analyst, digital marketer, etc.) for companies registered outside Malaysia. Minimum income: USD 24,000/year (approximately USD 2,000/month). Health insurance required.',
 'Proof of employment or freelance contracts with non-Malaysian companies, latest 3 months payslips or bank statements (USD 2,000+/month), health insurance, valid passport, passport photos.',
 'Typically 2–4 weeks (online application)', 'MYR 1,000 (3 months) or MYR 3,000 (12 months)',
 'digital_nomad', '2–4 weeks', '3 months (extendable to 12 months)', CURRENT_DATE),

('any', 'malaysia', 'Retirement', 'Malaysia My Second Home (MM2H)',
 'Malaysia''s My Second Home (MM2H) program grants long-term residency to foreigners who meet financial requirements. The program was relaunched in 2021 with significantly higher requirements than before, creating three tiers (Silver, Gold, Platinum).',
 'Three tiers: Silver — minimum age 35, offshore income MYR 40,000/month, liquid assets MYR 1,500,000, fixed deposit MYR 500,000; Gold — age 35+, income MYR 40,000/month, assets MYR 3,000,000, FD MYR 1,000,000; Platinum — age 35+, income MYR 40,000/month, assets MYR 5,000,000, FD MYR 2,000,000.',
 'Financial documents (bank statements showing required offshore income and liquid assets), proof of fixed deposit capability, valid passport, health insurance, medical examination, criminal background check.',
 'Typically 6–12 months', 'MYR 5,000–10,000 (application fee, tier dependent)',
 'retirement', '6–12 months', '5 years (Silver), 15 years (Gold), 20 years (Platinum) — renewable', CURRENT_DATE),

('any', 'malaysia', 'Investor', 'Employment Pass (Investor/Entrepreneur)',
 'Foreign investors establishing businesses in Malaysia under the MM2H business category, or those sponsored by their own Malaysian company under an Employment Pass, can reside and manage their investment. Malaysia has free trade zones and attractive investment incentives.',
 'Must establish a Malaysian company (Sdn Bhd, minimum paid-up capital MYR 500,000 for foreign-owned companies) OR qualify under specific investment incentive programs from MIDA (Malaysia Investment Development Authority). Must have sufficient business capital.',
 'Company registration with SSM, paid-up capital proof, business plan, bank statements, valid passport, company board resolution authorizing stay.',
 'Typically 3–6 months', 'MYR 900–3,000 (EP fee) + company registration costs',
 'investor', '3–6 months', '2–5 years, renewable', CURRENT_DATE),

('any', 'malaysia', 'Family', 'Dependent Pass',
 'Employment Pass holders (Category I earning MYR 10,000+/month) can sponsor their spouse and unmarried children under 18 on Dependent Passes. Dependent Pass holders may apply for a Social Visit Pass for domestic helpers.',
 'Main Employment Pass holder must earn minimum MYR 10,000/month (Category I). Marriage certificate or birth certificates required. Dependent Pass holders cannot work without a separate work authorization.',
 'Main pass holder''s Employment Pass, marriage certificate (apostilled), birth certificates for children, valid passports for all family members, passport photos.',
 'Typically 3–6 weeks', 'MYR 300–600',
 'family', '3–6 weeks', 'Tied to main pass holder''s EP validity', CURRENT_DATE),

-- INDONESIA
('any', 'indonesia', 'Work', 'Work Permit (KITAS/Izin Tinggal Terbatas)',
 'Foreign workers in Indonesia require a Work Permit (IMTA) and a Limited Stay Permit (KITAS). The employer must apply for a Rencana Penggunaan Tenaga Kerja Asing (RPTKA — foreign workforce utilization plan) before applying for IMTA. Indonesia requires a ratio of 1 foreign worker to 10 Indonesian employees in most sectors.',
 'Must have a job offer from an Indonesian employer. Employer must obtain RPTKA approval first. Must work in a position that is open to foreigners (some positions are restricted). Must undergo health examination. Language skills in Bahasa Indonesia may be required for some positions.',
 'RPTKA approval from Ministry of Manpower, employment contract, valid passport (6+ months validity), passport photos, educational certificates, reference letters, medical examination, police clearance.',
 'Typically 2–4 months (RPTKA + IMTA + KITAS)', 'USD 1,200 per year (IMTA fee) + administrative costs',
 'work', '2–4 months', '1–2 years, renewable (KITAS); 5-year KITAP after 5 years', CURRENT_DATE),

('any', 'indonesia', 'Study', 'Social/Cultural Visa (Student)',
 'International students attending Indonesian universities or educational programs must obtain a Social/Cultural Visa (Type B-211A) which can be extended into a Limited Stay Permit (KITAS) for long-term study.',
 'Must be enrolled at an Indonesian educational institution recognized by the Ministry of Education. Must have adequate financial means for the duration of study. A guarantor (sponsor) in Indonesia is required.',
 'Acceptance letter from Indonesian institution, sponsorship letter from guarantor in Indonesia, financial proof, valid passport, passport photos.',
 'Typically 2–4 weeks (visa) + 1–2 months (KITAS for long-term students)', 'USD 50–200',
 'study', '2–4 weeks', 'VITAS: 60 days extendable; KITAS: up to 1 year renewable', CURRENT_DATE),

('any', 'indonesia', 'Digital Nomad', 'Bali-Based Remote Worker Visa (E33G)',
 'Indonesia introduced a new 5-year "Second Home" visa in 2022 partly targeting digital nomads. Additionally, Bali has been working on a dedicated digital nomad "remote worker visa" under the E33G category. Holders are not permitted to work for Indonesian companies.',
 'For Second Home Visa: must own property in Indonesia worth at least IDR 2 billion (approximately USD 130,000) OR maintain a fixed deposit of IDR 2 billion in an Indonesian bank. For E33G: employed by foreign company, no specific income threshold announced, health insurance required.',
 'For Second Home: property ownership documents or bank fixed deposit certificate. For E33G: proof of employment with foreign company, income proof, health insurance, valid passport.',
 'Typically 1–2 months', 'USD 150–500 (visa dependent)',
 'digital_nomad', '1–2 months', 'Second Home Visa: 5 years (renewable); E33G: 6 months extendable to 1 year', CURRENT_DATE),

('any', 'indonesia', 'Retirement', 'Retirement Visa (KITAS Pensiun)',
 'Indonesia offers a specific retirement KITAS (Limited Stay Permit) for foreigners aged 55 and above. Popular destinations include Bali, Lombok, and Yogyakarta. Retirement visa holders may not work in Indonesia.',
 'Must be at least 55 years of age. Must have passive income (pension, investments, savings) of at least USD 1,500/month OR a bank account in Indonesia with minimum IDR 300 million (approximately USD 20,000). Must have comprehensive health insurance.',
 'Proof of age (passport), pension statements or income proof (USD 1,500/month), health insurance, valid passport, police clearance from home country, sponsor/guarantor in Indonesia (the handling visa agent typically serves as guarantor).',
 'Typically 2–4 weeks', 'USD 100–300',
 'retirement', '2–4 weeks', '1 year, renewable up to 5 consecutive renewals', CURRENT_DATE),

('any', 'indonesia', 'Investor', 'Investor KITAS (Limited Stay Permit for Investors)',
 'Foreign investors in Indonesian companies can obtain an Investor KITAS allowing residence for up to 2 years renewable. Minimum investment is USD 1,000,000 in Indonesian companies through the Indonesia Investment Coordinating Board (BKPM).',
 'Must have invested at least USD 1,000,000 in an Indonesian company (PT PMA — foreign-owned company). Company must be registered with BKPM. Investor must be listed as shareholder in the company''s registration documents.',
 'PT PMA registration documents (from BKPM/OSS system), shareholder certificate, investment proof (capital injection), valid passport.',
 'Typically 2–4 months (company registration + KITAS)', 'USD 1,000–3,000 (company setup + KITAS fees)',
 'investor', '2–4 months', '2 years, renewable', CURRENT_DATE),

('any', 'indonesia', 'Family', 'Family/Dependent KITAS',
 'Spouses and children of KITAS holders (work, investor, or retirement permits) can obtain dependent KITAS permits. Dependent permit holders may not work in Indonesia unless they obtain their own work permit.',
 'Must be the legally married spouse or unmarried child under 18 of an Indonesian KITAS holder. Sponsor''s KITAS must be valid. Marriage certificate and birth certificates must be legalized and/or apostilled.',
 'Sponsor''s KITAS, marriage certificate (legalized by Indonesian consulate or apostilled), birth certificates for children, valid passports for all family members, family registration card.',
 'Typically 2–4 weeks', 'USD 100–200',
 'family', '2–4 weeks', 'Tied to sponsor''s KITAS validity', CURRENT_DATE)

ON CONFLICT DO NOTHING;
