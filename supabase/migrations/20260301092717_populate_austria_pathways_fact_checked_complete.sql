/*
  # Populate Austria Immigration Pathways - Fact-Checked (Complete)

  1. Summary
    - Adds comprehensive, fact-checked immigration pathways for Austria
    - Based on official migration.gv.at sources (verified Feb 2026)
    - Corrects inaccuracies in previous generic data
    - Includes Red-White-Red Card system details
    - Clarifies that Austria has NO digital nomad visa

  2. Content Details
    - Work Visa: Red-White-Red Card system with 7 streams, points-based
    - Student Visa: Two-stage process (Visa D + Residence Permit)
    - Digital Nomad: DOES NOT EXIST - clarified with alternatives
    - Retirement: Settlement Permit - Gainful Employment Excluded (quota-based)
    - Investor: RWR Card for Self-Employed and Start-Up Founders

  3. Important Notes
    - All data verified against official Austrian government sources
    - Includes specific salary thresholds, processing times, validity periods
    - Highlights quota systems and German language requirements
    - Provides accurate official URLs and last updated dates
*/

-- Delete any existing Austria pathways to avoid duplicates
DELETE FROM immigration_pathways WHERE destination_slug = 'austria';

-- ═══════════════════════════════════════════════════════════════════════════
-- WORK VISA: Red-White-Red Card System
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
  'austria',
  'Work',
  'Work',
  'Austria Work Visa & Employment Residency (Red-White-Red Card)',
  'Austria operates a highly structured points-based immigration system centered on the Red-White-Red Card (Rot-Weiß-Rot – Karte), a combined residence and work permit covering skilled workers, startup founders, and self-employed key workers. There are seven distinct streams with different point thresholds and salary minimums. The RWR Card ties the holder to a single named employer for its initial 24-month validity. After 21 months, holders can apply for the RWR Card Plus (3 years, free labour market access). The EU Blue Card is an alternative for very high earners.',
  'Very Highly Qualified Workers: 70+ points (education, experience, language, age) - includes researchers, senior academics, artists. No labour market test. Skilled Workers in Shortage Occupations: Must appear on official annual shortage list (IT, engineering, healthcare, construction). 55+ points. Other Key Workers: Job offer from Austrian employer; 55+ points; minimum €3,465/month gross (2026); AMS labour market test. Graduates of Austrian Universities: Completed degree at accredited Austrian university with job offer - no points test or salary threshold. Job Seeker Visa: 70+ points for 6-month job search visa.',
  'Job offer from Austrian employer (except Very Highly Qualified Workers); 55-70+ points depending on stream; minimum salary €3,465/month for Other Key Workers (2026); health insurance; accommodation proof; German A1 level encouraged',
  'Valid passport; completed application form (submitted in person at Austrian embassy/consulate); employment contract or binding job offer from Austrian employer; proof of qualifications/educational certificates (officially translated and legalised); points test evidence (work experience references, language certificates); health insurance covering all risks in Austria; proof of adequate accommodation (lease contract); proof of financial means; criminal background check (home country + any country of 12+ months residence); application fee ~€218',
  'Total timeline 2–4 months from first contact to RWR Card in hand',
  'Application fee: ~€218. Translation and legalisation of documents: €200–€500. Language test certificates: €150–€250. Health insurance: variable depending on provider.',
  '8 weeks statutory decision deadline from full application submission. AMS has 3 weeks within that window to issue expertise. Apply well in advance of intended start date.',
  'RWR Card: 24 months, tied to named employer. After 21 months: RWR Card Plus (3 years, free labour market access). After 5 years: Long-Term Residence – EU (permanent). Austrian citizenship: After 10 years (6 years exceptional). Integration Agreement: German A2 (Module 1) and B1 (Module 2) required.',
  'https://www.migration.gv.at/en/types-of-immigration/permanent-immigration/',
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
  'austria',
  'Study',
  'Study',
  'Austria Student Visa & Residence Permit',
  'Austrian student immigration has a two-stage structure: Visa D (91 days to 6 months) followed by Residence Permit – Student for longer programmes. Students under 24 must prove €703.58/month; students 24+ must prove €1,273.99/month. Non-EU students can work up to 20 hours/week during term. After completing a degree, graduates can extend residence permit by 12 months to search for employment, then apply for RWR Card for Graduates without salary threshold or points test.',
  'Accepted by recognised Austrian university, university of applied sciences, or accredited private university. EU/EEA/Swiss citizens need no visa. Third-country nationals need Visa D or Residence Permit – Student. Must be enrolled full-time. Language: German B2/C1 for German-taught courses; IELTS 6.0–7.0 for English-taught. Academic progress: 16 ECTS/year for renewals. Module 1 Integration Agreement (A2 German) required for renewal after 24 months.',
  'University admission letter; proof of €703.58/month (under 24) or €1,273.99/month (24+); health insurance; accommodation proof; language test results; German A2 for renewal after 24 months',
  'Valid passport; letter of admission/acceptance from Austrian university; proof of financial means (bank statements, scholarship letters, guarantee letter); health insurance valid in Austria – switch to ÖGK after arrival; proof of accommodation; academic transcripts; language test results; passport photo (45×35mm); birth certificate (translated); application fee ~€100–€160; register at local Meldeamt within 3 working days',
  'Visa D: 15–30 days. Residence Permit: 3–6 months. Start process 3–6 months before course begins',
  'Visa D application fee: ~€100–€160. Residence permit fee: ~€160. Language test: €150–€250. Document translations: €100–€300. Student health insurance (ÖGK): ~€66/month. Financial proof: €703.58/month (under 24) or €1,273.99/month (24+).',
  'Visa D: ~15–30 days at most consulates. Apply no more than 3 months before departure. Residence Permit – Student: 3–6 months from Austrian authorities. Apply after arrival on Visa D, before it expires.',
  'Visa D: 91 days–6 months (cannot be extended). Residence Permit – Student: Initially 12 months, renewable annually. Renewals require 16 ECTS/year progress. After 3 years: may be issued for 3 years if Module 1 completed. Post-graduation: 12-month job search extension. After 5 years: eligible for Long-Term Residence – EU.',
  'https://www.migration.gv.at/en/types-of-immigration/studying-in-austria/',
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
  'austria',
  'Digital Nomad',
  'Digital Nomad',
  'Digital Nomad / Remote Work Visa [DOES NOT EXIST]',
  '⚠️ CRITICAL: Austria does NOT have a Digital Nomad Visa. This visa does not exist and has never been introduced in Austrian law. Working remotely in Austria on a tourist/Schengen visa is explicitly illegal, confirmed by Austrian embassies. EU/EEA/Swiss citizens have freedom of movement and can work remotely in Austria (must register if staying 3+ months; 183+ days triggers tax residency). Non-EU nationals who wish to run their own business in Austria can apply for the RWR Card for Self-Employed Key Workers or Start-Up Founders – but these require business plans, €50k–€100k investment, points assessment, and AMS evaluation.',
  'This visa category does not exist in Austrian immigration law. EU/EEA/Swiss citizens can work remotely under freedom of movement (register if 3+ months). Non-EU nationals must establish active business via RWR Card for Self-Employed (€100k+ investment, business plan, 50+ points, AMS review) or obtain Settlement Permit – Gainful Employment Excluded (passive residency only, NO work permitted). Working on tourist visa is illegal.',
  'N/A – This visa does not exist. No remote work visa available for non-EU nationals.',
  'Non-EU nationals cannot obtain a visa for remote work in Austria. The only legal pathways are: (1) RWR Card for Self-Employed Key Workers (€100k+ investment, active business, AMS approval, points test), or (2) Settlement Permit – Gainful Employment Excluded (passive residency, NO work including remote work).',
  'N/A – This visa does not exist.',
  'N/A – This visa does not exist. For RWR Card for Self-Employed: application fee ~€218, business establishment costs €100,000+.',
  'N/A – This visa category does not exist in Austrian immigration law.',
  'N/A – This visa does not exist. Monitor migration.gv.at for future announcements.',
  'https://www.migration.gv.at/en/types-of-immigration/permanent-immigration/',
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
  'austria',
  'Retirement',
  'Retirement',
  'Austria Retirement & Financially Independent Residence (Settlement Permit – Gainful Employment Excluded)',
  'Austria does NOT have a "retirement visa." The correct instrument is the Settlement Permit – Gainful Employment Excluded (Niederlassungsbewilligung – ausgenommen Erwerbstätigkeit). Subject to annual quota of ~300 places nationally. Income must be ~€2,435/month single or ~€3,844/month couple (2025/2026) from passive sources only – pensions, dividends, rental income, NOT employment. German A1 required at application. No minimum age. This permit allows residency only – NO work of any kind including remote work.',
  'Third-country national (non-EU/EEA/Swiss). Regular passive income ≥ twice standard reference rates (~€2,435/month single; ~€3,844/month couple – 2025/2026). Income sources: Austrian or foreign pensions, business profits abroad, dividends, rental income – NO employment income. Quota place must be available in current year. Comprehensive health insurance covering all risks. Adequate accommodation. German A1 language proficiency at initial application. Clean criminal record.',
  'Passive income €2,435/month (single) or €3,844/month (couple); alternatively €50k+ liquid funds; health insurance; accommodation; German A1 certificate; quota place available; NO work permitted',
  'Valid passport; birth certificate (translated and apostilled); proof of regular income: pension statements, investment income, bank certificates – must cover 12+ months; alternatively ~€50k+ liquid funds on accessible account; comprehensive private health insurance (equivalent to Austrian public coverage); lease contract or title deed; German A1 certificate (Goethe-Institut or ÖSD); police clearance from home country and any country of 12+ months residence; passport photo (45×35mm); application in person at Austrian embassy/consulate; fee ~€160–€218',
  '4–8+ months from initial application to arrival in Austria',
  'Application fee: ~€160–€218. German A1 language course and test: €300–€600. Document translations and apostille: €200–€500. Private health insurance: €200–€500/month. Proof of income: €2,435/month (single) or €3,844/month (couple), OR €50,000+ in liquid funds.',
  'Embassy appointment: Several weeks wait. Application forwarded to Austria: Consulate reviews and forwards to residence authority. Decision: Several months – quota availability must be confirmed. D-Visa collection: After approval, obtain Visa D to enter Austria and collect permit card. Total: 4–8+ months.',
  'Initial permit: 12 months. Renewal: 3 years if A2 German (Module 1) completed and 2 years residence proven. No work rights – residency only, NO employment including remote work. After 5 years: eligible for Long-Term Residence – EU (permanent). Austrian citizenship: After 10 years (6 years exceptional) – requires B1 German. Schengen benefit: Visa-free travel across 27 Schengen countries (up to 90 days per 180 days outside Austria). Healthcare: May register with ÖGK.',
  'https://www.migration.gv.at/en/types-of-immigration/permanent-immigration/other-forms-of-settlement/',
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
  'austria',
  'Investor',
  'Investor',
  'Austria Investor / Business Residence (RWR Card for Self-Employed & Start-Up Founders)',
  'Austria has NO golden visa or passive investor programme. All investor routes require active business establishment. Two routes: (1) RWR Card for Self-Employed Key Workers (€100k+ investment, active business, job creation); (2) RWR Card for Start-Up Founders (€30k–€50k+ investment, innovative business, 50+ points). Both require business plan, AMS evaluation, points assessment. Unlike Portugal/Greece/Malta, Austria does not offer residency for real estate purchase or passive financial investment. 2024 incentives: FlexCo structure, 23% corporate tax (down from 25%), favourable employee equity tax treatment.',
  'Route 1 (Self-Employed): €100k+ capital transfer to Austria. Business must create/secure jobs, transfer know-how/new technologies, or be regionally significant. Points on qualifications, experience, language. Applicant must control business (majority ownership or management). Route 2 (Start-Up): €30k–€50k+ investment with 50%+ equity. Business must develop innovative products/services/technologies under approved business plan. 50+ points. Bonus: admission to Austrian business incubator or startup agency funding.',
  'Minimum €100k investment (Self-Employed) or €30k–€50k (Start-Up); detailed business plan; 50+ points; AMS approval of economic benefit; active business establishment in Austria',
  'Valid passport; detailed coherent business plan demonstrating innovation and economic benefit; evidence of investment capital/equity; articles of association (if company established); proof of qualifications (degree certificates, translated and legalised); work experience proof (references, employment records); language certificates (German or English, internationally recognised); health insurance covering all risks; proof of adequate accommodation; police clearance; proof of financial subsistence (salary from company or personal assets). AMS issues expertise within 3 weeks.',
  '3–5 months total process including document gathering and Visa D collection',
  'Application fee: ~€218. Minimum investment: €100,000 (Self-Employed) or €30,000–€50,000 (Start-Up). Business establishment costs: €5,000–€10,000. Legal and accounting fees: €3,000–€10,000. Document translations and certifications: €500–€1,000. Language test certificates: €150–€250.',
  '4–8 weeks standard once complete application submitted (AMS: 3 weeks; residence authority: within 8-week total window). Total: 3–5 months including document gathering and Visa D collection.',
  'RWR Card (both routes): 24 months. After 21 months (if business requirements met): RWR Card Plus – 3 years, free labour market access. Business must be successfully realised: operating, providing salary, financially viable. After 5 years: Long-Term Residence – EU (permanent). Austrian citizenship: After 10 years (6 years exceptional).',
  'https://www.migration.gv.at/en/types-of-immigration/permanent-immigration/start-up-founders/',
  '2026-02-28'
);
