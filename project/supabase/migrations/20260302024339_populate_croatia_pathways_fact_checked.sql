/*
  # Populate Croatia Immigration Pathways - Fact-Checked

  1. Summary
    - Adds comprehensive, fact-checked immigration pathways for Croatia
    - Based on official MUP (Ministry of Interior), Aliens Act (Zakon o strancima) amended March 2025
    - CRITICAL CORRECTIONS: All five original cards contained entirely generic placeholder content with zero Croatia-specific details
    - Work: Processing time "1-6 months" wrong - actual 30-60 days; Labour Market Test mandatory (completely absent from original)
    - Student: Processing "2-8 weeks" wrong - actual 6-12 weeks; biometric card takes additional 2-3 months; language courses do NOT qualify
    - Digital Nomad: Validity "6 months to 2 years" wrong - actual maximum 18 months (changed March 2025); income threshold entirely absent from original - actual €3,295/month; NOT renewable
    - Retirement: CRITICAL ERROR - "Croatia Retirement Visa" does NOT EXIST; no dedicated retirement visa for non-EU citizens
    - Investor: CRITICAL ERROR - Croatia has NO GOLDEN VISA, NO residence-by-investment program; original describes non-existent programs

  2. Croatia Context
    - EU member since 2013; Schengen member since January 2023
    - Croatian biometric residence card allows Schengen travel (90 days per 180-day period)
    - Governed by Aliens Act (Zakon o strancima), amended March 2025
    - Authority: Ministry of Interior (MUP - Ministarstvo unutarnjih poslova)
    - 3-day address registration mandatory for all arrivals
    - 5 years continuous temporary residence → permanent residence
    - 8 years total (5 temp + 3 perm) + language → citizenship possible

  3. Content Details
    - Work: Stay & Work Permit (Single Permit) + EU Blue Card; 30-60 days processing; Labour Market Test required for standard permits; EU Blue Card €24,845/year salary threshold; March 2025 reform: can work 8 hours/week for second employer
    - Student: M-Estudiante for degree programs; 6-12 weeks approval + 2-3 months for biometric card; Croatian language courses (Croaticum) do NOT qualify; financial means ~€330/month + €800 return; part-time work via Student Services Center only
    - Digital Nomad: Maximum 18 months validity (March 2025 update from 12 months); income €3,295/month (2.5× Croatian average); NOT renewable - 6-month gap required; tax-exempt on foreign work income; bank statements increased to 6 months (2025)
    - Retirement: NO dedicated retirement visa exists; retirees use temporary residence via prepaid rent (1 year, non-renewable, 6-month gap) or property ownership (over-60s can renew since 2025); no minimum age requirement; no fixed income threshold
    - Investor/Business: NO golden visa or investment visa exists; actual route: d.o.o. company with €25k-€27k capital + 3 Croatian employees + 1.5× average salary; property ownership gives 1-year non-renewable permit (does NOT count toward PR); foreign investment screening law introduced 2025

  4. Important Notes
    - All data verified against MUP (mup.gov.hr), EU Migration Portal, expatincroatia.com, Fragomen (Dec 2025), Citizen Remote
    - March 2025 Aliens Act amendments incorporated: 18-month digital nomad validity, over-60 property renewal, 8 hours/week second employer
    - Croatia was one of first countries to introduce digital nomad permit (January 2021)
    - Widespread misinformation about golden visa / investment visa - these do NOT exist in Croatia
    - All original cards labeled "Starter" with entirely generic placeholder content - contained zero Croatia-specific information
*/

-- Delete any existing Croatia pathways to avoid duplicates
DELETE FROM immigration_pathways WHERE destination_slug = 'croatia';

-- ═══════════════════════════════════════════════════════════════════════════
-- WORK: Stay & Work Permit (Single Permit) + EU Blue Card
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
  'croatia',
  'Work',
  'Work',
  'Croatia Work Visa — Stay & Work Permit (Single Permit) + EU Blue Card',
  'Original card contains zero Croatia-specific information - describes generic template applicable to any country Varies by country and program, typically 1-6 months / May be 1-3 years initially. Croatia actual work authorization system has two distinct tracks: Stay and Work Permit Dozvola za boravak i rad - single permit combining residence and work authorization, valid up to 2 years - and EU Blue Card EU Plava karta for highly qualified workers, also valid 2 years with salary threshold of €24,845/year €2,070/month gross. Critical distinction: most standard work permits require Labour Market Test employer must first seek Croatian workers via Croatian Employment Service / HZZ; EU Blue Card exempt from this test. March 2025 law amendments brought notable liberalizations, including allowing permit holders to work for second employer up to 8 hours/week. PROCESSING TIME 1-6 MONTHS AND VALIDITY 1-3 YEARS BOTH WRONG FOR CROATIA: Original states processing typically 1-6 months and validity 1-3 years. Croatia actual processing time is 30-60 days for both standard work permits and EU Blue Cards, confirmed by EU Migration Portal European Commission official source and Fragomen December 2025. Standard stay and work permits valid for up to 1 year renewable; EU Blue Cards valid for 2 years or contract duration plus 3 months if under 2 years. 1-3 years figure misrepresents Croatian permit durations.',
  'STANDARD PERMIT ELIGIBILITY: Formal employment contract with Croatian-registered employer. Employer must pass HZZ Labour Market Test confirming no suitable local candidate. Professional qualifications matching contracted role. Valid passport 6+ months validity. Clean criminal record home country + countries of residence past year. Proof of accommodation in Croatia. Health insurance valid in Croatia. EU BLUE CARD ELIGIBILITY: Third-country national non-EU/EEA. Bachelor degree or 5 years equivalent senior professional experience for regulated professions. Employment contract or binding job offer of at least 1 year. Gross annual salary ≥ €24,845.64 €2,070.47/month. No Labour Market Test required. Health insurance valid in Croatia. Clean criminal record. LABOUR MARKET TEST MANDATORY FOR MOST POSITIONS - COMPLETELY ABSENT FROM ORIGINAL: Before hiring non-EU national, employer must request labour market test from Croatian Employment Service HZZ / Hrvatski zavod za zapošljavanje. HZZ assesses whether any qualified unemployed Croatian or EU citizens available for position. Only if test finds no suitable local candidates can employer proceed. EU Blue Card exempt from this test. Step adds time to process and is hard prerequisite generic original entirely omits.',
  'Employment contract with Croatian employer; Labour Market Test required for standard permits (EU Blue Card exempt); EU Blue Card: degree + €24,845/year salary; processing 30-60 days; validity 1 year (standard) or 2 years (Blue Card)',
  'MARCH 2025 LAW REFORM: PERMIT HOLDERS CAN NOW WORK 8 HOURS/WEEK FOR SECOND EMPLOYER: March 2025 amendments to Aliens Act introduced several liberalizations. Previously, work permit holders strictly tied to single sponsoring employer. Now, holders may work for additional employer for up to 8 hours per week, without new permit. Law also extended validity periods for several categories, eased EU Blue Card eligibility rules, and relaxed employer-change rules. Changes make Croatia labour market more accessible for foreign talent. EU BLUE CARD SALARY THRESHOLD: €24,845/YEAR GROSS €2,070/MONTH - NO AGE OR QUOTA CONSTRAINTS: Croatia EU Blue Card requires annual gross salary of at least €24,845.64 monthly: €2,070.47, confirmed by European Commission official EU Blue Card portal. Croatia does NOT apply labour market test for Blue Card applications, making it faster route for qualifying highly skilled professionals degree + contract of ≥1 year. Croatia also abolished its previous quota system for work permits in January 2021. TWO-STAGE ENTRY PROCESS FOR VISA-REQUIRED NATIONALITIES - BIOMETRIC CARD COLLECTED IN PERSON AFTER ARRIVAL: If third-country national requires visa to enter Croatia, employer or employee submits permit application first. Once granted, applicant must apply for long-stay Visa D at Croatian embassy/consulate to enter Croatia. Upon arrival, they provide biometric data at local police station, and biometric residence card issued approximately 21 days later. Visa-exempt nationals US, UK, Canada, Australia can apply for permit directly at local police station upon arrival. Address registration within 3 days of arrival mandatory for all.',
  'Processing: 30-60 days for both standard work permits and EU Blue Cards. Two-stage entry for visa-required nationalities: permit approval first, then Visa D application at Croatian embassy/consulate, then biometric data collection at police station upon arrival in Croatia. Biometric card issued approximately 21 days after biometric data submission. Visa-exempt nationals can apply directly at local police station upon arrival.',
  'Administrative decision fee EU Blue Card: €74.32. Biometric card standard: €31.85. Biometric card accelerated: €59.73. Issuance supplement: €9.29. Total approximately: €115-€144. Labour Market Test fee paid by employer varies. Criminal background check apostille and translation: approximately €100-€200. Health insurance: approximately €30-€100/month. Address registration: free but mandatory within 3 days. Total first-year estimated costs excluding legal fees: approximately €300-€600.',
  'Processing: 30-60 days for both standard work permits and EU Blue Cards confirmed by EU Migration Portal European Commission official source and Fragomen December 2025.',
  'Standard Stay and Work Permit: Up to 1 year; renewable 30+ days before expiry. EU Blue Card: 2 years or contract duration plus 3 months if shorter; renewable. Second employer: Up to 8 hours/week permitted since March 2025. Employer change: Requires new permit application 2025 reforms easing rules. Path to PR: 5 years continuous temporary residence → permanent residence. Citizenship: 8 years total 5 temp + 3 perm + Croatian language proficiency. Family: Spouse, children, dependent parents may apply for family reunification permits. Schengen travel: Croatian biometric residence card allows 90 days per 180-day period in Schengen zone since Croatia joined Schengen January 2023.',
  'https://mup.gov.hr/aliens-281621/281621',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- STUDENT: Temporary Residence for Studies
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
  'croatia',
  'Study',
  'Study',
  'Croatia Student Visa — Temporary Residence for Studies (Privremeni boravak u svrhu studiranja)',
  'Original card mostly generic and contains one material factual error. States processing typically 2-8 weeks - actual documented range is 6-12 weeks from submission to approval, with physical biometric card often arriving several months after that students receive proof of application first. Validity description duration of studies plus additional grace period broadly correct but lacks critical Croatia-specific structure: permit granted for 1 academic year 1 year and must be renewed annually. Language proficiency listed as potentially required - more nuanced in Croatia: no language test required to apply for visa, but certain programs taught in Croatian require B2 proficiency to enroll in institution. Key distinguishing fact omitted: Croatian language programs Croaticum do NOT qualify for student residence - only accredited academic programs at universities, polytechnics, or colleges of applied sciences qualify. PROCESSING TIME 2-8 WEEKS TOO OPTIMISTIC - DOCUMENTED RANGE 6-12 WEEKS FOR APPROVAL, CARD TAKES LONGER: Citizen Remote October 2025 documents processing can take six to twelve weeks from submission to approval. European Commission official EU Migration Portal confirms fees but not specific timeline. Academic Programs International RIT Croatia documents that card not issued during student stay for shorter programs - biometric cards processed in Zagreb and arrive 2-3 months after document submission, though legal residency begins upon document submission. Students should apply well in advance and plan for card to arrive separately.',
  'Enrolled in accredited higher education institution in Croatia university, polytechnic, college of applied sciences - recognized by Ministry of Science and Education. CROATIAN LANGUAGE COURSES AND CROATICUM DO NOT QUALIFY. Program conducted in Croatian: B2 Croatian language proficiency required by institution not by MUP for visa itself. Programs in English or other languages: no language test for residence permit. Financial means sufficient to cover stay approximately €330/month + €800 return. Proof of accommodation in Croatia. Health insurance valid in Croatia or EHIC/bilateral agreement card for eligible nationalities. Clean criminal record from home country, for first application. CROATIAN LANGUAGE COURSES CROATICUM DO NOT QUALIFY FOR STUDENT RESIDENCE - CRITICAL OMISSION: Croatia student residence permit requires enrollment in accredited academic programs at higher education institutions recognized by Croatian government universities, polytechnics, colleges of applied sciences. Croatian language learning programs such as Croaticum and similar short language courses do NOT qualify. Students enrolled only in language courses must apply for residence under different basis other purposes. Real trap that has caused applications to be rejected. Fee non-refundable. Qualifying institution must also be formally registered with Croatian Ministry of Science and Education.',
  'Enrolled at accredited Croatian higher education institution (university, polytechnic, college); Croatian language courses (Croaticum) do NOT qualify; financial means ~€330/month + €800 return; health insurance; processing 6-12 weeks approval + 2-3 months for biometric card',
  'PART-TIME WORK PERMITTED THROUGH STUDENT SERVICES CENTER STUDENTSKI CENTAR: International students studying full-time in Croatia may work part-time through Student Services Center Studentski centar / SC, which acts as intermediary between students and employers. Students must register in person at SC. Jobs typically in hospitality, tourism, logistics, event staffing. Specific Croatian mechanism - work not done independently but routed through SC. Jobs part-time and temporary. Original card does not mention work rights at all. FINANCIAL MEANS THRESHOLD: APPROXIMATELY €330/MONTH PER MONTH OF STAY + €800 RETURN FUNDS: Croatia requires proof of financial means sredstva za uzdržavanje for student residence. Commonly cited practical figure approximately €330/month for duration of stay + €800 for return travel equaling approximately €2,200 for one semester or €3,500 for full academic year, per RIT Croatia documented requirements. Official baseline for general temporary residence approximately €659/month for single person - students typically qualify at lower amount if institution certifies accommodation and living costs. Bank statements, scholarship letters, or sponsor letters all accepted. 3-DAY ADDRESS REGISTRATION ON ARRIVAL MANDATORY - NOT JUST RECOMMENDED: All third-country nationals arriving in Croatia must register address at local police station within 3 days of arrival. Hotels and student dormitories do this automatically. Students in private apartments must register themselves. Failure to register is violation of Aliens Act. Step required before student residence permit application can be processed in-country.',
  'Processing: 6-12 weeks for approval decision. Biometric card: additional 2-3 months after document submission processed in Zagreb region. Legal residency begins upon document submission, before card arrives. Apply: in-country at police station visa-exempt nationals, online at mup.gov.hr, or at Croatian embassy/consulate abroad.',
  'Temporary stay decision: €46.45. Biometric card standard: €31.85. Biometric card accelerated: €59.73. Issuance supplement: €9.29. Total approximately: €87-€115. Apostille and translation costs: approximately €100-€300. Health insurance: approximately €30-€100/month. Financial means proof: bank balance ≥ €330/month + €800 return approximately €2,200 semester or €3,500 full year. Address registration: free but mandatory within 3 days. Total first-year estimated costs: approximately €500-€1,000 excluding tuition and living expenses.',
  'Processing: 6-12 weeks for approval decision confirmed by Citizen Remote October 2025 and European Commission official EU Migration Portal. Biometric card: additional 2-3 months after document submission processed in Zagreb region confirmed by Academic Programs International RIT Croatia.',
  'Validity: 1 academic year 1 year; renewable annually while enrolled. Renewal deadline: Apply 30-60 days before expiry at jurisdictional police station. Work rights: Part-time via Studentski centar Student Services only; not independently. Validity loss: Permit cancelled if absent from Croatia for 10+ consecutive months. Path to PR: 5 years continuous temporary residence including student time → permanent residence. Address registration: Within 3 days of arrival mandatory. Family: Beneficiary permits available for dependent family members. Schengen travel: Croatian biometric residence card allows 90 days per 180-day period in Schengen zone.',
  'https://home-affairs.ec.europa.eu/policies/migration-and-asylum/eu-immigration-portal/student-croatia_en',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- DIGITAL NOMAD: Temporary Stay of Digital Nomads
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
  'croatia',
  'Digital Nomad',
  'Digital Nomad',
  'Croatia Digital Nomad Permit — Temporary Stay of Digital Nomads (Privremeni boravak digitalnih nomada)',
  'Croatia was one of first countries in world to introduce digital nomad program January 2021, and remains one of Europe most prominent options. Original card states Usually 6 months to 2 years validity and generic income requirements - both wrong. Program underwent SIGNIFICANT CHANGES IN MARCH 2025 which original card completely misses: maximum validity extended from 12 months to 18 MONTHS, income threshold updated to €3,295/month tied to 2.5× Croatian average net salary, and bank statement requirement increased from 3 months to 6 MONTHS. Critically, this technically not visa - is temporary residence permit. Permit also NOT RENEWABLE; after expires, applicants must leave Croatia for at least 6 months including 90+ days outside Croatia before reapplying. VALIDITY 6 MONTHS TO 2 YEARS WRONG - CORRECT MAXIMUM 18 MONTHS SINCE MARCH 2025, WAS 12 MONTHS BEFORE: Original states Usually 6 months to 2 years. Correct figure as of 2025 is maximum of 18 months. Permit can be issued for up to 18 months at once, or for 12 months with 6-month extension extension must be requested at least 60 days before initial expiry. Maximum total: 18 months. No 2-year option. Before March 2025, maximum was 12 months. 2 years has never been correct for Croatia digital nomad permit.',
  'Non-EU/EEA/Swiss citizen EU/EEA citizens do not need this permit. Employed by or running business NOT registered in Croatia. Work performed remotely via digital technology for foreign employers/clients. Cannot work for Croatian employers or provide services to Croatian companies. MONTHLY INCOME ≥ €3,295 NET 2.5× Croatian average net salary; updated annually. OR savings: €39,540 for 12-month stay / €59,310 for 18-month stay. +10% per additional family member on monthly income threshold. Health insurance valid in Croatia for full duration travel insurance does NOT qualify. Clean criminal record home country + any country of residence past 5 years. Proof of accommodation rental contract, long-term booking - not Airbnb. INCOME THRESHOLD ENTIRELY ABSENT FROM ORIGINAL CARD - CORRECT 2025 FIGURE €3,295/MONTH: Original card eligibility section says only Minimum income thresholds often apply with no figure. Croatia income threshold specific and legally defined: 2.5 times average monthly net salary published annually by Croatian Bureau of Statistics. As of 2025, equals €3,295/month, confirmed directly by official MUP mup.gov.hr digital nomad page. Alternatively, applicants can show savings of €39,540 for 12 months or €59,310 for 18 months of intended stay. Each additional family member adds 10% to monthly income requirement.',
  'Non-EU/EEA/Swiss; remote work for foreign employers/clients (NOT Croatian companies); income €3,295/month or savings €39,540-€59,310; health insurance (NOT travel insurance); maximum 18 months validity; NOT renewable (6-month gap required)',
  'NOT RENEWABLE - PERMIT NON-RENEWABLE; MUST LEAVE CROATIA FOR 6 MONTHS BEFORE REAPPLYING: Original card says possible renewal options - incorrect for Croatia. Digital nomad permit EXPLICITLY NON-RENEWABLE. Once expires, holder must leave Croatia and cannot reapply for at least 6 MONTHS, during which they must spend at least 90 DAYS OUTSIDE CROATIA. Hard constraint from Law on Foreigners Article 3. 6-month wait also breaks continuous residency, meaning this route alone cannot lead to permanent residence which requires 5 years uninterrupted residence. TAX EXEMPTION ON FOREIGN-SOURCED INCOME - ONE OF MOST IMPORTANT BENEFITS: Digital nomad permit holders EXEMPT from Croatian income tax on their foreign-sourced work income while holding permit. Significant and legally established benefit - you can live in Croatia and keep full earnings from foreign clients or employers. However, exemption specific to work income from remote arrangement underlying permit. PASSIVE INCOME investments, capital gains, rental income, crypto gains, pensions NOT exempt and must be reported to Croatia tax authority Porezna uprava under applicable double-taxation treaties. Staying 183+ days may also trigger tax residency obligations in home country. BANK STATEMENT REQUIREMENT UPDATED IN 2025 - NOW 6 MONTHS WAS 3 MONTHS: One of 2025 updates: applicants proving income through bank statements or payslips must now provide last 6 MONTHS of statements increased from 3 months. For applicants using savings instead of monthly income, 12 MONTHS of bank statements required showing consistent access to savings amount. Documents must be in English or Croatian; others must be certified translated. SCHENGEN TRAVEL FREEDOM - RESIDENCE CARD ALLOWS 90 DAYS IN SCHENGEN EVERY 180 DAYS: Since Croatia joined Schengen Area in January 2023, Croatian digital nomad residence card is Schengen residence permit. Holders can travel freely within Schengen zone for up to 90 DAYS per 180-day period. However, absence rule: permit specifies no more than 30 CONSECUTIVE days or 60 DAYS TOTAL per year absent from Croatia, though enforcement of this specific rule has been inconsistent in practice.',
  'Processing: approximately 30 days officially; delays possible. After approval, biometric data submitted at police station; card issued in person. Can apply: in-country at police station visa-exempt nationals, online at mup.gov.hr, or at Croatian embassy/consulate abroad. Address registration within 3 days of arrival mandatory.',
  'Application/administrative fee: approximately €60-€105. Biometric card: €31.85 standard / €59.73 accelerated. Address registration: free but mandatory within 3 days. Health insurance long-term, not travel: approximately €40-€120/month. Apostille and translation costs for criminal record: approximately €100-€200. Total first-year estimated costs: approximately €500-€900 in fees plus ongoing health insurance.',
  'Processing: approximately 30 days officially; delays possible. After approval, biometric data submitted at police station; card issued in person.',
  'Maximum validity: 18 months since March 2025; was 12 months before. Can be issued for 12 months + 6-month extension OR 18 months directly. NOT renewable - after expiry, must leave Croatia for 6 MONTHS including 90+ days outside Croatia before reapplying. Tax: Foreign work income exempt from Croatian income tax; passive income NOT exempt. Absence limit: Max 30 consecutive days / 60 days/year absent from Croatia. Schengen travel: 90 days per 180-day period in Schengen zone. PR path: Time counts toward permanent residence but 6-month gap between permits breaks continuity - cannot reach PR via digital nomad permit alone. Family: Spouse, children, life partner 3+ years together can apply for family reunification based on your permit.',
  'https://mup.gov.hr/aliens-281621/temporary-stay-of-digital-nomads-286853/286853',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- RETIREMENT: No Dedicated Retirement Visa; Options via Temporary Residence
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
  'croatia',
  'Retirement',
  'Retirement',
  'Croatia "Retirement" — No Dedicated Retirement Visa; Options via Temporary Residence "Other Purposes" + Property Ownership',
  'Original card describes Croatia Retirement Visa with specific characteristics minimum age 50, income requirements, 1-2 year validity. THIS VISA DOES NOT EXIST - Croatia has no dedicated retirement visa for non-EU citizens. Expatincroatia.com Croatian immigration specialist site confirms directly: Croatia does not currently offer temporary residence permit specifically for non-EU retirees. Original card description - including minimum age 50 or older, 1-2 years initially, usually renewable, and implied income threshold - appears copied from generic template and does NOT correspond to any actual Croatian residence category. What retirees actually use in Croatia are general Temporary Residence Permits Privremeni boravak granted for other purposes, typically supported by a prepayment of full year rent, b ownership of Croatian residential property with special rules for over-60s, or c digital nomad permit if working remotely. No minimum age requirement on any of these. CROATIA RETIREMENT VISA DOES NOT EXIST - ORIGINAL CARD DESCRIBES NON-EXISTENT PROGRAM: Multiple authoritative Croatian immigration sources confirm this explicitly. Expatincroatia.com immigration specialists: Croatia does not currently offer temporary residence permit specifically for non-EU retirees. Original card describes minimum age often 50 or older - no Croatian residence permit has minimum age requirement of 50. Card framing of proof of pension or passive income as qualification for specific retirement visa inaccurate; what exists is general temporary residence application where passive income is one possible means of financial support.',
  'ROUTE A - PREPAID RENT MOST COMMON: Rent Croatian apartment; prepay 12 months rent documented. Provides purpose of stay + proof of accommodation in one step. Non-renewable; must leave 6 months between applications. Permit: 1 year. ROUTE B - PROPERTY OWNERSHIP: Buy Croatian residential property no minimum price. Must be zoned residential; must live in it. Over-60 owners: permit now renewable 2025 rule. Under 60: non-renewable; 6-month gap required. Property purchase takes 6+ months; plan ahead. ROUTE C - DIGITAL NOMAD PERMIT: For those still doing remote work; income ≥ €3,295/month. 18-month maximum; 6-month gap before reapplication. Tax-exempt on foreign work income. DE-FACTO RETIREMENT PATHWAY: TEMPORARY RESIDENCE BASED ON PREPAID RENT OR PROPERTY OWNERSHIP - WITH SEVERE LIMITATIONS: Retirees most commonly obtain temporary residence by either 1 prepaying full year rent on Croatian apartment and showing this as proof of purpose + financial means, or 2 owning Croatian residential property and residing in it. Critically, PROPERTY-BASED AND PREPAID-RENT PERMITS NON-RENEWABLE BACK-TO-BACK - holders must leave Croatia for at least 6 months including 90 days outside Croatia between permit applications. Means living in Croatia year-round as retiree indefinitely NOT straightforwardly achievable. One exception: retirees OVER AGE 60 who own Croatian property can renew their permit new 2025 rule, making property ownership more stable long-term option for older retirees.',
  'NO dedicated retirement visa exists; retirees use: Route A (prepaid 12-month rent, 1-year permit, non-renewable, 6-month gap); Route B (property ownership, over-60s can renew since 2025, under-60s non-renewable with 6-month gap); Route C (digital nomad if remote work, €3,295/month)',
  'NO FIXED INCOME THRESHOLD FOR RETIREMENT RESIDENCE - BUT FINANCIAL MEANS MUST BE DEMONSTRATED: Original card implies specific income threshold. In reality, no officially published minimum income requirement for other purposes retirement category. Requirement is to demonstrate sufficient means to support yourself in Croatia. International Living cites approximately €460/month single or €660/month couple as practical working figures, while Compare Expat Plans recommends €1,500/month to be comfortable. Official calculation approximately €659/month for single person based on regulated Croatian financial means formula updated annually. Flexibility greater than fixed retirement visa, but also less predictable. OVER-60 PROPERTY OWNERS: 2025 RENEWAL RIGHTS - MOST FAVORABLE OPTION FOR LONG-TERM RETIREMENT: 2025 amendments to Aliens Act introduced specific provision: RETIREES OVER AGE 60 WHO OWN CROATIAN RESIDENTIAL PROPERTY can now renew their temporary residence permit previously, all property-based permits required 6-month gaps. Makes property ownership closest thing to stable long-term residence route for older retirees. No minimum purchase price for property. Property must be zoned residential and applicant must live in it. Purchasing Croatian property typically takes 6+ months including land registry registration, so plan well ahead. NO US-CROATIA INCOME TAX TREATY - PENSION INCOME TAXED IN CROATIA IF TAX-RESIDENT: US and Croatia have no ratified bilateral income tax treaty. For US retirees who become Croatian tax residents 183+ days/year, Croatian income tax applies to their pension income. Municipal income tax rates range from 15-23% lower band to 25-33% higher band, with Zagreb at top. US retirees typically use Foreign Tax Credit Form 1116 to offset this. Significant financial planning consideration entirely absent from original card. From 2025, Croatia also introduced annual property tax of €0.60-€8.00 per square meter set by municipality.',
  'Processing: typically 30-60 days. Apply at local police administration/station if entering visa-free or at Croatian consulate abroad. Address registration within 3 days of arrival mandatory.',
  'Temporary stay decision: €46.45. Biometric card: €31.85 standard / €59.73 accelerated. Issuance supplement: €9.29. Criminal background check apostille and translation: approximately €100-€200. Health insurance: approximately €40-€120/month mandatory since 2022. Property purchase costs if Route B: approximately 3-5% of property value taxes, notary, land registry. Prepaid rent if Route A: 12 months upfront. Total first-year estimated costs excluding rent/property: approximately €500-€1,200 in fees plus ongoing health insurance.',
  'Processing: typically 30-60 days. Apply at local police administration/station if entering visa-free or at Croatian consulate abroad.',
  'Permit validity: 1 year renewable for over-60 property owners; 6-month gap for others. No minimum age on any Croatian temporary residence category. Work permitted: No - other purposes permits do NOT authorize local employment. Path to PR: 5 years continuous residence → permanent residence. Continuity broken by required 6-month gaps between permits for most retirees. Schengen access: Croatian residence card allows 90 days/180 days in Schengen. Healthcare: Private insurance required until eligible for Croatian public system HZZO registration. Over-60 property owner renewal: New 2025 provision - most stable option for older retirees.',
  'https://mup.gov.hr/aliens-281621/281621',
  '2026-03-01'
);

-- ═══════════════════════════════════════════════════════════════════════════
-- INVESTOR/BUSINESS: No Golden Visa; Business Self-Employment Route + Property
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
  'croatia',
  'Investor',
  'Investor',
  'Croatia Investor / Business — No Golden Visa; Business Self-Employment Route (d.o.o.) + Property-Based Temporary Residence',
  'Original card describes Croatian Investor / Business Visa suggesting residence through real estate purchase or capital transfer with 1-5 years initially validity. CROATIA HAS NO GOLDEN VISA, NO RESIDENCE-BY-INVESTMENT PROGRAM, AND NO REAL ESTATE INVESTMENT VISA. Citizenx.com confirmed by official sources: Croatia does not have Golden Visa program. This fundamental fact, confirmed by Croatian immigration authorities and expert sources, contradicts widespread misinformation circulating in investment migration market. What Croatia actually offers for business-motivated non-EU residents is Work and Residence Permit through self-owned company d.o.o. or j.d.o.o. - demanding, operationally genuine business route requiring applicant to hire at least 3 Croatian citizens, pay themselves 1.5× average salary, and demonstrate active business operations. Property ownership can support temporary residence but NON-RENEWABLE for those under 60, and does NOT constitute golden visa. CROATIA HAS NO GOLDEN VISA, NO INVESTMENT VISA, NO REAL ESTATE INVESTOR VISA - ORIGINAL CARD DESCRIBES NON-EXISTENT PROGRAMS: Original card describes investment in approved assets, businesses, or government programs yielding 1-5 years initially. Multiple authoritative sources confirm Croatia deliberately does NOT have and will NOT introduce golden visa. Investropa.com June 2025: Croatia does not have official Golden Visa or direct citizenship-by-investment program like Portugal or Malta. Citizenx.com July 2025: confirmed by Croatian immigration authorities. 1-5 years validity claim does NOT correspond to any Croatian permit category standard permits 1-2 years. Widespread misinformation from immigration consultancy firms incorrectly markets standard Croatian residence permits as investment migration opportunities.',
  'BUSINESS ROUTE D.O.O. - REQUIREMENTS: Form Croatian d.o.o. LLC or j.d.o.o.: minimum share capital €25,000-€27,000. Employ at least 3 CROATIAN CITIZENS FULL-TIME at legally compliant salaries. Register all employees for pension and health insurance. Pay yourself salary of at least 1.5× CROATIAN AVERAGE NET SALARY. Demonstrate active, genuine business operations not shell company. Own at least 51% of company. Valid health insurance. Clean criminal record apostilled and translated. Seek prior approval if investment falls under new foreign investment screening law 2025. PROPERTY OWNERSHIP ROUTE - REQUIREMENTS: Own Croatian RESIDENTIAL PROPERTY any amount - no minimum price. Property must be in your name and zoned as residential. You must reside in property. Proof of financial means approximately €659/month. Health insurance valid in Croatia. Clean criminal record. Land registry entry Zemljišna knjiga confirming ownership. Property purchase takes 6+ months including land registry. US and most Western nationalities: can purchase freely under reciprocity agreements. ⚠️ DOES NOT COUNT TOWARD PERMANENT RESIDENCE.',
  'NO golden visa or investment visa exists; actual business route: d.o.o. with €25k-€27k capital + 3 Croatian employees + 1.5× average salary; property ownership gives 1-year non-renewable permit (does NOT count toward PR under age 60); foreign investment screening law 2025',
  'ACTUAL BUSINESS ROUTE GENUINELY DEMANDING - €25,000-€27,000 MINIMUM CAPITAL, 3 CROATIAN EMPLOYEES, ACTIVE OPERATIONS: To get residence through Croatian company you own, you must: 1 form d.o.o. minimum share capital €25,000-€27,000 or j.d.o.o.; 2 employ AT LEAST 3 CROATIAN CITIZENS FULL-TIME at minimum wage with all social security registered; 3 pay yourself salary of at least 1.5× AVERAGE CROATIAN NET SALARY; 4 demonstrate active, genuine business operations not shell company. Real business with real Croatian employees, not passive investment. Expatincroatia.com immigration lawyers strongly caution: Opening Croatian business for sole purpose of getting residence permit very demanding process. We definitely would NOT recommend it if you are not ready to take on all challenges. NEW FOREIGN INVESTMENT SCREENING LAW - NON-EU INVESTORS MUST SEEK PRIOR APPROVAL FOR CERTAIN INVESTMENTS: Croatia introduced FOREIGN INVESTMENT SCREENING LAW in 2025 requiring prior approval for certain non-EU investments before transaction finalized. Competent authority still being established as of mid-2025. Adds potential delays and regulatory complexity for non-EU citizens planning business investment in Croatia. Any non-EU citizen planning to invest in Croatian company should consult Croatian corporate lawyer before proceeding. PROPERTY OWNERSHIP PROVIDES TEMPORARY RESIDENCE BUT NOT GOLDEN VISA AND HAS MAJOR LIMITATIONS: Article 57 of Aliens Act allows non-EU citizens owning Croatian residential property to apply for temporary residence. Key limitations: no minimum purchase price required; property must be zoned residential and owner must live in it; permit 1 YEAR and NON-RENEWABLE for those under 60 6-month gap required before reapplying; TIME ON THIS PROPERTY PERMIT DOES NOT COUNT TOWARD PERMANENT RESIDENCE; employment NOT permitted. Purchasing Croatian property typically takes 6+ months including land registry processes. US citizens and most Western nationalities can buy property freely under reciprocity agreements verified as of June 2025. BUSINESS ROUTE ONLY INVESTMENT-ADJACENT PATH TO PERMANENT RESIDENCE - BUT TAKES 5+ YEARS: Unlike property-based permit, work and residence permit obtained through owning Croatian company DOES count toward 5-year permanent residence requirement. After 5 years continuous residence on this permit, applicant can apply for permanent residence; after 8 total years, Croatian citizenship may be possible language test + integration requirements. Genuine long-term residency pathway, but requires running actual business with Croatian employees throughout - NOT passive investment vehicle.',
  'Business route processing: 30-60 days for permit; company formation takes several months before that. Property route: 30-60 days for permit; property purchase takes 6+ months. Apply at local police station or Croatian embassy/consulate abroad. Address registration within 3 days mandatory.',
  'Administrative fee work and residence permit: €74.32. Biometric card: €31.85 standard / €59.73 accelerated. Some sources cite €83.62 for business applications; confirm current fee at MUP. d.o.o. formation costs: approximately €1,000-€3,000 legal, notary, registration. Minimum share capital: €25,000-€27,000 must be deposited. Employee costs: 3 Croatian employees at minimum wage + social contributions approximately €2,500-€3,500/month total. Your own salary: 1.5× average net salary approximately €2,000-€2,500/month. Property purchase costs: approximately 3-5% of property value taxes, notary, land registry. Accountant and legal ongoing: approximately €200-€500/month. Total first-year business route costs excluding capital: approximately €40,000-€60,000. Property route costs excluding purchase price: approximately €500-€1,000 in permit fees.',
  'Business route processing: 30-60 days for permit; company formation takes several months before that. Property route: 30-60 days for permit; property purchase takes 6+ months.',
  'Business permit validity: 1 year; renewable annually while business requirements maintained. Counts toward PR: Yes - 5 continuous years → permanent residence. Property permit validity: 1 year; NON-RENEWABLE for those under 60; 6-month gap required. Over-60 property owners can renew since 2025. Counts toward PR property: No. Work rights business: Only within own company registered activities. Work rights property: None. Golden visa / passive investment: Does NOT exist in Croatia. Citizenship: 8 years total 5 temp + 3 perm + Croatian language proficiency + integration. No fast-track for investors. Dual citizenship permitted.',
  'https://www.expatincroatia.com/golden-visa/',
  '2026-03-01'
);
