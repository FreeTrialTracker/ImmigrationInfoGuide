// Last fact-checked: March 30, 2026
// Sources: Thai BOI (ltr.boi.go.th), AIMA Portugal, IRCC Canada, UK Home Office,
// German Make-it-in-Germany portal, Henley & Partners, official government immigration portals.
// Always verify with official immigration authorities before advising clients.

export interface StarterCountryGuide {
  destination_slug: string;
  overview: string;
  common_pathways: string[];
  typical_documents: string[];
  common_pitfalls: string[];
  last_verified: string; // ISO date — used by search engines for freshness signals
}

export const starterCountryGuides: StarterCountryGuide[] = [
  {
    destination_slug: "thailand",
    // KEY 2026 CHANGES:
    // - LTR now grants annual reporting (not 90-day) — confirmed by Thai BOI official site
    // - LTR Wealthy Global Citizen: USD 80k/yr income requirement REMOVED Feb 2025
    // - LTR Wealthy Pensioner: USD 80k/yr passive income (salary excluded); or USD 40k + USD 250k Thai investment
    // - LTR Work-from-Thailand Professionals: USD 80k/yr avg over last 2 years
    // - DTV (Destination Thailand Visa) added as digital nomad option — replaced informal "Tourist + work" gray area
    // - 90-day reporting still applies to non-LTR holders
    last_verified: "2026-03-30",
    overview:
      "Thailand offers multiple immigration pathways for workers, students, retirees, and remote professionals. The flagship Long-Term Resident (LTR) Visa — managed by the Board of Investment (BOI), not standard embassies — grants a 10-year stay (two 5-year terms), annual address reporting instead of 90-day check-ins, multiple re-entries, and family inclusion. As of February 2025, the USD 80,000/year personal income requirement was removed for the Wealthy Global Citizen category. The Destination Thailand Visa (DTV) is the current pathway for lower-income digital nomads. Always verify the latest thresholds at ltr.boi.go.th.",
    common_pathways: [
      "Non-Immigrant B Visa for employment (employer-sponsored, 1 year, renewable)",
      "Long-Term Resident (LTR) Visa — Wealthy Global Citizen: USD 1M+ in global assets or USD 500k Thai investment",
      "LTR Visa — Wealthy Pensioner: 50+, USD 80k/yr passive income (or USD 40k + USD 250k Thai investment)",
      "LTR Visa — Work-from-Thailand Professional: remote worker, USD 80k/yr avg income over 2 years",
      "LTR Visa — Highly Skilled Professional: expert in BOI-targeted industry",
      "Destination Thailand Visa (DTV): 5-year multi-entry for remote workers/digital nomads below LTR income thresholds",
      "Non-Immigrant O-A Visa for retirees 50+ (annual, non-LTR route)",
      "Non-Immigrant ED Visa for students",
    ],
    typical_documents: [
      "Valid passport with at least 6 months validity",
      "Completed visa application forms (BOI online portal for LTR)",
      "Recent passport-sized photographs",
      "Proof of financial means: bank statements, income proof, or asset documentation meeting category thresholds",
      "Health insurance covering Thailand with minimum USD 50,000 medical coverage (or USD 100,000 bank deposit held 12+ months)",
      "Criminal background check from home country",
      "Medical certificate (some visa types)",
      "Supporting documents specific to visa type (employment contract, acceptance letter, asset proof, etc.)",
    ],
    common_pitfalls: [
      "Confusing LTR Wealthy Global Citizen requirements: the USD 80k/yr income threshold was removed in Feb 2025 — only USD 1M in global assets (or USD 500k Thai investment) is now required",
      "Applying for LTR through a Thai embassy instead of the BOI — the correct channel is the BOI online portal or Bangkok BOI office",
      "Insufficient financial documentation or assets not yet transferred/registered before applying",
      "Expired passport or insufficient validity period",
      "Missing health insurance with the minimum USD 50,000 coverage (or not having the USD 100,000 bank deposit alternative)",
      "Confusing tourist visas or the DTV with the LTR — they have very different rights and income thresholds",
      "Non-LTR holders failing to maintain 90-day reporting (LTR holders report annually)",
      "Not factoring in the 3,000 THB/year work permit fee for LTR holders who work in Thailand",
    ],
  },
  {
    destination_slug: "portugal",
    // KEY 2026 CHANGES:
    // - Minimum wage rose to €920/month Jan 2026, so D7 minimum passive income = €920/month (was €870)
    // - D8 Digital Nomad income threshold = €3,680/month (4x minimum wage)
    // - AIMA (replaced SEF) still has significant backlogs — 6–12 months common
    // - Real estate Golden Visa route closed 2023; only fund/research/cultural investment ≥ €500k remain
    // - Citizenship timeline changes proposed (5 → 10 yrs) but Constitutional Court review ongoing as of March 2026
    // - D7 still requires passive income; D8 is now the correct route for remote workers/freelancers
    last_verified: "2026-03-30",
    overview:
      "Portugal remains one of Europe's most popular immigration destinations in 2026. The D7 Passive Income Visa requires a minimum of €920/month (indexed to Portugal's minimum wage, updated January 2026). The D8 Digital Nomad Visa, introduced in 2023, is now the correct route for remote workers and freelancers, requiring €3,680/month. AIMA (Agência para a Integração, Migrações e Asilo) replaced the former SEF and manages residence permits — backlogs of 6–12 months remain common. The Golden Visa real estate route closed in 2023; qualifying investments now start at €500,000 in funds. Proposed changes to the citizenship timeline (from 5 to 10 years) are under Constitutional Court review and are not yet in force as of March 2026. Verify requirements with AIMA at aima.gov.pt.",
    common_pathways: [
      "D7 Visa for passive income holders and retirees (€920/month minimum in 2026)",
      "D8 Digital Nomad Visa for remote workers and freelancers (€3,680/month in 2026)",
      "Golden Visa for investors (fund/research/cultural investment from €500k; real estate route closed since 2023)",
      "Work Visa (D1) for employment by a Portuguese employer",
      "Student Visa (D4) for education",
      "Family reunification for family members of legal residents",
    ],
    typical_documents: [
      "Valid passport",
      "Criminal record certificate from home country and any country resided in during the last year",
      "Proof of accommodation in Portugal (minimum 12-month rental contract or property ownership)",
      "Proof of financial means: for D7, €920/month min; for D8, €3,680/month min (2026 figures — verified at AIMA appointment date, not application date)",
      "Health insurance covering Portugal (some consulates now require 12 months coverage)",
      "Completed national long-stay visa application form",
      "NIF (Portuguese tax number — obtain before applying)",
      "Portuguese bank account with sufficient balance",
      "Biometric data collection (at AIMA appointment)",
      "Category-specific documents (e.g., proof of pension, employer letter, enrollment letter)",
    ],
    common_pitfalls: [
      "Using 2025 income figures (€870/month) — AIMA assesses D7 financial means at the minimum wage in force at your appointment date, which is €920/month in 2026",
      "Applying for D7 with active remote work or freelance income — the D8 is now the correct visa; D7 requires genuinely passive income (pensions, rent, dividends, interest)",
      "Not apostilling documents correctly or missing criminal record certificates from all relevant countries",
      "Insufficient health insurance coverage — some consulates now require 12 months, not just the initial stay",
      "Not scheduling AIMA appointments early enough — 6–12 month backlogs are common",
      "Not obtaining a NIF and opening a Portuguese bank account before the visa stage",
      "Expecting the Golden Visa to be available via real estate — that route closed in 2023",
      "Misunderstanding citizenship timeline: proposed extension to 10 years is under Constitutional Court review and not yet in force",
    ],
  },
  {
    destination_slug: "germany",
    // KEY 2026 CHANGES:
    // - EU Blue Card minimum salary: €50,700/year general (from Jan 1 2026)
    // - EU Blue Card shortage occupations (IT, engineering, STEM, healthcare): €45,934.20/year
    // - IT professionals without university degree now eligible for Blue Card with 3 yrs experience
    // - Skilled Immigration Act (2023) expanded pathways for non-EU nationals
    last_verified: "2026-03-30",
    overview:
      "Germany offers structured immigration pathways for skilled workers, students, freelancers, and entrepreneurs. The EU Blue Card — the primary route for highly qualified non-EU nationals — requires a minimum salary of €50,700/year gross as of January 1, 2026 (€45,934.20/year for shortage occupations including IT, engineering, STEM, and healthcare). A landmark reform now allows IT professionals without a university degree to qualify for the Blue Card if they have 3+ years of relevant experience. Language requirements apply to some visa categories. Consult the official portal make-it-in-germany.com for current requirements.",
    common_pathways: [
      "EU Blue Card for highly qualified workers (€50,700/yr general; €45,934.20/yr shortage occupations in 2026)",
      "EU Blue Card for IT specialists without a university degree (3+ yrs experience, €45,934.20/yr salary)",
      "Skilled Worker Visa (Fachkräftevisa) for employed professionals with recognized qualifications",
      "Job Seeker Visa for finding employment (6 months, non-renewable, no work rights)",
      "Freelance Visa (Freiberufler) for self-employed professionals",
      "Student Visa for university studies",
      "Family reunification visas",
    ],
    typical_documents: [
      "Valid passport",
      "Completed visa application forms",
      "Biometric passport photos",
      "Proof of health insurance (must cover Germany)",
      "Proof of financial means or employment contract with salary meeting Blue Card threshold",
      "Educational certificates with German-recognized translations (check ANABIN database for recognition status)",
      "Employment contract or admission letter",
      "Proof of accommodation",
      "German language proficiency certificate (required for some visa categories, not all)",
    ],
    common_pitfalls: [
      "Not booking visa appointments early — German consulates can have wait times of several months",
      "Missing document translations and certifications — all foreign documents must be officially translated",
      "Not checking ANABIN database for degree recognition before applying — unrecognized degrees can delay or block Blue Card applications",
      "Salary offer below 2026 EU Blue Card thresholds: €50,700/yr general, €45,934.20/yr for shortage occupations",
      "IT professionals without a degree not knowing they may now qualify via the 3-year experience route",
      "Inadequate health insurance coverage for Germany",
      "Incomplete business plans for freelance/entrepreneur visa applications",
    ],
  },
  {
    destination_slug: "spain",
    // KEY 2026 CHANGES:
    // - Spain announced closure of its Golden Visa (real estate) program in 2024/2025
    //   (still processing existing applications but no new real-estate-based applications)
    // - Digital Nomad Visa income threshold: €2,646/month (200% of Spanish minimum wage) in 2026
    // - Non-Lucrative Visa income requirement also tied to IPREM, updated annually
    last_verified: "2026-03-30",
    overview:
      "Spain offers diverse immigration options in 2026 including the Non-Lucrative Visa (for passive income holders and retirees), the Digital Nomad Visa for remote workers, work and student visas, and the Entrepreneur Visa. Important: Spain announced the closure of its Golden Visa real estate route in 2025 — new real-estate-based applications are no longer accepted. Always verify current income thresholds and program status with Spanish consulates or the Secretaría de Estado de Migraciones.",
    common_pathways: [
      "Non-Lucrative Visa for retirees and passive income holders (no work rights)",
      "Digital Nomad Visa for remote workers earning at least €2,646/month (2026 figure)",
      "Golden Visa for investors — real estate route CLOSED; financial asset routes may still apply (verify current status)",
      "Work and Residence Visa (cuenta ajena) for employment with a Spanish employer",
      "Student Visa for education",
      "Entrepreneur Visa for business founders",
    ],
    typical_documents: [
      "Valid passport with copies",
      "Criminal record certificate (apostilled and translated)",
      "Medical certificate (apostilled)",
      "Proof of financial means meeting visa-specific threshold",
      "Health insurance with full coverage in Spain (no co-pays acceptable for most visa types)",
      "Proof of accommodation in Spain",
      "Completed visa application form (EX-01 or relevant form)",
      "Category-specific documents",
    ],
    common_pitfalls: [
      "Applying for the Golden Visa via real estate — Spain ended new applications for the real estate route in 2025",
      "Not apostilling documents correctly — Spanish consulates are strict on apostille requirements",
      "Health insurance that includes co-payments or deductibles — Spain requires policies with zero co-pay",
      "Applying at the wrong consulate — must apply in the consulate for your country of legal residence",
      "Insufficient proof of income for the Non-Lucrative Visa or Digital Nomad Visa",
      "Underestimating financial requirements — the Non-Lucrative Visa requires demonstrating passive income, not just savings",
    ],
  },
  {
    destination_slug: "canada",
    // KEY 2026 CHANGES:
    // - IRCC removed CRS points for LMIA-based job offers in March 2025
    // - New Express Entry categories added Feb 2026: Senior Managers, Researchers, Transport workers, Skilled Military Recruits; plus Physicians (Dec 2025)
    // - General draw CRS cut-offs: ~480–520; category draws lower (e.g., Physicians: 169; French proficiency: ~393)
    // - Language test validity: 2 years (unchanged)
    // - ECA from WES or approved body still required
    last_verified: "2026-03-30",
    overview:
      "Canada uses Express Entry to manage applications for the Federal Skilled Worker, Canadian Experience Class, and Federal Skilled Trades programs. Comprehensive Ranking System (CRS) cut-offs fluctuate by draw type: general draws typically require 480–520 points in early 2026; category-based draws (healthcare, STEM, French proficiency, trades, transport, senior managers, researchers, physicians) have lower cut-offs. Important: as of March 2025, LMIA-based job offers no longer add CRS points. Provincial Nominee Programs (PNPs) add 600 CRS points and remain a highly effective pathway. Consult Immigration, Refugees and Citizenship Canada (IRCC) at canada.ca for current requirements.",
    common_pathways: [
      "Express Entry — Canadian Experience Class (CEC): must have 1+ year Canadian work experience",
      "Express Entry — Federal Skilled Worker (FSW): international skilled workers",
      "Express Entry — Category-Based Draws: healthcare, STEM, French proficiency, trades, transport, senior managers, researchers, physicians, skilled military (active in 2026)",
      "Provincial Nominee Programs (PNP): adds 600 CRS points; each province has different streams",
      "Temporary Foreign Worker Program",
      "Study Permit with Post-Graduation Work Permit (PGWP)",
      "Start-Up Visa for entrepreneurs",
      "Family sponsorship programs",
    ],
    typical_documents: [
      "Valid passport",
      "Language test results: IELTS, CELPIP (English) or TEF, TCF (French) — valid for 2 years",
      "Educational Credential Assessment (ECA) from a designated organization such as WES",
      "Police certificates from all countries where resided 6+ months since age 18",
      "Medical examination results from a panel physician",
      "Proof of funds (liquid, unencumbered — specific amounts required for FSW)",
      "Employment records / reference letters documenting work experience",
      "Provincial nomination letter (if applicable)",
    ],
    common_pitfalls: [
      "Expecting LMIA job offers to boost your CRS — IRCC removed those points in March 2025",
      "CRS score too low for general draws (~480–520); explore category-based draws or PNPs for lower thresholds",
      "Not getting an Educational Credential Assessment (ECA) early — WES assessments can take weeks",
      "Expired language test results — valid for only 2 years; rebook if yours are older",
      "Inadequate proof of funds — must be liquid and unencumbered",
      "Missing required work experience documentation for category-based draws (now 12 months qualifying Canadian experience required, up from 6 months)",
      "Not researching PNPs — a provincial nomination adds 600 CRS points and can make lower scores competitive",
    ],
  },
  {
    destination_slug: "united-states",
    // No major structural changes to flag for 2026 vs original data
    // H-1B lottery, EB-5, O-1 remain as described
    last_verified: "2026-03-30",
    overview:
      "The US immigration system is complex with various visa categories for work, study, investment, and family. Employment-based visas often require employer sponsorship, and the H-1B is subject to an annual lottery (cap). Consult US Citizenship and Immigration Services (USCIS) at uscis.gov and the Department of State travel.state.gov for official requirements.",
    common_pathways: [
      "H-1B Visa for specialty occupations (subject to annual cap and lottery)",
      "L-1 Visa for intracompany transfers",
      "O-1 Visa for individuals with extraordinary ability",
      "F-1 Student Visa (with OPT/STEM OPT for post-graduation work authorization)",
      "EB-5 Immigrant Investor Program",
      "Family-based immigration (immediate relatives, preference categories)",
    ],
    typical_documents: [
      "Valid passport",
      "DS-160 or DS-260 online application form confirmation",
      "Visa application fee receipt",
      "Passport-sized photographs meeting US specifications",
      "Approved petition (I-129 for H-1B/L-1/O-1, I-140 for employment-based immigrants, I-130 for family)",
      "Educational certificates and work experience letters",
      "Financial documentation",
      "Medical examination (Form I-693, for immigrant visas and green card applications)",
      "Police certificates (for immigrant visas)",
    ],
    common_pitfalls: [
      "H-1B cap: only 85,000 visas issued annually (65,000 regular cap + 20,000 for US master's degrees) — most applicants enter a lottery",
      "Long USCIS processing times for many categories — premium processing available for some petition types",
      "Insufficient documentation of extraordinary ability for O-1",
      "Not maintaining valid immigration status while in the US — overstays can result in multi-year bars",
      "Misunderstanding the difference between a nonimmigrant visa and a green card (permanent residence)",
      "Incomplete financial documentation for EB-5 investor visas",
    ],
  },
  {
    destination_slug: "japan",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Japan's immigration system requires a Certificate of Eligibility (CoE) for most work visas — the CoE is applied for by the sponsoring employer or institution in Japan before the applicant applies for a visa abroad. The Highly Skilled Professional (HSP) points-based visa offers accelerated permanent residence. Language ability is not always required but is beneficial for integration. Consult the Ministry of Foreign Affairs and the Immigration Services Agency of Japan for current requirements.",
    common_pathways: [
      "Engineer/Specialist in Humanities/International Services (most common work visa)",
      "Highly Skilled Professional (HSP) points-based visa — accelerated PR pathway",
      "Business Manager visa for entrepreneurs and company directors",
      "Student Visa (Ryugaku)",
      "Specified Skilled Worker (SSW) — Levels 1 and 2 — for specific industries",
      "Spouse or Child of Japanese National",
      "Designated Activities visa (including some remote work arrangements)",
    ],
    typical_documents: [
      "Valid passport",
      "Certificate of Eligibility (CoE) — applied for by sponsor/employer in Japan",
      "Visa application form",
      "Passport photograph",
      "Educational certificates and transcripts",
      "Employment contract or admission letter",
      "Curriculum vitae",
      "Company registration documents (for business visas)",
    ],
    common_pitfalls: [
      "Applying for a visa without first obtaining a Certificate of Eligibility — the CoE must be secured by your sponsor before you apply at a Japanese consulate",
      "Insufficient points for the Highly Skilled Professional visa (minimum 70 points)",
      "Incomplete or insufficiently detailed business plan for Business Manager visa",
      "Not having a guarantor or licensed sponsor in Japan",
      "Attempting to work on a tourist or Designated Activities visa without correct authorization",
      "Not reporting change of address or workplace to the local immigration office within required timeframes",
    ],
  },
  {
    destination_slug: "australia",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Australia uses a points-based system through SkillSelect for skilled migration. State and territory nomination (Subclass 190 or 491) can add 15 or 5 points respectively and is an important strategy for applicants whose scores are below the invitation threshold. Skills assessments must be completed by the relevant Australian assessing authority before an Expression of Interest can be submitted. Consult the Department of Home Affairs at homeaffairs.gov.au for official requirements.",
    common_pathways: [
      "Skilled Independent Visa (Subclass 189) — no sponsorship required, invitation via SkillSelect",
      "Skilled Nominated Visa (Subclass 190) — state/territory nomination, +15 points",
      "Skilled Work Regional (Provisional) Visa (Subclass 491) — regional sponsorship, +5 points",
      "Temporary Skill Shortage Visa (Subclass 482) — employer-sponsored, 2–4 year temporary",
      "Student Visa (Subclass 500)",
      "Business Innovation and Investment Visa",
      "Partner and Family visas",
    ],
    typical_documents: [
      "Valid passport",
      "Skills assessment from the relevant Australian assessing authority (e.g., Engineers Australia, VETASSESS, ACS)",
      "English language test results: IELTS, PTE Academic, TOEFL iBT, or Cambridge C1 Advanced",
      "Police certificates from all countries where resided 12+ months",
      "Health examinations conducted by a DIBP-approved panel physician",
      "Educational qualifications and transcripts",
      "Employment references and payslips",
      "Expression of Interest (EOI) submitted through SkillSelect",
    ],
    common_pitfalls: [
      "Insufficient points for a Subclass 189 invitation — explore state/territory nomination (190 or 491) which adds extra points",
      "Skills assessment does not match the intended ANZSCO occupation code",
      "Not meeting English language requirements for the claimed points level",
      "Health conditions that do not meet Australia's health requirement",
      "Inadequate or poorly documented evidence of skilled employment",
      "Not researching state/territory nomination streams, which are often open to a wider range of occupations and score levels",
    ],
  },
  {
    destination_slug: "singapore",
    // No major structural changes to note for 2026 beyond ongoing salary threshold reviews
    last_verified: "2026-03-30",
    overview:
      "Singapore offers work passes for professionals, managers, and executives, with eligibility heavily tied to salary thresholds and educational qualifications. Approval is not guaranteed and MOM exercises significant discretion. Consult the Ministry of Manpower (MOM) at mom.gov.sg for current requirements and the latest salary thresholds, which are reviewed periodically.",
    common_pathways: [
      "Employment Pass (EP) for professionals, managers, and executives (salary threshold varies by age and sector)",
      "S Pass for mid-skilled workers",
      "EntrePass for entrepreneurs building innovative businesses",
      "Student's Pass for education",
      "Long-Term Visit Pass for family members of pass holders",
      "Personalised Employment Pass (PEP) for high-earning EP holders",
    ],
    typical_documents: [
      "Valid passport",
      "Educational certificates and transcripts",
      "Employment contract and detailed job description",
      "Professional certificates and licenses",
      "Recent passport photograph",
      "Company supporting documents (registration, financial statements)",
      "Business plan (for EntrePass)",
    ],
    common_pitfalls: [
      "Not meeting the minimum salary threshold, which varies by age and sector and is reviewed periodically by MOM — always check the current figures at mom.gov.sg before applying",
      "Insufficient or non-recognized qualifications — MOM weighs quality of institution and relevance of degree to the role",
      "Incomplete or weak business plan for EntrePass applications",
      "Treating EP approval as guaranteed — MOM may reject applications even where stated criteria appear to be met",
      "Missing renewal deadlines — penalties apply for working on an expired pass",
      "Employer not having the correct headcount quota for S Pass holders",
    ],
  },
  {
    destination_slug: "united-kingdom",
    // KEY 2026 CHANGES:
    // - Skilled Worker minimum salary raised to £41,700/year (from £38,700) effective July 22 2025
    // - Minimum skill level raised to RQF Level 6 (graduate level) from July 2025
    // - LMIA-equivalent (Shortage Occupation List) replaced by Immigration Salary List → being replaced by Temporary Shortage List (ending Dec 2026)
    // - ILR qualifying period extended for new entrants
    last_verified: "2026-03-30",
    overview:
      "The UK's points-based immigration system underwent major reforms in 2025. As of July 22, 2025, the Skilled Worker Visa minimum salary is £41,700/year (or the going rate for the occupation, whichever is higher), up from £38,700. Minimum skill level raised to RQF Level 6 (graduate level). Health and Care visa roles have lower thresholds (from ~£31,300). The Immigration Salary List is being phased out and replaced by a Temporary Shortage List (expiring December 2026). Consult UK Visas and Immigration at gov.uk/skilled-worker-visa for official guidance.",
    common_pathways: [
      "Skilled Worker Visa — employer-sponsored, min £41,700/year salary for most roles in 2026",
      "Health and Care Worker Visa — reduced salary thresholds for NHS and eligible care roles",
      "Global Talent Visa — no sponsor required, for leaders in academia, research, arts, digital technology",
      "Student Visa — requires a Confirmation of Acceptance for Studies (CAS) from a licensed sponsor",
      "Graduate Visa — 2-year (3-year for PhDs) post-study work visa, no employer sponsor needed",
      "Innovator Founder Visa — for innovative, scalable business ideas endorsed by an approved body",
      "Family visas",
    ],
    typical_documents: [
      "Valid passport",
      "Certificate of Sponsorship (CoS) from a UK Visas and Immigration licensed sponsor",
      "Proof of English language ability (IELTS UKVI or approved equivalent, or eligible exemption)",
      "Proof of maintenance funds (usually £1,270 in your account for 28 consecutive days)",
      "Tuberculosis test results (required if you are from a listed country)",
      "Academic qualifications (for Graduate/Global Talent routes)",
    ],
    common_pitfalls: [
      "Salary below £41,700/year — the new minimum from July 2025; exceptions exist for PhD holders, new entrants (min ~£33,400), and ISL/Health roles",
      "Minimum skill level not met — roles must be at RQF Level 6 (graduate level) for most Skilled Worker applications",
      "Invalid or insufficient English language test — must be IELTS UKVI or an approved Secure English Language Test",
      "Sponsor not holding a valid UKVI sponsor licence — verify at the official Home Office register",
      "Not having maintenance funds continuously in your bank account for the full 28 days before application",
      "Not paying the Immigration Health Surcharge (IHS) — required for most visa types and is paid upfront for the visa's duration",
    ],
  },
  {
    destination_slug: "united-arab-emirates",
    // No major structural changes to note for 2026 beyond confirming existing programs
    last_verified: "2026-03-30",
    overview:
      "The UAE offers employment visas (requiring employer sponsorship), investor and property-based visas, the Golden Visa for long-term residence (investors, talent, outstanding professionals), and a Remote Work Visa for digital nomads. Regulations vary by emirate; the UAE government's Federal Authority for Identity, Citizenship, Customs, and Port Security (ICP) and General Directorate of Residency and Foreigners Affairs (GDRFA) are the relevant authorities. Verify current requirements at icp.gov.ae.",
    common_pathways: [
      "Employment Visa (requires employer sponsorship — employer initiates the process)",
      "Golden Visa — 10-year renewable residence for investors, property owners (AED 2M+), outstanding professionals, scientists, and talented individuals",
      "Property Investor Visa — 2-year or 10-year depending on investment value",
      "Remote Work Visa — 1-year renewable for digital nomads employed abroad",
      "Student Visa",
      "Dependent Visa for family members",
    ],
    typical_documents: [
      "Valid passport with minimum 6 months validity",
      "Passport photographs",
      "Entry permit issued by sponsor (employer or property developer)",
      "Medical fitness test (conducted within the UAE after entry)",
      "Emirates ID application (biometrics in UAE)",
      "Employment contract or investment proof",
      "Educational certificates (attested — check country-specific attestation chain)",
      "No Objection Certificate (NOC) if changing employers within 6 months of previous visa",
    ],
    common_pitfalls: [
      "Not completing medical tests inside the UAE within the required timeframe after entry",
      "Not understanding the attestation chain for educational documents (home country → UAE embassy → UAE Ministry of Foreign Affairs)",
      "Employer delays in processing the visa — applicants have limited recourse; set clear timelines in employment contracts",
      "Overstaying — daily fines apply and can accumulate quickly",
      "Assuming visa rules are identical across all emirates — GDRFA Dubai rules can differ from Abu Dhabi's ICA rules",
      "Not obtaining an exit permit when canceling a visa before leaving the UAE",
    ],
  },
  {
    destination_slug: "new-zealand",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "New Zealand's Accredited Employer Work Visa (AEWV) is the primary work visa for most skilled migrants and requires a job offer from a New Zealand employer accredited by Immigration New Zealand (INZ). The Skilled Migrant Category Residence Visa uses a points-based system tied to skilled employment in New Zealand. Consult Immigration New Zealand at immigration.govt.nz for current requirements.",
    common_pathways: [
      "Accredited Employer Work Visa (AEWV) — employer must be accredited by INZ",
      "Skilled Migrant Category Residence Visa — points-based, requires skilled employment in NZ",
      "Working Holiday Visa — for eligible nationalities, up to 12–23 months",
      "Student Visa",
      "Entrepreneur Work Visa",
      "Partnership-based visas",
    ],
    typical_documents: [
      "Valid passport",
      "Job offer or employment agreement from an INZ-accredited employer (for AEWV)",
      "English language test results (IELTS or equivalent, if required)",
      "Police certificates from all countries of residence",
      "Medical certificates and chest X-ray (if required)",
      "Qualifications assessment (if occupation requires it)",
      "Evidence of sufficient funds",
      "Expression of Interest (for Skilled Migrant Category)",
    ],
    common_pitfalls: [
      "Employer not being INZ-accredited — without accreditation the AEWV cannot proceed, and accreditation takes time",
      "Occupation not on the skill shortage lists — while not always required, shortage-list occupations are prioritised",
      "Insufficient points for the Skilled Migrant Category",
      "Not meeting health or character requirements",
      "Incomplete or poorly documented work experience",
      "Not exploring regional-specific visa options which may have lower barriers",
    ],
  },
  {
    destination_slug: "mexico",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Mexico offers Temporary and Permanent Resident visas with pathways including retirement, passive income, work, and family ties. Financial requirements are assessed at Mexican consulates and must be demonstrated at the time of application. Verify current requirements with the Instituto Nacional de Migración (INM) at gob.mx/inm.",
    common_pathways: [
      "Temporary Resident Visa (without work permission) — for passive income/retirement",
      "Temporary Resident Visa (with work permission) — requires a job offer from a Mexican employer",
      "Permanent Resident Visa (after 4 years of temporary residence, or directly for qualifying retirees)",
      "Work Visa with job offer",
      "Student Visa",
      "Family unity visa",
    ],
    typical_documents: [
      "Valid passport",
      "Completed visa application",
      "Proof of economic solvency (bank statements, pension income, etc.) meeting consulate-specific thresholds",
      "Passport photographs",
      "Application fee payment",
      "Apostilled supporting documents where required",
    ],
    common_pitfalls: [
      "Applying at a consulate not covering your country of legal residence",
      "Insufficient proof of financial means — income thresholds vary by consulate and change periodically; verify before applying",
      "Not entering Mexico within 180 days of visa approval — the visa becomes invalid",
      "Missing the 30-day window after entry to complete the resident card (canje) at an INM office in Mexico",
      "Not apostilling required documents before traveling to Mexico",
      "Attempting to convert a tourist visa/visa-free entry to residence status in Mexico — this is not permitted; you must apply from abroad",
    ],
  },
  {
    destination_slug: "netherlands",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "The Netherlands offers the Highly Skilled Migrant (HSM) Visa, the Orientation Year for recent graduates, the DAFT visa for US citizens under the Dutch-American Friendship Treaty, and other pathways. The employer must be a recognized IND sponsor. Consult the Immigration and Naturalisation Service (IND) at ind.nl for current salary thresholds and requirements.",
    common_pathways: [
      "Highly Skilled Migrant (Kennismigrant) Visa — requires recognized IND sponsor employer",
      "Orientation Year Visa (Zoekjaar) for recent graduates from top universities",
      "Self-Employment Visa (Zelfstandige zonder personeel/ZZP)",
      "Dutch American Friendship Treaty (DAFT) Visa for US citizens",
      "Student Visa",
      "Family reunification",
    ],
    typical_documents: [
      "Valid passport",
      "MVV (provisional residence permit) — required for most non-EU nationals applying from abroad",
      "Employment contract or admission letter",
      "Proof of sufficient means (salary meeting HSM threshold or self-employment business plan)",
      "Tuberculosis test certificate if applicable (from listed countries)",
      "Antecedents certificate (criminal record) from country of origin",
      "Diploma or degree certificates",
      "Sponsor declaration from employer (IND-recognized sponsor only)",
    ],
    common_pitfalls: [
      "Employer not registered as an IND recognized sponsor — without this, the HSM visa is not possible",
      "Salary not meeting the HSM threshold (varies by age — check current IND figures as they update annually)",
      "Insufficient business plan for self-employment visa applications",
      "Missing MVV requirement — most non-EU nationals must obtain an MVV (entry visa) before traveling",
      "Not understanding that the work authorization and residence permit are processed together via the sponsor",
      "Delaying collection of the residence permit after arrival — it must be collected at the IND within a specific window",
    ],
  },
  {
    destination_slug: "italy",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Italy issues work visas through an annual quota system (decreto flussi), which opens for a limited number of applications and fills very quickly. The Elective Residence Visa suits passive income holders. The Permesso di Soggiorno must be applied for within 8 days of arrival. Consult Italian diplomatic missions and the Ministry of Interior at portaleimmigrazione.it for requirements.",
    common_pathways: [
      "Elective Residence Visa for passive income holders (no work rights)",
      "Work Visa (decreto flussi — annual quota system)",
      "Self-Employment Visa (freelancers, professionals)",
      "Start-up Visa for qualifying entrepreneurs",
      "Student Visa",
      "Family reunification",
    ],
    typical_documents: [
      "Valid passport",
      "Visa application form (submitted at Italian consulate in your country of residence)",
      "Nulla Osta (work authorization from Italian employer, for work visas)",
      "Proof of accommodation in Italy",
      "Proof of financial means",
      "Health insurance",
      "Criminal record certificate",
      "Category-specific supporting documents",
    ],
    common_pitfalls: [
      "Annual work visa quotas (decreto flussi) fill within minutes of opening — have all documents ready before the portal opens",
      "Not applying for the Permesso di Soggiorno at a local post office (CAF) within 8 days of arriving in Italy",
      "Insufficient passive income documentation for the Elective Residence Visa",
      "Severely underestimating processing times at Italian consulates (often 3–6 months)",
      "Missing document translations and legalizations — Italian authorities require sworn translations into Italian",
      "Not understanding that the quota system is separate from employer sponsorship — both must align",
    ],
  },
  {
    destination_slug: "france",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "France offers a range of long-stay visas including the Talent Passport (Passeport Talent) for various skilled worker categories, the French Tech Visa for tech employees and founders, the Visitor Long-Stay Visa for passive income holders, and Student Visas. OFII validation must be completed within 3 months of arrival for long-stay visa holders. Consult France-Visas (france-visas.gouv.fr) for requirements.",
    common_pathways: [
      "Talent Passport (Passeport Talent) — multiple sub-categories including highly skilled employees, researchers, artists, investors, and innovators",
      "French Tech Visa — for employees and founders of certified French Tech ecosystem companies",
      "Long-Stay Visitor Visa — for passive income holders and retirees",
      "Employee Long-Stay Visa — requires work authorization from DRIEETS",
      "Student Visa",
      "Family reunification",
    ],
    typical_documents: [
      "Valid passport",
      "Long-stay visa application form (via france-visas.gouv.fr)",
      "Passport photographs",
      "Proof of accommodation",
      "Proof of financial means",
      "Health insurance",
      "Criminal record",
      "Category-specific supporting documents",
    ],
    common_pitfalls: [
      "Not validating the long-stay visa with OFII within 3 months of arrival — failure to validate invalidates the visa",
      "Insufficient proof of financial means — France requires demonstrating you will not be a burden on the state",
      "Incomplete document translations — all documents in non-French languages must be translated by a certified translator",
      "Not understanding Talent Passport eligibility criteria — each sub-category has specific salary, contract, or qualification requirements",
      "Missing visa appointment due to high demand at French consulates — book well in advance",
      "Not meeting minimum salary requirements for the employee categories of the Talent Passport",
    ],
  },
  {
    destination_slug: "costa-rica",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Costa Rica offers retirement (Pensionado), passive income (Rentista), and investor residence programs, as well as a Digital Nomad Visa for remote workers. All documents must be apostilled and officially translated into Spanish. Processing can take 12–24 months. Verify requirements with the Dirección General de Migración y Extranjería (DGME) at migracion.go.cr.",
    common_pathways: [
      "Pensionado (retiree) residency — requires minimum USD 1,000/month pension income",
      "Rentista (passive income) residency — requires minimum USD 2,500/month provable income or USD 60,000 deposited in a Costa Rican bank",
      "Investor residency — minimum USD 150,000 investment in Costa Rica",
      "Work permit with residence (employer-sponsored)",
      "Student visa",
      "Digital Nomad Visa — for remote workers with minimum USD 3,000/month income",
    ],
    typical_documents: [
      "Valid passport",
      "Birth certificate (apostilled and officially translated to Spanish)",
      "Marriage certificate if applicable (apostilled and translated)",
      "Criminal record from home country and all countries of recent residence (apostilled and translated)",
      "Proof of income or investment meeting the specific program threshold",
      "Health certificate",
      "Passport photographs",
      "Application forms and fees paid",
    ],
    common_pitfalls: [
      "Not apostilling AND having documents officially translated into Spanish — both are required; either alone is insufficient",
      "Using documents older than 6 months — Costa Rican immigration does not accept outdated documents",
      "Insufficient proof of pension or passive income for the specific program threshold",
      "Underestimating the processing timeline — residency applications frequently take 12–24 months",
      "Not maintaining required physical presence in Costa Rica for residency renewals",
      "Attempting to convert tourist status to residency inside Costa Rica — this is generally not permitted",
    ],
  },
  {
    destination_slug: "malaysia",
    // No major structural changes to note for 2026; MM2H still has stricter 2021 requirements
    last_verified: "2026-03-30",
    overview:
      "Malaysia offers the revamped Malaysia My Second Home (MM2H) program for long-term stays, employment passes for skilled workers, and a DE Rantau digital nomad pass. The MM2H program was significantly restructured in 2021 with higher financial requirements and has not returned to its previous more accessible terms. Consult the Immigration Department of Malaysia at imi.gov.my for current requirements.",
    common_pathways: [
      "Malaysia My Second Home (MM2H) — 5-year renewable, high financial requirements",
      "Employment Pass (Category I, II, III depending on salary and role)",
      "Professional Visit Pass (for short-term professional work)",
      "Student Pass",
      "Dependent Pass for family of employment pass holders",
      "DE Rantau Digital Nomad Pass (for remote workers with qualified employer outside Malaysia)",
    ],
    typical_documents: [
      "Valid passport (minimum 18 months validity for MM2H)",
      "Passport photographs",
      "Letter of good conduct / police clearance",
      "Medical report from a registered doctor",
      "Financial documents — MM2H requires significant liquid assets and fixed deposit in a Malaysian bank",
      "Educational certificates (for employment passes)",
      "Employment contract (for work passes)",
      "Approval letter from Tourism Malaysia (for MM2H)",
    ],
    common_pitfalls: [
      "MM2H program is significantly more stringent since 2021 — the minimum offshore income (RM 40,000/month) and fixed deposit (RM 1 million) requirements are much higher than before the revision",
      "Not meeting age requirements — MM2H has different tiers for those above and below 35",
      "Employer not registered with the relevant Malaysian authority or lacking approval quota",
      "Incomplete health screening or using an unapproved medical provider",
      "Confusing the Social Visit Pass (tourist entry) with residence or MM2H status",
      "Not understanding that DE Rantau is a separate program with its own application portal",
    ],
  },
  {
    destination_slug: "ireland",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Ireland offers the Critical Skills Employment Permit for high-demand roles, the General Employment Permit for broader occupations, and the Startup Entrepreneur Programme (STEP). Employment permits are issued by the Department of Enterprise, Trade and Employment (DETE) and must be approved before a visa application is made. Non-EEA nationals then register for an Irish Residence Permit (IRP) on arrival. Consult the DETE employment permits page and the Irish Naturalisation and Immigration Service (INIS/ISD) at irishimmigration.ie.",
    common_pathways: [
      "Critical Skills Employment Permit — for roles on the Critical Skills Occupations List",
      "General Employment Permit — for other eligible roles not on the ineligible list",
      "Startup Entrepreneur Programme (STEP)",
      "Student Visa",
      "Stamp 0 for persons of independent means",
      "Family reunification",
    ],
    typical_documents: [
      "Valid passport",
      "Employment permit approval from DETE (obtained before visa application)",
      "Job offer and signed employment contract",
      "Educational qualifications",
      "Proof of financial means",
      "Private medical insurance",
      "Irish Residence Permit (IRP) registration at a Garda National Immigration Bureau (GNIB) office within 90 days of arrival",
    ],
    common_pitfalls: [
      "Applying for a job that appears on the ineligible occupations list — these cannot be sponsored under general permits",
      "Salary below the required minimum for the relevant permit type — verify current figures with DETE",
      "Labour Market Needs Test not satisfied for General Employment Permit applications — employer must advertise the role domestically first",
      "Not registering for an IRP within 90 days of arrival in Ireland",
      "Applying for a visa before the employment permit is approved — the permit must come first",
      "Insufficient proof of independent means for Stamp 0 applications (no work or access to public funds allowed on this stamp)",
    ],
  },
  {
    destination_slug: "south-korea",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "South Korea offers a variety of visa types for skilled work (E-7), study (D-2), job seeking (D-10), and long-term residence (F-series). Most work visas require a visa issuance number obtained through the Korean employer before applying at a Korean diplomatic mission abroad. The F-2 Resident Visa uses a points system. Consult the Hi Korea portal at hikorea.go.kr for current requirements.",
    common_pathways: [
      "E-7 Visa (Designated Activities) — skilled work in specific occupations approved by MOEF",
      "D-10 Job Seeker Visa — for searching for employment in Korea (for graduates of Korean universities or overseas professionals)",
      "D-2 Student Visa",
      "F-2 Resident Visa (points-based) — for long-term residents qualifying via education, income, Korean ability",
      "F-4 Visa for overseas Koreans of Korean descent",
      "Marriage-based visas (F-2, F-5, F-6)",
    ],
    typical_documents: [
      "Valid passport",
      "Visa application form",
      "Passport photograph",
      "Visa issuance number from a Korean Immigration office (obtained by Korean employer/institution)",
      "Certificate of employment or admission",
      "Educational certificates and transcripts",
      "Health certificate (some visa types)",
      "Criminal record check",
    ],
    common_pitfalls: [
      "Not obtaining a visa issuance number before visiting the Korean consulate — without it the visa cannot be issued",
      "Insufficient points for the F-2 resident visa (minimum 80 points required)",
      "Document apostille and authentication requirements not met — verify the specific requirements with the Korean consulate in your country",
      "Not meeting minimum salary requirements for E-7 work visas",
      "Not registering at a local immigration office within 90 days of entry when required",
      "Not having Korean language proficiency (TOPIK) where it is required for specific E-7 categories",
    ],
  },
  {
    destination_slug: "greece",
    // KEY 2026 CHANGES:
    // - Golden Visa tier system confirmed: €800k (Zone A: Athens, Thessaloniki, islands >3,100 pop), €400k (Zone B), €250k (Zone C: conversions/restorations)
    // - New startup investment route added Jan 2026: €250k investment in Elevate Greece registry startup
    // - Citizenship: 7 years legal residence + language exam required (unchanged)
    last_verified: "2026-03-30",
    overview:
      "Greece's Golden Visa program uses a three-tier investment structure as of 2024/2026: Zone A (Athens, Thessaloniki, major islands) requires €800,000; Zone B (regional areas) requires €400,000; Zone C (heritage building conversions/restorations) requires €250,000. A new startup investment route launched in January 2026 allows a €250,000 investment in a startup registered on the Elevate Greece national registry. The Golden Visa grants 5-year renewable residence with no minimum stay requirement but does not include work rights. Citizenship requires 7 years of actual residence (183 days/year) and a Greek language exam. Consult the Greek Ministry of Migration and Asylum at migration.gov.gr.",
    common_pathways: [
      "Golden Visa — Zone A (Athens, Thessaloniki, major islands): minimum €800,000 real estate investment",
      "Golden Visa — Zone B (regional Greece): minimum €400,000 real estate investment",
      "Golden Visa — Zone C (heritage conversions/restorations, anywhere in Greece): minimum €250,000",
      "Golden Visa — Startup investment: minimum €250,000 in an Elevate Greece registered startup (new from Jan 2026)",
      "Golden Visa — Financial assets: €500,000 government bonds, REITs, or qualifying funds",
      "Work Permit and Residence (employer-sponsored)",
      "Financially Independent Person Visa",
      "Digital Nomad Visa",
      "Student Visa",
      "Family reunification",
    ],
    typical_documents: [
      "Valid passport",
      "Completed application forms",
      "Passport photographs",
      "Proof of qualifying investment (notarized purchase agreement, investment certificates, etc.)",
      "Proof of health insurance",
      "Criminal record certificate",
      "Medical certificate (for some visa types)",
      "Financial documentation demonstrating source of funds",
    ],
    common_pitfalls: [
      "Not understanding the three-tier zone system — the same property type now costs €250k, €400k, or €800k depending on exact location",
      "Confusing the €800k Zone A threshold (Athens, Thessaloniki, major islands) with the old single €800k figure — lower zones still exist",
      "Assuming the Golden Visa grants work rights — it does not; additional permits are needed to work in Greece",
      "Insufficient proof of financial independence for the Financially Independent Person Visa",
      "Document translation and apostille/legalization requirements — all foreign documents must be translated and legalized",
      "Significant processing backlogs at Greek authorities — plan for a 6–12 month timeline",
      "Not understanding that citizenship requires 7 years of actual legal residence (183 days/year) plus a Greek language and culture exam",
    ],
  },
  {
    destination_slug: "chile",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Chile's immigration framework is governed by the 2021 Ley de Migración. Most foreign nationals apply for a Temporary Residence Visa that leads to Definitive Residence after 2 years of continuous stay. RUT (tax ID) registration is essential upon arrival. Verify requirements with the Servicio Nacional de Migraciones (SERMIG) at migracionchile.cl.",
    common_pathways: [
      "Temporary Residence Visa for employment (requires job offer from a Chilean employer)",
      "Temporary Residence for Independent Means (for passive income holders and retirees)",
      "Startup Chile Visa — for entrepreneurs selected through the Startup Chile program",
      "Student Visa",
      "Definitive Residence — after 2 years of temporary residence",
      "Family reunification",
    ],
    typical_documents: [
      "Valid passport",
      "Birth certificate (apostilled)",
      "Criminal record from home country and countries of recent residence (apostilled)",
      "Health certificate",
      "Proof of means of support (employment contract, income documentation)",
      "Employment contract or business plan",
      "Passport photographs",
      "Application fees paid through the government portal",
    ],
    common_pitfalls: [
      "Not apostilling documents before traveling — Chilean immigration will not accept unverified foreign documents",
      "Insufficient proof of financial means — monthly income thresholds apply",
      "Not applying for a RUT (tax ID) promptly after arrival — required for bank accounts, contracts, and most legal matters",
      "Using documents older than 90 days — they are not accepted by SERMIG",
      "Not completing required steps within required timeframes (e.g., residence card appointment after visa approval)",
      "Confusing Temporary and Definitive Residence — Definitive Residence requires 2 continuous years as a temporary resident",
    ],
  },
  {
    destination_slug: "colombia",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Colombia's visa system was modernized in 2022 and categorizes visas as Visitor (V), Migrant (M), and Resident (R). The Migrant category includes work, investor, retirement, and digital nomad visas. A Cédula de Extranjería (foreign ID card) must be obtained within 15 days of a Migrant or Resident visa being issued. Verify requirements with the Ministerio de Relaciones Exteriores at cancilleria.gov.co.",
    common_pathways: [
      "Visitor Visa (V) with work authorization — for short-term work arrangements",
      "Migrant Visa (M) — employee: requires Colombian employer sponsorship",
      "Migrant Visa (M) — business owner/investor: for those running or investing in a Colombian company",
      "Migrant Visa (M) — pensioner/retiree: minimum ~3x Colombian minimum wage in monthly pension income",
      "Digital Nomad Visa (V) — 2-year multiple-entry, requires minimum income from outside Colombia",
      "Student Visa",
      "Marriage/family-based residence",
      "Resident Visa (R) — after 5 years of continuous Migrant visa status in most categories",
    ],
    typical_documents: [
      "Valid passport",
      "Online visa application via the Colombian Ministry of Foreign Affairs portal",
      "Motivation letter",
      "Financial documentation meeting category threshold",
      "Apostilled documents (varies by visa type)",
      "Criminal record if required",
      "Health insurance valid in Colombia",
      "Category-specific documents (employment contract, investment proof, etc.)",
    ],
    common_pitfalls: [
      "Not understanding the V/M/R visa category system — applying in the wrong category causes rejection",
      "Insufficient financial documentation — minimum income and asset requirements apply by category",
      "Attempting to work on a Visitor visa without work authorization — penalties apply",
      "Not applying for the Cédula de Extranjería within 15 days of visa issuance",
      "Not apostilling required documents from your home country",
      "Not understanding the accumulation of time across Migrant visa renewals required for the Resident visa",
    ],
  },
  {
    destination_slug: "brazil",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Brazil offers work visas (VITEM V), investor visas (VITEM II), retirement visas (VITEM I), and a Digital Nomad Visa. Work authorization from the Ministry of Labor must be obtained before applying for a work visa. Federal Police registration within 90 days of arrival is mandatory. Consult Brazilian consulates and the Ministry of Justice and Public Security at justica.gov.br.",
    common_pathways: [
      "Work Visa (VITEM V) — requires prior Ministry of Labor authorization",
      "Investment Visa (VITEM II) — minimum USD 500,000 in a Brazilian company (for most nationalities)",
      "Retirement/Pension Visa (VITEM I) — for those with provable pension income",
      "Student Visa (VITEM IV)",
      "Digital Nomad Visa — 1-year renewable, minimum USD 1,500/month income from abroad",
      "Family reunification",
    ],
    typical_documents: [
      "Valid passport",
      "Visa application form",
      "Passport photographs",
      "Criminal record (apostilled)",
      "Work authorization letter from Brazilian Ministry of Labor (for VITEM V)",
      "Proof of financial means",
      "Health certificate",
      "Yellow fever vaccination certificate (required if traveling from/through certain countries)",
    ],
    common_pitfalls: [
      "Applying for a work visa before obtaining Ministry of Labor authorization — the authorization must come first",
      "Insufficient investment amount documented for VITEM II — minimum varies by nationality and investment type",
      "Not understanding apostille requirements — Brazilian authorities require apostilled documents",
      "Not registering with the Federal Police at the nearest regional office within 90 days of arrival",
      "Missing yellow fever vaccination documentation if arriving from or through affected countries",
      "Significantly underestimating processing times — Brazilian consulates and internal processes are typically slow",
    ],
  },
  {
    destination_slug: "argentina",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Argentina offers relatively accessible Temporary Residence leading to Permanent Residence after 2 years (3 years for most non-Mercosur citizens). The Rentista and Pensioner categories require provable regular income. The DNI (national identity document for residents) must be applied for promptly after residence is approved. Verify requirements with the Dirección Nacional de Migraciones (DNM) at migraciones.gob.ar.",
    common_pathways: [
      "Temporary Residence — Rentista: requires provable passive income meeting the monthly threshold",
      "Temporary Residence — Pensioner: verified pension income from abroad",
      "Temporary Residence — Work: employment contract with Argentine employer",
      "Temporary Residence — Investor",
      "Student Visa",
      "Mercosur/Mercosur-associated state citizens: simplified and faster process",
      "Permanent Residence — after 2–3 years of Temporary Residence",
    ],
    typical_documents: [
      "Valid passport",
      "Birth certificate (apostilled)",
      "Criminal record from home country and countries of residence in the last 3 years (apostilled)",
      "Proof of income or pension (bank statements, pension letters, etc.)",
      "Passport photographs",
      "Application fees",
    ],
    common_pitfalls: [
      "Not apostilling documents before arriving in Argentina — unverified documents are not accepted",
      "Documents older than 3 months are not accepted by DNM",
      "Insufficient proof of passive income or pension to meet the monthly threshold (amounts change — verify with DNM)",
      "Not applying for the DNI (national ID for residents) promptly after residence approval",
      "Not maintaining the required monthly income level for renewals",
      "Not understanding that 2–3 years of continuous Temporary Residence is required before applying for Permanent Residence",
    ],
  },
  {
    destination_slug: "south-africa",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "South Africa's immigration system is managed by the Department of Home Affairs (DHA). The Critical Skills Work Visa is the primary route for skilled migrants and requires the applicant's occupation to appear on the current Critical Skills List. SAQA verification of qualifications is required and can take several months. Consult the DHA at dha.gov.za for requirements.",
    common_pathways: [
      "Critical Skills Work Visa — occupation must be on the current Critical Skills List",
      "General Work Visa (requires employer to prove no South African can fill the role)",
      "Business Visa (minimum investment thresholds apply)",
      "Retired Person's Visa (minimum provable pension/assets)",
      "Study Visa",
      "Relatives Visa (for family members of South African citizens or permanent residents)",
    ],
    typical_documents: [
      "Valid passport",
      "Completed visa application form (BI-1738 or successor form)",
      "Police clearance certificates from all countries where resided 12+ months since age 18",
      "Medical certificate and radiological (chest X-ray) report from a DHA-approved provider",
      "Proof of medical aid/health insurance coverage in South Africa",
      "SAQA evaluation of qualifications (for Critical Skills visa)",
      "Financial documents meeting the visa-specific threshold",
      "Yellow fever certificate if applicable",
    ],
    common_pitfalls: [
      "Occupation not on the current Critical Skills List — the list is reviewed and updated periodically; verify before applying",
      "SAQA verification of qualifications is mandatory and can take several months — start this process early",
      "Not obtaining medical and radiological reports from a DHA-approved provider — reports from non-approved providers are rejected",
      "Applying for the wrong visa category — critical skills, general work, and business visas have significantly different requirements",
      "Significant administrative delays at the DHA — build extensive buffer time into your plans",
      "Insufficient proof of financial means for the Business or Retired Person's visa",
    ],
  },
  {
    destination_slug: "mauritius",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Mauritius offers Occupation Permits for professionals, investors, and self-employed individuals, as well as a Premium Travel Visa for remote workers and a Retired Non-Citizen Permit. The Economic Development Board (EDB) manages Occupation Permits, which are streamlined compared to many other countries. Verify requirements at edbmauritius.org.",
    common_pathways: [
      "Occupation Permit — Professional (employer-sponsored, minimum salary thresholds apply)",
      "Occupation Permit — Investor (minimum business turnover targets)",
      "Occupation Permit — Self-Employed (minimum annual income targets)",
      "Premium Travel Visa — 1-year renewable for remote workers employed outside Mauritius",
      "Retired Non-Citizen Permit — minimum USD 1,500/month transferred to Mauritius",
      "Residence Permit through property purchase (minimum USD 375,000)",
    ],
    typical_documents: [
      "Valid passport",
      "Application form (via EDB portal)",
      "Passport photographs",
      "Police clearance certificate",
      "Proof of qualifications or detailed business plan",
      "Financial statements and proof of investment or income",
      "Health insurance meeting the permit type's requirements",
      "Proof of accommodation",
    ],
    common_pitfalls: [
      "Minimum salary/investment thresholds not met — verify current EDB figures as they are subject to change",
      "Insufficient or generic business plan for Investor or Self-Employed Occupation Permits",
      "Not understanding that the Occupation Permit does not automatically lead to Permanent Residence — a separate application is required after a qualifying period",
      "Health insurance coverage not meeting the requirements for the specific permit type",
      "Missing annual revenue reporting requirements required for Occupation Permit renewal",
      "Not registering with local authorities within the required timeframe after arrival",
    ],
  },
  {
    destination_slug: "seychelles",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Seychelles is a small island nation with a limited labor market concentrated in tourism and hospitality. The Gainful Occupation Permit (GOP) requires employers to demonstrate no local candidate is available. The Permanent Residence Certificate requires substantial property investment. Official information from the Seychelles Department of Immigration is limited — consult directly with the department or a local attorney.",
    common_pathways: [
      "Gainful Occupation Permit (GOP) for employment (employer must prove no local available)",
      "Self-Employment Permit",
      "Permanent Residence Certificate (substantial property purchase required)",
      "Investor Permit",
    ],
    typical_documents: [
      "Valid passport",
      "Completed application forms",
      "Passport photographs",
      "Police clearance",
      "Medical certificate",
      "Proof of qualifications or business",
      "Financial documentation",
      "Employment contract or business plan",
    ],
    common_pitfalls: [
      "Very limited employment opportunities outside tourism, hospitality, and fishing — most professional sectors are small",
      "High cost of living in Seychelles relative to the local salary scale",
      "GOP requires employer to demonstrate no suitable local candidate is available before a permit is considered",
      "Limited publicly available information in English — official guidance can be difficult to find",
      "Small market size makes business ventures challenging — thorough market research is essential",
      "Permanent Residence Certificate requirements include substantial property purchase at prices well above many buyers' expectations",
    ],
  },
  {
    destination_slug: "egypt",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Egypt's immigration processes for long-term residence require local sponsorship for most visa types, and Ministry of Manpower approval must precede a work visa. Bureaucratic processes can be complex and lengthy. Registration with local police is required after arrival. Consult Egyptian diplomatic missions and the Ministry of Manpower at manpower.gov.eg.",
    common_pathways: [
      "Work Visa and Residence (Ministry of Manpower authorization required first)",
      "Student Visa",
      "Investor Residence",
      "Family Residence",
    ],
    typical_documents: [
      "Valid passport with 6+ months validity",
      "Visa application forms",
      "Passport photographs",
      "Work permit from Ministry of Manpower (required before work visa application)",
      "Security clearance",
      "Health certificate",
      "Residence visa application (submitted in-country)",
      "Registration with local police station within the required timeframe",
    ],
    common_pitfalls: [
      "Attempting to apply for a work visa without first obtaining Ministry of Manpower approval — the work permit comes first",
      "Complex and multi-step bureaucratic processes — using a local attorney or employer HR support is strongly recommended",
      "Local sponsor required for most visa types — independent applicants face significant difficulty",
      "Not registering with local police within the required timeframe after entry",
      "Tourist visa cannot easily be converted to a residence visa from within Egypt",
      "Processing times are unpredictable and can extend significantly beyond initial estimates",
    ],
  },
  {
    destination_slug: "morocco",
    // No major structural changes to note for 2026
    last_verified: "2026-03-30",
    overview:
      "Morocco's work permit system requires employers to demonstrate no Moroccan national is available for the role. Residence cards (Carte de Séjour) are applied for in-country after arrival and are distinct from the entry visa. French or Arabic language skills are strongly beneficial as most official processes are conducted in these languages. Consult Moroccan diplomatic missions for current requirements.",
    common_pathways: [
      "Work permit and residence (employer-sponsored, ANAPEC labor market test required)",
      "Student visa",
      "Carte de Séjour for retirees and passive income holders",
      "Business visa for investors",
      "Family reunification",
    ],
    typical_documents: [
      "Valid passport",
      "Visa application (submitted at Moroccan consulate in country of legal residence)",
      "Passport photographs",
      "Employment contract (for work visa)",
      "Criminal record",
      "Medical certificate",
      "Proof of accommodation",
      "Carte de Séjour application submitted in Morocco after arrival",
    ],
    common_pitfalls: [
      "Visa application must be submitted at a consulate in your country of legal residence — not your country of nationality if different",
      "Work permits require employer to demonstrate via ANAPEC that no Moroccan national can fill the role — this is a genuine labor market test, not a formality",
      "The Carte de Séjour (residence card) is a separate in-country process from the entry visa — both are required for legal long-term residence",
      "Official processes are largely conducted in French or Arabic — limited English-language guidance is available from government sources",
      "Multiple government offices are often involved — bureaucratic coordination between the ONMT, Ministry of Interior, and ANAPEC can cause delays",
      "Confusing the entry visa with the Carte de Séjour — the entry visa allows entry; the Carte de Séjour formalizes the right to reside",
    ],
  },
];