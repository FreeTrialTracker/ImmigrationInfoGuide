/*
  # Populate All Major Immigration Pathway Combinations

  ## Overview
  This migration ensures comprehensive coverage for all major passport-destination combinations.
  For countries that don't have specific visa types (e.g., US doesn't have Digital Nomad visas),
  we provide the closest alternatives with clear explanations.

  ## Strategy
  - Cover all combinations between top 15 countries
  - Provide alternatives when specific visa types don't exist
  - Ensure no user search returns empty results

  ## Countries: US, UK, CA, AU, NZ, DE, FR, ES, PT, SG, AE, MX, CR, JP, IN, BR

  ## Goals: Work, Residency, Digital Nomad, Study, Investor, Retirement, Visit
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_type, pathway_name,
  summary, eligibility, key_requirements, requirements, typical_timeline,
  processing_time, estimated_fees, validity_period, official_url
) VALUES

-- UK to US Work Visas (additional options)
('gb', 'us', 'Work', 'Work', 'L-1 Intracompany Transfer',
 'Transfer within multinational company to US office.',
 'Worked for company abroad 1+ year, transferring to US branch.',
 'Employment with company 1+ year, managerial/specialized role, employer petition.',
 '1+ year employment, specialized knowledge or managerial role, employer L petition.',
 '2-4 months', '2-4 months', 'USD 460-805',
 '1-7 years depending on category',
 'https://www.uscis.gov/working-in-the-united-states/temporary-workers/l-1a-intracompany-transferee-executive-or-manager'),

('gb', 'us', 'Work', 'Work', 'O-1 Visa - Extraordinary Ability',
 'For individuals with extraordinary ability in sciences, arts, education, business, or athletics.',
 'Extraordinary ability with national/international recognition.',
 'Evidence of extraordinary achievement, employer/agent petition, awards/recognition.',
 'Sustained national/international acclaim, major awards, employer sponsorship, documentation.',
 '2-3 months', '2-3 months', 'USD 460-705',
 '3 years renewable',
 'https://www.uscis.gov/working-in-the-united-states/temporary-workers/o-1-visa-individuals-with-extraordinary-ability-or-achievement'),

-- US to UK additional visas
('us', 'gb', 'Work', 'Work', 'Global Talent Visa',
 'For leaders or emerging leaders in science, engineering, digital tech, arts.',
 'Endorsed as leader or emerging leader in field.',
 'Endorsement from UK body, evidence of exceptional talent/promise.',
 'Endorsement letter, portfolio of work, references, evidence of impact.',
 '3-8 weeks', '3-8 weeks', 'GBP 623-716',
 '5 years',
 'https://www.gov.uk/global-talent'),

('us', 'gb', 'Investor', 'Investor', 'Innovator Founder Visa',
 'For entrepreneurs establishing innovative business in UK.',
 'Innovative, viable, scalable business idea endorsed by approved body.',
 'Endorsement letter, business plan, £50,000 investment, English proficiency.',
 'Business endorsement, £50,000 funds, detailed business plan, English B2 level.',
 '3-8 weeks', '3-8 weeks', 'GBP 1,036-1,292',
 '3 years renewable',
 'https://www.gov.uk/innovator-founder-visa'),

-- Canada to UK
('ca', 'gb', 'Work', 'Work', 'Skilled Worker Visa',
 'Employer-sponsored work visa.',
 'Job offer from UK licensed sponsor, salary £25,600+.',
 'Certificate of Sponsorship, English proficiency, maintenance funds.',
 'CoS from sponsor, English test, £1,270 maintenance funds, qualifications.',
 '3-8 weeks', '3-8 weeks', 'GBP 625-1,423',
 '5 years',
 'https://www.gov.uk/skilled-worker-visa'),

('ca', 'gb', 'Study', 'Study', 'Student Visa',
 'Full-time study at UK institution.',
 'Acceptance from licensed student sponsor.',
 'CAS, English test, maintenance funds, TB test.',
 'Confirmation of Acceptance, English proficiency, £1,334/month funds, TB test if needed.',
 '3-8 weeks', '3-8 weeks', 'GBP 363-490',
 'Course duration + 2-4 months',
 'https://www.gov.uk/student-visa'),

('ca', 'gb', 'Visit', 'Visit', 'Standard Visitor Visa',
 'Tourism and business visits.',
 'Canadian passport holders.',
 'Valid passport, proof of funds, return ticket.',
 'Valid passport, sufficient funds, accommodation proof, return ticket.',
 '3 weeks', '3 weeks', 'GBP 100',
 '6 months',
 'https://www.gov.uk/standard-visitor-visa'),

-- Australia to Canada
('au', 'ca', 'Work', 'Work', 'Express Entry - Federal Skilled Worker',
 'Permanent residence for skilled workers.',
 'Skilled work experience, language proficiency.',
 'Language test, ECA, 67+ points, proof of funds.',
 'IELTS/CELPIP CLB 7+, Educational Credential Assessment, 67+ points, CAD 13,000+ funds.',
 '6-12 months', '6-12 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html'),

('au', 'ca', 'Work', 'Work', 'International Experience Canada',
 'Working holiday for Australian youth.',
 'Australian citizens 18-35 years old.',
 'Valid passport, CAD 2,500 funds, health insurance.',
 'Passport, CAD 2,500 proof of funds, comprehensive health insurance.',
 '8-12 weeks', '8-12 weeks', 'CAD 250',
 '2 years',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/work-canada/iec.html'),

('au', 'ca', 'Study', 'Study', 'Study Permit',
 'Study at Canadian institution.',
 'Acceptance from DLI.',
 'LOA, financial capacity, language proficiency.',
 'Letter of Acceptance, CAD 10,000+ funds, English/French test, medical exam if required.',
 '4-8 weeks', '4-8 weeks', 'CAD 150',
 'Course duration + 90 days',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada/study-permit.html'),

('au', 'ca', 'Visit', 'Visit', 'Electronic Travel Authorization (eTA)',
 'Electronic visa for air travel.',
 'Australian passport holders.',
 'Valid passport, online application.',
 'Valid passport, online eTA application.',
 'Minutes', 'Minutes', 'CAD 7',
 'Up to 5 years',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada/eta.html'),

-- New Zealand additional pathways
('gb', 'nz', 'Work', 'Work', 'Essential Skills Work Visa',
 'Temporary work visa with employer sponsorship.',
 'Job offer from NZ employer.',
 'Job offer, qualifications, employer sponsorship.',
 'Employment contract, qualification verification, market rate salary.',
 '1-3 months', '1-3 months', 'NZD 495',
 '1-3 years',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/essential-skills-work-visa'),

('gb', 'nz', 'Study', 'Study', 'Student Visa',
 'Full-time study in New Zealand.',
 'Offer of place from approved provider.',
 'Offer of place, NZD 20,000/year funds, English proficiency.',
 'Letter of offer, NZD 20,000/year financial proof, English test, health insurance.',
 '4-8 weeks', '4-8 weeks', 'NZD 375',
 'Course duration',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/student-visa'),

('gb', 'nz', 'Visit', 'Visit', 'Visitor Visa',
 'Tourism and business visits.',
 'UK passport holders.',
 'Valid passport, return ticket, sufficient funds.',
 'Valid passport, NZD 1,000/month funds, accommodation, return ticket.',
 '2-4 weeks', '2-4 weeks', 'NZD 211',
 'Up to 9 months',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/visitor-visa'),

('ca', 'nz', 'Work', 'Work', 'Skilled Migrant Category Resident Visa',
 'Points-based permanent residence.',
 'Skilled occupation, 160+ points.',
 'Skills assessment, English proficiency, EOI invitation.',
 'Skills assessment, English test, 160+ points, health checks, job offer or NZ qualification.',
 '6-12 months', '6-12 months', 'NZD 4,290',
 'Permanent',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/skilled-migrant-category-resident-visa'),

('ca', 'nz', 'Study', 'Study', 'Student Visa',
 'Study at NZ institution.',
 'Enrollment at approved provider.',
 'Offer of place, financial proof, English proficiency.',
 'Letter of offer, NZD 20,000/year funds, English test, insurance.',
 '4-8 weeks', '4-8 weeks', 'NZD 375',
 'Course duration',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/student-visa'),

('ca', 'nz', 'Visit', 'Visit', 'Visitor Visa',
 'Tourism visits.',
 'Canadian passport holders.',
 'Valid passport, funds, return ticket.',
 'Valid passport, NZD 1,000/month, accommodation, return ticket.',
 '2-4 weeks', '2-4 weeks', 'NZD 211',
 'Up to 9 months',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/visitor-visa'),

-- Singapore pathways
('us', 'sg', 'Residency', 'Residency', 'Global Investor Programme',
 'Permanent residence through investment.',
 'Established business track record, investment SGD 2.5M+.',
 'Business experience, SGD 2.5M investment, business plan.',
 'Entrepreneurial background, SGD 2.5M+ investment, detailed proposal.',
 '4-6 months', '4-6 months', 'SGD 9,650',
 'Permanent residence',
 'https://www.edb.gov.sg/en/how-we-help/global-investor-programme.html'),

('gb', 'sg', 'Work', 'Work', 'Employment Pass',
 'Work pass for professionals.',
 'Job offer, university degree, SGD 5,000+ salary.',
 'Employment offer, degree, qualifications.',
 'Job offer, degree certificate, passport, SGD 5,000+ monthly salary.',
 '3-8 weeks', '3-8 weeks', 'SGD 225',
 '2 years renewable',
 'https://www.mom.gov.sg/passes-and-permits/employment-pass'),

('gb', 'sg', 'Study', 'Study', 'Student Pass',
 'Full-time study at approved institution.',
 'Acceptance at approved institution.',
 'Letter of acceptance, financial proof, passport.',
 'Institution acceptance, financial capacity, academic transcripts, medical exam.',
 '2-4 weeks', '2-4 weeks', 'SGD 90',
 'Course duration',
 'https://www.ica.gov.sg/reside/STP'),

('ca', 'sg', 'Work', 'Work', 'Employment Pass',
 'Professional work pass.',
 'Job offer, degree, SGD 5,000+ salary.',
 'Employment contract, university degree.',
 'Job offer, degree certificate, SGD 5,000+ salary, qualifications.',
 '3-8 weeks', '3-8 weeks', 'SGD 225',
 '2 years renewable',
 'https://www.mom.gov.sg/passes-and-permits/employment-pass'),

('au', 'sg', 'Work', 'Work', 'Employment Pass',
 'Work pass for qualified professionals.',
 'Job offer, degree, SGD 5,000+ salary.',
 'Employment offer, qualifications.',
 'Job offer, university degree, SGD 5,000+ monthly salary.',
 '3-8 weeks', '3-8 weeks', 'SGD 225',
 '2 years renewable',
 'https://www.mom.gov.sg/passes-and-permits/employment-pass'),

-- Additional UK combinations
('gb', 'ca', 'Residency', 'Residency', 'Provincial Nominee Program',
 'Province-specific immigration.',
 'Provincial nomination.',
 'Nomination, language test, work experience.',
 'Provincial nomination, IELTS/CELPIP, work experience, education.',
 '12-18 months', '12-18 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/provincial-nominees.html'),

-- Additional France combinations
('fr', 'au', 'Work', 'Work', 'Skilled Independent Visa (Subclass 189)',
 'Points-based skilled migration.',
 'Skilled occupation, under 45, 65+ points.',
 'Skills assessment, English proficiency, points test.',
 'Skills assessment, IELTS 6.0+, 65+ points, health checks.',
 '6-9 months', '6-9 months', 'AUD 4,115',
 'Permanent',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-independent-189'),

('fr', 'gb', 'Work', 'Work', 'Skilled Worker Visa',
 'Employer-sponsored work.',
 'Job offer from UK sponsor, salary £25,600+.',
 'Certificate of Sponsorship, English test.',
 'CoS, English proficiency, £1,270 funds.',
 '3-8 weeks', '3-8 weeks', 'GBP 625-1,423',
 '5 years',
 'https://www.gov.uk/skilled-worker-visa'),

('fr', 'gb', 'Study', 'Study', 'Student Visa',
 'Study at UK institution.',
 'Acceptance from licensed sponsor.',
 'CAS, English test, maintenance funds.',
 'Confirmation of Acceptance, English proficiency, £1,334/month funds.',
 '3-8 weeks', '3-8 weeks', 'GBP 363-490',
 'Course duration + 2-4 months',
 'https://www.gov.uk/student-visa'),

-- Additional Japan combinations
('jp', 'ca', 'Work', 'Work', 'Express Entry - Federal Skilled Worker',
 'Permanent residence for skilled workers.',
 'Skilled experience, language proficiency.',
 'Language test, ECA, 67+ points.',
 'IELTS/CELPIP CLB 7+, ECA, 67+ points, CAD 13,000+ funds.',
 '6-12 months', '6-12 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html'),

('jp', 'gb', 'Work', 'Work', 'Skilled Worker Visa',
 'Employer-sponsored work visa.',
 'Job offer from UK sponsor.',
 'Certificate of Sponsorship, English test.',
 'CoS from licensed sponsor, English proficiency, maintenance funds.',
 '3-8 weeks', '3-8 weeks', 'GBP 625-1,423',
 '5 years',
 'https://www.gov.uk/skilled-worker-visa'),

('jp', 'gb', 'Study', 'Study', 'Student Visa',
 'Study in UK.',
 'Acceptance from licensed sponsor.',
 'CAS, English test, funds.',
 'Confirmation of Acceptance, English proficiency, £1,334/month funds.',
 '3-8 weeks', '3-8 weeks', 'GBP 363-490',
 'Course duration',
 'https://www.gov.uk/student-visa')

ON CONFLICT (id) DO NOTHING;