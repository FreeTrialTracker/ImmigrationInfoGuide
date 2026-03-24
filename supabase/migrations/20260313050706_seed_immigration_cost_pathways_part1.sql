/*
  # Seed Immigration Cost Pathways - Part 1
  
  Creates realistic immigration pathways for major destination countries.
  Part 1: North America, Oceania, and top European destinations
*/

-- Canada pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Express Entry - Skilled Worker',
  'express-entry-skilled-worker',
  'Skilled Worker',
  'Fast-track permanent residence for skilled professionals through the Express Entry system.',
  true,
  10,
  'Canada Express Entry Skilled Worker Cost | Immigration Cost Calculator',
  'Calculate the total cost of immigrating to Canada through Express Entry. Includes government fees, medical exams, language tests, and settlement funds.'
FROM immigration_cost_countries WHERE slug = 'canada'
UNION ALL
SELECT 
  id,
  'Provincial Nominee Program (PNP)',
  'provincial-nominee-program',
  'Skilled Worker',
  'Provincial nomination for permanent residence through specific province programs.',
  true,
  20,
  'Canada Provincial Nominee Program Cost | PNP Immigration Calculator',
  'Estimate costs for Canada Provincial Nominee Program including application fees, settlement funds, and relocation expenses.'
FROM immigration_cost_countries WHERE slug = 'canada'
UNION ALL
SELECT 
  id,
  'Family Sponsorship',
  'family-sponsorship',
  'Family',
  'Sponsor your spouse, parents, or dependent children for permanent residence.',
  true,
  30,
  'Canada Family Sponsorship Cost | Spouse & Parent Immigration',
  'Calculate costs for sponsoring family members to Canada including processing fees and proof of income requirements.'
FROM immigration_cost_countries WHERE slug = 'canada'
UNION ALL
SELECT 
  id,
  'Study Permit',
  'study-permit',
  'Student',
  'Study at a designated learning institution in Canada.',
  true,
  40,
  'Canada Study Permit Cost | Student Visa Calculator',
  'Estimate the full cost of studying in Canada including visa fees, biometrics, medical exam, and proof of funds.'
FROM immigration_cost_countries WHERE slug = 'canada';

-- United States pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Employment-Based Green Card (EB-2/EB-3)',
  'employment-based-green-card',
  'Skilled Worker',
  'Permanent residence through employer sponsorship for professionals and skilled workers.',
  true,
  10,
  'US Employment-Based Green Card Cost | EB-2 EB-3 Immigration',
  'Calculate costs for US employment-based green card including PERM labor certification, I-140, I-485, and legal fees.'
FROM immigration_cost_countries WHERE slug = 'united-states'
UNION ALL
SELECT 
  id,
  'H-1B Work Visa',
  'h1b-work-visa',
  'Work Visa',
  'Temporary work visa for specialty occupations requiring bachelor degree or higher.',
  true,
  20,
  'H-1B Visa Cost Calculator | US Work Visa Expenses',
  'Estimate H-1B visa costs including filing fees, premium processing, attorney fees, and dependent costs.'
FROM immigration_cost_countries WHERE slug = 'united-states'
UNION ALL
SELECT 
  id,
  'Family-Based Immigration',
  'family-based-immigration',
  'Family',
  'Green card through immediate relative or family preference categories.',
  true,
  30,
  'US Family-Based Green Card Cost | Spouse & Parent Immigration',
  'Calculate family-based immigration costs including I-130, I-485, medical exam, and biometrics fees.'
FROM immigration_cost_countries WHERE slug = 'united-states'
UNION ALL
SELECT 
  id,
  'F-1 Student Visa',
  'f1-student-visa',
  'Student',
  'Study at accredited US college or university.',
  true,
  40,
  'F-1 Student Visa Cost Calculator | US Study Expenses',
  'Estimate F-1 visa costs including SEVIS fee, visa application, and proof of financial support.'
FROM immigration_cost_countries WHERE slug = 'united-states'
UNION ALL
SELECT 
  id,
  'EB-5 Investor Visa',
  'eb5-investor-visa',
  'Investor',
  'Green card through investment of $800K-$1.05M in US business.',
  false,
  50,
  'EB-5 Investor Visa Cost | US Immigration Investment Calculator',
  'Calculate EB-5 investor visa costs including investment amount, administrative fees, and legal expenses.'
FROM immigration_cost_countries WHERE slug = 'united-states';

-- Australia pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Skilled Independent Visa (Subclass 189)',
  'skilled-independent-visa-189',
  'Skilled Worker',
  'Points-based permanent residence for skilled workers without employer sponsorship.',
  true,
  10,
  'Australia Skilled Independent Visa 189 Cost Calculator',
  'Calculate costs for Australia Subclass 189 visa including skills assessment, English test, medical, and visa application fees.'
FROM immigration_cost_countries WHERE slug = 'australia'
UNION ALL
SELECT 
  id,
  'Employer Sponsored Visa (Subclass 186)',
  'employer-sponsored-visa-186',
  'Work Visa',
  'Permanent residence through employer nomination.',
  true,
  20,
  'Australia Employer Sponsored Visa 186 Cost | ENS Calculator',
  'Estimate costs for Subclass 186 Employer Nomination Scheme including nomination and visa application fees.'
FROM immigration_cost_countries WHERE slug = 'australia'
UNION ALL
SELECT 
  id,
  'Partner Visa (Subclass 820/801)',
  'partner-visa-820-801',
  'Family',
  'Permanent residence for spouses and de facto partners of Australian citizens or PR holders.',
  true,
  30,
  'Australia Partner Visa Cost Calculator | Spouse Visa 820/801',
  'Calculate partner visa costs including application fees, police checks, medical exams, and migration agent fees.'
FROM immigration_cost_countries WHERE slug = 'australia'
UNION ALL
SELECT 
  id,
  'Student Visa (Subclass 500)',
  'student-visa-500',
  'Student',
  'Study at Australian educational institution.',
  true,
  40,
  'Australia Student Visa 500 Cost Calculator',
  'Estimate student visa costs including visa fees, health insurance, English tests, and proof of funds.'
FROM immigration_cost_countries WHERE slug = 'australia'
UNION ALL
SELECT 
  id,
  'Business Innovation and Investment (Subclass 188)',
  'business-investment-visa-188',
  'Investor',
  'Temporary visa for business owners and investors.',
  false,
  50,
  'Australia Business Investment Visa 188 Cost Calculator',
  'Calculate costs for Subclass 188 visa including state nomination, visa fees, and investment requirements.'
FROM immigration_cost_countries WHERE slug = 'australia';

-- New Zealand pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Skilled Migrant Category Resident Visa',
  'skilled-migrant-category',
  'Skilled Worker',
  'Points-based residence for skilled workers.',
  true,
  10,
  'New Zealand Skilled Migrant Visa Cost Calculator',
  'Calculate NZ skilled migrant visa costs including EOI, medical, police certificates, and settlement funds.'
FROM immigration_cost_countries WHERE slug = 'new-zealand'
UNION ALL
SELECT 
  id,
  'Work to Residence Visa',
  'work-to-residence',
  'Work Visa',
  'Pathway to residence through skilled employment.',
  true,
  20,
  'New Zealand Work to Residence Visa Cost Calculator',
  'Estimate work to residence visa costs including job offer requirements and application fees.'
FROM immigration_cost_countries WHERE slug = 'new-zealand'
UNION ALL
SELECT 
  id,
  'Partnership Visa',
  'partnership-visa',
  'Family',
  'Residence for partners of NZ citizens or residents.',
  true,
  30,
  'New Zealand Partnership Visa Cost Calculator',
  'Calculate partnership visa costs including medical exams, police certificates, and relationship evidence.'
FROM immigration_cost_countries WHERE slug = 'new-zealand'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at NZ educational institution.',
  true,
  40,
  'New Zealand Student Visa Cost Calculator',
  'Estimate student visa costs including visa fees, insurance, and proof of funds requirements.'
FROM immigration_cost_countries WHERE slug = 'new-zealand';

-- United Kingdom pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Skilled Worker Visa',
  'skilled-worker-visa',
  'Skilled Worker',
  'Work in UK with sponsorship from licensed employer.',
  true,
  10,
  'UK Skilled Worker Visa Cost Calculator',
  'Calculate UK Skilled Worker visa costs including visa fees, healthcare surcharge, biometrics, and sponsorship.'
FROM immigration_cost_countries WHERE slug = 'united-kingdom'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at UK university or college.',
  true,
  20,
  'UK Student Visa Cost Calculator | Tier 4 Expenses',
  'Estimate UK student visa costs including visa application, healthcare surcharge, tuberculosis test, and maintenance funds.'
FROM immigration_cost_countries WHERE slug = 'united-kingdom'
UNION ALL
SELECT 
  id,
  'Spouse / Partner Visa',
  'spouse-partner-visa',
  'Family',
  'Join UK citizen or settled person as spouse or partner.',
  true,
  30,
  'UK Spouse Visa Cost Calculator | Partner Visa Expenses',
  'Calculate UK spouse visa costs including application fees, healthcare surcharge, English test, and financial requirements.'
FROM immigration_cost_countries WHERE slug = 'united-kingdom'
UNION ALL
SELECT 
  id,
  'Innovator Founder Visa',
  'innovator-founder-visa',
  'Investor',
  'Start innovative business in UK with endorsement.',
  false,
  40,
  'UK Innovator Founder Visa Cost Calculator',
  'Estimate costs for UK Innovator Founder visa including endorsement, application fees, and business investment.'
FROM immigration_cost_countries WHERE slug = 'united-kingdom'
UNION ALL
SELECT 
  id,
  'Global Talent Visa',
  'global-talent-visa',
  'Skilled Worker',
  'For leaders or potential leaders in academia, research, arts, or tech.',
  false,
  50,
  'UK Global Talent Visa Cost Calculator',
  'Calculate UK Global Talent visa costs including endorsement fees and visa application expenses.'
FROM immigration_cost_countries WHERE slug = 'united-kingdom';

-- Germany pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'EU Blue Card',
  'eu-blue-card',
  'Skilled Worker',
  'Residence permit for highly qualified professionals with job offer.',
  true,
  10,
  'Germany EU Blue Card Cost Calculator',
  'Calculate EU Blue Card costs including visa fees, insurance, translations, and recognition of qualifications.'
FROM immigration_cost_countries WHERE slug = 'germany'
UNION ALL
SELECT 
  id,
  'Job Seeker Visa',
  'job-seeker-visa',
  'Work Visa',
  'Six-month visa to search for qualified employment.',
  true,
  20,
  'Germany Job Seeker Visa Cost Calculator',
  'Estimate job seeker visa costs including application fees, blocked account, and insurance requirements.'
FROM immigration_cost_countries WHERE slug = 'germany'
UNION ALL
SELECT 
  id,
  'Family Reunification',
  'family-reunification',
  'Family',
  'Join family member who is German resident or citizen.',
  true,
  30,
  'Germany Family Reunification Visa Cost Calculator',
  'Calculate family reunification costs including visa fees, German language tests, and insurance.'
FROM immigration_cost_countries WHERE slug = 'germany'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at German university or college.',
  true,
  40,
  'Germany Student Visa Cost Calculator',
  'Estimate student visa costs including blocked account, visa fees, insurance, and language requirements.'
FROM immigration_cost_countries WHERE slug = 'germany';

-- Portugal pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'D7 Passive Income Visa',
  'd7-passive-income-visa',
  'Retirement',
  'Residence for retirees and those with passive income.',
  true,
  10,
  'Portugal D7 Visa Cost Calculator | Passive Income Requirements',
  'Calculate Portugal D7 visa costs including application fees, proof of income, health insurance, and legal fees.'
FROM immigration_cost_countries WHERE slug = 'portugal'
UNION ALL
SELECT 
  id,
  'Digital Nomad Visa',
  'digital-nomad-visa',
  'Digital Nomad',
  'Temporary residence for remote workers and freelancers.',
  true,
  20,
  'Portugal Digital Nomad Visa Cost Calculator',
  'Estimate Portugal digital nomad visa costs including application fees, income proof, and accommodation requirements.'
FROM immigration_cost_countries WHERE slug = 'portugal'
UNION ALL
SELECT 
  id,
  'Golden Visa - Investment',
  'golden-visa-investment',
  'Investor',
  'Residence through real estate, capital transfer, or business investment.',
  false,
  30,
  'Portugal Golden Visa Cost Calculator | Investment Requirements',
  'Calculate Portugal Golden Visa costs including investment amounts, legal fees, and residency expenses.'
FROM immigration_cost_countries WHERE slug = 'portugal'
UNION ALL
SELECT 
  id,
  'Work Visa',
  'work-visa',
  'Work Visa',
  'Employment-based residence permit.',
  true,
  40,
  'Portugal Work Visa Cost Calculator',
  'Estimate Portugal work visa costs including application fees, authentication, and translation expenses.'
FROM immigration_cost_countries WHERE slug = 'portugal';

-- Spain pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Digital Nomad Visa',
  'digital-nomad-visa',
  'Digital Nomad',
  'Residence for remote workers employed by non-Spanish companies.',
  true,
  10,
  'Spain Digital Nomad Visa Cost Calculator',
  'Calculate Spain digital nomad visa costs including application fees, income requirements, and health insurance.'
FROM immigration_cost_countries WHERE slug = 'spain'
UNION ALL
SELECT 
  id,
  'Non-Lucrative Visa',
  'non-lucrative-visa',
  'Retirement',
  'Residence without work authorization for financially independent individuals.',
  true,
  20,
  'Spain Non-Lucrative Visa Cost Calculator',
  'Estimate Spain non-lucrative visa costs including proof of income, health insurance, and application fees.'
FROM immigration_cost_countries WHERE slug = 'spain'
UNION ALL
SELECT 
  id,
  'Work Visa',
  'work-visa',
  'Work Visa',
  'Employment-based residence permit with job offer.',
  true,
  30,
  'Spain Work Visa Cost Calculator',
  'Calculate Spain work visa costs including authorization fees, medical certificate, and translation expenses.'
FROM immigration_cost_countries WHERE slug = 'spain'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at Spanish educational institution.',
  true,
  40,
  'Spain Student Visa Cost Calculator',
  'Estimate Spain student visa costs including application fees, insurance, and proof of funds.'
FROM immigration_cost_countries WHERE slug = 'spain';

-- Ireland pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Critical Skills Employment Permit',
  'critical-skills-employment-permit',
  'Skilled Worker',
  'Fast-track work permit for occupations on critical skills list.',
  true,
  10,
  'Ireland Critical Skills Permit Cost Calculator',
  'Calculate Ireland critical skills employment permit costs including application fees and legal requirements.'
FROM immigration_cost_countries WHERE slug = 'ireland'
UNION ALL
SELECT 
  id,
  'General Employment Permit',
  'general-employment-permit',
  'Work Visa',
  'Work permit for employment not on ineligible list.',
  true,
  20,
  'Ireland General Employment Permit Cost Calculator',
  'Estimate Ireland general employment permit costs including visa application and employment fees.'
FROM immigration_cost_countries WHERE slug = 'ireland'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at recognized Irish educational institution.',
  true,
  30,
  'Ireland Student Visa Cost Calculator',
  'Calculate Ireland student visa costs including registration, insurance, and proof of funds.'
FROM immigration_cost_countries WHERE slug = 'ireland'
UNION ALL
SELECT 
  id,
  'Join Family Visa',
  'join-family-visa',
  'Family',
  'Join family member who is Irish citizen or stamp 4 holder.',
  true,
  40,
  'Ireland Join Family Visa Cost Calculator',
  'Estimate costs for joining family in Ireland including visa application and documentation fees.'
FROM immigration_cost_countries WHERE slug = 'ireland';