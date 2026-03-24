/*
  # Seed Immigration Cost Content Blocks
  
  SEO content for country and pathway landing pages.
*/

-- Canada country content
INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
SELECT 
  id,
  NULL,
  'Understanding the total cost of immigrating to Canada helps you plan financially for your move. Canada offers multiple immigration pathways including Express Entry, Provincial Nominee Programs, family sponsorship, and study permits. Total costs vary significantly based on your chosen pathway, family size, and whether you use professional immigration services.',
  '[ 
    {"question": "How much does it cost to immigrate to Canada?", "answer": "Total costs range from CAD $3,000 to $20,000+ depending on pathway and family size. This includes government fees, language tests, medical exams, police certificates, credential assessments, and potential legal fees."},
    {"question": "What are proof of funds requirements for Canada?", "answer": "For Express Entry and some other programs, single applicants need CAD $13,310, couples need $16,570, families of 3 need $20,371, and families of 4 need $24,553. These amounts are updated annually."},
    {"question": "Do I need a lawyer to immigrate to Canada?", "answer": "No, immigration lawyers are not required. Many applicants successfully apply on their own. However, legal fees typically range from $2,000-$5,000 if you choose professional help for complex cases."},
    {"question": "How much is the biometrics fee for Canada?", "answer": "Biometrics costs CAD $85 per person or $170 for families of 2 or more applying together."},
    {"question": "Are medical exams expensive for Canadian immigration?", "answer": "Medical examinations cost CAD $200-$500 per person depending on age and location of the panel physician."},
    {"question": "What language tests are accepted for Canada immigration?", "answer": "IELTS General Training ($300-$350) and CELPIP ($280-$300) are accepted for English. TEF Canada is accepted for French. Test fees vary by location."}
  ]'::jsonb,
  'Immigration costs change regularly. Always verify current government fees on the official IRCC website before applying. Exchange rates, legal fees, and relocation costs can vary significantly. The estimates provided are for planning purposes and may not reflect your specific situation.',
  'After estimating costs, review official IRCC program requirements, prepare your documents, take required language tests, and consider booking a consultation with a regulated Canadian immigration consultant (RCIC) if needed.'
FROM immigration_cost_countries WHERE slug = 'canada';

-- United States country content
INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
SELECT 
  id,
  NULL,
  'The cost of immigrating to the United States depends heavily on your chosen pathway. Employment-based green cards, family-based immigration, and temporary work visas each have different fee structures. Legal representation is commonly used for US immigration and can represent a significant portion of total costs.',
  '[
    {"question": "How much does a US green card cost?", "answer": "Employment-based green cards typically cost $2,000-$6,000 in government fees alone. With attorney fees, medical exams, and other expenses, total costs range from $8,000-$25,000."},
    {"question": "How much does an H-1B visa cost?", "answer": "H-1B filing fees range from $460-$2,960 depending on company size and whether premium processing is used. Employers typically pay these costs. Attorney fees add $2,000-$8,000."},
    {"question": "Do I need an immigration attorney for the US?", "answer": "While not legally required, most applicants use attorneys due to complexity of US immigration law. Attorney fees typically range from $2,000 for simple cases to $15,000+ for complex employment or family-based cases."},
    {"question": "What is the biometrics fee for US immigration?", "answer": "The biometrics services fee is $85 per applicant for most immigration benefit requests."},
    {"question": "Are there proof of funds requirements for US visas?", "answer": "Most employment-based visas do not have specific proof of funds requirements, but you must demonstrate ability to support yourself. Family-based immigration requires sponsors to meet income thresholds (125% of poverty guidelines)."}
  ]'::jsonb,
  'US immigration fees are complex and vary by pathway, nationality, and individual circumstances. Processing times can be extremely long (months to years), which may affect overall costs. Always verify current USCIS fees and consult with a qualified US immigration attorney for personalized advice.',
  'Review USCIS official fee schedule, determine your eligible pathway, gather required documentation, and consult with an experienced immigration attorney to understand your specific costs and timeline.'
FROM immigration_cost_countries WHERE slug = 'united-states';

-- Australia country content
INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
SELECT 
  id,
  NULL,
  'Australia offers skilled migration, employer-sponsored visas, family visas, and student visas with transparent fee structures. Visa application charges (VAC) are clearly published by the Department of Home Affairs. Additional costs include skills assessments, English language tests, health examinations, and police checks.',
  '[
    {"question": "How much does Australian permanent residence cost?", "answer": "Skilled visa application charges range from AUD $4,640-$4,770 for the main applicant, with additional fees for partners ($2,320-$2,385) and dependents ($1,160-$1,190). Total costs including assessments and tests typically range from $8,000-$15,000."},
    {"question": "What is a skills assessment and how much does it cost?", "answer": "Skills assessments verify your qualifications match Australian standards. Costs range from $300-$1,200 depending on your occupation and assessing authority."},
    {"question": "Do I need to show proof of funds for Australian visas?", "answer": "While not always mandatory, demonstrating settlement funds is recommended. Many applicants show $15,000-$35,000 depending on family size to demonstrate settlement capacity."},
    {"question": "How much does the partner visa cost in Australia?", "answer": "The partner visa (subclass 820/801 or 309/100) costs AUD $8,850 for the main applicant and $1,465 per child. This is one of the most expensive visa types in Australia."},
    {"question": "What English tests are accepted for Australian immigration?", "answer": "IELTS, PTE Academic, TOEFL iBT, and Cambridge English are accepted. Test fees range from $330-$385."}
  ]'::jsonb,
  'Visa application charges are non-refundable even if your application is refused. Medical examinations are only valid for 12 months. Skills assessments can take 8-12 weeks. Budget for potential additional costs like bridging visas if required.',
  'Check your points score for skilled visas, identify your occupation on the relevant skilled occupation list, book your English test and skills assessment early, and consider engaging a registered migration agent (MARA-registered) if needed.'
FROM immigration_cost_countries WHERE slug = 'australia';

-- United Kingdom country content
INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
SELECT 
  id,
  NULL,
  'UK immigration costs include visa application fees and the mandatory Immigration Health Surcharge (IHS). The IHS provides access to the National Health Service and is paid upfront for the full visa duration. Total costs vary significantly by visa type, duration, and family size.',
  '[
    {"question": "How much does a UK work visa cost?", "answer": "Skilled Worker visa costs £719-£1,420 depending on duration, plus Immigration Health Surcharge of £1,035 per year (paid upfront). For a 3-year visa, total costs range from £3,824-£4,525 before adding family members."},
    {"question": "What is the Immigration Health Surcharge?", "answer": "The IHS is £1,035 per year for most visa types, paid upfront for the entire visa duration. Students and their dependents pay £776 per year. This is mandatory and provides access to NHS services."},
    {"question": "Can my family join me in the UK?", "answer": "Yes, dependents can apply for visas at the same cost as the main applicant for both visa fee and IHS. For a family of three on 3-year Skilled Worker visas, total costs can exceed £11,000 just for visas and IHS."},
    {"question": "Do I need a tuberculosis test for UK immigration?", "answer": "If you are from certain countries, a TB test is mandatory and costs approximately £50-£150 depending on location."},
    {"question": "How much does a UK student visa cost?", "answer": "Student visa application costs £490, plus IHS of £776 per year. You must also show maintenance funds of £1,334/month (up to 9 months) for London or £1,023/month for elsewhere in UK."}
  ]'::jsonb,
  'UK visa fees increase annually, usually in October. Immigration Health Surcharge is non-refundable even if your visa application is refused. Budget carefully for the upfront IHS payment, which can be substantial for long-duration visas or families.',
  'Secure a Certificate of Sponsorship from your employer, prepare financial documents, book required English tests (IELTS UKVI or equivalent), and pay IHS before submitting your visa application.'
FROM immigration_cost_countries WHERE slug = 'united-kingdom';

-- Germany country content
INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
SELECT 
  id,
  NULL,
  'Germany offers accessible skilled immigration pathways with relatively modest government fees. The EU Blue Card is popular for highly qualified professionals. Key costs include visa fees, health insurance, qualification recognition, and document translations with apostilles.',
  '[
    {"question": "How much does the EU Blue Card cost?", "answer": "The residence permit fee is €100-€140. However, qualification recognition costs €200-€600, document translations can add €150-€500, and health insurance is mandatory at approximately €100-€300 per month."},
    {"question": "Do I need to recognize my qualifications for Germany?", "answer": "For regulated professions, qualification recognition is mandatory and costs vary. For the EU Blue Card, recognition is often recommended to meet salary thresholds and can cost €200-€600 depending on your profession."},
    {"question": "What are the salary requirements for EU Blue Card?", "answer": "The minimum salary threshold is €45,300 (2026) for most professions, or €41,041.80 for shortage occupations like IT, engineers, and healthcare professionals."},
    {"question": "Is health insurance expensive in Germany?", "answer": "Public health insurance costs approximately 14.6% of gross salary (split between employer and employee). Private insurance for visa applications starts around €100/month. Insurance is mandatory from day one."},
    {"question": "Do I need German language skills?", "answer": "The EU Blue Card and skilled worker residence permits do not require German language skills initially. However, learning German is highly recommended for integration and career advancement."}
  ]'::jsonb,
  'All documents must be translated by certified translators and often require apostilles, which adds to costs. Processing times vary by city (faster in larger cities like Berlin, Munich). Blocked accounts may be required for job seeker visas. Start health insurance from your first day in Germany.',
  'Get qualifications recognized if needed, secure job offer meeting salary thresholds, translate and apostille documents, arrange health insurance, and apply for visa at German embassy/consulate.'
FROM immigration_cost_countries WHERE slug = 'germany';

-- Portugal country content
INSERT INTO immigration_cost_content (country_id, pathway_id, intro_md, faq_json, warning_md, next_steps_md)
SELECT 
  id,
  NULL,
  'Portugal has become a popular destination for digital nomads, retirees, and remote workers through the D7 passive income visa and digital nomad visa. Costs are relatively modest compared to other European countries, but legal support is commonly used due to bureaucratic processes.',
  '[
    {"question": "How much does the Portugal D7 visa cost?", "answer": "The visa application fee is €90. Including legal fees (€1,500-€5,000), document preparation, translations, and apostilles, total costs typically range from €2,500-€8,000."},
    {"question": "What are the income requirements for D7 visa?", "answer": "You must show passive income of at least €9,870/year (Portuguese minimum wage) for a single applicant, with 50% additional for a spouse and 30% for each child."},
    {"question": "Do I need a lawyer for Portugal immigration?", "answer": "While not legally required, most applicants use lawyers or consultants due to complex bureaucracy and document requirements. Legal fees range from €1,500-€5,000."},
    {"question": "What is the Portugal Digital Nomad visa?", "answer": "A temporary residence visa for remote workers employed by non-Portuguese companies. Application costs are similar to D7, around €80-€90, with income requirements of approximately €3,280/month."},
    {"question": "Can I get Portuguese citizenship?", "answer": "After 5 years of legal residence with basic Portuguese language skills, you can apply for citizenship. Portugal allows dual citizenship."}
  ]'::jsonb,
  'Portuguese bureaucracy can be slow. NIF (tax number) is required before most steps. Criminal record checks must be from all countries you have lived in the past year. Bank statements must show consistent income. Budget 6-12 months for the full process.',
  'Obtain NIF, open Portuguese bank account, gather documents (apostilled and translated), demonstrate passive income or remote employment, consider engaging Portuguese immigration lawyer, and apply at Portuguese embassy/consulate.'
FROM immigration_cost_countries WHERE slug = 'portugal';