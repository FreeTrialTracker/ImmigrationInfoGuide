/*
  # Populate Denmark Immigration Pathways - Complete with All Required Fields

  1. Summary
    - Add comprehensive fact-checked immigration pathways for Denmark
    - 5 pathways: Work, Study, Digital Nomad (corrected), Retirement (corrected), Investor
    - All content fact-checked against nyidanmark.dk, SIRI, Danish Business Authority
    - passport_slug set to 'any' for all pathways (non-EU/EEA/Swiss)
*/

-- Delete any existing Denmark pathways
DELETE FROM immigration_pathways WHERE destination_slug = 'denmark';

-- ═══════════════════════════════════════════════════════════════════════════
-- WORK PERMIT
-- ═══════════════════════════════════════════════════════════════════════════

INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements
) VALUES (
  'any',
  'denmark',
  'Work',
  'Denmark Work Permit — Pay Limit, Positive List & Fast-Track',
  'Work',
  'Denmark work permits are scheme-based with three tracks: Pay Limit Scheme (DKK 514,000/year salary threshold for 2025), Positive List (shortage occupations, no minimum salary), and Fast-Track Scheme (10-day processing, same-day preliminary permits for certified employers with 10+ Danish employees). All processed by SIRI via nyidanmark.dk. Permits for permanent contracts valid up to 4 years. June 2025 reform proposal would lower Pay Limit to DKK 300,000 for 16 nationalities.',
  'Non-EU/EEA/Swiss third-country nationals. Pay Limit: job offer ≥ DKK 514,000/year (2025), ≥30 hrs/week, salary to Danish bank account. Supplementary Pay Limit: DKK 415,000/year, ≥37 hrs/week, advertised 2+ weeks on Jobnet/EURES, unemployment ≤3.75%. Positive List: occupation on current shortage list, no minimum salary but must meet Danish market norms. Fast-Track: employer SIRI-certified with ≥10 Danish employees, 10-day processing, same-day preliminary work permit.',
  'Valid passport, employment contract/offer with salary and hours, Case Order ID from nyidanmark.dk, educational qualifications if required, biometrics within 14 days at Danish embassy or SIRI office. For Fast-Track: employer submits application with power of attorney.',
  'Fast-Track: ~10 days (preliminary same-day at biometrics). Pay Limit/Positive List: 1-3 months. Apply before intended start date.',
  'Standard work permit: DKK 6,055 (~€810). Fast-Track: included. Working Holiday: DKK 2,255 (~€300). Start-up Denmark: DKK 2,255 (~€300).',
  'APPLICATION PROCESS: Two-stage online via nyidanmark.dk. Create Case Order ID, complete ST1 form, pay fee. Book biometrics within 14 days at Danish embassy/consulate or SIRI office. Fast-Track: employer submits with power of attorney. SALARY THRESHOLDS 2025: Pay Limit: DKK 514,000/year. Supplementary: DKK 415,000/year. Positive List: no minimum, must meet market norms. June 2025 reform (pending): both reduced to DKK 300,000 for 16 nationalities. PROCESSING: Fast-Track ~10 days, preliminary same day. Standard: 1-3 months. VALIDITY: Permanent contracts: up to 4 years. Fixed-term: contract duration + 6 months. Extensions: apply before expiry, can work while processing. CHANGING EMPLOYERS: new application required, can start before permit issued. 6-month job search after employment ends. FAMILY: spouse/partner and children <18 eligible, spouse receives work rights. PERMANENT RESIDENCE: 8 years (4 if all supplementary requirements met: Danish language Prøve i Dansk 2+, active citizenship, no public benefits 5 years, employment/education requirements). CITIZENSHIP: ~9 years, Danish language Prøve i Dansk 3, civic test, clean record, self-sufficient. No dual citizenship for naturalized citizens. FEES 2025: Standard DKK 6,055, decreased from DKK 6,290 in 2024.'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- STUDY PERMIT
-- ═══════════════════════════════════════════════════════════════════════════

INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements
) VALUES (
  'any',
  'denmark',
  'Study',
  'Denmark Student Residence Permit — Higher Education',
  'Study',
  'Non-EU/EEA/Swiss students require residence permit (not visa) for programmes exceeding 90 days at Danish state-approved institutions. SIRI target: 30 days processing; realistic: 60 days. Financial means: DKK 7,086/month (2025, ~€950/month), waived if tuition covers room and board. State-approved programmes: 20 hrs/week work Sept-May, 37 hrs/week June-Aug, 6-month post-study job-seeking permit. May 2, 2025 rule change: non-state-approved programmes cannot bring family, cannot work, no post-study permit.',
  'Non-EU/EEA/Swiss nationals. Nordic citizens (Sweden, Norway, Finland, Iceland) do not need permits. Acceptance at state-approved Danish higher education institution accredited by Ministry of Higher Education and Science, or preparatory course (max 1 year) linked to state-approved programme. Financial self-sufficiency: DKK 7,086/month (2025), waived if tuition covers room and board. Valid passport. Health insurance until CPR number obtained.',
  'ST1 form via nyidanmark.dk, valid passport, acceptance letter, proof of financial means (bank statement DKK 7,086/month, scholarship letter, or sponsor letter with statements), tuition payment proof if applicable, health insurance, accommodation proof, biometrics at Danish embassy/VFS within 14 days. Non-English/Danish documents must be certified-translated.',
  'SIRI target: 30 days. Realistic: 60 days (2 months). Some nationalities (Nigeria, Pakistan, Kenya, Ghana): up to 6 months. Apply at least 3 months before programme start. Book VFS appointment before online submission (appointments take up to 14 days).',
  'Application: DKK 1,900 (~€255) + Danish Consulate fee (varies) + VFS Global service fee (~$30 USD).',
  'APPLICATION: ST1 form online via nyidanmark.dk, create Case Order ID, pay fees, book VFS biometrics within 14 days. Book VFS appointment before online submission to avoid missing deadline. FINANCIAL MEANS: DKK 7,086/month (2025 official SIRI level, ~€950/month or ~€11,400/year). Waived if tuition covers room and board. If tuition covers tuition only (not room/board): DKK 7,086/month still required. Master students on employment contracts: use contract as proof. MAY 2, 2025 RULE CHANGE: students in non-state-approved programmes applying on/after May 2, 2025: cannot bring family, no work permit (cannot work at all), no 6-month post-study job-seeking permit. State-approved only: eligible for family, work rights, post-study permits. WORK RIGHTS (STATE-APPROVED): 20 hrs/week Sept-May, 37 hrs/week (full-time) June-Aug. Automatic with permit, no separate application. Exceeding limits: illegal, can result in warning, fine, permit revocation. PhD students employed by university/company: different rules. POST-STUDY: 6-month job-seeking permit for state-approved programme graduates. Same work rights as during studies. If job offer received: apply for new work permit under Pay Limit/Positive List/Fast-Track. VALIDITY: duration of programme (not fixed 1-2 years). Extendable by 1 year (2 years if pregnancy/parental leave). FAMILY: spouse/partner and children <18 permitted for state-approved only (post-May 2, 2025). HEALTHCARE: CPR number + free Danish public healthcare after 3 months. PATH TO PR: 8 years total residency (4 if all supplementary requirements met).'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- DIGITAL NOMAD (DOES NOT EXIST)
-- ═══════════════════════════════════════════════════════════════════════════

INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements
) VALUES (
  'any',
  'denmark',
  'Digital Nomad',
  'Denmark "Digital Nomad" — No Digital Nomad Visa Exists',
  'Digital Nomad',
  'Denmark has no digital nomad visa. Working remotely without work permit is explicitly illegal for non-EU citizens. Confirmed by CitizenRemote (Feb 2026), Holafly (Oct 2025), Globe Advokater (Jan 2025), TheLocal.dk. Realistic options: (1) Working Holiday visa (7 countries only: Argentina, Australia, Canada, Chile, Japan, New Zealand, South Korea; ages 18-31; 1 year); (2) Start-up Denmark (innovative business, 75 permits/year cap); (3) 90-day Schengen tourist visa (remote work technically prohibited). EU/EEA/Swiss citizens may work remotely without restriction.',
  'NO DIGITAL NOMAD VISA EXISTS: Denmark has not introduced any digital nomad visa category. SIRI does not offer or process any digital nomad visa. WORKING REMOTELY WITHOUT PERMIT ILLEGAL: Non-EU/EEA/Swiss cannot work in Denmark, including remotely, without valid work permit. Globe Advokater: tourist visitors cannot engage in any paid work, including remote work for foreign company. TheLocal.dk: illegal for non-EU to live and work in Denmark without permit, even remotely. Only exception: attending meetings, training, consultations (not productive work). Violations: fines, deportation, visa bans. WORKING HOLIDAY ELIGIBILITY: Argentina, Australia, Canada, Chile, Japan, New Zealand, South Korea only. Ages 18-31. Duration: 1 year. Permits paid employment (holiday must be primary purpose). Financial: DKK 5,000 (~€670) at entry + return ticket. Fee: DKK 2,115 (~€285). Processing: 1-3 months. Argentina and Chile have quotas. Remote work for foreign employer permitted. START-UP DENMARK: For entrepreneurs with innovative business. Expert panel approval required. 75 permits/year cap. Excludes restaurants, retail, import/export, traditional businesses. EU/EEA/SWISS: Free to work remotely under free movement. Must register after 3 months for CPR number.',
  'NO DIGITAL NOMAD VISA: no processing, fees, or requirements for non-existent category. WORKING HOLIDAY: Argentina/Australia/Canada/Chile/Japan/NZ/South Korea passport, ages 18-31, DKK 5,000 at entry, return ticket capability, health insurance (recommended), apply via nyidanmark.dk, biometrics within 14 days, cannot extend beyond 1 year. SCHENGEN TOURIST: 90 days per 180 days, remote work technically prohibited, permitted: meetings/training/conferences only, fee ~DKK 598 (~€80), processing 15-30 days, financial proof €50/day, health insurance €30,000. Visa-exempt countries (US/UK/Canada/Australia/NZ/Japan): 90 days without pre-applying, same work prohibitions. START-UP DENMARK: business plan to Danish Business Authority, 4 criteria (innovation/market/scalability/team), living costs DKK 153,240/year (not investment), 75 permits/year cap, excludes non-innovative businesses, processing: Stage 1 (business plan) 4-8 weeks + Stage 2 (permit) 1 month, fee DKK 2,255.',
  'NO DIGITAL NOMAD VISA: N/A. Working Holiday: 1-3 months. Schengen tourist: 15-30 days. Start-up Denmark: 4-8 weeks (business plan) + 1 month (permit) = ~2-3 months total.',
  'NO DIGITAL NOMAD VISA: N/A. Working Holiday: DKK 2,115 (~€285). Schengen: ~DKK 598 (~€80). Start-up Denmark: DKK 2,255 (~€300).',
  'NO DIGITAL NOMAD VISA EXISTS: Denmark does not have digital nomad visa. No processing timeline, fees, or application requirements exist. WORKING HOLIDAY (7 COUNTRIES): Argentina, Australia, Canada, Chile, Japan, NZ, South Korea only. Ages 18-31 (no waiver). 1 year max. Work permitted (holiday primary purpose). DKK 5,000 entry + return ticket. DKK 2,115 fee. 1-3 months processing. Argentina/Chile quotas. Apply via nyidanmark.dk, biometrics within 14 days. Cannot extend, cannot convert. SCHENGEN TOURIST: 90 days per 180 days. Remote work technically prohibited for non-EU. Permitted: meetings/training/conferences (not productive output). DKK 598 fee. 15-30 days processing. €50/day financial proof. €30,000 health insurance. Visa-exempt (US/UK/Canada/Australia/NZ/Japan): 90 days without pre-applying, same prohibitions. START-UP DENMARK: Business plan to Danish Business Authority expert panel. Innovation/market/scalability/team criteria. DKK 153,240 living costs (not investment capital). Programme provides no funding. 75 permits/year cap. Once full, no more until next year. Stage 1: 4-8 weeks. Stage 2: 1 month. DKK 2,255 fee. Excludes: restaurants, retail, import/export, holding companies, non-innovative. Accepted: SaaS, deep tech, biotech, cleantech, fintech, medtech, scalable tech. TAX: residency after 6 consecutive months. Worldwide income taxable. 37-52% effective rate. Double-taxation treaties exist. Working Holiday: Danish-sourced income taxable, international income generally not if not tax-resident. VAT registration: self-employed turnover >DKK 50,000/year. WHEN MIGHT DENMARK INTRODUCE DIGITAL NOMAD VISA: No official timeline as of March 2026. Denmark has not signaled intention. EU alternatives: Estonia, Finland, Portugal have digital nomad visas.'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- RETIREMENT (DOES NOT EXIST)
-- ═══════════════════════════════════════════════════════════════════════════

INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements
) VALUES (
  'any',
  'denmark',
  'Retirement',
  'Denmark "Retirement Visa" — No Retirement Visa Exists',
  'Retirement',
  'Denmark has no retirement visa for general non-EU nationals wishing to retire based on passive pension income. Confirmed by retireineurope.org, smartasset.com, all credible Danish sources. Only retirement-specific permit: Permanent Residence for Retired Employees of International Organisations (Aliens Act §9q) for UN/NATO/EU/OECD retirees who held residence as active employees 5+ years. Non-EU retirees must establish residency via family reunification (joining Danish citizen/PR spouse/partner), prior work permit, student permit, or exceptional circumstances (extremely rare, discretionary). Denmark is one of hardest EU countries to retire in without family ties. Most non-EU retirees in Denmark via family reunification.',
  'NO RETIREMENT VISA FOR GENERAL RETIREES: No retirement visa exists in Danish immigration law (Udlændingeloven). No provision for residence based on passive income/accommodation. No minimum age, income threshold, or validity period because visa does not exist. Retireineurope.org: Americans apply via family reunification, work permits, or study permits. No dedicated retirement visa. INTERNATIONAL ORGANISATION RETIREES (§9q): Former employees of UN, NATO, EU, OECD, etc. Must have held residence as active employee 5+ years. Must have retired from organisation. Grants permanent residence directly. SIRI processes. Extremely narrow category. FAMILY REUNIFICATION (PRIMARY ROUTE): Join spouse/partner/adult child who is Danish citizen or PR. Sponsor must: housing guarantee DKK 50,000-100,000 (~€7,000-14,000), sufficient income, no public benefits past 3 years, meet integration requirements. Applicant must: be 24+ (some exceptions). Processing: 3-6 months. Initial permit: 1-2 years, leads to PR after 8 years. EXCEPTIONAL CIRCUMSTANCES: No codified extraordinary financial means pathway. Extremely rare, discretionary, requires legal counsel. Cannot rely on this. EU/EEA/SWISS: Free to retire under free movement. Must register after 3 months for CPR number.',
  'NO RETIREMENT VISA: no processing, fees, or requirements for non-existent category. FAMILY REUNIFICATION: Sponsor must have adequate housing, post DKK 50,000-100,000 guarantee, prove income above assistance threshold, no public benefits 3 years, pass integration exam. Applicant must be 24+, have stronger ties to Denmark than home country (spouses), pass language/integration for PR later. Processing 3-6 months. Apply via nyidanmark.dk, biometrics within 14 days. INTERNATIONAL ORG RETIREES (§9q): Must have held residence as active employee of UN/NATO/EU/OECD 5+ years, retired from organisation, grants PR directly, apply to SIRI with employment/retirement documentation, proof of pension from organisation.',
  'NO RETIREMENT VISA: N/A. Family reunification: 3-6 months. International org retirees (§9q): varies.',
  'NO RETIREMENT VISA: N/A. Family reunification: varies by relationship. International org retirees: varies.',
  'NO RETIREMENT VISA: Denmark has no retirement visa for general retirees. No processing, fees, or requirements exist. FAMILY REUNIFICATION REQUIREMENTS: Sponsor (citizen/PR) must: adequate housing (minimum floor space), post DKK 50,000-100,000 guarantee, prove income above public assistance, no public benefits 3 years, pass integration exam (most cases). Applicant must: be 24+ years, have stronger ties to Denmark than home country (spouses), pass language/integration for PR. Processing 3-6 months. Fees vary. Apply via nyidanmark.dk, biometrics within 14 days. INTERNATIONAL ORG RETIREES (§9q): Must have held Danish residence as active employee of UN/NATO/EU/OECD 5+ years, retired from organisation. Grants PR directly, not temporary. Apply to SIRI with employment/retirement documentation, proof of pension from organisation. PERMANENT RESIDENCE (CONTEXT): Standard: 8 years continuous residency. Fast-track: 4 years if ALL four supplementary requirements met: Danish language (Prøve i Dansk 2+), active citizenship (board/association 1+ year), no public benefits 5 years, employment/education requirements. Clean criminal record, no public debts, declaration of residence/self-support. Among strictest PR requirements in EU. CITIZENSHIP (CONTEXT): ~9 years total residence. Danish language (Prøve i Dansk 3). Civic knowledge test. Clean record. Self-sufficient. Generally no dual citizenship for newly naturalized (only by birth/marriage in certain circumstances). HEALTHCARE: Legal residents with CPR number: universal Danish public healthcare (Sygesikring) at no cost. Major benefit. TAX: residents taxed on worldwide income. Treaties with US/UK/Australia/Canada. US Social Security: 15.3% tax for US citizens while Danish resident; consult dual-tax specialist. Danish pension: requires 10 years residency from age 15; new retirees generally ineligible. COST OF LIVING: Copenhagen among Europe most expensive. DENMARK HARDEST EU FOR NON-EU RETIREES WITHOUT FAMILY: Immigration law prioritizes skilled workers and family reunification. No clear exceptional financial means pathway. Practical reality: most non-EU retirees via family reunification with Danish citizen/PR.'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- INVESTOR / START-UP DENMARK
-- ═══════════════════════════════════════════════════════════════════════════

INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements
) VALUES (
  'any',
  'denmark',
  'Investor',
  'Denmark Investor / Business — Start-up Denmark Programme',
  'Investor',
  'Denmark has no golden visa and no real estate investment visa. Primary route: Start-up Denmark programme (SIRI and Danish Business Authority), one of Europe most demanding startup programmes. Two-stage process: (1) business plan evaluation by independent expert panel (innovation, market attractiveness, scalability, team competencies); (2) if approved, apply to SIRI for residence/work permit. Hard annual cap: 75 permits per year. Once full, no more until next calendar year. Restaurants, retail, import/export, holding companies excluded. Financial requirement 2025: DKK 153,240 (~€20,500) personal living costs first year, not investment capital. Programme provides no funding; entrepreneurs raise capital independently. Processing: ~4-8 weeks business plan evaluation + ~1 month permit = ~2-3 months total. July 2024 expansion: Danish citizens abroad can apply, branches of foreign businesses eligible, team applications (up to 3) permitted.',
  'NO GOLDEN VISA OR PASSIVE INVESTMENT: Denmark deliberately never established residency-by-investment programme. No minimum financial investment grants residency. Start-up Denmark requires business plan demonstrating innovation/growth, not investment capital. No amount of money purchases residency. Denmark consciously rejected all golden visa schemes. NON-EU/EEA/SWISS OR DANISH CITIZENS ABROAD: Available to non-EU/EEA/Swiss third-country nationals. Also Danish citizens abroad (primarily for family reunification, July 2024 expansion). EU/EEA can co-found but do not need permits. INNOVATIVE, SCALABLE BUSINESS REQUIRED: Business plan for new innovative company OR Danish branch of existing foreign self-employment business (July 2024). Must demonstrate: innovation (novel product/service/model), market attractiveness (clear target/demand), scalability (growth potential), strong team. Must actively run, not passive shareholder. Must own significant share. WHAT EXCLUDED: Expert panel rejects: restaurants/food service, retail shops/stores, import/export companies, holding companies/passive investment, small consulting without differentiation, business without specific Danish interests (must explain why Denmark not just any EU country), businesses without growth/scaling potential. Accepted sectors: SaaS, deep tech, biotech, cleantech, fintech, medtech, scalable tech ventures. TEAM APPLICATIONS: Up to 3 people joint business plan (July 2024). EU/EEA team members do not need permits but can co-submit. All assessed on competencies. ANNUAL CAP 75 PERMITS: Explicitly capped at 75 residence/work permits per calendar year (Jan 1-Dec 31), confirmed nyidanmark.dk. Once full, no more until next year regardless of strength. Applications late in year (after November some years) deferred to January. Makes this one of most selective startup visas in EU.',
  'TWO-STAGE PROCESS: Stage 1 (business plan): submit to Danish Business Authority via startupdenmark.info, expert panel evaluation, 4 criteria (innovation/market/scalability/team), 4-8 weeks processing, no fee, high rejection rate, cannot immediately reapply if rejected. Stage 2 (residence permit): only after Stage 1 approval, apply SIRI via nyidanmark.dk SD1 form, biometrics within 14 days, ~1 month processing. REQUIRED DOCUMENTS STAGE 2: Approval letter from Danish Business Authority, valid passport, proof of financial self-sufficiency first year (bank statement DKK 153,240 solo/DKK 306,480 with spouse/DKK 356,904 with spouse+children), business registration, business plan implementation progress proof, power of attorney if represented. FINANCIAL SELF-SUFFICIENCY (NOT INVESTMENT): DKK 153,240 (~€20,500) solo first year. DKK 306,480 with spouse. DKK 356,904 with spouse+children. Personal living costs, NOT investment capital. Bank statement showing accessible funds. Programme: Startup Denmark only provides permits. Entrepreneurs responsible for raising all capital. Business capital independently via investors/grants/personal funds. Business plan should address funding.',
  'Stage 1 (business plan evaluation): 4-8 weeks (up to 8 weeks peak periods). Stage 2 (residence permit to SIRI): ~1 month. Total: ~2-3 months from initial submission to permit (if approved).',
  'SIRI application: DKK 2,255 (~€300). Family members: DKK 2,255 each. No fee for Stage 1 business plan evaluation.',
  'TWO-STAGE PROCESS: Stage 1 (Business Plan): submit to Danish Business Authority via startupdenmark.info, independent expert panel evaluation, four criteria (innovation/market/scalability/team), processing 4-8 weeks (up to 8 weeks peak), no fee, high rejection rate for failing innovation/scalability, rejected applicants cannot immediately reapply, must substantially revise concept. Stage 2 (Residence Permit): only after Stage 1 approval, apply SIRI via nyidanmark.dk SD1 form, biometrics within 14 days at SIRI office or Danish embassy, processing ~1 month. REQUIRED DOCUMENTS STAGE 2: Approval letter from Danish Business Authority, valid passport, proof financial self-sufficiency first year (bank statement DKK 153,240 solo/DKK 306,480 spouse/DKK 356,904 spouse+children, 2025 levels), business registration documents, proof business plan implementation progress, power of attorney if represented. FINANCIAL SELF-SUFFICIENCY (NOT INVESTMENT CAPITAL): DKK 153,240 (~€20,500) solo first year. DKK 306,480 with spouse. DKK 356,904 with spouse+children. This is personal living costs, NOT investment capital. Bank statement showing accessible funds. Programme explicitly: Startup Denmark only provides residence/work permits. Entrepreneurs themselves responsible for raising all required capital. Must raise business capital independently via investors/grants/personal funds. Business plan should address funding strategy. FEES: SIRI DKK 2,255 (~€300). Family members: DKK 2,255 each. No fee Stage 1 business plan evaluation. PERMIT VALIDITY AND CONDITIONS: Initial: up to 2 years. Extensions: 3-year increments while business operates. Must actively run business; cannot take salaried employment elsewhere without separate work permit. Cannot work other Schengen countries on this permit. Can do unpaid voluntary work. Can apply public/private business funding schemes. Must not give up Danish address or stay abroad >6 consecutive months. FAMILY REUNIFICATION: Spouse/partner and children <18 receive accompanying permits with equivalent rights. Spouse receives work authorization. Family members separate application and fees (DKK 2,255 each). PATH TO PERMANENT RESIDENCE: 8 years continuous legal residency. Can be reduced to 4 years if all supplementary requirements met: Danish language test (Prøve i Dansk 2+), active citizenship participation, no public benefits 5 years, employment/education requirements. CITIZENSHIP: ~9 years total residence. Danish language (Prøve i Dansk 3). Civic knowledge test. Clean criminal record. Financial self-sufficiency. NO GOLDEN VISA: Denmark does not and has not offered residency-by-investment programme. No real estate investment visa. No passive investment vehicle for residence. Only active entrepreneurship via Start-up Denmark for business founders.'
);
