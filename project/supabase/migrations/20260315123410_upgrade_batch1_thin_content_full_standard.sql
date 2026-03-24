/*
  # Upgrade Batch 1 Thin Content to Full Standard

  Countries upgraded from 5 FAQs + short intro to 7 FAQs + full intro + warning + next steps:
  - United States
  - United Kingdom
  - Australia
  - Germany
  - Portugal

  All content replaced with comprehensive, consistent quality matching batch 2 standard.
*/

DO $$
DECLARE
  v_id uuid;
BEGIN

  -- ============================================================
  -- UNITED STATES
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'united-states';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'The United States has one of the world''s most complex immigration systems, managed by USCIS (US Citizenship and Immigration Services). Employment-based immigration (EB-1 through EB-5) can involve multi-year waits due to per-country backlogs. The H-1B specialty worker visa is the most common non-immigrant work visa but is subject to an annual lottery. Government filing fees are substantial, and attorney costs can be significant. However, US permanent residence (Green Card) and eventual citizenship are among the most valued globally.',
      '[
        {"question": "How does the H-1B visa lottery work?", "answer": "The H-1B is a specialty occupation visa for workers in fields requiring at least a bachelor''s degree. Each year USCIS receives far more applications than the 85,000 cap (65,000 regular + 20,000 US master''s exemption), so a random lottery is held each April. Lottery registration costs USD 215. If selected, the employer files a full petition (USD 730 base fee + up to USD 2,805 in additional fees). Not being selected means waiting until the next lottery cycle."},
        {"question": "What are the Green Card (permanent residence) options?", "answer": "Green Cards can be obtained through employment (EB-1 through EB-5), family sponsorship, diversity visa lottery, asylum, or investment (EB-5: USD 800,000-1,050,000 investment). Employment-based I-485 adjustment of status costs USD 1,440 (principal applicant). Nationals of India and China face multi-decade backlogs in EB-2 and EB-3 categories due to per-country limits."},
        {"question": "What is the O-1 visa and who qualifies?", "answer": "The O-1 is for individuals with extraordinary ability in sciences, arts, education, business, athletics, or extraordinary achievement in film/TV. No lottery required. Requires documented evidence of sustained national or international acclaim. USCIS filing fee USD 730. Often faster and more reliable than H-1B for qualifying applicants. Attorney fees for O-1 preparation: USD 3,000-8,000."},
        {"question": "How much does US immigration cost overall?", "answer": "H-1B initial filing: USD 3,000-6,000 total (government fees + legal). Green Card adjustment of status: USD 4,000-12,000+ total. EB-5 investor visa: USD 800,000-1,050,000 investment plus USD 11,160 in filing fees plus legal costs. Naturalization (citizenship): USD 760 filing fee. Legal fees vary enormously by attorney and complexity."},
        {"question": "What is the National Interest Waiver (NIW) for EB-2?", "answer": "The EB-2 NIW allows professionals with advanced degrees or exceptional ability to self-petition for a Green Card without an employer sponsor if their work benefits the US national interest. Popular with STEM researchers, medical professionals, and entrepreneurs. Filing fee USD 700 for I-140. Can be combined with priority date portability to speed up the overall process."},
        {"question": "How long does US naturalization take?", "answer": "US citizenship (naturalization) requires 5 years of lawful permanent residence (3 years if married to a US citizen), 30 months physically present in the US during that period, and passing civics and English tests. Application (N-400) fee is USD 760. USCIS processing takes 8-24 months depending on field office. Dual citizenship is not officially recognized but not prohibited for most nationalities."},
        {"question": "Can I work in the US while my Green Card application is pending?", "answer": "Yes. Once an I-485 adjustment of status is filed, you can apply for an Employment Authorization Document (EAD) and Advance Parole (travel document) concurrently. The combo card (Form I-131A/I-765) costs USD 0 when filed concurrently with I-485. EAD processing takes 3-6 months. This allows you to work for any employer while waiting for Green Card approval."}
      ]'::jsonb,
      'USCIS fees increased significantly in 2024; always verify current fees on the USCIS website before budgeting. The H-1B lottery is unpredictable — have backup plans (O-1, L-1, TN for Canadians/Mexicans). Per-country backlogs for India and China nationals in EB-2/EB-3 categories can be extremely long. Immigration status gaps can have serious consequences; maintain continuous valid status.',
      'Identify your best visa pathway (H-1B lottery, O-1, L-1, EB-1, NIW) based on qualifications and timeline, engage a qualified US immigration attorney before any filing, verify all current USCIS fee schedules at uscis.gov, keep copies of all filed documents and receipt notices, track your priority date monthly using the USCIS Visa Bulletin if employment-based, and plan for the naturalization 5-year clock from your Green Card date.'
    );
  END IF;

  -- ============================================================
  -- UNITED KINGDOM
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'united-kingdom';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'The United Kingdom operates a points-based immigration system since Brexit, managed by UK Visas and Immigration (UKVI). The Skilled Worker visa is the primary route for professionals, requiring employer sponsorship from a licensed UK sponsor. The Immigration Health Surcharge (IHS) is a significant cost — currently GBP 1,035 per year of the visa. The UK Global Talent visa offers a sponsor-free route for exceptional talent. Despite high fees, the UK remains a top destination for tech, finance, healthcare, and creative professionals.',
      '[
        {"question": "What is the UK Skilled Worker visa and what does it cost?", "answer": "The Skilled Worker visa requires a job offer from a UK licensed sponsor, paying at least GBP 38,700/year (or the going rate for the occupation, whichever is higher). Visa fee: GBP 719 for up to 3 years, GBP 1,420 for over 3 years. Plus Immigration Health Surcharge (IHS): GBP 1,035/year per person. A 3-year visa for a single applicant costs approximately GBP 3,820 in government fees alone."},
        {"question": "What is the Immigration Health Surcharge (IHS)?", "answer": "The IHS gives visa holders access to NHS healthcare. Current rate: GBP 1,035 per year per person (GBP 776 for students and children under 18). Paid upfront with the visa application. For a family of 4 on a 5-year visa, the IHS alone can cost over GBP 20,000. This is one of the most significant and often-overlooked costs of UK immigration."},
        {"question": "What is the UK Global Talent visa?", "answer": "The Global Talent visa is for leaders and potential leaders in academia/research, arts/culture, or digital technology. No job offer required. Must be endorsed by a designated body (Tech Nation for digital tech, British Academy for academia, etc.). Visa fee GBP 716. Holders can work for any employer, be self-employed, or start a business. Fast-track to Indefinite Leave to Remain (ILR) after 3 years."},
        {"question": "How do I get UK Indefinite Leave to Remain (ILR)?", "answer": "ILR (permanent residence) requires 5 years of continuous lawful residence on eligible visas. Application fee: GBP 2,885. Requirements include passing the Life in the UK test (GBP 50 + study materials), meeting the English language requirement (B1), and meeting salary/continuous employment requirements. Global Talent visa holders can apply after just 3 years."},
        {"question": "Can I get British citizenship after ILR?", "answer": "British citizenship (naturalisation) can be applied for 12 months after receiving ILR. Fee: GBP 1,630 per adult. Requirements: 5 years total residence (ILR + 1 year), good character check, English language, Life in the UK test. British citizenship grants one of the world''s strongest passports with access to 190+ countries. The UK allows dual citizenship for most nationalities."},
        {"question": "What salary threshold applies for UK Skilled Worker visas in 2024?", "answer": "From April 2024, the general salary threshold increased to GBP 38,700/year (up from GBP 26,200). Shortage occupations and health/care sector roles have different thresholds. New entrants (under 26, recent graduates, switching from student visa) have a lower threshold of GBP 30,960. Salary increases were one of the most significant changes to UK immigration in recent years."},
        {"question": "What is the UK Innovator Founder visa?", "answer": "The Innovator Founder visa is for entrepreneurs with an innovative, viable, and scalable business idea endorsed by an approved UK endorsing body. No minimum investment required but must have sufficient personal funds. Visa fee GBP 1,191. Endorsing bodies include Tech Nation, Innovate UK, and others. After 3 years with business endorsement, can apply for ILR."}
      ]'::jsonb,
      'UK visa fees and IHS rates increase regularly; always check UKVI''s official fee schedule before budgeting. The salary threshold increased significantly in April 2024 — confirm current thresholds with your employer or attorney. Employer sponsorship license must be in place before you apply; verify your employer is a licensed sponsor on the UKVI register. The IHS must be paid upfront in full for the entire visa duration.',
      'Confirm your employer holds a valid UK Sponsor Licence on the UKVI register, calculate total IHS cost for your full visa duration and all family members before applying, gather English language evidence (IELTS 4-skill test or UK degree), submit your visa application well in advance of your intended start date, register with a GP upon arrival for NHS access, and begin tracking your 5-year ILR clock from your first valid entry.'
    );
  END IF;

  -- ============================================================
  -- AUSTRALIA
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'australia';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Australia operates a points-tested skilled migration system managed by the Department of Home Affairs. The Skilled Independent visa (subclass 189) and Employer Sponsored visa (subclass 482 and 186) are the most common pathways. Australia uses an Expression of Interest (EOI) system through SkillSelect where candidates are ranked and invited to apply based on points scores. Healthcare workers, engineers, and IT professionals are in high demand. Sydney, Melbourne, Brisbane, and Perth are the main destinations.',
      '[
        {"question": "How does the Australian points system work?", "answer": "The Skilled Independent visa (subclass 189) uses a points test. Points are awarded for age (maximum at 25-32), English proficiency (up to 20 points for superior), skilled employment (up to 20 points for 8+ years), education (15 points for PhD), Australian study (5 points), partner skills, and state nomination (5 points). Minimum 65 points required to submit an EOI, but invitations typically require 80-90+ in competitive occupations."},
        {"question": "What is the Australian Employer Nomination Scheme (ENS) subclass 186?", "answer": "The ENS 186 grants permanent residence directly via employer nomination. Employer pays the nomination fee AUD 330; employee pays visa application fee AUD 4,640. The Temporary Residence Transition stream requires 3 years on a TSS 482 visa with the same employer first. The Direct Entry stream requires an approved skills assessment and 3 years relevant experience. Processing takes 6-24 months."},
        {"question": "What is the TSS 482 visa and how much does it cost?", "answer": "The Temporary Skills Shortage (TSS) visa subclass 482 allows employer-sponsored workers for 2-4 years. Employer pays AUD 330 nomination fee + training levy (AUD 1,200/year for businesses under AUD 10M). Employee pays visa fee AUD 3,115 (up to 4 years). Skills assessment required for some occupations. Salaries must meet the Temporary Skilled Migration Income Threshold (TSMIT) of AUD 73,150/year (2024)."},
        {"question": "How much does Australian permanent residence cost in government fees?", "answer": "Skilled Independent 189: AUD 4,640 principal + AUD 2,325 each additional adult. Skilled Nominated 190: same fees. ENS 186: AUD 4,640 + AUD 2,325 per additional adult. Partner visa (subclass 820/801): AUD 8,085. These are government fees only; registered migration agent fees typically add AUD 3,000-8,000. Health examinations add AUD 300-600 per person."},
        {"question": "What English language level is required for Australian migration?", "answer": "Most skilled visa categories require Competent English (IELTS 6 in all bands, or equivalent). Proficient English (IELTS 7) earns extra points in the points test. Superior English (IELTS 8) earns maximum points. Australian citizens and nationals of UK, USA, Canada, NZ, and Ireland are exempt from formal English testing. English proficiency is tested within 3 years before the application."},
        {"question": "What is a Skills Assessment for Australian migration?", "answer": "Most skilled visa applicants must have their qualifications and experience assessed by a relevant Australian assessing authority (e.g., Engineers Australia, VETASSESS, ACS for IT). Assessment costs vary: AUD 500-1,000 depending on authority. Processing takes 4-16 weeks. The assessment confirms your overseas qualifications are comparable to Australian standards. Without a positive assessment, EOI submission is not possible."},
        {"question": "Can I work in Australia on a tourist visa while job hunting?", "answer": "Working on a tourist visa (subclass 600) is illegal. However, the Working Holiday visa (subclass 417 or 462) allows those aged 18-30 (or 35 for some nationalities) to work for any employer for up to 6 months and travel for 12 months. Fee AUD 635. Many skilled immigrants use a Working Holiday visa to get Australian work experience before transitioning to employer-sponsored pathways."}
      ]'::jsonb,
      'Australian immigration fees are non-refundable once lodged. Points score requirements fluctuate each invitation round; check the latest round results on the Home Affairs website. The TSMIT salary threshold increases periodically. Health examinations must be completed through BUPA Medical Visa Services or approved panel physicians. Ensure your occupation is on the relevant skilled occupation list before beginning the process.',
      'Check whether your occupation is on the MLTSSL or STSOL using the Home Affairs occupation list tool, obtain a positive skills assessment from the relevant assessing authority, take an IELTS or equivalent English test to maximize points, submit your EOI through SkillSelect, monitor your points ranking against recent invitation rounds, and engage a registered migration agent (MARA registered) for residence applications given the complexity and non-refundable fees.'
    );
  END IF;

  -- ============================================================
  -- GERMANY
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'germany';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Germany introduced the Skilled Immigration Act (Fachkräfteeinwanderungsgesetz) in 2020 and expanded it in 2023, making it significantly easier for qualified non-EU professionals to immigrate. The EU Blue Card, Job Seeker Visa, and Opportunity Card (Chancenkarte) are key pathways. Government fees are modest compared to the UK, Australia, or USA. Germany has strong demand for engineers, IT professionals, healthcare workers, and skilled tradespeople. Berlin, Munich, Hamburg, and Frankfurt are major destinations.',
      '[
        {"question": "What is the German EU Blue Card and who qualifies?", "answer": "The EU Blue Card is for non-EU nationals with a recognized university degree (or comparable qualification) and a German job offer paying at least EUR 45,300/year (2024), or EUR 41,041 for shortage occupations (IT, engineering, medicine, STEM). Application at the German embassy: approximately EUR 100 fee. Processing takes 4-12 weeks. After 21-33 months, can apply for permanent residence (Niederlassungserlaubnis)."},
        {"question": "What is the German Opportunity Card (Chancenkarte)?", "answer": "The Chancenkarte (introduced 2024) is a 1-year job search visa requiring 6 points from: recognized qualification (4 points), German language B2 (3 points), prior German work/study experience, age under 35, or work experience from a shortage occupation. Allows you to work up to 20 hours/week while job searching. Fee approximately EUR 75. A significant new pathway for qualified workers without a job offer."},
        {"question": "What is the German Job Seeker Visa?", "answer": "The Job Seeker Visa allows qualified professionals with a German-recognized degree and 5 years experience to enter Germany for 6 months to search for employment. Fee EUR 75. Can work limited hours (up to 10 hours/week in trial positions). Once a job offer is secured meeting Blue Card or skilled worker requirements, you convert the visa to a residence permit without leaving Germany."},
        {"question": "Is German language required for work visas?", "answer": "German language is NOT required for the EU Blue Card or Job Seeker Visa if the role is conducted in English. However, German B2 is required for certain healthcare and regulated professions. For the Opportunity Card, German B2 earns 3 points. For permanent residence after 5 years on a standard permit, B1 German is required (A2 for Blue Card permanent residence at 21-33 months)."},
        {"question": "How does credential recognition work in Germany?", "answer": "Degree recognition is managed by anabin (database) and NARIC. For regulated professions (medicine, law, engineering in some states), formal recognition is required before working. For unregulated professions, the Blue Card does not require formal recognition — just proof of degree. The Recognition Information Centre (BQ Portal) provides guidance. The recognition process can take 2-6 months and cost EUR 100-600."},
        {"question": "What are German tax and social contribution rates for immigrants?", "answer": "German income tax is progressive: 0% up to EUR 11,604, then 14-42% (45% above EUR 277,826). Solidarity surcharge applies in limited cases. Social contributions (health, pension, unemployment, care): approximately 20-22% of gross salary, split equally between employer and employee. Total tax burden for a EUR 60,000 salary: approximately 35-38% effective rate. However, social contributions fund comprehensive healthcare and pensions."},
        {"question": "Can I bring my family to Germany?", "answer": "Yes. Spouses of EU Blue Card and Skilled Worker visa holders can join and receive a work permit with no restrictions. Children under 16 can join without language requirements. Spouses of Blue Card holders with A1 German or above do not need language proof to receive the permit. Family reunification fee: EUR 100 per person. Germany also has an excellent public education system including free university tuition."}
      ]'::jsonb,
      'Degree recognition for regulated professions (doctors, nurses, pharmacists, lawyers) requires formal recognition by German authorities before you can practice; start this process well before applying for a visa. Processing times at German embassies vary significantly by country of application. Health insurance is mandatory from day 1; public statutory insurance (GKV) or private insurance must be secured. German bureaucracy requires in-person registration at the Einwohnermeldeamt within 2 weeks of moving.',
      'Check your degree on the anabin database or apply for formal recognition if required for your profession, get a job offer meeting Blue Card salary thresholds or apply for the Opportunity Card/Job Seeker Visa if still searching, register at the Einwohnermeldeamt within 2 weeks of arrival, enroll in statutory health insurance immediately, apply for your German residence permit at the local Auslanderbehorde within 90 days, and begin A1-B1 German language courses to build toward permanent residence requirements.'
    );
  END IF;

  -- ============================================================
  -- PORTUGAL
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'portugal';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Portugal has become one of Europe''s most popular destinations for digital nomads, remote workers, retirees, and investors. The D7 Passive Income Visa, Digital Nomad Visa (D8), and the EU citizenship pathway via the Portuguese NHR tax regime make it compelling for long-term relocation. AIMA (formerly SEF) manages immigration. Lisbon, Porto, and the Algarve are major expat hubs. Portugal offers EU residency rights and a path to citizenship after 5 years, while the NHR tax regime offers a 20% flat tax on Portuguese-source income for 10 years.',
      '[
        {"question": "What is the Portugal D7 Passive Income Visa?", "answer": "The D7 Visa is for those with regular passive income (pension, rental income, investments, or remote work income from foreign sources). Minimum income requirement: EUR 820/month (main applicant) + 50% for each additional adult + 30% per child. Visa fee EUR 90 for the long-stay visa. After approval you must visit AIMA in Portugal to get the 2-year residence permit (EUR 320). Popular with retirees and those with investment income."},
        {"question": "What is the Portugal Digital Nomad Visa (D8)?", "answer": "The D8 Visa (launched 2022) is for remote workers employed by or providing services to non-Portuguese clients/employers. Income requirement: 4x Portuguese minimum wage = approximately EUR 3,280/month (2024). Application at Portuguese consulate: EUR 90. After arrival, apply at AIMA for residence permit: EUR 320. Allows working in Portugal legally as a remote worker."},
        {"question": "Is Portugal''s Golden Visa still available?", "answer": "Portugal significantly reformed its Golden Visa in 2023. Real estate investment no longer qualifies (except in interior regions and Azores/Madeira). Remaining options: EUR 500,000 in investment funds, EUR 500,000 in Portuguese companies creating 5+ jobs, EUR 250,000 in cultural/artistic projects. Application fee EUR 533 + EUR 2,700 for residence card. Despite changes, it remains a path to Portuguese citizenship."},
        {"question": "What is the NHR (Non-Habitual Resident) tax regime?", "answer": "The NHR regime (now IFICI - Incentivo Fiscal a Captacao de Investimento) provides tax benefits for new residents: 20% flat tax on qualifying Portuguese-source income for 10 years, and foreign-source income may be exempt from Portuguese tax (varies by income type and tax treaty). Requires registering with Portuguese tax authority (Autoridade Tributaria) within 31 March of the year following residency establishment. Tax advice is essential."},
        {"question": "How long does it take to get Portuguese citizenship?", "answer": "Portuguese citizenship can be applied for after 5 years of legal residence. Requirements include A2 Portuguese language, no criminal record, and demonstration of connection to Portuguese community. Application fee EUR 250. Portugal allows dual citizenship. Being an EU citizen gives you the right to live, work, and vote in any EU member state — a major attraction for non-EU nationals."},
        {"question": "How much does AIMA appointment processing cost and how long does it take?", "answer": "After entering Portugal on a long-stay visa (D7, D8, etc.), you must apply at AIMA for your residence permit within 4 months. Residence permit fee: EUR 320 (initial, 2 years). Renewal fees: EUR 80. AIMA appointments can take months to schedule. Many applicants use a lawyer (EUR 1,500-3,500) to navigate the process and secure appointments through priority services."},
        {"question": "What is the NIF number and why is it essential in Portugal?", "answer": "The NIF (Numero de Identificacao Fiscal) is Portugal''s tax identification number, required for opening a bank account, signing a lease, buying property, utilities, and most administrative tasks. EU citizens can get a NIF at any tax office. Non-EU citizens need a fiscal representative (EUR 100-200/year from a Portuguese resident) to obtain a NIF before arriving in Portugal. Get your NIF before attempting any financial or administrative setup."}
      ]'::jsonb,
      'AIMA (formerly SEF) appointment backlogs can be severe; apply for your residence permit appointment as soon as possible after arrival. Portugal''s Golden Visa real estate route ended in 2023 — beware of outdated information online. The NHR/IFICI tax regime has specific qualification rules that change; consult a Portuguese tax accountant before assuming eligibility. All documents must be apostilled and may require certified Portuguese translation.',
      'Apply for your NIF with a fiscal representative if non-EU before travelling to Portugal, open a Portuguese bank account (required for AIMA applications), book your AIMA appointment as early as possible after arrival, register with the local junta de freguesia (civil registry) for proof of address, apply for NHR/IFICI status at the tax authority by 31 March of the following year, and consult a Portuguese immigration lawyer for residence permit applications given current AIMA delays.'
    );
  END IF;

END $$;
