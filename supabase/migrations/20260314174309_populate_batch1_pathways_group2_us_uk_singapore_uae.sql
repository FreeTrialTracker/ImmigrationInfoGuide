/*
  # Batch 1 Group 2: Populate pathways for United States, United Kingdom, Singapore, UAE
  
  Adds all 6 goal pathways for 4 major immigration destinations that had zero pathways.
*/

INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type, processing_time, validity_period, last_updated)
VALUES

-- UNITED STATES
('any', 'united-states', 'Work', 'H-1B Visa (Specialty Occupation)',
 'The H-1B is the primary work visa for skilled professionals in specialty occupations requiring at least a bachelor''s degree. Subject to annual lottery cap (65,000 regular + 20,000 US master''s exemption). Most applicants must win the lottery in April to start work October 1.',
 'Bachelor''s degree or higher (or equivalent) in a specialty field directly related to the job. Must have a US employer willing to sponsor and file an I-129 petition. Subject to annual cap — not guaranteed even with a valid petition.',
 'Approved I-129 petition, valid passport, DS-160 (online visa application), visa interview appointment, employment offer letter, educational credentials (WES evaluation if foreign degree), SEVIS fee receipt.',
 'Varies: lottery in March/April, earliest start date October 1. Premium processing available for $2,805.', 'USD 460 (I-129 filing) + USD 500–4,500 (employer ACWIA/fraud fees) + USD 160 (visa)',
 'work', '6–12 months (lottery dependent)', '3 years, extendable to 6 years (unlimited extensions if GC pending)', CURRENT_DATE),

('any', 'united-states', 'Study', 'F-1 Student Visa',
 'The F-1 is the primary student visa for non-immigrant academic study at SEVP-approved schools in the US. After completing a degree, eligible for Optional Practical Training (OPT) — 12 months of work authorization, extendable to 36 months for STEM degrees.',
 'Must be accepted by a SEVP-approved school and issued a Form I-20. Must demonstrate ties to home country and intent to return after studies. Must prove financial ability to cover tuition and living expenses for the first year.',
 'Form I-20 from SEVP-approved school, SEVIS fee payment (I-901, USD 350), DS-160 online application, visa interview at US consulate, proof of financial support (bank statements, scholarship letters), passport valid 6+ months beyond intended stay.',
 'Typically 4–8 weeks (apply early during peak season)', 'USD 350 (SEVIS fee) + USD 160 (visa fee)',
 'study', '4–8 weeks', 'Duration of status (D/S) — valid for program end date + 60-day grace period', CURRENT_DATE),

('any', 'united-states', 'Digital Nomad', 'B-1/B-2 Visitor Visa (Remote Work Workaround)',
 '⚠️ The US does NOT have a digital nomad visa. Remote workers who are employed by non-US companies can generally enter on a B-1/B-2 tourist/business visa and continue working for their foreign employer — this is a grey area not explicitly prohibited. However, any work for US clients or companies requires a work visa.',
 'Must be employed by a non-US company with no US-source income. Must not be providing services to US clients. Must maintain ties to home country. This is a grey area — consult an immigration attorney before relying on this approach.',
 'Valid passport, DS-160 online application, visa interview (if required — VWP countries can use ESTA), proof of employment with foreign company, bank statements, evidence of ties to home country.',
 'Typically 2–8 weeks (VWP/ESTA immediate)', 'USD 160 (visa fee) or USD 21 (ESTA)',
 'digital_nomad', '2–8 weeks', 'Up to 6 months per entry (B-2); multiple entries on B-1/B-2', CURRENT_DATE),

('any', 'united-states', 'Retirement', 'EB-1C / IR-1 Green Card (Retirement via Family or Employment)',
 '⚠️ The US has NO retirement visa. The only long-term options for retirees are: (1) Family-based green card if you have a US citizen child or spouse; (2) Investment-based EB-5 green card; (3) B-2 tourist visa for extended visits (max 6 months/entry). Many retirees use multiple annual visits combined with stays in other countries.',
 'No specific retirement pathway exists. Best options: EB-5 investor green card (USD 800,000–1,050,000 investment), family sponsorship by US citizen child (21+) or spouse, or repeated tourist visits. Social Security income from the US can be received abroad.',
 'Varies by pathway: for B-2 extended stays — proof of strong ties to home country, financial means, health insurance, return ticket. For family green card — Form I-130 sponsorship by qualifying US citizen relative.',
 'Varies significantly by pathway', 'Varies: USD 160 (B-2 visa) to USD 3,675+ (green card application)',
 'retirement', 'Varies', 'B-2: up to 6 months per entry; Green card: permanent', CURRENT_DATE),

('any', 'united-states', 'Investor', 'EB-5 Immigrant Investor Program',
 'The EB-5 program grants permanent US residency to foreign nationals who invest in job-creating US businesses. The program was reformed in 2022 (Reform and Integrity Act). Two investment tiers: USD 800,000 in Targeted Employment Areas (TEAs) or rural areas; USD 1,050,000 in non-TEA areas.',
 'Must invest the required capital amount (new commercial enterprise, not a passive investment). Must create or preserve at least 10 full-time jobs for qualifying US workers within 2 years. Funds must be "at risk" — no guaranteed return. Must prove lawful source of funds.',
 'I-526E petition (regional center) or I-526 (direct investment), business plan or regional center offering materials, source of funds documentation (tax returns, bank records, gift letters), valid passport, medical exam, police certificates.',
 'Typically 24–48 months (subject to per-country visa backlogs — China/India/Vietnam may wait decades)', 'USD 11,160 (I-526E filing) + USD 1,440 (DS-260) + USD 85 (biometrics)',
 'investor', '24–48 months', 'Conditional permanent residence (2 years), then permanent (I-829)', CURRENT_DATE),

('any', 'united-states', 'Family', 'Family-Based Immigration (IR-1/CR-1 and Preference Categories)',
 'The US offers family-based immigration for immediate relatives of US citizens (unlimited visas, no wait) and preference categories for other family members (subject to annual caps and per-country backlogs). Immediate relatives (IR-1/CR-1): spouses, unmarried children under 21, and parents of US citizens.',
 'Immediate relative sponsorship: Sponsor must be a US citizen (for IR categories). Family preference: Sponsor can be a US citizen or permanent resident. Sponsor must meet income requirements (125% of federal poverty line) and file Form I-864 Affidavit of Support.',
 'I-130 Petition for Alien Relative, proof of sponsoring relationship (marriage/birth certificate), I-864 Affidavit of Support (financial documentation), valid passport, DS-260 immigrant visa application, medical exam by USCIS-approved physician, police certificates.',
 'Immediate relatives: 12–24 months. Family preference categories: varies from 2 years to 20+ years depending on category and country of birth.', 'USD 535 (I-130) + USD 325 (NVC processing) + USD 325 (immigrant visa)',
 'family', '12–24 months (IR); years for preference categories', 'Permanent residence (green card)', CURRENT_DATE),

-- UNITED KINGDOM
('any', 'united-kingdom', 'Work', 'Skilled Worker Visa',
 'The UK''s primary work visa replaced Tier 2 (General) in December 2020. Requires a job offer from a UK employer with a sponsor licence. The role must be at RQF Level 3+ (A-level equivalent) and meet the salary threshold.',
 'Must have a job offer from a licensed UK sponsor. Role must be on the eligible occupations list at RQF Level 3+. Salary must meet the higher of: the general threshold (£38,700/year from April 2024) or the going rate for the specific occupation. English language requirement (B1 level).',
 'Certificate of Sponsorship (COS) from employer, valid passport, proof of English language (IELTS, degree, passport from majority English-speaking country), bank statements showing £1,270 maintenance funds (if not certified), TB test (if from listed country), criminal record certificate.',
 'Typically 3–8 weeks (standard) or 5 working days (priority service)', 'From £719 (up to 3 years) to £1,420 (over 3 years) + Immigration Health Surcharge (£1,035/year)',
 'work', '3–8 weeks', 'Up to 5 years, indefinite leave to remain after 5 years', CURRENT_DATE),

('any', 'united-kingdom', 'Study', 'Student Visa',
 'The UK Student Visa (replaced Tier 4 in October 2020) allows non-UK nationals to study at a licensed student sponsor at degree level or above, or at below-degree level if aged 16+. Post-study, eligible for the Graduate Visa (2 years stay to find work).',
 'Must have an unconditional offer from a licensed UK student sponsor (Confirmation of Acceptance for Studies — CAS). Must demonstrate English language at B2 level or higher (IELTS Academic, typically 5.5–6.5+ depending on course). Must meet financial requirements.',
 'Confirmation of Acceptance for Studies (CAS) from licensed UK sponsor, proof of English language, bank statements showing £1,334/month for London or £1,023/month outside London (for 9 months), valid passport, parental consent (if under 18), TB test (if from listed country).',
 'Typically 3 weeks (inside UK) or 3–4 weeks (outside UK)', 'From £490 (short-term study) to £490 (student visa) + Immigration Health Surcharge',
 'study', '3–4 weeks', 'Course duration + 4–6 months (degree+)', CURRENT_DATE),

('any', 'united-kingdom', 'Digital Nomad', 'UK Innovator Founder Visa / Freelancer Options',
 '⚠️ The UK does not have a dedicated digital nomad visa. However, the UK offers the Innovator Founder Visa for entrepreneurs with innovative business ideas, and freelancers may qualify for the Global Talent Visa (endorsed by a recognized body) or Skilled Worker Visa (with a sponsor).',
 'Innovator Founder Visa: Must have an innovative, viable, and scalable business idea endorsed by an approved body. No minimum investment required (post-2023 reform). Global Talent: Must be endorsed as a leader or potential leader in academia, research, tech (Tech Nation endorsed), arts, or culture.',
 'Innovator Founder: endorsement from approved body, valid passport, English language (B2), £1,270 maintenance funds. Global Talent: endorsement letter from approved endorsing body, valid passport, evidence of achievements in your field.',
 'Innovator Founder: typically 8–12 weeks. Global Talent: typically 5–8 weeks.', 'Innovator Founder: £1,191 (application) + Immigration Health Surcharge. Global Talent: £608 + IHS.',
 'digital_nomad', '8–12 weeks', '3 years (Innovator Founder, renewable); up to 5 years (Global Talent)', CURRENT_DATE),

('any', 'united-kingdom', 'Retirement', 'UK Ancestry Visa / Retired Person of Independent Means',
 '⚠️ The UK abolished the Retired Person of Independent Means visa category. Current options for retirees: UK Ancestry Visa (if a Commonwealth citizen with a UK-born grandparent), joining a settled family member, or repeated short stays (max 6 months/visit). The Standard Visitor Visa allows multiple entries.',
 'UK Ancestry Visa: Must be a Commonwealth citizen with at least one grandparent born in the UK, islands, or former British colony. Must be aged 17+. Must intend to work. Standard Visitor: Must have funds, ties to home country, intent to leave after visit.',
 'UK Ancestry: valid Commonwealth passport, proof of UK-born grandparent (birth certificate), proof of intention to work, bank statements showing adequate funds. Standard Visitor: valid passport, financial means, return ticket, accommodation plans.',
 'UK Ancestry: typically 3–4 weeks. Standard Visitor: typically 3–4 weeks.', 'UK Ancestry: £582. Standard Visitor: £115 (6 months)',
 'retirement', '3–4 weeks', 'UK Ancestry: 5 years with work rights (ILR eligible after 5 years); Visitor: 6 months max per visit', CURRENT_DATE),

('any', 'united-kingdom', 'Investor', 'Innovator Founder Visa / Scale-up Visa',
 'The UK''s investor landscape changed significantly in 2023. The Investor Visa (Tier 1) was closed in February 2022. Current routes for business investors: Innovator Founder Visa (innovative business, no minimum investment), Scale-up Visa (fast-growing UK business sponsoring high-skilled worker).',
 'Innovator Founder Visa: innovative, viable, and scalable business endorsed by approved body (UKRI, BEIS-approved incubator, etc.). No minimum investment required but must have sufficient funds. Scale-up Visa: sponsored by a qualifying UK scale-up employer, salary £34,600+.',
 'Innovator Founder: endorsement letter, business plan, valid passport, English B2, £1,270 maintenance. Scale-up: Certificate of Sponsorship from qualifying employer, salary evidence, English B1, valid passport.',
 'Typically 8–12 weeks', 'Innovator Founder: £1,191 + IHS. Scale-up: £715 + IHS',
 'investor', '8–12 weeks', '3 years renewable; ILR after 5 years continuous residence', CURRENT_DATE),

('any', 'united-kingdom', 'Family', 'Family Visa (Spouse / Partner / Children)',
 'The UK Family Visa allows non-UK nationals to join or accompany a partner who is a British citizen, settled person, or person with protected rights. From April 2024, the minimum income threshold increased significantly to £29,000 (rising further to £38,700 by early 2025).',
 'Sponsor must be a UK citizen, settled person, or person with certain immigration status. Must have a genuine relationship. Financial requirement: sponsor must earn at least £29,000/year (from April 2024, rising to £38,700 by April 2025). English language requirement at A1 (entry) rising to A2 and B1 for extensions.',
 'Proof of relationship (marriage certificate, cohabitation evidence), sponsor''s UK status documents, financial evidence (payslips, P60, bank statements), English language certificate (A1 minimum), accommodation evidence, valid passport, TB test (if from listed country).',
 'Typically 8–12 weeks (outside UK)', 'From £1,846 (entry clearance) + Immigration Health Surcharge (£1,035/year)',
 'family', '8–12 weeks', '2.5 years initially, then 2.5-year extension (ILR after 5 years)', CURRENT_DATE),

-- SINGAPORE
('any', 'singapore', 'Work', 'Employment Pass (EP)',
 'Singapore''s primary work visa for foreign professionals, managers, and executives. Requires a minimum salary and a qualifying job offer. The Fair Consideration Framework (FCF) requires employers to advertise on MyCareersFuture for 14 days before applying for an EP for a non-Singapore citizen.',
 'Minimum fixed monthly salary of SGD 5,000 (SGD 5,500 for financial services sector) as of September 2023. Candidates aged 40+ may need higher salaries. Must hold an acceptable degree/professional qualifications. COMPASS points-based system applies to new applications.',
 'Job offer letter, valid passport, educational certificates, employer''s UEN (company registration), completed Form 8 (employer application). MOM online application through EP Online portal.',
 'Typically 3–8 weeks', 'SGD 105 (application) + SGD 225 (issuance)',
 'work', '3–8 weeks', '1–2 years (new); up to 3 years (renewal)', CURRENT_DATE),

('any', 'singapore', 'Study', 'Student Pass (STP)',
 'Required for all full-time international students enrolled in approved educational institutions in Singapore for courses lasting more than 30 days. Apply through SOLAR (Student''s Pass Online Application and Registration) system.',
 'Must have an unconditional offer from an approved school registered with MOE (Ministry of Education), EduTrust-certified private education institution, or publicly-funded institution. Parents in Singapore with valid long-term passes may not need a separate student pass.',
 'In-Principal Approval (IPA) letter from school, valid passport, passport-size photos, proof of address, disembarkation/embarkation card (if applicable). SOLAR online system application.',
 'Typically 4–6 weeks (after IPA is issued)', 'SGD 30 (application)',
 'study', '4–6 weeks', 'Duration of course', CURRENT_DATE),

('any', 'singapore', 'Digital Nomad', 'Overseas Networks and Expertise Pass (ONE Pass)',
 'Singapore''s ONE Pass (launched January 2023) is designed for top global talent in business, arts, culture, sports, academia, and research. Unlike traditional work visas, it allows holders to work for multiple employers simultaneously and start businesses.',
 'Must earn at least SGD 30,000/month (about SGD 360,000/year) or have earned that in the last year. OR have outstanding achievements in arts, culture, sports, academia, or research as judged by relevant agencies. Validity: 5 years.',
 'Employment contract or proof of income (last 12 months payslips), valid passport, educational qualifications. For achievement track: relevant documentation of outstanding achievements (awards, publications, records).',
 'Typically 4–6 weeks', 'SGD 105 (application) + SGD 225 (issuance)',
 'digital_nomad', '4–6 weeks', '5 years, renewable', CURRENT_DATE),

('any', 'singapore', 'Retirement', 'Long-Term Visit Pass (LTVP) or Dependent''s Pass',
 '⚠️ Singapore does not have a retirement visa. Options for older foreign nationals: Dependent''s Pass (if your child holds an EP/S Pass/PEP); Long-Term Visit Pass (for relatives of Singapore citizens/PRs); or repeated tourist entries (30–90 day stays). Singapore does not have a passive income or financial independence visa category.',
 'Dependent''s Pass: Must be the parent of an EP/S Pass/PEP holder who earns SGD 6,000+/month. LTVP: Must be the parent or step-parent of a Singapore citizen or permanent resident.',
 'Dependent''s Pass: proof of parent-child relationship, employer''s pass holder application. LTVP: proof of relationship to SC/PR, relevant supporting documents. Tourist entry: valid passport, return ticket, sufficient funds.',
 'Typically 3–6 weeks (Dependent''s Pass); 8–10 weeks (LTVP)', 'SGD 105 (application) + SGD 225 (issuance)',
 'retirement', '3–6 weeks', 'Dependent''s Pass: tied to main pass holder; LTVP: 1–2 years renewable', CURRENT_DATE),

('any', 'singapore', 'Investor', 'Global Investor Programme (GIP)',
 'Singapore''s GIP grants permanent residency to substantial investors and business owners. Managed by the Economic Development Board (EDB). After 2 years of residence, GIP PR holders can apply for Singapore citizenship.',
 'Three options: (A) SGD 10,000,000 into a new/existing Singapore business; (B) SGD 25,000,000 into GIP Select fund investing in Singapore-based companies; (C) SGD 50,000,000 establishing/investing in a Singapore-based Single Family Office. Must have at least 3 years of entrepreneurial or executive experience.',
 'Business financial records (3 years), personal financial statements, detailed investment proposal, valid passport, criminal record. Applications submitted through EDB online portal.',
 'Typically 6–12 months', 'Application fee: SGD 10,000 (non-refundable)',
 'investor', '6–12 months', 'Permanent Residency (re-entry permit renewable every 5 years)', CURRENT_DATE),

('any', 'singapore', 'Family', 'Dependant''s Pass & Long-Term Visit Pass',
 'EP/S Pass/PEP holders earning SGD 6,000+/month can apply for a Dependant''s Pass for their spouse and unmarried children under 21. Those earning SGD 6,000+/month can also apply for LTVP for parents. Same-sex partnerships are not recognized under Singapore immigration law.',
 'For Dependant''s Pass: Main pass holder (EP, S Pass, or PEP) must earn at least SGD 6,000/month. Must be legally married spouse or unmarried child under 21. For LTVP: Parent/parent-in-law of EP holder earning SGD 6,000+/month.',
 'Dependant''s Pass application by employer/main pass holder, marriage certificate (for spouses), birth certificate (for children), both parties'' passports, main pass holder''s EP/employment details.',
 'Typically 3–6 weeks', 'SGD 105 (application) + SGD 225 (issuance)',
 'family', '3–6 weeks', 'Tied to main pass holder''s validity', CURRENT_DATE),

-- UNITED ARAB EMIRATES
('any', 'united-arab-emirates', 'Work', 'UAE Employment Visa',
 'The UAE employment visa is employer-sponsored and grants the right to work and reside in the UAE. With 2022 labor law reforms, employees now have greater mobility including the ability to change jobs more easily. Work permits (MOHRE) and residence visas are separate but linked.',
 'Must have a job offer from a UAE-registered company. Employer initiates the visa process. Must pass a medical fitness test in the UAE. No minimum salary requirement by law, but specific salary minimums apply for family visa sponsorship.',
 'Employment contract (attested), valid passport (6+ months validity), recent passport photos, medical fitness test in UAE, Emirates ID biometrics, degree certificates (attested by UAE Embassy and Ministry of Foreign Affairs in home country).',
 'Typically 2–4 weeks after entry with employment visa', 'AED 100–500 (varies by emirate and employer)',
 'work', '2–4 weeks', '2 years, renewable', CURRENT_DATE),

('any', 'united-arab-emirates', 'Study', 'UAE Student Visa',
 'International students studying at UAE universities or educational institutions can obtain a student residence visa. Universities typically assist with the application. Students may also study on a tourist/visit visa for short courses but need a student visa for long-term programs.',
 'Must be enrolled in a UAE-accredited educational institution. The institution typically sponsors the student visa. Must pass UAE medical fitness test.',
 'Enrollment letter from UAE institution, valid passport, passport photos, medical fitness test, Emirates ID biometrics. Institution typically handles most paperwork.',
 'Typically 2–4 weeks', 'AED 200–600 (varies)',
 'study', '2–4 weeks', 'Duration of studies, typically 1 year renewable', CURRENT_DATE),

('any', 'united-arab-emirates', 'Digital Nomad', 'UAE Remote Work Visa (Virtual Working Programme)',
 'Dubai launched a Virtual Working Programme (Remote Work Visa) in 2021 allowing remote workers to live in Dubai while working for foreign employers. The visa allows 1-year residence with the ability to use all UAE services including banking and schools.',
 'Must work for a company outside the UAE (employee) or be self-employed with clients outside UAE (freelancer). Monthly income requirement: USD 5,000/month (employee) — proof via employer letter and last month''s payslip. No minimum income formally for business owners but sufficient funds required.',
 'Valid passport, health insurance (UAE-approved provider), proof of employment with non-UAE company (employment contract + payslips OR proof of business ownership + bank statements), accommodation proof.',
 'Typically 2–4 weeks', 'USD 287 (application fee) + health insurance (approx. USD 500–1,000/year)',
 'digital_nomad', '2–4 weeks', '1 year, renewable', CURRENT_DATE),

('any', 'united-arab-emirates', 'Retirement', 'UAE Retirement Visa (5-Year Renewable)',
 'The UAE introduced a retirement residency visa in 2022 for expatriates aged 55+. Valid for 5 years and renewable. This allows long-term retirees who have been working in the UAE or are new arrivals to remain in the country.',
 'Must be at least 55 years old. Must meet ONE of three financial criteria: (1) monthly income of AED 20,000 (approximately USD 5,450); OR (2) savings of at least AED 1,000,000 in a 3-year fixed deposit in a UAE bank; OR (3) property ownership worth at least AED 2,000,000 in the UAE.',
 'Valid passport (6+ months validity), proof of age (passport), proof of meeting financial requirements (bank statements, property documents, or salary/pension letters), health insurance, medical fitness certificate.',
 'Typically 2–4 weeks', 'AED 3,700–4,500 (visa fees vary by emirate)',
 'retirement', '2–4 weeks', '5 years, renewable', CURRENT_DATE),

('any', 'united-arab-emirates', 'Investor', 'UAE Golden Visa (Investor/Property)',
 'The UAE Golden Visa grants long-term residency (5 or 10 years) to investors, entrepreneurs, outstanding specialists, and talented individuals. Holders can live, work, and study in the UAE without a national sponsor. Family can be included.',
 '10-year Golden Visa: investors with AED 10,000,000+ in UAE public investments, or company founders/partners with capital of AED 10,000,000+. 5-year Golden Visa: property investors with AED 2,000,000+ in UAE real estate (may be mortgaged if 50%+ paid). Also available to entrepreneurs with innovative projects, top students, and specialists in priority fields.',
 'Proof of investment (property title deed, company share certificates, or investment portfolio), valid passport, health insurance, medical fitness test, Emirates ID biometrics, no-objection certificate (if employed).',
 'Typically 2–4 weeks', 'AED 2,800–11,000 (varies by visa type)',
 'investor', '2–4 weeks', '5 or 10 years, renewable', CURRENT_DATE),

('any', 'united-arab-emirates', 'Family', 'UAE Family Visa (Residence Sponsorship)',
 'Employed residents in the UAE can sponsor their spouse and children. To sponsor a family, the sponsor must earn a minimum salary (AED 4,000/month or AED 3,000/month + accommodation provided). Parents can be sponsored if retired or under certain conditions.',
 'Sponsor must earn minimum AED 4,000/month (or AED 3,000/month + accommodation). Must have suitable accommodation (minimum space requirements apply). Spouse and children under 18 (or up to 21 if in full-time education) are covered. Daughters can be sponsored regardless of age if unmarried.',
 'Sponsor''s employment contract and payslips, tenancy contract (Ejari), valid passports, marriage certificate (attested by UAE Embassy + Ministry of Foreign Affairs), birth certificates for children, medical fitness tests for all family members.',
 'Typically 2–4 weeks', 'AED 2,000–5,000 (varies by emirate)',
 'family', '2–4 weeks', 'Tied to sponsor''s visa; typically 2 years', CURRENT_DATE)

ON CONFLICT DO NOTHING;
