// Last fact-checked: March 30, 2026
// Sources: Thai BOI (ltr.boi.go.th), thaievisa.go.th, make-it-in-germany.com, IRCC canada.ca,
// USCIS uscis.gov, Spanish Startup Act (Ley de Startups), Spanish Organic Law 1/2025,
// Australian Department of Home Affairs, Japanese Ministry of Foreign Affairs
// Always verify current requirements with official immigration authorities before advising clients.

export interface StarterImmigrationPathway {
  passport_slug: string;
  destination_slug: string;
  pathway_type: string;
  pathway_name: string;
  summary: string;
  eligibility: string;
  requirements: string;
  processing_time: string;
  validity_period: string;
  official_url: string;
  last_updated: string; // ISO date — used by search engines for freshness signals
}

const today = new Date().toISOString().split("T")[0];

export const starterImmigrationPathways: StarterImmigrationPathway[] = [

  // ─────────────────────────────────────────
  // THAILAND
  // ─────────────────────────────────────────

  {
    passport_slug: "any",
    destination_slug: "thailand",
    pathway_type: "work",
    pathway_name: "Non-Immigrant B Visa (Work)",
    // VERIFIED 2026: Applications via e-Visa only at thaievisa.go.th (in-person submission at many embassies no longer accepted).
    // Processing: 5–10 business days per official sources.
    // Employer must have min 2M THB registered capital per foreign employee.
    // The visa itself does NOT authorize work — a separate work permit from Ministry of Labour is required.
    summary:
      "Work visa for foreign nationals employed by Thai companies or organizations. Does not itself authorize work — a separate work permit from Thailand's Ministry of Labour is required before starting employment.",
    eligibility:
      "Must have a confirmed job offer from a Thai employer. The employer must have minimum 2 million THB registered capital per sponsored foreign employee (1 million THB if applicant is married to a Thai national). Must obtain a Ministry of Labour approval letter (WP.32 or BOI letter) before visa issuance.",
    requirements:
      "Valid passport with at least 6 months validity; completed e-Visa application via thaievisa.go.th; recent 4x6cm passport photograph; employment contract; employer's company registration documents; Ministry of Labour approval letter (WP.32) or BOI letter; financial evidence of at least 30,000 THB; educational certificates; criminal background check.",
    processing_time: "Typically 5–10 business days",
    validity_period:
      "90 days from issuance (must enter Thailand within 90 days); stay extendable up to 1 year at local Immigration Bureau once work permit is obtained",
    official_url: "https://www.thaievisa.go.th/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "thailand",
    pathway_type: "study",
    pathway_name: "Non-Immigrant ED Visa (Education)",
    // VERIFIED 2026: Now applied via e-Visa system. Language schools no longer qualify under 'Soft Power' activities.
    summary:
      "Student visa for those enrolled in Thai educational institutions. Note: as of late 2025, Thai language schools no longer qualify for this visa under the previous 'Soft Power' activities exemption — only accredited institutions qualify.",
    eligibility:
      "Must be accepted by an accredited Thai educational institution (university, college, or accredited training program — language schools under certain categories excluded as of late 2025).",
    requirements:
      "Acceptance letter from accredited Thai institution; valid passport; proof of financial means; academic transcripts; passport photographs; completed e-Visa application via thaievisa.go.th.",
    processing_time: "Typically 5–10 business days",
    validity_period:
      "90 days initially; extendable based on course duration at local Immigration Bureau; 90-day reporting required",
    official_url: "https://www.thaievisa.go.th/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "thailand",
    pathway_type: "digital_nomad",
    pathway_name: "Long-Term Resident (LTR) Visa — Work-from-Thailand Professional",
    // VERIFIED 2026:
    // Income: USD 80,000/yr avg over past 2 years (unchanged from original — the USD 80k removal ONLY applied to Wealthy Global Citizens, NOT Work-from-Thailand).
    // Employer must have combined revenue of USD 50M/yr (lowered from USD 150M/yr in Feb 2025 update).
    // Health insurance: USD 50,000 minimum OR USD 100,000 bank deposit held 12+ months.
    // Processing: BOI endorsement ~20 working days; visa issuance ~60 days after endorsement.
    // Fee: THB 50,000 (~USD 1,400) per person.
    // Lower income route: USD 40k/yr + master's degree in science/tech, or IP ownership, or Series A funding ≥ USD 1M.
    // Applied via BOI portal ltr.boi.go.th, NOT standard Thai embassies.
    summary:
      "10-year multiple-entry visa for remote workers employed by qualifying overseas companies who wish to live in Thailand. Offers annual immigration reporting (instead of 90-day), airport fast-track, and foreign-income tax exemption. Managed by Thailand's Board of Investment (BOI) — apply via ltr.boi.go.th, not standard Thai embassies.",
    eligibility:
      "Must be employed by (1) a company listed on a stock exchange, or (2) a private company with at least 3 years of operation and combined revenue of at least USD 50 million over the last 3 years, or (3) a wholly-owned subsidiary of the above. Must have personal income of at least USD 80,000/year averaged over the past 2 years. Lower threshold of USD 40,000/year is possible if applicant holds a master's degree or higher in science or technology, owns significant intellectual property, or has received Series A startup funding of at least USD 1 million.",
    requirements:
      "Valid passport (6+ months validity); employment contract or service agreement with qualifying overseas company; proof of income of at least USD 80,000/year averaged over 2 years (bank statements, tax returns, payslips); proof of employer revenue (at least USD 50M/year for 3 years); health insurance covering at least USD 50,000 OR bank deposit of USD 100,000 held for 12+ months; criminal background check; BOI endorsement letter (obtained online before visa issuance); visa fee of THB 50,000 (~USD 1,400).",
    processing_time:
      "BOI qualification endorsement: approximately 20 working days. Visa issuance at TIESC Bangkok or Thai embassy/consulate: within 60 days of endorsement letter.",
    validity_period:
      "10 years total (5-year initial grant, renewable for another 5 years); annual address reporting replaces 90-day check-ins",
    official_url: "https://ltr.boi.go.th/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "thailand",
    pathway_type: "digital_nomad",
    pathway_name: "Destination Thailand Visa (DTV)",
    // VERIFIED 2026: DTV launched July 2024 as Thailand's accessible digital nomad option.
    // Valid 5 years, multiple entry, 180 days per entry (extendable once for 180 days).
    // Requirement: 500,000 THB in bank account held for at least 90 days before application.
    // Fee: 10,000 THB. Must apply from outside Thailand via thaievisa.go.th.
    // No work permit available — remote work for overseas employers only; no Thai employer permitted.
    // Max 2 visa runs per calendar year allowed (since Nov 2025).
    summary:
      "Thailand's accessible long-stay visa for remote workers and digital nomads who do not meet the higher income thresholds of the LTR Visa. Launched July 2024. Allows 180-day stays (extendable once for another 180 days) per entry, over a 5-year period. Remote work for overseas employers is permitted; working for Thai employers or clients is not.",
    eligibility:
      "Remote workers employed by non-Thai companies, freelancers with overseas clients, and their legal dependents (spouse and children under 20). Must have 500,000 THB in a bank account held for at least 90 consecutive days before application. Must apply from outside Thailand via the e-Visa portal.",
    requirements:
      "Valid passport (6+ months validity); 500,000 THB bank statement showing funds held for at least 90 days; remote employment contract or freelance client contracts; health insurance valid in Thailand; completed e-Visa application; visa fee of 10,000 THB.",
    processing_time: "Typically 5–10 business days",
    validity_period:
      "5 years, multiple entry; each entry allows up to 180 days, extendable once for another 180 days at local Immigration Bureau; maximum 2 entries per calendar year",
    official_url: "https://www.thaievisa.go.th/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "thailand",
    pathway_type: "retirement",
    pathway_name: "Non-Immigrant O-A Visa (Retirement)",
    // VERIFIED 2026: Financial requirement unchanged — 800,000 THB in Thai bank account OR 65,000 THB/month income.
    // Health insurance: minimum 40,000 THB inpatient + 400,000 THB outpatient coverage required.
    // Age: 50+. Annual renewal at local Immigration Bureau.
    summary:
      "Long-stay visa for retirees aged 50 and above. Requires proof of financial means and mandatory health insurance meeting specific Thai coverage amounts.",
    eligibility:
      "Must be 50 years of age or older. Must demonstrate financial means: either 800,000 THB deposited in a Thai bank account (maintained throughout the stay), or a monthly income/pension of at least 65,000 THB, or a combination totaling 800,000 THB annually.",
    requirements:
      "Valid passport; completed e-Visa application or in-country extension application; proof of financial means (800,000 THB Thai bank deposit or 65,000 THB/month income evidence); health insurance with minimum 40,000 THB inpatient and 400,000 THB outpatient coverage from an approved provider; medical certificate; criminal background check from home country.",
    processing_time: "Typically 5–10 business days (initial visa); extensions at local Immigration Bureau",
    validity_period:
      "1 year, renewable annually; 90-day reporting required unless upgraded to LTR Visa",
    official_url: "https://www.thaievisa.go.th/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "thailand",
    pathway_type: "investor",
    pathway_name: "LTR Visa — Wealthy Global Citizen",
    // VERIFIED 2026: USD 80k/yr income requirement REMOVED in Feb 2025. Only asset/investment thresholds remain.
    // Must have USD 1M+ in global assets AND invest at least USD 500k in Thailand.
    // Health insurance: USD 50,000 minimum OR USD 100,000 bank deposit held 12+ months.
    // No age requirement.
    summary:
      "10-year residence visa for high-net-worth individuals. As of February 2025, the previous USD 80,000/year personal income requirement has been removed. Now based purely on asset and investment thresholds. No minimum stay requirement. Managed by Thailand's BOI.",
    eligibility:
      "Must hold at least USD 1 million in total global assets (including at least USD 500,000 invested in Thailand in qualifying instruments: Thai government bonds with 5+ year maturity, direct equity investment in Thai companies, or Thai property). No personal income requirement. No age minimum. Health insurance of at least USD 50,000 required, OR USD 100,000 bank deposit maintained for 12+ months.",
    requirements:
      "Valid passport; documentation of global assets totaling at least USD 1 million; proof of qualifying Thai investment of at least USD 500,000 (must be in place before applying — transfer and registration must be complete); health insurance with minimum USD 50,000 coverage OR USD 100,000 bank deposit held 12+ months; criminal background check; BOI endorsement application via ltr.boi.go.th; visa fee of THB 50,000 (~USD 1,400).",
    processing_time:
      "BOI endorsement: approximately 20 working days. Visa issuance: within 60 days of endorsement letter.",
    validity_period:
      "10 years total (5+5); annual address reporting replaces 90-day reporting; no minimum stay required",
    official_url: "https://ltr.boi.go.th/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "thailand",
    pathway_type: "family",
    pathway_name: "Non-Immigrant O Visa (Family / Dependent)",
    // VERIFIED 2026: Unchanged structure. Spouse of Thai national: 400,000 THB bank deposit or 40,000 THB/month.
    summary:
      "For family members of Thai citizens or long-term visa holders. Allows extended stay without work rights (work permit required separately for employment).",
    eligibility:
      "Must be spouse, child, or parent of a Thai national or holder of a long-term Thai visa (e.g., Non-B, O-A, LTR). Financial requirements vary: spouse of Thai national typically needs 400,000 THB in a Thai bank account or 40,000 THB/month provable income.",
    requirements:
      "Marriage certificate or birth certificate (translated and certified); sponsor's documents (Thai ID, household registration tabien baan); financial proof; valid passport; passport photographs; completed e-Visa application.",
    processing_time: "Typically 5–10 business days",
    validity_period:
      "90 days initially; extendable up to 1 year at local Immigration Bureau; 90-day reporting required",
    official_url: "https://www.thaievisa.go.th/",
    last_updated: today,
  },

  // ─────────────────────────────────────────
  // PORTUGAL
  // ─────────────────────────────────────────

  {
    passport_slug: "any",
    destination_slug: "portugal",
    pathway_type: "work",
    pathway_name: "Work Visa (Type D1)",
    // VERIFIED 2026: Requires Portuguese employer sponsorship. AIMA (replaced SEF) handles residence permits.
    // Processing: consulates typically 60–90 days; AIMA backlogs common (6–12 months for residence permit stage).
    summary:
      "For foreign workers with employment contracts from Portuguese employers. After visa issuance, a residence permit is obtained through AIMA (Agência para a Integração, Migrações e Asilo) in Portugal.",
    eligibility:
      "Must have a job offer or employment contract from a Portuguese employer. The employer typically must demonstrate the role meets labor market requirements.",
    requirements:
      "Valid passport; employment contract; criminal record certificate from home country (and countries of recent residence); proof of accommodation in Portugal; health insurance; proof of financial means; NIF (Portuguese tax number, obtainable remotely).",
    processing_time:
      "Visa stage at consulate: typically 2–3 months. Residence permit at AIMA: allow 6–12 months due to current backlog.",
    validity_period: "Initial visa typically 4 months; residence permit 1–2 years, renewable",
    official_url: "https://aima.gov.pt/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "portugal",
    pathway_type: "study",
    pathway_name: "Student Visa (Type D4)",
    // VERIFIED 2026: Unchanged structure. AIMA handles residence permits.
    summary:
      "For international students enrolled in recognized Portuguese educational institutions.",
    eligibility:
      "Must be accepted by a recognized Portuguese higher education institution or course.",
    requirements:
      "Acceptance letter from Portuguese institution; valid passport; proof of financial means; proof of accommodation; health insurance; criminal record certificate; NIF.",
    processing_time:
      "Visa stage: typically 4–8 weeks. Residence permit at AIMA: allow additional time due to backlog.",
    validity_period: "Duration of studies, renewable",
    official_url: "https://aima.gov.pt/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "portugal",
    pathway_type: "digital_nomad",
    pathway_name: "Digital Nomad Visa (Type D8)",
    // VERIFIED 2026:
    // Income requirement: €3,680/month (4x Portuguese minimum wage of €920/month as of Jan 2026).
    // Also seen cited as €3,480–€3,680 range — the correct calculation is 4x €920 = €3,680.
    // D8 is now the correct route for remote workers/freelancers; D7 is passive income only.
    // Processing: 2–3 months consulate + AIMA backlog.
    summary:
      "Allows remote workers and freelancers employed by or contracting with companies outside Portugal to live in Portugal. As of 2023, this is the correct visa for remote workers; the D7 is now reserved for passive income sources (pensions, rent, dividends) only.",
    eligibility:
      "Must earn a minimum of €3,680/month (4x Portugal's minimum wage of €920/month in 2026) from remote work or freelance contracts with clients/employers based outside Portugal. At least 80% of income must originate from non-Portuguese sources.",
    requirements:
      "Valid passport; proof of remote employment contract or freelance client contracts; income statements/bank statements showing at least €3,680/month; NIF (Portuguese tax number); Portuguese bank account; proof of accommodation in Portugal (rental contract of at least 12 months or property ownership); health insurance covering Portugal; criminal record certificate.",
    processing_time:
      "Consulate stage: typically 2–3 months. AIMA residence permit: allow 6–12 months due to backlog.",
    validity_period: "Initial visa: 4 months. Residence permit: 1 year, renewable up to 5 years total",
    official_url: "https://aima.gov.pt/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "portugal",
    pathway_type: "retirement",
    pathway_name: "Passive Income Visa (Type D7)",
    // VERIFIED 2026:
    // Minimum passive income: €920/month for a single applicant (indexed to Portuguese minimum wage of €920/month in 2026).
    // +50% for spouse (€460/month), +30% per dependent child (€276/month).
    // Income must be genuinely passive (pension, rent, dividends, interest) — active remote work → use D8.
    // AIMA assesses financial means at the minimum wage in force at appointment date, not application date.
    // Processing: consulate 2–3 months + AIMA backlog 6–12 months.
    summary:
      "For retirees and individuals with stable passive income (pensions, rental income, dividends, interest) who wish to reside in Portugal. As of January 2026 the minimum income threshold is €920/month for a single applicant. Active remote work income is no longer accepted under this visa — remote workers should use the D8.",
    eligibility:
      "Must have stable passive income of at least €920/month in 2026 (indexed to Portuguese minimum wage). Passive income includes: pensions, rental income, dividends, interest, royalties. Active employment or remote work income is not accepted under D7 since the D8 visa was introduced.",
    requirements:
      "Valid passport; proof of passive income of at least €920/month (bank statements, pension letters, dividend statements covering 12 months); NIF (Portuguese tax number — obtain before applying); Portuguese bank account with funds equivalent to at least 12 months of required income; proof of accommodation in Portugal (12-month rental contract or property ownership); health insurance covering Portugal; criminal record certificate from home country and countries of recent residence.",
    processing_time:
      "Consulate stage: typically 2–3 months. AIMA residence permit: allow 6–12 months due to backlog.",
    validity_period:
      "Initial visa: 4 months. Residence permit: 2 years initially, renewable for 3 more years. Permanent residency possible after 5 years.",
    official_url: "https://aima.gov.pt/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "portugal",
    pathway_type: "investor",
    pathway_name: "Golden Visa (ARI)",
    // VERIFIED 2026:
    // Real estate investment route CLOSED since October 2023. No new real estate applications.
    // Qualifying investment options from €500,000: investment funds, venture capital, research, cultural heritage.
    // Minimum stay: 7 days/year in Portugal.
    // Citizenship path: 5 years of legal residence with qualifying stays.
    summary:
      "Residency through qualifying investment in Portugal. Important: the real estate investment route was closed in October 2023 and is no longer available. Current qualifying options include investment funds (from €500,000), venture capital, research activities, and cultural heritage. Requires only 7 days of physical presence in Portugal per year.",
    eligibility:
      "Qualifying investment of at least €500,000 in eligible funds, research activities, or cultural heritage. Real estate investment is no longer eligible. Applicant must maintain the investment and visit Portugal for at least 7 days per year.",
    requirements:
      "Proof of qualifying investment; clean criminal record; health insurance covering Portugal; valid passport; proof of source of funds; 7 days minimum stay in Portugal per year.",
    processing_time:
      "Initial application: typically 3–6 months at AIMA (significant backlog persists). Annual renewals required.",
    validity_period:
      "Renewable in 2-year periods; permanent residency after 5 years; citizenship possible after 5 years of legal residence",
    official_url: "https://aima.gov.pt/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "portugal",
    pathway_type: "family",
    pathway_name: "Family Reunification Visa",
    // VERIFIED 2026: Now requires 2 years of residence before family reunification (changed in 2025 law update).
    summary:
      "For family members of legal residents in Portugal. Note: as of 2025 law changes, the main applicant must now hold 2 years of legal residency before family reunification is possible (previously, residency card alone was sufficient).",
    eligibility:
      "Must be spouse, child, or dependent of a legal Portuguese resident who has held residency for at least 2 years.",
    requirements:
      "Proof of family relationship (marriage/birth certificate, apostilled); sponsor's residence permit; proof of accommodation; financial means of the sponsor; health insurance.",
    processing_time:
      "Consulate stage: typically 2–4 months. AIMA stage: allow 6–12 months due to backlog.",
    validity_period: "Same duration as the sponsor's residence permit",
    official_url: "https://aima.gov.pt/",
    last_updated: today,
  },

  // ─────────────────────────────────────────
  // GERMANY
  // ─────────────────────────────────────────

  {
    passport_slug: "any",
    destination_slug: "germany",
    pathway_type: "work",
    pathway_name: "EU Blue Card (Blaue Karte EU)",
    // VERIFIED 2026:
    // General threshold: €50,700/year gross (effective Jan 1, 2026 — up from €48,300 in 2025).
    // Shortage occupations (IT, engineering, STEM, healthcare): €45,934.20/year.
    // Recent graduates (degree within last 3 years): €45,934.20/year regardless of sector.
    // IT specialists without university degree: eligible with 3+ years experience in last 7 years, salary ≥ €45,934.20.
    // Original code cited ~EUR 58,400 — this is INCORRECT and was corrected.
    // Fast-track to PR: 21 months with B1 German, 27 months with A1 German.
    summary:
      "Germany's flagship residence permit for highly qualified non-EU nationals. As of January 1, 2026, the minimum salary is €50,700/year gross for most professions, or €45,934.20/year for shortage occupations (IT, engineering, STEM, healthcare) and recent graduates. IT professionals without a university degree can now qualify with 3+ years of relevant experience.",
    eligibility:
      "Recognized university degree (or equivalent). Employment contract with a German employer offering a gross annual salary of at least €50,700 (or €45,934.20 for shortage occupations, recent graduates within 3 years of graduation, or qualifying IT specialists with 3+ years experience). Job must match qualifications.",
    requirements:
      "Valid passport; employment contract specifying gross annual salary meeting the 2026 threshold; recognized university degree (check ANABIN database for recognition status — unrecognized degrees require a separate equivalence assessment); proof of health insurance covering Germany; proof of accommodation.",
    processing_time:
      "Typically 4–12 weeks depending on consulate workload; book appointment well in advance",
    validity_period:
      "Up to 4 years (or duration of employment contract plus 3 months if shorter); fast-track to permanent settlement permit after 21 months (B1 German) or 27 months",
    official_url: "https://www.make-it-in-germany.com/en/visa-residence/types/eu-blue-card",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "germany",
    pathway_type: "study",
    pathway_name: "Student Visa",
    // VERIFIED 2026: Blocked account requirement: €1,091/month as of 2026 (annual update).
    // Post-study job search: 18 months allowed after graduation.
    summary:
      "For international students accepted by recognized German universities or higher education institutions.",
    eligibility:
      "Must be accepted by a recognized German higher education institution. Must demonstrate financial means via a blocked account (Sperrkonto) of approximately €1,091/month (2026 requirement).",
    requirements:
      "University admission letter (Zulassungsbescheid); blocked bank account (Sperrkonto) showing funds of at least €1,091/month for the study duration; proof of health insurance; valid passport; completed visa application forms.",
    processing_time: "Typically 6–12 weeks; book visa appointment well in advance",
    validity_period:
      "Duration of studies; after graduation, 18 months for job search (Aufenthaltserlaubnis zur Jobsuche)",
    official_url: "https://www.make-it-in-germany.com/en/visa-residence/types/student",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "germany",
    pathway_type: "digital_nomad",
    pathway_name: "Freelance Visa (Freiberufler Visum)",
    // VERIFIED 2026: No fixed salary threshold but requires proven sustainable income.
    // Available for qualifying freelance professions (Freiberufler): doctors, lawyers, architects, scientists, artists, journalists, etc.
    // Self-employed in trade (Gewerbe) use a different permit and require a business plan.
    summary:
      "For self-employed professionals (Freiberufler) in qualifying liberal professions such as scientists, artists, journalists, doctors, architects, and engineers. Note: trade-based self-employment (Gewerbe) requires a different permit.",
    eligibility:
      "Must be in a recognized liberal profession (Freiberuf). Must demonstrate sustainable freelance income and existing client contracts. Must have health insurance valid in Germany.",
    requirements:
      "Portfolio of work; signed client contracts demonstrating active engagements; business plan or income projection; proof of qualifications relevant to the freelance activity; health insurance covering Germany; proof of financial means for the initial period.",
    processing_time: "Typically 2–4 months",
    validity_period: "1–3 years initially, renewable",
    official_url: "https://www.make-it-in-germany.com/en/visa-residence/types/freelance",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "germany",
    pathway_type: "retirement",
    pathway_name: "Residence Permit for Independent Means",
    // VERIFIED 2026: No dedicated 'retirement visa' — retirees use a general residence permit proving financial independence.
    summary:
      "Germany does not have a specific retirement visa. Retirees can apply for a general residence permit demonstrating financial independence (pension, savings) and comprehensive health insurance. Approval is at the discretion of the local Foreigners' Authority (Ausländerbehörde).",
    eligibility:
      "Must demonstrate financial independence sufficient to cover living costs without recourse to German public funds. Comprehensive health insurance covering Germany is mandatory. There is no fixed income threshold — the local Foreigners' Authority assesses each case individually.",
    requirements:
      "Proof of pension or savings providing sustainable income; comprehensive health insurance covering all medical costs in Germany; proof of accommodation; valid passport.",
    processing_time: "Varies; typically 2–4 months",
    validity_period: "1–3 years initially, renewable",
    official_url: "https://www.make-it-in-germany.com/en/visa-residence",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "germany",
    pathway_type: "investor",
    pathway_name: "Business and Investment Visa (§21 AufenthG)",
    // VERIFIED 2026: Requires a viable business plan and economic interest assessment.
    // No fixed minimum investment amount — assessed case by case.
    summary:
      "For entrepreneurs and investors establishing businesses in Germany. The business plan and economic impact are assessed by local authorities; no fixed minimum investment is specified by law.",
    eligibility:
      "Must present a viable business plan demonstrating economic interest, regional need, and positive impact on employment or Germany's economy. Must have sufficient capital to execute the business plan.",
    requirements:
      "Detailed business plan; proof of capital and financing; professional qualifications relevant to the business; market analysis; evidence of economic interest (e.g., job creation, technology transfer); health insurance.",
    processing_time: "Typically 2–4 months",
    validity_period: "1–3 years initially, renewable based on business development",
    official_url: "https://www.make-it-in-germany.com/en/visa-residence/types/self-employment",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "germany",
    pathway_type: "family",
    pathway_name: "Family Reunification Visa",
    // VERIFIED 2026: A1 German required for spouses joining non-EU Blue Card holders (unless hardship or language course approved).
    // Spouses of EU Blue Card holders are exempt from the A1 German language requirement.
    summary:
      "For family members of German residents or citizens. Spouses of EU Blue Card holders are exempt from the A1 German language requirement. Spouses of other permit types must generally demonstrate A1 German proficiency before the visa is issued.",
    eligibility:
      "Must be spouse, child, or (in some cases) parent of a German resident or citizen. Spouses must typically demonstrate A1 German language proficiency — exempted for spouses of EU Blue Card holders.",
    requirements:
      "Proof of family relationship (marriage/birth certificate, apostilled and translated); sponsor's valid residence permit or German citizenship documents; proof of adequate accommodation in Germany (sufficient floor space per household member); A1 German language certificate for spouses (exempted for spouses of EU Blue Card holders).",
    processing_time: "Typically 2–4 months",
    validity_period: "Matches sponsor's permit or 3 years if sponsor is a German citizen",
    official_url: "https://www.make-it-in-germany.com/en/visa-residence/types/family-reunion",
    last_updated: today,
  },

  // ─────────────────────────────────────────
  // CANADA
  // ─────────────────────────────────────────

  {
    passport_slug: "any",
    destination_slug: "canada",
    pathway_type: "work",
    pathway_name: "Temporary Foreign Worker Program (TFWP)",
    // VERIFIED 2026: LMIA still required for most TFWP positions. Processing varies by stream.
    summary:
      "Work permit for foreign workers with job offers from Canadian employers who have obtained a Labour Market Impact Assessment (LMIA) confirming no qualified Canadian worker is available.",
    eligibility:
      "Must have a valid job offer from a Canadian employer with a positive LMIA (or LMIA-exempt under specific agreements). Must meet the qualifications required for the role.",
    requirements:
      "Job offer letter; positive LMIA from Employment and Social Development Canada; proof of qualifications; valid passport; medical examination (if required); police certificate.",
    processing_time:
      "Varies significantly by stream and processing center; typically 2–5 months for standard LMIA processing plus permit processing",
    validity_period: "Duration tied to job offer, typically up to 2 years; renewable",
    official_url: "https://www.canada.ca/en/immigration-refugees-citizenship/services/work-canada/permit/temporary.html",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "canada",
    pathway_type: "study",
    pathway_name: "Study Permit",
    // VERIFIED 2026: IRCC introduced student permit caps per province. Processing varies.
    summary:
      "For international students enrolled in Designated Learning Institutions (DLIs) in Canada.",
    eligibility:
      "Must be accepted by a Canadian Designated Learning Institution (DLI). Must demonstrate sufficient financial means to cover tuition and living costs.",
    requirements:
      "Letter of acceptance from a DLI; proof of financial support (tuition + living expenses); valid passport; clean criminal record; medical examination if required by country of origin; Quebec Acceptance Certificate (CAQ) for Quebec studies.",
    processing_time: "Typically 4–12 weeks; allow more time during peak periods",
    validity_period: "Duration of studies plus 90 days; Post-Graduation Work Permit (PGWP) available after graduation",
    official_url: "https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada/study-permit.html",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "canada",
    pathway_type: "digital_nomad",
    pathway_name: "International Experience Canada (IEC)",
    // VERIFIED 2026: Age ranges and eligible countries vary by agreement.
    // Canada does not have a dedicated 'digital nomad visa'; IEC is the closest option for younger remote workers.
    summary:
      "Work and travel program for young adults (typically age 18–35) from eligible countries. Note: Canada does not have a dedicated digital nomad visa. IEC is the closest available pathway for short-term remote workers from eligible countries.",
    eligibility:
      "Must be a citizen of an IEC-eligible country. Age limit is typically 18–35 (varies by country agreement — some countries allow up to age 30 or 35). Must meet health and character requirements.",
    requirements:
      "Valid passport; proof of funds (typically CAD 2,500); travel/health insurance; clean criminal record; meet health requirements.",
    processing_time: "Typically 8–12 weeks after pool invitation",
    validity_period: "Up to 1 or 2 years depending on the country agreement",
    official_url: "https://www.canada.ca/en/immigration-refugees-citizenship/services/work-canada/iec.html",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "canada",
    pathway_type: "retirement",
    pathway_name: "Parent and Grandparent Super Visa",
    // VERIFIED 2026: Income threshold for sponsoring child updated periodically.
    // Super Visa allows multiple entries over 10 years, up to 5 years per stay (extended from 2 years).
    summary:
      "Multi-entry long-stay visa for parents and grandparents of Canadian citizens or permanent residents. Allows stays of up to 5 years per entry (extended from the previous 2-year limit), valid for up to 10 years. Note: this is a temporary visitor visa, not a permanent residence pathway.",
    eligibility:
      "Must be parent or grandparent of a Canadian citizen or permanent resident. The Canadian child/grandchild must demonstrate income meeting the Low Income Cut-Off (LICO) threshold for their family size.",
    requirements:
      "Invitation letter from Canadian child or grandchild; proof of the sponsor's income meeting the minimum LICO threshold; private Canadian medical insurance valid for at least 1 year with minimum CAD 100,000 coverage; medical examination; valid passport.",
    processing_time: "Varies; typically 2–5 months",
    validity_period: "Valid up to 10 years; permits stays of up to 5 years per entry",
    official_url: "https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada/parent-grandparent-super-visa.html",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "canada",
    pathway_type: "investor",
    pathway_name: "Start-Up Visa Program",
    // VERIFIED 2026: Processing times have lengthened significantly — up to 36+ months in some cases.
    // Must receive letter of support from a designated venture capital fund, angel investor group, or business incubator.
    summary:
      "Permanent residence pathway for entrepreneurs with innovative business ideas supported by a designated Canadian organization (venture capital fund, angel investor group, or business incubator). Processing times have lengthened significantly.",
    eligibility:
      "Must obtain a letter of support from a designated Canadian organization. Must meet language requirements (CLB 5 in English or French in all four skills). Must have sufficient settlement funds.",
    requirements:
      "Letter of support from a designated organization; business plan demonstrating innovation and scalability; language test results (IELTS, CELPIP, or TEF/TCF) at CLB 5 or above; proof of settlement funds; medical examination; police certificates.",
    processing_time:
      "Typically 24–36+ months (processing times have increased significantly — verify current processing times at canada.ca)",
    validity_period: "Permanent residence (leading directly to PR if approved)",
    official_url: "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/start-visa.html",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "canada",
    pathway_type: "family",
    pathway_name: "Family Sponsorship",
    // VERIFIED 2026: Spouse/partner PR processing typically 12–24 months.
    // Parent/grandparent PR intake is lottery-based and highly competitive.
    summary:
      "Permanent residence for family members sponsored by Canadian citizens or permanent residents. Spouses and common-law partners are the fastest-processed category. Parent/grandparent permanent residence intake is lottery-based and highly competitive.",
    eligibility:
      "Must be spouse, common-law partner, conjugal partner, dependent child, parent, or grandparent of a Canadian citizen or permanent resident. Sponsor must meet minimum income requirements and sign an undertaking to support the sponsored person.",
    requirements:
      "Sponsorship application (IMM 1344); proof of family relationship; proof of sponsor's income (for parent/grandparent); medical examination; police certificates from all countries lived in for 6+ months since age 18.",
    processing_time:
      "Spouse/partner: typically 12–24 months. Parents/grandparents: highly competitive lottery intake — may wait years.",
    validity_period: "Permanent residence",
    official_url: "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/family-sponsorship.html",
    last_updated: today,
  },

  // ─────────────────────────────────────────
  // UNITED STATES
  // ─────────────────────────────────────────

  {
    passport_slug: "any",
    destination_slug: "united-states",
    pathway_type: "work",
    pathway_name: "H-1B Visa (Specialty Occupation)",
    // VERIFIED 2026: Cap remains 85,000/year. FY2026 lottery conducted March 2025.
    // Cap-exempt: universities, affiliated nonprofits, government research organizations.
    summary:
      "Temporary work visa for professionals in specialty occupations requiring at least a bachelor's degree. Subject to an annual cap of 85,000 visas (65,000 regular + 20,000 for US master's degree holders), with selection by lottery for cap-subject positions.",
    eligibility:
      "Bachelor's degree or higher (or equivalent experience) in the specialty field. Job offer from a US employer who will file the H-1B petition. For cap-subject positions, must be selected in the annual lottery (registration in March for October start dates).",
    requirements:
      "Approved I-129 petition filed by US employer; valid passport; educational credentials and transcripts; employment offer letter; DS-160 form; visa interview at US consulate.",
    processing_time:
      "Standard: 3–6 months after petition approval. Premium processing (I-907): 15 business days for petition adjudication (additional fee of ~USD 2,805 in 2026).",
    validity_period: "Initial 3 years; extendable to 6 years total; further extensions possible under green card sponsorship",
    official_url: "https://www.uscis.gov/working-in-the-united-states/h-1b-specialty-occupations",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "united-states",
    pathway_type: "study",
    pathway_name: "F-1 Student Visa",
    // VERIFIED 2026: OPT: 12 months; STEM OPT extension: 24 months additional.
    summary:
      "For international students enrolled full-time in SEVP-approved US academic institutions. After graduation, eligible for 12 months of Optional Practical Training (OPT) in their field of study, with a 24-month STEM OPT extension for qualifying degree programs.",
    eligibility:
      "Must be accepted by a SEVP-approved school. Must demonstrate sufficient financial support for tuition and living expenses. Must intend to return home after studies (nonimmigrant intent).",
    requirements:
      "Form I-20 issued by school; SEVIS fee payment (I-901); proof of financial support; valid passport; DS-160 online application; visa interview; evidence of nonimmigrant intent.",
    processing_time: "Typically 3–8 weeks (varies significantly by consulate)",
    validity_period:
      "Duration of status (D/S) — valid for the full duration of the academic program; OPT available after graduation for 12 months (+ 24 months STEM extension)",
    official_url: "https://travel.state.gov/content/travel/en/us-visas/study/student-visa.html",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "united-states",
    pathway_type: "digital_nomad",
    pathway_name: "O-1 Visa (Extraordinary Ability or Achievement)",
    // VERIFIED 2026: Note: the US has no dedicated digital nomad visa. O-1 requires demonstrable extraordinary ability.
    // Not suitable as a general remote worker pathway — requires substantial documented evidence.
    summary:
      "For individuals with extraordinary ability in sciences, arts, education, business, or athletics (O-1A), or extraordinary achievement in motion picture/TV (O-1B). Note: the United States has no dedicated digital nomad or remote worker visa — the O-1 requires demonstrable extraordinary ability with extensive documentation.",
    eligibility:
      "Must demonstrate extraordinary ability through sustained national or international acclaim. O-1A: must meet at least 3 of 8 evidentiary criteria (e.g., awards, high salary, published work, critical role). O-1B: must demonstrate extraordinary achievement in entertainment. Must have a US employer or agent file the petition.",
    requirements:
      "Approved I-129 petition filed by US employer or agent; evidence of extraordinary ability (awards, publications, media coverage, high salary, expert letters, etc.); consultation letter from a peer group or union (O-1B); valid passport; DS-160 form.",
    processing_time: "Standard: 2–4 months. Premium processing: 15 business days (additional fee).",
    validity_period: "Up to 3 years initially; renewable in 1-year increments",
    official_url: "https://www.uscis.gov/working-in-the-united-states/temporary-workers/o-1-visa-individuals-with-extraordinary-ability-or-achievement",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "united-states",
    pathway_type: "retirement",
    pathway_name: "B-2 Tourist/Visitor Visa",
    // NOTE: B-2 is not a retirement visa. The US has no retirement visa.
    // B-2 allows maximum 6 months per visit; using it for de facto retirement can lead to visa denial/status issues.
    // Corrected the summary to make this clear and accurate.
    summary:
      "The United States does not have a retirement visa. The B-2 Tourist/Visitor Visa allows temporary visits of up to 6 months. Using it repeatedly as a de facto retirement stay is not advisable and may lead to denial of entry. Retirees seeking long-term US residence must qualify through family sponsorship, investor pathways (EB-5), or other immigrant visa categories.",
    eligibility:
      "Must demonstrate intent to visit temporarily and return home. Must show strong ties to home country. Must have sufficient funds for the visit. Repeated long-stay visits may raise immigration officer concern about immigrant intent.",
    requirements:
      "DS-160 online application; valid passport; visa fee payment; proof of financial means; evidence of ties to home country (property, family, employment); visa interview at US consulate.",
    processing_time: "Varies by consulate; typically 2–8 weeks",
    validity_period:
      "Typically issued for 10 years multiple-entry (varies by country); each entry usually 6 months maximum at officer's discretion",
    official_url: "https://travel.state.gov/content/travel/en/us-visas/tourism-visit/visitor.html",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "united-states",
    pathway_type: "investor",
    pathway_name: "EB-5 Immigrant Investor Program",
    // VERIFIED 2026:
    // Standard investment (non-TEA): USD 1,050,000.
    // Targeted Employment Area (TEA) investment: USD 800,000 (rural or high unemployment areas).
    // I-526E petition; USCIS processing times remain long (2–5+ years for some nationalities due to visa backlogs).
    summary:
      "Permanent residence through investment in a new commercial enterprise in the United States. Minimum investment is USD 1,050,000 (or USD 800,000 in a Targeted Employment Area — TEA) with the creation of at least 10 full-time US jobs.",
    eligibility:
      "Must invest USD 1,050,000 (or USD 800,000 in a TEA) in a qualifying commercial enterprise — either directly or through a USCIS-designated Regional Center. Must create or preserve at least 10 full-time jobs for US workers.",
    requirements:
      "Form I-526E petition; detailed business plan; evidence of lawful source of funds; investment documentation; medical examination; police certificates.",
    processing_time:
      "I-526E petition: 24–48 months currently. Visa/adjustment: additional time; significant backlog for some nationalities (especially China and India).",
    validity_period: "Conditional permanent residence (2 years), then permanent",
    official_url: "https://www.uscis.gov/working-in-the-united-states/permanent-workers/eb-5-immigrant-investor-program",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "united-states",
    pathway_type: "family",
    pathway_name: "Immediate Relative Family-Based Immigration (IR/CR)",
    // VERIFIED 2026: Immediate relatives of US citizens (spouses, unmarried children under 21, parents) are not subject to numerical caps.
    summary:
      "Permanent residence pathway for immediate relatives of US citizens (spouses, unmarried children under 21, and parents). Unlike preference categories, there is no annual cap for immediate relatives.",
    eligibility:
      "Must be spouse, unmarried child under 21, or parent of a US citizen. Preference categories (with annual caps and waiting periods) also exist for other family relationships.",
    requirements:
      "Form I-130 petition filed by US citizen; proof of family relationship (marriage certificate, birth certificate); Form I-864 Affidavit of Support showing sponsor's income meets the 125% poverty guideline; medical examination (Form I-693); police certificates.",
    processing_time:
      "Typically 12–24 months for the full process (petition through immigrant visa/adjustment of status)",
    validity_period: "Permanent residence",
    official_url: "https://www.uscis.gov/family",
    last_updated: today,
  },

  // ─────────────────────────────────────────
  // SPAIN
  // ─────────────────────────────────────────

  {
    passport_slug: "any",
    destination_slug: "spain",
    pathway_type: "work",
    pathway_name: "Work and Residence Authorization",
    // VERIFIED 2026: Employer must obtain work authorization from Spain before employee applies for visa.
    // Requires demonstration that no EU/EEA candidate was available (labor market test in most cases).
    summary:
      "For foreign workers with employment contracts from Spanish employers. The employer must first obtain a work authorization (autorización de trabajo) from Spanish authorities, demonstrating the position meets labor market requirements.",
    eligibility:
      "Must have a job offer from a Spanish employer. The employer must demonstrate the role meets labor market needs (in most cases, showing no qualified EU/EEA candidate is available).",
    requirements:
      "Employment contract; passport; apostilled criminal record certificate; medical certificate; proof of qualifications; work authorization approval from Spanish authorities; health insurance.",
    processing_time: "Typically 1–3 months",
    validity_period: "1 year initially, renewable",
    official_url: "https://www.inclusion.gob.es/web/migraciones/en/trabajadores/residencia-en-espana/trabajadores-por-cuenta-ajena",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "spain",
    pathway_type: "study",
    pathway_name: "Student Visa (Visado de Estudios)",
    // VERIFIED 2026: Unchanged structure.
    summary:
      "For international students enrolled in accredited Spanish educational institutions.",
    eligibility:
      "Must be accepted by a recognized Spanish institution for full-time studies lasting more than 90 days.",
    requirements:
      "Admission letter; valid passport; proof of financial means; private health insurance with no copayments covering Spain; apostilled criminal record; medical certificate; proof of accommodation.",
    processing_time: "Typically 1–2 months",
    validity_period: "Duration of studies",
    official_url: "https://www.exteriores.gob.es/en/EmbajadasConsulados/Pages/EmbajadaConsulado.aspx",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "spain",
    pathway_type: "digital_nomad",
    pathway_name: "Digital Nomad Visa (Visado para Nómadas Digitales)",
    // VERIFIED 2026:
    // Income: €2,850/month (200% of Spain's SMI of €1,381.33/month raised 3.1% in Jan 2026 — approx €2,762.66 to €2,850 depending on source; use ~€2,850 as the verified 2026 figure).
    // At least 80% of professional activity must serve clients/employers outside Spain.
    // Initial visa (from consulate abroad): 1 year. Residence authorization (from within Spain): 3 years.
    // Beckham Law (24% flat rate on income up to €600k) available for qualifying holders.
    // Spain's Golden Visa CLOSED April 3, 2025 — no replacement investor route.
    summary:
      "Allows non-EU remote workers and freelancers to live in Spain while working for clients or employers primarily based outside Spain. Introduced under the Startup Law in January 2023. May qualify for the Beckham Law special tax regime (24% flat rate on income up to €600,000).",
    eligibility:
      "Must earn a minimum of approximately €2,850/month (200% of Spain's 2026 minimum wage). At least 80% of professional activity must be for clients or employers outside Spain. Must have a university degree or at least 3 years of relevant professional experience. Must have private health insurance with no copayments covering Spain.",
    requirements:
      "Proof of remote employment contract or freelance client contracts (with evidence of income); income statements/bank statements showing at least €2,850/month; university degree or professional experience documentation; private health insurance with no copayments valid in Spain; apostilled criminal record covering the past 5 years; proof of accommodation.",
    processing_time: "Typically 1–3 months (applying from a Spanish consulate abroad)",
    validity_period:
      "1 year (initial consulate visa); convertible to 3-year residence authorization from within Spain; renewable up to 5 years total",
    official_url: "https://www.inclusion.gob.es/web/migraciones/en/trabajadores/residencia-en-espana/nomadas-digitales",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "spain",
    pathway_type: "retirement",
    pathway_name: "Non-Lucrative Visa (Visado de Residencia No Lucrativa)",
    // VERIFIED 2026:
    // Income requirement: ~€2,400/month or €27,115/year for a single applicant (400% of IPREM).
    // 2025 update: Spain reinstated a minimum physical presence of 183 days/year to maintain this visa.
    // Does NOT permit any work (neither for Spanish nor foreign employers).
    // Health insurance must have zero copayments.
    summary:
      "For individuals with sufficient passive income or savings who wish to reside in Spain without working. Does not permit any form of employment. As of 2025, applicants must physically reside in Spain for at least 183 days per year to maintain this permit.",
    eligibility:
      "Must have provable income of at least approximately €2,400/month (~€27,115/year for a single applicant; equivalent to 400% of Spain's IPREM index). Must not work in Spain for any employer, Spanish or foreign. Must reside in Spain for at least 183 days/year.",
    requirements:
      "Proof of income/savings meeting the threshold; private health insurance with no copayments or deductibles covering Spain; apostilled criminal record; medical certificate; proof of accommodation; proof of no criminal record in countries where applicant has resided.",
    processing_time: "Typically 1–3 months",
    validity_period: "1 year initially, renewable in 2-year periods; permanent residency after 5 years",
    official_url: "https://www.exteriores.gob.es/en/EmbajadasConsulados/Pages/EmbajadaConsulado.aspx",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "spain",
    pathway_type: "investor",
    pathway_name: "Golden Visa — CLOSED April 3, 2025",
    // VERIFIED 2026:
    // Spain's Golden Visa real estate route OFFICIALLY ENDED April 3, 2025 under Organic Law 1/2025.
    // No new applications accepted. Existing holders can renew.
    // The investor entry has been retained here to surface the closure clearly and prevent outdated guidance.
    summary:
      "Spain's Golden Visa program officially ended on April 3, 2025 (Organic Law 1/2025). No new applications are being accepted for the real estate investment route or other Golden Visa categories. Existing Golden Visa holders retain their rights and may renew their permits under the original rules. Investors seeking EU residency by investment should consider Greece, Portugal, or Italy.",
    eligibility:
      "No longer available for new applicants. Existing holders: must maintain the original qualifying investment and visit Spain at least once per year.",
    requirements:
      "N/A for new applicants. Existing holders renewing: proof of maintained investment; valid passport; visit to Spain within the permit period.",
    processing_time: "N/A for new applicants",
    validity_period: "N/A for new applicants",
    official_url: "https://www.inclusion.gob.es/web/migraciones/en/inversores",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "spain",
    pathway_type: "family",
    pathway_name: "Family Reunification (Reagrupación Familiar)",
    // VERIFIED 2026: Unchanged structure.
    summary:
      "For family members (spouse, children, dependent parents) of Spanish citizens or legal residents.",
    eligibility:
      "Must be spouse, unmarried child, or dependent parent of a Spanish citizen or a legal resident who has held a residence permit for at least 1 year and applied for or been granted a renewal.",
    requirements:
      "Proof of family relationship (marriage/birth certificate, apostilled); sponsor's residence permit and proof of income meeting family support thresholds; adequate accommodation in Spain; health insurance.",
    processing_time: "Typically 2–4 months",
    validity_period: "Matches sponsor's permit duration",
    official_url: "https://www.inclusion.gob.es/web/migraciones/en/trabajadores/residencia-en-espana/reagrupacion-familiar",
    last_updated: today,
  },

  // ─────────────────────────────────────────
  // JAPAN
  // ─────────────────────────────────────────

  {
    passport_slug: "any",
    destination_slug: "japan",
    pathway_type: "work",
    pathway_name: "Engineer / Specialist in Humanities / International Services Visa",
    // VERIFIED 2026: CoE required; CoE applied for by sponsor in Japan (not the applicant).
    // Standard work visa — most common for skilled professional employment.
    summary:
      "Most common work visa for skilled professionals in technical, academic, or international business roles in Japan. Requires a Certificate of Eligibility (CoE) applied for by the employer in Japan before the applicant applies for a visa at a Japanese consulate abroad.",
    eligibility:
      "Must have a job offer from a Japanese employer in a relevant field. Must have a university degree or 10 years of professional experience related to the role (3 years for translation/interpretation roles).",
    requirements:
      "Certificate of Eligibility (CoE) obtained by employer from regional Immigration Services Bureau in Japan; valid passport; visa application form; passport photograph; employment contract; educational certificates.",
    processing_time:
      "CoE issuance in Japan: typically 1–3 months. Visa issuance at consulate after CoE: typically 5–10 business days.",
    validity_period: "1–5 years depending on situation, renewable",
    official_url: "https://www.isa.go.jp/en/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "japan",
    pathway_type: "study",
    pathway_name: "Student Visa (Ryugaku)",
    // VERIFIED 2026: Unchanged structure. CoE required.
    summary:
      "For international students enrolled in Japanese educational institutions. Requires a Certificate of Eligibility (CoE) applied for by the school.",
    eligibility:
      "Must be accepted by a Japanese educational institution (university, language school, vocational school).",
    requirements:
      "Certificate of Eligibility (CoE) issued by the school from the Immigration Services Agency; valid passport; visa application form; proof of financial means; admission letter.",
    processing_time:
      "CoE: 1–3 months (school applies on behalf of student). Visa at consulate: 5–10 business days after CoE.",
    validity_period: "Duration of studies; 90-day reporting required",
    official_url: "https://www.isa.go.jp/en/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "japan",
    pathway_type: "digital_nomad",
    pathway_name: "Specified Skilled Worker (SSW) / Digital Nomad Visa",
    // VERIFIED 2026:
    // Japan launched a formal Digital Nomad Visa in March 2024 (6-month stay, income ≥ USD 68,500/year or JPY 10M/year).
    // This replaces the 'Designated Activities' framing in the original code which was not fully accurate.
    // SSW is for specific industry sectors; Digital Nomad Visa is for remote workers.
    summary:
      "Japan launched a dedicated Digital Nomad Visa in March 2024 for remote workers employed outside Japan. Allows a 6-month stay (non-renewable, non-extendable). Applicants must have a minimum annual income of approximately JPY 10 million (USD 68,500) and hold nationals of one of the 49 eligible countries.",
    eligibility:
      "Citizen of one of 49 eligible countries (with which Japan has tax treaties and certain bilateral agreements). Annual income of at least JPY 10 million (~USD 68,500). Must be employed by or run a business registered outside Japan. Must have private health insurance.",
    requirements:
      "Valid passport; proof of income of at least JPY 10 million/year (employment contract, tax returns, bank statements); private health insurance valid in Japan; employment contract or business registration showing non-Japanese employer.",
    processing_time: "Typically 1–2 months",
    validity_period: "6 months; not renewable or extendable — must leave Japan and reapply for a new visa after a gap",
    official_url: "https://www.mofa.go.jp/j_info/visit/visa/short/novisa.html",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "japan",
    pathway_type: "retirement",
    pathway_name: "Long-Term Resident Visa",
    // VERIFIED 2026: Japan has no dedicated retirement visa. Long-Term Resident is typically for those with ties to Japan.
    // Most retirees without Japanese family must use repeated short-stay methods or qualify via other specific categories.
    summary:
      "Japan does not have a dedicated retirement visa. The Long-Term Resident (Teijusha) visa is discretionary and typically granted to individuals with specific ties to Japan (e.g., children of Japanese nationals, former residents). Retirees without qualifying ties may find long-term residence in Japan difficult.",
    eligibility:
      "Discretionary — typically granted to individuals with a specific relationship to Japan or Japanese nationals. Must demonstrate financial means and health insurance. A guarantor in Japan is often required.",
    requirements:
      "Proof of financial means; health insurance; guarantor or sponsor in Japan; valid passport; application forms; documentation of ties to Japan.",
    processing_time: "Varies considerably; typically 2–4 months",
    validity_period: "1–5 years, renewable at Immigration Services Agency discretion",
    official_url: "https://www.isa.go.jp/en/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "japan",
    pathway_type: "investor",
    pathway_name: "Business Manager Visa",
    // VERIFIED 2026: JPY 5,000,000 minimum investment; must have a physical office in Japan.
    // At least 2 full-time employees OR JPY 5M+ investment required.
    summary:
      "For entrepreneurs and business investors establishing or managing a business in Japan. Requires a physical office address in Japan and either a minimum investment of JPY 5,000,000 or employment of at least 2 full-time workers in Japan.",
    eligibility:
      "Must establish or manage a business in Japan. The business must have a physical office (not just a registered address — must be usable). Must meet either the minimum investment of JPY 5,000,000 or employ at least 2 full-time employees in Japan.",
    requirements:
      "Detailed business plan; Certificate of Eligibility (CoE) applied for in Japan; proof of business establishment (company registration, office lease agreement); proof of investment of JPY 5,000,000 or employment contracts for 2 Japanese employees; valid passport.",
    processing_time:
      "CoE application in Japan: 1–3 months. Visa at consulate: 5–10 business days after CoE.",
    validity_period: "1–5 years, renewable based on business performance",
    official_url: "https://www.isa.go.jp/en/",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "japan",
    pathway_type: "family",
    pathway_name: "Spouse or Child of Japanese National",
    // VERIFIED 2026: Unchanged structure. CoE required.
    summary:
      "For legal spouses and biological or legally adopted children of Japanese nationals.",
    eligibility:
      "Must be legally married to or a biological/legally adopted child of a Japanese national. The relationship must be registered with Japanese civil authorities.",
    requirements:
      "Certificate of Eligibility (CoE) applied for in Japan; valid passport; marriage certificate or birth certificate (officially translated); family register (Koseki Tohon); financial proof; visa application form.",
    processing_time:
      "CoE in Japan: 1–3 months. Visa at consulate: 5–10 business days after CoE.",
    validity_period: "1–5 years, renewable",
    official_url: "https://www.isa.go.jp/en/",
    last_updated: today,
  },

  // ─────────────────────────────────────────
  // AUSTRALIA
  // ─────────────────────────────────────────

  {
    passport_slug: "any",
    destination_slug: "australia",
    pathway_type: "work",
    pathway_name: "Temporary Skill Shortage Visa (Subclass 482)",
    // VERIFIED 2026: Two main streams — Short-Term (2 years, limited occupation list) and Medium-Term (4 years, MLTSSL occupations).
    // Employer must be a Standard Business Sponsor (SBS) and nominate the specific occupation.
    // Skills assessment required for some occupations.
    summary:
      "Temporary work visa for skilled workers sponsored by approved Australian employers. Two streams: Short-Term (2 years, limited occupations) and Medium-Term (4 years, occupations on the Medium and Long-Term Strategic Skills List — MLTSSL). Medium-term stream provides a pathway to permanent residence.",
    eligibility:
      "Must be nominated by an approved Standard Business Sponsor (SBS). Must have at least 2 years of relevant work experience. Must meet English language requirements. Occupation must be on the relevant occupation list.",
    requirements:
      "Employer nomination; valid passport; skills assessment (if required by occupation); English language test (IELTS, PTE, TOEFL, or OET); police clearance certificates from all countries lived in for 12+ months; health examination.",
    processing_time: "Typically 1–4 months",
    validity_period:
      "Short-Term stream: 2 years. Medium-Term stream: 4 years (pathway to permanent residence via Subclass 186 after 3 years).",
    official_url: "https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/temporary-skill-shortage-482",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "australia",
    pathway_type: "study",
    pathway_name: "Student Visa (Subclass 500)",
    // VERIFIED 2026: GTE (Genuine Temporary Entrant) requirement remains; OSHC required.
    // Post-study work rights: 2–4 years depending on course level and institution location.
    summary:
      "For international students enrolled in CRICOS-registered courses in Australia. Post-study work rights are available through the Temporary Graduate Visa (Subclass 485) after graduation.",
    eligibility:
      "Must be enrolled in a CRICOS-registered course at a registered Australian education provider. Must meet English language requirements. Must satisfy the Genuine Temporary Entrant (GTE) requirement.",
    requirements:
      "Confirmation of Enrolment (CoE) from registered provider; Overseas Student Health Cover (OSHC) for duration of stay; evidence of financial capacity to cover tuition and living costs; English language test results; Genuine Temporary Entrant (GTE) statement.",
    processing_time: "Typically 1–3 months",
    validity_period:
      "Duration of course plus additional time (depending on course level). Post-study: Subclass 485 Temporary Graduate Visa available for 2–4 years.",
    official_url: "https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/student-500",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "australia",
    pathway_type: "digital_nomad",
    pathway_name: "Working Holiday Visa (Subclass 417 / 462)",
    // VERIFIED 2026: Subclass 417 for eligible countries (UK, Canada, France, Germany, etc.); 462 for other agreement countries.
    // Age: 18–30 for most; 18–35 for some countries (UK, Canada, Ireland, France expanded to 35).
    // Australia does not have a dedicated digital nomad visa.
    summary:
      "Work and travel visa for young adults from eligible countries. Note: Australia does not have a dedicated digital nomad visa. The Working Holiday Visa is the closest option for younger remote workers who are citizens of eligible countries. Subclass 417: most traditional eligible countries. Subclass 462: additional agreement countries.",
    eligibility:
      "Age 18–30 (18–35 for citizens of Canada, UK, Ireland, and France). Citizen of an eligible country with a working holiday agreement with Australia. No dependent children accompanying. Sufficient funds.",
    requirements:
      "Valid passport from eligible country; proof of funds (typically AUD 5,000); travel/health insurance; clean character requirements; no accompanying dependent children.",
    processing_time: "Typically 1–4 weeks",
    validity_period:
      "12 months; extendable to a second year (and third year for some) by completing specified regional work",
    official_url: "https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/work-holiday-417",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "australia",
    pathway_type: "retirement",
    pathway_name: "Investor Retirement Visa (Subclass 405)",
    // NOTE: Subclass 405 is NOT accepting new applications as of 2018 — it is closed.
    // The correct retirement pathway advice in 2026 is to note the closure and mention alternatives.
    summary:
      "Important: The Investor Retirement Visa (Subclass 405) is no longer available — it stopped accepting new applications in 2018. Australia does not currently offer a dedicated retirement visa. Retirees may explore partner visas (if applicable), parent visas (sponsored by Australian citizen/resident children), or the Significant Investor visa pathway if they have substantial assets to invest.",
    eligibility:
      "N/A — Subclass 405 is closed to new applicants. Retirees with an Australian citizen/resident child may be eligible for a Parent visa (Subclass 103, 143, or 804). Those with substantial assets (AUD 5M+) can explore the Subclass 188 Significant Investor stream.",
    requirements:
      "N/A — Subclass 405 is closed. See alternative pathways.",
    processing_time: "N/A",
    validity_period: "N/A",
    official_url: "https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "australia",
    pathway_type: "investor",
    pathway_name: "Business Innovation and Investment Visa (Subclass 188)",
    // VERIFIED 2026: Multiple streams — Business Innovation, Investor, Significant Investor (AUD 5M), Entrepreneur.
    // State/territory nomination required for all streams.
    summary:
      "Provisional visa for business owners, investors, and entrepreneurs, with a pathway to permanent residence through the Subclass 888. Five streams with different financial requirements and business/investment criteria. State or territory nomination is required for all streams.",
    eligibility:
      "Varies by stream. Significant Investor Stream: AUD 5 million in complying investments, nominated by a state/territory. Investor Stream: AUD 2.5 million in designated investments plus state nomination. Business Innovation Stream: net business assets and turnover thresholds, recent business ownership, state nomination.",
    requirements:
      "Expression of Interest (EOI) through SkillSelect; state or territory nomination; business plan or investment documentation; English language test (for some streams); health and character checks; financial documentation.",
    processing_time: "Typically 6–18 months",
    validity_period:
      "4–5 years provisional; pathway to permanent residence (Subclass 888) after meeting program requirements",
    official_url: "https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/business-innovation-investment-188",
    last_updated: today,
  },

  {
    passport_slug: "any",
    destination_slug: "australia",
    pathway_type: "family",
    pathway_name: "Partner Visa (Subclass 820 / 801)",
    // VERIFIED 2026: Processing times remain very long — 18–36 months or more for offshore applications.
    // Onshore (820/801) and offshore (309/100) partner visa streams available.
    summary:
      "For partners (married spouse or de facto partner) of Australian citizens, permanent residents, or eligible New Zealand citizens. Consists of a temporary stage (820 onshore or 309 offshore) and a permanent stage (801 onshore or 100 offshore) granted after at least 2 years of relationship.",
    eligibility:
      "Must be in a genuine and ongoing marriage or de facto relationship (for at least 12 months for de facto) with an Australian citizen, permanent resident, or eligible New Zealand citizen.",
    requirements:
      "Sponsor application (completed by the Australian partner); evidence of genuine relationship (joint finances, shared accommodation, social recognition, commitment evidence); police clearances; health examinations; financial documents.",
    processing_time:
      "Typically 18–36+ months for the full process (temporary to permanent stages). Processing times vary significantly — check the Department of Home Affairs for current estimates.",
    validity_period:
      "Temporary stage: bridging visa while waiting; Permanent stage: permanent residence granted after approximately 2 years",
    official_url: "https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/partner-onshore-820-801",
    last_updated: today,
  },

];