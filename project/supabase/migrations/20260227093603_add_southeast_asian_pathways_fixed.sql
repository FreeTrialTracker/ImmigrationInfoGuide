/*
  # Add Southeast Asian Immigration Pathways
  
  1. New Pathways Added
    - Thailand: Digital Nomad Visa (DTV), Tourist Visa, Work Permit, Education Visa, Retirement Visa
    - Cambodia: E-Visa, Business Visa, Tourist Visa, Retirement Visa
    - Vietnam: E-Visa, Business Visa, Tourist Visa, Work Permit
    - Indonesia: Digital Nomad Visa, Tourist Visa, Business Visa, Retirement Visa (KITAS)
    - Malaysia: Digital Nomad Visa (DE Rantau), Tourist Visa, Work Visa, MM2H Retirement
    - Philippines: Tourist Visa, Work Visa, SRRV Retirement, Student Visa
    
  2. Coverage
    - Each country receives pathways for Work, Study, Visit, Residency, Digital Nomad, and Retirement goals
    - Pathways available for all passport holders (passport_slug = 'any')
*/

-- Thailand Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'thailand', 'Digital Nomad', 'Destination Thailand Visa (DTV)', 'Digital nomad visa for remote workers and freelancers.', 'Remote workers with proof of employment or freelance contracts.', 'Proof of remote work, 500,000 THB bank balance, passport, photos', '15 business days', '10,000 THB (~$280 USD)', 'https://www.mfa.go.th/'),
('any', 'thailand', 'Visit', 'Tourist Visa', 'Short-term tourist visa for leisure travel.', 'Valid passport with 6+ months validity.', 'Passport, photos, proof of accommodation, return ticket', '3-5 business days', '1,000-2,000 THB', 'https://www.mfa.go.th/'),
('any', 'thailand', 'Work', 'Non-Immigrant B Visa + Work Permit', 'Employment visa for working in Thailand.', 'Job offer from Thai employer.', 'Employment contract, company documents, degree, medical certificate', '2-4 weeks', '2,000-5,000 THB', 'https://www.mol.go.th/'),
('any', 'thailand', 'Study', 'Non-Immigrant ED Visa', 'Student visa for studying in Thailand.', 'Acceptance from Thai educational institution.', 'Letter of acceptance, financial proof, passport, photos', '2-3 weeks', '2,000 THB', 'https://www.mfa.go.th/'),
('any', 'thailand', 'Retirement', 'Non-Immigrant O-A Visa (Retirement)', 'Long-term retirement visa for those 50+.', 'Age 50+, 800k THB bank balance or 65k THB monthly income.', 'Financial proof, health insurance, police clearance, medical cert', '2-4 weeks', '5,000 THB', 'https://www.mfa.go.th/');

-- Cambodia Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'cambodia', 'Visit', 'Cambodia E-Visa', 'Electronic tourist visa for short stays.', 'Valid passport with 6+ months validity.', 'Passport scan, photo, online payment', '3 business days', '$36 USD', 'https://www.evisa.gov.kh/'),
('any', 'cambodia', 'Work', 'E-Class Business Visa', 'Business visa convertible to work permit.', 'Employment in Cambodia.', 'Passport, photos, employment letter, company registration', '1 week', '$35-285 USD depending on duration', 'https://www.evisa.gov.kh/'),
('any', 'cambodia', 'Study', 'E-Class Student Visa', 'Student visa for educational purposes.', 'Enrollment in Cambodian institution.', 'Acceptance letter, passport, photos, tuition payment proof', '1 week', '$35 USD + extension fees', 'https://www.evisa.gov.kh/'),
('any', 'cambodia', 'Retirement', 'ER Class Retirement Visa', 'Retirement visa for foreign retirees.', 'Age 55+, $1,500 USD monthly income.', 'Financial proof, passport, photos, health check', '2-3 weeks', '$290 USD annually', 'https://www.evisa.gov.kh/'),
('any', 'cambodia', 'Digital Nomad', 'E-Class Business Visa (Digital Nomad)', 'Business visa suitable for digital nomads.', 'Remote work capability.', 'Passport, photos, proof of remote employment', '1 week', '$285 USD for 12 months', 'https://www.evisa.gov.kh/');

-- Vietnam Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'vietnam', 'Visit', 'Vietnam E-Visa', 'Electronic visa for tourism and business visits.', 'Valid passport.', 'Passport scan, photo, online payment', '3 business days', '$25 USD', 'https://evisa.xuatnhapcanh.gov.vn/'),
('any', 'vietnam', 'Work', 'Work Permit + LD Visa', 'Work authorization for foreign employees.', 'Job offer from Vietnamese employer.', 'Employment contract, degree, health check, criminal record, photos', '3-4 weeks', '$200-500 USD', 'https://www.molisa.gov.vn/'),
('any', 'vietnam', 'Study', 'DH Student Visa', 'Student visa for academic studies.', 'Acceptance from Vietnamese university.', 'Acceptance letter, passport, photos, health certificate', '2-3 weeks', '$50-100 USD', 'https://evisa.xuatnhapcanh.gov.vn/'),
('any', 'vietnam', 'Residency', 'TT Temporary Residence Card', 'Temporary residence for long-term stays.', 'Employment, investment, or family ties.', 'Employment contract, investment proof, or marriage certificate', '4-8 weeks', '$300-600 USD', 'https://evisa.xuatnhapcanh.gov.vn/');

-- Indonesia Pathways  
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'indonesia', 'Digital Nomad', 'Second Home Visa (Digital Nomad)', 'New digital nomad visa for remote workers.', 'Remote workers with $2,000 USD monthly income.', 'Proof of remote work, income proof, health insurance, passport', '2-3 weeks', '$1,500 USD for 5 years', 'https://www.imigrasi.go.id/'),
('any', 'indonesia', 'Visit', 'Visa on Arrival', 'Short-term tourist visa.', 'Citizens of 90+ countries.', 'Valid passport, return ticket, payment on arrival', 'On arrival', '500,000 IDR (~$32 USD)', 'https://www.imigrasi.go.id/'),
('any', 'indonesia', 'Work', 'KITAS Work Permit', 'Employment permit for foreign workers.', 'Job sponsorship from Indonesian company.', 'Employment contract, IMTA, educational certificates, medical exam', '4-8 weeks', '$300-1,000 USD', 'https://www.imigrasi.go.id/'),
('any', 'indonesia', 'Retirement', 'KITAS Retirement Visa', 'Retirement permit for expats age 55+.', 'Age 55+, sponsor, proof of funds.', 'Proof of pension/savings, sponsor letter, passport, photos', '4-6 weeks', '$400-800 USD annually', 'https://www.imigrasi.go.id/'),
('any', 'indonesia', 'Study', 'Student KITAS', 'Student permit for studying in Indonesia.', 'Acceptance from Indonesian institution.', 'Acceptance letter, sponsor, financial proof, passport', '3-6 weeks', '$300-600 USD', 'https://www.imigrasi.go.id/');

-- Malaysia Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'malaysia', 'Digital Nomad', 'DE Rantau Digital Nomad Pass', 'Digital nomad program for remote workers.', 'Remote worker, $24,000 USD annual income.', 'Proof of employment/clients, income proof, passport, photos', '4-6 weeks', 'RM 1,000 (~$215 USD)', 'https://mdec.my/'),
('any', 'malaysia', 'Visit', 'Tourist Visa / Visa-Free Entry', 'Tourism and short-term visits.', 'Varies by nationality (many visa-free 90 days).', 'Valid passport, return ticket, accommodation proof', 'Immediate or 3-5 days', 'Free to $200 MYR', 'https://www.imi.gov.my/'),
('any', 'malaysia', 'Work', 'Employment Pass', 'Work permit for professional employment.', 'Job offer, minimum salary threshold.', 'Employment contract, degree, passport, medical exam, photos', '2-4 weeks', 'RM 500-1,500', 'https://esd.imi.gov.my/'),
('any', 'malaysia', 'Retirement', 'Malaysia My Second Home (MM2H)', 'Long-term retirement visa program.', 'Age 50+, RM 1.5M assets or RM 40k monthly income.', 'Financial proof, health insurance, medical exam, passport', '3-6 months', 'RM 5,000-10,000', 'https://mm2h.gov.my/'),
('any', 'malaysia', 'Study', 'Student Pass', 'Visa for international students.', 'Acceptance from Malaysian institution.', 'Offer letter, financial proof, medical exam, passport, photos', '4-8 weeks', 'RM 500-1,000', 'https://educationmalaysia.gov.my/');

-- Philippines Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'philippines', 'Visit', 'Tourist Visa / Visa-Free Entry', 'Tourism and short visits.', 'Valid passport, varies by nationality.', 'Passport, return ticket, accommodation proof', 'Immediate or 1 week', 'Free to $50 USD', 'https://www.immigration.gov.ph/'),
('any', 'philippines', 'Work', '9(g) Work Visa', 'Employment visa for foreign workers.', 'Job offer from Philippine employer.', 'AEP work permit, employment contract, passport, NBI clearance', '4-8 weeks', '$200-500 USD', 'https://www.dole.gov.ph/'),
('any', 'philippines', 'Study', 'Student Visa (9f)', 'Visa for international students.', 'Enrollment in Philippine institution.', 'Acceptance letter, financial proof, passport, photos', '2-4 weeks', '$50-100 USD', 'https://www.immigration.gov.ph/'),
('any', 'philippines', 'Retirement', 'SRRV (Special Resident Retiree Visa)', 'Retirement visa program.', 'Age 35+ for former citizens, 50+ for others.', '$10,000-50,000 deposit, health insurance, medical exam, NBI clearance', '6-8 weeks', '$1,400 + deposit', 'https://www.pra.gov.ph/'),
('any', 'philippines', 'Residency', 'Quota Immigrant Visa', 'Permanent residency pathway.', 'Meet quota requirements or investment.', 'Financial proof, NBI clearance, medical exam, passport, photos', '6-12 months', '$500-1,000 USD', 'https://www.immigration.gov.ph/');
