/*
  # Populate Argentina Immigration Pathways - Fact-Checked Feb 2026

  This migration adds comprehensive, fact-checked immigration pathway information for Argentina
  based on official sources (migraciones.gob.ar, cancilleria.gob.ar) as of February 2026.

  ## Pathways Included:
  1. **Work Visa (23A)** - Employment-based temporary residence
  2. **Student Visa** - For enrolled students in accredited institutions
  3. **Digital Nomad Visa** - Remote work visa (Provision 758/2022)
  4. **Retirement Visa (Pensionado)** - For pension recipients
  5. **Investor/Business Visa** - For business investment and entrepreneurs
  6. **Family Visa** - For family reunification

  ## Key Updates Incorporated:
  - May 2025 Decree DNU 366/2025 (stricter health insurance, new requirements)
  - Specific income thresholds and investment amounts
  - Accurate processing times and validity periods
  - MERCOSUR simplified procedures
  - Corrected eligibility criteria

  ## Security:
  - All pathways viewable by public (read-only via RLS)
*/

-- Delete existing Argentina pathways to avoid duplicates
DELETE FROM immigration_pathways WHERE destination_slug = 'argentina';

-- ═══════════════════════════════════════════════════════════════════════════════
-- 1. WORK VISA (Employment-Based Residence)
-- ═══════════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  requirements,
  key_requirements,
  processing_time,
  typical_timeline,
  validity_period,
  estimated_fees,
  official_url,
  official_links,
  last_updated
) VALUES (
  'any',
  'argentina',
  'Work',
  'Temporary Residence',
  'Argentina Work Visa (23A) & Employment Residency',
  'Argentina requires most non-MERCOSUR foreign nationals to obtain a formal work visa (Temporary Residence Visa) to work legally. The most common category is the 23A visa — a one-year renewable permit for salaried employment — or the 23E visa for intra-company transfers. Employer sponsorship is mandatory, and the employer must be registered with Argentina''s National Directorate of Migration (DNM) as an official sponsor.

MERCOSUR Advantage: Citizens of Brazil, Uruguay, Paraguay, Bolivia, Chile, Colombia, Ecuador, Peru, Venezuela, Guyana, and Suriname benefit from significantly simplified procedures under MERCOSUR agreements and face far fewer bureaucratic hurdles.

⚠️ LABOR MARKET TEST REQUIRED: Before sponsoring a non-MERCOSUR worker, employers must advertise the position with the Argentine Labor Office for up to 15 days to demonstrate no local candidate is available.',
  '• Valid job offer from a registered Argentine employer
• Employer must be enrolled in National Immigrant Sponsors Registrar (RNURE)
• Relevant qualifications for the role
• Labor market test must pass (employer obligation)
• MERCOSUR nationals: simplified process, fewer requirements
• No criminal record',
  '• Valid passport (min. 6 months validity, 2 blank pages)
• Formal employment contract (translated into Spanish)
• Police clearance certificate (apostilled)
• Medical certificate of good health
• Proof of accommodation in Argentina
• Visa application form + consular interview
• Government application fee (~USD $250)
• 2 passport-size photographs
• Employer''s RNURE registration documentation',
  'Valid job offer from registered employer, passport, police clearance, medical certificate, employment contract',
  '1–3 months',
  'Typically 1–3 months depending on consulate volume and documentation completeness. Apply at least 45 days before planned start date. Final DNM registration must be completed within 30 days of arrival.',
  '1 year, renewable annually. After 2 years of continuous legal residence, non-MERCOSUR nationals may apply for permanent residency. MERCOSUR nationals qualify after just 2 years.',
  'Government fee: ~USD $250. Additional costs: document translation, apostille services, legal fees (optional but recommended).',
  'https://www.cancilleria.gob.ar/en/services/working-visa',
  '[{"name": "Argentina Ministry of Foreign Affairs - Work Visa", "url": "https://www.cancilleria.gob.ar/en/services/working-visa"}, {"name": "National Directorate of Migration", "url": "https://www.migraciones.gov.ar"}]'::jsonb,
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════════
-- 2. STUDENT VISA
-- ═══════════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  requirements,
  key_requirements,
  processing_time,
  typical_timeline,
  validity_period,
  estimated_fees,
  official_url,
  official_links,
  last_updated
) VALUES (
  'any',
  'argentina',
  'Study',
  'Temporary Residence',
  'Argentina Student Visa',
  'International students enrolled in accredited Argentine educational institutions may apply for a student residence permit. Argentina is home to several world-class public universities — notably the University of Buenos Aires (UBA) — many of which offer free or low-cost tuition.

🏛️ 2025 POLICY UPDATE (Decree DNU 366/2025): National universities may now charge tuition fees to temporary residents based on internal regulations. Previously, public university education was universally free. Confirm fee status with your institution before applying.

Language: Most public university programs are taught in Spanish. Language proficiency proof (e.g., DELE certificate) may be required by the institution.',
  '• Accepted by a recognized Argentine educational institution
• Full-time enrollment required
• Proof of sufficient funds to support yourself
• Some institutions require Spanish language proficiency
• No minimum age, but minors need parental authorization',
  '• Valid passport (min. 6 months validity)
• Official letter of acceptance from institution
• Proof of financial means (bank statements)
• Health insurance valid in Argentina (mandatory)
• Proof of accommodation
• Academic transcripts from previous education
• Language test results (if required by institution)
• Criminal background check (apostilled)
• Application fees',
  'Acceptance letter from accredited institution, passport, financial proof, health insurance, academic transcripts',
  '2–8 weeks',
  'Typically 2–8 weeks, though consular processing varies by location and time of year. Apply well in advance of the academic term — peak periods (February and August) see higher demand.',
  'Valid for duration of enrolled studies plus a short grace period upon completion. Renewable while continuing education. After 2 years of legal residency, students may apply for permanent residency.',
  'Visa application fee varies by consulate (~USD $150–300). University tuition ranges from free (some public universities) to USD $5,000–15,000/year (private institutions).',
  'https://www.migraciones.gov.ar',
  '[{"name": "National Directorate of Migration", "url": "https://www.migraciones.gov.ar"}, {"name": "University of Buenos Aires", "url": "https://www.uba.ar"}]'::jsonb,
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════════
-- 3. DIGITAL NOMAD VISA
-- ═══════════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  requirements,
  key_requirements,
  processing_time,
  typical_timeline,
  validity_period,
  estimated_fees,
  official_url,
  official_links,
  last_updated
) VALUES (
  'any',
  'argentina',
  'Digital Nomad',
  'Transitional Residence',
  'Argentina Digital Nomad / Remote Work Visa',
  'Argentina officially launched its Digital Nomad Visa in May 2022 (DNM Provision No. 758/2022), called Nómadas Digitales. It grants a transitional residency permit for remote workers who earn income exclusively from foreign employers or clients. The visa is available entirely online via the TIE 24H system — one of the most streamlined digital nomad programs in Latin America.

⚠️ ELIGIBILITY RESTRICTION: This visa is ONLY available to nationals of visa-exempt countries (those who can enter Argentina as tourists without a visa). Citizens requiring a tourist visa must pursue a different pathway.

⚠️ WORK RESTRICTION: Holders may NOT work for any Argentine company or client. All income must come from employers or clients based outside Argentina.

✓ TAX BENEFIT: Visa holders are exempt from Argentine income tax on foreign-sourced income for the first 12 months.',
  '• National of a visa-exempt country (US, EU, UK, Canada, Australia, most of Latin America, etc.)
• Proof of remote employment or freelance work for foreign clients
• Minimum income: ~USD $2,500/month (commonly cited, though no official threshold published)
• Income must be regular and verifiable (pay slips, contracts, bank statements)
• Must not work for Argentine employers',
  '• Valid passport (min. 6 months validity)
• Proof of remote work arrangement (employment contract, client contracts, invoices)
• Brief CV detailing work history and qualifications
• Signed application note explaining purpose of stay
• Income statements or bank statements showing foreign income
• Health insurance valid in Argentina
• Criminal background check (apostilled, translated into Spanish)
• Application fee: ~USD $200 total (USD $120 migration + USD $80 consular fee)',
  'Remote work proof, passport, income statements (USD $2,500+/month), health insurance, criminal background check',
  '10 business days',
  '10 business days for online TIE 24H applications. Consular applications (for those applying from abroad) take longer, typically 4–6 weeks.',
  '180 days (6 months). Can be extended once for an additional 180 days, giving a maximum continuous stay of 12 months total. After that, must leave or transition to a different visa category.',
  'Application fee: ~USD $200 (USD $120 migration + USD $80 consular fee)',
  'https://www.migraciones.gov.ar',
  '[{"name": "National Directorate of Migration - Digital Nomad", "url": "https://www.migraciones.gov.ar"}, {"name": "RaDEX Online System", "url": "https://www.argentina.gob.ar/interior/migraciones/radex"}]'::jsonb,
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════════
-- 4. RETIREMENT VISA (Pensionado)
-- ═══════════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  requirements,
  key_requirements,
  processing_time,
  typical_timeline,
  validity_period,
  estimated_fees,
  official_url,
  official_links,
  last_updated
) VALUES (
  'any',
  'argentina',
  'Retirement',
  'Temporary Residence',
  'Argentina Retirement Visa (Pensionado)',
  'The Pensionado Visa (regulated under Law No. 25,871, Art. 23) is Argentina''s dedicated retirement pathway for foreigners who receive a pension or retirement benefit from a government or recognized private institution abroad. Both this and the Rentista Visa lead to permanent residency and eventually citizenship, which Argentina allows alongside your existing nationality.

⚠️ INCOME REQUIREMENT: You must demonstrate a monthly pension income equivalent to 5× Argentina''s minimum wage — approximately USD $1,390–$2,000/month (exact amount fluctuates with inflation and official exchange rate). This threshold is tied dynamically to the minimum wage, updated periodically.

🏛️ MAY 2025 POLICY UPDATE (Decree DNU 366/2025): All applicants must now provide mandatory health insurance and a sworn declaration of entry purpose. Temporary residents must not leave Argentina for more than 6 months or risk losing their status.',
  '• Receiving a pension or retirement benefit from abroad
• Minimum monthly income: 5× Argentine minimum wage (~USD $1,390–$2,000 in 2025)
• Clean criminal record (Argentina + countries of prior residence)
• Must not work as an employee in Argentina (business ownership permitted)
• Below-retirement-age applicants must show 2+ years of qualifying income',
  '• Valid passport
• Proof of pension / retirement income (bank statements, official pension documentation)
• Funds must be transferred monthly to an Argentine bank account
• Argentine criminal record (via RaDEX system)
• Foreign criminal record certificate (apostilled, translated into Spanish)
• Private health insurance valid in Argentina (mandatory since May 2025)
• Proof of accommodation in Argentina
• Sworn declaration of entry purpose (required since May 2025)',
  'Pension proof (USD $1,390–$2,000/month), passport, criminal records, health insurance, Argentine bank account',
  '2–6 months',
  '2–6 months depending on completeness of documentation and reviewing consulate. Applications via RaDEX online system if already in Argentina, or through consulate abroad.',
  '1 year, renewable annually. After 3 years of temporary residency (non-MERCOSUR), apply for permanent residency. Argentine citizenship eligibility comes after just 2 years of continuous legal residence.',
  'Visa application fee: ~USD $200–300. Additional: document translation/apostille, legal fees if using attorney.',
  'https://www.migraciones.gov.ar',
  '[{"name": "National Directorate of Migration", "url": "https://www.migraciones.gov.ar"}, {"name": "RaDEX System", "url": "https://www.argentina.gob.ar/interior/migraciones/radex"}]'::jsonb,
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════════
-- 5. INVESTOR / BUSINESS VISA
-- ═══════════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  requirements,
  key_requirements,
  processing_time,
  typical_timeline,
  validity_period,
  estimated_fees,
  official_url,
  official_links,
  last_updated
) VALUES (
  'any',
  'argentina',
  'Investor',
  'Temporary Residence',
  'Argentina Investor / Business Visa',
  'Argentina offers an investor residency pathway for foreign nationals who make a qualifying financial investment in the country. Unlike many global "golden visa" programs with multimillion-dollar thresholds, Argentina''s entry point is relatively accessible. The investment can take several forms — business creation, real estate, or capital injection into a productive activity.

ℹ️ MINIMUM INVESTMENT THRESHOLD: The current requirement is a minimum investment of approximately ARS 1,500,000 (around USD $1,500–$2,000 depending on exchange rate) in a productive, commercial, or service-based activity. This is notably low by international standards, though the amount is subject to change due to Argentina''s inflation.

🏛️ UPCOMING: A new Citizenship by Investment initiative is expected late 2025/2026 requiring USD $500,000+ into key sectors. This would be a separate, premium track.

✓ RENTISTA VS. INVESTOR: If your income is purely passive (dividends, rent, interest) rather than active business, the Rentista Visa may be more appropriate (requires ~USD $1,400–$2,000/month passive income).',
  '• Minimum investment of ~ARS 1,500,000 (~USD $1,500–$2,000) in an Argentine productive or commercial activity
• Investment must be in an approved sector (business, real estate, services)
• Clean criminal record
• May employ Argentine workers (viewed favorably)
• Must demonstrate ongoing management or involvement in the investment',
  '• Valid passport
• Proof of investment or capital transfer (wire records, property title, corporate documents)
• Business plan (if starting a new enterprise)
• Source of funds documentation (bank statements, tax records)
• Argentine criminal record (RaDEX)
• Foreign criminal record (apostilled, translated)
• Private health insurance (mandatory since May 2025)
• Sworn declaration of entry purpose',
  'Investment proof (ARS 1,500,000 / USD $1,500–$2,000+), business plan, source of funds, passport, criminal records',
  '3–12 months',
  '3–12 months depending on investment complexity and due diligence. Straightforward business registrations process faster; large real estate or multi-party investments take longer.',
  '1–2 years initially, renewable provided investment activity continues. After 3 years of legal temporary residency, apply for permanent residency. Argentine citizenship can be pursued after 2 years of continuous residence.',
  'Investment: minimum ~USD $1,500–$2,000 (varies with exchange rate). Visa fees: ~USD $200–300. Legal/business setup: USD $1,000–5,000+.',
  'https://www.migraciones.gov.ar',
  '[{"name": "National Directorate of Migration", "url": "https://www.migraciones.gov.ar"}, {"name": "Argentina Investment Promotion Agency", "url": "https://www.inversionycomercio.org.ar"}]'::jsonb,
  '2026-02-28'
);

-- ═══════════════════════════════════════════════════════════════════════════════
-- 6. FAMILY VISA (Family Reunification)
-- ═══════════════════════════════════════════════════════════════════════════════
INSERT INTO immigration_pathways (
  passport_slug,
  destination_slug,
  goal,
  pathway_type,
  pathway_name,
  summary,
  eligibility,
  requirements,
  key_requirements,
  processing_time,
  typical_timeline,
  validity_period,
  estimated_fees,
  official_url,
  official_links,
  last_updated
) VALUES (
  'any',
  'argentina',
  'Family',
  'Temporary Residence',
  'Argentina Family Reunification Visa',
  'Argentina provides a family reunification pathway allowing foreign nationals to join immediate family members who are Argentine citizens, permanent residents, or temporary residents legally established in Argentina. This includes spouses, registered domestic partners, minor children, and in some cases parents and adult children with disabilities.

The family reunification process is relatively straightforward compared to many countries, and Argentina recognizes both traditional marriages and civil unions. Same-sex marriages and civil unions are fully recognized under Argentine law (Marriage Equality Law 26.618, passed 2010).

🏛️ MAY 2025 UPDATE (Decree DNU 366/2025): All family reunification applicants must now provide mandatory health insurance and sworn declaration of entry purpose. Stricter verification of family relationships applies.',
  '• Immediate family member (spouse, domestic partner, minor child, or dependent) of:
  - Argentine citizen
  - Argentine permanent resident
  - Foreign national with valid temporary residence in Argentina
• Proven family relationship (marriage certificate, birth certificate, civil union registration)
• Sponsor must demonstrate financial capacity to support family member
• Clean criminal record',
  '• Valid passport (min. 6 months validity)
• Proof of family relationship (marriage certificate, birth certificate, civil union registration — apostilled and translated)
• Sponsor''s Argentine DNI or valid residence permit
• Sponsor''s proof of income/financial capacity (employment letter, bank statements)
• Criminal background check (apostilled, translated)
• Health insurance valid in Argentina (mandatory since May 2025)
• Proof of accommodation in Argentina
• Sworn declaration of entry purpose',
  'Proof of family relationship, sponsor''s DNI/residence permit, financial capacity proof, passport, criminal record, health insurance',
  '2–6 months',
  '2–6 months depending on documentation completeness and consular processing times. Applications submitted within Argentina via RaDEX typically process faster than consular applications.',
  '1 year initially, renewable annually while family relationship continues. After 3 years (non-MERCOSUR) or 2 years (MERCOSUR family members), eligible for permanent residency. Citizenship after 2 years continuous residence.',
  'Visa application fee: ~USD $150–250. Additional: document translation/apostille services.',
  'https://www.migraciones.gov.ar',
  '[{"name": "National Directorate of Migration", "url": "https://www.migraciones.gov.ar"}, {"name": "RaDEX System", "url": "https://www.argentina.gob.ar/interior/migraciones/radex"}]'::jsonb,
  '2026-02-28'
);
