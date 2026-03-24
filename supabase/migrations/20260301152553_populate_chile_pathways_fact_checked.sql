/*
  # Populate Chile Immigration Pathways - Fact-Checked

  1. Summary
    - Adds comprehensive, fact-checked immigration pathways for Chile
    - Based on official SERMIG (serviciomigraciones.cl) sources (verified March 2026)
    - Reflects Law 21.325 (2021) and Decree 177 (2022) - complete overhaul of immigration system
    - CRITICAL CORRECTIONS: No dedicated digital nomad visa; old "Visa Sujeta a Contrato" discontinued
    - Work pathway uses Residencia Temporal (16 subcategories), not old rigid contract visa
    - Processing times severely understated in most sources: 6-12+ months reality

  2. Content Details
    - Work: Residencia Temporal for lawful remunerated activities (replaces old contract visa)
    - Study: Residencia Temporal for students (4-5 months processing, CRUCH fast-track option)
    - Digital Nomad: DOES NOT EXIST - clarifies tourist status or Residencia Temporal workaround
    - Retirement: Jubilados y Rentistas (USD $1,000-$1,500/month, no age minimum for rentistas)
    - Investor: USD $500,000 minimum, InvestChile endorsement mandatory, Start-Up Chile alternative
    - Family: Reagrupación Familiar (for PR/citizen sponsors), Dependiente (for temp resident sponsors)

  3. Important Notes
    - All data verified against SERMIG, InvestChile, Chambers & Partners Chile 2025
    - Law 21.325 improvements: dependents may now work, more flexible work permits
    - Most applications must be from outside Chile (family reunification is exception)
    - Severe processing backlogs: 6-12+ months across most permit types
    - After 2 years temp residence + 185 days/year presence → Residencia Definitiva (PR)
    - After 5 years total legal residency → citizenship (dual citizenship recognized)
*/

-- Delete any existing Chile pathways to avoid duplicates
DELETE FROM immigration_pathways WHERE destination_slug = 'chile';

-- ═══════════════════════════════════════════════════════════════════════════
-- WORK: Residencia Temporal (Actividades Remuneradas Lícitas)
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
  'chile',
  'Work',
  'Work',
  'Chile Work Authorization — Residencia Temporal (Subcategoría: Actividades Remuneradas Lícitas)',
  'Chile 2022 immigration framework replaced all previous work visa categories with single Residencia Temporal for lawful remunerated activities. Old Visa Sujeta a Contrato (subject-to-contract visa) that tied worker rigidly to specific employer has been DISCONTINUED. New system more flexible: workers no longer required to include return-travel clause in contracts, and contract termination no longer means automatic visa loss. Foreign worker may now change employers freely without notifying SERMIG, while maintaining valid temporary residence. Minimum salary must exceed Chile legal minimum wage (approximately USD $530/month in 2025-2026); in practice, SERMIG verifies offer is market-competitive. No formal academic qualification requirements, though regulated professions (medicine, law) require separate professional authorization. Processing currently running 6-8 months due to backlogs from 2022 law transition. Key 2022 improvement: dependents of temporary residents may now work, reversing old prohibition.',
  'Valid employment offer or contract from Chilean-registered employer. Salary must exceed Chilean minimum wage (~USD $530/month); in practice, market-rate salary expected. No formal academic credential requirement, but regulated professions (medicine, law, engineering) require professional authorization from Chilean authorities. Clean criminal record from country of origin and any country of residence in past 5 years. Valid passport (12+ months validity recommended). Apply from outside Chile (from consulate in country of residence). Exception: family reunification and humanitarian subcategories may apply from within Chile.',
  'Valid employment offer from Chilean employer; salary above minimum wage (~USD $530/month); clean criminal record; passport; apply from outside Chile via consulate',
  'Signed employment contract (signed before Chilean or foreign notary/attorney); valid passport; criminal background certificate (apostilled/legalized, translated to Spanish); passport photo (color, white background); application submitted through SERMIG Portal de Trámites Digitales; visa fee (varies by nationality: USD $0-$2,700). On arrival in Chile: Register with PDI (border police). Obtain RUT (tax ID) from SII. Register at Civil Registry within 30 days for Cédula de Identidad Extranjera (foreigner ID card). GLOBAL TALENT STREAM EQUIVALENT: Start-Up Chile (CORFO) fast-track - SERMIG, InvestChile, CORFO Start-Up Chile accelerator have agreement to expedite immigration processing for entrepreneurs and highly specialized technical staff accepted into Start-Up Chile programs. Provides materially faster track outside regular backlogged queue. WORK PERMIT AS TOURIST (PET): Chile offers Permiso de Trabajo como Turista (PET) - work authorization for tourists needing to perform specific, sporadic paid activities (advisors, technical experts, public show performers). NOT residence permit. Processing 7-10 business days. Useful for short business trips requiring remunerated activities.',
  'Current reality (2025-2026): Standard 6-8 months; can extend to 10-12+ months in complex cases; Emergency/expedited (CORFO/InvestChile path) 3-4 months; PET (tourist work permit, short-term) 7-10 business days. Older sources citing 20-30 days or 1-3 months are outdated pre-2022 figures. Apply well in advance.',
  'Application fee varies by nationality: USD $0-$2,700. Document costs (apostille, notarization, translation): USD $100-$300. PET (tourist work permit): approximately USD $100. Legal assistance (optional but recommended): USD $500-$1,500. Tax note: Non-Chilean nationals taxed only on Chilean-source income during first 3 years of residency. 3-year extension of foreign-income exemption may be requested. After that, worldwide income may be taxable in Chile.',
  'Current reality 2025-2026: Standard processing 6-8 months. Can extend to 10-12+ months in complex cases. Emergency/expedited via CORFO/InvestChile path: 3-4 months. PET tourist work permit short-term: 7-10 business days. Older sources citing 20-30 days or 1-3 months are outdated pre-2022 figures. Workers cannot legally work in Chile until permit approved. Some employers arrange remote work from home country during processing. Apply well in advance.',
  'Residencia Temporal: Up to 2 years, renewable for up to 2 additional consecutive years. Change employer: Freely, without notifying SERMIG - major improvement under Law 21.325. Residencia Definitiva (PR): After 2 years of Residencia Temporal with 185+ days/year physical presence in Chile. Citizenship: After 5 years total legal residency; Spanish language proficiency; civics knowledge; clean record. Process typically takes 1-2 additional years. Dual citizenship recognized. Dependents: Spouse and family members may now work under Law 21.325 (reverses old prohibition). Tax note: Non-Chilean nationals taxed only on Chilean-source income during first 3 years of residency. 3-year extension of foreign-income exemption may be requested. After that, worldwide income may be taxable in Chile.',
  'https://serviciomigraciones.cl/en/residencia-temporal-permit/',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- STUDY: Residencia Temporal (Estudiantes)
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
  'chile',
  'Study',
  'Study',
  'Chile Student Visa — Residencia Temporal (Subcategoría: Estudiantes de Establecimientos Reconocidos por el Estado)',
  'Correct formal name under Law 21.325 is Residencia Temporal for Students from State-Recognized Establishments. Core concept broadly correct, but several important specifics: 90-day threshold for when permit actually required, part-time work allowance (30 hours/week), correct processing time (4-5 months standard, not weeks), and critical fact that application must be made from outside Chile before traveling. Notable feature for short-term exchanges: programs of 180 days or less may use Permanencia Transitoria (tourist/transitory stay) rather than full student permit, avoiding longer process. Some Chilean universities (e.g., USM, Universidad de Chile) have CRUCH-SERMIG agreements to fast-track processing to 40 working days. 90-DAY THRESHOLD CRITICAL RULE: International students whose program is 90 days or less do NOT require student permit at all - enter on Permanencia Transitoria (tourist status, no prior visa for most nationalities). Programs between 91 and 180 days technically require Permanencia Transitoria but can use one-time extension (~USD $100 fee). Programs over 180 days require full Residencia Temporal student permit, which must be obtained before traveling to Chile.',
  'Enrollment or acceptance at State-recognized Chilean educational institution. Program must exceed 180 days (shorter programs = Permanencia Transitoria). Apply from outside Chile, through Chilean consulate before traveling. Must maintain regular student status (revocation if student status lost). Over 18: criminal background certificate required. Sufficient financial means to cover living expenses during study. Institution must be officially recognized by Chilean State (schools, universities, technical institutions accredited by Ministry of Education). All foreign documents must be apostilled or legalized and - if not in Spanish - translated by sworn translator (traductor oficial). Certificado de Alumno Regular (regular student certificate) or Certificado de Matrícula is mandatory document issued by institution.',
  'Enrollment at State-recognized Chilean institution; program over 180 days; apply from outside Chile via consulate; criminal record if over 18; financial means proof',
  'Valid passport; Certificado de Alumno Regular or Certificado de Matrícula from institution; criminal background certificate (applicants over 18; apostilled + translated to Spanish); passport photo (color, white background, JPG/PNG); proof of financial means; health insurance (recommended; sometimes required by institution); application via SERMIG Portal de Trámites Digitales from abroad. CRUCH-SERMIG FAST-TRACK AGREEMENTS: Several Chilean universities part of CRUCH-SERMIG agreement (Council of Chilean Universities + SERMIG) enabling abbreviated processing in no more than 40 working days (approximately 2 months). Students attending these institutions should ask international office to activate this agreement. Institutions include USM, Universidad de Chile, others in CRUCH network. Substantially improves on 4-5 month standard timeline. PART-TIME WORK ALLOWANCE: SERMIG explicitly states on official page - student permit holders are allowed to engage in lawful paid activities for up to 30 hours per week, without requiring additional authorization. Activities can be at institution where they study or for any other employer/contractor. Work rights active without separate work permit.',
  'Standard (no university agreement): 4-5 months minimum. CRUCH-SERMIG partner universities: Up to 40 working days (~2 months). Peak/backlog periods: Up to 6-12 months. Plan to apply at least 4-6 months before programme start. Do not enter Chile as tourist expecting to convert to student status - this is not permitted.',
  'Application fee: varies by nationality (USD $0-$2,700). Document costs (apostille, notarization, sworn translation): USD $100-$300. Health insurance (if required by institution): USD $200-$600/year. Living expenses: Estimate USD $800-$1,200/month depending on city. Santiago higher; regional areas cheaper. One-time extension for programs 91-180 days: approximately USD $100.',
  'Standard no university agreement: 4-5 months minimum processing. CRUCH-SERMIG partner universities: Up to 40 working days approximately 2 months. Peak backlog periods: Up to 6-12 months. SERMIG official guidance confirmed by Universidad Técnica Federico Santa María (USM) states standard first-resolution processing takes at least 4 to 5 months. Universidad de Chile reports approximately 2 months at their institution through CRUCH-SERMIG agreement. Students should apply 4-6 months before program start date. Do not rely on tourist status and attempt to convert within Chile - this is NOT permitted for long-term studies.',
  'Duration: Up to 2 years; renewable if still enrolled. Revocation: Permit revoked if regular student status lost (with force majeure exceptions). Work rights: Up to 30 hours/week in any sector - no additional permit needed. Dependents: Spouse and qualifying family may apply for dependent status; they can also work under Law 21.325. After graduation: Apply for work-category Residencia Temporal with job offer → Residencia Definitiva after 2 years → Citizenship after 5 years total. Dual citizenship recognized. Unlike Canada structured PGWP, Chile does NOT have dedicated post-graduation open work permit. However, graduates may apply for Residencia Temporal for lawful remunerated activities if secure job offer, or apply for Residencia Definitiva after meeting 2-year/185 days/year presence requirement.',
  'https://serviciomigraciones.cl/en/residencia-temporal-permit/subcategories/students/',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- DIGITAL NOMAD: DOES NOT EXIST (workarounds available)
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
  'chile',
  'Digital Nomad',
  'Digital Nomad',
  'Chile "Digital Nomad Visa" — Does Not Exist as Dedicated Category',
  'CRITICAL CORRECTION: Multiple authoritative sources - including Chambers & Partners Chile 2025, Holafly 2025, Expat.cl - confirm that Chile has NO specific digital nomad visa. Absence of dedicated category has been described by Chilean immigration legal experts as creating state of legal limbo for remote workers. That said, Chile is NOT hostile to digital nomads - two practical routes exist that most remote workers use depending on planned length of stay: (1) Permanencia Transitoria (tourist status) for stays up to 90 days (extendable once to 180 days), and (2) general Residencia Temporal for lawful remunerated activities for longer stays, which requires proof of income from foreign employer via civil service contract signed by Chilean or foreign attorney-in-fact resident in Chile. SHORT STAYS (up to 90-180 days): Most nationalities enter Chile visa-free and receive Permanencia Transitoria for 90 days. Can be extended once for additional 90 days (total 180 days) for approximately USD $100 fee, processed at SERMIG offices in Santiago. Remote workers employed by foreign companies generally understood to not be entering Chilean labor market while on tourist status - but this is NOT explicitly codified as it is in Canada.',
  'SHORT STAYS: Tourist status (Permanencia Transitoria) - most nationalities enter visa-free for 90 days, extendable once to 180 days total (~USD $100). Remote work for foreign employers generally understood acceptable on tourist status but NOT explicitly codified. LONGER STAYS: Residencia Temporal for remunerated activities requires civil service contract (contrato de prestación de servicios) with company NOT domiciled in Chile, signed by Chilean attorney-in-fact (or foreign attorney-in-fact resident in Chile). Income requirement approximately USD $1,000/month from foreign sources (bank statements or payslips covering last 3-6 months). Processing 6-8 months. Valid up to 2 years, renewable. RENTISTA/RETIREMENT VISA ALTERNATIVE: Digital nomads with passive income (dividends, rental income, investments) earning approximately USD $1,000-$1,500/month may be better served by Residencia Temporal for Retired Persons and Leasers (Rentista/Jubilado). Does NOT require employment contract at all - only proof of consistent passive income. Provides same 2-year permit, work rights, PR pathway.',
  'No dedicated digital nomad visa exists. SHORT STAYS: Tourist status 90-180 days, work for foreign employers only. LONGER STAYS: Residencia Temporal with foreign contract ~USD $1k/month, or Rentista visa for passive income',
  'SHORT STAYS (tourist status): Valid passport; return/onward ticket (may be requested); proof of financial means (informal). Extension to 180 days: approximately USD $100 fee at SERMIG Santiago. LONGER STAYS (Residencia Temporal for remunerated activities): Civil service contract (contrato de prestación de servicios) with company NOT domiciled in Chile; contract signed by Chilean attorney-in-fact or foreign attorney-in-fact resident in Chile; bank statements or payslips showing approximately USD $1,000/month income from foreign sources for last 3-6 months; passport; criminal background certificate (apostilled + Spanish translation); passport photo; application via SERMIG Portal de Trámites Digitales from outside Chile. RENTISTA/RETIREMENT ALTERNATIVE: Proof of consistent passive income (rental, dividends, investments) approximately USD $1,000-$1,500/month; no employment contract needed; same 2-year permit. WORKING HOLIDAY PROGRAM (IEC equivalent): Chile participates in bilateral Working Holiday agreements with Australia, Canada, Germany, Denmark, France, Ireland, New Zealand, Norway, Portugal, Sweden, South Korea, others. Eligible nationals (generally ages 18-30 or 35) can work in Chile for 1-2 years on open work permit. Popular, fast alternative for younger digital nomads from eligible countries.',
  'SHORT STAYS (tourist): Immediate visa-free entry for most nationalities; 90 days granted at border; extension to 180 days processed in ~1-2 weeks at SERMIG Santiago. LONGER STAYS (Residencia Temporal): 6-8 months processing standard; can extend to 10-12 months. Apply from outside Chile. Working Holiday: 2-8 weeks processing depending on nationality.',
  'SHORT STAYS: Tourist entry free for most nationalities; extension to 180 days approximately USD $100. LONGER STAYS (Residencia Temporal): Application fee varies by nationality USD $0-$2,700; document costs (apostille, notarization, translation) USD $100-$300; legal assistance (recommended for contract preparation) USD $500-$1,500. TAX: Staying in Chile more than 183 days in calendar year may trigger Chilean tax residency, subjecting worldwide income to Chilean income tax (progressive up to 40% on employment income; Global Complementary Tax up to 35% on investment income). IMPORTANTLY: Non-Chilean nationals enjoy 3-year foreign income exemption during first 3 years of residency (extendable by another 3 years on request). After that, worldwide income may become taxable in Chile. Chile has double taxation treaties with US and many European countries.',
  'SHORT STAYS tourist status: Immediate visa-free entry for most nationalities 90 days granted at border. Extension to 180 days processed approximately 1-2 weeks at SERMIG Santiago offices for approximately USD $100 fee. LONGER STAYS Residencia Temporal for remunerated activities: 6-8 months processing standard, can extend to 10-12 months. Must apply from outside Chile through consulate. Working Holiday program: 2-8 weeks processing depending on nationality and bilateral agreement terms.',
  'SHORT STAYS (tourist): 90 days initial; extendable once to 180 days total. NOT path to permanent residence. LONGER STAYS (Residencia Temporal): Up to 2 years initial; renewable for additional 2 years. Residencia Definitiva (PR) after 2 years with 185+ days/year physical presence. Citizenship after 5 years total legal residency; Spanish proficiency; civics test. Dual citizenship recognized. TAX RESIDENCY THRESHOLD: 183+ days in calendar year triggers Chilean tax resident status. Non-Chilean nationals enjoy 3-year foreign income exemption during first 3 years residency (extendable another 3 years on request). After that, worldwide income may become taxable. Chile has double taxation treaties with US and many European countries. WORKING HOLIDAY: 1-2 years depending on bilateral agreement; open work permit for any Chilean employer; ages 18-30 or 35; eligible countries include Australia, Canada, Germany, Denmark, France, Ireland, New Zealand, Norway, Portugal, Sweden, South Korea.',
  'https://serviciomigraciones.cl/en/residencia-temporal-permit/',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- RETIREMENT: Jubilados y Rentistas
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
  'chile',
  'Retirement',
  'Retirement',
  'Chile Retirement / Rentista Visa — Residencia Temporal (Jubilados y Rentistas)',
  'Unlike Canada and Australia, Chile DOES have retirement/passive income visa. Formal name under Law 21.325 is Residencia Temporal for Retired Persons or Leasers (Jubilados y Rentistas) - covers two groups: (1) jubilados - persons receiving pension/retirement income, and (2) rentistas - persons with recurring income from real estate, financial investments, dividends, annuities, royalties, or similar passive sources. You do NOT need to be officially retired - many working-age applicants qualify via investment income. This visa ALSO allows work in Chile (separate work permit or notification to SERMIG needed, but not independent visa). Processing in 2025-2026 running 6-12+ months, not 1-3 months cited by older sources. INCOME THRESHOLD: SERMIG does not publish official minimum. Real-world standard approximately USD $1,000/month per applicant (USD $1,500 recommended to reduce scrutiny). Additional USD $500-$600/month per dependent expected. Original $1,000/month figure correct as minimum but may be insufficient for Santiago (higher cost of living); regional areas cheaper. SERMIG evaluates sufficiency relative to intended place of residence. NO MINIMUM AGE REQUIREMENT: Rentista option open to all ages - any person receiving qualifying passive income may apply regardless of age.',
  'Stable, recurring income from pension, investments, real estate, dividends, annuities, royalties, or similar passive sources. Recommended: USD $1,000-$1,500/month (single); USD $500-$600 additional per dependent. No minimum age requirement. No official minimum income threshold - SERMIG evaluates sufficiency based on intended location. Clean criminal record (last 5 years). Valid passport. Apply from outside Chile. WORK PERMITTED: Holders of jubilado/rentista Residencia Temporal MAY work in Chile. Separate work permit or additional notification to SERMIG may be required for some forms of employment, but visa itself does NOT prohibit working. Makes it one of most flexible Chilean visas - retiree or passive-income holder can start business, invest, or take employment without needing separate work visa.',
  'Stable passive income USD $1k-$1.5k/month (pension, investments, rental, dividends); no minimum age; clean criminal record; apply from outside Chile; work permitted on this visa',
  'FOR PENSIONERS (jubilados): Last 3 monthly pension payment receipts (apostilled/legalized); OR Certificate from home country consul certifying pension amount in CLP or USD. FOR PERSONS OF INDEPENDENT MEANS (rentistas): Lease contracts, investment account statements, dividend records, or similar documents proving recurring income; documents notarized before Chilean notary. BOTH: Valid passport; criminal background certificate (apostilled + Spanish translation); passport photo. Application via SERMIG Portal de Trámites Digitales from outside Chile. PHYSICAL PRESENCE REQUIREMENT FOR RESIDENCIA DEFINITIVA: To qualify for permanent residence after 2 years of Residencia Temporal, must have been physically present in Chile for at least 180-185 days per year. Each day outside Chile reduces eligible residency count. If fail to meet requirement in given year, can apply for 1-year extension once, but must restart if requirement not met. Hard constraint for those who plan to travel extensively during Chilean residency.',
  'Current reality (2025-2026): Standard 6-8 months; complex cases/document issues 12-14 months. Older sources cite 30-90 days or 1-3 months - these reflect pre-2022 law timelines and no longer accurate. Entire application done online through SERMIG portal before travel. No initial visit to Chile required.',
  'Application fee varies by nationality: USD $0-$2,700. Document costs (apostille, legalization, notarization, sworn translation): USD $100-$300. Legal assistance (optional but recommended): USD $500-$1,500. Proof of income documentation: varies by source (bank statements, pension statements, investment account statements). No capital transfer required - only proof of recurring income. Living expenses in Chile: USD $1,200-$2,000/month comfortable lifestyle Santiago; USD $800-$1,200/month regional areas.',
  'Current reality 2025-2026: Standard processing 6-8 months. Complex cases or document issues: 12-14 months. Expat.cl 2025 reports average processing times of 6-8 months, sometimes up to 12-14 months due to SERMIG backlogs since 2022 law transition. Apply well in advance and do not plan to enter Chile on tourist visa and begin process there - this category requires application from outside Chile (unlike family reunification which can apply from within). Older sources citing 1-3 months outdated.',
  'Initial permit: 1 year. Renewal: Up to 2 additional consecutive years. Work rights: Permitted (separate authorization may be needed). Residencia Definitiva: After 2 years of Residencia Temporal + 185 days/year physical presence. Citizenship: After 5 years total legal residency; Spanish proficiency; civics test. Permanent residence: Valid indefinitely as long as not absent from Chile for more than 2 consecutive years. Dual citizenship: Recognized - no need to renounce prior nationality. Family: Spouse and qualifying children can apply for dependent status; dependents may also work under Law 21.325. VALIDITY CORRECTED: Under Decree 177, retirement/rentista Residencia Temporal initially issued for 1 year. Can be extended for additional 1-year increments. After 2 years of holding Residencia Temporal with required physical presence (185+ days/year in Chile), holder can apply for Residencia Definitiva (permanent residence). Note: permit cannot be extended beyond two consecutive renewal years - after that, applicants must demonstrate continued income and restart cycle or move to permanent residence.',
  'https://serviciomigraciones.cl/en/residencia-temporal-permit/subcategories/retired-and-leasers/',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- INVESTOR: Inversionistas y Personal Relacionado
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
  'chile',
  'Investor',
  'Investor',
  'Chile Investor Visa — Residencia Temporal (Subcategoría: Inversionistas y Personal Relacionado)',
  'Under Decree 177 of 2022, Chile investor visa has two distinct tracks with clear criteria. TRACK 1 (Individual Investor): minimum investment of USD $500,000 in active business project, company acquisition, or real estate development with economic activity. Requires endorsement from InvestChile (Chile official FDI promotion agency) before applying to SERMIG. TRACK 2 (Senior Executive/Manager): senior managers, directors, specialized technical staff of foreign companies holding at least 10% voting rights in Chilean subsidiary also qualify under this subcategory, without personal investment threshold. Chile does NOT have traditional golden visa through passive real estate purchase - investment must involve active economic activity. Permit initially lasts 1-2 years with renewals conditioned on demonstrated investment progress; SERMIG actively audits compliance. USD $500,000 MINIMUM INVESTMENT: Threshold under Decree 177 and confirmed by InvestChile website. Applies to business investments, company acquisitions, or real estate development projects with active economic activity - passive real estate purchase (buying apartment) does NOT qualify on its own. Smaller startup investments (USD $60k-$75k) may be considered case-by-case for innovative high-growth startups, but do NOT guarantee approval and provide less clear path to PR.',
  'TRACK 1 (Individual Investor): Minimum investment USD $500,000 in active business project, company acquisition, or real estate development with economic activity in Chile. Obtain Carta de Patrocinio from InvestChile (mandatory pre-approval step). Submit detailed investment project to InvestChile: objectives, business plan, economic benefit for Chile. Valid passport (12+ months validity). Criminal background certificate (apostilled + Spanish translation). Proof of investment capability (bank statements, investment agreements). Apply via SERMIG portal from outside Chile. TRACK 2 (Senior Executive/Manager): Foreign company must control at least 10% voting rights (or equivalent ownership) of Chilean company. Applicant must hold executive, director, or senior management role at Chilean subsidiary. Alternatively: specialized technical personnel contracted to provide services to Chilean entity. No personal USD $500,000 investment required for this track. Same document requirements as Track 1. Employment documentation and proof of ownership link required.',
  'TRACK 1: USD $500k investment in active business, InvestChile endorsement mandatory. TRACK 2: Senior executive/manager of foreign company with 10%+ ownership in Chilean subsidiary, no personal investment threshold',
  'TRACK 1: Detailed investment project proposal (objectives, business plan, economic benefit for Chile); Carta de Patrocinio from InvestChile (mandatory); proof of investment capability (bank statements, investment agreements, due diligence documentation); valid passport; criminal background certificate (apostilled + Spanish translation); passport photo; business registration documents; financial projections; application via SERMIG portal from outside Chile. TRACK 2: Employment contract or appointment letter from foreign parent company; documentation proving foreign company controls at least 10% voting rights in Chilean subsidiary; organizational chart; valid passport; criminal background certificate; passport photo. INVESTCHILE ENDORSEMENT MANDATORY: All investor visa applications for Track 1 must first obtain Sponsorship Letter (Carta de Patrocinio) from InvestChile - Chile foreign investment promotion agency. InvestChile evaluates whether investment project aligns with Chile economic interests. Only after receiving InvestChile letter does applicant submit to SERMIG for immigration permit itself. Two-step process adds considerable time. START-UP CHILE (CORFO) ALTERNATIVE: Entrepreneurs accepted into Start-Up Chile - CORFO seed accelerator program for tech startups - qualify for expedited investor/entrepreneur visa track. No USD $500,000 investment required for this path; acceptance into Start-Up Chile program is qualifier. Start-Up Chile has agreement with SERMIG and InvestChile to fast-track immigration processing. Most accessible investor immigration route for early-stage technology entrepreneurs.',
  'InvestChile evaluation: 1-3 months. SERMIG visa processing (after InvestChile letter): 3-6 months. Total estimated timeline: 4-9 months. Start-Up Chile fast-track: ~2-4 months (expedited agreement). Application fees vary by nationality: USD $0-$2,700.',
  'Investment capital required (Track 1): USD $500,000 minimum. Application fees vary by nationality: USD $0-$2,700. Document costs (apostille, legalization, notarization, translation): USD $200-$500. Legal assistance (highly recommended for investment structuring and InvestChile application): USD $3,000-$10,000+. Business plan preparation (if outsourced): USD $2,000-$5,000. Due diligence and corporate structuring: varies by complexity USD $5,000-$20,000+. Annual compliance costs (accounting, tax filing, audit documentation for SERMIG renewals): USD $2,000-$5,000/year.',
  'InvestChile evaluation: 1-3 months for Carta de Patrocinio approval. SERMIG visa processing after InvestChile endorsement letter: 3-6 months. Total estimated timeline: 4-9 months from project submission to permit. Becker Abogados 2024 confirms SERMIG approval takes 3-6 months after InvestChile endorsement. Initial permit valid for 1 year, then renewable for additional year, then Residencia Definitiva at 2 years. Start-Up Chile fast-track for CORFO program participants: approximately 2-4 months expedited processing.',
  'Initial permit: 1-2 years. Renewal: Subject to demonstrating investment progress; SERMIG audits compliance at each renewal - investors must demonstrate progress on investment project (financial reports, business activity documentation, tax filings via SII). Failure to demonstrate adequate progress can result in permit denial or revocation at renewal. Explicitly confirmed by TheLatinvestor (September 2025) and Expat.cl 2025. Investors who cannot show ongoing business activity will lose residency status. Residencia Definitiva: After 2 years with 185+ days/year presence + demonstrated investment activity. Citizenship: After 5 years total legal residency; Spanish + civics test; dual citizenship recognized. Family: Spouse and dependent children can apply for dependent status and may work under Law 21.325. NOTE: No passive real estate investor (golden visa) route exists. All investment must demonstrate active economic contribution. Chile does NOT have traditional golden visa through passive real estate purchase - investment must involve active economic activity.',
  'https://serviciomigraciones.cl/en/residencia-temporal-permit/subcategories/investors/',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- FAMILY: Reagrupación Familiar
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
  'chile',
  'Family Reunification',
  'Family',
  'Chile Family Reunification Visa — Residencia Temporal (Reagrupación Familiar)',
  'Formal name under Law 21.325 is Residencia Temporal de Reagrupación Familiar. Eligibility more specific than any resident - requires family tie to either Chilean citizen or foreigner holding Residencia Definitiva (permanent residence). Family members of holders of temporary residence (not permanent) apply instead under Dependent Status (Calidad de Dependiente) mechanism, not formal family reunification category. Original family relationship with temporary or permanent resident is technically imprecise. Major 2022 improvement: same-sex relationships fully recognized (same-sex marriage since 2022, civil unions since 2015). Dependent permit holders may now work. Uniquely among Residencia Temporal categories, family reunification CAN be applied from within Chile as well as from abroad. ELIGIBILITY PRECISION: Family Reunification (Reagrupación Familiar) specifically requires tie to Chilean citizen or Residencia Definitiva (permanent resident) holder. Family members of temporary residents apply via separate Dependent Status (Dependiente) mechanism, which has different procedural requirements including notarized affidavit of financial support from holder. Confirmed by SERMIG official pages and Chilean immigration law (Law 21.325).',
  'SPONSOR must be: Chilean citizen or Residencia Definitiva (permanent residence) holder. APPLICANT must be: Spouse/civil partner, child <18, disabled child, unmarried child <24 studying, or minor in guardianship. Same-sex: Fully recognized via AUC or marriage. FOR DEPENDENTS OF TEMPORARY RESIDENTS: Sponsor must sign notarized affidavit assuming financial responsibility and demonstrate sufficient economic resources (Ministry of Social Development standards). Application uses Dependent Status mechanism, not Reagrupación Familiar. Qualifying family relationships under Law 21.325: Spouse in official marriage; Civil partner (equivalent to marriage, including AUC same-sex unions); Children under 18; Children with disabilities (any age); Unmarried children under 24 who are studying; Minors under personal care or guardianship. For family members of temporary residents (not PR holders), Dependent Status mechanism also includes parents and other relatives in specific circumstances. Language NOT requirement for family reunification - integration support available via SERMIG.',
  'Sponsor must be Chilean citizen or PR holder. Applicant: spouse/partner, child <18, disabled child, unmarried child <24 studying, minor in guardianship. Same-sex fully recognized. Can apply from within Chile',
  'Valid passport (or national ID for Bolivians per bilateral agreement); marriage certificate, civil union certificate, or birth certificate (apostilled/legalized + Spanish translation if not in Spanish); passport photo (color, white background); criminal background certificate for applicants over 18 (apostilled + translated); proof of family relationship between sponsor and applicant; FOR DEPENDIENTE: notarized affidavit from sponsor assuming costs; proof of sponsor sufficient financial resources; application via SERMIG portal (can apply from within Chile for this category). CAN APPLY FROM WITHIN CHILE - IMPORTANT EXCEPTION: Unlike most Residencia Temporal subcategories that require application from outside Chile, family reunification and humanitarian reasons explicitly excepted and may be applied from within Chile (Law 21.325, Article 4, Decree 177). Means family member who is already in Chile as tourist can apply for family reunification status without leaving. Significant practical advantage. SAME-SEX RELATIONSHIPS FULLY RECOGNIZED: Chile recognized same-sex civil unions (Acuerdo de Unión Civil / AUC) since 2015 and same-sex marriage since 2022. Both explicitly recognized for family reunification and dependent status purposes under Law 21.325. Partner in same-sex civil union or marriage from abroad qualifies for sponsorship.',
  'Current reality (2025-2026): Standard 6-8 months; incomplete or incorrect documents up to 12 months. Ensure all documents correctly apostilled/legalized AND translated into Spanish by sworn (oficial) translator. Incorrect documents leading cause of delays and rejections.',
  'Application fee varies by nationality: USD $0-$2,700. Document costs (apostille, legalization, translation by sworn translator): USD $150-$400. Legal assistance (optional): USD $500-$1,200. No income requirement for applicant, but sponsor (if temporary resident supporting dependent) must demonstrate sufficient financial resources per Ministry of Social Development standards.',
  'Current reality 2025-2026: Standard processing 6-8 months. Incomplete or incorrect documents: up to 12 months. Expat.cl 2025 reports family reunification visa takes approximately 6-8 months under current SERMIG conditions, extending to 12 months if documents incorrect, missing apostilles, or not properly translated. Older sources cite 30-90 days reflecting pre-2022 timelines. KEY: Ensure all documents correctly apostilled/legalized AND translated into Spanish by sworn oficial translator. Incorrect documents leading cause of delays and rejections.',
  'Initial permit: 1 year (renewable annually until qualifying for PR). Work rights: Permitted for all permit holders (Law 21.325 improvement - under old regime pre-2022, family members on dependent visas prohibited from working. Law 21.325 reversed this entirely. Holders of family reunification permits and dependent status MAY perform remunerated activities without needing independent work permit. Chambers & Partners Chile 2025 confirms as key improvement encouraging family relocation). Permit tied to sponsor: Dependent permit validity conditioned on holder permit; divorce does not automatically affect legal status but may impact renewals. Residencia Definitiva: After 2 years of Residencia Temporal + 185+ days/year physical presence. Citizenship: After 5 years total legal residency; Spanish proficiency; civics knowledge test. Dual citizenship: Recognized - no renunciation of prior nationality required.',
  'https://serviciomigraciones.cl/en/residencia-temporal-permit/subcategories/family-reunification/',
  '2026-03-01'
);
