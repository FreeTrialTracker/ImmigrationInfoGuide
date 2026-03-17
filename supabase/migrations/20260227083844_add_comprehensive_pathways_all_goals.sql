/*
  # Add Comprehensive Immigration Pathways - All Goals

  ## Overview
  This migration adds extensive pathway data covering:
  - Digital Nomad visas
  - Investor/Business visas
  - Retirement visas
  - More Work, Study, and Residency pathways
  - Popular country combinations (US, UK, CA, AU, DE, FR, ES, PT, SG, AE, MX, CR, NZ, JP, IN, BR)

  ## Goals Covered
  - Work
  - Residency  
  - Digital Nomad
  - Study
  - Investor
  - Retirement

  ## Notes
  - Includes realistic visa requirements and processing times
  - Official government URLs included where available
  - Data reflects current 2024-2026 immigration policies
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_type, pathway_name,
  summary, eligibility, key_requirements, requirements, typical_timeline,
  processing_time, estimated_fees, validity_period, official_url
) VALUES

-- DIGITAL NOMAD VISAS

-- US to Portugal (Digital Nomad)
('us', 'pt', 'Digital Nomad', 'Digital Nomad', 'Portugal Digital Nomad Visa (D8)',
 'Visa for remote workers and digital nomads working for non-Portuguese companies.',
 'Remote worker earning minimum €3,040/month from non-Portuguese sources.',
 'Proof of remote income, employment contract or client contracts, accommodation in Portugal, health insurance.',
 'Proof of remote income (€3,040/month minimum), employment/client contracts, Portuguese accommodation, comprehensive health insurance, clean criminal record.',
 '2-3 months', '2-3 months', 'EUR 75-90',
 '1 year renewable',
 'https://www.imigrante.sef.pt/'),

-- US to Spain (Digital Nomad)
('us', 'es', 'Digital Nomad', 'Digital Nomad', 'Spain Digital Nomad Visa',
 'Work remotely in Spain for non-Spanish companies.',
 'Remote worker with minimum income €2,334/month, less than 20% income from Spanish sources.',
 'Remote work contract, proof of income, health insurance, accommodation proof, university degree or 3+ years experience.',
 'Remote employment proof, €2,334/month minimum income, health insurance, accommodation, degree or experience, clean record.',
 '1-3 months', '1-3 months', 'EUR 80',
 '1 year renewable up to 5 years',
 'https://www.exteriores.gob.es/'),

-- US to Costa Rica (Digital Nomad)
('us', 'cr', 'Digital Nomad', 'Digital Nomad', 'Costa Rica Digital Nomad Visa',
 'Remote work visa for digital professionals.',
 'Remote worker with minimum income USD 3,000/month or USD 4,000/month for family.',
 'Proof of remote employment, income verification, health insurance valid in Costa Rica, clean criminal record.',
 'Remote employment proof, USD 3,000+/month income, valid health insurance, clean record, passport copy.',
 '2-4 weeks', '2-4 weeks', 'USD 100',
 '1 year renewable',
 'https://www.migracion.go.cr/'),

-- US to Mexico (Digital Nomad)
('us', 'mx', 'Digital Nomad', 'Digital Nomad', 'Mexico Temporary Resident Visa (Remote Worker)',
 'Live and work remotely in Mexico.',
 'Remote worker with stable income or savings.',
 'Bank statements showing USD 2,595/month income or USD 43,000 in savings, proof of remote work.',
 'Bank statements (USD 2,595/month or USD 43,000 savings), remote work proof, application form, passport.',
 '2-4 weeks', '2-4 weeks', 'USD 45-60',
 '1 year renewable up to 4 years',
 'https://www.inm.gob.mx/'),

-- US to UAE (Digital Nomad)
('us', 'ae', 'Digital Nomad', 'Digital Nomad', 'UAE Remote Work Visa',
 'One-year renewable visa for remote workers.',
 'Remote employee or business owner with minimum income USD 3,500/month.',
 'Employment contract or business ownership proof, salary USD 3,500+/month, health insurance, passport copy.',
 'Employment contract/business ownership, USD 3,500/month salary, health insurance, valid passport.',
 '2-4 weeks', '2-4 weeks', 'AED 287-611',
 '1 year renewable',
 'https://u.ae/en/information-and-services/visa-and-emirates-id/residence-digital-nomads-remote-workers-visa'),

-- More Digital Nomad options from other countries
('gb', 'pt', 'Digital Nomad', 'Digital Nomad', 'Portugal Digital Nomad Visa (D8)',
 'Remote work visa for UK citizens.',
 'Remote worker with €3,040+/month income.',
 'Income proof, remote work contract, accommodation, health insurance, clean record.',
 'Income proof (€3,040+/month), employment contract, Portuguese accommodation, health insurance, clean record.',
 '2-3 months', '2-3 months', 'EUR 75-90',
 '1 year renewable',
 'https://www.imigrante.sef.pt/'),

('ca', 'es', 'Digital Nomad', 'Digital Nomad', 'Spain Digital Nomad Visa',
 'Work remotely from Spain.',
 'Remote worker with €2,334+/month income.',
 'Remote work proof, income verification, health insurance, accommodation, qualifications.',
 'Employment proof, €2,334/month income, health insurance, accommodation, degree/experience, clean record.',
 '1-3 months', '1-3 months', 'EUR 80',
 '1 year renewable',
 'https://www.exteriores.gob.es/'),

('au', 'pt', 'Digital Nomad', 'Digital Nomad', 'Portugal Digital Nomad Visa (D8)',
 'Remote work visa for Australian citizens.',
 'Remote worker earning €3,040+/month.',
 'Income proof, remote contract, accommodation, health insurance.',
 'Income proof (€3,040+/month), remote work contract, accommodation, health insurance, clean record.',
 '2-3 months', '2-3 months', 'EUR 75-90',
 '1 year renewable',
 'https://www.imigrante.sef.pt/'),

-- INVESTOR/BUSINESS VISAS

-- US to Portugal (Investor)
('us', 'pt', 'Investor', 'Investor', 'Portugal Golden Visa',
 'Residence permit through investment in Portugal.',
 'Investment in Portuguese real estate, business, or funds.',
 '€280,000-500,000+ investment depending on option, clean record, health insurance.',
 'Investment (€280,000-500,000+), investment proof, clean criminal record, health insurance, Portuguese address.',
 '6-12 months', '6-12 months', 'EUR 5,325-5,847',
 '2 years renewable, leads to citizenship',
 'https://www.imigrante.sef.pt/'),

-- US to Spain (Investor)
('us', 'es', 'Investor', 'Investor', 'Spain Golden Visa',
 'Residence through investment.',
 'Investment of €500,000+ in Spanish real estate or €1M+ in business/government bonds.',
 'Investment proof, health insurance, clean record, medical certificate, sufficient funds.',
 '€500,000+ real estate or €1M+ investment, health insurance, clean record, medical exam, funds proof.',
 '2-3 months', '2-3 months', 'EUR 60-5,180',
 '2 years renewable',
 'https://www.exteriores.gob.es/'),

-- UK to Australia (Investor)
('gb', 'au', 'Investor', 'Investor', 'Business Innovation and Investment Visa (Subclass 188)',
 'Visa for business investment and innovation.',
 'Successful business background, under 55, state nomination.',
 'Business experience, AUD 1.5M+ investment, state nomination, points test, business plan.',
 'Business background, AUD 1.5M+ available funds, state nomination, 65+ points, business plan.',
 '9-15 months', '9-15 months', 'AUD 5,375',
 '4 years renewable',
 'https://immi.homeaffairs.gov.au/'),

-- Canada Investor Programs
('us', 'ca', 'Investor', 'Investor', 'Quebec Immigrant Investor Program',
 'Passive investment pathway to permanent residence.',
 'Net worth CAD 2M+, invest CAD 1.2M for 5 years.',
 'CAD 2M net worth, CAD 1.2M investment (5 years), management experience, language test.',
 'Net worth CAD 2M+, CAD 1.2M investment, 2+ years management experience, language test.',
 '12-24 months', '12-24 months', 'CAD 16,000',
 'Permanent',
 'https://www.quebec.ca/en/immigration/'),

-- RETIREMENT VISAS

-- US to Portugal (Retirement)
('us', 'pt', 'Retirement', 'Retirement', 'D7 Passive Income Visa',
 'For retirees with pension or passive income.',
 'Minimum monthly income €820 from pension/investments.',
 'Income proof (€820+/month), Portuguese bank account, accommodation, health insurance, clean record.',
 'Passive income proof (€820/month), bank account, accommodation, health insurance, clean record.',
 '2-4 months', '2-4 months', 'EUR 83',
 '2 years renewable',
 'https://www.imigrante.sef.pt/'),

-- US to Spain (Retirement)
('us', 'es', 'Retirement', 'Retirement', 'Non-Lucrative Visa',
 'For retirees with sufficient income.',
 'Minimum annual income €28,800 without working in Spain.',
 'Income/savings proof, health insurance, clean record, medical certificate, accommodation.',
 'Income €28,800+/year, health insurance, clean record, medical exam, accommodation proof.',
 '1-3 months', '1-3 months', 'EUR 80',
 '1 year renewable',
 'https://www.exteriores.gob.es/'),

-- US to Mexico (Retirement)
('us', 'mx', 'Retirement', 'Retirement', 'Temporary Resident Visa (Retiree)',
 'Retirement visa based on financial independence.',
 'Monthly income USD 2,000+ or savings USD 32,000+.',
 'Bank statements, income proof, passport, application form, photos.',
 'Income USD 2,000+/month or USD 32,000+ savings, bank statements, passport, application.',
 '2-4 weeks', '2-4 weeks', 'USD 45-60',
 '1-4 years renewable',
 'https://www.inm.gob.mx/'),

-- Canada to Costa Rica (Retirement)
('ca', 'cr', 'Retirement', 'Retirement', 'Pensionado Visa',
 'Retirement visa for pension recipients.',
 'Monthly pension USD 1,000+ from government/private source.',
 'Pension proof, police clearance, birth certificate, health certificate, application fee.',
 'Pension USD 1,000+/month, police clearance, birth certificate, health exam, application.',
 '3-6 months', '3-6 months', 'USD 350',
 '2 years renewable',
 'https://www.migracion.go.cr/'),

-- MORE WORK VISAS (Additional countries)

-- UK to Canada (Work)
('gb', 'ca', 'Work', 'Work', 'Express Entry - Federal Skilled Worker',
 'Permanent residence for skilled workers.',
 'Skilled work experience, language proficiency, education.',
 'Language test (CLB 7+), ECA, 67+ points, proof of funds.',
 'IELTS/CELPIP (CLB 7), Educational Credential Assessment, 67+ points, CAD 13,000+ funds.',
 '6-12 months', '6-12 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html'),

-- Germany to UK (Work)
('de', 'gb', 'Work', 'Work', 'Skilled Worker Visa',
 'Employer-sponsored work visa for EU and non-EU workers.',
 'Job offer from licensed sponsor, salary £25,600+, English proficiency.',
 'Certificate of Sponsorship, English test, maintenance funds, TB test.',
 'Certificate of Sponsorship, English language test, £1,270 funds, TB test if required.',
 '3-8 weeks', '3-8 weeks', 'GBP 625-1,423',
 '5 years',
 'https://www.gov.uk/skilled-worker-visa'),

-- France to US (Work)
('fr', 'us', 'Work', 'Work', 'H-1B Specialty Occupation Visa',
 'Work visa for specialized professionals.',
 'Bachelor degree in specialty occupation, US employer sponsorship.',
 'Job offer, employer petition, degree, lottery selection.',
 'Employer petition, bachelor degree, specialty occupation, lottery win.',
 '3-6 months', '3-6 months', 'USD 460-780',
 '3 years renewable',
 'https://www.uscis.gov/working-in-the-united-states/temporary-workers/h-1b-specialty-occupations'),

-- India to Canada (Work)
('in', 'ca', 'Work', 'Work', 'Express Entry - Canadian Experience Class',
 'For skilled workers with Canadian work experience.',
 '1+ year Canadian skilled work experience, language proficiency.',
 'Canadian work experience, IELTS/CELPIP (CLB 7), language test.',
 '1+ year Canadian work experience, language test CLB 7+, work permit history.',
 '6-8 months', '6-8 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html'),

-- Japan to Australia (Work)
('jp', 'au', 'Work', 'Work', 'Skilled Independent Visa (Subclass 189)',
 'Points-based permanent skilled migration.',
 'Skilled occupation, under 45, 65+ points.',
 'Skills assessment, English proficiency, points test, health checks.',
 'Skills assessment, IELTS 6.0+, 65+ points, health and character checks.',
 '6-9 months', '6-9 months', 'AUD 4,115',
 'Permanent',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-independent-189'),

-- MORE STUDY VISAS

-- India to US (Study)
('in', 'us', 'Study', 'Study', 'F-1 Student Visa',
 'Full-time academic study.',
 'Acceptance at SEVP-approved school, financial capacity, English proficiency.',
 'I-20 form, SEVIS fee, financial proof, ties to home country, interview.',
 'I-20, SEVIS fee (USD 350), financial proof, demonstrate ties to India, embassy interview.',
 '2-3 months', '2-3 months', 'USD 510',
 'Duration of studies',
 'https://travel.state.gov/content/travel/en/us-visas/study/student-visa.html'),

-- Brazil to UK (Study)
('br', 'gb', 'Study', 'Study', 'Student Visa',
 'Full-time study at UK institution.',
 'Acceptance from licensed student sponsor.',
 'CAS, English test, maintenance funds, TB test, IHS payment.',
 'Confirmation of Acceptance for Studies, English test, £1,334/month funds (9 months), TB test, IHS.',
 '3-8 weeks', '3-8 weeks', 'GBP 363-490',
 'Course duration + 4-6 months',
 'https://www.gov.uk/student-visa'),

-- Mexico to Canada (Study)
('mx', 'ca', 'Study', 'Study', 'Study Permit',
 'Study at designated learning institution.',
 'Acceptance from DLI, financial capacity.',
 'Letter of Acceptance, CAD 10,000+ funds, language proficiency, medical exam.',
 'LOA from DLI, CAD 10,000+ available funds, English/French test, medical exam if required.',
 '4-8 weeks', '4-8 weeks', 'CAD 150',
 'Course duration + 90 days',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada/study-permit.html'),

-- France to Australia (Study)
('fr', 'au', 'Study', 'Study', 'Student Visa (Subclass 500)',
 'Full-time study in Australia.',
 'Enrollment in registered course.',
 'CoE, financial capacity, English proficiency, OSHC.',
 'Confirmation of Enrollment, financial proof, English test, OSHC health insurance.',
 '1-2 months', '1-2 months', 'AUD 650',
 'Course duration',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/student-500'),

-- MORE RESIDENCY PATHWAYS

-- Germany to Canada (Residency)
('de', 'ca', 'Residency', 'Residency', 'Express Entry - Federal Skilled Worker',
 'Permanent residence through skilled migration.',
 'Skilled work experience, language proficiency.',
 'Language test, ECA, 67+ points, proof of funds.',
 'IELTS/CELPIP CLB 7+, Educational Credential Assessment, 67+ points, CAD 13,000+ funds.',
 '6-12 months', '6-12 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html'),

-- Australia to UK (Residency)
('au', 'gb', 'Residency', 'Residency', 'Skilled Worker Visa',
 'Work-based residence pathway.',
 'Job offer from UK sponsor, salary threshold.',
 'Certificate of Sponsorship, English test, maintenance funds.',
 'Certificate of Sponsorship, English language test, £1,270 funds, qualifications.',
 '3-8 weeks', '3-8 weeks', 'GBP 625-1,423',
 '5 years, leads to settlement',
 'https://www.gov.uk/skilled-worker-visa'),

-- UK to Australia (Residency)
('gb', 'au', 'Residency', 'Residency', 'Partner Visa (Subclass 820/801)',
 'Permanent residence through partnership.',
 'Married/de facto relationship with Australian citizen/PR.',
 'Relationship evidence, partner sponsorship, health and character checks.',
 'Relationship proof (12+ months), sponsor, health and character checks, financial capacity.',
 '12-24 months', '12-24 months', 'AUD 8,085',
 'Permanent',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/partner-onshore'),

-- Canada to Australia (Work)
('ca', 'au', 'Residency', 'Residency', 'Skilled Nominated Visa (Subclass 190)',
 'State-nominated permanent residence.',
 'State nomination, skilled occupation, under 45.',
 'State nomination, skills assessment, 65+ points, English proficiency.',
 'State/territory nomination, skills assessment, 65+ points, English test.',
 '6-12 months', '6-12 months', 'AUD 4,115',
 'Permanent',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-nominated-190')

ON CONFLICT (id) DO NOTHING;