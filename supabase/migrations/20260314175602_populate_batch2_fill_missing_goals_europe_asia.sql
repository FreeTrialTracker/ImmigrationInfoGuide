/*
  # Batch 2: Fill Missing Goals for Existing Countries
  
  Fills in the Digital Nomad, Retirement, Investor, and Family pathway gaps
  for countries that already had some pathways (France, Germany, Netherlands,
  Italy, Ireland, Japan, India, Australia Retirement, Canada Digital Nomad & Retirement,
  Austria Family, Belgium Family, Brazil Family, Chile Family, China Family,
  Colombia Family, Croatia Family, Czech Republic Family, Denmark Family).
*/

INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type, processing_time, validity_period, last_updated)
VALUES

-- FRANCE (missing: Digital Nomad, Retirement, Investor)
('any', 'france', 'Digital Nomad', 'French Tech Visa / Freelancer Long-Stay Visa',
 'France launched a dedicated digital nomad pathway as part of the French Tech Visa ecosystem. Freelancers and independent workers can apply for a "Talent Passport – Independent Profession" or the long-stay visa for freelancers. France is not a cheap destination but Paris, Lyon, and Bordeaux have growing startup communities.',
 'Talent Passport – Independent: Must have a significant track record as a freelancer/consultant, proof of existing clients or contracts, and sufficient income. Standard freelance long-stay: must demonstrate viable self-employed activity in France with sufficient income (approximately EUR 2,000+/month).',
 'Proof of freelance contracts or employment (non-French clients or French clients with freelance contracts), income documentation (last 3 months), comprehensive health insurance, accommodation proof, criminal record certificate, valid passport.',
 'Typically 2–3 months (consulate processing)', 'EUR 99 (visa fee)',
 'digital_nomad', '2–3 months', '1 year, renewable; Talent Passport valid 4 years', CURRENT_DATE),

('any', 'france', 'Retirement', 'Visitor Long-Stay Visa (Visa de Long Séjour Visiteur)',
 'France''s retirement visa for non-EU/EEA nationals who want to live in France without working. Must demonstrate passive income and proof of accommodation. After 5 years, eligible for long-term resident status.',
 'Must not intend to work in France. Must demonstrate sufficient financial resources: approximately EUR 1,502/month (single) or more for couples — equivalent to the French minimum wage (SMIC). Must have comprehensive health insurance with French coverage.',
 'Proof of passive income (pension letter, bank statements, investment income showing EUR 1,502+/month), comprehensive health insurance (no co-pays), accommodation proof (lease or property), criminal record certificate, valid passport.',
 'Typically 2–3 months at French consulate', 'EUR 99',
 'retirement', '2–3 months', '1 year, renewable; long-term residency after 5 years', CURRENT_DATE),

('any', 'france', 'Investor', 'Talent Passport – Investor (Passeport Talent Investisseur)',
 'France''s Talent Passport for investors allows non-EU nationals making substantial investments in France to obtain a 4-year residence permit. Designed to attract serious business investment.',
 'Must make a financial investment of at least EUR 300,000 in equipment and real estate (excluding land) used for operating a business in France, AND the business must create or maintain 10+ jobs for French residents within 4 years.',
 'Proof of EUR 300,000 investment commitment (business plan, bank guarantee, or investment agreement), French business registration or incorporation plan, valid passport, clean criminal record, health insurance.',
 'Typically 2–3 months', 'EUR 99',
 'investor', '2–3 months', '4 years (Talent Passport)', CURRENT_DATE),

-- GERMANY (missing: Digital Nomad, Retirement, Investor)
('any', 'germany', 'Digital Nomad', 'Germany Freelance Visa (Freiberufler)',
 'Germany''s Freelance Visa is the closest equivalent to a digital nomad visa. It''s for self-employed professionals in liberal professions (Freie Berufe) such as IT, journalists, artists, engineers, and consultants. Germany launched an "Opportunity Card" (Chancenkarte) in 2024 as a points-based job search/self-employment entry.',
 'Freelance Visa: Must work in a recognized liberal profession in Germany (NOT a commercial trade — that requires a different permit). Must demonstrate existing client base, viable income potential, relevant qualifications. Income must be sustainable.',
 'Portfolio of work, existing client contracts or letters of intent, bank statements showing financial reserves (typically EUR 6,000–10,000), comprehensive health insurance, professional qualifications, criminal background check, valid passport.',
 'Typically 2–4 months (Ausländerbehörde processing)', 'EUR 60–110',
 'digital_nomad', '2–4 months', '1–3 years, renewable', CURRENT_DATE),

('any', 'germany', 'Retirement', 'Residence Permit for Financially Independent Persons',
 'Germany does not have a dedicated retirement visa. Retirees from non-EU/EEA countries can apply for a general residence permit under §7(1) AufenthG as financially independent persons. Requires demonstrating sufficient financial means for entire stay without relying on German social benefits.',
 'Must have passive income (pension, savings, investments) sufficient to cover all living costs in Germany without working — typically EUR 1,500–2,000/month per person, plus adequate health insurance. Must not receive any German social benefits.',
 'Proof of substantial passive income (pension letters, bank statements, investment portfolio), comprehensive health insurance (including in Germany), accommodation proof, valid passport.',
 'Typically 2–4 months (application at German embassy)', 'EUR 110',
 'retirement', '2–4 months', '1–3 years, renewable; permanent residence (Niederlassungserlaubnis) after 5 years', CURRENT_DATE),

('any', 'germany', 'Investor', 'Self-Employment / Entrepreneur Visa (§21 AufenthG)',
 'Foreign entrepreneurs and investors can obtain a Residence Permit for Self-Employment under §21 of the Residence Act. The application is assessed based on economic benefit, viability of business plan, and job creation. Germany is Europe''s largest economy with a strong Mittelstand culture.',
 'Must demonstrate: a viable and detailed business plan; genuine economic interest or regional need; positive effects expected on the economy (job creation, innovation, investment); relevant professional qualifications and business experience. No minimum investment amount — assessed case by case.',
 'Detailed business plan (German if possible), proof of investment capital, professional qualifications, market analysis, any existing client contracts or letters of intent, valid passport, criminal background check, health insurance.',
 'Typically 2–4 months (varies by state authority)', 'EUR 110',
 'investor', '2–4 months', '3 years initially, renewable; permanent residence after 3–5 years', CURRENT_DATE),

-- NETHERLANDS (missing: Digital Nomad, Retirement, Investor)
('any', 'netherlands', 'Digital Nomad', 'Netherlands Startup Visa / Freelance Orientation Visa',
 'The Netherlands launched an Orientation Year Visa for graduates of top 200 global universities (valid 1 year) and the Startup Visa for innovative entrepreneurs. There is no dedicated digital nomad visa, but the Orientation Year allows graduates to seek self-employment.',
 'Orientation Year Visa: Must have graduated within the last 3 years from a top 200 university (THE/QS ranking). Can seek employment or establish a business during the year. General freelance work requires a regular work permit or self-employment authorization.',
 'Degree certificate from top-200 university, proof of graduation within 3 years, valid passport, financial means (EUR 879/month), health insurance, accommodation proof.',
 'Typically 4–8 weeks', 'EUR 192',
 'digital_nomad', '4–8 weeks', '1 year (Orientation Year); Startup Visa: 1 year + renewal', CURRENT_DATE),

('any', 'netherlands', 'Retirement', 'MVV Long-Stay Visa (Pensioner/Financially Independent)',
 'The Netherlands does not have a dedicated retirement visa. Non-EU/EEA retirees can apply for a regular residence permit as financially independent persons. Must demonstrate substantial passive income and comprehensive health insurance.',
 'Must have passive income sufficient to cover all living costs in the Netherlands without working — minimum EUR 1,839/month (2024 social assistance level) but in practice significantly more is expected. Must have comprehensive health insurance.',
 'Proof of passive income (pension, investment income — bank statements showing EUR 1,839+/month), comprehensive health insurance (Dutch-compliant), accommodation proof, valid passport, clean criminal record.',
 'Typically 3–4 months (IND processing)', 'EUR 192',
 'retirement', '3–4 months', '1–3 years, renewable; permanent residence after 5 years', CURRENT_DATE),

('any', 'netherlands', 'Investor', 'Self-Employment Residence Permit / Startup Visa',
 'The Netherlands Startup Visa (valid 1 year, for innovative startups with a recognized facilitator) and the subsequent Self-Employment permit are the main paths for investors and entrepreneurs. The country ranks highly for ease of doing business.',
 'Startup Visa: Must have an innovative startup concept assessed by an approved facilitator (IVO — Innovation Partner). Facilitator approves the business plan. Must have financial resources for the year (EUR 879/month). After 1 year, can apply for Self-Employment permit if business is viable.',
 'Startup business plan, approval from IVO facilitator, financial means (EUR 879/month), valid passport, health insurance, clean criminal record.',
 'Typically 4–8 weeks (Startup Visa)', 'EUR 192',
 'investor', '4–8 weeks', 'Startup Visa: 1 year; Self-Employment: 2 years, renewable', CURRENT_DATE),

-- ITALY (missing: Digital Nomad, Retirement, Investor)
('any', 'italy', 'Digital Nomad', 'Italy Digital Nomad Visa',
 'Italy officially launched its Digital Nomad Visa (Visto per Nomadi Digitali) in April 2024, making it a legal pathway for non-EU remote workers. Italy''s diverse cities — Rome, Milan, Florence, Bologna — all attract remote workers. The visa also allows application for Italian Flat Tax (7% or 15%) as a new resident.',
 'Must be a non-EU citizen working as an employee or self-employed for companies or clients based outside Italy. Minimum annual income: EUR 28,000 (approximately EUR 2,333/month). Must have comprehensive health insurance covering Italy. No Italian language requirement.',
 'Employment contract or freelance client contracts (non-Italian), last 3–6 months income proof (bank statements, payslips showing EUR 2,333+/month), comprehensive health insurance, accommodation proof, valid passport, criminal background check.',
 'Typically 1–3 months at Italian consulate', 'EUR 116 (visa fee)',
 'digital_nomad', '1–3 months', '1 year, renewable; can convert to residence permit', CURRENT_DATE),

('any', 'italy', 'Retirement', 'Italy Elective Residency Visa (Visto per Residenza Elettiva)',
 'Italy''s retirement visa for non-EU nationals — the Elective Residency Visa — requires demonstrating significant passive income from foreign sources. It does not allow working in Italy in any form. Italy also has a special 7% flat income tax incentive for retirees who move to towns with fewer than 20,000 inhabitants in southern Italy.',
 'Must have a stable and continuous passive income from abroad of at least EUR 31,000/year (approximately EUR 2,583/month) — though in practice higher is expected by consulates (often EUR 40,000–50,000/year). Must have comprehensive health insurance. Must not work in Italy.',
 'Proof of passive income (foreign pension, investment income, rental income — bank statements for last 12 months), comprehensive health insurance covering Italy, accommodation proof (lease minimum 1 year), valid passport, criminal background check.',
 'Typically 1–3 months at Italian consulate', 'EUR 116',
 'retirement', '1–3 months', '1 year, renewable; permanent residence after 5 years', CURRENT_DATE),

('any', 'italy', 'Investor', 'Italy Investor Visa (Visto Investitore)',
 'Italy''s Investor Visa offers non-EU nationals residence through qualifying investments. After arrival, converts to a 2-year Investor Residence Permit. Italy also has a flat tax incentive (EUR 100,000/year lump sum) for high-net-worth new residents.',
 'Qualifying investments: EUR 2,000,000 in Italian government bonds (minimum 2-year hold); EUR 500,000 in Italian company shares or quotas (unlisted); EUR 250,000 in innovative startups; or EUR 1,000,000 philanthropic donation to Italian projects of public interest. Must have minimum income of EUR 100,000/year (or EUR 50,000/year for exceptional professionals).',
 'Investment documentation and evidence of transfer through Italian banking system, valid passport, criminal background check, income proof (EUR 100,000/year), health insurance.',
 'Typically 30 days (government committee) + consulate processing', 'EUR 116 (visa fee)',
 'investor', '1–3 months', '2 years, renewable; permanent residence after 5 years', CURRENT_DATE),

-- IRELAND (missing: Digital Nomad, Retirement, Investor)
('any', 'ireland', 'Digital Nomad', 'Irish Tech Visa / Startup Entrepreneur Programme',
 '⚠️ Ireland does not have a dedicated digital nomad visa. The Start-up Entrepreneur Programme (STEP) is available for entrepreneurs. Short-term remote workers from the UK and EEA have free movement. Non-EEA nationals typically use tourist visa stays (90 days Schengen/non-Schengen) for short remote work stints.',
 'STEP: Must have an innovative business idea with global market potential. Must have EUR 75,000 seed funding. Business plan assessed by Enterprise Ireland. General freelancing: must be EU/EEA citizen or obtain a Critical Skills Employment Permit.',
 'STEP: business plan, EUR 75,000 funding proof, Enterprise Ireland assessment. Tourist: valid passport, return ticket, sufficient funds.',
 'STEP: typically 3–6 months. Tourist: immediate.', 'STEP: EUR 1,000 application. Tourist: EUR 60 (visa) or free (visa-exempt).',
 'digital_nomad', '3–6 months (STEP)', '2 years (STEP, renewable); 90 days (tourist)', CURRENT_DATE),

('any', 'ireland', 'Retirement', 'Stamp 0 – Financial Independence Visa',
 'Non-EU/EEA retirees can apply for Stamp 0 permission — Ireland''s category for financially independent persons who do not need to work. Requires demonstrating substantial passive income. Must renew annually. Ireland does not have a streamlined "retirement visa" — Stamp 0 is assessed case by case.',
 'Must have a minimum income of EUR 50,000/year per person (or EUR 100,000 for a couple) from passive sources — pension, investments, rental income. Must have comprehensive private health insurance. Must not need to access Irish public services.',
 'Proof of passive income (EUR 50,000/year minimum), comprehensive private health insurance (no public health entitlement), accommodation proof, bank statements showing sufficient ongoing income, valid passport.',
 'Typically 3–6 months (INIS processing)', 'EUR 300 (immigration application)',
 'retirement', '3–6 months', '1 year, renewable (Stamp 0)', CURRENT_DATE),

('any', 'ireland', 'Investor', 'Immigrant Investor Programme (IIP)',
 'Ireland''s IIP provides long-term residency to non-EU/EEA investors who make significant investments in the Irish economy. Investment options include enterprise, fund, real estate investment trust (REIT), and endowments. Important: IIP was closed to new applications as of February 2023; a replacement scheme is being designed.',
 '⚠️ The original IIP is CLOSED (February 2023). A replacement scheme is under development. Previous IIP required: EUR 1,000,000 enterprise investment (3 years); EUR 1,000,000 approved investment fund (3 years); EUR 2,000,000 in REIT; or EUR 500,000 endowment. Check with the Department of Justice for the current replacement scheme status.',
 'Monitor Department of Justice website for new investor immigration scheme. Previously: investment documentation, business plan (enterprise), valid passport, clean criminal record, source of funds documentation.',
 'To be confirmed under new scheme', 'To be confirmed',
 'investor', 'To be confirmed', 'Previously 2 years, renewable; permanent residency pathway after 5 years', CURRENT_DATE),

-- JAPAN (missing: Digital Nomad, Retirement, Investor)
('any', 'japan', 'Digital Nomad', 'Japan Digital Nomad Visa',
 'Japan launched an official Digital Nomad Visa in March 2024 — a 6-month single-entry visa for remote workers. Japan is an extremely popular destination with digital nomads for its culture, safety, and food. Tokyo, Kyoto, and Osaka are top picks.',
 'Must work remotely for a company or as a freelancer with clients entirely outside Japan. Must earn at least JPY 10,000,000/year (approximately USD 65,000/year). Must have health insurance covering Japan. Eligible nationalities: 49 countries with tax treaties or visa-free agreements with Japan (as of 2024).',
 'Proof of employment with non-Japanese company or freelance contracts with non-Japanese clients, last 12 months income proof (JPY 10,000,000/year), comprehensive health insurance, valid passport from eligible country, no Japanese criminal record.',
 'Typically 2–4 weeks at Japanese consulate', 'JPY 3,000',
 'digital_nomad', '2–4 weeks', '6 months (no renewal — must re-apply or use different visa)', CURRENT_DATE),

('any', 'japan', 'Retirement', 'Long-Term Resident Visa / Spouse Visa',
 '⚠️ Japan does not have a retirement visa. Long-term stay for retirees is very limited. Options: (1) Spouse of Japanese national; (2) Long-Term Resident status (requires special connection to Japan — e.g., Japanese-Brazilian, Nikkei descendants); (3) Repeated 90-day tourist visa entries. Japan is notoriously difficult for long-term non-working foreign residents.',
 'Spouse of Japanese national: must be legally married to Japanese citizen. Long-Term Resident: must have Japanese ancestry (3rd generation or less) or other specific qualifying reason. Retired persons without these connections have extremely limited options.',
 'Long-Term Resident (Nikkei): proof of Japanese ancestry (family register, birth/marriage certificates tracing lineage). Spouse: marriage certificate, Japanese spouse''s family register.',
 'Typically 2–3 months', 'JPY 3,000 (visa)',
 'retirement', '2–3 months', '1–5 years (Long-Term Resident); 1–5 years (Spouse) — renewable', CURRENT_DATE),

('any', 'japan', 'Investor', 'Business Manager Visa (経営・管理)',
 'The Business Manager Visa is Japan''s primary route for foreign investors and entrepreneurs. To qualify, you must establish a genuine business office in Japan with at least JPY 5,000,000 in capital. This is one of the few pathways to long-term residency without employer sponsorship.',
 'Must establish a genuine business in Japan with minimum JPY 5,000,000 capital investment AND either 2+ full-time employees OR an office requiring JPY 5,000,000 investment in office space/equipment. Business must have realistic profit potential.',
 'Business registration (法人登記), office lease agreement or purchase, JPY 5,000,000 capital proof, business plan, Certificate of Eligibility (CoE) application, valid passport.',
 'Typically 2–3 months (CoE) + 1–2 weeks (visa)', 'JPY 3,000 (visa) + JPY 4,000 (CoE)',
 'investor', '2–3 months', '1–5 years, renewable; permanent residency after 5–10 years', CURRENT_DATE),

-- INDIA (missing: Digital Nomad, Retirement, Investor)
('any', 'india', 'Digital Nomad', 'e-Business Visa / Long-Stay Visitor Visa',
 '⚠️ India does not have a dedicated digital nomad visa as of 2025. Remote workers typically use the e-Visa (tourist or business category, 60–180 days) or apply for a long-stay Visitor Visa (X visa). India''s major tech cities — Bangalore, Hyderabad, Pune — have emerging nomad communities.',
 'e-Tourist Visa: available to 166+ nationalities for 30–90 days. e-Business Visa: for meetings and business activities. Neither explicitly authorizes remote work for foreign companies, but this is generally tolerated.',
 'e-Visa: valid passport, digital photo, credit card for online payment. Long-stay X visa: proof of purpose, financial means, accommodation details.',
 'e-Visa: typically 3 business days. Long-stay: 4–8 weeks.', 'USD 25–80 (e-Visa, varies by nationality)',
 'digital_nomad', '3 business days (e-Visa)', 'e-Tourist: 30 days (single) or 90 days (multiple-entry); X visa: up to 1 year', CURRENT_DATE),

('any', 'india', 'Retirement', 'OCI Card / Long-Stay Tourist / X Visa',
 'India does not have a specific retirement visa for foreigners. Main long-term options: (1) OCI (Overseas Citizen of India) Card for Indian diaspora — lifetime right of residence with almost all rights of Indian citizens; (2) Repeated e-Visa entries; (3) Long-stay Visitor (X) Visa for those with Indian family connections.',
 'OCI: Must be of Indian origin (self or spouse or parents born in India), or be a former Indian citizen, or be a minor child of OCI cardholders. X Visa: Must have a genuine reason for long-stay (family connection, medical treatment, etc.).',
 'OCI: proof of Indian origin (birth certificate, parent''s Indian passport), valid foreign passport. X Visa: proof of family connection in India, financial means, accommodation details.',
 'OCI: typically 6–12 weeks. X Visa: 4–8 weeks.', 'USD 275 (OCI for US passport holders; varies by nationality) + government fees',
 'retirement', '6–12 weeks (OCI)', 'OCI: lifetime (no renewal); X Visa: up to 5 years', CURRENT_DATE),

('any', 'india', 'Investor', 'Business Visa (B) / Employment Visa (E) – Investor Category',
 'Foreign investors in India can obtain a Business Visa (for exploratory/business purposes) or an Employment Visa (for working in a managerial role in their own Indian company). India has been reforming FDI rules, allowing 100% foreign ownership in most sectors.',
 'Business Visa: For meetings, business exploration, establishing joint ventures. Employment Visa: For working in India for a company (including your own) — requires minimum annual salary of USD 25,000. 100% FDI allowed in most sectors via automatic route.',
 'Employment Visa: employment contract with Indian company, Indian company registration (MCA), salary proof (USD 25,000+/year), valid passport, recent photograph. Business Visa: invitation letter from Indian company, passport.',
 'Employment Visa: typically 4–8 weeks. Business Visa: 3–5 business days (e-Visa).', 'Business e-Visa: USD 25–80. Employment Visa: USD 100–200.',
 'investor', '4–8 weeks', 'Business e-Visa: 90 days. Employment Visa: 1 year renewable.', CURRENT_DATE),

-- AUSTRALIA (missing: Retirement)
('any', 'australia', 'Retirement', 'Investor Retirement Visa (Subclass 405)',
 'Australia''s Investor Retirement Visa (Subclass 405) allows self-funded retirees from outside the EEA to retire in Australia. Requires investing a significant amount in a designated investment in a state or territory. This visa does NOT lead to permanent residency — it is a temporary, renewable visa.',
 'Must be aged 55 or over. Must not have any dependants other than a partner. Must be willing to invest: AUD 750,000 in a designated investment in a less-populated state; or AUD 500,000 in a designated investment in a very remote state; plus demonstrate income of AUD 65,000/year (single) or AUD 85,000 (couple).',
 'Proof of age, investment funds and willingness to invest in designated investment, income evidence, comprehensive health insurance, health examination, police clearances.',
 'Typically 4–8 months', 'AUD 2,645',
 'retirement', '4–8 months', '4 years, renewable (no pathway to permanent residency)', CURRENT_DATE),

-- CANADA (missing: Digital Nomad, Retirement)
('any', 'canada', 'Digital Nomad', 'Canada Digital Nomad Strategy / Temporary Resident Visa',
 '⚠️ Canada does not have a dedicated digital nomad visa as of 2025, despite government announcements of interest in creating one. Digital nomads typically enter on a Visitor Visa (TRV) or through the Electronic Travel Authorization (eTA) for eligible nationalities. Working remotely for non-Canadian employers while visiting Canada on a TRV is generally permitted.',
 'Visitor Visa / eTA: eligible for 58+ nationalities via eTA. Must demonstrate intent to leave Canada before authorization expires. Working for Canadian employers requires a work permit. Working for non-Canadian employers remotely is generally allowed.',
 'eTA: valid passport from eligible country, credit card for application fee, travel details. TRV: valid passport, return ticket, financial means, accommodation, ties to home country.',
 'eTA: typically immediate. TRV: 2–8 weeks.', 'eTA: CAD 7. TRV: CAD 100.',
 'digital_nomad', 'Immediate (eTA) or 2–8 weeks (TRV)', 'eTA: up to 6 months per entry; TRV: up to 6 months per entry', CURRENT_DATE),

('any', 'canada', 'Retirement', 'Parent and Grandparent Program (PGP) / Super Visa',
 'Canada does not have a general retirement visa. The main options for retirees are: (1) Super Visa — for parents and grandparents of Canadian citizens/PRs (up to 5 years per visit, valid 10 years); (2) Parent and Grandparent Program — permanent residency lottery for those with qualifying Canadian family.',
 'Super Visa: Must be a parent or grandparent of a Canadian citizen or permanent resident. Sponsor''s income must meet LICO (Low Income Cut-Off) threshold. Must have Canadian health insurance. PGP: Must be selected in the annual lottery (extremely competitive — only ~10,000 spaces per year).',
 'Super Visa: invitation letter from child/grandchild, proof of sponsor''s income (LICO+), Canadian health insurance (minimum CAD 100,000 coverage), valid passport, medical exam. PGP: sponsor registers interest — if selected, then completes application.',
 'Super Visa: typically 4–8 weeks. PGP: lottery, then 12–24 months processing.', 'Super Visa: CAD 100. PGP: CAD 1,365 (if selected).',
 'retirement', '4–8 weeks (Super Visa)', 'Super Visa: up to 5 years per entry, 10-year visa. PGP: permanent residence.', CURRENT_DATE),

-- AUSTRIA (missing: Family)
('any', 'austria', 'Family', 'Family Reunification Permit (Österreich)',
 'Holders of Austrian Red-White-Red Cards, Settlement Permits, or Austrian citizens can apply for family reunification. Spouses must demonstrate basic German language proficiency (A1 level) before entry. Annual quotas apply for family reunification in some categories.',
 'Must be the spouse or unmarried child under 18 of an Austrian citizen, EU/EEA citizen with stable residence, or person with Settlement Permit/RWR Card. Sponsor must have adequate income and accommodation. German A1 required for spouses (level can sometimes be deferred).',
 'Marriage certificate or birth certificate (apostilled), sponsor''s Austrian residence status proof, proof of adequate income (150% of standard rate × family size), accommodation proof (min. 12m² per person), German A1 language certificate (or exemption), valid passport.',
 'Typically 3–6 months', 'EUR 160',
 'family', '3–6 months', '1 year, renewable; permanent settlement after 5 years', CURRENT_DATE),

-- BELGIUM (missing: Family)
('any', 'belgium', 'Family', 'Family Reunification Visa (Belgium)',
 'Belgium''s family reunification rules are complex and depend on which region the sponsor lives in. Spouses or registered partners of Belgian citizens or legal residents can apply. Different income thresholds and processing apply across Flanders, Wallonia, and Brussels-Capital.',
 'Must be the spouse (formally married) or registered partner (legally registered) or minor child under 18 of a Belgian citizen, EU citizen with legal residence, or non-EU national with 12 months legal residence. Sponsor must meet income requirements (at or above integration income: EUR 1,660–1,760/month depending on region and year).',
 'Marriage/registered partnership certificate (apostilled), sponsor''s Belgian residence documents, sponsor''s income proof (3 months payslips or tax return), valid accommodation certificate, proof of no health risk to public order, valid passport.',
 'Typically 3–6 months (consulate + regional authority)', 'EUR 215 (visa fee)',
 'family', '3–6 months', '1 year initially, renewable; permanent settlement after 5 years', CURRENT_DATE),

-- BRAZIL (missing: Family)
('any', 'brazil', 'Family', 'Brazil Family Reunification Visa (VITEM XI)',
 'Brazil offers family reunification for spouses, partners, and minor children of Brazilian citizens or permanent residents. Brazil recognizes same-sex marriages. Under the new Migration Law (2017), procedures are more accessible.',
 'Must be the spouse/partner, minor child under 18, or dependent adult child of a Brazilian citizen or permanent resident (VIPER holder). Marriage or stable union (união estável) recognized. Same-sex partnerships fully recognized.',
 'Marriage certificate or proof of stable union (notarized), Brazilian citizen/resident''s CPF and identity documents, birth certificates for children, valid passport, criminal background check.',
 'Typically 4–8 weeks (consulate)', 'USD 15 (visa fee)',
 'family', '4–8 weeks', '2 years initially, renewable; permanent residency (VIPER) after 4 years', CURRENT_DATE),

-- CHILE (missing: Family) — already has "Family Reunification" but let's check
-- CHINA (missing: Family)
('any', 'china', 'Family', 'S Visa (Family Reunion)',
 'China''s S Visa is issued for family reunion — for foreign nationals whose spouse, parents, children, or other close relatives are Chinese citizens or foreigners with Chinese permanent residence (Green Card). S1 is for long-stay (180+ days); S2 for short-stay.',
 'Must be the spouse, parent, or child of a Chinese citizen OR spouse/parent/child of a foreigner holding a permanent residence certificate in China. S1 requires long-term reunion; S2 for short visits.',
 'Proof of family relationship (marriage certificate or birth certificate — Chinese translation), sponsor''s Chinese ID or permanent residence certificate, invitation letter from sponsor, valid passport.',
 'Typically 4–8 weeks at Chinese embassy', 'USD 140 (single entry) to USD 185 (multiple entry)',
 'family', '4–8 weeks', 'S1: valid for 2 years multiple-entry; S2: 90 days per entry', CURRENT_DATE),

-- COLOMBIA (missing: Family)
('any', 'colombia', 'Family', 'Colombia Beneficiary Visa (Cónyuge/Familia)',
 'Colombia''s Beneficiary Visa (Visa de Beneficiario) allows family members of Colombian citizens or foreigners with Colombian residency to obtain legal status. Under Colombia''s 2022 immigration reform, visa categories were modernized.',
 'Must be the spouse/permanent partner, minor child under 18, or legally dependent adult of a Colombian citizen or foreigner with valid Colombian migration permit. Same-sex partnerships recognized in Colombia.',
 'Marriage certificate or cohabitation proof (at least 2 years), principal person''s Colombian ID or residence permit, financial support proof, valid passport, passport photos.',
 'Typically 4–8 weeks (online application at cancillería.gov.co)', 'USD 52 (visa fee)',
 'family', '4–8 weeks', '1–3 years, renewable', CURRENT_DATE),

-- CROATIA (missing: Family)
('any', 'croatia', 'Family', 'Croatia Temporary Residence – Family Reunification',
 'Non-EU/EEA family members of Croatian citizens or foreigners with valid Croatian residence permits can apply for family reunification temporary residence. Croatia joined the EU in 2013 and Schengen in 2023.',
 'Must be the spouse, common-law partner, minor child under 18, or dependent adult child of a Croatian citizen or a foreigner with valid Croatian long-term residence. Sponsor must have adequate income and accommodation.',
 'Marriage certificate (apostilled, Croatian translation), sponsor''s Croatian documents, financial proof, accommodation documentation, health insurance, valid passport, clean criminal record.',
 'Typically 2–4 months (MUP processing)', 'HRK 300 (approximately EUR 40)',
 'family', '2–4 months', '1 year, renewable; permanent residence after 5 years', CURRENT_DATE),

-- CZECH REPUBLIC (missing: Family)
('any', 'czech-republic', 'Family', 'Czech Republic Family Reunification Permit',
 'Family members of Czech citizens or foreigners with valid long-term Czech residence can apply for family reunification. The Czech Republic has streamlined procedures for most EU destinations.',
 'Must be the spouse, registered partner, or minor child under 18 of a Czech citizen or foreigner with valid long-term Czech residence. Sponsor must demonstrate adequate income (at least 1.5× Czech minimum wage per family member) and adequate housing.',
 'Marriage/partnership certificate (apostilled, Czech translation), sponsor''s Czech residence/citizenship proof, income proof, accommodation certificate, health insurance, valid passport, criminal background check.',
 'Typically 3–6 months (MOI processing)', 'CZK 2,500 (approximately EUR 100)',
 'family', '3–6 months', '1 year, renewable; permanent residence after 5 years', CURRENT_DATE),

-- DENMARK (missing: Family)
('any', 'denmark', 'Family', 'Denmark Family Reunification',
 'Denmark''s family reunification rules are among the strictest in the EU. The Attachment Requirement means the couple must demonstrate a stronger link to Denmark than to any other country. Income, accommodation, and language requirements apply to the sponsor.',
 'Must be the spouse/cohabiting partner (both must be 24+ years old), or minor child under 15 (15+ requires additional criteria). Sponsor must earn above the income threshold (approximately DKK 35,000/month gross in 2024), pass the Integration Test (Danish language and society), not have received social benefits for 3 years prior, and have adequate housing.',
 'Marriage certificate (apostilled, Danish translation), sponsor''s Danish citizenship/residence permit, income documentation, housing certificate, proof of language test passed, valid passport.',
 'Typically 6–12 months (SIRI processing)', 'DKK 7,670 (approximately EUR 1,030)',
 'family', '6–12 months', '2 years initially, renewable; permanent residence after 4 years', CURRENT_DATE),

-- EGYPT (missing: Digital Nomad, Retirement, Investor)
('any', 'egypt', 'Digital Nomad', 'Egypt Tourist Visa / e-Visa',
 '⚠️ Egypt does not have a dedicated digital nomad visa as of 2025. Remote workers typically use the e-Visa (available to 75+ nationalities) or tourist visa for up to 30 days (extendable). Hurghada, Dahab, and Cairo have growing remote work communities.',
 'e-Visa: available to citizens of 75+ nationalities. Valid for up to 30 days, single or multiple entry. Tourist visa: available at Egyptian embassies or on arrival at major airports.',
 'e-Visa: valid passport, digital photo, credit card. Tourist visa: valid passport, sufficient funds.',
 'e-Visa: typically 3–5 business days', 'USD 25 (e-Visa)',
 'digital_nomad', '3–5 days', 'e-Visa: 30 days; tourist visa: 30 days (extendable)', CURRENT_DATE),

('any', 'egypt', 'Retirement', 'Residence by Property Investment',
 'Egypt offers residency to foreigners who purchase property. Property worth USD 100,000 or more grants a 3-year renewable residence permit; USD 200,000+ grants a 5-year permit. This is the most practical long-term residency option for retirees without Egyptian family.',
 'Purchase property worth at least USD 100,000 in Egypt. Property must be fully paid and titled in the applicant''s name. Purchase must be through official channels with documentation.',
 'Property title deed, proof of property value (official appraisal), proof of full payment, valid passport, clean criminal record.',
 'Typically 1–3 months', 'EGP 300–1,000 (administrative fees)',
 'retirement', '1–3 months', '3 years (USD 100,000 property) or 5 years (USD 200,000 property) — renewable', CURRENT_DATE),

('any', 'egypt', 'Investor', 'Investor Residence Permit',
 'Egypt offers residency to investors making qualifying investments through the General Authority for Investment and Free Zones (GAFI). Egypt has been reforming its investment climate under the Economic Reform program. Free zones and special economic zones offer additional incentives.',
 'Must establish a business or make an investment through GAFI. Minimum investment of EGP 5,000,000 (approximately USD 160,000) in a productive or service activity. Company must employ Egyptian workers (ratio requirements apply).',
 'GAFI investment license, company registration documents, investment transfer proof, valid passport, criminal background check.',
 'Typically 2–4 months', 'EGP 500–2,000',
 'investor', '2–4 months', '1–3 years, renewable', CURRENT_DATE),

-- FINLAND (missing: Digital Nomad, Retirement, Investor)
('any', 'finland', 'Digital Nomad', 'Finland Startup / Freelancer Residence Permit',
 '⚠️ Finland does not have a dedicated digital nomad visa. The closest option for non-EU nationals is the self-employment residence permit for freelancers running a Finnish business, or the Start-up residence permit for innovative entrepreneurs endorsed by Business Finland.',
 'Start-up permit: Must have an innovative, scalable business idea with international market potential, endorsed by Business Finland. Self-employment: Must establish a viable freelance/self-employed business in Finland. Both require adequate financial means.',
 'Start-up: Business Finland endorsement, business plan, financial means. Self-employment: business plan, client contracts, financial means, health insurance, valid passport.',
 'Typically 3–4 months (Finnish Immigration Service)', 'EUR 530',
 'digital_nomad', '3–4 months', '2 years (Start-up); 1–2 years (self-employment), renewable', CURRENT_DATE),

('any', 'finland', 'Retirement', 'Residence Permit – Other Reasons (Financially Independent)',
 '⚠️ Finland does not have a dedicated retirement visa. Non-EU/EEA retirees with strong ties to Finland (Finnish spouse, Finnish heritage, long prior residence) may apply for a residence permit under "other reasons." The bar is high — Kela (Finnish Social Insurance) and tax residency implications apply.',
 'Must have substantial passive income sufficient to live in Finland without working or accessing Finnish social benefits. Strong connection to Finland typically required (family, prior residence, etc.). Must have comprehensive health insurance.',
 'Proof of substantial passive income, health insurance, proof of ties to Finland, valid passport, accommodation proof.',
 'Typically 3–5 months (Migri processing)', 'EUR 530',
 'retirement', '3–5 months', '2 years, renewable; permanent residence after 4 years', CURRENT_DATE),

('any', 'finland', 'Investor', 'Startup Residence Permit',
 'Finland''s Startup Residence Permit is for innovative entrepreneurs endorsed by Business Finland. The permit is valid for 2 years and allows founding and operating a startup. Finland ranks highly for quality of life and has a strong tech ecosystem (Helsinki).',
 'Must have an innovative, scalable business idea with international market potential. Must receive endorsement from Business Finland (government innovation agency). Must have sufficient financial means (approximately EUR 1,500/month or more). No minimum investment required.',
 'Business Finland endorsement letter (apply at businessfinland.fi), business plan, financial means proof, valid passport, health insurance.',
 'Typically 3–4 months', 'EUR 530',
 'investor', '3–4 months', '2 years, renewable (permanent residence after 4 years continuous residence)', CURRENT_DATE),

-- GREECE (missing: Digital Nomad, Retirement, Investor)
('any', 'greece', 'Digital Nomad', 'Greece Digital Nomad Visa',
 'Greece launched a dedicated Digital Nomad Visa in 2021. Allows non-EU remote workers to live in Greece while working for foreign companies. Greece offers a 50% income tax reduction for the first 7 years for qualifying new tax residents.',
 'Must work remotely for companies or clients outside Greece. Must earn at least EUR 3,500/month (updated 2023 threshold). Must have comprehensive health insurance. Eligible for up to 12 months; after first year, can apply for a 2-year Digital Nomad Residence Permit.',
 'Proof of remote employment or freelance contracts with non-Greek clients, last 3 months bank statements showing EUR 3,500+/month, comprehensive health insurance, valid passport, accommodation proof, criminal background check.',
 'Typically 2–4 weeks at Greek consulate', 'EUR 75 (visa fee)',
 'digital_nomad', '2–4 weeks', '1 year, then 2-year residence permit renewable', CURRENT_DATE),

('any', 'greece', 'Retirement', 'Long-Stay Visa – Financially Independent (Type D)',
 'Greece''s retirement visa (Type D – Financially Independent) allows non-EU retirees to live in Greece. Greece also has a preferential 7% flat income tax for new retiree tax residents who transfer their fiscal domicile to Greece.',
 'Must have sufficient passive income without working in Greece. Minimum: EUR 2,000/month (single) or EUR 2,000 + EUR 1,000/month per additional family member. Must have comprehensive health insurance.',
 'Proof of passive income (pension letters, bank statements, investment income), comprehensive health insurance, accommodation proof, criminal background check, valid passport.',
 'Typically 2–4 weeks at Greek consulate', 'EUR 75',
 'retirement', '2–4 weeks', '1 year, renewable; long-term residency after 5 years', CURRENT_DATE),

('any', 'greece', 'Investor', 'Golden Visa Greece (Real Estate / Investment)',
 'Greece''s Golden Visa is one of Europe''s most popular investor residency programs. Real estate investment route: EUR 250,000–800,000 depending on location (Attica region and Thessaloniki require EUR 800,000; other areas EUR 400,000; converted properties still EUR 250,000). Provides 5-year renewable residency.',
 'Qualifying investments: Real estate purchase of EUR 250,000–800,000 (amount varies by location and type); EUR 400,000 in Greek company capital; EUR 400,000 in Greek government bonds; EUR 400,000 term deposit in Greek bank; EUR 800,000 in Greek REITs. Must hold the investment throughout residency.',
 'Property purchase contract or investment documentation, proof of funds transfer, valid passport, clean criminal record, health insurance, no Greek tax debts.',
 'Typically 2–4 months', 'EUR 2,000 (application fee for 5-year permit)',
 'investor', '2–4 months', '5 years, renewable; permanent residence and citizenship eligible after 7 years', CURRENT_DATE),

-- MEXICO (missing: Digital Nomad, Retirement, Investor)
('any', 'mexico', 'Digital Nomad', 'Mexico Temporary Resident Visa (Remote Worker)',
 'Mexico is one of the world''s top digital nomad destinations — Mexico City, Oaxaca, Playa del Carmen, and Mérida are particularly popular. Mexico doesn''t have an explicit digital nomad visa, but the Temporary Resident Visa (1–4 years) is easily accessible and allows remote work for foreign employers.',
 'Temporary Resident Visa – Financial Solvency route: Must demonstrate monthly income of approximately USD 2,600/month (based on INE published rates, updated annually) OR savings/investments of USD 43,000+. No language requirement.',
 'Proof of income (last 12 months bank statements showing required amount OR investment portfolio statements), valid passport, passport photos, no criminal record.',
 'Typically 4–8 weeks (Mexican consulate)', 'MXN 400–800 (approximately USD 25–50)',
 'digital_nomad', '4–8 weeks', '1–4 years, renewable; permanent residence eligible after 4 years', CURRENT_DATE),

('any', 'mexico', 'Retirement', 'Mexico Temporary Resident Visa (Retirement – Retiree)',
 'Mexico''s retirement route uses the same Temporary Resident Visa financial solvency track. Pension income from abroad satisfies the income requirement. Mexico is consistently ranked a top retirement destination globally.',
 'Must demonstrate monthly passive income (pension, investments, savings) of approximately USD 2,600+/month OR have savings/investments of USD 43,000+. Amounts updated annually by INE. No minimum age requirement.',
 'Proof of pension or passive income (last 12 months statements), valid passport, passport photos.',
 'Typically 4–8 weeks', 'MXN 400–800',
 'retirement', '4–8 weeks', '1–4 years, renewable; permanent residence after 4 years', CURRENT_DATE),

('any', 'mexico', 'Investor', 'Temporary Resident Visa – Investor / Business',
 'Foreign investors establishing businesses in Mexico can obtain a Temporary Resident Visa (Rentista or business owner category). Mexico offers 100% foreign ownership in most sectors and has 13 Free Trade Agreements covering 50+ countries.',
 'Must be establishing or managing a business in Mexico, OR demonstrate the financial solvency threshold (USD 2,600+/month income or USD 43,000 in savings). Business owners may apply under the investor category with supporting business documentation.',
 'Business registration documents (RFC, IMSS), investment proof, valid passport, financial means documentation.',
 'Typically 4–8 weeks', 'MXN 400–800',
 'investor', '4–8 weeks', '1–4 years, renewable; permanent after 4 years', CURRENT_DATE)

ON CONFLICT DO NOTHING;
