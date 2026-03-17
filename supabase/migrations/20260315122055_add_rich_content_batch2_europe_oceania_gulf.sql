/*
  # Add Full Rich Content - Batch 2 (Europe, Oceania, Gulf)

  Countries covered:
  - Europe: Spain, France, Italy, Netherlands, Ireland, Switzerland, Sweden, Norway
  - Oceania: New Zealand
  - Gulf: United Arab Emirates

  Each country gets:
  - Country-level intro_md, faq_json (6-8 questions), warning_md, next_steps_md
  - Inserted into immigration_cost_content (country_id, pathway_id = NULL)
  - Upsert pattern: delete existing then insert fresh
*/

DO $$
DECLARE
  v_id uuid;
BEGIN

  -- ============================================================
  -- SPAIN
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'spain';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Spain is one of Europe''s most popular immigration destinations, offering the Non-Lucrative Visa for those with passive income, the Digital Nomad Visa (launched 2023), and the Golden Visa for investors. Spain has a warm climate, affordable cost of living relative to northern Europe, and a pathway to EU citizenship after 10 years (2 years for Latin American nationals). Barcelona and Madrid are major expat hubs with strong international communities.',
      '[
        {"question": "What is the Spain Digital Nomad Visa?", "answer": "Launched in January 2023, the Digital Nomad Visa allows remote workers to live in Spain for 1 year (extendable to 5 years). Requirements: monthly income of approximately EUR 2,334 (200% of Spanish minimum wage), employment with a foreign company or self-employed for clients outside Spain. Application fee approximately EUR 80. Legal fees typically add EUR 1,500-4,000."},
        {"question": "What is the Spain Non-Lucrative Visa?", "answer": "The Non-Lucrative Visa is for those with passive income (pension, investments, rental income) who do not intend to work in Spain. Requires demonstrating approximately EUR 28,800/year income for a single applicant. Application fee is EUR 80. Must purchase Spanish health insurance (EUR 50-200/month). Popular with retirees and those with investment income."},
        {"question": "What is the Spain Golden Visa?", "answer": "The Golden Visa grants residency to investors who purchase Spanish real estate worth EUR 500,000+ or make qualifying investments of EUR 1,000,000 in Spanish companies or public debt. Application fee EUR 80. Processing takes 20 days online. Allows family members to be included. Note: Spain announced plans to phase out the property-based Golden Visa; verify current status before applying."},
        {"question": "Can I get Spanish citizenship?", "answer": "Most foreigners can apply for citizenship after 10 years of legal residence. Latin American nationals, Sephardic Jews, and nationals of certain former Spanish territories qualify after just 2 years. Basic Spanish language (DELE A2) and civics (CCSE) tests are required. Dual citizenship is allowed for nationals of Ibero-American countries; others must renounce their original citizenship."},
        {"question": "Do I need a Spanish lawyer for visa applications?", "answer": "Not legally required but strongly recommended, especially for the Digital Nomad and Non-Lucrative visas, which have strict documentation requirements. Spanish consulates outside Spain are known for inconsistent requirements. Lawyers charge EUR 1,500-4,000 for standard visa applications."},
        {"question": "What is the NIE number and why do I need it?", "answer": "The NIE (Numero de Identificacion de Extranjero) is a tax identification number required for almost all activities in Spain: opening a bank account, signing a lease, buying property, or registering with social security. Apply at the Spanish consulate before arrival or at a National Police station in Spain. Fee is approximately EUR 10."},
        {"question": "Is health insurance required to live in Spain?", "answer": "Yes. For Non-Lucrative and Digital Nomad visas, private health insurance is mandatory until you are registered in the Spanish social security system. Qualifying health insurance (no copayments, no coverage limits) costs EUR 50-200/month depending on age and provider. Once employed or self-employed with social security contributions, you access public healthcare."}
      ]'::jsonb,
      'Spain has announced changes to its Golden Visa property route; verify the current status before planning property investment. Spanish consulate requirements vary significantly by country of residence. All documents must be apostilled and translated by a sworn translator (traductor jurado). Social security registration is required promptly after arriving to work legally.',
      'Determine your visa category (Digital Nomad, Non-Lucrative, or Golden Visa), gather income proof and health insurance documentation, get documents apostilled and sworn-translated, obtain NIE at the Spanish consulate before travel if possible, register at your local Ayuntamiento (town hall) within 3 months of arrival, and consult a gestor or immigration lawyer for application support.'
    );
  END IF;

  -- ============================================================
  -- FRANCE
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'france';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'France is a major destination for skilled workers, students, and entrepreneurs. The French government manages immigration through the OFII (Office Francais de l''Immigration et de l''Integration). The Passeport Talent visa targets highly qualified professionals, investors, and artists. France has a comprehensive social welfare system that visa holders can access after establishing residence. French language skills are not required for most work visas but significantly improve quality of life.',
      '[
        {"question": "What is the French Passeport Talent visa?", "answer": "The Passeport Talent is a multi-year residence permit for highly qualified workers (salary 1.5x average French wage), researchers, company founders, investors (EUR 300,000+), and artists. Valid 4 years, renewable. Visa application fee is EUR 99. Includes right to work and can include family members. OFII validation fee is EUR 200 after arrival."},
        {"question": "How much does a standard French work visa cost?", "answer": "Salaried Employee (Salarie) visa costs EUR 99 at the consulate, plus OFII medical visit fee of EUR 200 paid after arrival. Total government costs are under EUR 300. Legal fees for employer-assisted applications typically add EUR 1,500-4,000. The employer must obtain prior authorization from DREETS (labour authority) before sponsoring."},
        {"question": "Is French language required for work visas in France?", "answer": "French language is not required for most work visas. However, it is required for the French Talent Passport in certain creative categories. After obtaining residence, you must complete a civic integration course (CIR) including French lessons. For long-term residence renewal, B1 French is increasingly expected."},
        {"question": "What is the French digital nomad option?", "answer": "France does not have a dedicated digital nomad visa. Remote workers typically use the Visitor Visa (Visa Visiteur) which allows stays of 1 year for those with sufficient passive income (approximately EUR 1,200/month) and who do not work for French clients. Legal grey area for remote workers; consult an attorney to understand tax implications under French law."},
        {"question": "How long until French permanent residence?", "answer": "After 5 years of continuous legal residence, you can apply for a Carte de Resident (10-year residence permit). This requires stable income, integration into French society, and increasingly, French language proficiency. French citizenship can be applied for after 5 years of residence (or 2 years with French degree)."},
        {"question": "What are the costs of French social security contributions?", "answer": "Employed workers in France pay approximately 22-25% of gross salary in employee social contributions (health, pension, unemployment). Employers pay an additional 42-45%. Self-employed (auto-entrepreneur) pay approximately 22-24% of revenue. These contributions give access to healthcare, pension, and unemployment benefits."},
        {"question": "Do I need health insurance to enter France?", "answer": "Health insurance is required for the Visitor Visa and during the initial period before your French social security affiliation is activated. Private health insurance (mutuelle) costs EUR 50-150/month. Once employed and paying social contributions, you are covered by the French public health system (AMELI)."}
      ]'::jsonb,
      'France has significant bureaucracy and processing times can be slow. The OFII appointment after arrival is mandatory and must not be skipped. All foreign documents must be apostilled and officially translated into French by a certified translator (traducteur assermente). Tax residency rules in France are strict; if you spend more than 183 days per year in France you are likely a French tax resident.',
      'Obtain prior work authorization through your employer before applying for a work visa, gather apostilled and certified French-translated documents, apply at the French consulate in your country of residence, attend mandatory OFII appointment within 3 months of arrival, register with French social security (CPAM) promptly, and consult a French immigration attorney or avocat for complex cases.'
    );
  END IF;

  -- ============================================================
  -- ITALY
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'italy';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Italy offers the Digital Nomad Visa, an Investor Visa, and a Freelancer Visa (Lavoratore Autonomo) for qualified applicants. Italy is popular with remote workers and retirees for its lifestyle, cuisine, and culture. The Decreto Flussi annual quota system limits how many non-EU workers can enter each year for many visa types, creating competition for available spots. Legal support is strongly recommended due to complex bureaucratic processes.',
      '[
        {"question": "What is the Italy Digital Nomad Visa?", "answer": "Italy launched a dedicated Digital Nomad and Remote Worker Visa in 2024. Requirements: annual income of EUR 28,000+ (8 times the Italian social allowance), employment with a non-Italian employer or self-employed clients outside Italy, health insurance coverage. Valid for 1 year, renewable for 2-year extensions. Application fee approximately EUR 116. Legal fees typically add EUR 2,000-5,000."},
        {"question": "What is the Decreto Flussi and how does it affect immigration?", "answer": "The Decreto Flussi is Italy''s annual immigration quota decree that sets limits on non-EU workers who can enter for most work categories. Spots fill extremely quickly (often within hours of opening). The digital nomad and investor visas are outside this quota system. For standard employment visas, timing your application to the quota opening is critical."},
        {"question": "What is the Italy Investor Visa?", "answer": "The Investor Visa requires: EUR 500,000 investment in an Italian company, EUR 250,000 in an innovative Italian startup, EUR 1,000,000 in philanthropic projects, or EUR 2,000,000 in Italian government bonds. Valid 2 years renewable. No Decreto Flussi quota applies. Application through the online portal Invest in Italy with a government committee review."},
        {"question": "Do I need Italian language for a work visa?", "answer": "Italian language is not required for most work visas including the digital nomad visa. However, A2 Italian is required for the long-term EU residence permit (Permesso di Soggiorno UE per soggiornanti di lungo periodo) after 5 years. Learning Italian significantly improves integration and daily life quality."},
        {"question": "What is the Codice Fiscale and why do I need it?", "answer": "The Codice Fiscale is Italy''s tax identification number, required for virtually everything: renting an apartment, opening a bank account, healthcare, utilities. Apply at your local Agenzia delle Entrate office or at the Italian consulate before arrival. No fee for EU citizens; small fee for non-EU. Required before most administrative steps."},
        {"question": "How does Italy healthcare work for immigrants?", "answer": "Non-EU residents must register with the Italian National Health Service (SSN) once they have a residence permit (Permesso di Soggiorno). Employed workers are automatically registered via social contributions. Digital nomads and self-employed must purchase private health insurance (approximately EUR 80-200/month) until SSN registration is possible."},
        {"question": "What is the flat tax regime for new Italian residents?", "answer": "Italy offers a flat tax regime (Forfettario) for new tax residents: a fixed annual tax of EUR 100,000 on foreign-sourced income for high earners, valid for 15 years. Also, pensioners from abroad can pay a 7% flat tax rate in selected southern Italian municipalities. These regimes attract high-net-worth individuals and retirees."}
      ]'::jsonb,
      'Italian bureaucracy is notoriously slow and complex. The Permesso di Soggiorno application must be submitted within 8 business days of arrival. All documents must be apostilled and translated by an officially recognized Italian translator. The Decreto Flussi quota system is extremely competitive; plan carefully if using standard employment pathways.',
      'Submit your Permesso di Soggiorno application at a Sportello Unico per l''Immigrazione within 8 days of arrival, obtain Codice Fiscale early, register with the local Anagrafe (civil registry), arrange compliant health insurance before arrival, and engage an Italian immigration attorney (avvocato) or authorized patronato for navigating documentation requirements.'
    );
  END IF;

  -- ============================================================
  -- NETHERLANDS
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'netherlands';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'The Netherlands is a major European tech and finance hub with a highly English-speaking population. The Dutch government offers the Highly Skilled Migrant (HSM) permit and the Orientation Year Visa for recent graduates. The 30% ruling provides a significant tax benefit for qualifying skilled migrants. Amsterdam, Rotterdam, and Eindhoven are major expat destinations. The IND (Immigration and Naturalisation Service) manages all residence permit applications.',
      '[
        {"question": "What is the Dutch Highly Skilled Migrant permit?", "answer": "The Highly Skilled Migrant (Kennismigrant) permit is for professionals earning above the Dutch income threshold (EUR 5,688/month for those under 30, EUR 6,245/month for those 30+ in 2024). Application is employer-sponsored and processed by IND. Fee is EUR 290 for the employer. Processing takes 2-4 weeks for recognized sponsors. No separate work permit needed."},
        {"question": "What is the 30% ruling and how valuable is it?", "answer": "The 30% ruling is a tax benefit for skilled migrants recruited from abroad. It allows 30% of gross salary to be paid tax-free for up to 5 years (reduced from 8 years in 2024 reforms). On a EUR 6,000/month salary, this saves approximately EUR 800/month in income tax. Requires application to the Dutch tax authority within 4 months of starting employment."},
        {"question": "What is the Dutch Orientation Year Visa?", "answer": "The Orientation Year (Zoekjaar) visa allows recent graduates from Dutch universities or top-40 global universities to stay in the Netherlands for 1 year to find a job. Fee is EUR 192. No employment required during orientation. Once a job meeting the HSM salary threshold is found, you convert to the HSM permit."},
        {"question": "How much does Netherlands permanent residence cost?", "answer": "Permanent Residence (Permanent Verblijf) costs EUR 290 to apply after 5 years continuous legal residence. Requirements include stable income at subsistence level, civic integration exam (inburgering), and continuous residence. The civic integration course can cost EUR 5,000-10,000 unless your employer covers it through the IND loan system."},
        {"question": "Do I need Dutch language skills?", "answer": "Dutch is not required for the HSM permit or initial residence. However, the Civic Integration Exam (Inburgering) is required for permanent residence and naturalization. This includes Dutch language (A2 level for PR, B1 for citizenship), knowledge of Dutch society, and orientation to the Dutch labour market. Courses cost EUR 5,000-10,000."},
        {"question": "What is a BSN number and why is it essential?", "answer": "The BSN (Burgerservicenummer) is the Dutch personal identification number, required for employment, healthcare, banking, and taxes. Register at your local municipality (gemeente) within 5 days of arrival to receive your BSN. Without BSN you cannot receive salary, open a bank account, or access healthcare properly."},
        {"question": "Can my family join me in the Netherlands?", "answer": "Family reunification is available for residence permit holders earning at least the Dutch minimum wage. Spouse or partner and minor children can apply for dependent residence permits. Application fee is EUR 192 per family member. Processing takes 3-6 months. Family members can work without restrictions on an HSM family permit."}
      ]'::jsonb,
      'The 30% ruling rules changed in 2024 and the benefit duration was reduced. Verify current thresholds and salary requirements with IND as they are updated annually. Housing in Amsterdam is extremely competitive and expensive; budget significantly for accommodation. Civic integration (inburgering) must be completed within 3 years for most residence permit holders or face fines.',
      'Confirm your employer is a recognized IND sponsor (most major Dutch companies are), register at your gemeente within 5 days of arrival for your BSN, apply for 30% ruling within 4 months of employment start, arrange Dutch health insurance (verplichte zorgverzekering) within 4 months of becoming a Dutch tax resident, and begin Dutch language lessons early if planning for permanent residence.'
    );
  END IF;

  -- ============================================================
  -- IRELAND
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'ireland';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Ireland is a major tech hub with the European headquarters of many US multinationals (Google, Meta, Apple, Pfizer). The Critical Skills Employment Permit is the primary route for skilled workers. Ireland offers a pathway to Irish citizenship after 5 years of residence, which also grants EU citizenship and rights. Dublin has high living costs, though Cork, Limerick, and Galway offer more affordable alternatives.',
      '[
        {"question": "What is the Ireland Critical Skills Employment Permit?", "answer": "The Critical Skills Employment Permit is for professionals in occupations on the Critical Skills Occupations List (tech, engineering, healthcare, finance). Minimum annual salary of EUR 38,000 (or EUR 32,000 for occupations on the list below this threshold). Application fee EUR 1,000 for 2-year permit. Spouses of critical skills permit holders can work without a separate permit."},
        {"question": "What is the General Employment Permit in Ireland?", "answer": "The General Employment Permit covers roles not on the Critical Skills list. Minimum salary EUR 30,000. Requires a Labour Market Needs Test (employer must advertise role for 4 weeks). Application fee EUR 500 for permits up to 6 months, EUR 1,000 for longer. Renewals cost EUR 1,500. Less attractive than Critical Skills as it has more restrictions."},
        {"question": "How much does Irish immigration cost in total?", "answer": "For Critical Skills Permit: government fee EUR 1,000 + Irish Residence Permit (IRP) registration EUR 300 + potential legal fees EUR 1,500-3,500. Total for initial 2-year permit: EUR 2,800-4,800. Annual renewals or further permits add similar costs."},
        {"question": "Can I get Irish citizenship and EU rights?", "answer": "After 5 years of legal residence in Ireland (with at least 1 year immediately before application), you can apply for Irish citizenship. Ireland allows dual citizenship, so you keep your original passport. Irish citizenship grants EU citizenship, giving you the right to live and work anywhere in the EU/EEA. This is a major attraction for non-EU workers, especially those from UK post-Brexit."},
        {"question": "Does Ireland have a digital nomad visa?", "answer": "Ireland does not currently have a dedicated digital nomad visa. Remote workers typically need to qualify under another visa category. The Stamp 0 permission is sometimes used by those with significant passive income (pension, investments) who are not working in Ireland. Consult an Irish immigration solicitor for your specific situation."},
        {"question": "What is the Irish Residence Permit (IRP) card?", "answer": "The IRP (formerly GNIB card) is the biometric residence card issued to non-EEA nationals. You must register with the Garda National Immigration Bureau (GNIB) or Irish Naturalisation and Immigration Service (INIS) within 90 days of arrival. Fee is EUR 300 per adult. This is separate from and in addition to the employment permit."},
        {"question": "What are living costs in Dublin versus other Irish cities?", "answer": "Dublin is one of Europe''s most expensive cities: average rent EUR 2,000-2,500/month for a 1-bedroom apartment. Cork, Limerick, and Galway average EUR 1,200-1,800/month. Many tech workers commute from outside Dublin. Budget at least EUR 2,500/month for single person living in Dublin including rent, food, transport, and basic expenses."}
      ]'::jsonb,
      'Ireland has a severe housing shortage, particularly in Dublin. Securing accommodation before arrival is strongly recommended. Employment permit applications can take 6-12 weeks; plan accordingly. The IRP registration appointment system can be slow; book early. Skills list and salary thresholds are updated annually by the Department of Enterprise.',
      'Confirm your occupation is on the Critical Skills list or that your employer can satisfy the Labour Market Needs Test for a General Permit, apply for Employment Permit before travelling to Ireland, book IRP registration appointment at INIS promptly after arrival, obtain a PPS number (Irish tax number) from the DSP, open an Irish bank account, and begin your 5-year residency clock towards EU citizenship.'
    );
  END IF;

  -- ============================================================
  -- NEW ZEALAND
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'new-zealand';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'New Zealand operates a points-based immigration system similar to Australia. The Skilled Migrant Category (SMC) and Accredited Employer Work Visa (AEWV) are the primary pathways for skilled workers. New Zealand has high demand for healthcare workers, engineers, IT professionals, and tradespeople. Government fees are relatively high compared to other countries. Auckland dominates economically but Wellington and Christchurch offer strong alternatives.',
      '[
        {"question": "What is the New Zealand Accredited Employer Work Visa (AEWV)?", "answer": "The AEWV is the main work visa for New Zealand, requiring a job offer from an Immigration NZ accredited employer. Visa fee is NZD 750 for up to 3 years. Employer accreditation costs NZD 740 (standard) or NZD 1,220 (high-volume). Jobs must meet median wage threshold of NZD 29.66/hour (exceptions for shortage roles). Processing takes 4-8 weeks."},
        {"question": "What is the Skilled Migrant Category (SMC) and is it accepting applications?", "answer": "The SMC points-based system awards points for age, qualifications, work experience, skilled employment in NZ, and family connections. It was suspended in 2020 and relaunched with a new expression of interest model. Points required vary based on selection rounds. Application fees are NZD 4,240 for the principal applicant plus NZD 2,360 per adult dependent."},
        {"question": "How much do New Zealand immigration applications cost?", "answer": "New Zealand has among the highest immigration fees globally. AEWV: NZD 750. Resident visas: NZD 3,010-4,240. Partner/Spouse of NZ citizen visa: NZD 2,720. Student visa: NZD 375. All fees are non-refundable. Including health and character assessments, total costs for skilled migrant residence are NZD 5,000-9,000+ excluding legal fees."},
        {"question": "What health requirements apply for New Zealand immigration?", "answer": "Applicants for residence must meet health requirements. Medical examination is required for most residence categories. X-ray for tuberculosis is required for applicants from certain countries. Medical and X-ray exams cost approximately NZD 300-600 per person. Chest X-ray is valid for 36 months; general medicals for 24 months."},
        {"question": "What is the proof of funds requirement for New Zealand?", "answer": "For the Skilled Migrant Category, applicants must demonstrate they can support themselves and dependants for the first 12 months. Generally NZD 4,200/month is used as a guideline. Investor visas require NZD 3 million (Investor 2 category) or NZD 15 million (Investor 1 category) to invest in NZ."},
        {"question": "How long does it take to get New Zealand permanent residence?", "answer": "Most skilled workers receive residence directly on approval of their Skilled Migrant or other residence visa. There is no separate permanent residence step for most pathways. However, qualifying for residence requires meeting the points threshold, employer requirements, health, and character criteria. The overall process from AEWV to residence typically takes 2-4 years."},
        {"question": "Does New Zealand accept dual citizenship?", "answer": "Yes. New Zealand allows dual citizenship and does not require you to renounce your original nationality when becoming a New Zealand citizen. Citizenship is available after 5 years of residence, including at least 1,350 days physically present in NZ. NZ passport is one of the world''s strongest with visa-free access to 190+ countries."}
      ]'::jsonb,
      'New Zealand immigration is managed online through the Immigration NZ portal (myvisaportal). Employers must be accredited before they can sponsor workers; confirm your employer''s accreditation status before accepting a job offer. Immigration NZ fees are non-refundable. Processing times vary and can extend during peak periods. Health and character requirements are strictly enforced.',
      'Confirm your employer is an accredited employer with Immigration NZ, check if your occupation is on the Green List (immediate residence pathway) or in shortage, calculate your SMC points using the Immigration NZ tool, book your medical examination early as appointments fill up, engage an NZ-licensed immigration adviser (AIP licensed) for residence applications, and verify the latest fee schedule on the Immigration NZ website.'
    );
  END IF;

  -- ============================================================
  -- UNITED ARAB EMIRATES
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'united-arab-emirates';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'The UAE is a major global business hub with zero income tax, making it highly attractive for professionals, entrepreneurs, and investors. The Golden Visa program offers 10-year residency for investors, entrepreneurs, and skilled professionals. Employment visas are employer-sponsored. Dubai and Abu Dhabi have large expat communities, with expats making up over 85% of the UAE population. All immigration is managed through the Federal Authority for Identity and Citizenship (ICA).',
      '[
        {"question": "What is the UAE Golden Visa?", "answer": "The UAE Golden Visa grants 10-year renewable residency to investors (AED 2M+ property or AED 2M+ business investment), entrepreneurs, specialized talents (doctors, engineers, scientists, artists), and outstanding students. Application through ICA. Government fee AED 1,150-2,800. No employer sponsorship required. Family members are included. This is the most sought-after long-term option in the UAE."},
        {"question": "How does UAE employment visa sponsorship work?", "answer": "Standard UAE employment visas require employer sponsorship. The employer applies for a work permit through the Ministry of Human Resources (MOHRE), then the employee applies for an entry permit and residence visa through ICA. Total costs (employer and employee share): AED 2,000-5,000. Employer typically pays work permit; employee pays visa stamping. Employment visa is valid 2-3 years, renewable."},
        {"question": "Is there income tax in the UAE?", "answer": "The UAE has no personal income tax. This is the primary financial attraction for skilled workers. A corporate tax of 9% was introduced in 2023 for businesses with revenue above AED 375,000. VAT is 5%. No capital gains tax, no inheritance tax. This tax advantage can significantly offset higher housing costs in Dubai and Abu Dhabi."},
        {"question": "How much does it cost to set up in Dubai as a freelancer?", "answer": "The Dubai Freelance Permit through various free zones (IFZA, Dubai Media City, etc.) costs AED 7,500-15,000/year including visa. This gives you legal freelance status and an employment visa without an employer sponsor. Free zone company setup costs vary: AED 12,000-20,000/year for a basic license plus visa. This route is popular with independent professionals."},
        {"question": "What is the UAE retirement visa?", "answer": "The UAE Retirement Visa is available for those aged 55+ meeting one of: property investment of AED 2M+, savings of AED 1M+, or monthly income of AED 20,000+. Valid 5 years renewable. Government fee approximately AED 3,570. Does not authorize work. Popular with British, Asian, and Arab expats retiring in the UAE."},
        {"question": "Can my family live with me in the UAE?", "answer": "Yes. Residence permit holders earning AED 4,000/month (or AED 3,000 + housing) can sponsor family members. Dependent visa costs AED 700-1,500 per person. Spouses, children under 18 (sons up to 25 if enrolled in university), and parents of certain visa types can be included. Golden Visa holders can sponsor all family members regardless of income."},
        {"question": "Do I need to renew my UAE visa regularly?", "answer": "Standard employment visas are 2-3 years and must be renewed by your employer. If you change employers, the new employer applies for a transfer. If you lose your job, you get a 60-day grace period to find new employment or leave. The Golden Visa is 10 years renewable. During renewal there are associated ICA fees of AED 1,000-2,000."}
      ]'::jsonb,
      'UAE visa status is tied to your employer for standard employment visas; losing your job requires prompt action within the grace period. Housing costs in Dubai and Abu Dhabi are high and rising. Medical fitness tests are mandatory for residence visas. All documents must be attested (apostilled equivalent) and translated into Arabic for official use. Some nationalities require additional security clearance which can extend processing.',
      'Confirm your employer is registered and licensed in the UAE, complete your medical fitness test at an approved health center, obtain an Emirates ID after residence visa stamping (mandatory for all residents), open a UAE bank account (requires Emirates ID and residence visa), and if seeking the Golden Visa, engage an ICA-registered typing center or immigration consultant for application submission.'
    );
  END IF;

  -- ============================================================
  -- SWITZERLAND
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'switzerland';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Switzerland has some of the world''s highest salaries but also the highest cost of living. Immigration is governed by bilateral agreements with the EU and a separate quota system for non-EU nationals (Third Country Nationals). Work permits for non-EU citizens are scarce and highly competitive, reserved primarily for managers, specialists, and workers with rare skills. Zurich, Geneva, Basel, and Bern are the main expat destinations, each home to major financial and pharmaceutical employers.',
      '[
        {"question": "How do non-EU nationals get a Swiss work permit?", "answer": "Non-EU (Third Country) nationals need a work permit (B permit or L permit) sponsored by a Swiss employer. Switzerland allocates annual quotas for these permits, which are limited and often exhausted early in the year. The employer must prove the role cannot be filled by Swiss or EU/EEA nationals first. This Labour Market Test makes approval challenging for most roles."},
        {"question": "What types of Swiss residence permits are there?", "answer": "Main permit types: L permit (Short-term residence, up to 1 year), B permit (Annual residence, 1-5 years, renewable), C permit (Settlement/Permanent residence, after 5-10 years). EU/EEA citizens get permits under bilateral agreements more easily. Non-EU nationals must meet higher thresholds including manager/specialist status."},
        {"question": "How much does a Swiss work permit cost?", "answer": "Permit fees vary by canton: typically CHF 65-200 for initial registration fee. However, total immigration costs including legal support (CHF 3,000-8,000 for attorney assistance), document preparation, translations, and apostilles typically range from CHF 4,000-12,000. High salary requirements and competitive housing make Switzerland expensive overall."},
        {"question": "What income level is required for Switzerland?", "answer": "There is no published minimum income for work permits, but Switzerland''s high cost of living means most sponsored roles pay CHF 100,000+ for Zurich/Geneva. Employers must pay competitive local market salaries. Renting a 1-bedroom apartment in Zurich averages CHF 2,500-3,500/month; in Geneva CHF 2,200-3,000/month."},
        {"question": "How long does it take to get Swiss permanent residence (C permit)?", "answer": "EU/EEA nationals can typically apply for a C permit after 5 years of B permit residence. Non-EU nationals must wait 10 years. Requirements include good integration, language skills (national language of your canton: German, French, or Italian), stable income, and no criminal record or welfare dependence."},
        {"question": "Is Switzerland part of the EU for immigration purposes?", "answer": "Switzerland is not an EU member but has bilateral agreements with the EU allowing Swiss-style free movement for EU/EEA citizens. For non-EU nationals, Swiss immigration rules are independent and more restrictive. Switzerland has referendums on immigration policy periodically; the framework may evolve."},
        {"question": "What are Swiss health insurance requirements?", "answer": "Health insurance (Krankenkasse) is mandatory for all residents within 3 months of arrival. Basic coverage (Grundversicherung) costs CHF 300-600/month per adult depending on canton, deductible, and provider. Employers do not typically cover this; it is an employee expense. Failure to enroll results in automatic enrollment in the most expensive local plan by cantonal authorities."}
      ]'::jsonb,
      'Swiss work permit quotas for non-EU nationals are limited and competitive. The Labour Market Test requirement means your employer must demonstrate genuine inability to fill the role locally before sponsoring you. Health insurance is mandatory and expensive; budget for it from day one. Each Swiss canton has its own registration and permit processing authority; requirements and timelines vary by canton.',
      'Confirm your role qualifies as manager or specialist level meeting Swiss quota requirements, ensure your employer has experience navigating the Swiss permit quota system, register with your cantonal authority (Gemeindeverwaltung or Einwohnerkontrolle) within 14 days of arrival, enroll in compulsory health insurance within 3 months, and engage a Swiss immigration attorney familiar with cantonal quota processing.'
    );
  END IF;

  -- ============================================================
  -- SWEDEN
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'sweden';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Sweden is a leading tech and innovation hub, home to major companies like Spotify, IKEA, Volvo, and Ericsson. The Swedish Migration Agency (Migrationsverket) manages work permits online. Sweden''s labour-market-driven immigration model requires collective agreement wage levels rather than fixed salary thresholds, making salaries sector-dependent. Sweden has a strong social welfare system, excellent public services, and a high quality of life, offset by high income taxes.',
      '[
        {"question": "How does Sweden work permit sponsorship work?", "answer": "Swedish work permits require employer sponsorship. The employer must offer conditions meeting the collective agreement (kollektivavtal) or industry standard wages and benefits for the role. Migrationsverket processes applications online. Processing typically takes 1-4 months. The employer submits the job offer details; no separate labour market test is required (unlike many EU countries)."},
        {"question": "How much does a Swedish work permit cost?", "answer": "Work permit application fee is SEK 2,000 (approximately USD 190). Family member applications are SEK 1,500 each. These are low government fees by European standards. Legal support adds SEK 10,000-30,000 for complex cases, though many applicants succeed without legal help due to the relatively straightforward online process."},
        {"question": "What salary is required for a Swedish work permit?", "answer": "Sweden does not have a fixed minimum salary threshold like the EU Blue Card. Instead, salaries must meet the collective agreement standard for the relevant occupation and sector. This varies widely: tech workers typically earn SEK 35,000-60,000/month; trades SEK 25,000-35,000/month. The key test is that conditions match what a Swedish employee in the same role would receive."},
        {"question": "How does Sweden''s tax system work for immigrants?", "answer": "Sweden has high income taxes: the municipal rate averages 32%, plus a national tax of 20% on income above SEK 598,500/year (2024). Total effective rates for high earners can exceed 50%. Newly arrived skilled workers may qualify for the Expert Tax Relief (Expertskatt) providing a 25% tax reduction for 7 years, if earning SEK 104,300+/month or meeting a qualifying professional criteria."},
        {"question": "What is the path to Swedish permanent residence?", "answer": "Permanent residence (Permanent uppehallstillstand) requires 4 years of continuous residence on a work permit within the last 5 years. Requirements include stable employment or income throughout the period. Citizenship is possible after 5 years of residence (3 years for marriage to a Swedish citizen). Sweden allows dual citizenship."},
        {"question": "Does Sweden have a digital nomad visa?", "answer": "Sweden does not have a dedicated digital nomad visa. Remote workers from non-EU countries cannot legally live and work in Sweden without a work permit tied to a Swedish employer. Some use the self-employment route (eget foretag) by registering a Swedish sole trader entity, but this has complex requirements. EU citizens can freely live and work in Sweden."},
        {"question": "What is the Personnummer and why is it critical?", "answer": "The Personnummer (personal identification number) is essential for everything in Sweden: banking, healthcare, tax, phone contracts, and government services. It is issued by the Swedish Tax Agency (Skatteverket) after registering as a Swedish resident. If staying less than 12 months you get a coordination number (samordningsnummer) instead. Getting your Personnummer as quickly as possible after arrival is a top priority."}
      ]'::jsonb,
      'The collective agreement wage requirement means salary offers must be verified against sector standards; underpayment can result in permit refusal or revocation. Sweden''s tight housing market, especially in Stockholm, makes finding accommodation challenging; budget high and secure housing before arrival. Processing times at Migrationsverket can extend beyond stated timelines during peak periods.',
      'Confirm your employer is aware of collective agreement wage obligations for your role, register with Skatteverket promptly to obtain your Personnummer, sign up for BankID (digital identity) as it is needed for most Swedish digital services, enroll in Swedish language classes (SFI - Swedish for Immigrants) which are free for residents, and investigate Expert Tax Relief eligibility if your salary qualifies.'
    );
  END IF;

  -- ============================================================
  -- NORWAY
  -- ============================================================
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'norway';
  IF v_id IS NOT NULL THEN
    DELETE FROM immigration_cost_content WHERE country_id = v_id AND pathway_id IS NULL;
    INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
    VALUES (
      v_id, NULL,
      'Norway is an EEA member with some of Europe''s highest wages and a strong social welfare system funded by oil revenues. The Directorate of Immigration (UDI) manages all permits. Norway offers a Skilled Worker permit for those with a qualifying job offer. Oslo and Bergen are the main expat destinations. While not an EU member, Norway is part of Schengen and the EEA, meaning EU/EEA citizens have free movement rights while non-EU nationals face more requirements.',
      '[
        {"question": "What is the Norway Skilled Worker permit?", "answer": "The Skilled Worker permit (Faglert arbeidstaker) requires a job offer with wages matching the standard for the occupation in Norway, either a vocational qualification or higher education, or specialty skills. Application fee NOK 6,300 (approximately USD 580). Processing takes 1-4 months online. Priority processing is available for highly qualified applicants."},
        {"question": "What salary is needed for a Norwegian work permit?", "answer": "Salaries must match Norwegian collective agreement or standard industry rates for the role. As a guide, skilled roles typically pay NOK 50,000-70,000+/month. The minimum for sponsorship is not a fixed number but must demonstrate ability to support yourself. Norway has some of Europe''s highest living costs; Oslo rent averages NOK 15,000-20,000/month for a 1-bedroom."},
        {"question": "How much does Norwegian immigration cost in total?", "answer": "Skilled Worker permit fee: NOK 6,300. Registration in Norway (within 1 week for EEA, within 1 month for non-EEA): NOK 600-1,500. If using a lawyer: NOK 15,000-40,000. Total out-of-pocket costs for non-EEA applicants: NOK 7,000-50,000 depending on legal support used. Settlement permit after 3 years costs NOK 5,900."},
        {"question": "How fast can I get Norwegian permanent residence?", "answer": "A Settlement Permit (Permanent Residence) can be applied for after 3 years of continuous residence on a work permit. You must have had full-time employment throughout, met income requirements each year, and completed 600 hours of Norwegian language and social studies. Application fee NOK 5,900."},
        {"question": "Is Norwegian language required for work permits?", "answer": "Norwegian language is not required for initial work permits. However, 600 hours of Norwegian language and social studies are mandatory for permanent residence. Most integration programmes are free or subsidized through the Intro programme for qualifying applicants. English is widely spoken in professional environments but Norwegian is essential for social integration."},
        {"question": "Can I work in Norway on a tourist visa?", "answer": "No. Working in Norway without a valid work permit is illegal regardless of nationality (except EEA/EU citizens who have free movement). Non-EEA nationals must have their work permit approved before starting work. Many employers will not let employees start before the permit is issued."},
        {"question": "What is D-number and why is it needed for Norway?", "answer": "The D-number (D-nummer) is a temporary identification number for foreign nationals who are not permanent residents. It is required for a Norwegian bank account, tax affairs, and many services. Apply at the Tax Administration (Skatteetaten) at any service center. When you register as a permanent resident you receive a Norwegian National Identity Number (fodselsnummer) replacing the D-number."}
      ]'::jsonb,
      'Norway''s Skilled Worker permit requires the job offer to be in place and wages verified before the permit is issued; you cannot enter Norway and then look for work on this permit. Norwegian living costs are among Europe''s highest; budget carefully. The 600-hour language requirement for PR must be completed through an approved programme. EEA citizens register differently (lower cost) from non-EEA nationals.',
      'Secure a job offer meeting Norwegian wage standards before applying, apply for the Skilled Worker permit online through UDI and register in person at a police station within the first month, obtain your D-number from Skatteetaten for banking and tax, enroll in Norwegian language courses through your municipality, and track your residency days carefully toward the 3-year settlement permit threshold.'
    );
  END IF;

END $$;
