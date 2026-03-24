/*
  # Populate Belgium Immigration Pathways - Fact-Checked

  1. Summary
    - Adds comprehensive, fact-checked immigration pathways for Belgium
    - Based on official dofi.ibz.be sources (verified Feb 2026)
    - Corrects inaccuracies in previous generic data
    - Includes Single Permit system with regional complexity
    - Clarifies that Belgium has NO digital nomad visa

  2. Content Details
    - Work Visa: Single Permit system with regional differences (Flanders, Wallonia, Brussels)
    - Student Visa: Type D long-stay visa with specific financial thresholds
    - Digital Nomad: DOES NOT EXIST - working remotely on tourist visa is illegal
    - Retirement: No formal programme - discretionary Type D visa requiring Belgian link
    - Investor: Professional Card (no passive golden visa, must run active business)

  3. Important Notes
    - All data verified against official Belgian government sources
    - Includes regional salary thresholds, processing times, validity periods
    - Highlights employer-driven process and federal complexity
    - Provides accurate official URLs and last updated dates
*/

-- Delete any existing Belgium pathways to avoid duplicates
DELETE FROM immigration_pathways WHERE destination_slug = 'belgium';

-- ═══════════════════════════════════════════════════════════════════════════
-- WORK VISA: Single Permit System
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  key_requirements,
  requirements,
  typical_timeline,
  estimated_fees,
  processing_time,
  validity_period,
  official_url,
  last_updated
) VALUES (
  'any',
  'belgium',
  'Work',
  'Work',
  'Belgium Work Visa & Employment Residency (Single Permit)',
  'Belgium operates one of Europe''s most regionally complex work permit systems. The Single Permit (combined work + residence permit) is the key instrument for non-EU nationals working 90+ days. CRITICALLY: The employer (not employee) applies to the regional authority where their office is located - Flanders (VDAB), Wallonia (FOREM/SPW), or Brussels-Capital. Salary thresholds are regionalised and updated every January. Brussels highly skilled: €3,703.44/month; EU Blue Card: €4,748/month; Executives: €6,647.20/month (2026). Wallonia highly skilled: €53,220/year. Processing typically 3-5 months from employer submission to work start.',
  'Highly Qualified Workers: University degree + salary meeting regional threshold + 1-year+ contract. Shortage Occupation Workers: Role on annual shortage list (IT, healthcare, engineering, construction) - faster approval, no labour market test. Executives/Managers: Managerial role with higher salary threshold (Brussels: €6,647.20/month 2026). Intra-Company Transferees (ICT): Transfer within multinational group to Belgian entity - no labour market test. EU Blue Card: Higher education degree + salary ≥ Blue Card threshold + 1-year contract.',
  'Employer applies (not employee); university degree; salary meeting regional threshold (varies significantly by region); 1-year+ employment contract; health insurance; accommodation proof; no labour market test for highly skilled/shortage occupations',
  'Valid passport; binding employment contract from Belgian employer (minimum 1 year for highly qualified); salary meeting regional threshold; educational qualifications proof (degree certificates, officially translated); employer corporate documents: registration, financial standing, social security compliance; labour market test evidence (if applicable): proof no EU candidate available; health insurance (from arrival until enrolled in Belgian public system); application fee ~€200–€500 (varies by region and category); register at commune within 8 working days of entering Belgium (mandatory); medical certificate (required by some embassies); criminal background check',
  'Total from employer submission to work start: typically 3–5 months. Regional work authorisation: Flanders ~3 months; Brussels 4–6 weeks; Wallonia varies. Federal Immigration Office: 8–10 weeks additional. Type D Visa: 2–4 weeks. Renewals: 4–8 weeks.',
  'Application fee: ~€200–€500 (varies by region and category). Document translations and legalisation: €200–€500. Health insurance: variable. Employer faces fines up to €48,000 per infringement for salary non-compliance.',
  'Regional authority has up to 4 months from admissibility to issue decision (90 days for EU Blue Card). In practice: 8–16 weeks (Flanders 3 months for highly skilled; Brussels 4–6 weeks regional + 8–10 weeks federal). Total: 3–5 months. Renewals: 4–8 weeks (Flanders ~1 month since 2023). Flanders launched fully digital Single Permit portal in 2025, expected to reduce times further.',
  'Single Permit (initial): Typically 1 year, renewable. Highly skilled (renewal): Up to 3 years. EU Blue Card: Up to 4 years. Brussels after 30 months: Unlimited-duration work authorisation. Permanent Residency (Type B card): After 5 consecutive years. Belgian citizenship: After 5 years + integration (language in Dutch/French/German, social participation, economic integration).',
  'https://dofi.ibz.be/en/themas/onderdanen-van-derde-landen/werk/single-permit',
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- STUDENT VISA
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  key_requirements,
  requirements,
  typical_timeline,
  estimated_fees,
  processing_time,
  validity_period,
  official_url,
  last_updated
) VALUES (
  'any',
  'belgium',
  'Study',
  'Study',
  'Belgium Student Visa (Type D Long-Stay)',
  'Belgium student immigration uses a Type D (long-stay) national visa for stays over 90 days, applied for at Belgian embassy/consulate before travelling. Upon arrival, students must register at local commune within 8 days to receive residence card. Financial threshold mandatory: €835/month (Flanders 2025-2026); federal minimum ~€803/month. Proof via blocked bank account (most recommended), Annex 32 guarantee from Belgian/EU resident sponsor, or scholarship. Non-EU students can work up to 20 hours/week during term (600-hour annual cap). After graduation: 9-12 month job search permit available. Belgium has three language communities (Dutch/Flemish, French, German) each with separate admission requirements.',
  'Accepted by recognised Belgian university, university college, art school, or accredited higher education institution. Study must be main activity. EU/EEA/Swiss citizens: No visa needed - register at commune within 8 days. Non-EU/EEA students: Type D long-stay visa required if staying 90+ days. Language proficiency in language of instruction: Dutch (CNaVT), French (DELF/DALF), or English (IELTS/TOEFL). For Flemish universities: minimum IELTS 6.0-6.5 or TOEFL iBT 79-90 for English-medium programmes. Academic credentials may require equivalence assessment (NARIC for Flanders). Must be over 18 for most programmes.',
  'University admission letter with Standard Form; proof of €803-€835/month minimum (blocked account, Annex 32 guarantee, or scholarship); health insurance; accommodation proof; language test results; register at commune within 8 days of arrival',
  'Valid passport (10 years or less old; 12+ months validity remaining); admission letter from Belgian institution (with Standaardformulier/Standard Form); proof of financial means: €803–€835/month minimum (blocked account, Annex 32 guarantee, or scholarship); proof of tuition fee payment; health insurance valid in Belgium; medical certificate (embassy-approved doctor); criminal background check (if over 18/21); passport photos (Schengen format); birth certificate (translated and apostilled); application fee ~€200–€251 for Type D visa; APS certificate (Chinese students applying to Flemish institutions only)',
  'Visa decision: minimum 15 days; often 6–12 weeks; can be 3+ months at busy embassies. Embassy appointment wait: several weeks. After arrival: register at commune within 8 working days. Residence card: issued after residence check (45 days extendable). Total recommended lead time: 6–9 months before course begins.',
  'Type D visa application fee: ~€200–€251. Language test: €150–€250. Document translations: €100–€300. Health insurance: variable. Financial proof required: €803–€835/month (€9,636–€10,020/year).',
  'Visa decision after complete submission: Minimum 15 days; often 6–12 weeks; can be 3+ months at busy embassies. Embassy appointment wait: several weeks at popular posts. After arrival: register at commune within 8 working days. Commune issues temporary Annex certificate while residence card processed (45 days, extendable). Residence card: issued after residence check by immigration police.',
  'Type D student visa: issued for duration of studies + grace period. Residence card: renewed annually at commune - must show continued enrolment and academic progress. No specific academic credit requirement but full-time enrolment required. Post-study: 9-12 month job search (orientation year) permit. After 5 years total continuous legal residence: eligible for permanent residency (Type B card).',
  'https://dofi.ibz.be/en/themas/onderdanen-van-derde-landen/studie',
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- DIGITAL NOMAD: DOES NOT EXIST
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  key_requirements,
  requirements,
  typical_timeline,
  estimated_fees,
  processing_time,
  validity_period,
  official_url,
  last_updated
) VALUES (
  'any',
  'belgium',
  'Digital Nomad',
  'Digital Nomad',
  'Digital Nomad / Remote Work Visa [DOES NOT EXIST]',
  '⚠️ CRITICAL: Belgium does NOT have a Digital Nomad Visa. This visa does not exist and has never been introduced in Belgian law. More critically, Belgium is explicitly identified by Fragomen (major immigration law firm) as a country whose immigration law PROHIBITS foreign nationals from working remotely from Belgian territory even from private accommodation while on visitor or tourist status. This is not a grey area - it is a clear legal prohibition confirmed by Belgian immigration authorities. EU/EEA/Swiss citizens have freedom of movement (must register if staying 3+ months). Non-EU nationals who want to be self-employed must obtain Professional Card from regional authority - NOT a remote work visa, requires business plan, economic benefit proof, professional experience.',
  'This visa category does not exist in Belgian immigration law. Working remotely on tourist/Schengen visa is explicitly illegal in Belgium. EU/EEA/Swiss citizens can work remotely under freedom of movement (register if 3+ months; 183+ days triggers tax residency). Non-EU nationals must establish active business via Professional Card (Beroepskaart) requiring business plan demonstrating economic benefit to Belgium, professional experience, regional authority approval. This is NOT a remote work visa.',
  'N/A - This visa does not exist. No remote work visa available for non-EU nationals.',
  'Non-EU nationals cannot obtain a visa for remote work in Belgium. Working on tourist visa is illegal. The only legal pathway is Professional Card (Beroepskaart/Carte Professionnelle) requiring: business plan demonstrating economic benefit to Belgium; genuine self-employment or business ownership; professional experience; regional authority approval; NOT simply "remote work for foreign clients". Processing: 8-16 weeks (regional) + 2-4 weeks (Type D visa). Validity: 2 years initially, renewable to 5 years.',
  'N/A - This visa does not exist.',
  'N/A - This visa does not exist. For Professional Card: application fee ~€140-€500 depending on region and duration.',
  'N/A - This visa category does not exist in Belgian immigration law.',
  'N/A - This visa does not exist. Monitor dofi.ibz.be for any future announcements of a dedicated remote worker pathway.',
  'https://dofi.ibz.be/en',
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- RETIREMENT / FINANCIALLY INDEPENDENT
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  key_requirements,
  requirements,
  typical_timeline,
  estimated_fees,
  processing_time,
  validity_period,
  official_url,
  last_updated
) VALUES (
  'any',
  'belgium',
  'Retirement',
  'Retirement',
  'Belgium Retirement & Financially Independent Residency (Type D Discretionary)',
  'Belgium does NOT have a formal "retirement visa" programme with codified eligibility criteria. Retirees apply for Type D long-stay visa in category "retirement and financially independent persons." CRITICALLY: This visa is DISCRETIONARY - Immigration Office reviews individually under Secretary of State discretionary powers. No published minimum income, no minimum age, no guaranteed approval. In practice, officials look for: (1) genuine pre-existing link to Belgium (prior residence, Belgian family, strong professional ties) - effectively a prerequisite; (2) sufficient passive income (~€1,900-€2,200/month practical guide). Without Belgian link, approval very unlikely. No work permitted including remote work.',
  'Third-country national (non-EU/EEA/Swiss). Pre-existing link to Belgium (prior residence, Belgian family members, strong professional history) - most critical factor in practice. Passive income: regular income from pension (Belgian or foreign), investments, dividends, or rental income sufficient to live without public benefits. No employment permitted - this visa does not permit work of any kind including remote work. Health insurance: comprehensive private insurance covering all risks. Adequate accommodation in Belgium. Clean criminal record. No minimum age (contrary to original claim of "often 50 or older").',
  'Pre-existing Belgian link (prior residence, family, professional ties); passive income ~€1,900-€2,200/month; health insurance; accommodation in Belgium; NO work permitted of any kind; clean criminal record; discretionary approval',
  'Valid passport; Type D visa application (submitted at Belgian embassy/consulate in home country); proof of passive income (pension statements, investment income, bank statements - last 3-6 months); proof of Belgian link (prior Belgian residence records, family relationship documents, proof of prior employment); comprehensive private health insurance certificate; lease contract or proof of accommodation in Belgium; criminal background check (home country + any country of 12+ months residence); birth certificate (translated); passport photos; application fee ~€200 for Type D visa + ~€50-€200 commune residence registration fees; register at commune within 8 days of arrival',
  'Embassy submission to visa decision: approximately 3-6 months (retirement/independent person category requires Immigration Office review). After arrival: register at commune within 8 days; immigration police residence check (4-8 weeks); residence card issued (valid 1 year). Total: 6-9 months.',
  'Type D visa application fee: ~€200. Commune registration: ~€50-€200. Document translations: €100-€300. Private health insurance: €200-€500/month. Practical income requirement: ~€1,900-€2,200/month passive income.',
  'Embassy submission to visa decision: approximately 3-6 months (retirement/independent person category requires Immigration Office review, adding time vs. standard tourist visa). After arrival in Belgium: register at commune within 8 days; immigration police conduct residence check (4-8 weeks); residence card issued (valid 1 year). Total from application to receiving residence card: plan for 6-9 months.',
  'Initial residence card: 1 year (not "1-2 years" as stated in original). Annual renewal: must demonstrate continued financial self-sufficiency and Belgium ties at each renewal. Work rights: None - residency only. Travel: Full Schengen Area access. After 5 years continuous legal residence: eligible for Type B card (permanent residency). Belgian citizenship: After 5 years of main residence + integration (language proficiency in Dutch/French/German; social participation; economic integration). Healthcare: enrol in Belgian mutuelle within 3 months of receiving permit.',
  'https://dofi.ibz.be/en/themas/onderdanen-van-derde-landen/verblijf',
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- INVESTOR / BUSINESS
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  key_requirements,
  requirements,
  typical_timeline,
  estimated_fees,
  processing_time,
  validity_period,
  official_url,
  last_updated
) VALUES (
  'any',
  'belgium',
  'Investor',
  'Investor',
  'Belgium Investor / Business Residency (Professional Card)',
  'Belgium does NOT have a passive golden visa programme with minimum investment thresholds or real estate options. Non-EU investors gain residency through Professional Card (Beroepskaart/Carte Professionnelle) - self-employed work authorisation requiring establishing and actively running a business that demonstrably benefits Belgian economy. No investment in bonds, funds, or property alone qualifies. Applications assessed case-by-case by relevant regional authority. Typical committed capital over 5 years: €200,000-€500,000 (NOT legal minimum - practical benchmark from immigration practitioners). Must actively run Belgian business creating economic value - jobs, innovation, exports, or regional significance.',
  'Regional authority assesses each business proposal on: Economic utility (jobs created/secured for Belgian residents; investment capital transferred; innovation or know-how transfer; export potential or regional significance). Business viability (realistic detailed business plan with market research; evidence of client pipeline; sector-specific experience and credentials). Applicant profile (clean criminal record; relevant professional background and management experience; sufficient personal funds to sustain business through initial losses). Business structure: Most common is BV/SRL company (Belgian limited liability company, no fixed minimum capital since 2019 reform - but adequate equity must be demonstrated).',
  'Actively run Belgian business (not passive investment); detailed business plan demonstrating economic benefit; typical investment €200k-€500k over 5 years (practical benchmark, not legal minimum); relevant professional experience; regional authority approval; clean criminal record',
  'Valid passport; Professional Card application submitted to competent region (Flanders: Departement Werk & Sociale Economie; Brussels: Brussel Economie & Werkgelegenheid; Wallonia: SPW); detailed business plan (in Dutch, French, or German - language of region); proof of investment capital/liquid funds (bank statements, investment evidence); business registration documents (or draft articles of association); professional qualifications, CV, reference letters; criminal background check (home country; any country of 12+ months residence); health insurance covering all risks in Belgium; proof of accommodation (lease or property); once Professional Card approved: Type D visa application at Belgian embassy/consulate; register at commune within 8 days of arrival; admin fees ~€140-€500 (regional Professional Card) + visa fees',
  'Regional Professional Card decision: 8-16 weeks from submission. Federal Type D visa (once Professional Card approved): 15-30 days. Commune registration + residence card: 4-8 weeks after arrival. Total from Professional Card application to Belgian residence card: approximately 4-6 months.',
  'Regional Professional Card fee: ~€140-€500 (varies by region and duration). Type D visa: ~€200. Typical investment: €200,000-€300,000 for business setup and operations; total committed capital over 5 years: €350,000-€500,000 (practical benchmarks from practitioners, not legal minimums). Business plan preparation (professional advisors): €5,000-€15,000. Legal fees: €3,000-€10,000.',
  'Regional Professional Card decision: 8-16 weeks from submission. Federal Type D visa (once Professional Card approved): 15-30 days at Belgian embassy. Commune registration + residence card: ~4-8 weeks after arrival. Total from Professional Card application to Belgian residence card: approximately 4-6 months. Business plan quality dramatically affects speed - weak/incomplete plan can trigger requests for additional information, adding months.',
  'Professional Card (initial): 1-3 years (2 years typical). Renewal: Up to 5 years once business established and operating. Family inclusion: Spouse and dependent children (under 21) can apply for family reunification. After 3 years of continuous legal residence: some sources indicate eligibility for permanent residency if business profitable and meeting requirements. After 5 years of continuous legal residence: eligible for Type B card (full permanent residency). Belgian citizenship: After 5 years of main residence + language fluency (Dutch/French/German) + integration requirements (social participation, economic integration, no outstanding tax debts).',
  'https://dofi.ibz.be/en/themas/onderdanen-van-derde-landen/werk/zelfstandige',
  '2026-02-28'
);
