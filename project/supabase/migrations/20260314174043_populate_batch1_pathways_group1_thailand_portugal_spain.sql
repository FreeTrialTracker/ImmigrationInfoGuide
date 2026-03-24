/*
  # Batch 1 Group 1: Populate pathways for Thailand, Portugal, Spain
  
  Adds all 6 goal pathways (Work, Study, Digital Nomad, Retirement, Investor, Family)
  for Thailand, Portugal, and Spain — countries that had zero pathways in the database.
  
  Each pathway uses the 'any' passport_slug indicating it applies to all nationalities
  (subject to country-specific restrictions noted in summaries).
*/

INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type, processing_time, validity_period, last_updated)
VALUES

-- THAILAND
('any', 'thailand', 'Work', 'Non-Immigrant B Visa (Work)', 
 'Work visa for foreign nationals employed by Thai companies or organizations. Required before obtaining a work permit from the Department of Employment.',
 'Must have a confirmed job offer from a Thai employer registered with the Revenue Department. Employer must have at least 4 Thai employees per foreign worker.',
 'Valid passport, employment contract, company registration documents, educational certificates, work permit application (WP.1 form), criminal background check, medical certificate.',
 'Typically 4–8 weeks', 'THB 2,000 (visa fee) + THB 3,000 (work permit)',
 'work', '4–8 weeks', '90 days extendable to 1 year', CURRENT_DATE),

('any', 'thailand', 'Study', 'Non-Immigrant ED Visa (Education)',
 'Student visa for those enrolled in Thai educational institutions, language schools, or Muay Thai academies.',
 'Must be accepted by an accredited Thai educational institution. The institution must be registered with the Ministry of Education.',
 'Acceptance letter from institution, proof of financial means (20,000 THB/person), valid passport, academic transcripts, 2 passport photos.',
 'Typically 2–4 weeks', 'THB 2,000 (visa fee)',
 'study', '2–4 weeks', '90 days extendable per course duration', CURRENT_DATE),

('any', 'thailand', 'Digital Nomad', 'Long-Term Resident (LTR) Visa – Work from Thailand',
 'Thailand''s LTR Visa (launched 2022) allows high-income remote workers, professionals, and digital nomads to live in Thailand for up to 10 years. The Work-from-Thailand category requires a minimum income of USD 80,000/year.',
 'Minimum gross income of USD 80,000/year for the past 2 years from overseas employment, OR USD 40,000/year if holding a Master''s degree or owning intellectual property. Must have valid health insurance covering at least THB 40,000.',
 'Proof of income (last 2 years payslips/tax returns), employment contract or business ownership proof, health insurance certificate, criminal background check, academic qualifications.',
 'Typically 4–8 weeks via BOI online portal', 'THB 50,000 (visa fee)',
 'digital_nomad', '4–8 weeks', 'Up to 10 years (5-year + 5-year renewal)', CURRENT_DATE),

('any', 'thailand', 'Retirement', 'Non-Immigrant O-A Visa (Retirement)',
 'Long-stay retirement visa for foreign nationals aged 50 and above. One of Southeast Asia''s most popular retirement destinations due to low cost of living, warm climate, and quality healthcare.',
 'Must be 50 years of age or older. Must not be prohibited from entering Thailand. Must demonstrate financial means: 800,000 THB deposited in a Thai bank, OR monthly income/pension of 65,000 THB, OR combination totaling 800,000 THB/year.',
 'Proof of age (passport), bank certificate showing 800,000 THB deposit OR income proof of 65,000 THB/month, health insurance (minimum 40,000 THB outpatient / 400,000 THB inpatient coverage), criminal background check, medical certificate.',
 'Typically 2–4 weeks', 'THB 2,000 (visa fee)',
 'retirement', '2–4 weeks', '1 year, renewable annually', CURRENT_DATE),

('any', 'thailand', 'Investor', 'Thailand Investment Visa (Non-Immigrant IB)',
 'For foreign nationals making substantial investments in Thailand through BOI-approved projects, property, or government bonds. Investment visa holders may receive special privileges through the Board of Investment (BOI).',
 'Investment of at least THB 10,000,000 (approximately USD 280,000) in: BOI-approved Thai businesses, Thai government bonds, or property funds. Must maintain the investment throughout the visa period.',
 'Investment documentation (share certificates, bond certificates, or property purchase agreements), BOI approval letter (if applicable), business plan, proof of funds (bank statements), company registration documents.',
 'Varies, typically 8–12 weeks', 'THB 2,000 (visa fee) + BOI application costs',
 'investor', '8–12 weeks', '1 year, renewable', CURRENT_DATE),

('any', 'thailand', 'Family', 'Non-Immigrant O Visa (Family)',
 'For family members joining a Thai national or a foreign national with long-term legal status in Thailand. Covers spouses, children, and parents.',
 'Must be the spouse, child (under 20), or parent of: a Thai national, or a foreign national holding a valid Non-Immigrant visa (B, O-A, LTR, etc.).',
 'Marriage certificate (notarized) or birth certificate, sponsor''s Thai ID or passport and valid visa, financial proof (sponsor must show adequate income), 2 passport photos, criminal background check (for some nationalities).',
 'Typically 2–4 weeks', 'THB 2,000 (visa fee)',
 'family', '2–4 weeks', '90 days extendable to 1 year', CURRENT_DATE),

-- PORTUGAL
('any', 'portugal', 'Work', 'Work Visa (Type D1) – Employment',
 'Portugal''s primary work visa for non-EU/EEA nationals with a signed employment contract. After entry, converts to a Residence Permit for Employed Activity (CNAIM appointment required).',
 'Must have a signed employment contract or binding job offer from a Portuguese employer. Employer must register with Social Security (Segurança Social). Some professions require Portuguese professional recognition.',
 'Employment contract, valid passport (6+ months validity), criminal record certificate (apostilled), proof of accommodation in Portugal, comprehensive health insurance, NIF (Portuguese tax number), proof of qualifications.',
 'Typically 2–3 months (visa) + 1–2 months (residence permit)', 'EUR 90 (visa) + EUR 83 (residence permit)',
 'work', '2–3 months', '1–2 years, renewable', CURRENT_DATE),

('any', 'portugal', 'Study', 'Student Visa (Type D4)',
 'For non-EU/EEA international students enrolled in Portuguese higher education, language courses, or professional training programs recognized by the Ministry of Education.',
 'Must be accepted by a recognized Portuguese institution (university, polytechnic, or accredited language school). Must demonstrate sufficient financial means.',
 'Acceptance letter from institution, proof of financial means (EUR 760/month or EUR 9,120/year), proof of accommodation, comprehensive health insurance, criminal record certificate, valid passport.',
 'Typically 1–2 months', 'EUR 90 (visa) + EUR 83 (residence permit)',
 'study', '1–2 months', 'Duration of studies, renewable', CURRENT_DATE),

('any', 'portugal', 'Digital Nomad', 'Digital Nomad Visa (Type D8)',
 'Portugal''s dedicated remote work visa, launched October 2022. Allows non-EU/EEA remote workers and freelancers to legally live in Portugal while working for foreign companies or clients.',
 'Must earn at least 4× the Portuguese minimum wage — approximately EUR 3,480/month (2024 rates, based on EUR 820 minimum wage × 4). Must work for employers or clients based outside Portugal.',
 'Proof of remote employment or freelance contracts, last 3 months bank statements showing income, accommodation proof (lease agreement), comprehensive health insurance, criminal record certificate, NIF (Portuguese tax number).',
 'Typically 2–3 months (consulate appointment wait times vary)', 'EUR 90 (visa) + EUR 83 (residence permit)',
 'digital_nomad', '2–3 months', '1 year, renewable up to 5 years (pathway to permanent residency)', CURRENT_DATE),

('any', 'portugal', 'Retirement', 'Passive Income Visa (Type D7)',
 'Portugal''s most popular retirement visa, sometimes called the "passive income visa." Designed for retirees, pensioners, and those with regular passive income. Leads to permanent residency after 5 years.',
 'Must demonstrate stable passive income from pensions, rental income, investments, or savings. Minimum threshold: EUR 760/month (1× minimum wage). Additional EUR 380/month per dependent.',
 'Proof of passive income (pension statements, bank statements showing regular income), accommodation proof (minimum 1-year lease or property deed), comprehensive health insurance, criminal record certificate, NIF.',
 'Typically 2–3 months', 'EUR 90 (visa) + EUR 83 (residence permit)',
 'retirement', '2–3 months', '2 years initially, then 3-year renewals (5 years to permanent residency)', CURRENT_DATE),

('any', 'portugal', 'Investor', 'Golden Visa (ARI – Autorização de Residência para Investimento)',
 'Portugal''s Golden Visa (ARI) remains active but real estate investment was removed in October 2023. Current qualifying routes: fund investment, company creation with job creation, arts/cultural heritage, scientific research, or venture capital.',
 'Must make a qualifying investment: EUR 500,000 in qualifying investment funds/venture capital; EUR 250,000 in artistic production or cultural/heritage restoration; EUR 500,000 in scientific research; or create a company with at least 10 permanent jobs.',
 'Investment documentation and proof of transfer through authorized channels, clean criminal record, valid passport, health insurance. Minimum stay requirement: 7 days/year in Portugal.',
 'Typically 3–6 months (plus BOI pre-approval)', 'EUR 533.90 (analysis fee) + EUR 5,324.60 (issuance fee)',
 'investor', '3–6 months', '2 years, renewable (5 years to citizenship eligibility)', CURRENT_DATE),

('any', 'portugal', 'Family', 'Family Reunification Visa (Type D6)',
 'Allows family members of Portuguese citizens or legal residents to join them in Portugal. Portugal has one of Europe''s most inclusive family reunification policies, recognizing same-sex partnerships.',
 'Must be the spouse/civil partner, minor children, adult dependent children (in full-time education), or dependent parents/in-laws of a Portuguese citizen or holder of valid Portuguese residence permit.',
 'Proof of family relationship (marriage certificate, birth certificate — all apostilled), sponsor''s valid residence permit or proof of citizenship, sponsor''s proof of accommodation and financial means, health insurance, criminal record.',
 'Typically 2–4 months', 'EUR 90 (visa) + EUR 83 (residence permit)',
 'family', '2–4 months', 'Same duration as sponsor''s permit', CURRENT_DATE),

-- SPAIN
('any', 'spain', 'Work', 'Residence and Work Permit (Autorización de Residencia y Trabajo)',
 'Spain''s standard work permit for non-EU/EEA workers. The employer initiates the process at the Provincial Office of Immigration. Following approval, the worker collects the visa at a Spanish consulate and then completes registration upon arrival.',
 'Must have a job offer from a Spanish employer. Spain''s labor market test (situación nacional de empleo) must be satisfied — the employer must prove no suitable Spanish/EU candidate was available. Certain high-demand professions are exempt.',
 'Employer''s work authorization application, employment contract, valid passport, criminal record certificate (apostilled), academic/professional qualifications, medical certificate, proof of accommodation.',
 'Typically 1–3 months', 'EUR 10.60 (administrative fee, employer pays)',
 'work', '1–3 months', '1 year, renewable', CURRENT_DATE),

('any', 'spain', 'Study', 'Student Visa (Tipo D – Estudios)',
 'For non-EU/EEA students enrolled in full-time courses at recognized Spanish institutions for more than 90 days. Spain is home to world-class universities and is the second most popular destination for Erasmus students.',
 'Must have an unconditional offer/enrollment from a recognized Spanish educational institution. Course must exceed 90 days.',
 'Enrollment letter (carta de admisión), proof of financial means (EUR 600/month or EUR 7,200/year), comprehensive health insurance, criminal record certificate, passport valid 1+ year beyond visa expiry, passport photos.',
 'Typically 1–2 months', 'EUR 60–80 (visa fee)',
 'study', '1–2 months', 'Duration of studies, renewable', CURRENT_DATE),

('any', 'spain', 'Digital Nomad', 'Digital Nomad Visa (Visa para Teletrabajadores Internacionales)',
 'Spain launched its Digital Nomad Visa in January 2023 under the Startup Act (Ley de Startups). Allows remote workers and freelancers from non-EU countries to live in Spain. After 1 year, converts to a 3-year residence permit.',
 'Must work for companies or clients based outside Spain (maximum 20% of income can come from Spanish clients). Minimum income: 200% of Spain''s minimum wage — approximately EUR 2,646/month (2024, SMI EUR 1,323 × 2). Health insurance required.',
 'Employment contract or freelance contracts with non-Spanish clients, last 3 months payslips/bank statements, comprehensive health insurance, criminal record certificate (apostilled), university degree or 3+ years professional experience.',
 'Typically 1–3 months at consulate', 'EUR 80 (visa fee)',
 'digital_nomad', '1–3 months', '1 year visa, then 3-year residence permit (renewable)', CURRENT_DATE),

('any', 'spain', 'Retirement', 'Non-Lucrative Visa (Visa de Residencia No Lucrativa)',
 'Spain''s retirement and passive income visa for non-EU/EEA nationals who want to live in Spain without working. No minimum age requirement. After 5 years, eligible for long-term EU residence or permanent residency.',
 'Must not intend to work in Spain in any capacity (including remote work for foreign employers). Must demonstrate sufficient financial means: approximately EUR 27,000/year (400% of IPREM: EUR 2,259.71/month in 2024) plus EUR 6,750/year per dependent.',
 'Proof of income (bank statements, pension statements showing required amounts), comprehensive health insurance with no co-pays and full Spanish coverage, criminal record certificate (apostilled), passport valid 1 year beyond application date.',
 'Typically 1–3 months', 'EUR 80 (visa fee)',
 'retirement', '1–3 months', '1 year, renewable in 2-year periods', CURRENT_DATE),

('any', 'spain', 'Investor', 'Golden Visa (Ley 14/2013 – Investor Residency)',
 'Spain''s Golden Visa allows non-EU investors to obtain a residence permit. Unlike Portugal''s 2023 changes, Spain''s real estate route remains active — though the government announced plans to eliminate it in 2024 (not yet enacted as of 2025). Check current status before applying.',
 'Qualifying investments: EUR 500,000 in Spanish real estate (unencumbered); EUR 1,000,000 in Spanish company shares or deposits in Spanish banks; EUR 2,000,000 in Spanish government bonds; or creation of a business project of general interest (job creation criteria).',
 'Investment documentation, proof of funds transfer, valid passport, criminal record certificate (apostilled), health insurance, proof of no tax debts in Spain.',
 'Typically 2–3 months', 'EUR 73.26 (administrative fee)',
 'investor', '2–3 months', '1 year (initial), then 2-year renewals (5 years to long-term EU residency)', CURRENT_DATE),

('any', 'spain', 'Family', 'Family Reunification Visa (Reagrupación Familiar)',
 'Allows family members of legal residents in Spain to join them. The sponsoring resident must have lived in Spain for at least 1 year and hold a residence permit valid for at least 1 more year.',
 'Sponsor must have lived in Spain for at least 1 year with a permit valid 1+ more year. Family members covered: spouse/partner, children under 18, dependent adult children, dependent parents (if sponsor is over 40 or other specific conditions).',
 'Sponsor''s valid residence permit, proof of economic means (100% IPREM per family member), adequate housing documentation (habitability certificate), proof of family relationship (apostilled), passport.',
 'Typically 2–4 months', 'EUR 10.60 (administrative fee)',
 'family', '2–4 months', 'Same as sponsor''s permit', CURRENT_DATE)

ON CONFLICT DO NOTHING;
