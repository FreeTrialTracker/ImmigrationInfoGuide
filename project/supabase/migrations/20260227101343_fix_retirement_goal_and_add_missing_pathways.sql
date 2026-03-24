/*
  # Fix Retirement Goal Inconsistency and Add Missing Pathways
  
  1. Changes
    - Standardize "Retire" to "Retirement" for consistency
    - Add Retirement pathways for major destinations that are missing them
    - Add other missing goal pathways for popular destinations
    
  2. New Retirement Pathways
    - Canada: Parent and Grandparent Program
    - United States: No specific retirement visa (tourist visa for retirees)
    - United Kingdom: No specific retirement visa (alternatives available)
    - New Zealand: Parent Retirement Resident Visa
    - Singapore: No specific retirement visa
    - Germany: No specific retirement visa
*/

-- Fix the inconsistency: Update "Retire" to "Retirement"
UPDATE immigration_pathways
SET goal = 'Retirement'
WHERE goal = 'Retire';

-- Canada Retirement Pathway (Parent and Grandparent Program)
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'ca', 'Retirement', 'Parent and Grandparent Program', 'Permanent residence for parents and grandparents of Canadian citizens/PRs.', 'Canadian child/grandchild who is citizen or PR, meets income requirement.', 'Sponsorship application, proof of relationship, income requirement, medical exam', '20-24 months', 'CAD $1,080 + processing', 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/family-sponsorship/sponsor-parents-grandparents.html');

-- United Kingdom Retirement Alternative
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'gb', 'Retirement', 'Standard Visitor Visa (Extended for Retirees)', 'Long-term visitor visa option for retirees (up to 10 years).', 'Financial independence, no work in UK, ties to home country.', 'Financial proof, accommodation, return intent, visa history', '3 weeks', '£822 for 10 years', 'https://www.gov.uk/standard-visitor-visa');

-- New Zealand Retirement Pathway
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'nz', 'Retirement', 'Parent Retirement Resident Visa', 'Permanent residence for parents of NZ citizens/residents.', 'Adult child in NZ, age 66+, NZD $750,000 settlement funds + NZD $500,000 income.', 'Sponsorship, age requirement, investment funds, income, health check', '6-12 months', 'NZD $3,825', 'https://www.immigration.govt.nz/');

-- Japan Retirement-like pathway (Dependent visa for elderly parents)
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'jp', 'Retirement', 'Dependent Visa for Elderly Parents', 'Long-term stay for elderly parents of Japanese residents.', 'Adult child in Japan with stable income, elderly parent needing support.', 'Family relationship proof, sponsor income, accommodation, health insurance', '1-3 months', '¥4,000', 'https://www.mofa.go.jp/');

-- Add missing Investor pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'nz', 'Investor', 'Investor Visa', 'Investment-based residence.', 'NZD $3-15 million investment, business experience.', 'Investment commitment, business experience, English proficiency, age', '6-12 months', 'NZD $3,825-$4,745', 'https://www.immigration.govt.nz/'),
('any', 'jp', 'Investor', 'Business Manager Visa', 'Business investment and management visa.', '¥5,000,000+ investment or 2+ full-time employees.', 'Business plan, investment proof, office space, business registration', '1-3 months', '¥4,000', 'https://www.mofa.go.jp/'),
('any', 'sg', 'Investor', 'Global Investor Programme', 'Investment-based permanent residence.', 'SGD $2.5-10 million investment, business track record.', 'Investment commitment, business experience, financial documents', '4-6 months', 'SGD $7,950', 'https://www.edb.gov.sg/');

-- Add missing Digital Nomad pathways for major destinations (where applicable)
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'de', 'Digital Nomad', 'Freelance Visa (Freiberufler)', 'Self-employment visa for freelancers and digital workers.', 'Freelance profession, clients/contracts, sufficient income.', 'Client contracts, portfolio, health insurance, business plan', '6-12 weeks', '€100', 'https://www.make-it-in-germany.com/'),
('any', 'nz', 'Digital Nomad', 'Self-Employed Work Visa', 'Work visa for self-employed individuals.', 'Established business, high value to NZ economy.', 'Business plan, funds, qualifications, health/character checks', '3-6 months', 'NZD $495-$680', 'https://www.immigration.govt.nz/');

-- Add missing Residency pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'us', 'Residency', 'Employment-Based Green Card (EB-2/EB-3)', 'Permanent residence through employment.', 'Advanced degree or exceptional ability (EB-2) or skilled worker (EB-3).', 'PERM labor certification, I-140 petition, education/experience', '2-5 years', '$700-$1,500 + legal fees', 'https://www.uscis.gov/'),
('any', 'gb', 'Residency', 'Indefinite Leave to Remain (ILR)', 'Permanent residence (settlement).', '5 years continuous residence on eligible visa, pass Life in UK test.', 'Qualifying visa, continuous residence, English proficiency, Life in UK test', '6 months after eligibility', '£2,404', 'https://www.gov.uk/indefinite-leave-to-remain'),
('any', 'au', 'Residency', 'Employer Nomination Scheme (Subclass 186)', 'Permanent residence through employer sponsorship.', '3 years work experience, employer nomination, under 45 years.', 'Employer nomination, skills assessment, English proficiency, age', '6-9 months', 'AUD $4,240', 'https://immi.homeaffairs.gov.au/'),
('any', 'de', 'Residency', 'Permanent Settlement Permit', 'Permanent residence in Germany.', '5 years legal residence, German proficiency, self-sufficiency.', 'Residence permit, German B1 level, employment/income, pension', '2-3 months after eligibility', '€113', 'https://www.make-it-in-germany.com/'),
('any', 'jp', 'Residency', 'Permanent Residence', 'Permanent residence permit.', '10 years residence (5 years on work visa), good conduct, financial stability.', 'Long-term residence, stable income, tax compliance, good conduct', '6-12 months', '¥8,000', 'https://www.mofa.go.jp/'),
('any', 'sg', 'Residency', 'Singapore Permanent Residence', 'Permanent resident status.', 'Employment Pass holder, spouse/child of citizen, investor.', 'Employment/family/investment basis, contribution to Singapore', '4-6 months', 'SGD $100', 'https://www.ica.gov.sg/');
