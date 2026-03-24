/*
  # Populate China Immigration Pathways - Fact-Checked

  1. Summary
    - Adds comprehensive, fact-checked immigration pathways for China
    - Based on official NIA (National Immigration Administration) sources (verified March 2026)
    - CRITICAL CORRECTIONS: No digital nomad visa exists (working on tourist/business visa ILLEGAL)
    - NO retirement visa exists (academic proposal submitted 2025 but not yet law)
    - Investor pathway leads directly to Permanent Residence (Green Card), not temporary visa
    - Original starter content entirely generic placeholders with zero China-specific information

  2. Content Details
    - Work: Z Visa + Foreigner's Work Permit + Residence Permit (three-document system)
    - Study: X1 Visa (long-term >180 days) and X2 Visa (short-term ≤180 days)
    - Digital Nomad: DOES NOT EXIST - working on tourist/business visa is explicitly illegal
    - Retirement: DOES NOT EXIST - no dedicated retirement visa (proposal submitted 2025, not law)
    - Investor: Chinese Green Card (permanent residence) via USD $500k-$2M investment (3 years stable operations)

  3. Important Notes
    - All data verified against NIA, Baker McKenzie China Immigration 2025, Chambers & Partners
    - China's immigration system among world's most tightly controlled and employer-driven
    - Class A/B/C talent categorization for work permits; age limit 18-60 for Class B/C
    - Chinese Green Card extremely selective: only ~15,000 issued in 20 years
    - Citizenship effectively impossible for most foreigners; no dual citizenship permitted
    - Great Firewall blocks Google, WhatsApp, most Western social media and work tools
*/

-- Delete any existing China pathways to avoid duplicates
DELETE FROM immigration_pathways WHERE destination_slug = 'china';

-- ═══════════════════════════════════════════════════════════════════════════
-- WORK: Z Visa + Foreigner's Work Permit + Residence Permit
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
  'china',
  'Work',
  'Work',
  'China Work Authorization — Z Visa + Foreigner''s Work Permit + Residence Permit',
  'Original card used entirely generic placeholder language (Typically requires job offer from local employer... Varies by country and program) with no China-specific information at all. China work authorization is rigorous three-document system. Step 1: Employer applies to NIA Foreigner Work Permit system for Work Permit Notification Letter - employer responsibility. Step 2: Foreign national uses notification letter to apply for Z Visa at nearest Chinese embassy/consulate. Step 3: Within 15 days of arriving in China on Z Visa, worker applies for formal Foreigner Work Permit. Step 4: Within 30 days of arrival, worker must convert Z Visa into Residence Permit for Work at local PSB (Public Security Bureau). Z Visa itself only allows 30-day entry window. Workers classified as Class A, B, or C talent. CLASS A/B/C TALENT SYSTEM: Class A (High-level talent) - Nobel Prize laureates, senior executives earning top-tier salaries, globally recognized experts. Exempt from age limits and standard document requirements. Fast-tracked. May enter on any valid visa and apply for work permit upon arrival. Class B (Professional personnel) - Bachelor degree or higher; 2+ years relevant professional experience; confirmed job offer. Most common category for foreign professionals, teachers, executives, technical staff. Class C (Temporary/seasonal) - Lower-skill, seasonal, or short-term roles. Quota-limited by region. More restricted access than Class B.',
  'Valid job offer from licensed, NIA-authorized Chinese employer. Bachelor degree or higher. 2+ years relevant professional work experience. AGE: 18-60 years old (Class B/C; Class A exempt) - hard limit applies regardless of qualifications. Clean criminal record (verified and notarized). Medical examination (completed at approved hospital). No history of China immigration violations. EMPLOYER-DRIVEN PROCESS: Entire process is employer-initiated. Chinese employer must: (1) hold valid business license, (2) hold official authorization to hire foreign nationals, (3) demonstrate genuine business need that cannot be filled domestically, (4) apply to NIA Foreigner Work Permit Management System for notification letter. Foreign national does NOT apply to NIA directly - employer does.',
  'Valid job offer from NIA-authorized Chinese employer; Bachelor+ degree; 2+ years experience; age 18-60 (Class B/C); Z Visa + Work Permit + Residence Permit required',
  'STEP 1 - Employer: Apply to NIA for Work Permit Notification Letter (via Foreigner Work Permit Management System). STEP 2 - Employee: Apply for Z Visa at Chinese embassy/consulate in home country using Notification Letter. STEP 3 (within 15 days of arrival): Apply for formal Foreigner Work Permit at local authorities. STEP 4 (within 30 days of arrival): Convert Z Visa to Residence Permit for Work at local PSB. Bring: passport, work permit, employment contract, medical exam, accommodation registration. R VISA - EXPEDITED ROUTE FOR TOP-TIER TALENT: China also issues R Visa for foreign professionals recognized as urgently needed or exceptional talent in science, technology, education, finance. R Visa holders receive priority processing, flexibility to change employers more easily, potentially multi-year validity. Requires endorsement from government authorities or extraordinary credentials (patents, global accolades, senior-level certifications). Shanghai talent pilot (2024): cross-border remote workers who have worked in China for 6+ months can apply for R Visa through streamlined process with 5-day (vs. 15-day) processing. WORK PERMIT AND RESIDENCE PERMIT EMPLOYER-AND-LOCATION-SPECIFIC: Work permits tied to specific employer and city/province on permit. If worker changes employers or relocates to different city, work permit must be de-registered and reapplied. Significant constraint. Some tier-1 cities (Beijing, Shanghai, Shenzhen) offer simplified procedures for transfers under certain conditions.',
  'Work Permit Notification (employer step): 5-10 business days. Z Visa at consulate: 1-3 weeks (~10 working days average). Residence Permit conversion: 1-2 weeks after submission. Total employer-to-start: Allow 6-10 weeks. Original 1-6 months too broad and conflates entirely different stages. Z Visa alone takes ~1-3 weeks; full process from employer application to working legally is 6-10 weeks total.',
  'Z Visa application fee: varies by nationality (typically USD $140-$180 standard processing). Work Permit application fee: CNY 400-800 (approximately USD $55-$110). Residence Permit fee: CNY 400-1,600 depending on validity (approximately USD $55-$220). Medical examination at approved hospital: CNY 500-1,000 (approximately USD $70-$140). Document notarization and authentication: USD $100-$300. Legal assistance (optional but recommended for complex cases): USD $1,000-$3,000. Police registration: typically free. Total estimated first-year costs (excluding legal fees): USD $500-$1,000.',
  'Work Permit Notification employer step: 5-10 business days. Z Visa at consulate: 1-3 weeks approximately 10 working days average. Residence Permit conversion: 1-2 weeks after submission. Total employer-to-start: Allow 6-10 weeks. Original 1-6 months too broad and conflates entirely different stages. Z Visa alone takes approximately 1-3 weeks; full process from employer application to working legally is 6-10 weeks total.',
  'Z Visa: Single-entry, 30 days from arrival (entry window only). Residence Permit for Work: Duration of employment contract; minimum 90 days, maximum 5 years. Renewal: Possible while employed; must be done before expiry. PATH TO PERMANENT RESIDENCE (Chinese Green Card): After 4 consecutive years of employment in qualifying senior role, with 3 years spent in China and strong tax records, some workers may qualify for Green Card (see investor card for details). Extremely selective. CITIZENSHIP: Effectively impossible for most foreigners. China Nationality Law grants citizenship to very few foreigners; naturalization granted to only few hundred people since PRC founding. China does NOT permit dual citizenship. VALIDITY PERIOD CORRECTION: Original stated 1-3 years initially, often renewable. Z Visa itself is single-entry and only allows 30-day stay from date of arrival - during which worker must convert to Residence Permit. Residence Permit (not visa) governs actual stay duration: issued for duration of employment contract, ranging from minimum of 90 days to maximum of 5 years. Class A permits may receive multi-year validity. Visa and permit are separate documents.',
  'https://www.nia.gov.cn/n897484/index.html',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- STUDY: X1 Visa (Long-Term) & X2 Visa (Short-Term)
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
  'china',
  'Study',
  'Study',
  'China Student Visa — X1 Visa (Long-Term Study >180 Days) & X2 Visa (Short-Term ≤180 Days)',
  'Original card used generic placeholder content (Student visas allow international students to study at recognized educational institutions in China. Requirements typically include proof of enrollment, financial means, and sometimes language proficiency). China student visa system has two specific types: X1 Visa for programs exceeding 180 days (degree programs, year-long language courses) and X2 Visa for programs of 180 days or less (exchange programs, short courses). Both require JW201 or JW202 form - China unique Foreign Student Visa Application Form issued by enrolling institution and Chinese Ministry of Education - which original card does not mention at all. Processing is fast: typically 4 working days at most embassies (not 2-8 weeks). However, X1 Visa requires mandatory Residence Permit conversion within 30 days of arrival - also absent from original. JW201/JW202 FORM MANDATORY: Unique China-specific requirement - students must obtain JW201 or JW202 form (officially Visa Application for Study in China) from their institution before applying at embassy. JW201 issued to students on Chinese government scholarships. JW202 for self-funded students. Without this form, student visa application cannot proceed. Form issued by university via Chinese Ministry of Education online platform (Study in China website) and must be downloaded before embassy visit.',
  'Accepted by and enrolled in authorized Chinese educational institution. Obtain JW201 (scholarship) or JW202 (self-funded) form from institution. Valid passport (6+ months validity; 1+ year for US citizens applying for 5-year X1). Proof of financial means (bank statements or scholarship letter). Medical examination record (required for X1 visa applicants). No criminal record certificate. Parental consent + guardian appointment in China if under 18. POLICE REGISTRATION WITHIN 24 HOURS: On arrival in China, foreign students must register with local police station within 24 hours. Students staying in university dorms have their institution handle this. Students in private accommodation must visit local police station themselves. Mandatory registration not mentioned in original card; missing it can cause complications with Residence Permit application.',
  'Enrollment at authorized Chinese institution; JW201 or JW202 form (mandatory); X1 for programs >180 days (requires Residence Permit conversion within 30 days); X2 for programs ≤180 days',
  'Valid passport (original + photocopy of bio page); Completed COVA application form + AVAS appointment voucher (from September 2025); Passport-sized photo (white background, no glasses); Admission Notice from Chinese institution (original + copy); JW201 or JW202 form (original + copy) - mandatory for X1; Foreigner Physical Examination Record (for X1); Proof of financial means; No criminal record certificate (some consulates). X1 HOLDERS MUST CONVERT TO RESIDENCE PERMIT WITHIN 30 DAYS: X1 Visa only grants 30-day entry window. Within those 30 days, student must apply for Foreigner Residence Permit at local Exit-Entry Administration. Permit is what actually covers duration of studies (up to 5 years). Failure to apply within 30 days results in illegal overstay - serious violation in China with significant penalties. Universities typically assist students with this process. COVA ONLINE SYSTEM (September 2025 update): From September 30, 2025, many consulates require students to complete visa application through COVA (China Online Visa Application system at cova.cs.mfa.gov.cn) and book appointments via AVAS appointment system. Applications must be submitted in person. COVA system generates application form to print and bring. Always check specific consulate instructions as requirements vary by country and location.',
  'Standard: 4 working days at most Chinese embassies and CVASCs. San Francisco consulate: 7 working days. Expedited (where available): 2-3 working days (additional fee). Note: time to prepare and receive JW forms from institution (university-dependent) can take several weeks and is main variable in total timeline.',
  'X1 Visa application fee: varies by nationality (typically USD $140-$180 standard; US citizens with reciprocal multi-entry 5-year validity pay approximately USD $180). X2 Visa application fee: varies by nationality (typically USD $140-$180). Expedited processing (where available): additional USD $20-$40. Medical examination (X1 required): CNY 400-600 (approximately USD $55-$85). Document notarization and authentication: USD $50-$200. Residence Permit application fee (X1 holders): CNY 400-800 (approximately USD $55-$110). Police registration: typically free. Health insurance (required by most institutions): USD $200-$800/year depending on coverage level.',
  'Standard processing: 4 working days at most Chinese embassies and CVASCs. San Francisco consulate: 7 working days. Expedited where available: 2-3 working days additional fee. Original 2-8 weeks is dramatic overstatement of standard processing time, which is measured in working days, not weeks. Note: time to prepare and receive JW forms from institution university-dependent can take several weeks and is main variable in total timeline.',
  'X1 Visa: 90 days from issue date (entry window); stay duration = 000 (determined after entry by Residence Permit). X2 Visa: 90 days from issue; stay ≤180 days; no Residence Permit conversion required. Residence Permit (X1 holders): Issued after arrival; valid up to 5 years; allows free travel in/out of China. POST-ARRIVAL MANDATORY STEPS (X1): Police registration within 24 hours of arrival. Residence Permit application within 30 days of arrival at local Exit-Entry Administration. Documents needed: passport, Admission Notice, JW form, Physical Exam Record, accommodation registration, photo. WORK RIGHTS: Student visas do NOT automatically permit employment. Limited part-time work authorization may be available with institutional permission. VISA TYPE NAMES CORRECTION: Original used China Student Visa generically. China uses specific, legally defined visa codes. Student visa is X Visa, divided into X1 (long-term, >180 days) and X2 (short-term, ≤180 days). Using wrong type causes entry problems. X1 holder enters with 30-day window but must convert to Residence Permit within that time; X2 holder stays for up to visa permitted duration with no permit conversion required.',
  'https://www.mfa.gov.cn/ce/ceus/eng/visaservice/t84876.htm',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- DIGITAL NOMAD: DOES NOT EXIST (illegal to work on tourist/business visa)
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
  'china',
  'Digital Nomad',
  'Digital Nomad',
  'China "Digital Nomad / Remote Work Visa" — Does Not Exist; Working on Tourist/Business Visa Is Illegal',
  'CRITICAL CORRECTION: Original card described China Digital Nomad / Remote Work Visa with eligibility criteria, 2-8 weeks processing, and 6 months to 2 years validity. This visa does NOT exist. China has no dedicated digital nomad visa category and - critically - is one of most legally explicit countries in world about this: Chinese government confirmed that working on Tourist visa (L Visa) or Business visa (M Visa) is ILLEGAL. This is NOT gray area as it is in Canada or Chile. Penalties for working illegally in China include deportation, heavy fines, and being blacklisted from future entry. Original card description of eligibility structure, income thresholds, and validity period for China Digital Nomad Visa is entirely fabricated - no such product has ever existed in Chinese law. Remote.com (February 2025): China does not offer dedicated digital nomad visa. Official visa lists published by Chinese government do not include digital nomad category. HROne (2025): In 2025, China has no official digital nomad visa, and working while on tourist or business visa is illegal. Chambers & Partners China (current): confirmed no digital nomad category exists. This is unambiguous.',
  'THIS VISA DOES NOT EXIST. Working in China without valid work permit - including working remotely for foreign employer while on L (tourist) or M (business) visa - can result in: deportation, fines, and being blacklisted from future entry into China. This is NOT theoretical risk - enforcement exists. WHAT ACTUALLY EXISTS FOR SHORT-TERM VISITORS / BUSINESS PEOPLE: L Visa (Tourist) - 30-90 days per entry, typically single or double entry (or multiple-entry up to 10 years for some nationalities). No work of any kind permitted. Visa-free entry exists for many nationalities for 15-30 days. M Visa (Commercial/Trade) - For business activities (attending meetings, negotiating contracts, short-term assignments ≤90 days per calendar year without work permit). Cannot perform remunerated work for Chinese entities. F Visa (Non-commercial visits) - Cultural, academic, scientific exchanges. Cannot perform paid work. Short assignments ≤90 days per calendar year by intra-company transferees, where employment and compensation is maintained by overseas employer, can be done on M Visa without work permit under current Baker McKenzie guidance (2025).',
  'No dedicated digital nomad visa exists. Working on tourist (L) or business (M) visa is explicitly ILLEGAL. Penalties: deportation, fines, blacklisting. Only legal pathway: Z Visa + Work Permit + Residence Permit via Chinese employer',
  '2024-2025 EMERGING PILOT PROGRAMS - NOT A VISA, NOT YET NATIONAL: In 2024, Shanghai launched pilot program allowing cross-border remote workers (employed by Chinese companies) who have worked in China for 6+ months to apply for R Visa using Remote Work Achievement Evaluation Report - with expedited 5-day processing. Some tourist cities (Sanya, Xiamen) explored digital nomad + tourism policy combinations. National unified platform for foreigner remote work management expected by end of 2025. These are pilot programs, NOT national digital nomad visa, and do NOT apply to foreign nationals working for non-Chinese foreign employers. THE GREAT FIREWALL - PRACTICAL REALITY FOR REMOTE WORKERS: Even if China introduced digital nomad visa, foreign remote workers face significant practical challenges: Google Workspace, Slack, Zoom, WhatsApp, Instagram, YouTube, Twitter/X, and most Western work tools are BLOCKED by China Great Firewall. VPN required to access them, and VPN usage by foreigners occupies legal gray zone. China has blocked or restricted many VPN services. Uninterrupted remote work for foreign clients requires planning around connectivity limitations that no other major country presents at this scale. THE ONLY LEGAL PATHWAY FOR FOREIGN REMOTE WORKERS: To legally work remotely in China (for Chinese employer or foreign employer with Chinese entity), foreign national must obtain standard Z Visa + Work Permit + Residence Permit for Work through authorized Chinese employer or Employer of Record (EOR) service. Employer must be legally registered Chinese entity or licensed EOR provider. There is NO freelancer or independent contractor visa in China that permits remunerated work without this employer-based sponsorship structure.',
  'This visa does not exist. L Visa (tourist) typical processing: 4 working days. M Visa (business) typical processing: 4 working days. Legal work authorization via Z Visa + Work Permit: 6-10 weeks total (see work card).',
  'L Visa (tourist): Typically USD $140-$180 for standard processing. M Visa (business): Typically USD $140-$180 for standard processing. Both prohibit remunerated work. Legal work authorization costs (Z Visa + Work Permit + Residence Permit): See work card - approximately USD $500-$1,000 first-year costs excluding legal fees. VPN service (if attempting remote work - occupies legal gray zone): USD $50-$150/year. Risk of deportation, fines, blacklisting: invaluable deterrent.',
  'This visa does not exist. L Visa tourist processing: 4 working days standard. M Visa business processing: 4 working days standard. Legal work authorization Z Visa + Work Permit + Residence Permit processing: 6-10 weeks total see work card. Original 2-8 weeks processing described for non-existent digital nomad visa is fabricated.',
  'THIS VISA DOES NOT EXIST. L Visa (tourist): Typically 30-90 days per entry; multiple-entry variants up to 10 years validity for some nationalities but each stay limited to 30-90 days. NO WORK PERMITTED. M Visa (business): Typically 30-90 days per entry; commercial activities only; NO REMUNERATED WORK for Chinese entities. Legal work authorization: Z Visa single-entry 30 days entry window, convert to Residence Permit for Work (90 days to 5 years validity). See work card. Citizenship: Effectively impossible for most foreigners. China does NOT permit dual citizenship. PENALTIES FOR ILLEGAL WORK: Deportation, fines (up to CNY 10,000 or more), blacklisting from future entry to China. This is NOT gray area - enforcement is real.',
  'https://www.nia.gov.cn/n897484/index.html',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- RETIREMENT: DOES NOT EXIST
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
  'china',
  'Retirement',
  'Retirement',
  'China "Retirement Visa" — Does Not Exist; No Dedicated Pathway for Retirees',
  'CRITICAL CORRECTION: Original card described China Retirement Visa with minimum age often 50 or older, passive income requirements, processing of 1-3 months, and validity of 1-2 years initially, usually renewable that may lead to permanent residence. This visa does NOT exist. Multiple sources confirm: There is no Chinese retirement visa or specific program in this regard for interested foreigners (LawyersChina.net). China does not have visa specifically for retirees (SmartAsset). Proposed conditional retirement visa was submitted as academic proposal at March 2025 CPPCC session by Peking University professor - demonstrating that even in China, experts acknowledge this gap and are advocating for it. As of March 2026, no retirement visa exists. Original card confident description of eligibility and processing is fabricated. LawyersChina.net: there is no Chinese retirement visa or specific program in this regard for interested foreigners. SmartAsset: China does not have visa specifically for retirees. Quora (immigration experts): There is no such thing as retirement visa or other long-term visa which would allow just any foreigner to retire and stay in China indefinitely. As of March 2025, proposal submitted to Chinese People Political Consultative Conference to create conditional retirement residence visa - evidence that one does NOT yet exist.',
  'THIS VISA DOES NOT EXIST. WHAT ACTUALLY EXISTS - OPTIONS FOR OLDER FOREIGNERS SEEKING EXTENDED STAYS: L Visa (Tourist/Family visit) - Most common option. Single or multiple-entry. Typically 30-90 days per stay. Some nationalities receive multi-entry L Visas valid for 1-2 years, granting 60-day stays per entry. NOT residence solution but workable for part-time presence. Q Visa (Family reunion) - For spouses, children, or parents of Chinese citizens or Chinese permanent residents. Allows longer-stay family reunion. Married to Chinese citizen: eligible for Q1 Visa (residence permit for family reunion). Permanent Residence (Green Card) - Only long-term option, but highly selective. One pathway exists for those aged 60+ with no direct relatives abroad and sponsoring relatives in China - must have lived in China 5 consecutive years with 9+ months/year residence. (See investor card for full details.)',
  'No dedicated retirement visa exists. Options: L Visa (tourist, 30-90 days per stay); Q Visa (family reunion if married to Chinese citizen or related to PR holder); Green Card (extremely selective, 5 years residence required)',
  'PERMANENT RESIDENCE VIA FAMILY CONNECTION - MOST VIABLE LONG-TERM OPTION FOR RETIREES: If retiree is married to Chinese citizen or holds relationship to permanent resident, Q Visa / family reunion residence permit pathway is most realistic route. After 5 consecutive years of residence in China with at least 9 months per year in-country, and while married to Chinese citizen, foreigner may apply for permanent residence. Still subject to strict criteria and not guaranteed. HEALTHCARE REALITY FOR NON-RESIDENTS: China national health insurance system (Basic Medical Insurance) covers Chinese citizens and registered permanent residents. Foreign visitors and holders of temporary visas NOT enrolled in this system and must have private health insurance. Good-quality private international health insurance in China can cost USD $2,000-$10,000+ per year depending on age and coverage level. Private hospitals with English-speaking staff available in major cities but expensive without insurance. Public hospitals offer lower costs but significant language barriers outside of major cities. THE 2025 CPPCC RETIREMENT VISA PROPOSAL - NOT YET LAW: At 3rd session of 14th National Committee of Chinese People Political Consultative Conference (March 4-10, 2025), Professor Jia Qingguo of Peking University submitted proposal titled On Conditionally Opening Retirement Residence Visas to Foreign Nationals. South China Morning Post (March 2025) covered this with economic argument that 50,000 foreign retirees could generate over USD $1.2 billion in consumption annually. This proposal has NOT been passed or legislated as of March 2026. Represents academic advocacy, not current policy. Anyone planning retirement in China should NOT rely on this proposal as existing pathway.',
  'This visa does not exist. L Visa (tourist) processing: 4 working days. Q Visa (family reunion) processing: 4-7 working days for Q2 (short-term); Q1 requires Residence Permit conversion within 30 days of arrival, processed in 1-2 weeks. Permanent Residence (Green Card) processing: 90 working days best case (Shanghai); 6 months to 1+ year other regions.',
  'L Visa (tourist): Typically USD $140-$180 standard processing. Q Visa: Typically USD $140-$180 standard processing. Residence Permit (Q1 holders): CNY 400-1,600 (approximately USD $55-$220). Private health insurance: USD $2,000-$10,000+ per year depending on age and coverage. Living costs: USD $1,000-$2,500/month comfortable lifestyle in tier-1 cities; USD $600-$1,200/month tier-2/3 cities. Permanent Residence application (Green Card): no official fee for application itself, but legal assistance highly recommended USD $3,000-$10,000+.',
  'This visa does not exist. L Visa tourist processing: 4 working days standard. Q Visa family reunion processing: 4-7 working days for Q2 short-term; Q1 requires Residence Permit conversion within 30 days of arrival, processed in 1-2 weeks. Permanent Residence Green Card processing: 90 working days best case Shanghai; 6 months to 1+ year other regions. Original 1-3 months described for non-existent retirement visa is fabricated.',
  'THIS VISA DOES NOT EXIST. L Visa (tourist): Typically 30-90 days per stay; multi-entry variants valid 1-2 years for some nationalities with 60-day stays per entry. NOT residence solution. Q Visa (family reunion): Q2 for short visits (up to 180 days); Q1 with Residence Permit for longer stays (1-5 years validity, renewable). Permanent Residence (Green Card): 10 years validity (5 years for under 18); renewable. Extremely selective - only pathway to indefinite stay. Citizenship: Effectively impossible for most foreigners. China does NOT permit dual citizenship. HEALTHCARE: National health insurance NOT available to temporary visa holders - private insurance required USD $2,000-$10,000+ per year. Original card validity of 1-2 years initially, usually renewable that may lead to permanent residence describes non-existent product.',
  'https://www.nia.gov.cn/n897484/index.html',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- INVESTOR: Permanent Residence (Chinese Green Card) via Investment
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
  'china',
  'Investor',
  'Investor',
  'China Investor / Business Immigration — Permanent Residence (Chinese Green Card) via Investment',
  'Original card described Investment-based visas and real estate purchase, or capital transfer with varying investment thresholds. Significantly misleading for China. China does NOT have golden visa in traditional sense (no passive real estate purchase or capital transfer program). What China offers is highly selective Permanent Residence Permit (Chinese Green Card) for qualifying investors. NOT temporary visa - is permanent residence, issued directly. Investment must be active and maintained for 3 consecutive years, with good tax record. Program one of world most restrictive: only approximately 15,000 Green Cards issued in program first two decades. There is also no golden visa step offering temporary residence first for investors - path leads to permanent residence only after 3 years of compliant investment, making it structurally different from every other country in this series. SPECIFIC INVESTMENT THRESHOLDS: Original stated minimum investment amounts vary widely by country and program with no figures. China Green Card investment thresholds published and specific. Confirmed by Shanghai Municipal Government and S.J. Grand (February 2025): Standard national track USD $2,000,000. Central China region USD $1,000,000. Western China / poverty alleviation regions USD $500,000. State-encouraged industries (AI, green energy, advanced manufacturing) USD $500,000. All must be maintained for 3 consecutive years with clean tax record before applying for permanent residence.',
  'INVESTMENT TRACK THRESHOLDS (3 consecutive years, stable operations + clean tax record): Standard (any region) USD $2,000,000. Central China USD $1,000,000. Western China / poverty alleviation counties USD $500,000. State-encouraged industries (AI, green energy, manufacturing) USD $500,000. No passive real estate purchase qualifies. Active business investment with documented operations required. Good health, clean criminal record, law-abiding in China, no immigration violations. EMPLOYMENT TRACK ELIGIBILITY: Deputy GM, Deputy Factory Director, or higher rank. Employed at qualifying institution: State Council body, high-tech enterprise, advanced FIE, export-oriented FIE. 4 consecutive years of qualifying employment. 3 of those years physically spent in China. Strong tax payment record (annual IIT meeting minimum thresholds; e.g., CNY 177,221 in Shanghai). 6+ months in China per year. No criminal record, good health.',
  'Investment: USD $500k-$2M (region-dependent), 3 years stable operations, leads directly to Permanent Residence (Green Card). Employment: 4 years senior role, 3 years in China, strong tax record. Extremely selective - only ~15k issued in 20 years',
  'NO PASSIVE REAL ESTATE INVESTMENT ROUTE: Original real estate purchase or capital transfer is wrong for China. China does NOT offer golden visa through residential real estate purchase or passive capital transfer. Green Card requires active, operational business investment with stable operations over 3 years. Buying apartment or transferring money to bank account does NOT qualify. Fundamental distinction from programs in Portugal, Greece, Brazil, or other countries. Marketing materials promoting Yunnan Golden Visa through real estate considered misleading by immigration experts. EMPLOYMENT ROUTE TO GREEN CARD - MISSING FROM ORIGINAL: Beyond investment route, certain senior employees can qualify for Chinese Green Card: Deputy General Manager, Deputy Factory Director, or above. Employed at qualifying Chinese institution (State Council body, high-tech enterprise, FIE in encouraged sectors). Must have worked in China for 4 consecutive years, with at least 3 years physically in China. Strong tax record (annual IIT meeting minimum thresholds - Shanghai raised this to CNY 177,221 in IIT per year as of 2025). 6+ months per year in China for Shanghai. Demanding but real alternative to investment route for long-term senior executives. SPECIAL CONTRIBUTION ROUTE AND CITIZENSHIP REALITY: Special Contribution Green Card - For those who have made outstanding contributions to China in science, technology, culture, or sports, or who are specially needed. Requires formal letter of recommendation from Chinese government. CITIZENSHIP: Even holding Green Card does NOT lead to Chinese citizenship for most foreigners. China Nationality Law grants citizenship only under exceptional circumstances - only few hundred foreigners have ever been naturalized as Chinese citizens since PRC founding. China does NOT permit dual citizenship - accepting Chinese citizenship requires renouncing all other nationalities. Fundamental difference from every other country in this series.',
  'Shanghai (best case): 90 working days for initial review. Other regions / complex cases: 6 months to 1+ year. COVID backlogs (residual): Some improvement noted in 2024-2025. Original 3-12 months broadly in range for processing but mischaracterizes this as temporary visa with renewal options. It is permanent residence permit with 10-year validity - single outcome, not step in longer process.',
  'Investment capital required (Investment Track): USD $500,000 to $2,000,000 depending on region and industry sector. Green Card application: no official fee for application itself. Legal assistance (highly recommended for investment structuring and application): USD $5,000-$20,000+. Business registration and compliance costs: varies widely by business structure and sector USD $5,000-$50,000+. Annual tax compliance and accounting: USD $3,000-$10,000+/year. Medical examination: CNY 500-1,000 (approximately USD $70-$140). Document notarization and authentication: USD $200-$500. Living costs during application period: USD $1,500-$3,000/month in tier-1 cities.',
  'Shanghai best case: 90 working days for initial review. Other regions / complex cases: 6 months to 1+ year. COVID backlogs residual: Some improvement noted in 2024-2025. Original 3-12 months broadly in range for processing but mischaracterizes this as temporary visa with renewal options. It is permanent residence permit with 10-year validity - single outcome, NOT step in longer process.',
  'Green Card validity: 10 years (5 years for under 18); renewable. Benefits: Live and work in China without visa or permit renewals; enter/exit China without visa; access to some social services; easier banking and business procedures. Family: Spouse and unmarried children under 18 may apply concurrently. Issued per year: Fewer than 1,000 on average (one of world lowest approval rates). Citizenship: NOT guaranteed by Green Card. Effectively unavailable for most foreigners. Requires renouncing all other nationalities. No dual citizenship recognized by PRC. EXTREME SELECTIVITY: China permanent residence system described by FDI China and CitizenX (2025) as one of world most restrictive. Approximately 15,000 permits issued in approximately 20 years since program establishment in 2004. For comparison, Canada issues over 400,000 PRs per year. Multiple reasons: strict criteria, extensive documentation, local authority discretion, China general policy of limiting long-term foreign presence. Applications in less-developed regions or requiring extensive verification can take well beyond 6 months; Shanghai best-case processing 90 working days. VALIDITY MISFRAMED: Original stated May be 1-5 years initially with renewal options. Often provides path to permanent residence. Chinese investor pathway leads directly to permanent residence - there is NO temporary investor visa step that converts into PR. Chinese Green Card valid for 10 years (5 years for those under 18). It IS permanent residence permit, not stepping stone to it. Fundamental structural mischaracterization could mislead applicants about what they are applying for.',
  'https://english.shanghai.gov.cn/en-GettingPermanentResidency',
  '2026-03-01'
);
