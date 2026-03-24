/*
  # Populate Colombia Immigration Pathways - Fact-Checked

  1. Summary
    - Adds comprehensive, fact-checked immigration pathways for Colombia
    - Based on official Cancillería Resolution 5477/2022, Migración Colombia sources (verified March 2026)
    - CRITICAL CORRECTION: Digital nomad income threshold wrong - "$684/month" outdated; correct 2025 threshold is ~$1,100/month (3× SMMLV)
    - Original only had digital nomad visa - missing Work, Study, Retirement/Rentista, and Investor pathways entirely
    - All thresholds denominated in SMMLV (Salario Mínimo Mensual Legal Vigente) which increases annually

  2. Content Details
    - Digital Nomad: V-Nómada Digital (Type V Visitor) - income threshold corrected to 3× SMMLV (~$1,100/month in 2025)
    - Work: M-Trabajador (Type M Migrant) - employer solvency 100× SMMLV, counts toward 5-year PR pathway
    - Study: M-Estudiante (degree programs) & V-Intercambio Académico (language/exchange) - 10 hours/week minimum
    - Retirement: M-Pensionado (lifetime pension, Type M) & V-Rentista (passive income, Type V) - both 3× SMMLV
    - Investor: M-10 Real Estate (350× SMMLV ~$120k) & M-6 Business (100× SMMLV ~$34k); direct R visa at 650× SMMLV

  3. Important Notes
    - All data verified against Cancillería, Migración Colombia, Colombia Law Connection, Nexo Legal
    - 2022 Resolution 5477 restructured entire visa framework into V (Visitor), M (Migrant), R (Resident)
    - Type M visas count toward 5-year permanent residence pathway; Type V visas do not
    - All SMMLV thresholds increase annually (8-12% recent years) - 2025 SMMLV = COP 1,423,500 (~USD $340/month)
    - Banco de la República FDI registration mandatory for all investor visas - most commonly missed step
    - Cédula de Extranjería registration within 15 days mandatory for all visa holders
    - Tax residency trigger: 183 days in any 12-month rolling period
*/

-- Delete any existing Colombia pathways to avoid duplicates
DELETE FROM immigration_pathways WHERE destination_slug = 'colombia';

-- ═══════════════════════════════════════════════════════════════════════════
-- DIGITAL NOMAD: V-Nómada Digital (Type V Visitor Visa)
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
  'colombia',
  'Digital Nomad',
  'Digital Nomad',
  'Colombia Digital Nomad Visa — V-Nómada Digital (Type V Visitor Visa)',
  'Original card describes Colombia Digital Nomad Visa correctly in broad strokes - exists, 2-year visa for remote workers earning from foreign sources. One of Colombia most accurate data points. However, INCOME THRESHOLD of $684+/month is outdated and WRONG for 2025. Correct threshold tied to SMMLV (Colombia minimum wage) and is now approximately USD $1,090-$1,100/month - SIGNIFICANTLY HIGHER than stated. Additionally, Requirements, Processing Time, and Validity fields appear empty in original card, leaving critical gaps. Visa classified as Type V (Visitor) visa - means time on it does NOT count toward 5-year requirement for permanent residence (R visa). Launched late 2022, become one of Latin America most popular nomad visas. NATIONALITY RESTRICTION: Only available to nationals of countries whose citizens are exempt from tourist visas for Colombia. If nationality requires tourist entry visa to visit Colombia (see Resolution 1128), that national NOT eligible for V-Nómada Digital. Vast majority of Western nationalities (US, Canada, UK, EU, Australia, Japan) qualify.',
  'National of visa-exempt country (US, Canada, UK, EU, Australia, etc.). Remote employee, freelancer, or entrepreneur working for foreign-based clients/employers. MONTHLY INCOME ≥ 3× SMMLV = approximately COP 4,270,500 (approximately USD $1,100) in 2025. Income must be from sources OUTSIDE Colombia - no Colombian clients or employers. Must not have violated Colombian immigration laws previously. Valid health insurance covering Colombia. CÉDULA DE EXTRANJERÍA REGISTRATION MANDATORY WITHIN 15 DAYS: After receiving visa and entering Colombia (or from visa issuance date if already in Colombia), holders must register with Migración Colombia and apply for Cédula de Extranjería (foreigner ID card) within 15 calendar days. Failure results in fines up to 7× monthly minimum wage. Cédula essential for opening bank accounts, signing leases, other daily activities. ALL digital nomad visa holders - not just M and R visa holders - must complete this step.',
  'National of visa-exempt country; remote work for foreign clients/employers; income ≥ 3× SMMLV (~$1,100/month in 2025); health insurance; Type V visa (does NOT count toward PR pathway)',
  'Valid passport (6+ months validity, 2+ blank pages). Passport-style photo (3×4 cm, white background, max 300 KB JPG). Bank statements - last 3 months showing ≥ approximately $1,100 USD/month from foreign sources. Proof of remote work: employer letter (English/Spanish), client contracts, or entrepreneur motivation letter. Health insurance policy valid in Colombia (full coverage including repatriation). Completed online application at visas.cancilleria.gov.co. Application fee: approximately USD $50 (non-refundable study fee). Issuance fee (if approved): approximately USD $170-$230. TAX RESIDENCY TRIGGER AT 183 DAYS: Staying in Colombia for 183 days or more in any 12-month rolling period triggers Colombian tax residency, regardless of visa type. Tax residents must report worldwide income to Colombian tax authority (DIAN) and may be subject to Colombia progressive income tax rates (19%-39%). Non-residents taxed only on Colombian-source income. Digital nomads earning from foreign clients typically have no Colombian-source income - but exceeding 183 days can substantially change their tax obligations. Consult Colombian tax professional for planning.',
  '10-30 business days (approximately 2-6 weeks) after complete application submission. Migración Colombia may request additional information by email - monitor inbox frequently. Approval is electronic (e-visa sent by email). No in-person appointment needed for most nationalities.',
  'Application fee: approximately USD $50 non-refundable study fee. Issuance fee if approved: approximately USD $170-$230. Health insurance: approximately USD $30-$100/month depending on coverage level and age. Cédula de Extranjería application: approximately COP 225,000 (approximately USD $50-$55). Total first-year estimated costs: approximately USD $400-$600 in visa and registration fees plus ongoing health insurance.',
  '10-30 business days approximately 2-6 weeks after complete application submission. Migración Colombia may request additional information by email - monitor inbox frequently. Approval is electronic e-visa sent by email. No in-person appointment needed for most nationalities.',
  'Validity: Up to 2 years officer discretion; may be shorter initially, extendable to 2-year max. Stay per year: Up to 180 days/year within 2-year window per some practitioner guidance; full validity per others - confirm with official source at time of application. Work rights: Remote work for foreign clients only - no local Colombian employment. Path to PR: NONE directly - V visa time does NOT count toward 5-year M→R pathway. Switch to M visa worker, investor if long-term PR is goal. Tax residency trigger: 183 days in 12-month rolling period. Cédula: Must register within 15 calendar days of entry. VALIDITY CAVEAT: Original states Two-year visa. While maximum validity is 2 years, immigration officers have discretion to issue shorter periods 6 months, 1 year based on their review. Applicants who receive shorter grant can apply for extension up to 2-year maximum. Also critical: this is Type V Visitor visa - time accumulated on V-Nómada Digital does NOT count toward 5-year residency requirement for permanent R Visa. If goal is eventual permanent residence, Migrant M visa needed instead.',
  'https://visas.cancilleria.gov.co',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- WORK: M-Trabajador (Migrant Worker, Type M Visa)
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
  'colombia',
  'Work',
  'Work',
  'Colombia Work Visa — M-Trabajador (Migrant Worker, Type M Visa)',
  'No work visa card appeared in original page - only Digital Nomad visa was visible. Colombia work visa is M-Trabajador (Migrant Worker Visa, M category). Requires formal employment contract with Colombian-registered company, employer sponsorship, and financial solvency proof from employer. Unlike digital nomad visa, this is Type M (Migrant) visa, meaning time on it counts toward 5-year residency requirement for permanent R Visa. Employer must prove solvency at 100× SMMLV average monthly bank balance (approximately COP 142 million / approximately USD $34,000) for prior 4-6 months. Work authorization under this visa is employer- and role-specific - holders may only work for sponsoring employer in contracted role. EMPLOYER FINANCIAL SOLVENCY REQUIREMENT - BIGGEST STUMBLING BLOCK: Sponsoring Colombian company must demonstrate average monthly income bank balance of 100× SMMLV over prior 4-6 months. In 2025, that is approximately COP 142 million/month (approximately USD $34,000/month). Requirement designed to ensure employer can sustainably pay foreign worker. Smaller or newer companies that do not meet this threshold cannot legally sponsor work visa.',
  'Formal employment contract with Colombian-registered company. Employer must be legally registered (RUT + Chamber of Commerce). Employer must show average monthly bank balance ≥ 100× SMMLV (approximately $34,000 USD/month) for prior 4-6 months. For regulated professions: degree Convalidación from Colombian Ministry of Education required first. For non-regulated: apostilled + Spanish-translated degree or experience certificate. Clean criminal record (home country + any country of residence past 3 years). REGULATED PROFESSIONS REQUIRE DEGREE VALIDATION (CONVALIDACIÓN) - CAN ADD MONTHS TO TIMELINE: For regulated professions in Colombia - including engineering, medicine, architecture, law, others - foreign worker must have their degree validated by Colombia Ministry of National Education (Convalidación) before work visa can be granted. Process can take 3-6+ months on its own and must be completed before visa application. Applicants in non-regulated professions submit degree apostilled and translated; regulated professionals must go through full validation process.',
  'Employment contract with Colombian company; employer solvency ≥ 100× SMMLV (~$34k/month); degree Convalidación for regulated professions; Type M visa (counts toward 5-year PR pathway)',
  'Valid passport (6+ months, 2+ blank pages). Passport-style photo (3×4 cm, white background). Employment contract (original PDF + Ministry-format Contract Summary Form signed by both parties). Employer solvency: 4-6 months bank statements + tax return (DIAN) + Chamber of Commerce certificate (issued within 3 months). Employer motivation letter (functions, suitability, qualifications, job count). Professional credentials (apostilled + translated; or Convalidación for regulated professions). Criminal background check (apostilled + translated into Spanish). Health insurance valid in Colombia. Application fee: approximately USD $50 + issuance fee approximately USD $282 (M visa). TYPE M VS TYPE V DISTINCTION - CRITICAL FOR PERMANENT RESIDENCE PLANNING: M-Trabajador visa is Type M (Migrant) visa. Time on this visa counts toward 5-year continuous residency requirement to apply for R (Resident/permanent) visa. By contrast, V-Nómada Digital is Type V (Visitor) visa - time on it does NOT count. Structural distinction has major impact on immigration strategy for anyone planning to stay long-term in Colombia. Workers who want PR pathway should pursue M visa, not V digital nomad visa. MERCOSUR NATIONALS BENEFIT FROM SIMPLIFIED REQUIREMENTS: Citizens of MERCOSUR member and associate countries (Argentina, Brazil, Paraguay, Uruguay, Bolivia, Chile, Ecuador, Peru, Guyana, Suriname - Colombia is associate) benefit from simplified processing under MERCOSUR immigration agreement. Reduced documentation requirements, faster processing, sometimes lower financial thresholds apply. Non-MERCOSUR nationals (US, EU, UK) must meet full requirements including degree validation and employer solvency thresholds.',
  '15-30 business days (approximately 3-6 weeks) after complete submission. Additional time if degree Convalidación required: add 3-6 months before visa application. Apply entirely online at visas.cancilleria.gov.co. Final visa stamp issued in person at Cancillería offices in Bogotá or Colombian consulate abroad.',
  'Application fee: approximately USD $50 study fee non-refundable. Issuance fee: approximately USD $282 M visa. Degree Convalidación for regulated professions: approximately COP 300,000-500,000 (approximately USD $70-$120) plus apostille and translation costs approximately USD $100-$200. Criminal background check apostille + translation: approximately USD $100-$200. Health insurance: approximately USD $30-$100/month. Cédula de Extranjería: approximately USD $50-$55. Legal assistance optional but recommended for complex cases: approximately USD $500-$1,500. Total first-year estimated costs excluding legal fees: approximately USD $600-$1,200.',
  '15-30 business days approximately 3-6 weeks after complete submission. Additional time if degree Convalidación required: add 3-6 months before visa application. Apply entirely online at visas.cancilleria.gov.co. Final visa stamp issued in person at Cancillería offices in Bogotá or Colombian consulate abroad.',
  'Validity: Up to 3 years linked to contract duration; indefinite contracts get full 3 years; fixed-term contracts get contract duration, max 4 years cumulative. Renewal: Renewable in 3-year increments while employed. Work rights: Only for specific employer and role on visa. Path to PR: After 5 continuous years on M visa → apply for R Visa (permanent residence). Visa loss: Visa cancelled if absent from Colombia for more than 6 consecutive months. Family: Spouse, partner, parents, children under 25 may apply for beneficiary visas cannot work under beneficiary status. NO STANDALONE WORK PERMIT - WORK AUTHORIZATION EMBEDDED IN VISA: Unlike many countries, Colombia does NOT issue separate work permits. Work authorization integrated into M-Trabajador visa itself. Visa specifies employer and role it authorizes. Changing employers requires new M visa application - authorization is employer-specific. Holders may NOT do freelance work or work for any other Colombian company under M-Trabajador visa.',
  'https://www.cancilleria.gov.co/en/temporary-workers-visa',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- STUDY: M-Estudiante (Type M) & V-Intercambio Académico (Type V)
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
  'colombia',
  'Study',
  'Study',
  'Colombia Student Visa — M-Estudiante (Type M) & V-Intercambio Académico (Type V)',
  'No student visa card appeared in original page. Colombia 2022 visa reform created two distinct student visa types: M-Estudiante (Type M) for degree programs and long-term academic enrollment (bachelor, master, PhD - up to 3 years), and V-Intercambio Académico (Type V) for language courses, academic exchanges, short-term studies, and programs up to 2 years. Critical distinction: M-type student time counts toward permanent residence; V-type does NOT. Both require enrollment at government-recognized institution with minimum of 10 class hours per week. 2022 reform caused confusion - some applicants applied for M when they needed V, leading to rejections and fee loss. Always verify which type your institution and program require. 2022 REFORM CREATED TWO TYPES - APPLYING FOR WRONG ONE CAUSES REJECTION: Prior to October 2022, Colombia had single M-type student visa. Resolution 5477/2022 split this into M degree programs at accredited universities: bachelor, postgraduate and V language courses, exchange programs, short studies. Medellin Guru documents real case where applicant applied for M visa for Spanish classes and was rejected - they needed V-Intercambio Académico. Fee is non-refundable. Before applying, confirm with your institution which category your program falls under. Most Spanish language schools issue documentation only for V-type visas.',
  'Accepted and enrolled at Colombian government-recognized educational institution. Program involves minimum 10 class hours per week. Financial solvency: average bank balance ≥ 10× SMMLV (approximately USD $3,400). Valid health insurance required since 2022 reform. Clean criminal record for M-type; may be required for V-type. M-Estudiante: degree programs at accredited universities bachelor, postgraduate. V-Intercambio Académico: language courses, exchange programs, short-term studies, training. 10 HOURS/WEEK MINIMUM CLASS INTENSITY - STRICTLY ENFORCED: Regardless of visa type M or V, institution must certify that program involves minimum of 10 class hours per week. Requirement actively verified by immigration authorities. Students at Spanish language schools must confirm their school can certify this - many smaller private schools in Medellín and Bogotá NOT accredited and cannot issue valid enrollment certificates for visa purposes. Enrolled institution must also be officially recognized by Colombian government Ministerio de Educación.',
  'Enrollment at government-recognized institution; minimum 10 class hours/week; financial solvency ≥ 10× SMMLV (~$3,400); M-Estudiante for degree programs (counts toward PR); V-Intercambio for language/exchange (does NOT count toward PR)',
  'Valid passport (6+ months, 2+ blank pages). Passport-style photo (3×4 cm, white background). Certificate of enrollment from institution specifying program, duration, hours/week. Certificate of existence and legal representation of institution from Ministerio de Educación. Bank certificate or 6-month statements showing financial solvency. Health insurance valid in Colombia. For minors: parental authorization + designated guardian appointment authenticated by Colombian notary or consul. Criminal background check apostilled + translated - required for M-type. POSTGRADUATE STUDENTS MAY WORK 20 HOURS/WEEK - UNDERGRAD AND V-TYPE STUDENTS MAY NOT: Holders of M-Estudiante visa for postgraduate programs master, PhD may work up to 20 hours per week with prior reporting to Migración Colombia and Ministry of Labor by employer. Undergraduate students and all V-type visa holders NOT permitted to work. Distinction important for postgraduate students who want to supplement income during studies. CÉDULA REGISTRATION WITHIN 15 DAYS - MANDATORY FOR BOTH M AND V STUDENT VISAS: After arriving in Colombia with student visa, holders have 15 calendar days to register visa with Migración Colombia and obtain Cédula de Extranjería. Applies to both M and V student visas. Fine for non-compliance up to 7× monthly minimum wage. Universities typically assist students with this process but remains student legal responsibility. FINANCIAL SOLVENCY THRESHOLD - 10× SMMLV AVERAGE BANK BALANCE: To demonstrate financial solvency, students typically provide bank certificate showing average balance over past 6 months equal to at least 10× SMMLV (approximately COP 14,235,000 / approximately USD $3,400 in 2025). Alternatively, 6 months bank statements no translation required or credit card statements with sufficient available balance may be accepted. Sponsor letter assuming financial responsibility also accepted.',
  'Processing time: approximately 15-30 business days online application. Study fee: approximately USD $50-$67 non-refundable. Issuance fee: approximately USD $177-$230 if approved. Applications submitted online at visas.cancilleria.gov.co or through Colombian consulate abroad.',
  'Study fee: approximately USD $50-$67 non-refundable. Issuance fee if approved: approximately USD $177-$230. Criminal background check apostille + translation: approximately USD $100-$200 M-type only. Health insurance: approximately USD $30-$100/month. Financial solvency proof: bank balance ≥ 10× SMMLV approximately USD $3,400. Cédula de Extranjería: approximately USD $50-$55. Total first-year estimated costs: approximately USD $500-$1,000 excluding tuition and living expenses.',
  'Processing time: approximately 15-30 business days online application. Applications submitted online at visas.cancilleria.gov.co or through Colombian consulate abroad.',
  'M-Estudiante: Up to 3 years tied to program duration; renewable while enrolled; COUNTS toward 5-year PR requirement. V-Intercambio: Up to 2 years; renewable; does NOT count toward PR. Visa cancellation: If absent from Colombia for more than 6 consecutive months. Work rights: Postgraduate M-Estudiante: up to 20 hours/week with employer/Ministry reporting. All others: no work permitted. Beneficiaries: M-Estudiante postgraduate only: spouse/partner and dependent children may apply for beneficiary visas. Cédula: Must register within 15 calendar days of entry.',
  'https://www.cancilleria.gov.co/en/temporary-students-visa-0',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- RETIREMENT: M-Pensionado (M-11) & V-Rentista (Type V)
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
  'colombia',
  'Retirement',
  'Retirement',
  'Colombia Retirement & Rentista Visa — M-Pensionado (M-11) & V-Rentista (Type V)',
  'No retirement or rentista visa card appeared in original page. Colombia offers two distinct income-based pathways. M-Pensionado (M-11) is for individuals receiving lifetime pension - is Migrant M visa, counts toward permanent residence after 5 years, but work is NOT permitted. V-Rentista is for individuals with regular passive income rental income, dividends, investment returns, annuities rather than formal pension - is Visitor V visa, does NOT count toward PR, but easier to qualify for without official pension certificate. Both require monthly income of 3× SMMLV approximately USD $1,100 in 2025. Colombia one of most popular retirement destinations in Americas, with Medellín, Cartagena, and Coffee Region drawing thousands of foreign retirees annually. KEY DISTINCTION M-PENSIONADO VS V-RENTISTA - SAME INCOME THRESHOLD, VERY DIFFERENT OUTCOMES: Both require approximately $1,100/month income. However, M-Pensionado requires proof of formal lifetime pension government or private and grants M-type visa that counts toward permanent residence. V-Rentista accepts any recurring passive income rental income, dividends, annuities, royalties and grants V-type visa that does NOT count toward PR. If applicant has investment income but no formal pension, they must use V-Rentista route. If they have government or private pension, M-Pensionado offers clearer long-term PR pathway. 2022 visa reform also added new requirements including criminal background check and health insurance for pension visa.',
  'M-PENSIONADO M-11 ELIGIBILITY: Must receive lifetime pension government or private from abroad. Monthly pension at least 3× SMMLV = approximately COP 4,270,500 approximately USD $1,100 in 2025. Official certificate confirming lifelong pension from pension authority. Clean criminal record all countries of residence past 3 years. Medical certificate doctor letter confirming good physical and mental health. Health insurance valid in Colombia including repatriation. V-RENTISTA ELIGIBILITY: Regular passive income from abroad: rental income, dividends, investment returns, annuities, royalties, insurance settlements. Monthly passive income ≥ 3× SMMLV = approximately USD $1,100 in 2025. Bank statements and/or investment/rental income documentation for 3-6 months. Clean criminal record. Health insurance valid in Colombia. No formal pension certificate required - passive income documentation accepted.',
  'M-Pensionado: lifetime pension ≥ 3× SMMLV (~$1,100/month); counts toward PR; NO WORK PERMITTED. V-Rentista: passive income ≥ 3× SMMLV; does NOT count toward PR; NO WORK PERMITTED. Both require health insurance',
  'WORK NOT PERMITTED ON EITHER RETIREMENT/RENTISTA VISA: Neither M-Pensionado nor V-Rentista allows holder to engage in paid employment or professional activities in Colombia. Nexo Legal 2025 confirms: With this visa, you cannot engage in paid work activities in Colombia. Stricter constraint than retirement visas in Chile or Brazil. Retirees who want to generate income in Colombia e.g. through business should combine pension/rentista visa with investor or business owner visa - or apply solely for investor category. US SOCIAL SECURITY: SSA STOPPED ISSUING CERTIFICATION LETTERS IN 2022 - AFFECTS APPLICATIONS: Social Security Administration SSA stopped certifying letters proving pension amounts in 2022. Affected many US retirees applying for M-Pensionado visa. Current workarounds include: bank statements showing regular Social Security deposits, benefit verification letter from SSA my Social Security portal, or working with Colombian immigration lawyer experienced with SSA documentation. Applicants who have been in Colombia for 3+ years face fewer documentation hurdles at renewal than first-time applicants. FOREIGN PENSION TAX EXEMPTION - FAVORABLE FOR RETIREES: Colombia generally does NOT tax foreign pension income up to 1,000 UVT/year approximately COP 49.8 million / approximately USD $11,900 in 2025 - threshold annually updated. Income above this level may be subject to Colombian income tax for tax residents. Most average retirees with modest pension income will fall below threshold. For tax residents 183+ days/year, foreign pension income above exemption taxed at Colombia progressive rates starting at 19%. Consult Colombian tax professional given complexity of individual situations. INFLATION RISK AT RENEWAL - INVEST ABOVE MINIMUM: Colombia SMMLV rises every year 8-12% recent years, which means COP-denominated pension/rentista threshold increases annually at renewal. Applicant whose pension barely met threshold at initial application may fall below it at renewal. Immigration practitioners consistently recommend ensuring income well above minimum - at least 150% of threshold - to buffer against annual wage increases.',
  'Processing time: 15-30 business days. Application fee: approximately USD $50. Issuance fee M visa: approximately USD $282. Issuance fee V visa: approximately USD $177-$230. Applications submitted online. All foreign documents must be apostilled + translated to Spanish by certified translator.',
  'Application fee: approximately USD $50 study fee. Issuance fee M-Pensionado: approximately USD $282. Issuance fee V-Rentista: approximately USD $177-$230. Apostille and translation costs: approximately USD $100-$300. Health insurance: approximately USD $30-$100/month. Medical certificate: approximately USD $50-$100. Cédula de Extranjería: approximately USD $50-$55. Total first-year estimated costs: approximately USD $500-$900 in visa and registration fees plus ongoing health insurance and living expenses.',
  'Processing time: 15-30 business days. Applications submitted online. All foreign documents must be apostilled + translated to Spanish by certified translator.',
  'M-Pensionado validity: Initially 1 year; subsequent renewals up to 3 years. V-Rentista validity: Up to 2 years. Work rights: NONE on either visa. Path to PR M-Pensionado: After 5 continuous years → R Visa (permanent residence). Path to PR V-Rentista: None directly V visa time does NOT count. Visa cancellation: Absent from Colombia more than 6 consecutive months. Citizenship after PR: 5 more years as R-visa holder → Colombian citizenship Spanish fluency + ties; no dual citizenship restriction for most nationalities.',
  'https://visas.cancilleria.gov.co',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- INVESTOR: M-Inversionista Real Estate (M-10) & M-Socio o Propietario (M-6)
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
  'colombia',
  'Investor',
  'Investor',
  'Colombia Investor Visa — M-Inversionista Real Estate (M-10) & M-Socio o Propietario (M-6, Business)',
  'No investor visa card appeared in original page. Colombia offers two main investor Migrant M visa categories: M-Inversionista en Bienes Raíces (M-10) for real estate purchases, and M-Socio o Propietario (M-6) for investment in Colombian company new or existing. Both Type M (Migrant) visas that count toward 5-year permanent residence pathway. Thresholds denominated in SMMLV and increase every January - real estate minimum currently 350× SMMLV approximately USD $120,000-$125,000 in 2025 and business investment minimum 100× SMMLV approximately USD $34,000. All foreign investments must be formally registered with Banco de la República Colombia central bank - step often overlooked by applicants and results in rejection without it. BANCO DE LA REPÚBLICA REGISTRATION MANDATORY - STEP MOST APPLICANTS MISS: All foreign capital invested in Colombia - whether in real estate or company - must be officially declared and registered as Foreign Direct Investment FDI with Banco de la República using Form 4 Declaración de Cambio. Banco de la República then issues formal certificate confirming FDI registration. This certificate must be included in visa application. Without it, application incomplete and will be rejected. Registration must be done by authorized Colombian financial exchange intermediary bank or registered cambista. Most commonly missed step for self-prepared applications.',
  'REAL ESTATE M-10 - THRESHOLDS: Minimum investment: 350× SMMLV. 2025 value: approximately COP 498-500 million approximately USD $120,000-$125,000. Property must be: Registered in investor name only Certificado de Libertad y Tradición. Investment registered as FDI with Banco de la República Form 4. Residential or commercial real estate in Colombia. Deed Escritura showing ownership. Note: property value reassessed at renewal using updated SMMLV - invest above minimum. BUSINESS INVESTMENT M-6 - THRESHOLDS: Minimum investment: 100× SMMLV. 2025 value: approximately COP 142 million approximately USD $34,000. Higher FDI threshold → direct R Visa: 650× SMMLV approximately USD $220,000 via registered FDI. Requirements: Formally incorporated Colombian company SAS or other. Chamber of Commerce registration + active RUT. FDI registration with Banco de la República. Proof of capital contribution certified public accountant certificate. Business plan / evidence of active operations.',
  'Real Estate M-10: 350× SMMLV (~$120k); Business M-6: 100× SMMLV (~$34k); Direct R Visa: 650× SMMLV (~$220k FDI). Banco de la República FDI registration MANDATORY for all. Type M visas count toward 5-year PR pathway',
  'THRESHOLDS RISE ANNUALLY WITH SMMLV - INVEST ABOVE MINIMUM: Because thresholds denominated in SMMLV which rose 9% in 2025, 12% in 2024, COP value of minimum investment increases each year. Investor who purchased property at exactly 350 SMMLV in 2024 may find property value now below updated threshold at renewal in 2025 or 2026 - causing visa to be denied at renewal. Immigration attorneys consistently recommend investing at least 150% of minimum e.g. approximately USD $180,000+ for real estate rather than strict minimum approximately $120,000. Provides buffer against inflation and annual SMMLV increases. TWO REAL ESTATE INVESTMENT TIERS - M VISA VS R VISA DIRECT PR: Colombia previously offered direct R-visa permanent residence to investors above higher threshold. Under Resolution 5477/2022, restructured: 350 SMMLV approximately USD $120,000 in real estate → M visa 3 years, renewable → PR after 5 years. 650 SMMLV approximately USD $220,000 invested via registered FDI in Colombian company → R visa direct permanent residence. Higher-threshold FDI route is direct path to permanent residence without 5-year wait. For those who can meet threshold, dramatically accelerates immigration timeline. BUSINESS INVESTMENT M-6 - COLOMBIA MUST BE BENEFICIARY: M-Socio o Propietario M-6 visa requires investment in Colombian company - new startup or existing business. Company must be formally incorporated in Colombia, registered with Chamber of Commerce, have active RUT tax ID, and demonstrate active operations not shell company. 100× SMMLV approximately USD $34,000 minimum is baseline; some attorneys recommend higher investment approximately USD $50,000+ to demonstrate genuine business activity. Investor may work only within their own company and only in activities matching company registered business activity. INVESTOR VISA HOLDERS MAY LIVE AND WORK IN COLOMBIA - WITHIN INVESTMENT SCOPE: Unlike retirement/rentista visa, M investor visa holders MAY work in Colombia - but only within their company and only in activities that match company registered business activity. Makes M-6 business investor visa attractive to entrepreneurs who want both residency and ability to operate business in Colombia. M-10 real estate visa also grants work rights but only within any business activity separately authorized - passive real estate ownership alone does not grant open work authorization.',
  'Processing time: 15-30 business days after complete submission. Apply entirely online at visas.cancilleria.gov.co. Banco de la República FDI registration must be completed BEFORE visa application - can take additional 2-4 weeks depending on bank processing.',
  'Application fee: approximately USD $50 study fee. Issuance fee M visa: approximately USD $282. Direct R Visa higher FDI threshold: issuance fee approximately USD $400-$500. Real estate closing costs taxes, notary, registration: approximately 1-2% of property value. Banco de la República FDI registration: approximately COP 100,000-300,000 approximately USD $25-$70. Business incorporation SAS: approximately COP 500,000-1,500,000 approximately USD $120-$360. Accountant certification: approximately COP 200,000-500,000 approximately USD $50-$120. Legal assistance optional but highly recommended for investor visas: approximately USD $1,500-$5,000. Total first-year estimated costs excluding investment amount: approximately USD $2,000-$6,000 in fees and professional services.',
  'Processing time: 15-30 business days after complete submission. Apply entirely online at visas.cancilleria.gov.co. Banco de la República FDI registration must be completed BEFORE visa application - can take additional 2-4 weeks depending on bank processing.',
  'M-10 / M-6 validity: Up to 3 years renewable while investment maintained. Direct R Visa 650 SMMLV FDI: Permanent residence immediately. Work rights: M-6 holders: within own company activities only. M-10 holders: limited to investment-related activities. Path to PR: After 5 continuous years on M visa → R Visa (permanent residence). Visa cancellation: If investment falls below threshold, or absent 6+ consecutive months. Family: Spouse/partner, dependent children may apply for beneficiary visas. Citizenship: After PR → 5 more years → Colombian citizenship Spanish exam required unless citizen of Spanish-speaking country. Dual citizenship: Colombia recognizes dual citizenship - no renunciation of prior nationality required.',
  'https://www.cancilleria.gov.co/en/resident-investors-visa',
  '2026-03-01'
);
