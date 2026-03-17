/*
  # Add European Immigration Pathways
  
  1. New Pathways Added
    - Italy: Digital Nomad, Work, Study, Visit, Retirement, Investor visas
    - Netherlands: Knowledge Migrant, Student, Tourist, Self-Employed, Investor visas
    - Greece: Digital Nomad, Golden Visa, Tourist, Work, Student visas
    - Czech Republic: Long-term visa options for work, study, business
    - Poland: Work, Study, Business, Residence permits
    - Ireland: Work, Study, Visit permits
    
  2. Coverage
    - Popular EU destinations missing from the current database
    - Each country receives comprehensive pathway coverage
*/

-- Italy Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'italy', 'Digital Nomad', 'Italy Digital Nomad Visa', 'Remote work visa for digital professionals.', 'Remote workers earning €28,000+ annually.', 'Proof of remote employment, income proof, health insurance, accommodation', '30-90 days', '€116-250', 'https://vistoperitalia.esteri.it/'),
('any', 'italy', 'Work', 'Nulla Osta Work Permit', 'Employment authorization for skilled workers.', 'Job offer from Italian employer.', 'Employment contract, qualifications, salary above minimum, Nulla Osta', '2-6 months', '€200-400', 'https://vistoperitalia.esteri.it/'),
('any', 'italy', 'Study', 'Student Visa', 'Study visa for international students.', 'Acceptance from Italian university.', 'University acceptance, financial proof €6,000+, accommodation, insurance', '30-90 days', '€50-116', 'https://vistoperitalia.esteri.it/'),
('any', 'italy', 'Visit', 'Schengen Tourist Visa', 'Short-stay visa for tourism.', 'Valid passport and travel purpose.', 'Passport, travel insurance, accommodation, return ticket, financials', '15 days', '€80', 'https://vistoperitalia.esteri.it/'),
('any', 'italy', 'Investor', 'Investor Visa for Italy', 'Investment-based residence permit.', '€250,000+ investment in Italian companies or €2M government bonds.', 'Investment proof, business plan, financial statements, clean record', '3-6 months', '€500-1,000', 'https://investorvisa.mise.gov.it/'),
('any', 'italy', 'Retirement', 'Elective Residence Visa', 'Non-work residence for retirees.', '€31,000+ annual passive income, no employment in Italy.', 'Proof of pension/passive income, health insurance, accommodation', '30-90 days', '€116', 'https://vistoperitalia.esteri.it/');

-- Netherlands Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'netherlands', 'Work', 'Highly Skilled Migrant Visa', 'Work permit for highly skilled professionals.', 'Job offer from recognized sponsor, €5,008+ monthly salary.', 'Employment contract with sponsor, diploma, passport', '2-4 weeks', '€331-1,213', 'https://ind.nl/'),
('any', 'netherlands', 'Study', 'Student Residence Permit', 'Study permit for international students.', 'Acceptance from Dutch institution.', 'Proof of admission, financial means €11,880/year, insurance', '4-12 weeks', '€374', 'https://ind.nl/'),
('any', 'netherlands', 'Visit', 'Schengen Tourist Visa', 'Short-stay Schengen visa.', 'Valid passport and travel purpose.', 'Passport, insurance, accommodation, return ticket, financial proof', '15 days', '€80', 'https://ind.nl/'),
('any', 'netherlands', 'Residency', 'Self-Employed Person Permit', 'Permit for entrepreneurs and freelancers.', 'Business plan, sufficient income potential.', 'Business plan, financial statements, relevant experience, passport', '3-6 months', '€1,213', 'https://ind.nl/'),
('any', 'netherlands', 'Investor', 'Investor Residence Permit', 'For substantial investors in Dutch economy.', '€1,250,000 investment in innovative business.', 'Investment proof, business plan, financial documents', '3-6 months', '€1,213', 'https://ind.nl/');

-- Greece Pathways  
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'greece', 'Digital Nomad', 'Greece Digital Nomad Visa', 'Visa for remote workers and digital nomads.', '€3,500+ monthly income from non-Greek sources.', 'Proof of employment/income, health insurance, accommodation', '1-2 months', '€75-150', 'https://www.migration.gov.gr/'),
('any', 'greece', 'Investor', 'Golden Visa Program', 'Residence by investment program.', '€250,000+ real estate investment.', 'Property purchase proof, title deed, health insurance, clean record', '2-4 months', '€2,000-5,000', 'https://www.migration.gov.gr/'),
('any', 'greece', 'Visit', 'Schengen Tourist Visa', 'Tourism and short visits.', 'Valid passport.', 'Passport, insurance, accommodation, financials, return ticket', '15 days', '€80', 'https://www.migration.gov.gr/'),
('any', 'greece', 'Work', 'Work Permit', 'Employment authorization.', 'Job offer from Greek employer.', 'Employment contract, work permit approval, qualifications', '2-4 months', '€150-300', 'https://www.migration.gov.gr/'),
('any', 'greece', 'Study', 'Student Visa', 'For studying in Greece.', 'Acceptance from Greek institution.', 'Admission letter, financial proof, health insurance, accommodation', '1-2 months', '€150', 'https://www.migration.gov.gr/'),
('any', 'greece', 'Retirement', 'Financially Independent Residence', 'For retirees with stable income.', '€2,000+ monthly passive income.', 'Proof of pension/income, health insurance, accommodation', '2-3 months', '€150-300', 'https://www.migration.gov.gr/');

-- Czech Republic Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'czech-republic', 'Work', 'Employee Card', 'Combined work and residence permit.', 'Job offer from Czech employer.', 'Employment contract, qualifications, accommodation, health insurance', '2-3 months', 'CZK 2,500-10,000', 'https://www.mvcr.cz/'),
('any', 'czech-republic', 'Study', 'Long-term Student Visa', 'For studies over 90 days.', 'Acceptance from Czech institution.', 'Admission proof, financial means CZK 101,000/year, accommodation', '2-3 months', 'CZK 2,500', 'https://www.mvcr.cz/'),
('any', 'czech-republic', 'Visit', 'Schengen Tourist Visa', 'Short-stay tourism visa.', 'Valid passport and travel purpose.', 'Passport, insurance, accommodation, financial proof, return ticket', '15 days', '€80', 'https://www.mvcr.cz/'),
('any', 'czech-republic', 'Residency', 'Business Long-term Visa', 'For entrepreneurs and business owners.', 'Business plan and registration.', 'Trade license, business plan, financial proof, accommodation', '2-4 months', 'CZK 2,500-10,000', 'https://www.mvcr.cz/'),
('any', 'czech-republic', 'Digital Nomad', 'Freelance Visa (Zivnostensky List)', 'For freelancers and independent contractors.', 'Proof of freelance work and income.', 'Trade license, client contracts, financial statements, accommodation', '2-4 months', 'CZK 2,500-10,000', 'https://www.mvcr.cz/');

-- Poland Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'poland', 'Work', 'Work Permit + Residence', 'Work authorization and residence.', 'Job offer from Polish employer.', 'Employment contract, work permit, qualifications, accommodation', '1-3 months', 'PLN 340-640', 'https://www.gov.pl/'),
('any', 'poland', 'Study', 'Temporary Residence for Students', 'Student residence permit.', 'Acceptance from Polish university.', 'Admission letter, financial proof PLN 1,018/month, insurance', '1-2 months', 'PLN 340-440', 'https://www.gov.pl/'),
('any', 'poland', 'Visit', 'Schengen Tourist Visa', 'Short-term tourism visa.', 'Valid passport.', 'Passport, insurance, accommodation, financial proof, return ticket', '15 days', '€80 (PLN 380)', 'https://www.gov.pl/'),
('any', 'poland', 'Residency', 'Business Residence Permit', 'For business owners and entrepreneurs.', 'Registered business in Poland.', 'Business registration, business plan, financial proof, accommodation', '2-4 months', 'PLN 340-640', 'https://www.gov.pl/'),
('any', 'poland', 'Investor', 'Investor Residence Permit', 'Investment-based residence.', 'Significant investment in Polish economy.', 'Investment proof, business plan, financial documents', '3-6 months', 'PLN 640-1,500', 'https://www.gov.pl/');

-- Ireland Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'ireland', 'Work', 'Critical Skills Employment Permit', 'Work permit for skilled professionals.', '€30,000-34,000+ salary, skills on critical list.', 'Job offer, qualifications, salary threshold, contract', '8-12 weeks', '€1,000', 'https://www.irishimmigration.ie/'),
('any', 'ireland', 'Study', 'Study Visa (Stamp 2)', 'For full-time students.', 'Acceptance from Irish institution.', 'Admission letter, €7,000+ proof of funds, insurance, fees paid', '8-12 weeks', '€300', 'https://www.irishimmigration.ie/'),
('any', 'ireland', 'Visit', 'Visit Visa', 'Short-stay tourist visa.', 'Valid passport and travel purpose.', 'Passport, financial proof, accommodation, return ticket, purpose', '4-8 weeks', '€60-100', 'https://www.irishimmigration.ie/'),
('any', 'ireland', 'Residency', 'Start-up Entrepreneur Programme', 'For innovative entrepreneurs.', '€50,000 funding, approved business plan.', 'Business plan, funding proof, approval from HPSU, qualifications', '3-6 months', '€1,000', 'https://enterprise.gov.ie/'),
('any', 'ireland', 'Investor', 'Immigrant Investor Programme', 'Investment-based residency.', '€1 million investment in Irish enterprise.', 'Investment commitment, financial proof, clean record', '4-6 months', '€1,500', 'https://www.irishimmigration.ie/');
