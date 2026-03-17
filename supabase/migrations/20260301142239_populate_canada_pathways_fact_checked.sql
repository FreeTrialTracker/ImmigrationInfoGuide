/*
  # Populate Canada Immigration Pathways - Fact-Checked

  1. Summary
    - Adds comprehensive, fact-checked immigration pathways for Canada
    - Based on official canada.ca/IRCC sources (verified March 2026)
    - CRITICAL CORRECTIONS: Digital Nomad visa DOES NOT EXIST; Retirement visa DOES NOT EXIST
    - Work pathway correctly separates TFWP (LMIA required) from Express Entry (PR)
    - Student pathway includes mandatory PAL requirement and PGWP details
    - Investor pathway reflects Start-Up Visa closure (Jan 2026) and QIIP details

  2. Content Details
    - Work: TFWP with LMIA process + Express Entry (CRS, category-based draws, PNPs)
    - Study: Study Permit with PAL, CAD $22,895/year financial threshold, SDS discontinued
    - Digital Nomad: DOES NOT EXIST - clarifies visitor status under Tech Talent Strategy
    - Retirement: DOES NOT EXIST - clarifies Super Visa (parents/grandparents only)
    - Investor: Start-Up Visa (effectively closed Jan 2026), QIIP, PNP entrepreneur streams

  3. Important Notes
    - All data verified against official IRCC and canada.ca sources
    - March 25, 2025: Job offer points removed from CRS
    - November 8, 2024: SDS fast-track permanently discontinued
    - January 2026: Start-Up Visa closed to new applicants
    - Canada reducing immigration targets: 500k (2024) → 365k (2027)
*/

-- Delete any existing Canada pathways to avoid duplicates
DELETE FROM immigration_pathways WHERE destination_slug = 'canada';

-- ═══════════════════════════════════════════════════════════════════════════
-- WORK: Temporary Work Permit (TFWP) & Express Entry (PR)
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
  'canada',
  'Work',
  'Work',
  'Canada Work Authorization — Temporary Work Permit (TFWP) & Express Entry (PR)',
  'Canada has NO single work visa. System has two distinct tracks: (1) Temporary Foreign Worker Program (TFWP) issuing employer-specific Work Permits, which normally requires employer to first obtain LMIA (Labour Market Impact Assessment) from Service Canada; (2) International Mobility Program (IMP) covering LMIA-exempt categories. For permanent residence, primary route is Express Entry - points-based system issuing Invitations to Apply (ITAs) to highest-scoring candidates in regular draws. Does NOT grant visa but rather PR status. CRITICAL 2025 UPDATE: March 25, 2025 - IRCC permanently removed ALL job offer bonus points from CRS. Express Entry now pure human capital model. Category-based draws target specific occupations (Healthcare, STEM, Trades, Transport, French language, Physicians). Quebec operates own separate system.',
  'Temporary Work Permit: Valid job offer from Canadian employer; employer must obtain positive LMIA first (most categories); relevant qualifications for role; meet wage requirements (High-wage = above provincial median; Low-wage = at or below); clean criminal record; medical examination if required. Express Entry (PR): Federal Skilled Worker (FSW): 1+ year full-time skilled work experience (TEER 0/1/2/3) in past 10 years; Language CLB/NCLC 7; foreign degree needs Educational Credential Assessment (ECA); minimum 67 points on FSW selection grid. Canadian Experience Class (CEC): 1+ year skilled Canadian work experience in past 3 years; Language CLB 7 (TEER 0/1) or CLB 5 (TEER 2/3). Recent CRS cut-offs (2025-2026): Category draws 379-481+ (French); 467 (Healthcare Feb 2026); General draws 480-540+.',
  'LMIA from employer (most categories); job offer; relevant qualifications; Express Entry CRS score competitive for recent draws; NOC TEER 0/1/2/3 for skilled categories; language test CLB 7+ (FSW) or CLB 5+ (CEC); Educational Credential Assessment for foreign degrees',
  'TFWP: Valid job offer; employer positive LMIA; relevant qualifications; passport; language test results; Educational Credential Assessment (if foreign degree); police certificates; medical exam (if required); work permit application fee. Express Entry: Language test (IELTS, CELPIP, TEF, TCF); Educational Credential Assessment (WES or equivalent); work experience documentation; NOC code identification; proof of funds (FSW: CAD $14,690 single → CAD $38,830 family 7+); police certificates; medical exam; passport; digital photo; provincial nomination (if applicable - adds 600 CRS points). LMIA-exempt categories: CUSMA/USMCA (US/Mexican professionals), intra-company transfers, IEC Working Holiday (ages 18-35, eligible countries), PGWP (international graduates).',
  'LMIA (employer applies first): Global Talent Stream ~10 business days; High-wage 8-12 weeks; Low-wage 10-16 weeks. Work Permit (after positive LMIA): From outside Canada 5-21 weeks (varies by nationality); Within Canada (extensions) ~4-4.5 months. Express Entry ITA to PR: ~6 months (IRCC target after receiving ITA). Total LMIA + Work Permit: 3-7+ months depending on stream.',
  'LMIA employer fee: CAD $1,000 per position. Work permit application fee: CAD $155 + CAD $85 biometrics = CAD $240 total. Express Entry profile: Free to create. PR application after ITA: CAD $1,365 principal applicant + CAD $230 Right of Permanent Residence Fee = CAD $1,595 total (+ CAD $1,365 per accompanying adult; CAD $230 per child). Language tests: CAD $300-$400. Educational Credential Assessment: CAD $200-$300. Medical exam: CAD $200-$450.',
  'LMIA (employer applies first): Global Talent Stream approximately 10 business days; High-wage stream 8-12 weeks; Low-wage stream 10-16 weeks. Work Permit (after positive LMIA): From outside Canada 5-21 weeks varies by nationality; Within Canada extensions approximately 4-4.5 months. Express Entry ITA to PR: approximately 6 months IRCC target after receiving ITA. Total LMIA + Work Permit: 3-7+ months depending on stream. Original 1-6 months covers only work permit stage and omits mandatory LMIA pre-step.',
  'Work Permit: Employer-specific; duration matches contract (typically up to 2 years, renewable). Open Work Permits (IEC, PGWP): up to 3 years. Permanent Residence via Express Entry: Grants PR status directly (not temporary visa); PR card valid 5 years renewable; must be physically present 730 days per 5-year period. Canadian Citizenship: 3 years (1,095 days) physical presence as PR; language test (CLB 4) + citizenship knowledge test; dual citizenship permitted. Provincial Nominee Programs (PNPs): PNP nomination from Express Entry-aligned stream adds 600 points to CRS score, effectively guaranteeing ITA at next draw. Each province targets different occupations with different eligibility criteria.',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- STUDY: Study Permit
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
  'canada',
  'Study',
  'Study',
  'Canada Student Visa — Study Permit',
  'Canada requires Study Permit for studies exceeding 6 months. Formal document is Canadian Study Permit. Nationalities requiring visa also need Temporary Resident Visa (TRV) issued concurrently. CRITICAL 2024-2025 UPDATES: Student Direct Stream (SDS) fast-track PERMANENTLY DISCONTINUED November 8, 2024. All applicants now use regular stream with 8-12 weeks processing (no longer 20-day fast-track). NEW MANDATORY REQUIREMENT since early 2024: Provincial Attestation Letter (PAL) - letter from province/territory confirming application falls within Canada federal study permit allocation for that region. Without PAL, applications returned unprocessed. Financial requirement updated September 2025: CAD $22,895/year living expenses (single applicant outside Quebec) - near-doubling from previous CAD $10,000 figure. Canada imposed annual cap approximately 408,000 study permits for 2026. Dramatically tightened verification of Letters of Acceptance following widespread fraud.',
  'Enrolled or confirmed enrolment at Designated Learning Institution (DLI). Programme must exceed 6 months (shorter = visitor status, no permit required). Provincial Attestation Letter (PAL) - mandatory new step for most post-secondary applicants. Sufficient funds: CAD $22,895/year living expenses + full tuition + travel. Clean criminal record (police certificate from countries lived in 6+ months since age 18). Medical examination if required by country of residence. Genuine intent to leave Canada after studies. Language proficiency as required by institution.',
  'DLI acceptance letter; Provincial Attestation Letter (PAL) mandatory; CAD $22,895/year living expenses + tuition proof; clean criminal record; medical exam if required; genuine temporary intent',
  'Valid passport (covering full study period); Letter of Acceptance from DLI (official, specifying programme, dates, duration); Provincial Attestation Letter (PAL) - new mandatory document; proof of financial means (bank statements, GIC, scholarship letter - min CAD $22,895/year living + tuition); Statement of Purpose / Study plan; academic transcripts and diplomas; language test results (institution-specific requirements); passport photos; police clearance certificate (as required); medical exam (as required); application fee CAD $150 study permit + CAD $85 biometrics = CAD $235 total.',
  'SDS fast-track: PERMANENTLY DISCONTINUED November 8, 2024. Regular Study Permit (all applicants, 2025-2026): Standard 8-12 weeks; peak seasons additional delays expected; apply 3-4 months before programme start. Biometrics: Required for most applicants; schedule promptly after submission. TRV (for visa-required nationalities): Processed concurrently with study permit by IRCC.',
  'Study permit application fee: CAD $150. Biometrics fee: CAD $85. Total: CAD $235. Document costs: apostille/notarization/translation CAD $100-$300. Language tests: CAD $300-$400. Police certificates: CAD $50-$150 per country. Medical exam: CAD $200-$450. Financial proof required: CAD $22,895/year minimum living expenses (outside Quebec) + full tuition + travel costs. Quebec applicants: approximately CAD $24,617/year from January 2026.',
  'SDS fast-track that enabled 20-calendar-day processing PERMANENTLY DISCONTINUED November 8, 2024. All applicants now use regular stream. In 2025-2026, standard processing is 8-12 weeks. IRCC advises applying 3-4 months before programme start date. Peak seasons (July-September, December-January) add further delays. Biometrics required for most applicants - schedule promptly after submission. TRV for visa-required nationalities processed concurrently with study permit by IRCC.',
  'Study Permit: Duration of programme + 90-day grace period. Off-campus work: Up to 20 hours/week during term; full-time during scheduled breaks. On-campus work: Unlimited hours. Post-Graduation Work Permit (PGWP): Eligible after completing 8+ month programme at eligible DLI; duration equal to programme length, up to 3 years; Open Work Permit for any Canadian employer; Canadian work experience qualifies for CEC (Express Entry PR). Path to citizenship: PGWP → Canadian work experience → CEC Express Entry → PR → 3 years physical presence → citizenship. PR card valid 5 years renewable; must be physically present 730 days per 5-year period. Citizenship: 3 years (1,095 days) physical presence as PR; language test CLB 4 + citizenship knowledge test; dual citizenship permitted.',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada/study-permit.html',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- DIGITAL NOMAD: DOES NOT EXIST (Tech Talent Strategy visitor clarification)
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
  'canada',
  'Digital Nomad',
  'Digital Nomad',
  'Canada "Digital Nomad Visa" — Does Not Exist as Described',
  'CRITICAL CORRECTION: Canada has NO dedicated digital nomad visa, NO remote work visa, and NO special permit for foreign remote workers. Multiple authoritative sources confirm: As of 2025, Canada does not offer dedicated Digital Nomad Visa (Global Citizen Solutions 2025; Citizen Remote 2025; immigration.ca 2025). What EXISTS: June 2023 Tech Talent Strategy clarification that foreign nationals working remotely for NON-CANADIAN employers are NOT entering Canadian labour market and therefore need NO work permit - they can work remotely while in Canada as standard VISITORS. This is NOT new visa or new permit. It is clarification that existing visitor status rules already accommodate digital nomads working for foreign employers, with no new application required beyond standard visitor entry. Digital nomads enter Canada using: eTA (Electronic Travel Authorization) for visa-exempt nationalities (CAD $7, valid 5 years); TRV (Temporary Resident Visa) for visa-required nationalities (2-8 weeks processing); US citizens need NO visa or eTA. Maximum stay: 6 months per entry, extendable via Visitor Record.',
  'VISITOR STATUS entry only - no special visa exists. Work must be for NON-CANADIAN employer or clients only. May NOT work for Canadian employer on visitor status - accepting Canadian income on visitor status is immigration violation. If receive Canadian job offer while in Canada, must LEAVE Canada and apply for work permit from abroad (since August 28, 2024, in-Canada work permit applications for new employers no longer accepted). eTA required for visa-exempt nationalities flying to Canada (EU, UK, most Commonwealth) - CAD $7, valid 5 years, processed almost instantly. TRV required for visa-required nationalities - processing 2-8 weeks. US citizens: No visa or eTA needed, enter by passport, granted 6 months at border. No income minimum, no work contract required for visitor entry.',
  'Visitor status only - no special visa exists; work for NON-Canadian employers/clients only; may NOT work for Canadian employers; eTA (visa-exempt) or TRV (visa-required); maximum 6 months per entry',
  'Valid passport. For visa-exempt nationalities: eTA (Electronic Travel Authorization) CAD $7, apply online, valid 5 years, covers multiple entries. For visa-required nationalities: TRV (Temporary Resident Visa) application with supporting documents (financial proof, ties to home country, travel itinerary). US citizens: No visa or eTA needed. Recommended to bring: Employer letter confirming remote work for foreign company; bank statements showing financial means; evidence of ties to home country (property, family, job); return ticket. Border officers may scrutinize long-stay visitors who intend to work remotely.',
  'eTA (visa-exempt nationalities): Apply online, processed almost instantly, valid 5 years. TRV (visa-required nationalities): Processing 2-8 weeks. Entry: Maximum 6 months per entry at border officer discretion. Extensions: Visitor Record application before current status expires - processing approximately 4-5 months. Tax consideration: Staying in Canada more than 183 days in calendar year may trigger Canadian tax residency, subjecting worldwide income to Canadian income tax (federal + provincial). Many digital nomads time stays to stay under 183-day threshold.',
  'eTA (visa-exempt nationalities): CAD $7 (valid 5 years, multiple entries). TRV (visa-required nationalities): CAD $100 application fee + CAD $85 biometrics = CAD $185 total. Visitor Record extension (if staying beyond 6 months): CAD $100. No income minimum required for visitor entry. Tax implications if staying 183+ days: Canadian tax residency triggers worldwide income tax liability - consult tax specialist.',
  'eTA (visa-exempt nationalities): Apply online at canada.ca/eta, processed almost instantly in most cases, valid 5 years covering multiple entries. TRV (visa-required nationalities): Standard processing 2-8 weeks; biometrics required (CAD $85). Entry at border: Granted up to 6 months at border officer discretion. Extensions via Visitor Record: Apply before current status expires - processing approximately 4-5 months. US citizens: No eTA or TRV needed - enter with valid passport, granted 6 months at border.',
  'Visitor status: Maximum 6 months per entry (may be less at border officer discretion). Extendable via Visitor Record application (CAD $100, processing 4-5 months). NOT path to permanent residence on its own. Tax residency threshold: 183+ days in calendar year triggers Canadian tax resident status (worldwide income taxed federal + provincial rates). Legitimate alternatives for longer-term stays: IEC Working Holiday (ages 18-35, Open Work Permit 1-2 years, eligible countries include UK, Ireland, Australia, France, Germany, Japan, South Korea); PGWP (study in Canada → Post-Graduation Work Permit up to 3 years → Express Entry PR); CUSMA/USMCA (US and Mexican citizens in professional categories - LMIA-exempt work permit, can often be obtained at port of entry); Start-Up Visa (entrepreneurs building innovative businesses, but effectively closed as of January 2026).',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada/digital-nomads.html',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- RETIREMENT: DOES NOT EXIST (Super Visa for parents/grandparents only)
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
  'canada',
  'Retirement',
  'Retirement',
  'Canada "Retirement Visa" — Does Not Exist',
  'CRITICAL CORRECTION: Canada has NO retirement visa, NO passive income visa, NO person of independent means category, and NO immigration pathway based solely on financial independence or pension income. Authoritative sources unambiguous: Canada does not offer retirement visa. Unlike countries such as Panama or Portugal with dedicated retirement programs, Canada immigration system prioritizes economic contributors and family reunification (Greenback Tax Services 2025). Canada has never had retirement visa, passive income visa, or equivalent. Retirees from other countries cannot simply move to Canada based on their wealth, pension, or age. What EXISTS: Super Visa - multiple-entry visitor visa allowing stays of up to 5 years at a time, valid for 10 years. ELIGIBILITY RESTRICTED: only PARENTS AND GRANDPARENTS of Canadian citizens or permanent residents qualify. Canadian child/grandchild must meet Minimum Necessary Income (MNI) threshold (LICO + 30%, updated July 2025 - e.g., 3-person host family needs approximately CAD $70,000+ annual income). Applicants also need CAD $100,000 private health insurance. This is visitor visa - NOT path to PR on its own.',
  'Super Visa (closest equivalent - VERY RESTRICTED): ONLY parents and grandparents of Canadian citizens or permanent residents. Canadian host (child/grandchild) must meet Minimum Necessary Income (MNI) = LICO + 30% based on family size (updated July 2025). Example: 3-person host family needs approximately CAD $70,000+ annual income. Applicant must have private health insurance minimum CAD $100,000 coverage from Canadian insurer or OSFI-approved foreign insurer (approved foreign insurers accepted since January 2025, potentially reducing cost). Must be outside Canada when applying. Cannot include non-spousal dependents. Alternatives for retirees without close Canadian family ties: Standard Visitor Visa (TRV) / eTA - up to 6 months per entry, no income minimum, best for snowbirds splitting time between Canada and another country, NOT path to PR. Family Sponsorship (Parents and Grandparents Program / PGP) - if have adult Canadian citizen or PR child, they can sponsor for permanent residence, but PGP has extremely limited annual spots, often fills within minutes of opening, very competitive.',
  'Super Visa: ONLY parents/grandparents of Canadian citizens/PRs; Canadian host must meet MNI (LICO+30%); CAD $100,000 health insurance minimum; NOT path to PR on its own',
  'Super Visa: Valid passport; proof of relationship to Canadian citizen or PR host (birth certificates, family register); invitation letter from Canadian host; host proof of Canadian citizenship or PR status; host proof of income meeting MNI (LICO + 30% - e.g., CAD $70,000+ for 3-person family, varies by family size, updated July 2025); private health insurance minimum CAD $100,000 coverage, at least 1-year validity, from Canadian insurer or OSFI-approved foreign insurer; medical examination; passport photos; application fee; biometrics. Cost of health insurance: approximately CAD $1,700-$4,600/year depending on age and health. Standard Visitor options: eTA (visa-exempt, CAD $7) or TRV (visa-required, CAD $100 + CAD $85 biometrics) - up to 6 months per entry.',
  'Super Visa processing: approximately 8-26 weeks. Biometrics required. Must apply from outside Canada. Standard Visitor Visa (TRV): 2-8 weeks. eTA (visa-exempt nationalities): instant online. Healthcare critical consideration: Canada universal healthcare (provincial health insurance) covers Canadian citizens and permanent residents ONLY. Visitors, including Super Visa holders, NOT COVERED by provincial health plans. Private insurance mandatory for Super Visa applicants. Even PRs face 3-month provincial waiting period before coverage begins.',
  'Super Visa application fee: CAD $100. Biometrics: CAD $85. Total: CAD $185. Private health insurance (mandatory): CAD $1,700-$4,600/year depending on age and health (minimum CAD $100,000 coverage, 1-year validity). Medical exam: CAD $200-$450. Document costs: translations, notarization CAD $100-$300. Standard Visitor Visa (TRV): CAD $100 + CAD $85 biometrics = CAD $185. eTA (visa-exempt): CAD $7.',
  'Super Visa: approximately 8-26 weeks processing. Biometrics required for most applicants. Must apply from outside Canada. Standard Visitor Visa (TRV): 2-8 weeks processing. eTA (visa-exempt nationalities): processed almost instantly online, valid 5 years. Healthcare reality critical to understand: Canada universal healthcare (provincial health insurance) covers Canadian citizens and permanent residents ONLY. Visitors including Super Visa holders NOT COVERED by provincial health plans. Private insurance mandatory for Super Visa minimum CAD $100,000 coverage. Even PRs face 3-month provincial waiting period before coverage begins - major practical and financial consideration for retirees.',
  'Super Visa: Multiple-entry, valid 10 years, stays up to 5 years per entry (increased from 2 years in 2022). Visitor visa - NOT path to permanent residence on its own. Family Sponsorship alternative: If have adult Canadian citizen or PR child, Parents and Grandparents Program (PGP) allows sponsorship for PR, but extremely limited annual spots (often fills within minutes of opening), very competitive, waitlist can be years. Standard Visitor status (TRV/eTA): Maximum 6 months per entry, extendable via Visitor Record, NOT path to PR. Healthcare: Provincial health insurance covers Canadian citizens and PRs only - visitors NOT covered, private insurance required. Even PRs face 3-month waiting period before provincial coverage begins. Cost of private health insurance for seniors: CAD $1,700-$4,600+/year depending on age, health conditions.',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada/parent-grandparent-super-visa.html',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- INVESTOR: Start-Up Visa (closed) & Provincial Entrepreneur Streams
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
  'canada',
  'Investor',
  'Investor',
  'Canada Investor / Business Immigration — Start-Up Visa & Provincial Entrepreneur Streams',
  'Canada federal investor landscape changed dramatically: federal Immigrant Investor Program (IIP) permanently closed 2014. NO passive capital-transfer programme at federal level. Primary federal business immigration route is Start-Up Visa Program (SUV), requiring entrepreneurs to secure endorsement from designated Canadian organization (venture capital fund, angel investor group, or business incubator). SUV is direct permanent residence pathway. CRITICAL 2025-2026 DEVELOPMENT: As of January 2026, IRCC no longer accepts new SUV work permit applications. Only applicants who received commitment certificate before January 1, 2026 may still apply for PR, with hard deadline June 30, 2026. Published PR processing time: 51 months (over 4 years). IRCC had 40,000+ applicants, was approving only approximately 1,000 per year. Redesigned, more selective entrepreneur programme expected to launch in 2026 with stricter eligibility and lower intake caps. Provincial Nominee Program (PNP) entrepreneur streams vary by province. Quebec Immigrant Investor Program (QIIP) is partial provincial equivalent to passive investor visa: minimum net worth CAD $2,000,000; passive government-backed loan CAD $1,200,000 (5-year term, non-interest-bearing, refunded at maturity).',
  'Start-Up Visa (Federal - EFFECTIVELY CLOSED): Innovative business idea with commercialization potential; Letter of Support + Commitment Certificate from designated VC fund (CAD $200K+), angel group (CAD $75K+), or business incubator (no $ minimum); hold ≥10% voting rights individually; applicants + organization hold >50% collectively; actively manage and operate business in Canada; Language CLB 5 in English or French (IELTS, CELPIP, TEF); settlement funds CAD $15,263 (single) → CAD $40,392 (family 7+); clean criminal record, medical exam, no inadmissibility; up to 5 business partners can apply under one application. STATUS AS OF JAN 2026: New applications NOT accepted; redesigned programme anticipated 2026. QIIP (Quebec, Provincial): Net worth ≥ CAD $2,000,000 (legally obtained, documented); CAD $1,200,000 passive government-backed 5-year loan (non-interest; refunded at maturity); ≥2 years senior business management experience in last 5 years; genuine intent to settle in Quebec; French language proficiency (B2 strongly expected); CSQ (Certificat de sélection du Québec) required first. QIIP intake periods limited - verify current intake status at MIFI before applying.',
  'Start-Up Visa: Letter of Support from designated organization (VC CAD $200K+, angel CAD $75K+, incubator no $); CLB 5 language; settlement funds; CLOSED to new applicants Jan 2026. QIIP: CAD $2M net worth; CAD $1.2M loan; 2+ years management experience',
  'Start-Up Visa: Innovative business plan; Letter of Support + Commitment Certificate from designated Canadian organization (Designated VC Fund must commit minimum CAD $200,000; Designated Angel Investor Group must commit minimum CAD $75,000; Designated Business Incubator acceptance, no investment minimum); hold ≥10% voting rights; language test results (CLB 5 - IELTS, CELPIP, TEF, TCF); settlement funds proof (CAD $15,263 single → CAD $40,392 family 7+); business incorporation documents; work experience documentation; passport; photos; police certificates; medical exam; application fees. As of April 1, 2024, each designated organization can support maximum 10 group applications per year. Approximately 84 designated organizations total. Up to 5 business partners can apply under one SUV application. QIIP: Net worth documentation (CAD $2,000,000 legally obtained); loan agreement (CAD $1,200,000, 5 years, government-backed, non-interest, refunded at maturity); business management experience proof (≥2 years in last 5 years); intent to settle in Quebec statement; French language test results (B2 strongly expected); Quebec CSQ application; passport; police certificates; medical exam.',
  'Start-Up Visa (federal - effectively closed): Pitch to designated organization + commitment 6-12 months; temporary work permit (to enter Canada while waiting) approximately 3-6 months; PR application officially 51 months but stalled for most applicants. QIIP (Quebec): CSQ assessment varies, limited intake windows; After CSQ: IRCC PR processing approximately 24 months. PNP Entrepreneur streams: Expression of Interest + provincial nomination 6-18 months; After PNP nomination: Express Entry ITA + approximately 6 months IRCC processing.',
  'Start-Up Visa: Settlement funds required CAD $15,263 (single) to CAD $40,392 (family 7+). Work permit application: CAD $155 + CAD $85 biometrics = CAD $240. PR application: CAD $1,365 principal + CAD $230 RPRF = CAD $1,595 (+ CAD $1,365 per adult; CAD $230 per child). Language test: CAD $300-$400. Legal/business planning: CAD $10,000-$30,000+. QIIP: Net worth CAD $2,000,000 required; loan CAD $1,200,000 (5 years, refunded); application fees; legal/advisory CAD $15,000-$40,000+. PNP Entrepreneur: Investment CAD $150,000-$250,000+ depending on province; refundable deposit (some provinces) CAD $75,000-$100,000; net worth requirements CAD $600,000-$800,000+.',
  'Start-Up Visa federal: Pitch to designated organization + commitment 6-12 months; temporary work permit to enter Canada while waiting approximately 3-6 months; PR application officially 51 months over 4 years but stalled for most applicants. QIIP Quebec: CSQ assessment varies, limited intake windows open periodically; After CSQ IRCC PR processing approximately 24 months. PNP Entrepreneur streams: Expression of Interest + provincial nomination 6-18 months; After PNP nomination Express Entry ITA + approximately 6 months IRCC processing.',
  'Start-Up Visa: Grants IMMEDIATE PERMANENT RESIDENCY upon final approval (not temporary visa). QIIP: CSQ → IRCC PR → permanent residency. PNP entrepreneur: Provincial nomination → Express Entry ITA → PR. Canadian Citizenship: 3 years (1,095 days) physical presence as PR; language test CLB 4 + citizenship knowledge test; dual citizenship permitted. Family: Spouse and dependent children under 22 included in PR application. NOTE: Canada has NO passive real estate investor pathway at federal level (unlike Portugal, Greece, Brazil). All business investment routes require active entrepreneurial involvement. Provincial Entrepreneur Investment Thresholds: Manitoba CAD $250,000 (Winnipeg Capital Region) or CAD $150,000 (elsewhere); New Brunswick CAD $250,000 investment + CAD $600,000 net worth + CAD $100,000 refundable deposit; Nova Scotia CAD $150,000 investment + CAD $600,000 net worth. NOTE: Saskatchewan and Ontario PERMANENTLY CLOSED entrepreneur streams in 2024-2025 due to reduced federal allocations. Canada reducing overall PR targets from 500,000 (2024) to 365,000 by 2027, intensifying competition.',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/start-visa.html',
  '2026-03-01'
);
