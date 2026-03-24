/*
  # Seed Immigration Cost Pathways - Part 3
  
  Completes pathway seeding for remaining countries with 1-3 pathways each.
*/

-- Add pathways for remaining countries (simplified for brevity)
-- Each gets 2-3 core pathways

INSERT INTO immigration_cost_pathways (country_id, pathway_name, pathway_slug, category, short_description, is_popular, display_order) VALUES

-- Mexico
((SELECT id FROM immigration_cost_countries WHERE slug = 'mexico'), 'Temporary Resident Visa', 'temporary-resident-visa', 'Retirement', 'Residence for retirees or those with passive income.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'mexico'), 'Work Visa', 'work-visa', 'Work Visa', 'Employment authorization with job offer.', true, 20),
((SELECT id FROM immigration_cost_countries WHERE slug = 'mexico'), 'Student Visa', 'student-visa', 'Student', 'Study at Mexican institution.', true, 30),

-- Brazil
((SELECT id FROM immigration_cost_countries WHERE slug = 'brazil'), 'Work Visa (VITEM V)', 'work-visa', 'Work Visa', 'Employment-based temporary visa.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'brazil'), 'Digital Nomad Visa (VITEM I)', 'digital-nomad-visa', 'Digital Nomad', 'Temporary visa for remote workers.', true, 20),
((SELECT id FROM immigration_cost_countries WHERE slug = 'brazil'), 'Family Reunion', 'family-reunion', 'Family', 'Join Brazilian family member.', true, 30),

-- Argentina
((SELECT id FROM immigration_cost_countries WHERE slug = 'argentina'), 'Rentista Visa', 'rentista-visa', 'Retirement', 'Residence through passive income.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'argentina'), 'Work Visa', 'work-visa', 'Work Visa', 'Employment authorization.', true, 20),
((SELECT id FROM immigration_cost_countries WHERE slug = 'argentina'), 'Student Visa', 'student-visa', 'Student', 'Study in Argentina.', true, 30),

-- Chile
((SELECT id FROM immigration_cost_countries WHERE slug = 'chile'), 'Temporary Residence - Work', 'temporary-residence-work', 'Work Visa', 'Work contract residence.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'chile'), 'Temporary Residence - Investor', 'temporary-residence-investor', 'Investor', 'Business or investment residence.', false, 20),

-- Colombia
((SELECT id FROM immigration_cost_countries WHERE slug = 'colombia'), 'Migrant Visa (M)', 'migrant-visa', 'Work Visa', 'Work or investment visa.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'colombia'), 'Digital Nomad Visa (V)', 'digital-nomad-visa', 'Digital Nomad', 'Remote worker visa.', true, 20),

-- Peru
((SELECT id FROM immigration_cost_countries WHERE slug = 'peru'), 'Work Visa', 'work-visa', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'peru'), 'Student Visa', 'student-visa', 'Student', 'Study in Peru.', true, 20),

-- China
((SELECT id FROM immigration_cost_countries WHERE slug = 'china'), 'Z Visa - Work', 'z-visa-work', 'Work Visa', 'Work permit and residence.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'china'), 'X Visa - Study', 'x-visa-study', 'Student', 'Student visa.', true, 20),

-- India
((SELECT id FROM immigration_cost_countries WHERE slug = 'india'), 'Employment Visa', 'employment-visa', 'Work Visa', 'Work authorization for foreign nationals.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'india'), 'Student Visa', 'student-visa', 'Student', 'Study at Indian institution.', true, 20),

-- Indonesia
((SELECT id FROM immigration_cost_countries WHERE slug = 'indonesia'), 'KITAS Work Permit', 'kitas-work-permit', 'Work Visa', 'Limited stay permit for employment.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'indonesia'), 'Business Visa', 'business-visa', 'Investor', 'Business and investment purposes.', false, 20),

-- Malaysia
((SELECT id FROM immigration_cost_countries WHERE slug = 'malaysia'), 'Employment Pass', 'employment-pass', 'Work Visa', 'Professional work authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'malaysia'), 'MM2H - Retirement', 'mm2h-retirement', 'Retirement', 'Malaysia My Second Home program.', true, 20),

-- Philippines
((SELECT id FROM immigration_cost_countries WHERE slug = 'philippines'), 'Work Visa (9G)', 'work-visa-9g', 'Work Visa', 'Pre-arranged employment.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'philippines'), 'SRRV - Retirement', 'srrv-retirement', 'Retirement', 'Special Resident Retiree Visa.', true, 20),

-- Vietnam
((SELECT id FROM immigration_cost_countries WHERE slug = 'vietnam'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'vietnam'), 'Business Visa', 'business-visa', 'Investor', 'Business activities.', false, 20),

-- Turkey
((SELECT id FROM immigration_cost_countries WHERE slug = 'turkey'), 'Residence Permit', 'residence-permit', 'Retirement', 'Short or long-term residence.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'turkey'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment authorization.', true, 20),

-- Saudi Arabia
((SELECT id FROM immigration_cost_countries WHERE slug = 'saudi-arabia'), 'Work Visa (Iqama)', 'work-visa-iqama', 'Work Visa', 'Employment residence permit.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'saudi-arabia'), 'Premium Residency', 'premium-residency', 'Investor', 'Long-term residence for investors.', false, 20),

-- Qatar
((SELECT id FROM immigration_cost_countries WHERE slug = 'qatar'), 'Work Visa', 'work-visa', 'Work Visa', 'Employment residence permit.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'qatar'), 'Investor Visa', 'investor-visa', 'Investor', 'Business and investment residence.', false, 20),

-- Israel
((SELECT id FROM immigration_cost_countries WHERE slug = 'israel'), 'Work Visa (B1)', 'work-visa-b1', 'Work Visa', 'Temporary work permit.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'israel'), 'Student Visa (A2)', 'student-visa-a2', 'Student', 'Study in Israel.', true, 20),

-- South Africa
((SELECT id FROM immigration_cost_countries WHERE slug = 'south-africa'), 'Critical Skills Work Visa', 'critical-skills-work-visa', 'Skilled Worker', 'Skilled professional visa.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'south-africa'), 'Retired Person Visa', 'retired-person-visa', 'Retirement', 'Retirement visa.', true, 20),

-- Nigeria
((SELECT id FROM immigration_cost_countries WHERE slug = 'nigeria'), 'Subject to Regularization (STR)', 'str-work-permit', 'Work Visa', 'Work permit and residence.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'nigeria'), 'Business Permit', 'business-permit', 'Investor', 'Business activities.', false, 20),

-- Morocco
((SELECT id FROM immigration_cost_countries WHERE slug = 'morocco'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'morocco'), 'Residence Permit', 'residence-permit', 'Retirement', 'Long-term residence.', true, 20),

-- Egypt
((SELECT id FROM immigration_cost_countries WHERE slug = 'egypt'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment visa.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'egypt'), 'Residence Visa', 'residence-visa', 'Retirement', 'Long-term residence.', true, 20),

-- Remaining European countries with basic pathways
((SELECT id FROM immigration_cost_countries WHERE slug = 'austria'), 'Red-White-Red Card', 'red-white-red-card', 'Skilled Worker', 'Points-based skilled immigration.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'austria'), 'Student Visa', 'student-visa', 'Student', 'Study in Austria.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'belgium'), 'Work Permit (Type B)', 'work-permit-type-b', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'belgium'), 'Student Visa', 'student-visa', 'Student', 'Study in Belgium.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'croatia'), 'Work and Residence Permit', 'work-residence-permit', 'Work Visa', 'Combined work and residence.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'croatia'), 'Digital Nomad Visa', 'digital-nomad-visa', 'Digital Nomad', 'Remote worker residence.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'czech-republic'), 'Employee Card', 'employee-card', 'Work Visa', 'Combined work and residence.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'czech-republic'), 'Long-Term Visa - Study', 'long-term-visa-study', 'Student', 'Student residence.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'denmark'), 'Pay Limit Scheme', 'pay-limit-scheme', 'Skilled Worker', 'High-salary work permit.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'denmark'), 'Student Visa', 'student-visa', 'Student', 'Study in Denmark.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'finland'), 'Residence Permit for Work', 'residence-permit-work', 'Work Visa', 'Employment-based residence.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'finland'), 'Student Residence Permit', 'student-residence-permit', 'Student', 'Study in Finland.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'greece'), 'Work Visa', 'work-visa', 'Work Visa', 'Employment permit.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'greece'), 'Golden Visa', 'golden-visa', 'Investor', 'Investment residence.', false, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'hungary'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'hungary'), 'Student Visa', 'student-visa', 'Student', 'Study in Hungary.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'norway'), 'Skilled Worker Permit', 'skilled-worker-permit', 'Skilled Worker', 'Qualified professional residence.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'norway'), 'Student Visa', 'student-visa', 'Student', 'Study in Norway.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'poland'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'poland'), 'Student Visa', 'student-visa', 'Student', 'Study in Poland.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'romania'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'romania'), 'Student Visa', 'student-visa', 'Student', 'Study in Romania.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'russia'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'russia'), 'Student Visa', 'student-visa', 'Student', 'Study in Russia.', true, 20),

((SELECT id FROM immigration_cost_countries WHERE slug = 'ukraine'), 'Work Permit', 'work-permit', 'Work Visa', 'Employment authorization.', true, 10),
((SELECT id FROM immigration_cost_countries WHERE slug = 'ukraine'), 'Student Visa', 'student-visa', 'Student', 'Study in Ukraine.', true, 20);