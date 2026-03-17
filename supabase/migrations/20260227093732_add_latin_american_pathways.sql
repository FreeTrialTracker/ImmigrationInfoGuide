/*
  # Add Latin American Immigration Pathways
  
  1. New Pathways Added
    - Colombia: Digital Nomad, Tourist, Work, Investment visas
    - Argentina: Temporary Residence, Work, Study, Rentista visas  
    - Brazil: Digital Nomad, Work, Study, Investment visas
    - Chile: Work, Digital Nomad, Study, Investor visas
    - Ecuador: Tourist, Retirement, Investment, Work visas
    - Panama: Friendly Nations Visa, Pensionado, Investment programs
    
  2. Coverage
    - Popular Latin American destinations for expats and digital nomads
    - Comprehensive pathway types for each country
*/

-- Colombia Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'colombia', 'Digital Nomad', 'Digital Nomad Visa (V)', 'Visa for remote workers and digital nomads.', 'Remote employment or freelance work, proof of income.', 'Employment letter, income proof $685+ monthly, passport, photos', '1-2 months', '$177 USD', 'https://www.cancilleria.gov.co/'),
('any', 'colombia', 'Visit', 'Tourist Visa', 'Short-term tourism visa.', 'Valid passport (many nationalities visa-free 90 days).', 'Passport, return ticket, accommodation proof, travel insurance', 'On arrival or 5-10 days', 'Free-$52 USD', 'https://www.cancilleria.gov.co/'),
('any', 'colombia', 'Work', 'Work Visa (V)', 'Employment authorization visa.', 'Job offer from Colombian employer.', 'Employment contract, company registration, qualifications, passport', '1-2 months', '$177 USD', 'https://www.cancilleria.gov.co/'),
('any', 'colombia', 'Study', 'Student Visa (V)', 'Study visa for international students.', 'Acceptance from Colombian institution.', 'Admission letter, financial proof, passport, police clearance', '1-2 months', '$177 USD', 'https://www.cancilleria.gov.co/'),
('any', 'colombia', 'Investor', 'Investor Visa (V)', 'Investment-based visa.', '$158,000+ USD investment in Colombian company or real estate.', 'Investment proof, notarized documents, business registration', '2-3 months', '$177 USD', 'https://www.cancilleria.gov.co/'),
('any', 'colombia', 'Residency', 'Resident Visa (R)', 'Long-term residence permit.', '3+ years on V visa or specific qualifying circumstances.', 'Proof of qualifying status, passport, police clearance, photos', '2-4 months', '$400 USD', 'https://www.cancilleria.gov.co/');

-- Argentina Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'argentina', 'Residency', 'Temporary Residence', 'Renewable temporary residence.', 'Employment, investment, family ties, or rentista status.', 'Criminal record, birth certificate, proof of means, passport', '2-4 months', 'ARS 6,000-15,000', 'https://www.argentina.gob.ar/'),
('any', 'argentina', 'Work', 'Work Residence Permit', 'Temporary residence through employment.', 'Job offer from Argentine employer.', 'Employment contract, company registration, qualifications, photos', '2-4 months', 'ARS 6,000-15,000', 'https://www.argentina.gob.ar/'),
('any', 'argentina', 'Study', 'Student Temporary Residence', 'Residence for students.', 'Enrollment in Argentine institution.', 'Admission proof, financial means, criminal record, passport', '2-3 months', 'ARS 6,000-10,000', 'https://www.argentina.gob.ar/'),
('any', 'argentina', 'Retirement', 'Rentista Visa', 'Income-based residence for retirees.', '$2,000+ monthly passive income.', 'Proof of pension/income, criminal record, birth cert, apostille', '2-4 months', 'ARS 6,000-15,000', 'https://www.argentina.gob.ar/'),
('any', 'argentina', 'Visit', 'Tourist Entry', 'Visa-free tourism entry.', 'Valid passport (many nationalities visa-free 90 days).', 'Passport, return ticket', 'On arrival', 'Free', 'https://www.argentina.gob.ar/'),
('any', 'argentina', 'Investor', 'Investor Residence', 'Investment-based residence.', 'Significant investment in Argentine business.', 'Investment proof, business plan, financial statements, passport', '3-6 months', 'ARS 15,000-30,000', 'https://www.argentina.gob.ar/');

-- Brazil Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'brazil', 'Digital Nomad', 'Digital Nomad Visa (VITEM XIV)', 'Remote work visa for digital professionals.', 'Remote employment, $1,500+ USD monthly income.', 'Proof of remote work, income statements, health insurance, passport', '1-2 months', 'R$ 300-600', 'https://www.gov.br/'),
('any', 'brazil', 'Work', 'Work Visa (VITEM V)', 'Employment authorization.', 'Job offer from Brazilian employer or work contract.', 'Employment contract, work permit, qualifications, passport', '2-4 months', 'R$ 300-600', 'https://www.gov.br/'),
('any', 'brazil', 'Study', 'Student Visa (VITEM IV)', 'Study visa for international students.', 'Acceptance from Brazilian institution.', 'Enrollment proof, financial means, passport, criminal record', '1-2 months', 'R$ 300', 'https://www.gov.br/'),
('any', 'brazil', 'Visit', 'Tourist Visa', 'Short-term tourism.', 'Valid passport (many nationalities visa-free 90 days).', 'Passport, return ticket, hotel reservation', 'On arrival or 10 days', 'Free-$80 USD', 'https://www.gov.br/'),
('any', 'brazil', 'Investor', 'Investor Visa (VITEM II)', 'Investment-based visa.', 'R$ 500,000+ investment or R$ 150,000+ with job creation.', 'Investment proof, business plan, company registration', '2-4 months', 'R$ 600-1,200', 'https://www.gov.br/'),
('any', 'brazil', 'Retirement', 'Retirement Visa (VITEM XV)', 'For retirees with stable income.', '$2,000+ USD monthly pension.', 'Proof of pension, passport, criminal record, health insurance', '2-3 months', 'R$ 300-600', 'https://www.gov.br/');

-- Chile Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'chile', 'Work', 'Work Visa (Sujeta a Contrato)', 'Employment-based residence.', 'Job offer from Chilean employer.', 'Employment contract, qualifications, passport, criminal record', '1-3 months', 'CLP 100,000-200,000', 'https://serviciomigraciones.cl/'),
('any', 'chile', 'Digital Nomad', 'Temporary Residence for Remote Workers', 'Digital nomad visa for remote professionals.', 'Remote employment, $1,500+ USD monthly income.', 'Proof of remote work, income statements, health insurance', '1-2 months', 'CLP 120,000', 'https://serviciomigraciones.cl/'),
('any', 'chile', 'Study', 'Student Visa', 'For studying in Chile.', 'Acceptance from Chilean institution.', 'Admission letter, financial proof, passport, criminal record', '1-2 months', 'CLP 100,000', 'https://serviciomigraciones.cl/'),
('any', 'chile', 'Visit', 'Tourist Visa', 'Short-stay tourism.', 'Valid passport (many nationalities visa-free 90 days).', 'Passport, return ticket', 'On arrival', 'Free', 'https://serviciomigraciones.cl/'),
('any', 'chile', 'Investor', 'Investor Visa', 'Investment-based residence.', '$200,000+ USD investment in Chilean business.', 'Investment proof, business plan, financial statements, passport', '2-4 months', 'CLP 200,000-400,000', 'https://serviciomigraciones.cl/'),
('any', 'chile', 'Retirement', 'Temporary Residence (Rentista)', 'Income-based visa for retirees.', '$1,500+ USD monthly stable income.', 'Proof of pension/income, passport, criminal record', '2-3 months', 'CLP 150,000', 'https://serviciomigraciones.cl/');

-- Ecuador Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'ecuador', 'Visit', 'Tourist Visa', 'Tourism and short visits.', 'Valid passport (many nationalities visa-free 90 days).', 'Passport, return ticket, accommodation proof', 'On arrival', 'Free', 'https://www.cancilleria.gob.ec/'),
('any', 'ecuador', 'Retirement', 'Pensioner Visa', 'Retirement visa with discounts.', '$1,350+ USD monthly pension (or $800+ with dependents).', 'Proof of pension, passport, criminal record, health cert', '2-3 months', '$450 USD', 'https://www.cancilleria.gob.ec/'),
('any', 'ecuador', 'Investor', 'Investor Visa', 'Investment-based residence.', '$40,000+ real estate or business investment.', 'Property title or business registration, financial proof, passport', '2-4 months', '$450 USD', 'https://www.cancilleria.gob.ec/'),
('any', 'ecuador', 'Work', 'Work Visa', 'Employment authorization.', 'Job offer from Ecuadorian employer.', 'Employment contract, work permit, qualifications, passport', '2-3 months', '$450 USD', 'https://www.cancilleria.gob.ec/'),
('any', 'ecuador', 'Study', 'Student Visa', 'For international students.', 'Enrollment in Ecuadorian institution.', 'Admission letter, financial proof, passport, criminal record', '2-3 months', '$450 USD', 'https://www.cancilleria.gob.ec/'),
('any', 'ecuador', 'Digital Nomad', 'Professional Visa (for Remote Work)', 'Visa for digital nomads and remote workers.', 'Proof of remote employment or freelance income.', 'Employment proof, income statements, passport, criminal record', '2-3 months', '$450 USD', 'https://www.cancilleria.gob.ec/');

-- Panama Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'panama', 'Residency', 'Friendly Nations Visa', 'Fast-track residency for 50 countries.', 'Nationality from friendly nations list, economic ties.', 'Bank deposit $5,000, company formation or employment, passport', '3-6 months', '$1,500-3,000 USD', 'https://www.migracion.gob.pa/'),
('any', 'panama', 'Retirement', 'Pensionado Visa', 'Retirement visa with benefits.', '$1,000+ USD monthly pension.', 'Pension proof from government/company, passport, medical cert', '3-6 months', '$1,000-2,000 USD', 'https://www.migracion.gob.pa/'),
('any', 'panama', 'Investor', 'Qualified Investor Visa', 'Investment-based residency.', '$300,000+ real estate investment.', 'Property title, appraisal, financial statements, passport', '4-8 months', '$2,000-5,000 USD', 'https://www.migracion.gob.pa/'),
('any', 'panama', 'Visit', 'Tourist Visa', 'Short-stay tourism.', 'Valid passport (many nationalities visa-free 180 days).', 'Passport, return ticket, $500+ cash or credit card', 'On arrival or 1 week', 'Free-$250 USD', 'https://www.migracion.gob.pa/'),
('any', 'panama', 'Work', 'Work Permit', 'Employment authorization.', 'Job offer from Panamanian employer.', 'Employment contract, work permit, qualifications, passport', '2-4 months', '$1,000-2,000 USD', 'https://www.migracion.gob.pa/'),
('any', 'panama', 'Study', 'Student Visa', 'For studying in Panama.', 'Acceptance from Panamanian institution.', 'Admission letter, financial proof, passport, medical cert', '2-3 months', '$500-1,000 USD', 'https://www.migracion.gob.pa/');
