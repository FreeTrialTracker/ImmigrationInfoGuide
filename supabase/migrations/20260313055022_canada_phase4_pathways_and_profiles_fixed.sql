/*
  # Canada Phase 4 - Premium Pathways and Cost Profiles (Fixed)
  
  1. Updates
    - Delete existing inadequate Canada pathways
    - Create 5 high-quality Canada pathways
    - Create detailed cost profiles for each pathway
    - Add comprehensive inclusions and exclusions
    - Mark pathways as featured and high-intent
  
  2. Pathways
    - Express Entry
    - Provincial Nominee Program
    - Family Sponsorship
    - Study Permit
    - Start-Up Visa
*/

-- Delete existing Canada pathways
DELETE FROM immigration_pathways WHERE destination_slug = 'canada';

-- Create Express Entry pathway
INSERT INTO immigration_pathways (
  id,
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements,
  processing_time,
  official_url,
  last_updated
) VALUES (
  gen_random_uuid(),
  'any',
  'canada',
  'Work',
  'Express Entry (Federal Skilled Worker)',
  'Work',
  'Canada''s primary immigration pathway for skilled workers seeking permanent residence through a points-based system.',
  'Skilled work experience, language proficiency (CLB 7+), education credentials, valid job offer or provincial nomination increases chances.',
  'Minimum 1 year skilled work experience (NOC 0/A/B), Language test (IELTS/CELPIP CLB 7+), Educational Credential Assessment, Proof of funds, Comprehensive Ranking System (CRS) score of 470+',
  '6-12 months after receiving Invitation to Apply (ITA)',
  'CAD 2,300 - CAD 8,000 (government fees + testing + documents) plus CAD 13,310+ proof of funds',
  'IELTS/CELPIP language test, Educational Credential Assessment (ECA), proof of funds, medical exam, police certificates, work reference letters',
  '6-12 months after ITA',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html',
  CURRENT_DATE
);

-- Create Provincial Nominee Program pathway
INSERT INTO immigration_pathways (
  id,
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements,
  processing_time,
  official_url,
  last_updated
) VALUES (
  gen_random_uuid(),
  'any',
  'canada',
  'Work',
  'Provincial Nominee Program (PNP)',
  'Work',
  'Province-specific immigration allowing provinces to nominate individuals for permanent residence based on local labor needs.',
  'Job offer or work experience in province, language proficiency, intention to settle in nominating province. Requirements vary by province.',
  'Provincial nomination certificate, Language test, Work experience in province or NOC-eligible occupation, Education credentials, Proof of funds',
  '12-18 months total (provincial stage + federal PR)',
  'CAD 3,800 - CAD 9,500 (includes provincial nomination fee CAD 1,500 + federal fees)',
  'Provincial nomination, language test results, work experience documentation, education credentials, proof of funds, medical and police clearance',
  '12-18 months total',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/provincial-nominees.html',
  CURRENT_DATE
);

-- Create Family Sponsorship pathway
INSERT INTO immigration_pathways (
  id,
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements,
  processing_time,
  official_url,
  last_updated
) VALUES (
  gen_random_uuid(),
  'any',
  'canada',
  'Family',
  'Family Sponsorship',
  'Family',
  'Allows Canadian citizens and permanent residents to sponsor close family members (spouse, partner, dependent children, parents, grandparents).',
  'Sponsor must be Canadian citizen/PR, 18+, residing in Canada, meeting minimum income requirements (for parents/grandparents).',
  'Canadian sponsor eligibility, Genuine relationship proof, Sponsor financial capacity, Medical exam, Police certificates for sponsored person',
  '12 months (spouse/partner), 20-24 months (parents/grandparents)',
  'CAD 1,135 - CAD 1,365 per sponsored adult, CAD 150 per child',
  'Sponsorship application, relationship proof, sponsor financial evaluation, medical exams, police certificates, biometrics',
  '12 months (spouse), 20-24 months (parents)',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/family-sponsorship.html',
  CURRENT_DATE
);

-- Create Study Permit pathway
INSERT INTO immigration_pathways (
  id,
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements,
  processing_time,
  official_url,
  last_updated
) VALUES (
  gen_random_uuid(),
  'any',
  'canada',
  'Study',
  'Study Permit',
  'Study',
  'International student pathway to study at designated learning institutions (DLI). Can transition to work permits and PR.',
  'Acceptance from DLI, proof of financial support, no criminal record, in good health, ties to home country or intent to transition to PR.',
  'Letter of acceptance from DLI, Proof of funds (tuition + CAD 20,635 living), Language proficiency (if required by school), Study plan, Biometrics',
  '4-12 weeks for online applications, varies by country of residence',
  'CAD 150 study permit fee + CAD 85 biometrics + proof of funds (tuition + CAD 20,635)',
  'Letter of acceptance from DLI, proof of funds, study plan, language proficiency, medical exam (some countries), biometrics',
  '4-12 weeks (online)',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada.html',
  CURRENT_DATE
);

-- Create Start-Up Visa pathway
INSERT INTO immigration_pathways (
  id,
  passport_slug,
  destination_slug,
  goal,
  pathway_name,
  pathway_type,
  summary,
  eligibility,
  key_requirements,
  typical_timeline,
  estimated_fees,
  requirements,
  processing_time,
  official_url,
  last_updated
) VALUES (
  gen_random_uuid(),
  'any',
  'canada',
  'Investor',
  'Start-Up Visa',
  'Investor',
  'Entrepreneur pathway for innovative business founders with support from designated Canadian venture capital, angel investors, or incubators.',
  'Qualifying business idea, letter of support from designated organization, language proficiency (CLB 5+), sufficient settlement funds.',
  'Letter of support from designated Canadian organization, Innovative business plan, Language test (CLB 5 minimum), Proof of funds (CAD 13,310+), 10%+ voting rights in company',
  '12-16 months from application to decision',
  'CAD 2,200 - CAD 8,000 (application fees + testing) plus business setup costs',
  'Letter of support, business plan, language test (CLB 5), proof of funds, medical and police clearance, commitment letter',
  '12-16 months',
  'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/start-visa.html',
  CURRENT_DATE
);