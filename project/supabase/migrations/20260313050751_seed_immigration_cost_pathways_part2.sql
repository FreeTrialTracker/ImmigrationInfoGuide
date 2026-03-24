/*
  # Seed Immigration Cost Pathways - Part 2
  
  Continues seeding pathways for remaining European and Asian countries.
*/

-- France pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Talent Passport',
  'talent-passport',
  'Skilled Worker',
  'Multi-year residence for highly skilled professionals, investors, and researchers.',
  true,
  10,
  'France Talent Passport Cost Calculator',
  'Calculate France Talent Passport costs including visa fees, prefecture registration, and documentation.'
FROM immigration_cost_countries WHERE slug = 'france'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at French university or grande école.',
  true,
  20,
  'France Student Visa Cost Calculator',
  'Estimate France student visa costs including Campus France fees, visa application, and residence permit.'
FROM immigration_cost_countries WHERE slug = 'france'
UNION ALL
SELECT 
  id,
  'Family Reunification',
  'family-reunification',
  'Family',
  'Join family member who is French resident.',
  true,
  30,
  'France Family Reunification Cost Calculator',
  'Calculate family reunification costs for France including visa fees and integration requirements.'
FROM immigration_cost_countries WHERE slug = 'france'
UNION ALL
SELECT 
  id,
  'Employee / Work Visa',
  'employee-work-visa',
  'Work Visa',
  'Employment-based residence with employer sponsorship.',
  true,
  40,
  'France Work Visa Cost Calculator',
  'Estimate France work visa costs including application, OFII fees, and medical examination.'
FROM immigration_cost_countries WHERE slug = 'france';

-- Netherlands pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Highly Skilled Migrant Visa',
  'highly-skilled-migrant',
  'Skilled Worker',
  'Fast-track residence for professionals with recognized sponsor.',
  true,
  10,
  'Netherlands Highly Skilled Migrant Cost Calculator',
  'Calculate Netherlands highly skilled migrant costs including visa fees, IND charges, and legalization.'
FROM immigration_cost_countries WHERE slug = 'netherlands'
UNION ALL
SELECT 
  id,
  'Startup Visa',
  'startup-visa',
  'Investor',
  'Residence for entrepreneurs with innovative business plan.',
  false,
  20,
  'Netherlands Startup Visa Cost Calculator',
  'Estimate Netherlands startup visa costs including facilitation agreement and business requirements.'
FROM immigration_cost_countries WHERE slug = 'netherlands'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at Dutch university or educational institution.',
  true,
  30,
  'Netherlands Student Visa Cost Calculator',
  'Calculate Netherlands student visa costs including MVV, residence permit, and health insurance.'
FROM immigration_cost_countries WHERE slug = 'netherlands'
UNION ALL
SELECT 
  id,
  'Partner / Spouse Visa',
  'partner-spouse-visa',
  'Family',
  'Join partner who is Dutch citizen or resident.',
  true,
  40,
  'Netherlands Partner Visa Cost Calculator',
  'Estimate Netherlands partner visa costs including civic integration exam and application fees.'
FROM immigration_cost_countries WHERE slug = 'netherlands';

-- Sweden pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Work Permit',
  'work-permit',
  'Work Visa',
  'Employment-based residence with job offer.',
  true,
  10,
  'Sweden Work Permit Cost Calculator',
  'Calculate Sweden work permit costs including application fees and insurance requirements.'
FROM immigration_cost_countries WHERE slug = 'sweden'
UNION ALL
SELECT 
  id,
  'Study Permit',
  'study-permit',
  'Student',
  'Study at Swedish university.',
  true,
  20,
  'Sweden Study Permit Cost Calculator',
  'Estimate Sweden study permit costs including application fees and proof of funds.'
FROM immigration_cost_countries WHERE slug = 'sweden'
UNION ALL
SELECT 
  id,
  'Family Reunification',
  'family-reunification',
  'Family',
  'Join family member in Sweden.',
  true,
  30,
  'Sweden Family Reunification Cost Calculator',
  'Calculate Sweden family reunification costs including visa application and maintenance requirements.'
FROM immigration_cost_countries WHERE slug = 'sweden';

-- Switzerland pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Work Permit (B / L)',
  'work-permit',
  'Work Visa',
  'Employment-based residence permit.',
  true,
  10,
  'Switzerland Work Permit Cost Calculator',
  'Calculate Switzerland work permit costs including cantonal fees and health insurance.'
FROM immigration_cost_countries WHERE slug = 'switzerland'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at Swiss university or institution.',
  true,
  20,
  'Switzerland Student Visa Cost Calculator',
  'Estimate Switzerland student visa costs including application fees and blocked funds.'
FROM immigration_cost_countries WHERE slug = 'switzerland'
UNION ALL
SELECT 
  id,
  'Family Reunification',
  'family-reunification',
  'Family',
  'Join spouse or family member in Switzerland.',
  true,
  30,
  'Switzerland Family Reunification Cost Calculator',
  'Calculate Switzerland family reunification costs including residence permit and insurance.'
FROM immigration_cost_countries WHERE slug = 'switzerland';

-- Italy pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Work Visa - Decree Flows',
  'work-visa-decree-flows',
  'Work Visa',
  'Employment-based residence through annual quota system.',
  true,
  10,
  'Italy Work Visa Cost Calculator',
  'Calculate Italy work visa costs including nulla osta, visa application, and residence permit.'
FROM immigration_cost_countries WHERE slug = 'italy'
UNION ALL
SELECT 
  id,
  'Elective Residence Visa',
  'elective-residence-visa',
  'Retirement',
  'Residence for financially independent individuals without work.',
  true,
  20,
  'Italy Elective Residence Visa Cost Calculator',
  'Estimate Italy elective residence costs including income requirements and visa fees.'
FROM immigration_cost_countries WHERE slug = 'italy'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at Italian university.',
  true,
  30,
  'Italy Student Visa Cost Calculator',
  'Calculate Italy student visa costs including visa application and residence permit fees.'
FROM immigration_cost_countries WHERE slug = 'italy'
UNION ALL
SELECT 
  id,
  'Digital Nomad Visa',
  'digital-nomad-visa',
  'Digital Nomad',
  'Residence for remote workers.',
  false,
  40,
  'Italy Digital Nomad Visa Cost Calculator',
  'Estimate Italy digital nomad visa costs including application and income requirements.'
FROM immigration_cost_countries WHERE slug = 'italy';

-- Singapore pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Employment Pass',
  'employment-pass',
  'Skilled Worker',
  'Work pass for foreign professionals, managers, and executives.',
  true,
  10,
  'Singapore Employment Pass Cost Calculator',
  'Calculate Singapore Employment Pass costs including application fees and security bond.'
FROM immigration_cost_countries WHERE slug = 'singapore'
UNION ALL
SELECT 
  id,
  'EntrePass',
  'entrepass',
  'Investor',
  'Pass for entrepreneurs starting business in Singapore.',
  false,
  20,
  'Singapore EntrePass Cost Calculator',
  'Estimate Singapore EntrePass costs including application and business requirements.'
FROM immigration_cost_countries WHERE slug = 'singapore'
UNION ALL
SELECT 
  id,
  'Student Pass',
  'student-pass',
  'Student',
  'Study at approved Singapore educational institution.',
  true,
  30,
  'Singapore Student Pass Cost Calculator',
  'Calculate Singapore Student Pass costs including application fees and insurance.'
FROM immigration_cost_countries WHERE slug = 'singapore'
UNION ALL
SELECT 
  id,
  'Dependant Pass',
  'dependant-pass',
  'Family',
  'For spouse and children of Employment Pass or EntrePass holders.',
  true,
  40,
  'Singapore Dependant Pass Cost Calculator',
  'Estimate Singapore Dependant Pass costs for family members.'
FROM immigration_cost_countries WHERE slug = 'singapore';

-- Japan pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Engineer / Specialist in Humanities Work Visa',
  'engineer-humanities-work-visa',
  'Work Visa',
  'Work visa for engineers, IT professionals, and business roles.',
  true,
  10,
  'Japan Work Visa Cost Calculator | Engineer Specialist',
  'Calculate Japan work visa costs including COE application, visa fees, and residence card.'
FROM immigration_cost_countries WHERE slug = 'japan'
UNION ALL
SELECT 
  id,
  'Highly Skilled Professional Visa',
  'highly-skilled-professional',
  'Skilled Worker',
  'Points-based visa with preferential treatment.',
  true,
  20,
  'Japan Highly Skilled Professional Visa Cost Calculator',
  'Estimate Japan highly skilled professional visa costs and points requirements.'
FROM immigration_cost_countries WHERE slug = 'japan'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at Japanese language school or university.',
  true,
  30,
  'Japan Student Visa Cost Calculator',
  'Calculate Japan student visa costs including COE, visa application, and proof of funds.'
FROM immigration_cost_countries WHERE slug = 'japan'
UNION ALL
SELECT 
  id,
  'Spouse Visa',
  'spouse-visa',
  'Family',
  'For spouse of Japanese national or permanent resident.',
  true,
  40,
  'Japan Spouse Visa Cost Calculator',
  'Estimate Japan spouse visa costs including application and documentation fees.'
FROM immigration_cost_countries WHERE slug = 'japan';

-- South Korea pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'E-7 Work Visa',
  'e7-work-visa',
  'Work Visa',
  'Work visa for specially designated activities including professionals.',
  true,
  10,
  'South Korea E-7 Work Visa Cost Calculator',
  'Calculate South Korea E-7 work visa costs including visa fees and document authentication.'
FROM immigration_cost_countries WHERE slug = 'south-korea'
UNION ALL
SELECT 
  id,
  'D-2 Student Visa',
  'd2-student-visa',
  'Student',
  'Study at Korean university.',
  true,
  20,
  'South Korea Student Visa Cost Calculator | D-2',
  'Estimate South Korea D-2 student visa costs including application and registration fees.'
FROM immigration_cost_countries WHERE slug = 'south-korea'
UNION ALL
SELECT 
  id,
  'F-6 Marriage Visa',
  'f6-marriage-visa',
  'Family',
  'For spouse of Korean national.',
  true,
  30,
  'South Korea Marriage Visa Cost Calculator | F-6',
  'Calculate South Korea F-6 marriage visa costs including application and interview fees.'
FROM immigration_cost_countries WHERE slug = 'south-korea';

-- Thailand pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Non-O Retirement Visa',
  'non-o-retirement-visa',
  'Retirement',
  'Long-term stay for retirees over 50.',
  true,
  10,
  'Thailand Retirement Visa Cost Calculator | Non-O',
  'Calculate Thailand retirement visa costs including visa fees, insurance, and bank deposit requirements.'
FROM immigration_cost_countries WHERE slug = 'thailand'
UNION ALL
SELECT 
  id,
  'Non-B Work Visa',
  'non-b-work-visa',
  'Work Visa',
  'Business visa leading to work permit.',
  true,
  20,
  'Thailand Work Visa Cost Calculator | Non-B',
  'Estimate Thailand Non-B work visa and work permit costs including application fees.'
FROM immigration_cost_countries WHERE slug = 'thailand'
UNION ALL
SELECT 
  id,
  'Long-Term Resident (LTR) Visa',
  'ltr-visa',
  'Digital Nomad',
  'Ten-year visa for wealthy, professionals, and remote workers.',
  false,
  30,
  'Thailand LTR Visa Cost Calculator',
  'Calculate Thailand Long-Term Resident visa costs including application and income requirements.'
FROM immigration_cost_countries WHERE slug = 'thailand'
UNION ALL
SELECT 
  id,
  'Education Visa',
  'education-visa',
  'Student',
  'Study Thai language or attend educational institution.',
  true,
  40,
  'Thailand Education Visa Cost Calculator',
  'Estimate Thailand education visa costs including visa fees and school enrollment.'
FROM immigration_cost_countries WHERE slug = 'thailand';

-- UAE pathways
INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order, seo_title, seo_description)
SELECT 
  id,
  'Employment Visa',
  'employment-visa',
  'Work Visa',
  'Work permit with employer sponsorship.',
  true,
  10,
  'UAE Employment Visa Cost Calculator',
  'Calculate UAE employment visa costs including entry permit, medical, Emirates ID, and visa stamping.'
FROM immigration_cost_countries WHERE slug = 'united-arab-emirates'
UNION ALL
SELECT 
  id,
  'Golden Visa - Investor',
  'golden-visa-investor',
  'Investor',
  'Long-term residence for investors, entrepreneurs, and professionals.',
  false,
  20,
  'UAE Golden Visa Cost Calculator',
  'Estimate UAE Golden Visa costs including application, medical tests, and Emirates ID.'
FROM immigration_cost_countries WHERE slug = 'united-arab-emirates'
UNION ALL
SELECT 
  id,
  'Remote Work Visa',
  'remote-work-visa',
  'Digital Nomad',
  'One-year visa for remote workers employed abroad.',
  true,
  30,
  'UAE Remote Work Visa Cost Calculator',
  'Calculate UAE remote work visa costs including application and income proof requirements.'
FROM immigration_cost_countries WHERE slug = 'united-arab-emirates'
UNION ALL
SELECT 
  id,
  'Student Visa',
  'student-visa',
  'Student',
  'Study at UAE educational institution.',
  true,
  40,
  'UAE Student Visa Cost Calculator',
  'Estimate UAE student visa costs including application fees and medical examination.'
FROM immigration_cost_countries WHERE slug = 'united-arab-emirates';