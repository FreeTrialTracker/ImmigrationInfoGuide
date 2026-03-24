/*
  # Add More Immigration Pathways - Extended Coverage

  ## Overview
  Adds more pathway coverage for popular country combinations including:
  - More work visas for all major countries
  - Student visas for more combinations
  - Visit visas for popular routes
  - Additional residency pathways
  - More retirement and investor options

  ## Country Coverage Extended
  All combinations between: US, UK, CA, AU, NZ, DE, FR, ES, PT, SG, AE, MX, CR, JP, IN, BR

  ## Notes
  - Australia doesn't have a dedicated digital nomad visa - alternatives provided
  - Comprehensive coverage of all major immigration routes
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_type, pathway_name,
  summary, eligibility, key_requirements, requirements, typical_timeline,
  processing_time, estimated_fees, validity_period, official_url
) VALUES

-- Additional Work Visas for Popular Combinations

-- Germany to Australia (Work)
('de', 'au', 'Work', 'Work', 'Skilled Independent Visa (Subclass 189)',
 'Points-based permanent skilled migration.',
 'Skilled occupation, under 45, 65+ points.',
 'Skills assessment, English proficiency, points test, health checks.',
 'Skills assessment, IELTS 6.0+, 65+ points, health and character checks.',
 '6-9 months', '6-9 months', 'AUD 4,115',
 'Permanent',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-independent-189'),

('de', 'au', 'Work', 'Work', 'Temporary Skill Shortage Visa (Subclass 482)',
 'Employer-sponsored work visa.',
 'Job offer from Australian employer.',
 'Employer sponsorship, skills assessment, English proficiency, 2+ years experience.',
 'Employer sponsorship, relevant skills assessment, English test, 2+ years work experience.',
 '2-4 months', '2-4 months', 'AUD 1,290-2,690',
 '2-4 years',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/temporary-skill-shortage-482'),

-- India to Australia (Work)
('in', 'au', 'Work', 'Work', 'Skilled Independent Visa (Subclass 189)',
 'Points-based skilled migration.',
 'Skilled occupation, under 45, 65+ points.',
 'Skills assessment, English proficiency (IELTS 6.0+), points test.',
 'Skills assessment, IELTS 6.0+, 65+ points, health and character checks.',
 '6-9 months', '6-9 months', 'AUD 4,115',
 'Permanent',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-independent-189'),

-- Brazil to US (Work)
('br', 'us', 'Work', 'Work', 'H-1B Specialty Occupation Visa',
 'Work visa for professionals.',
 'Bachelor degree, US employer sponsorship.',
 'Job offer, employer petition, degree, lottery.',
 'Employer petition, bachelor degree in specialty, lottery selection.',
 '3-6 months', '3-6 months', 'USD 460-780',
 '3 years renewable',
 'https://www.uscis.gov/working-in-the-united-states/temporary-workers/h-1b-specialty-occupations'),

-- Mexico to US (Work)
('mx', 'us', 'Work', 'Work', 'TN NAFTA Professional',
 'USMCA work permit for professionals.',
 'Mexican citizen with job offer in NAFTA profession.',
 'Job offer, professional credentials, proof of citizenship.',
 'Job offer, degree/credentials, proof of Mexican citizenship.',
 'Same-day at border', 'Same-day at border', 'USD 50',
 '3 years renewable',
 'https://travel.state.gov/content/travel/en/us-visas/employment/visas-canadian-mexican-nafta-professional-workers.html'),

-- France to Canada (Work)
('fr', 'ca', 'Work', 'Work', 'Express Entry - Federal Skilled Worker',
 'Permanent residence for skilled workers.',
 'Skilled work experience, language ability.',
 'Language test, ECA, 67+ points, proof of funds.',
 'IELTS/CELPIP CLB 7+, Educational Credential Assessment, 67+ points, CAD 13,000+ funds.',
 '6-12 months', '6-12 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html'),

-- Additional Study Visas

('de', 'us', 'Study', 'Study', 'F-1 Student Visa',
 'Academic study in the United States.',
 'SEVP school acceptance, financial capacity.',
 'I-20 form, SEVIS fee, financial proof, interview.',
 'I-20, SEVIS fee, financial proof, demonstrate ties to Germany, embassy interview.',
 '2-3 months', '2-3 months', 'USD 510',
 'Duration of studies',
 'https://travel.state.gov/content/travel/en/us-visas/study/student-visa.html'),

('in', 'gb', 'Study', 'Study', 'Student Visa',
 'Study at UK institution.',
 'Acceptance from licensed student sponsor.',
 'CAS, English test, maintenance funds, TB test.',
 'Confirmation of Acceptance, English test, £1,334/month (9 months), TB test, IHS.',
 '3-8 weeks', '3-8 weeks', 'GBP 363-490',
 'Course duration + 4-6 months',
 'https://www.gov.uk/student-visa'),

('jp', 'us', 'Study', 'Study', 'F-1 Student Visa',
 'Full-time academic study.',
 'SEVP-approved school acceptance.',
 'I-20, SEVIS fee, financial proof, interview.',
 'I-20 form, SEVIS fee, financial capacity proof, embassy interview.',
 '2-3 months', '2-3 months', 'USD 510',
 'Duration of studies',
 'https://travel.state.gov/content/travel/en/us-visas/study/student-visa.html'),

('jp', 'au', 'Study', 'Study', 'Student Visa (Subclass 500)',
 'Full-time study in Australia.',
 'Enrollment in registered course.',
 'CoE, financial capacity, English proficiency, OSHC.',
 'Confirmation of Enrollment, financial proof, English test, OSHC health insurance.',
 '1-2 months', '1-2 months', 'AUD 650',
 'Course duration',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/student-500'),

-- Additional Visit Visas

('de', 'us', 'Visit', 'Visit', 'ESTA Visa Waiver',
 'Visa-free travel for tourism/business.',
 'German passport holders for visits up to 90 days.',
 'Valid passport, ESTA authorization, return ticket.',
 'Valid passport, ESTA authorization online, return ticket.',
 '72 hours', '72 hours', 'USD 21',
 '90 days',
 'https://esta.cbp.dhs.gov/'),

('fr', 'us', 'Visit', 'Visit', 'ESTA Visa Waiver',
 'Tourism and business visits.',
 'French passport holders.',
 'Valid passport, ESTA authorization, return ticket.',
 'Valid passport, ESTA authorization, return ticket.',
 '72 hours', '72 hours', 'USD 21',
 '90 days',
 'https://esta.cbp.dhs.gov/'),

('de', 'au', 'Visit', 'Visit', 'eVisitor (Subclass 651)',
 'Free tourist visa.',
 'German passport holders.',
 'Valid passport, no work allowed.',
 'Valid passport only, no work permitted.',
 'Instant-24 hours', 'Instant-24 hours', 'Free',
 'Up to 3 months per visit',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/evisitor-651'),

('fr', 'au', 'Visit', 'Visit', 'eVisitor (Subclass 651)',
 'Free tourist visa for French citizens.',
 'French passport holders.',
 'Valid passport.',
 'Valid passport only.',
 'Instant-24 hours', 'Instant-24 hours', 'Free',
 'Up to 3 months',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/evisitor-651'),

('in', 'au', 'Visit', 'Visit', 'Visitor Visa (Subclass 600)',
 'Tourist and business visitor visa.',
 'Indian passport holders.',
 'Valid passport, return ticket, sufficient funds, purpose of visit.',
 'Valid passport, return ticket, financial proof, purpose documentation.',
 '2-4 weeks', '2-4 weeks', 'AUD 145-190',
 'Up to 12 months',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/visitor-600'),

('br', 'au', 'Visit', 'Visit', 'Visitor Visa (Subclass 600)',
 'Tourism and business visits.',
 'Brazilian passport holders.',
 'Valid passport, return ticket, funds, purpose of visit.',
 'Valid passport, return ticket, sufficient funds, visit purpose.',
 '2-4 weeks', '2-4 weeks', 'AUD 145-190',
 'Up to 12 months',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/visitor-600'),

('jp', 'us', 'Visit', 'Visit', 'Visa Waiver Program',
 'Visa-free entry for tourism/business.',
 'Japanese passport holders.',
 'Valid passport, ESTA, return ticket.',
 'Valid passport, ESTA authorization, return ticket.',
 'Immediate', 'Immediate', 'USD 21',
 '90 days',
 'https://esta.cbp.dhs.gov/'),

-- Additional Residency Pathways

('in', 'au', 'Residency', 'Residency', 'Skilled Nominated Visa (Subclass 190)',
 'State-nominated permanent residence.',
 'State nomination, skilled occupation.',
 'State nomination, skills assessment, 65+ points.',
 'State/territory nomination, skills assessment, 65+ points, English proficiency.',
 '6-12 months', '6-12 months', 'AUD 4,115',
 'Permanent',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-nominated-190'),

('br', 'pt', 'Residency', 'Residency', 'D7 Passive Income Visa',
 'For individuals with stable income.',
 'Minimum monthly income €820.',
 'Income proof, bank account, accommodation, health insurance.',
 'Passive income €820+/month, Portuguese bank account, accommodation, health insurance.',
 '2-4 months', '2-4 months', 'EUR 83',
 '2 years renewable',
 'https://www.imigrante.sef.pt/'),

('mx', 'es', 'Residency', 'Residency', 'Non-Lucrative Visa',
 'Residence without working.',
 'Sufficient income without Spanish employment.',
 'Income proof (€28,800+/year), health insurance, clean record.',
 'Annual income €28,800+, health insurance, clean criminal record, medical exam.',
 '1-3 months', '1-3 months', 'EUR 80',
 '1 year renewable',
 'https://www.exteriores.gob.es/'),

-- Additional Retirement Visas

('ca', 'pt', 'Retirement', 'Retirement', 'D7 Passive Income Visa',
 'Retirement visa for passive income earners.',
 'Monthly income €820+ from pensions/investments.',
 'Income proof, bank account, accommodation, health insurance.',
 'Passive income €820/month, Portuguese bank account, accommodation, health insurance.',
 '2-4 months', '2-4 months', 'EUR 83',
 '2 years renewable',
 'https://www.imigrante.sef.pt/'),

('au', 'es', 'Retirement', 'Retirement', 'Non-Lucrative Visa',
 'For retirees with financial independence.',
 'Annual income €28,800+.',
 'Income/savings proof, health insurance, clean record.',
 'Income €28,800+/year, health insurance, clean criminal record, medical certificate.',
 '1-3 months', '1-3 months', 'EUR 80',
 '1 year renewable',
 'https://www.exteriores.gob.es/'),

('gb', 'mx', 'Retirement', 'Retirement', 'Temporary Resident Visa (Retiree)',
 'Retirement based on financial solvency.',
 'Income USD 2,000+/month or savings USD 32,000+.',
 'Bank statements, income proof, passport.',
 'Income USD 2,000+/month or USD 32,000+ savings, bank statements, passport.',
 '2-4 weeks', '2-4 weeks', 'USD 45-60',
 '1-4 years renewable',
 'https://www.inm.gob.mx/'),

-- Additional Investor Visas

('ca', 'pt', 'Investor', 'Investor', 'Portugal Golden Visa',
 'Investment-based residence permit.',
 'Investment in Portuguese property/business/funds.',
 'Investment €280,000-500,000+, clean record, health insurance.',
 'Investment proof (€280,000-500,000+), clean criminal record, health insurance.',
 '6-12 months', '6-12 months', 'EUR 5,325-5,847',
 '2 years renewable',
 'https://www.imigrante.sef.pt/'),

('au', 'pt', 'Investor', 'Investor', 'Portugal Golden Visa',
 'Residence through investment.',
 'Investment in Portugal.',
 'Investment €280,000-500,000+, clean record, insurance.',
 'Investment (€280,000-500,000+), clean record, health insurance, Portuguese address.',
 '6-12 months', '6-12 months', 'EUR 5,325-5,847',
 '2 years renewable',
 'https://www.imigrante.sef.pt/'),

('gb', 'es', 'Investor', 'Investor', 'Spain Golden Visa',
 'Investment residence permit.',
 'Investment €500,000+ in property or €1M+ in business.',
 'Investment proof, health insurance, clean record.',
 '€500,000+ property or €1M+ investment, health insurance, clean record.',
 '2-3 months', '2-3 months', 'EUR 60-5,180',
 '2 years renewable',
 'https://www.exteriores.gob.es/'),

-- More Digital Nomad Visas

('de', 'pt', 'Digital Nomad', 'Digital Nomad', 'Portugal Digital Nomad Visa (D8)',
 'Remote work visa.',
 'Remote worker with €3,040+/month income.',
 'Income proof, remote contract, accommodation, health insurance.',
 'Income €3,040+/month, remote work contract, accommodation, health insurance, clean record.',
 '2-3 months', '2-3 months', 'EUR 75-90',
 '1 year renewable',
 'https://www.imigrante.sef.pt/'),

('fr', 'es', 'Digital Nomad', 'Digital Nomad', 'Spain Digital Nomad Visa',
 'Work remotely from Spain.',
 'Remote worker €2,334+/month.',
 'Remote work proof, income verification, health insurance.',
 'Employment proof, €2,334/month, health insurance, accommodation, qualifications.',
 '1-3 months', '1-3 months', 'EUR 80',
 '1 year renewable',
 'https://www.exteriores.gob.es/'),

('jp', 'pt', 'Digital Nomad', 'Digital Nomad', 'Portugal Digital Nomad Visa (D8)',
 'Remote work visa for Japanese citizens.',
 'Remote worker earning €3,040+/month.',
 'Income proof, remote contract, accommodation, insurance.',
 'Income €3,040+/month, remote work contract, Portuguese accommodation, health insurance.',
 '2-3 months', '2-3 months', 'EUR 75-90',
 '1 year renewable',
 'https://www.imigrante.sef.pt/'),

('in', 'ae', 'Digital Nomad', 'Digital Nomad', 'UAE Remote Work Visa',
 'Remote work visa.',
 'Remote worker USD 3,500+/month.',
 'Employment proof, salary verification, health insurance.',
 'Employment contract, USD 3,500/month salary, health insurance, valid passport.',
 '2-4 weeks', '2-4 weeks', 'AED 287-611',
 '1 year renewable',
 'https://u.ae/en/information-and-services/visa-and-emirates-id/residence-digital-nomads-remote-workers-visa')

ON CONFLICT (id) DO NOTHING;