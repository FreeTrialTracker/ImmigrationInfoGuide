/*
  # Batch 1 Group 3: New Zealand, South Korea, Switzerland, Sweden, Norway
  
  Adds all 6 goal pathways for 5 popular immigration destinations.
*/

INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type, processing_time, validity_period, last_updated)
VALUES

-- NEW ZEALAND
('any', 'new-zealand', 'Work', 'Skilled Migrant Category Resident Visa',
 'New Zealand''s points-based residence visa for skilled workers. The SMC was reset in 2023 — now uses a straight-to-residence model rather than Expression of Interest. Requires skilled employment in NZ or a job offer.',
 'Must be 55 or under. Must have skilled employment in New Zealand or a job offer. Points are awarded for employment, work experience, and qualifications. Must score enough points to meet the threshold (set by Immigration NZ periodically).',
 'Evidence of skilled employment or job offer, educational qualifications, work experience documentation, health certificate, police clearance from each country lived in for 5+ years, valid passport.',
 'Typically 6–12 months', 'NZD 4,370 (application fee)',
 'work', '6–12 months', 'Permanent Residence', CURRENT_DATE),

('any', 'new-zealand', 'Study', 'Student Visa',
 'For international students studying in New Zealand for more than 3 months. New Zealand has world-ranked universities and polytechnics. Students on a full-time course of 1+ year can work up to 20 hours/week.',
 'Must be enrolled full-time at a New Zealand Tertiary Education Commission-registered provider. Must meet English language requirements (IELTS 5.5+ typically). Must demonstrate financial means.',
 'Offer of place letter from NZ institution, proof of financial means (NZD 15,000/year + tuition fees), health insurance (or eligible for ACC), valid passport, medical and x-ray certificate (if staying 12+ months), police certificates.',
 'Typically 4–6 weeks', 'NZD 375 (application fee)',
 'study', '4–6 weeks', 'Duration of course', CURRENT_DATE),

('any', 'new-zealand', 'Digital Nomad', 'Accredited Employer Work Visa (AEWV) / Working Holiday Visa',
 'New Zealand does not have a dedicated digital nomad visa. The closest options are: Working Holiday Visa (for ages 18–30/35 from 45 eligible countries, allows working for overseas employer), or Visitor Visa (for short-term remote work while visiting).',
 'Working Holiday Visa: Must be 18–30 years old (or up to 35 for some countries), citizen of an eligible country, not travelled to NZ on a previous WHV. Visitor Visa (remote work): Must have strong ties to home country, return ticket, sufficient funds.',
 'Working Holiday: valid passport from eligible country, proof of funds (NZD 4,200), return ticket, no dependent children. Visitor: valid passport, return ticket, sufficient funds, accommodation details.',
 'Working Holiday: typically immediate online or 3–4 weeks. Visitor: typically 3–4 weeks.', 'Working Holiday: NZD 210. Visitor Visa: NZD 246.',
 'digital_nomad', '3–4 weeks', 'Working Holiday: 12 months; Visitor: up to 9 months', CURRENT_DATE),

('any', 'new-zealand', 'Retirement', 'Investor 2 Category Visa / Parent Retirement Resident Visa',
 'New Zealand offers the Parent Retirement Resident Visa for parents of New Zealand citizens and residents who meet financial requirements. Requires a NZD 1,000,000 investment in NZ for 4 years. Provides immediate permanent residence.',
 'Must be a parent (or step-parent) of a NZ citizen or resident aged 17+. Must invest NZD 1,000,000 in NZ (can be 50% in residential property). Must have an acceptable income to support yourself (NZD 40,000+/year or sufficient assets). Health and character requirements apply.',
 'Proof of parent-child relationship, NZD 1,000,000 investment documentation (bank statements, property valuation), health insurance, police clearances, medical certificate, valid passport.',
 'Typically 6–12 months', 'NZD 4,370 (application fee)',
 'retirement', '6–12 months', 'Permanent Residence', CURRENT_DATE),

('any', 'new-zealand', 'Investor', 'Active Investor Plus Visa',
 'New Zealand''s Active Investor Plus Visa (replaced former Investor categories in 2022) targets high-net-worth individuals willing to make substantial and active investments in NZ. Minimum investment of NZD 5,000,000 — but direct investments (higher risk) require only NZD 5,000,000 while listed bonds require NZD 15,000,000.',
 'Must invest at least NZD 5,000,000 in direct investments (equity, bonds, venture capital, philanthropy) OR NZD 15,000,000 in listed equity/bonds. Must be genuinely invested (not passive cash deposits). English language and health requirements apply. Must spend minimum time in NZ (at least 117 days over 4 years for NZD 5M track).',
 'Investment proposal, source of funds documentation (financial records), business/investment experience evidence, health certificate, police certificates, English language evidence, valid passport.',
 'Typically 12–18 months', 'NZD 4,370 (application fee) + NZD 730 (Expression of Interest)',
 'investor', '12–18 months', 'Permanent Residence after investment conditions met', CURRENT_DATE),

('any', 'new-zealand', 'Family', 'Partner of a New Zealander Resident Visa',
 'Partners (married or de facto, including same-sex) of New Zealand citizens or residents can apply for residence directly. The partnership must be genuine and stable for 12+ months (immediate residence) or be in a new genuine partnership (2-year limited visa first).',
 'Must be the partner of a NZ citizen or permanent resident. For immediate residence: must have been in a genuine and stable partnership for 12+ months. For newer partnerships: 2-year limited visa granted first, then able to apply for residence.',
 'Proof of partnership (joint bank accounts, shared accommodation, photos together, statutory declarations), sponsor''s NZ citizenship or residence documents, police certificates, health certificate, valid passport.',
 'Typically 3–9 months', 'NZD 1,860–4,370 (depending on visa type)',
 'family', '3–9 months', '2-year limited visa (new partnerships) or Permanent Residence (12+ month partnerships)', CURRENT_DATE),

-- SOUTH KOREA
('any', 'south-korea', 'Work', 'E-7 Specific Activities Visa',
 'South Korea''s E-7 visa covers over 80 specific occupations in specialized sectors. Requires employer sponsorship. Highly skilled workers in designated shortage occupations may qualify for expedited processing. The Points-Based System (PBS) can help qualify for certain work visas.',
 'Must be sponsored by a Korean employer for one of the designated E-7 occupations. Generally requires a university degree and relevant work experience. Korean language proficiency (TOPIK) may be required for some positions.',
 'Employment contract with Korean employer, university degree certificate (apostilled), work experience certificates, passport, criminal background check, health certificate, application form.',
 'Typically 4–8 weeks', 'KRW 60,000 (short-term) to 130,000 (long-term)',
 'work', '4–8 weeks', '1–5 years, renewable', CURRENT_DATE),

('any', 'south-korea', 'Study', 'D-2 Student Visa',
 'For international students enrolled in Korean universities or colleges for associate''s, bachelor''s, master''s, or doctoral programs. South Korea is home to world-class universities and offers a vibrant campus life.',
 'Must have admission to a Korean university or college (regular or special). Must demonstrate financial capacity (approx. KRW 9,000,000/year for living expenses + tuition). Korean language proficiency (TOPIK Level 3+) or English proficiency for English-taught programs.',
 'Admission letter from Korean institution, financial proof (bank statements or scholarship letter), valid passport, criminal background check (recent), health certificate, passport photos.',
 'Typically 2–4 weeks', 'KRW 60,000–130,000',
 'study', '2–4 weeks', 'Duration of studies (1–4 years), renewable', CURRENT_DATE),

('any', 'south-korea', 'Digital Nomad', 'Workation Visa (F-1-D) – Digital Nomad Visa',
 'South Korea launched a Digital Nomad Visa (Type F-1-D Workation Visa) in January 2024. Allows remote workers to live in Korea for up to 1 year while working for foreign employers. Korea is an excellent tech hub with world-class internet infrastructure.',
 'Must be employed by a company outside South Korea OR be a self-employed person with clients outside Korea. Minimum annual income: USD 84,000/year (approximately KRW 110,000,000 at 2024 rates). Must have health insurance. No Korean language requirement.',
 'Employment contract or business ownership proof with non-Korean company, income proof (last 12 months tax returns or payslips showing USD 84,000+ annual income), health insurance, valid passport (6+ months validity), clean criminal record.',
 'Typically 2–4 weeks at Korean consulate', 'KRW 60,000',
 'digital_nomad', '2–4 weeks', '1 year (no renewal — new application required)', CURRENT_DATE),

('any', 'south-korea', 'Retirement', 'F-1 Visiting Family / Long-Term Tourist Stays',
 '⚠️ South Korea does not have a dedicated retirement visa. Options for retirees: F-1 visa (family visit) if you have Korean family, repeated tourist entries (90 days at a time for most nationalities, multiple re-entries possible), or investment-based approaches.',
 'F-1 Visa: Must have a qualifying family relationship with a Korean national or resident. Tourist (B-2): Most nationalities can enter Korea visa-free for 30–90 days and can re-enter without formal restriction.',
 'F-1: proof of family relationship, sponsor''s Korean ID or residence documents, valid passport. Tourist: valid passport, return ticket, sufficient funds, accommodation plans.',
 'Typically 2–4 weeks (F-1) or immediate/visa-free (tourist)', 'KRW 60,000 (F-1) or free (visa-free tourist entry)',
 'retirement', '2–4 weeks', 'F-1: 1–3 years renewable; Tourist: up to 90 days per entry', CURRENT_DATE),

('any', 'south-korea', 'Investor', 'D-8 Corporate Investment Visa',
 'The D-8 visa allows foreign investors who establish a Korean company or invest in an existing Korean company to reside in Korea. Minimum investment: KRW 100,000,000 (approximately USD 75,000). Investors may qualify for fast-track permanent residency (F-5).',
 'Must invest at least KRW 100,000,000 in a Korean company (as shareholder or representative). Company must be registered with Korean authorities. Must be actively managing the business. Higher investment amounts qualify for faster permanent residency pathways.',
 'Business registration certificate (법인등기부등본), investment proof (bank transfer records), articles of incorporation, business plan, financial statements, valid passport, criminal background check.',
 'Typically 4–8 weeks', 'KRW 130,000',
 'investor', '4–8 weeks', '1–5 years, renewable; permanent residency (F-5) after 3–5 years', CURRENT_DATE),

('any', 'south-korea', 'Family', 'F-6 Marriage Visa (Spouse of Korean National)',
 'Foreign spouses of South Korean citizens can obtain the F-6 marriage immigration visa. After 2 years of marriage + 1 year of cohabitation in Korea (or 3 years of marriage), eligible for F-5 permanent residency.',
 'Must be legally married to a South Korean citizen. Must demonstrate genuine marriage (not a marriage of convenience). Both parties must meet health requirements. Korean language proficiency (TOPIK Level 1 or basic interview) may be required.',
 'Marriage certificate (apostilled), Korean spouse''s family register (가족관계증명서), proof of genuine relationship (photos, communication records), financial proof (Korean spouse''s income documents), valid passport.',
 'Typically 4–8 weeks', 'KRW 130,000',
 'family', '4–8 weeks', '1–3 years, renewable; F-5 permanent residency after 2 years marriage + 1 year cohabitation', CURRENT_DATE),

-- SWITZERLAND
('any', 'switzerland', 'Work', 'Work and Residence Permit (L/B Permit)',
 'Switzerland has two main work permit types: L Permit (short-term, up to 12 months) and B Permit (long-term, 1 year renewable up to 5 years). Non-EU/EEA applicants face strict quotas — Switzerland has annual caps on non-EU work permits. Employer sponsorship is mandatory.',
 'Must have a concrete job offer from a Swiss employer. For non-EU/EEA nationals: must fall within annual quotas (extremely limited — typically 4,500 short-term and 8,500 long-term permits/year for all of Switzerland). Priority given to EU/EEA/EFTA nationals who face no quotas.',
 'Employment contract signed by Swiss employer, valid passport, employer must demonstrate no qualified Swiss or EU candidate was available (labor market test), educational certificates, proof of qualifications. Cantonal labor office approval required first.',
 'Typically 2–4 months (including quota allocation)', 'CHF 65–130 (permit fee, varies by canton)',
 'work', '2–4 months', 'L Permit: up to 12 months; B Permit: 1 year renewable (5 years to C Permit)', CURRENT_DATE),

('any', 'switzerland', 'Study', 'Student Residence Permit',
 'International students from non-EU/EEA countries studying at Swiss universities, universities of applied sciences, or other approved institutions for more than 3 months must obtain a student residence permit.',
 'Must be admitted to an accredited Swiss educational institution. Must demonstrate sufficient financial resources (CHF 21,000/year typically required). Must have comprehensive health insurance. Non-EU/EEA students are subject to quotas in some cantons.',
 'Admission letter from Swiss institution, proof of financial means (CHF 21,000/year or scholarship documentation), comprehensive health insurance, valid passport, passport photos, rental contract or accommodation proof.',
 'Typically 6–12 weeks', 'CHF 65–130 (permit fee)',
 'study', '6–12 weeks', 'Duration of studies, renewable', CURRENT_DATE),

('any', 'switzerland', 'Digital Nomad', 'Freelance/Self-Employed Permit (B Permit)',
 '⚠️ Switzerland does not have a dedicated digital nomad visa. Non-EU/EEA nationals may apply for a B Permit as self-employed if establishing a genuine business in Switzerland. This is extremely difficult due to quotas. Short visits (up to 90 days Schengen) allow continuation of foreign employment.',
 'To work as self-employed: must establish a genuine business in Switzerland, demonstrate economic benefit to Switzerland, prove sufficient income, and fall within annual quotas. For tourist stays: visitor visa or visa-free entry (Schengen rules apply).',
 'Business plan (for self-employment), proof of economic need for your services in Switzerland, financial means, health insurance, valid passport. Alternative: 90-day Schengen tourist stay with continuation of foreign remote work (legally grey area).',
 '3–6 months (self-employment permit)', 'CHF 65–130',
 'digital_nomad', '3–6 months', 'B Permit: 1 year renewable', CURRENT_DATE),

('any', 'switzerland', 'Retirement', 'Permit for Financially Independent Persons (Rentner/Rentière)',
 'Switzerland offers a special residence category for financially independent foreigners who can support themselves without working. Called "Permit for Annuitants" or under cantonal discretion. Applies to retired persons with significant passive income.',
 'Must be financially independent with no intention to work in Switzerland. Tax lump-sum arrangement (forfait fiscal) required in many cantons — minimum annual taxable income of CHF 400,000+ (varies by canton). Must be at least 55 years old in most cantons. Must be from a non-EU/EEA country to use this specific route.',
 'Proof of substantial financial means (investment portfolio statements, pension records, bank statements showing CHF 400,000+/year), agreement to lump-sum tax arrangement with cantonal tax authority, health insurance, valid passport, rental contract.',
 'Typically 3–6 months', 'Cantonal application fees + lump-sum tax agreement costs',
 'retirement', '3–6 months', 'B Permit (1 year renewable); C Permit after 5–10 years', CURRENT_DATE),

('any', 'switzerland', 'Investor', 'Business Investor Permit (B Permit – Self-Employed)',
 'Non-EU/EEA investors establishing significant businesses in Switzerland may qualify for a B Permit as self-employed businesspersons. Must demonstrate genuine economic activity benefiting Switzerland. Also, lump-sum taxation arrangements attract high-net-worth individuals to cantons like Zug and Geneva.',
 'Must establish a business with genuine economic benefit to Switzerland (job creation, innovation, or export potential). Investment amount must be substantial. Subject to annual quotas for non-EU/EEA nationals. Alternative: lump-sum tax agreement (minimum CHF 400,000/year taxable income in most cantons).',
 'Detailed business plan, proof of investment capital, evidence of Swiss business establishment, financial statements, valid passport, cantonal labor office pre-approval.',
 'Typically 3–6 months', 'CHF 65–130 (permit fee) + tax agreement costs',
 'investor', '3–6 months', 'B Permit: 1 year renewable; C Permit after 5–10 years', CURRENT_DATE),

('any', 'switzerland', 'Family', 'Family Reunification Permit',
 'Holders of Swiss B or C permits can bring their immediate family (spouse/registered partner and unmarried children under 18) to Switzerland under family reunification. Family members receive the same permit type as the main applicant.',
 'Main permit holder must have B or C permit with adequate living space and sufficient income to support family without social assistance. Must apply within 5 years of obtaining the permit (for children under 12, apply within 12 months). Children must be under 18.',
 'Main permit holder''s permit, proof of relationship (marriage certificate, birth certificates — apostilled), proof of adequate accommodation, proof of financial means to support family without public assistance, valid passports for all family members.',
 'Typically 2–3 months', 'CHF 65–130 per permit',
 'family', '2–3 months', 'Same as main permit holder', CURRENT_DATE),

-- SWEDEN
('any', 'sweden', 'Work', 'Work Permit (Arbetstillstånd)',
 'Sweden''s employer-sponsored work permit for non-EU/EEA nationals. Sweden has a uniquely flexible system — almost any job qualifies as long as the salary and conditions match Swedish collective agreements. No occupation list or points system.',
 'Must have a job offer from a Swedish employer. The job must offer: salary at least at industry/collective agreement levels (typically minimum SEK 13,000/month, equivalent to applicable collective agreement), standard employment benefits (pension, insurance, sick pay). Employer must advertise the job to EU workers first (though this requirement is less strict in practice).',
 'Employment contract, valid passport, employer''s registration details (Swedish company registration number), statement that collective agreement conditions are met, proof of qualifications (if relevant).',
 'Typically 4–12 weeks (Migrationsverket processing)', 'SEK 2,000',
 'work', '4–12 weeks', '2 years (first permit), 4 years (renewal), then permanent residence', CURRENT_DATE),

('any', 'sweden', 'Study', 'Residence Permit for Studies',
 'Non-EU/EEA students studying full-time at Swedish universities or university colleges must apply for a student residence permit. Sweden has many English-taught programs and historically free tuition (free for EU/EEA; fees for non-EU/EEA since 2011).',
 'Must have an unconditional offer from an accredited Swedish institution. Must demonstrate financial means: SEK 10,514/month (approximately EUR 940/month for 2024). Must have accepted comprehensive health insurance (or be covered by Swedish system in some cases).',
 'Unconditional offer of admission, proof of financial means (SEK 10,514/month), valid passport, health insurance (CSN loan documentation may count as financial proof for some), fee payment receipt.',
 'Typically 4–8 weeks (apply 1–2 months before term start)', 'SEK 1,000',
 'study', '4–8 weeks', 'Duration of studies, renewable', CURRENT_DATE),

('any', 'sweden', 'Digital Nomad', 'Self-Employment / Freelancer Permit',
 '⚠️ Sweden does not have a dedicated digital nomad visa. EU/EEA citizens can freelance freely. Non-EU/EEA nationals may apply for a self-employment permit if running a business in Sweden. Short Schengen visits (90 days) allow remote work for foreign employers (legally grey area).',
 'Self-employment permit: Must plan to run a business in Sweden, demonstrate sustainable livelihood from the Swedish business, have prior experience in the field, financial resources for startup period, and in some cases (medical/legal) Swedish professional credentials.',
 'Detailed business plan, proof of professional qualifications and experience, financial capacity (bank statements), health insurance, valid passport, tax registration preparation.',
 'Typically 8–16 weeks', 'SEK 2,000',
 'digital_nomad', '8–16 weeks', '2 years initially, renewable', CURRENT_DATE),

('any', 'sweden', 'Retirement', 'Permit for Financially Independent Persons',
 '⚠️ Sweden does not have a formal retirement visa. Non-EU/EEA retirees may apply under the "other reason" category or through family reunification. EU/EEA pensioners have right of residence. Options: family reunification with Swedish resident, or repeated Schengen stays (max 90 days).',
 'Family-based: Must be a family member (spouse, child, parent) of a Swedish citizen or resident. Financial independence: Must demonstrate very significant passive income or assets sufficient to cover all living costs without state support. Each application assessed individually.',
 'Proof of family relationship OR proof of substantial financial means, health insurance, valid passport, accommodation arrangements.',
 'Typically 3–6 months', 'SEK 1,500–2,000',
 'retirement', '3–6 months', '1 year initially, renewable; permanent residence after 4 years', CURRENT_DATE),

('any', 'sweden', 'Investor', 'Self-Employment / Business Owner Permit',
 'Non-EU/EEA business owners and investors in Sweden can apply for a self-employment work permit. No minimum investment required by law, but must demonstrate a viable Swedish business that provides sustainable income. After 2 years, eligible for permanent residence.',
 'Must plan to run a business in Sweden. Must demonstrate: relevant professional experience, viable business plan with realistic revenue projections, financial resources for initial period, intent to operate the business long-term.',
 'Business plan, proof of professional qualifications and relevant business experience, financial capital proof (bank statements), company registration preparations, valid passport, health insurance.',
 'Typically 8–16 weeks', 'SEK 2,000',
 'investor', '8–16 weeks', '2 years initially, renewable; permanent residence after 4 years', CURRENT_DATE),

('any', 'sweden', 'Family', 'Residence Permit for Family Members',
 'Family members of Swedish citizens or persons with permanent residence in Sweden can apply for family reunification. Sweden is generally open to family reunification, and the process is relatively straightforward compared to some EU countries.',
 'Must be the spouse/cohabiting partner (genuine relationship), child under 18, or parent (if dependent) of a Swedish citizen or permanent resident. Sponsor must demonstrate adequate income and housing unless spouse is a Swedish citizen.',
 'Proof of relationship (marriage certificate, cohabitation evidence, birth certificates), sponsor''s permit/citizenship proof, proof of accommodation and income (for non-citizen sponsors), valid passport.',
 'Typically 3–9 months', 'SEK 1,500',
 'family', '3–9 months', '2 years initially, renewable; permanent residence after 2 years of cohabitation', CURRENT_DATE),

-- NORWAY
('any', 'norway', 'Work', 'Skilled Worker Residence Permit',
 'Norway''s primary work permit for non-EU/EEA skilled workers. Must have a concrete job offer. Norway is not in the EU but is in the Schengen Area and EEA — EU/EEA workers have free movement rights. Non-EU/EEA workers face stricter requirements.',
 'Must have a concrete job offer in a skilled occupation. Must be a qualified professional (university degree, trade certificate, or other documented skills). The job must meet Norwegian salary standards. Must have full-time employment (at least 80% of normal working hours).',
 'Job offer letter or employment contract, valid passport, documentation of qualifications (university degree, trade certification), proof of identity.',
 'Typically 4–12 weeks (UDI processing)', 'NOK 6,300',
 'work', '4–12 weeks', '1–3 years initially, renewable; permanent residence after 3 years', CURRENT_DATE),

('any', 'norway', 'Study', 'Student Residence Permit',
 'Non-EU/EEA students studying in Norway for more than 3 months at a recognized educational institution must obtain a student residence permit. Norway has free or low-cost university education for students at public institutions (tuition fees introduced in 2023 for non-EEA students at some institutions).',
 'Must be admitted to a recognized Norwegian educational institution for a full-time program lasting more than 3 months. Must demonstrate financial means: NOK 123,519/year (2024 rate, the National Insurance base amount). Must have comprehensive health insurance.',
 'Letter of admission from Norwegian institution, proof of financial means (NOK 123,519/year), health insurance, valid passport.',
 'Typically 4–8 weeks', 'NOK 5,900',
 'study', '4–8 weeks', 'Duration of studies (usually 1 year renewable)', CURRENT_DATE),

('any', 'norway', 'Digital Nomad', 'Svalbard Residency / Self-Employment Permit',
 '⚠️ Norway does not have a dedicated digital nomad visa. However, the Svalbard archipelago has unique rules: any person may reside and work in Svalbard regardless of nationality (no immigration control), making it a unique option for digital nomads. For mainland Norway, Schengen 90-day visits allow continuation of foreign employment.',
 'Svalbard: no restrictions — any person can reside and work in Svalbard (with some practical limitations — must be self-supporting). Mainland: self-employment permit requires genuine Norwegian business. Schengen: 90 days in any 180-day period.',
 'Svalbard: just book accommodation and travel. Self-employment mainland: business plan, professional qualifications, financial means, valid passport. Schengen visit: valid passport, return ticket, funds.',
 'Svalbard: immediate. Self-employment mainland: 3–6 months.', 'NOK 6,300 (self-employment); free (Svalbard)',
 'digital_nomad', 'Svalbard: immediate; Mainland: 3–6 months', 'Svalbard: unlimited; Self-employment: 2 years renewable', CURRENT_DATE),

('any', 'norway', 'Retirement', 'Residence Permit for Financially Independent Persons',
 '⚠️ Norway does not have a formal retirement visa. The closest option is a general residence permit for financially independent persons — assessed case by case. EU/EEA pensioners have right of residence. Non-EU/EEA options are limited and assessed individually by UDI.',
 'Must demonstrate very substantial passive income or assets sufficient to support oneself in Norway without working or accessing public benefits. Must have health insurance. No age minimum.',
 'Evidence of substantial financial means (bank statements, pension records, investment portfolio), comprehensive health insurance, valid passport, accommodation proof.',
 'Typically 4–8 months', 'NOK 6,300',
 'retirement', '4–8 months', '1 year, renewable; permanent residence after 3 years', CURRENT_DATE),

('any', 'norway', 'Investor', 'Self-Employment / Business Owner Permit',
 'Non-EU/EEA entrepreneurs and investors establishing businesses in Norway can apply for a self-employment residence permit. Must demonstrate a viable Norwegian business. No minimum investment required by law, but must prove business viability.',
 'Must be establishing or running a business in Norway as a sole trader or company owner. Must demonstrate: professional qualifications, viable business plan, sufficient capital, and that the business is likely to generate sustainable income.',
 'Business plan, proof of professional qualifications, capital documentation (bank statements), company registration in Norway (Brønnøysund Register), valid passport, financial projections.',
 'Typically 3–6 months', 'NOK 6,300',
 'investor', '3–6 months', '2 years initially, renewable; permanent residence after 3 years', CURRENT_DATE),

('any', 'norway', 'Family', 'Family Immigration Permit',
 'Family members of Norwegian citizens or persons with permanent residence can apply for family immigration. Norway has relatively straightforward family reunification rules. The income requirement for the sponsor is significant (must earn above a set threshold).',
 'Must be the spouse/cohabiting partner (24+ years old for both parties), child under 18, or parent (if under 18 sibling in Norway). Sponsor must earn at least NOK 347,706/year (2024 rate, 88% of the National Insurance base amount × 4).',
 'Proof of relationship (marriage/birth certificates), sponsor''s proof of Norwegian citizenship or permanent residence, sponsor''s income documentation (Norwegian tax return, payslips), accommodation proof, valid passports.',
 'Typically 4–12 weeks', 'NOK 10,200 (spouse/partner); NOK 3,900 (child)',
 'family', '4–12 weeks', '1 year initially, renewable; permanent residence after 3 years', CURRENT_DATE)

ON CONFLICT DO NOTHING;
