export interface StarterCountryGuide {
  destination_slug: string;
  overview: string;
  common_pathways: string[];
  typical_documents: string[];
  common_pitfalls: string[];
}

export const starterCountryGuides: StarterCountryGuide[] = [
  {
    destination_slug: "thailand",
    overview: "Thailand offers various immigration pathways for workers, students, retirees, and digital nomads. The country has streamlined processes for long-term stays through the LTR program. Always verify current requirements with Thai immigration authorities.",
    common_pathways: [
      "Non-Immigrant B Visa for employment",
      "Long-Term Resident (LTR) Visa for remote workers and wealthy retirees",
      "Non-Immigrant O-A Visa for retirees 50+",
      "Non-Immigrant ED Visa for students",
      "Investment-based visas for business owners"
    ],
    typical_documents: [
      "Valid passport with at least 6 months validity",
      "Completed visa application forms",
      "Recent passport-sized photographs",
      "Proof of financial means (bank statements, income proof)",
      "Criminal background check from home country",
      "Medical certificate",
      "Health insurance coverage",
      "Supporting documents specific to visa type (employment contract, acceptance letter, etc.)"
    ],
    common_pitfalls: [
      "Insufficient financial documentation",
      "Expired passport or insufficient validity period",
      "Missing health insurance coverage",
      "Not allowing enough processing time before intended travel",
      "Confusing tourist visas with long-term residence options",
      "Failing to maintain 90-day reporting requirements"
    ]
  },
  {
    destination_slug: "portugal",
    overview: "Portugal has become increasingly popular for immigration, offering pathways through work, study, retirement (D7 visa), digital nomad visas, and the Golden Visa program. The country provides a clear path to permanent residence and citizenship. Verify requirements with Portuguese immigration services.",
    common_pathways: [
      "D7 Visa for passive income holders and retirees",
      "D8 Digital Nomad Visa for remote workers",
      "Golden Visa for investors",
      "Work Visa (D1) for employment",
      "Student Visa (D4) for education",
      "Family reunification for family members"
    ],
    typical_documents: [
      "Valid passport",
      "Criminal record certificate from home country and countries resided in last year",
      "Proof of accommodation in Portugal",
      "Proof of financial means (varies by visa type)",
      "Health insurance covering Portugal",
      "Completed visa application forms",
      "Biometric data collection",
      "Specific documents per visa category"
    ],
    common_pitfalls: [
      "Inadequate proof of passive income for D7 visa",
      "Not apostilling documents properly",
      "Missing criminal record certificates from all relevant countries",
      "Insufficient health insurance coverage",
      "Not scheduling appointments early enough",
      "Underestimating processing times (2-3 months typical)"
    ]
  },
  {
    destination_slug: "germany",
    overview: "Germany offers structured immigration pathways for skilled workers, students, freelancers, and entrepreneurs. The EU Blue Card is popular for highly qualified workers. Language requirements may apply for some visa categories. Consult German immigration authorities for current requirements.",
    common_pathways: [
      "EU Blue Card for highly qualified workers",
      "Work Visa for employed professionals",
      "Student Visa for university studies",
      "Freelance Visa for self-employed professionals",
      "Job Seeker Visa for finding employment",
      "Family reunification visas"
    ],
    typical_documents: [
      "Valid passport",
      "Completed visa application forms",
      "Biometric passport photos",
      "Proof of health insurance (coverage in Germany)",
      "Proof of financial means or employment",
      "Educational certificates (with translations)",
      "Employment contract or admission letter",
      "Proof of accommodation",
      "German language proficiency (for certain visas)"
    ],
    common_pitfalls: [
      "Not booking visa appointments early (can have long wait times)",
      "Missing document translations and certifications",
      "Inadequate health insurance coverage",
      "Not meeting minimum salary requirements for EU Blue Card",
      "Insufficient German language skills where required",
      "Incomplete business plans for freelance/entrepreneur visas"
    ]
  },
  {
    destination_slug: "spain",
    overview: "Spain offers diverse immigration options including work visas, the popular non-lucrative visa for retirees, a digital nomad visa, and the Golden Visa program. Processing times vary by visa type and consulate. Always verify with Spanish immigration authorities.",
    common_pathways: [
      "Non-Lucrative Visa for retirees and passive income holders",
      "Digital Nomad Visa for remote workers",
      "Golden Visa for investors",
      "Work and Residence Visa for employment",
      "Student Visa for education",
      "Entrepreneur Visa for business owners"
    ],
    typical_documents: [
      "Valid passport with copies",
      "Criminal record certificate (apostilled)",
      "Medical certificate",
      "Proof of financial means",
      "Health insurance with coverage in Spain",
      "Proof of accommodation",
      "Completed visa application forms",
      "Biometric data",
      "Category-specific documents"
    ],
    common_pitfalls: [
      "Not apostilling documents correctly",
      "Insufficient proof of income for non-lucrative visa",
      "Missing medical insurance meeting Spanish requirements",
      "Not demonstrating non-Spanish income sources for certain visas",
      "Underestimating financial requirements",
      "Applying at wrong consulate (must be country of residence)"
    ]
  },
  {
    destination_slug: "canada",
    overview: "Canada offers multiple immigration pathways through Express Entry, Provincial Nominee Programs, work permits, study permits, and family sponsorship. The points-based system for skilled workers is competitive. Consult Immigration, Refugees and Citizenship Canada (IRCC) for current requirements.",
    common_pathways: [
      "Express Entry (Federal Skilled Worker, Canadian Experience Class)",
      "Provincial Nominee Programs (PNP)",
      "Temporary Foreign Worker Program",
      "Study Permit with post-graduation work permit",
      "Start-Up Visa for entrepreneurs",
      "Family sponsorship programs"
    ],
    typical_documents: [
      "Valid passport",
      "Language test results (IELTS, CELPIP, or TEF)",
      "Educational Credential Assessment (ECA)",
      "Police certificates",
      "Medical examination results",
      "Proof of funds",
      "Job offer or LMIA (if applicable)",
      "Provincial nomination (if applicable)"
    ],
    common_pitfalls: [
      "Insufficient Comprehensive Ranking System (CRS) score",
      "Not getting Educational Credential Assessment early",
      "Expired language test results (valid 2 years)",
      "Inadequate proof of funds",
      "Missing required work experience documentation",
      "Not researching Provincial Nominee Programs which may have lower thresholds"
    ]
  },
  {
    destination_slug: "united-states",
    overview: "The US immigration system is complex with various visa categories for work, study, investment, and family. Employment-based visas often require employer sponsorship. Consult US Citizenship and Immigration Services (USCIS) and the Department of State for official requirements.",
    common_pathways: [
      "H-1B Visa for specialty occupations",
      "L-1 Visa for intracompany transfers",
      "F-1 Student Visa",
      "EB-5 Immigrant Investor Program",
      "O-1 Visa for extraordinary ability",
      "Family-based immigration"
    ],
    typical_documents: [
      "Valid passport",
      "DS-160 or DS-260 form confirmation",
      "Visa application fee receipt",
      "Passport-sized photographs",
      "Supporting petition (I-129, I-140, I-130, etc.)",
      "Educational certificates and work experience letters",
      "Financial documentation",
      "Medical examination (for immigrant visas)",
      "Police certificates (for immigrant visas)"
    ],
    common_pitfalls: [
      "H-1B visa cap limitations (lottery system)",
      "Long processing and waiting times for many categories",
      "Insufficient documentation of extraordinary ability for O-1",
      "Not maintaining valid status while in the US",
      "Misunderstanding visa vs. immigration (green card) processes",
      "Incomplete financial documentation for investor visas"
    ]
  },
  {
    destination_slug: "japan",
    overview: "Japan's immigration system requires employer sponsorship for most work visas. The Certificate of Eligibility system streamlines the process. Language ability may be beneficial but isn't always required. Consult the Ministry of Foreign Affairs and Immigration Services Agency for current requirements.",
    common_pathways: [
      "Engineer/Specialist in Humanities/International Services visa",
      "Highly Skilled Professional visa",
      "Business Manager visa for entrepreneurs",
      "Student visa (Ryugaku)",
      "Designated Activities visa (including remote work)",
      "Spouse or Child of Japanese National"
    ],
    typical_documents: [
      "Valid passport",
      "Certificate of Eligibility (obtained by sponsor in Japan)",
      "Visa application form",
      "Passport photograph",
      "Educational certificates",
      "Employment contract or admission letter",
      "Curriculum vitae",
      "Company registration documents (for business visas)"
    ],
    common_pitfalls: [
      "Not obtaining Certificate of Eligibility before applying for visa",
      "Insufficient points for Highly Skilled Professional visa",
      "Incomplete business plan for Business Manager visa",
      "Not having guarantor or sponsor in Japan",
      "Misunderstanding that most tourist activities are not allowed on work visas",
      "Not maintaining proper residence status and reporting requirements"
    ]
  },
  {
    destination_slug: "australia",
    overview: "Australia uses a points-based system for skilled migration and offers various temporary and permanent visa options. State sponsorship can provide additional points. The SkillSelect system manages applications. Consult the Department of Home Affairs for official information.",
    common_pathways: [
      "Skilled Independent Visa (Subclass 189)",
      "Skilled Nominated Visa (Subclass 190)",
      "Temporary Skill Shortage Visa (Subclass 482)",
      "Student Visa (Subclass 500)",
      "Business Innovation and Investment Visa",
      "Partner and Family visas"
    ],
    typical_documents: [
      "Valid passport",
      "Skills assessment from relevant assessing authority",
      "English language test results (IELTS, PTE, TOEFL)",
      "Police certificates from all countries lived in 12+ months",
      "Health examinations from panel physicians",
      "Educational qualifications and transcripts",
      "Employment references and payslips",
      "Expression of Interest (EOI) through SkillSelect"
    ],
    common_pitfalls: [
      "Insufficient points for skilled migration",
      "Skills assessment not matching intended occupation",
      "Not meeting English language requirements",
      "Health issues that don't meet health requirement",
      "Inadequate evidence of skilled employment",
      "Not researching state sponsorship opportunities which can add points"
    ]
  },
  {
    destination_slug: "singapore",
    overview: "Singapore offers employment passes for professionals, entrepreneur passes, and various other work permits. Requirements include salary thresholds and educational qualifications. Consult the Ministry of Manpower for current requirements.",
    common_pathways: [
      "Employment Pass for professionals and managers",
      "S Pass for mid-skilled workers",
      "EntrePass for entrepreneurs",
      "Student's Pass for education",
      "Long-Term Visit Pass for family members",
      "Personalised Employment Pass for high earners"
    ],
    typical_documents: [
      "Valid passport",
      "Educational certificates and transcripts",
      "Employment contract and job details",
      "Professional certificates and licenses",
      "Recent passport photograph",
      "Company supporting documents",
      "Business plan (for EntrePass)"
    ],
    common_pitfalls: [
      "Not meeting minimum salary requirements (varies by age and sector)",
      "Insufficient or non-recognized qualifications",
      "Incomplete business plan for entrepreneurs",
      "Not understanding that approval is not guaranteed",
      "Missing renewal dates for passes",
      "Employer not being registered or having insufficient quota"
    ]
  },
  {
    destination_slug: "united-kingdom",
    overview: "The UK points-based immigration system covers work, study, and other categories. Sponsorship by licensed employers or institutions is required for most routes. Consult UK Visas and Immigration for official guidance.",
    common_pathways: [
      "Skilled Worker Visa",
      "Global Talent Visa",
      "Student Visa",
      "Graduate Visa (post-study work)",
      "Innovator Founder Visa",
      "Family visas"
    ],
    typical_documents: [
      "Valid passport",
      "Certificate of Sponsorship (CoS) from licensed sponsor",
      "Proof of English language ability",
      "Proof of maintenance funds",
      "Tuberculosis test results (if applicable)",
      "Academic qualifications",
      "Previous passport or travel history"
    ],
    common_pitfalls: [
      "Not meeting minimum salary threshold for Skilled Worker route",
      "Invalid or insufficient English language test",
      "Sponsor not having valid license",
      "Insufficient maintenance funds in bank account",
      "Not understanding Immigration Health Surcharge requirement",
      "Missing document submission deadline after application"
    ]
  },
  {
    destination_slug: "united-arab-emirates",
    overview: "The UAE offers various visa types including employment visas, investor visas, and the new remote work visa. Most require sponsorship by UAE employer or property ownership. Regulations vary by emirate. Verify with UAE immigration authorities.",
    common_pathways: [
      "Employment Visa (requires employer sponsorship)",
      "Investor Visa (property or business)",
      "Remote Work Visa for digital nomads",
      "Golden Visa for investors and talented individuals",
      "Student Visa",
      "Dependent Visa"
    ],
    typical_documents: [
      "Valid passport with minimum 6 months validity",
      "Passport photographs",
      "Entry permit issued by sponsor",
      "Medical fitness test (within UAE)",
      "Emirates ID application",
      "Employment contract or investment proof",
      "Educational certificates (attested)",
      "No objection certificate (if changing sponsor)"
    ],
    common_pitfalls: [
      "Not completing medical tests within the UAE",
      "Document attestation requirements not understood",
      "Employer not processing visa on time",
      "Not maintaining valid status (fines for overstaying)",
      "Confusion about which emirate's rules apply",
      "Not understanding that visa cancellation requires exit"
    ]
  },
  {
    destination_slug: "new-zealand",
    overview: "New Zealand offers skilled migration through various streams, including accredited employer work visas and residence pathways. The points system and skill shortage lists are important. Consult Immigration New Zealand for official requirements.",
    common_pathways: [
      "Accredited Employer Work Visa",
      "Skilled Migrant Category Residence Visa",
      "Student Visa",
      "Working Holiday Visa",
      "Entrepreneur Work Visa",
      "Partnership-based visas"
    ],
    typical_documents: [
      "Valid passport",
      "Job offer from accredited employer (for work visa)",
      "English language test (IELTS or equivalent)",
      "Police certificates",
      "Medical certificates and chest X-ray",
      "Qualifications assessment",
      "Evidence of funds",
      "Expression of Interest (for residence)"
    ],
    common_pitfalls: [
      "Insufficient points for Skilled Migrant Category",
      "Occupation not on skill shortage lists",
      "Employer not being accredited",
      "Not meeting health or character requirements",
      "Incomplete documentation of work experience",
      "Not researching regional visa options which may have lower barriers"
    ]
  },
  {
    destination_slug: "mexico",
    overview: "Mexico offers temporary and permanent residence visas with various pathways including retirement, work, and family ties. Financial requirements are assessed at Mexican consulates. Verify current requirements with Instituto Nacional de Migración.",
    common_pathways: [
      "Temporary Resident Visa (with or without work permission)",
      "Permanent Resident Visa",
      "Work Visa (with job offer)",
      "Student Visa",
      "Family unity visa",
      "Retirement visa"
    ],
    typical_documents: [
      "Valid passport",
      "Completed visa application",
      "Proof of economic solvency (bank statements, pension, etc.)",
      "Passport photographs",
      "Application fee payment",
      "Supporting documents per visa type",
      "Apostilled documents where required"
    ],
    common_pitfalls: [
      "Not applying at consulate in country of residence",
      "Insufficient proof of financial means",
      "Not understanding you must enter Mexico within 180 days of visa approval",
      "Missing appointment to complete residence card within 30 days of entry",
      "Not apostilling required documents",
      "Assuming tourist visa can be converted to residence (must apply from abroad)"
    ]
  },
  {
    destination_slug: "netherlands",
    overview: "The Netherlands offers various work permits, the highly skilled migrant scheme, and the Dutch American Friendship Treaty for US citizens. The 30% ruling provides tax benefits for some workers. Consult the Immigration and Naturalisation Service (IND).",
    common_pathways: [
      "Highly Skilled Migrant Visa",
      "Orientation Year for graduates",
      "Self-Employment Visa",
      "Dutch American Friendship Treaty Visa (DAFT)",
      "Student Visa",
      "Family reunification"
    ],
    typical_documents: [
      "Valid passport",
      "MVV (provisional residence permit) if required",
      "Employment contract or admission letter",
      "Proof of sufficient means",
      "Tuberculosis test certificate (if applicable)",
      "Antecedents certificate (criminal record)",
      "Diploma or degree certificates",
      "Sponsor documents (employer or institution)"
    ],
    common_pitfalls: [
      "Employer not registered as recognized sponsor",
      "Not meeting salary threshold for highly skilled migrants",
      "Insufficient business plan for self-employment",
      "Missing MVV requirement (depends on nationality)",
      "Not understanding that work permit and residence permit are separate processes",
      "Delay in collecting residence permit after arrival"
    ]
  },
  {
    destination_slug: "italy",
    overview: "Italy offers work visas through annual quota system, student visas, and elective residence visas for those with passive income. Processing can be lengthy. Consult Italian diplomatic missions and the Ministry of Interior for requirements.",
    common_pathways: [
      "Elective Residence Visa for passive income holders",
      "Work Visa (subject to annual quotas)",
      "Student Visa",
      "Self-Employment Visa",
      "Start-up Visa for entrepreneurs",
      "Family reunification"
    ],
    typical_documents: [
      "Valid passport",
      "Visa application form (Nulla Osta)",
      "Proof of accommodation in Italy",
      "Proof of financial means",
      "Health insurance",
      "Criminal record certificate",
      "Supporting documents per visa type",
      "Permesso di Soggiorno application upon arrival"
    ],
    common_pitfalls: [
      "Annual work visa quotas filling quickly",
      "Not applying for Permesso di Soggiorno within 8 days of arrival",
      "Insufficient passive income proof for elective residence",
      "Underestimating processing times at Italian consulates",
      "Not understanding regional variations in requirements",
      "Missing document translations and legalizations"
    ]
  },
  {
    destination_slug: "france",
    overview: "France offers various visa types including the talent passport for skilled workers, student visas, and visitor visas. The French Tech Visa is available for tech workers. Consult the French Ministry of Interior and French consulates.",
    common_pathways: [
      "Talent Passport (various categories)",
      "Long-Stay Visa (Visitor)",
      "Student Visa",
      "Employee Visa",
      "French Tech Visa for startup employees/founders",
      "Family reunification"
    ],
    typical_documents: [
      "Valid passport",
      "Long-stay visa application form",
      "Passport photographs",
      "Proof of accommodation",
      "Proof of financial means",
      "Health insurance",
      "Criminal record",
      "Supporting documents per category",
      "OFII validation upon arrival"
    ],
    common_pitfalls: [
      "Not validating visa with OFII within 3 months of arrival",
      "Insufficient proof of financial means",
      "Incomplete document translations",
      "Not understanding Talent Passport eligibility criteria",
      "Missing visa appointment due to high demand",
      "Not meeting minimum salary requirements for certain categories"
    ]
  },
  {
    destination_slug: "costa-rica",
    overview: "Costa Rica offers retirement programs (pensionado), investor visas, and work permits. The country is popular with retirees due to affordable healthcare. Verify requirements with Dirección General de Migración y Extranjería.",
    common_pathways: [
      "Pensionado (retiree) residency",
      "Rentista (passive income) residency",
      "Investor residency",
      "Work permit with residence",
      "Student visa",
      "Digital nomad visa"
    ],
    typical_documents: [
      "Valid passport",
      "Birth certificate (apostilled)",
      "Marriage certificate if applicable (apostilled)",
      "Criminal record (apostilled)",
      "Proof of income or investment",
      "Health certificate",
      "Passport photographs",
      "Application forms and fees"
    ],
    common_pitfalls: [
      "Not apostilling documents correctly",
      "Insufficient proof of pension or passive income",
      "Documents older than 6 months not accepted",
      "Not using certified translator for non-Spanish documents",
      "Underestimating processing timeline",
      "Not maintaining required presence in Costa Rica for renewals"
    ]
  },
  {
    destination_slug: "malaysia",
    overview: "Malaysia offers the MM2H program for long-term stays, employment passes, and student visas. Requirements vary by nationality. Consult Immigration Department of Malaysia for official requirements.",
    common_pathways: [
      "Malaysia My Second Home (MM2H) program",
      "Employment Pass",
      "Professional Visit Pass",
      "Student Pass",
      "Dependent Pass",
      "Digital Nomad Pass"
    ],
    typical_documents: [
      "Valid passport (minimum 18 months validity)",
      "Passport photographs",
      "Letter of good conduct",
      "Medical report",
      "Financial documents (varies by program)",
      "Educational certificates",
      "Employment contract (for work passes)",
      "Approval letter from relevant authority"
    ],
    common_pitfalls: [
      "MM2H program requirements have become more stringent",
      "Insufficient fixed deposit or income proof",
      "Not meeting age requirements for certain programs",
      "Employer not registered or lacking approval",
      "Incomplete health screening",
      "Not understanding difference between social visit pass and residence"
    ]
  },
  {
    destination_slug: "ireland",
    overview: "Ireland offers various immigration routes including critical skills employment permits, startup visas, and student visas. EU citizens have different rights. Consult Irish Naturalisation and Immigration Service (INIS).",
    common_pathways: [
      "Critical Skills Employment Permit",
      "General Employment Permit",
      "Startup Entrepreneur Programme (STEP)",
      "Student Visa",
      "Stamp 0 for independent means",
      "Family reunification"
    ],
    typical_documents: [
      "Valid passport",
      "Employment permit approval (for work)",
      "Job offer and contract",
      "Educational qualifications",
      "Proof of financial means",
      "Private medical insurance",
      "Irish Residence Permit (IRP) registration upon arrival",
      "Supporting documents per visa type"
    ],
    common_pitfalls: [
      "Not checking if occupation is on ineligible list",
      "Minimum salary requirements not met",
      "Labour Market Needs Test not satisfied",
      "Not registering for IRP within required timeframe after arrival",
      "Insufficient proof of independent means for Stamp 0",
      "Not understanding employment permit must be approved before visa application"
    ]
  },
  {
    destination_slug: "south-korea",
    overview: "South Korea offers various visa types including E-7 for skilled workers, F-series for long-term stays, and D-series for specific purposes. The TOPIK exam may be beneficial. Consult Hi Korea and Korean diplomatic missions.",
    common_pathways: [
      "E-7 Visa (Designated Activities - skilled work)",
      "D-10 Job Seeker Visa",
      "D-2 Student Visa",
      "F-2 Resident Visa (points-based)",
      "F-4 Visa for overseas Koreans",
      "Marriage-based visas"
    ],
    typical_documents: [
      "Valid passport",
      "Visa application form",
      "Passport photograph",
      "Certificate of employment or admission",
      "Educational certificates and transcripts",
      "Health certificate",
      "Criminal record check",
      "Financial proof",
      "Visa issuance number (if applicable)"
    ],
    common_pitfalls: [
      "Not obtaining visa issuance number before applying",
      "Insufficient points for F-2 resident visa",
      "Document apostille and authentication requirements",
      "Not meeting minimum salary for work visas",
      "Korean language requirement for certain visas",
      "Not registering at immigration within 90 days of entry"
    ]
  },
  {
    destination_slug: "greece",
    overview: "Greece offers the Golden Visa program, work permits, student visas, and financial independence visas. Processing can be lengthy. Verify requirements with Greek diplomatic missions and Ministry of Migration.",
    common_pathways: [
      "Golden Visa (investment in real estate or other assets)",
      "Work Permit and Residence",
      "Financially Independent Person Visa",
      "Student Visa",
      "Digital Nomad Visa",
      "Family reunification"
    ],
    typical_documents: [
      "Valid passport",
      "Completed application forms",
      "Passport photographs",
      "Proof of health insurance",
      "Financial documentation",
      "Proof of accommodation",
      "Criminal record certificate",
      "Medical certificate",
      "Category-specific documents"
    ],
    common_pitfalls: [
      "Golden Visa minimum investment increased to EUR 800,000 in some areas",
      "Not understanding that Golden Visa doesn't grant work rights initially",
      "Insufficient proof of financial independence",
      "Document translation and legalization requirements",
      "Lengthy processing times at consulates and in Greece",
      "Not maintaining required time in Greece for permanent residence"
    ]
  },
  {
    destination_slug: "chile",
    overview: "Chile offers various visa types including work visas, the temporary residence for independent means, and startup visas. The new migration law has updated processes. Consult Servicio Nacional de Migraciones.",
    common_pathways: [
      "Temporary Residence Visa for work",
      "Temporary Residence for Independent Means",
      "Startup Chile Visa",
      "Student Visa",
      "Definitive Residence (after temporary)",
      "Family reunification"
    ],
    typical_documents: [
      "Valid passport",
      "Birth certificate (apostilled)",
      "Criminal record (apostilled)",
      "Health certificate",
      "Proof of means of support",
      "Employment contract or business plan",
      "Passport photographs",
      "Application fees"
    ],
    common_pitfalls: [
      "Not apostilling documents before travel",
      "Insufficient proof of financial means",
      "Not understanding temporary vs. definitive residence progression",
      "Missing RUT (tax ID) application",
      "Documents older than 90 days not accepted",
      "Not completing process steps within required timeframes"
    ]
  },
  {
    destination_slug: "colombia",
    overview: "Colombia offers visitor visas that can lead to residence, work visas, and investment visas. The country has various visa types categorized as V (visitor), M (migrant), and R (resident). Consult Ministerio de Relaciones Exteriores.",
    common_pathways: [
      "Migrant Visa (M) - various categories including work, retirement, business owner",
      "Visitor Visa (V) with work authorization",
      "Investment Visa",
      "Digital Nomad Visa",
      "Student Visa",
      "Marriage-based residence"
    ],
    typical_documents: [
      "Valid passport",
      "Visa application",
      "Motivation letter",
      "Financial documentation",
      "Apostilled documents (varies by visa type)",
      "Criminal record if required",
      "Health insurance",
      "Category-specific documents"
    ],
    common_pitfalls: [
      "Not understanding V/M/R visa category system",
      "Insufficient financial documentation",
      "Attempting to convert tourist visa to work visa (may not be possible)",
      "Not apostilling required documents",
      "Missing cédula de extranjería application after visa approval",
      "Not understanding accumulation of time for resident visa"
    ]
  },
  {
    destination_slug: "brazil",
    overview: "Brazil offers various visa types including work visas (VITEM V), investor visas, and retirement visas. The application process involves Brazilian consulates and the Federal Police. Consult the Ministry of Justice and Public Security.",
    common_pathways: [
      "Work Visa (VITEM V)",
      "Investment Visa (VITEM II)",
      "Retirement Visa (VITEM I)",
      "Student Visa (VITEM IV)",
      "Digital Nomad Visa",
      "Family reunification"
    ],
    typical_documents: [
      "Valid passport",
      "Visa application form",
      "Passport photographs",
      "Criminal record (apostilled)",
      "Authorization from Brazilian authorities (varies by type)",
      "Proof of financial means",
      "Health certificate",
      "Yellow fever vaccination",
      "Federal Police registration upon arrival"
    ],
    common_pitfalls: [
      "Not obtaining work authorization before applying for visa",
      "Insufficient investment amount documented",
      "Document apostille requirements not understood",
      "Not registering with Federal Police within 90 days",
      "Missing yellow fever vaccination",
      "Lengthy processing times not anticipated"
    ]
  },
  {
    destination_slug: "argentina",
    overview: "Argentina offers relatively accessible temporary residence that can lead to permanent residence. Various categories exist including rentista, pensioner, and work. Consult Dirección Nacional de Migraciones.",
    common_pathways: [
      "Temporary Residence (Rentista - passive income)",
      "Temporary Residence (Pensioner)",
      "Work Visa",
      "Student Visa",
      "Investment Visa",
      "Family reunification (straightforward for Mercosur citizens)"
    ],
    typical_documents: [
      "Valid passport",
      "Birth certificate (apostilled)",
      "Criminal record (apostilled)",
      "Proof of income or pension",
      "Passport photographs",
      "Application fees",
      "DNI application upon approval"
    ],
    common_pitfalls: [
      "Not apostilling documents before entry",
      "Insufficient proof of passive income or pension",
      "Documents older than 3 months not accepted",
      "Not maintaining required income level for renewals",
      "Missing DNI appointment timing",
      "Not understanding that temporary residence must be maintained for permanent residence path"
    ]
  },
  {
    destination_slug: "south-africa",
    overview: "South Africa offers various visa types including critical skills work visas, business visas, and retirement visas. The system can be bureaucratic. Consult the Department of Home Affairs for requirements.",
    common_pathways: [
      "Critical Skills Work Visa",
      "General Work Visa",
      "Business Visa",
      "Retired Person's Visa",
      "Study Visa",
      "Relative's Visa"
    ],
    typical_documents: [
      "Valid passport",
      "Completed visa application (BI-1738)",
      "Police clearance certificates",
      "Medical certificate and radiological report",
      "Proof of medical coverage",
      "Qualification certificates (verified)",
      "Financial documents",
      "Yellow fever certificate if applicable"
    ],
    common_pitfalls: [
      "Critical Skills List frequently updated",
      "SAQA verification of qualifications required and time-consuming",
      "Inadequate proof of financial means",
      "Missing medical and radiological reports from approved providers",
      "Not applying for correct visa category",
      "Lengthy processing times and administrative delays"
    ]
  },
  {
    destination_slug: "mauritius",
    overview: "Mauritius offers occupation permits for investors, professionals, and self-employed, as well as a premium visa for remote workers. The process is relatively streamlined. Consult the Economic Development Board.",
    common_pathways: [
      "Occupation Permit (Professional)",
      "Occupation Permit (Investor)",
      "Occupation Permit (Self-Employed)",
      "Premium Travel Visa (for remote workers)",
      "Retired Non-Citizen Permit",
      "Residence Permit through property purchase"
    ],
    typical_documents: [
      "Valid passport",
      "Application form",
      "Passport photographs",
      "Police clearance certificate",
      "Proof of qualifications or business plan",
      "Financial statements",
      "Health insurance",
      "Proof of accommodation"
    ],
    common_pitfalls: [
      "Minimum investment or salary thresholds not met",
      "Insufficient business plan for self-employed category",
      "Not understanding that occupation permit doesn't automatically grant permanent residence",
      "Health insurance requirements vary by permit type",
      "Missing annual report requirements for permit renewal",
      "Not registering with local authorities within required timeframe"
    ]
  },
  {
    destination_slug: "seychelles",
    overview: "Seychelles offers the Seychelles Permanent Residence Certificate and various other permits for work and business. Tourism is the main industry. Consult the Department of Immigration.",
    common_pathways: [
      "Gainful Occupation Permit (GOP) for employment",
      "Self-Employment Permit",
      "Permanent Residence Certificate",
      "Cable and Wireless Work Permit",
      "Investor permit"
    ],
    typical_documents: [
      "Valid passport",
      "Completed application forms",
      "Passport photographs",
      "Police clearance",
      "Medical certificate",
      "Proof of qualifications or business",
      "Financial documentation",
      "Employment contract or business plan"
    ],
    common_pitfalls: [
      "Limited employment opportunities outside tourism/hospitality",
      "High cost of living not anticipated",
      "GOP requires employer to demonstrate no local candidate available",
      "Limited public information compared to other destinations",
      "Small market for business ventures",
      "Property purchase requirements for residence certificate are substantial"
    ]
  },
  {
    destination_slug: "egypt",
    overview: "Egypt offers work permits, student visas, and residence visas. The process often requires local sponsorship. Tourist visas are easy but not suitable for long-term stays. Consult Egyptian diplomatic missions.",
    common_pathways: [
      "Work Visa and Residence",
      "Student Visa",
      "Investor Residence",
      "Family Residence",
      "Long-term tourist visa (limited)"
    ],
    typical_documents: [
      "Valid passport (6+ months validity)",
      "Visa application forms",
      "Passport photographs",
      "Work permit from Ministry of Manpower (for work)",
      "Security clearance",
      "Health certificate",
      "Residence visa application",
      "Registration with local police"
    ],
    common_pitfalls: [
      "Work permits require Ministry of Manpower approval before visa",
      "Complex bureaucratic processes",
      "Local sponsor often required",
      "Not registering with local police within timeframe",
      "Tourist visa cannot be converted to residence visa easily",
      "Processing times can be lengthy and unpredictable"
    ]
  },
  {
    destination_slug: "morocco",
    overview: "Morocco offers work permits, student visas, and residence cards. French or Arabic language skills are beneficial. The process can involve multiple government offices. Consult Moroccan diplomatic missions.",
    common_pathways: [
      "Work permit and residence card",
      "Student visa",
      "Residence card for retirees",
      "Business visa",
      "Family reunification"
    ],
    typical_documents: [
      "Valid passport",
      "Visa application",
      "Passport photographs",
      "Employment contract (for work)",
      "Criminal record",
      "Medical certificate",
      "Proof of accommodation",
      "Residence card application in Morocco"
    ],
    common_pitfalls: [
      "Visa application must often be in country of residence",
      "Work permits require employer to prove no Moroccan available",
      "Residence card process separate from visa and requires in-country application",
      "Limited information in English",
      "Multiple government offices involved",
      "Not understanding difference between residence visa and residence card"
    ]
  },
];
