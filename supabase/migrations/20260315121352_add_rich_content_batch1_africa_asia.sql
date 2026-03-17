/*
  # Add Full Rich Content - Batch 1 (Africa + Southeast/East Asia)

  Countries covered:
  - Africa: Egypt, Morocco, Nigeria, South Africa
  - Asia: Japan, Singapore, South Korea, Thailand, Malaysia, Indonesia

  Each country gets:
  - Country-level intro_md, faq_json (5-10 questions), warning_md, next_steps_md
  - Inserted into immigration_cost_content (country_id, pathway_id = NULL)
  - Upsert pattern: delete existing then insert fresh
*/

DO $$
DECLARE
  v_id uuid;
BEGIN

  -- ============================================================
  -- EGYPT
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'egypt';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Egypt is an emerging destination for investors and retirees seeking affordable Mediterranean and Red Sea living. The government has introduced investment-based residency programs to attract foreign capital. Costs are low in Egyptian pounds, though dollar and euro equivalents fluctuate significantly due to currency devaluation. Most immigration processes require engagement with local legal representatives.',
      '[
        {"question": "How can I get residency in Egypt?", "answer": "The most common routes are the investor residency visa (requiring EGP 500,000+ in investment or property purchase) and the renewable tourist visa. Egypt also grants temporary residency for property owners. Most applicants use local attorneys to navigate the process."},
        {"question": "How much does the Egypt investor residency visa cost?", "answer": "Government fees are modest (EGP 2,000-5,000), but the underlying investment requirement of EGP 500,000 in property or business is the main cost. Attorney fees range from EGP 5,000-20,000 depending on complexity."},
        {"question": "Do I need a lawyer to immigrate to Egypt?", "answer": "For investor residency and property-based permits, a local Egyptian attorney is strongly recommended. Legal fees range from EGP 5,000 to EGP 20,000 for standard cases."},
        {"question": "What is the currency situation in Egypt?", "answer": "Egypt has experienced significant currency devaluation. Always verify current EGP/USD and EGP/EUR exchange rates before budgeting. Costs quoted in EGP can appear low but may change substantially in hard currency terms."},
        {"question": "Can I work in Egypt on a residency visa?", "answer": "A work permit (separate from a residency permit) is required to work legally in Egypt. Employers typically sponsor work permits. Freelancers and remote workers operating for foreign clients should consult an attorney regarding the legal framework."},
        {"question": "What documents are required for Egypt residency?", "answer": "Typically required: valid passport, birth certificate, police clearance certificate, proof of investment or property ownership, health insurance, and recent photographs. All foreign documents must be notarized and apostilled."}
      ]'::jsonb,
      'Egyptian immigration rules and fee structures change frequently. Currency devaluation can significantly impact costs in hard currency terms. Always verify current fees and investment thresholds with the Egyptian Immigration Authority or a licensed local attorney before committing funds.',
      'Consult a licensed Egyptian immigration attorney, verify current exchange rates, confirm investment thresholds with the Immigration Authority, prepare apostilled documents from your home country, and budget for legal fees and translation costs.'
    );
  END IF;

  -- ============================================================
  -- MOROCCO
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'morocco';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Morocco is a popular destination for retirees and remote workers seeking affordable Mediterranean living with rich culture. The country offers renewable residency cards (Carte de Sejour) for those who can demonstrate sufficient income. Government fees are modest but legal support is commonly used for navigation of bureaucratic processes. Morocco is an associate partner of the EU and has strong ties with France, making it attractive for French speakers.',
      '[
        {"question": "How do I get a residency permit in Morocco?", "answer": "The Carte de Sejour (residency card) is available for foreigners who can prove regular income or investments. You must apply at the local police prefecture. Initial stay on a tourist visa (90 days) then transition to residency is common. Applications require proof of income, accommodation, and clean criminal record."},
        {"question": "How much income is required for Morocco residency?", "answer": "Morocco does not publish a fixed minimum but generally requires you to show stable income sufficient to live without working locally. Many expats report showing MAD 5,000-10,000 per month (approximately USD 480-960) to be sufficient, though this varies by prefecture."},
        {"question": "How much does Morocco residency cost?", "answer": "The Carte de Sejour application fee is very modest (MAD 200-500). Total costs including legal fees (MAD 3,000-8,000), document preparation, translations, and apostilles typically range from MAD 4,000-15,000 (USD 380-1,440)."},
        {"question": "Do I need a lawyer for Morocco residency?", "answer": "Not strictly required, but a local attorney or immigration consultant is helpful for navigating the prefecture process, especially if you do not speak French or Arabic. Legal fees range from MAD 3,000-8,000 for standard cases."},
        {"question": "Can I work remotely from Morocco?", "answer": "Morocco does not yet have a formal digital nomad visa, but many remote workers live in Morocco on tourist visas or residency cards without issues provided they are employed by foreign companies. Tax implications should be discussed with a local accountant."},
        {"question": "What cities are popular for expats in Morocco?", "answer": "Marrakech, Casablanca, Rabat, and Tangier are the most popular. Each has different cost of living and expat community sizes. Casablanca and Rabat have better infrastructure for professionals; Marrakech is popular for lifestyle-focused retirees."}
      ]'::jsonb,
      'Morocco residency rules are applied inconsistently across different prefectures. Income thresholds are not officially published and vary by location. All foreign documents must be apostilled and translated into French or Arabic by a certified translator. Processing times at prefectures can vary from weeks to months.',
      'Obtain your MAD bank account and local address first, gather apostilled and translated documents, visit your local prefecture for initial consultation, and consider engaging a local immigration attorney or consultant who specializes in expat residency.'
    );
  END IF;

  -- ============================================================
  -- NIGERIA
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'nigeria';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Nigeria is the immigration destination for professionals working in its large oil, finance, and technology sectors. The Nigeria Immigration Service (NIS) manages all visa and work permit applications. Employers must obtain a Quota Approval from the Ministry of Interior before sponsoring foreign workers. Costs are denominated in Nigerian Naira but the currency experiences significant volatility.',
      '[
        {"question": "How do foreign workers get a work permit in Nigeria?", "answer": "Foreign workers need a Combined Expatriate Residence Permit and Aliens Card (CERPAC). The employer must first obtain Expatriate Quota approval from the Ministry of Interior. This involves CERPAC fees of NGN 1,000,000 per year for most expatriates, plus employer processing costs."},
        {"question": "What is the CERPAC and how much does it cost?", "answer": "CERPAC (Combined Expatriate Residence Permit and Aliens Card) is the main work and residence permit for expatriates. Annual cost is NGN 1,000,000 (approximately USD 650-900 depending on exchange rate) for most categories. Renewable annually."},
        {"question": "Does the employer pay for the Nigerian work permit?", "answer": "Yes, in Nigeria the employer is responsible for obtaining Expatriate Quota approval and sponsoring CERPAC. Most employers cover CERPAC fees as part of the employment package for foreign hires. Confirm this during contract negotiations."},
        {"question": "How long does Nigerian work permit processing take?", "answer": "Expatriate Quota approval typically takes 4-8 weeks. CERPAC issuance takes an additional 4-6 weeks. Total processing from start to having your permit can take 2-4 months. Premium/expedited processing options exist but add to costs."},
        {"question": "What is the Business visa (STR) for Nigeria?", "answer": "The Subject to Regularization (STR) visa allows entry while work permit processing is underway. It costs USD 100-200 and must be converted to CERPAC within 90 days of arrival. Many expatriates enter on STR visas while their employers process the full permit."},
        {"question": "What documents are required for Nigeria CERPAC?", "answer": "Required documents include: valid passport, STR visa, two passport photographs, employer letter confirming employment, educational certificates, work experience letters, police clearance certificate, and company Expatriate Quota approval letter from the Ministry of Interior."}
      ]'::jsonb,
      'Nigerian Naira has experienced significant devaluation. Fees quoted in NGN may have substantially different values in USD or EUR over time. CERPAC fees have increased multiple times in recent years. Always verify current fees directly with the Nigeria Immigration Service. Processing timelines are estimates; actual processing can be longer.',
      'Confirm your employer has Expatriate Quota approval or is willing to obtain it, agree on who pays CERPAC fees in your employment contract, apply for STR visa before travel, gather all required documents with apostilles, and work closely with your employer HR or a local immigration attorney throughout the process.'
    );
  END IF;

  -- ============================================================
  -- SOUTH AFRICA
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'south-africa';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'South Africa attracts skilled workers, retirees, and investors with its natural beauty, relatively low cost of living, and English-speaking environment. The Department of Home Affairs manages visas and permits. South Africa offers a critical skills visa for high-demand occupations and a retirement visa for those with sufficient pension or investment income. Bureaucratic delays are common and legal support is widely recommended.',
      '[
        {"question": "What is the South Africa Critical Skills Visa?", "answer": "The Critical Skills Work Visa is for professionals in occupations on the Critical Skills List (IT, engineering, healthcare, finance, etc.). It does not require a job offer and allows you to enter South Africa to look for work. Application fee is ZAR 1,520 and requires proof of your qualifications and that your occupation is on the critical skills list."},
        {"question": "How much does a South Africa work permit cost?", "answer": "Work visa government fees range from ZAR 1,520 to ZAR 4,100 depending on visa type. Including legal fees (ZAR 10,000-25,000 for attorney assistance), police clearances, medical reports, and document translations, total costs typically range from ZAR 15,000-35,000 (USD 800-1,900)."},
        {"question": "What is the Retired Person Visa?", "answer": "The Retired Person Visa requires proof of a net monthly income of ZAR 37,000 (approximately USD 2,000) from pension, annuity, or investment. Application fee is ZAR 1,520. Legal fees add ZAR 8,000-20,000 for assistance. This is a popular option for retirees from USA, UK, and Europe."},
        {"question": "Do I need a South African lawyer for my visa?", "answer": "Not legally required, but strongly recommended due to bureaucratic complexity and frequent changes to requirements. Many applicants report rejections without legal help. Attorney fees range from ZAR 10,000-25,000 for standard applications."},
        {"question": "How long does South Africa visa processing take?", "answer": "Processing times vary significantly: work visas take 4-8 weeks, critical skills visas 6-12 weeks, and permanent residence 18-36 months. The Department of Home Affairs is known for delays. Using a VFS Global centre for submission can help track status."},
        {"question": "What is SAQA evaluation and why is it needed?", "answer": "SAQA (South African Qualifications Authority) evaluation verifies foreign qualifications are equivalent to South African standards. Required for most work and critical skills visas. Costs ZAR 1,500-2,500 and takes 4-8 weeks. Professional body evaluation may be additionally required for regulated professions."}
      ]'::jsonb,
      'South Africa''s Department of Home Affairs is known for administrative backlogs and inconsistent processing. Requirements and fees change frequently. Police clearances must be from every country you have lived in. Medical reports must be from a SADF-approved physician. Budget for longer processing times than officially stated.',
      'Get your SAQA qualifications evaluation started early, obtain police clearances from all countries you have lived in, engage a South African immigration attorney, check if your profession is on the Critical Skills List, and submit through VFS Global for tracking capability.'
    );
  END IF;

  -- ============================================================
  -- JAPAN
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'japan';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Japan offers multiple work and residence visa categories with transparent government fees. The Highly Skilled Professional (HSP) points-based visa is the fastest route to permanent residence. Japan has actively recruited foreign talent and digital nomads in recent years. While government fees are modest, living costs in Tokyo and Osaka are high. Language is a practical barrier for daily life, though not required for most work visas.',
      '[
        {"question": "How much does a Japan work visa cost?", "answer": "Japan work visa government fees are low: the Certificate of Eligibility (COE) is free, and the visa stamp costs JPY 3,000 (single entry) or JPY 6,000 (multiple entry). Residence card issuance at the airport is free. Total official government costs are under JPY 10,000 for most applicants."},
        {"question": "What is the Highly Skilled Professional (HSP) visa?", "answer": "The HSP points-based system awards points for academic background, work experience, annual salary, age, and Japanese language skills. Scoring 70+ points grants preferential treatment; 80+ points qualifies for Permanent Residence after just 1 year instead of the standard 10 years. Application is through your employer."},
        {"question": "Do I need Japanese language skills for a work visa?", "answer": "Most work visas (Engineer/Specialist in Humanities/International Services, Skilled Labor, etc.) do not require Japanese language proficiency. However, daily life in Japan is significantly easier with Japanese skills. The HSP points system gives bonus points for Japanese Language Proficiency Test (JLPT) N1 or N2."},
        {"question": "What proof of funds is required for Japan?", "answer": "For work visas, proof of funds is not specifically required as income from employment satisfies the requirement. For the Digital Nomad visa, applicants must show annual income of JPY 10,000,000 (approximately USD 65,000+). For student visas, bank statements showing sufficient funds for tuition and living expenses are required."},
        {"question": "How long does Japan work visa processing take?", "answer": "Certificate of Eligibility (COE) processing takes 1-3 months. Once you have the COE, the visa itself takes 3-5 business days at the consulate. Total process from application to having a visa: 1-4 months. The HSP visa and digital nomad visa have similar timelines."},
        {"question": "Can I bring my family to Japan on a work visa?", "answer": "Yes, dependent visas are available for spouses and children of most work visa holders. Each dependent needs their own visa application (JPY 3,000-6,000 visa fee). Dependents can work up to 28 hours per week with permission."},
        {"question": "What is required to apply for Japan Permanent Residence?", "answer": "Standard PR requires 10 years continuous residence. HSP visa holders can apply after 3 years (70+ points) or 1 year (80+ points). Requirements include stable income, good tax, pension, and insurance payment record, good conduct, and contribution to Japan. Annual income of JPY 3,000,000+ is a commonly cited guideline."}
      ]'::jsonb,
      'Japan visa applications require your employer to submit the Certificate of Eligibility (COE) on your behalf in most cases. Visa rules and point thresholds are updated periodically. City-specific costs vary significantly: Tokyo living expenses are substantially higher than regional cities. Maintain your health insurance, pension, and tax payments throughout your stay as these affect PR eligibility.',
      'Confirm your employer is willing to sponsor your COE, check if your occupation qualifies for the HSP points system and calculate your likely score, prepare all required documents, register at your ward office immediately upon arrival, and enroll in national health insurance and pension within 14 days of residency registration.'
    );
  END IF;

  -- ============================================================
  -- SINGAPORE
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'singapore';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Singapore operates a points-based employment pass system with transparent requirements and fast online processing. The Employment Pass (EP) targets professionals earning SGD 5,000+ per month; the EntrePass is for entrepreneurs. Singapore has strict foreign worker policies designed to prioritize local hiring. While government fees are modest, Singapore has one of the world''s highest costs of living, which dominates the total immigration budget.',
      '[
        {"question": "What is the Singapore Employment Pass (EP)?", "answer": "The EP is the main work permit for foreign professionals. Minimum qualifying salary is SGD 5,600 per month (SGD 6,200 for financial sector) as of 2024 for younger candidates, with higher thresholds for older applicants. Application fee is SGD 105 per application. Processing takes 3-8 weeks online."},
        {"question": "How much does the Singapore EP cost?", "answer": "EP application fee is SGD 105. EP issuance fee is SGD 225. If you use a local employer and an agent/attorney, professional fees add SGD 500-2,000. Total government costs are under SGD 400 for the main applicant; significant costs are living expenses in Singapore (SGD 3,000-5,000 per month minimum)."},
        {"question": "What is the COMPASS points system for Singapore EP?", "answer": "COMPASS (Complementarity Assessment Framework) evaluates EP candidates on 4 criteria: salary, qualifications, diversity, and local employment support. Candidates must score 40+ points. Introduced in 2023, it makes approval less predictable based on salary alone. Strong candidates score in the 50-70 range."},
        {"question": "Can my family join me in Singapore?", "answer": "EP holders earning SGD 6,000+ per month can apply for a Dependant Pass for spouse and children (fee: SGD 105 application + SGD 225 issuance). Those earning SGD 12,000+ per month can apply for Long-Term Visit Pass for parents. Minimum salary thresholds for dependants increased in 2024."},
        {"question": "What is the Singapore EntrePass?", "answer": "The EntrePass is for entrepreneurs who want to start or operate a business in Singapore. Applicants must be registered with ACRA, plan to incorporate a private limited company, and have funding or a strong business plan. Application fee is SGD 105. The entrepreneur must not have more than 30% of the business owned by other EP or EntrePass holders."},
        {"question": "How long does it take to become a Singapore Permanent Resident?", "answer": "There is no set timeline. PR is discretionary and considered after typically 2+ years of EP holding. You must demonstrate integration, stable employment, tax contributions, and long-term commitment. PR application fee is SGD 100. Approval rate varies and most sources estimate 30-50% of applications succeed."}
      ]'::jsonb,
      'Singapore EP approval is increasingly competitive due to COMPASS points. Fair Consideration Framework (FCF) requirements mean employers must advertise jobs locally for 14 days before hiring foreigners. Salary requirements increase with applicant age. Costs of living in Singapore are among the world''s highest, making the total immigration budget substantially higher than government fees alone suggest.',
      'Ensure your salary meets the COMPASS minimum threshold for your age, confirm your employer has a strong COMPASS score, check if your employer is compliant with FCF job advertising requirements, prepare financial documents showing stable employment history, and budget realistically for Singapore''s high cost of living before committing to the move.'
    );
  END IF;

  -- ============================================================
  -- SOUTH KOREA
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'south-korea';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'South Korea has grown significantly as a destination for tech workers, English teachers, and K-culture enthusiasts. The E-7 visa covers professional employment while the D-10 Job Seeker Visa allows skilled professionals to enter Korea and search for work. Korea launched a digital nomad visa in 2024. The government processes applications online through HiKorea. Korean language skills are not required for most work visas but greatly improve quality of life.',
      '[
        {"question": "What types of work visas does South Korea offer?", "answer": "Main work visas: E-1 (Professor), E-2 (English teacher), E-3 (Research), E-4 (Technology Transfer), E-5 (Professional), E-6 (Arts/Performance), E-7 (Specially Designated Activities covering IT, engineering, management roles). E-7 is the most common for corporate professionals. Visa fees range from KRW 40,000-80,000 depending on type and duration."},
        {"question": "How much does a South Korea E-7 work visa cost?", "answer": "E-7 visa fee is KRW 60,000 for single entry or KRW 80,000 for multiple entry. Change of status fees inside Korea are KRW 130,000. Total costs including legal fees (KRW 500,000-1,500,000), document preparation, and apostilles typically range from KRW 700,000-2,000,000 (USD 520-1,500)."},
        {"question": "What is the Korea D-10 Job Seeker Visa?", "answer": "The D-10 visa allows qualified professionals to enter Korea and search for employment for up to 6 months (extendable). Eligible applicants must have a degree from a globally ranked university or have earned KRW 40,000,000+ annual salary at a prior employer. Fee is KRW 40,000. Once you find a job, you change status to the appropriate E visa."},
        {"question": "What is the Korea Digital Nomad Visa?", "answer": "Launched in early 2024, the Korea Digital Nomad Visa allows remote workers to stay for 1 year (renewable once). Requirements: annual income of USD 84,600 or more, employment with a company outside Korea, valid health insurance, clean criminal record. Application fee is approximately KRW 120,000."},
        {"question": "Is Korean language required for work visas?", "answer": "Korean is not required for most work visas (E-7, E-3, E-4, E-5). However, the D-10 job seeker visa benefits from Korean proficiency as it expands job options. The TOPIK (Test of Proficiency in Korean) earns extra points in some residency and naturalization applications."},
        {"question": "How long to get Korean Permanent Residence (F-5)?", "answer": "Standard route requires 5 years of continuous legal residence. The Point System allows qualified professionals to apply after 3 years. Income, Korean language ability, age, and tax payments are scored. Good standing with tax and health insurance payments throughout your stay is essential for PR eligibility."}
      ]'::jsonb,
      'South Korea visa regulations are updated frequently. The D-10 and Digital Nomad visas were newly introduced and eligibility criteria may evolve. Criminal background checks must be apostilled. All documents in languages other than Korean and English require certified translation into Korean. Processing at Korean immigration (HiKorea) can be slow during peak periods.',
      'Register on HiKorea for online application tracking, obtain police clearance certificates from all countries of residence, prepare degree certificates with apostilles and Korean translations if needed, confirm your employer is registered with Korean immigration authorities, and register with the local Immigration Office within 90 days of arrival.'
    );
  END IF;

  -- ============================================================
  -- THAILAND
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'thailand';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Thailand is one of the world''s most popular destinations for retirees and digital nomads. The Retirement Visa (Non-Immigrant O-A) requires proof of pension or savings. The Thailand LTR (Long-Term Resident) Visa launched in 2022 targets wealthy global citizens, pensioners, remote workers, and skilled professionals with streamlined processing. Government fees are modest and the cost of living is low, making Thailand an accessible option for most budgets.',
      '[
        {"question": "What is the Thailand LTR Visa and who qualifies?", "answer": "The Long-Term Resident (LTR) Visa offers a 10-year renewable visa with multiple entry for 4 categories: Wealthy Global Citizens (USD 1M+ assets), Wealthy Pensioners (USD 80,000/year income), Work-from-Thailand Professionals (USD 80,000/year income, employed abroad), and Highly Skilled Professionals (salary USD 80,000/year in targeted industries). Government fee is THB 50,000 (approximately USD 1,400)."},
        {"question": "How much does the Thailand Retirement Visa cost?", "answer": "The Non-Immigrant O-A visa costs THB 5,000 for 1 year (multiple entry). Requirements: age 50+, THB 800,000 in Thai bank account (or THB 65,000/month income, or combination). Annual extensions cost THB 1,900. Total annual cost including health insurance (mandatory) ranges from THB 10,000-30,000 (USD 280-840)."},
        {"question": "Is health insurance required for Thailand visas?", "answer": "Health insurance is mandatory for the retirement visa (O-A) and LTR visa. For retirement visa, minimum coverage is THB 40,000 outpatient and THB 400,000 inpatient per year. Insurance typically costs THB 15,000-50,000 per year depending on age and coverage level."},
        {"question": "Can I work in Thailand on a retirement visa?", "answer": "No. The retirement visa does not authorize work in Thailand. Working without a proper work permit is illegal and can result in fines and deportation. The LTR Work-from-Thailand Professional visa allows remote work for foreign employers. The SMART Visa also allows work for qualifying professionals."},
        {"question": "What is the Thailand Destination Thailand Visa for digital nomads?", "answer": "Thailand launched the DTV (Destination Thailand Visa) in 2024, valid for 5 years with 180-day stays per entry, for remote workers and tourists. Requirements: THB 500,000 (approximately USD 14,000) in financial assets, a stated purpose (remote work, tourism, or medical treatment). Fee is THB 10,000 (approximately USD 280). Multiple entries permitted."},
        {"question": "Do I need to do visa runs in Thailand?", "answer": "Traditional tourist visa runs (border crossings) were common but Thailand has tightened policies. The LTR and DTV visas are designed to eliminate this need. Retirement visa holders do annual extensions in-country. It is no longer advisable to rely on tourist visa exemptions for long-term living in Thailand."}
      ]'::jsonb,
      'Thailand visa rules change frequently. The LTR and DTV visas were recently introduced and requirements may evolve. THB 800,000 deposit for retirement visa must remain in a Thai bank account throughout the visa validity. Health insurance is mandatory and must be from a company approved by the Thai government. Verify all requirements with the Thai consulate or Board of Investment (for LTR) before applying.',
      'Determine which visa category suits your situation (Retirement, LTR, or DTV), open a Thai bank account and deposit required funds well in advance of application, arrange qualifying health insurance from a Thailand-approved provider, obtain police clearance certificate with apostille from your home country, and apply at a Thai consulate or through the BOI for LTR visas.'
    );
  END IF;

  -- ============================================================
  -- MALAYSIA
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'malaysia';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Malaysia offers the DE Rantau Digital Nomad Pass for remote workers and the Malaysia My Second Home (MM2H) programme for long-term residents. Malaysia has historically been one of the most accessible and affordable Southeast Asian destinations for expats. Kuala Lumpur offers modern infrastructure at lower cost than Singapore. The MM2H programme was relaunched in 2021 with higher requirements after a 2020 suspension.',
      '[
        {"question": "What is the Malaysia DE Rantau Digital Nomad Pass?", "answer": "The DE Rantau Pass allows remote workers and digital nomads to live in Malaysia for 3-12 months (extendable). Requirements: minimum annual income of USD 24,000, employment with a foreign company, valid health insurance. Application fee is MYR 1,000 (approximately USD 210). Apply through the Malaysia Digital Economy Corporation (MDEC) portal."},
        {"question": "What is MM2H and how much does it cost?", "answer": "Malaysia My Second Home (MM2H) is a 5-year renewable long-stay visa for retirees and those with sufficient funds. Since the 2021 relaunch: offshore income of MYR 40,000 per month, fixed deposit of MYR 1,000,000 in Malaysian bank, liquid assets of MYR 1,500,000. Application fee MYR 5,000, processing fee MYR 500. Attorney and agent fees add MYR 5,000-15,000."},
        {"question": "Can I work in Malaysia on a work permit?", "answer": "Work permits (Employment Pass or Professional Visit Pass) require employer sponsorship. Employment Pass requires minimum monthly salary of MYR 5,000 and is valid 1-5 years. Application is submitted by the employer through EzXcess system. Total employer costs including levy and processing: MYR 3,000-8,000 per employee."},
        {"question": "Do I need health insurance in Malaysia?", "answer": "Health insurance is required for DE Rantau and MM2H visas. Malaysia has a mix of public and private healthcare; expats typically use private hospitals. International health insurance plans covering Malaysia cost USD 1,000-3,000 per year depending on age and coverage."},
        {"question": "How does Malaysia Permanent Residence work?", "answer": "Permanent Residence (PR) can be applied for after 5 years of continuous legal residence on a valid pass. Applications are at the discretion of the Director General of Immigration. Spouses of Malaysian citizens have a more accessible pathway. PR applications are known for long and unpredictable processing times."},
        {"question": "Is Malaysia good for digital nomads outside DE Rantau?", "answer": "Yes. Many nomads also use the Social Visit Pass (tourist visa) which allows stays up to 90 days for most Western passport holders. For longer stays, DE Rantau is the recommended official route. Kuala Lumpur has excellent coworking spaces and affordable fast internet infrastructure."}
      ]'::jsonb,
      'MM2H requirements were significantly tightened in 2021 and remain controversial among expats. The DE Rantau Pass is relatively new and requirements may change. Always verify current income thresholds and deposit requirements with the official Malaysian agencies (MDEC for DE Rantau, Immigration Department for MM2H). Fixed deposit requirements tie up significant capital for MM2H holders.',
      'Determine whether DE Rantau (remote workers) or MM2H (long-term residents) suits your needs, verify current financial thresholds on official government websites, engage a licensed Malaysian immigration agent for MM2H (agents must be registered with the Ministry of Tourism), open a Malaysian bank account early for deposit requirements, and confirm your health insurance meets programme requirements.'
    );
  END IF;

  -- ============================================================
  -- INDONESIA
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'indonesia';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Indonesia launched the Second Home Visa and digital nomad infrastructure in Bali in recent years to attract remote workers and long-stay tourists. Bali in particular has become a major global hub for digital nomads. Work permits are employer-sponsored and require KITAS (Temporary Stay Permit). The Second Home Visa offers a 5 or 10 year multiple-entry visa for those who can demonstrate financial capacity.',
      '[
        {"question": "What is the Indonesia Second Home Visa?", "answer": "The Second Home Visa grants 5-year or 10-year multiple-entry stays for foreigners who can show IDR 2 billion (5-year) or IDR 5 billion (10-year) in financial assets. Application fee is USD 100-200. It does not authorize employment but allows long-stay visits. Increasingly popular with Bali-based digital nomads and retirees."},
        {"question": "Can I work remotely from Indonesia?", "answer": "Indonesia does not yet have a formal digital nomad visa authorizing work for foreign employers. Many remote workers use the Second Home Visa or tourist visas and work remotely without formal authorization. Indonesia announced plans for a dedicated digital nomad visa for Bali, but implementation has been delayed. Check the latest official status before relying on this option."},
        {"question": "How do I get a work permit (KITAS) in Indonesia?", "answer": "Work permits (KITAS) require employer sponsorship. The employer must obtain a RPTKA (Manpower Utilization Plan) approval, then sponsor KITAS. Total employer costs: USD 1,200-2,500 in government fees plus agent fees. KITAS is typically 1-2 years, renewable. Processing takes 4-8 weeks."},
        {"question": "What are the financial requirements for Indonesia Second Home Visa?", "answer": "Applicants must show IDR 2 billion (approximately USD 126,000) in savings or assets for the 5-year visa, or IDR 5 billion (approximately USD 315,000) for the 10-year option. These are not fees but must be held and demonstrated. The visa itself costs around USD 100-200 in government fees."},
        {"question": "Is Bali specifically popular for digital nomads?", "answer": "Yes. Bali has one of the world''s largest concentrations of digital nomads, particularly in Canggu and Seminyak. It offers fast internet, numerous coworking spaces, affordable accommodation and food, and a large expat community. Most nomads use tourist visas or the Second Home Visa for legal long-term stays."},
        {"question": "Can I retire in Indonesia?", "answer": "Indonesia offers a Retirement Visa (KITAS Pensiunan) for those aged 55+. Requirements include: USD 1,500 per month income from pension, health insurance, and no intention to work. Valid 1 year, renewable for up to 5 years. Processing is through a government-approved sponsor (typically a local tourism company or retirement agent)."}
      ]'::jsonb,
      'Indonesia''s digital nomad visa plans have been announced but implementation timelines have shifted multiple times. Working without a proper work permit (KITAS) is illegal and can result in deportation and bans. Tourist visa extensions (VOA extensions) are permitted but have limits. IDR exchange rates fluctuate; always verify financial thresholds in current IDR at the time of application.',
      'Verify the latest status of Indonesia''s digital nomad visa before relying on it, use the Second Home Visa for long legal stays without formal employment, ensure your employer obtains RPTKA approval before applying for KITAS, arrange health insurance meeting Indonesian government standards, and register with the local immigration office within the required timeframe after arrival.'
    );
  END IF;

END $$;
