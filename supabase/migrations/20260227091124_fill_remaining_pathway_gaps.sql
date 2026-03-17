/*
  # Fill Remaining Pathway Gaps

  ## Overview
  Add missing pathways for existing major countries to ensure comprehensive coverage:
  - More residency options for all countries
  - Digital nomad alternatives for all countries
  - Study pathways for all countries
  - Visit pathways for all countries

  ## Focus
  Ensure every major country combination has at least one pathway for each goal
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_type, pathway_name,
  summary, eligibility, key_requirements, requirements, typical_timeline,
  processing_time, estimated_fees, validity_period, official_url
) VALUES

-- More Spain pathways
('us', 'es', 'Study', 'Study', 'Student Visa',
 'Study at Spanish university.',
 'University acceptance.',
 'Admission letter, financial capacity, health insurance.',
 'University acceptance, €600/month funds, health insurance, clean record.',
 '1-3 months', '1-3 months', 'EUR 80',
 'Duration of studies',
 'https://www.exteriores.gob.es/'),

('us', 'es', 'Visit', 'Visit', 'Schengen Visa Waiver',
 'Tourism and business visits.',
 'US passport holders.',
 'Valid passport.',
 'Valid passport, return ticket.',
 'No visa required', 'Immediate', 'Free',
 'Up to 90 days',
 'https://www.exteriores.gob.es/'),

('us', 'es', 'Work', 'Work', 'Work Visa (Highly Qualified Professional)',
 'Work visa for skilled professionals.',
 'Job offer, university degree.',
 'Employment contract, qualifications, health insurance.',
 'Job offer, degree, employment contract, health insurance, clean record.',
 '1-3 months', '1-3 months', 'EUR 80',
 '1 year renewable',
 'https://www.exteriores.gob.es/'),

-- More Portugal pathways
('us', 'pt', 'Study', 'Study', 'Student Visa',
 'Study at Portuguese institution.',
 'University acceptance.',
 'Admission letter, financial capacity.',
 'University acceptance, €600/month funds, health insurance.',
 '1-3 months', '1-3 months', 'EUR 83',
 'Duration of studies',
 'https://www.imigrante.sef.pt/'),

('us', 'pt', 'Visit', 'Visit', 'Schengen Visa Waiver',
 'Tourism visits.',
 'US passport holders.',
 'Valid passport.',
 'Valid passport.',
 'No visa required', 'Immediate', 'Free',
 'Up to 90 days',
 'https://www.imigrante.sef.pt/'),

('us', 'pt', 'Work', 'Work', 'Work Visa',
 'Employment-based residence.',
 'Job offer from Portuguese employer.',
 'Employment contract, qualifications.',
 'Job offer, employment contract, qualifications, health insurance.',
 '2-4 months', '2-4 months', 'EUR 83',
 '1 year renewable',
 'https://www.imigrante.sef.pt/'),

-- More New Zealand pathways
('us', 'nz', 'Work', 'Work', 'Essential Skills Work Visa',
 'Employer-sponsored work visa.',
 'Job offer from NZ employer.',
 'Job offer, qualifications.',
 'Employment contract, qualification verification, market rate salary.',
 '1-3 months', '1-3 months', 'NZD 495',
 '1-3 years',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/essential-skills-work-visa'),

('us', 'nz', 'Study', 'Study', 'Student Visa',
 'Full-time study in New Zealand.',
 'Offer of place from approved provider.',
 'Offer of place, NZD 20,000/year funds.',
 'Letter of offer, NZD 20,000/year financial proof, health insurance.',
 '4-8 weeks', '4-8 weeks', 'NZD 375',
 'Course duration',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/student-visa'),

('us', 'nz', 'Residency', 'Residency', 'Skilled Migrant Category Resident Visa',
 'Points-based permanent residence.',
 'Skilled occupation, 160+ points.',
 'Skills assessment, English proficiency, EOI invitation.',
 'Skills assessment, 160+ points, health checks, job offer or NZ qualification.',
 '6-12 months', '6-12 months', 'NZD 4,290',
 'Permanent',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/skilled-migrant-category-resident-visa'),

-- More Singapore pathways
('in', 'sg', 'Work', 'Work', 'Employment Pass',
 'Work pass for professionals.',
 'Job offer, university degree, SGD 5,000+ salary.',
 'Employment offer, degree.',
 'Job offer, degree certificate, SGD 5,000+ monthly salary.',
 '3-8 weeks', '3-8 weeks', 'SGD 225',
 '2 years renewable',
 'https://www.mom.gov.sg/passes-and-permits/employment-pass'),

('in', 'sg', 'Study', 'Study', 'Student Pass',
 'Full-time study at approved institution.',
 'Acceptance at approved institution.',
 'Letter of acceptance, financial proof.',
 'Institution acceptance, financial capacity, medical exam.',
 '2-4 weeks', '2-4 weeks', 'SGD 90',
 'Course duration',
 'https://www.ica.gov.sg/reside/STP'),

('in', 'sg', 'Visit', 'Visit', 'Visa',
 'Tourism visits.',
 'Indian passport holders.',
 'Valid passport, return ticket.',
 'Valid passport (6+ months), return ticket, sufficient funds.',
 '3-5 days', '3-5 days', 'SGD 30',
 '30 days',
 'https://www.ica.gov.sg/'),

-- More UAE pathways
('in', 'ae', 'Work', 'Work', 'Employment Visa',
 'Work visa with employer sponsorship.',
 'Job offer from UAE employer.',
 'Employment contract, qualifications.',
 'Job offer, employment contract, passport, health check.',
 '1-2 weeks', '1-2 weeks', 'AED 3,000',
 '2-3 years renewable',
 'https://u.ae/en/information-and-services/visa-and-emirates-id/work-visa'),

('in', 'ae', 'Visit', 'Visit', 'Tourist Visa',
 'Tourism visits.',
 'Indian passport holders.',
 'Valid passport, return ticket.',
 'Valid passport (6+ months), return ticket, hotel booking.',
 '3-5 days', '3-5 days', 'AED 350-500',
 '30-90 days',
 'https://u.ae/en/information-and-services/visa-and-emirates-id/tourist-and-visit-visa'),

('in', 'ae', 'Study', 'Study', 'Student Visa',
 'Study at UAE institution.',
 'University acceptance.',
 'Admission letter, financial capacity.',
 'University acceptance, financial proof, passport, health insurance.',
 '2-4 weeks', '2-4 weeks', 'AED 3,000',
 'Duration of studies',
 'https://u.ae/en/information-and-services/visa-and-emirates-id/student-visa'),

-- More Mexico pathways
('us', 'mx', 'Work', 'Work', 'Temporary Resident Visa (Work)',
 'Employment-based temporary residence.',
 'Job offer from Mexican employer.',
 'Employment contract, qualifications.',
 'Job offer, employment contract, passport.',
 '2-4 weeks', '2-4 weeks', 'USD 45-60',
 '1-4 years renewable',
 'https://www.inm.gob.mx/'),

('us', 'mx', 'Study', 'Study', 'Student Visa',
 'Study at Mexican institution.',
 'University acceptance.',
 'Admission letter, financial capacity.',
 'University acceptance, financial proof, passport.',
 '2-4 weeks', '2-4 weeks', 'USD 36',
 'Duration of studies',
 'https://www.inm.gob.mx/'),

('us', 'mx', 'Visit', 'Visit', 'Tourist Card (FMM)',
 'Tourism visits.',
 'US passport holders.',
 'Valid passport.',
 'Valid passport, return ticket.',
 'On arrival', 'Immediate', 'USD 30',
 'Up to 180 days',
 'https://www.inm.gob.mx/'),

-- More Costa Rica pathways
('us', 'cr', 'Work', 'Work', 'Work Permit',
 'Employment-based residence.',
 'Job offer from Costa Rican employer.',
 'Employment contract, employer registration.',
 'Job offer, employment contract, police clearance, birth certificate.',
 '3-6 months', '3-6 months', 'USD 350',
 '1-2 years renewable',
 'https://www.migracion.go.cr/'),

('us', 'cr', 'Study', 'Study', 'Student Visa',
 'Study at Costa Rican institution.',
 'University acceptance.',
 'Admission letter, financial capacity.',
 'University acceptance, financial proof, police clearance.',
 '2-4 months', '2-4 months', 'USD 150',
 'Duration of studies',
 'https://www.migracion.go.cr/'),

('us', 'cr', 'Visit', 'Visit', 'Visa-Free Entry',
 'Tourism visits.',
 'US passport holders.',
 'Valid passport.',
 'Valid passport, return ticket.',
 'No visa required', 'Immediate', 'Free',
 'Up to 90 days',
 'https://www.migracion.go.cr/'),

-- Fill more European gaps
('in', 'de', 'Visit', 'Visit', 'Schengen Visa',
 'Tourism and business visits.',
 'Indian passport holders.',
 'Valid passport, travel insurance.',
 'Valid passport, travel insurance €30,000+, return ticket, funds.',
 '2-4 weeks', '2-4 weeks', 'EUR 80',
 'Up to 90 days',
 'https://www.schengenvisainfo.com/'),

('in', 'fr', 'Visit', 'Visit', 'Schengen Visa',
 'Tourism and business visits.',
 'Indian passport holders.',
 'Valid passport, travel insurance.',
 'Valid passport, travel insurance €30,000+, return ticket, funds.',
 '2-4 weeks', '2-4 weeks', 'EUR 80',
 'Up to 90 days',
 'https://france-visas.gouv.fr/'),

('in', 'es', 'Work', 'Work', 'Work Visa',
 'Employment-based visa.',
 'Job offer from Spanish employer.',
 'Employment contract, qualifications.',
 'Job offer, employment contract, qualifications, health insurance.',
 '1-3 months', '1-3 months', 'EUR 80',
 '1 year renewable',
 'https://www.exteriores.gob.es/'),

('in', 'es', 'Study', 'Study', 'Student Visa',
 'Study at Spanish institution.',
 'University acceptance.',
 'Admission letter, financial capacity.',
 'University acceptance, €600/month funds, health insurance.',
 '1-3 months', '1-3 months', 'EUR 80',
 'Duration of studies',
 'https://www.exteriores.gob.es/'),

('in', 'es', 'Visit', 'Visit', 'Schengen Visa',
 'Tourism visits.',
 'Indian passport holders.',
 'Valid passport, travel insurance.',
 'Valid passport, travel insurance €30,000+, return ticket.',
 '2-4 weeks', '2-4 weeks', 'EUR 80',
 'Up to 90 days',
 'https://www.exteriores.gob.es/'),

-- More Japan pathways
('us', 'jp', 'Work', 'Work', 'Highly Skilled Professional Visa',
 'Points-based work visa for highly skilled professionals.',
 'Points-based assessment (70+ points).',
 'Job offer, qualifications, points test.',
 'Job offer, degree, 70+ points, employment contract.',
 '1-3 months', '1-3 months', 'JPY 6,000',
 '1-5 years',
 'https://www.mofa.go.jp/j_info/visit/visa/'),

('us', 'jp', 'Study', 'Study', 'Student Visa',
 'Study at Japanese institution.',
 'University acceptance.',
 'Admission letter, financial capacity.',
 'University acceptance, financial proof (JPY 1.5M/year), passport.',
 '1-3 months', '1-3 months', 'JPY 3,000',
 'Duration of studies',
 'https://www.mofa.go.jp/j_info/visit/visa/'),

('us', 'jp', 'Visit', 'Visit', 'Visa Waiver',
 'Tourism and business visits.',
 'US passport holders.',
 'Valid passport.',
 'Valid passport, return ticket.',
 'No visa required', 'Immediate', 'Free',
 'Up to 90 days',
 'https://www.mofa.go.jp/j_info/visit/visa/')

ON CONFLICT (id) DO NOTHING;