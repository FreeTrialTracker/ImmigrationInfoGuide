/*
  # Add "Any Passport" Generic Pathways for Major Destinations
  
  1. Purpose
    - Add generic immigration pathways that apply to ANY passport holder
    - Covers the 14 major destinations already in database: US, UK, Canada, Australia, etc.
    - Ensures searches from any country to these destinations return results
    
  2. Coverage
    - United States: Work, Study, Visit, Investor visas
    - United Kingdom: Work, Study, Visit, Investor visas
    - Canada: Work, Study, Visit, Residency visas
    - Australia: Work, Study, Visit, Retirement visas
    - And other major destinations
    
  3. Note
    - These are general pathways - specific passport holders may have additional options
    - Users should always verify requirements based on their nationality
*/

-- United States (US) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'us', 'Work', 'H-1B Specialty Occupation Visa', 'Work visa for specialized professional occupations.', 'Bachelor''s degree or equivalent, job offer in specialty occupation.', 'Job offer, degree, Labor Condition Application, petition approval', '3-6 months (lottery system)', '$460-$2,500 + legal fees', 'https://www.uscis.gov/'),
('any', 'us', 'Study', 'F-1 Student Visa', 'Student visa for academic studies.', 'Acceptance to SEVP-certified school, proof of financial support.', 'I-20 form, financial proof, SEVIS fee, passport, ties to home country', '2-4 months', '$510 (visa + SEVIS)', 'https://www.ice.gov/sevis/'),
('any', 'us', 'Visit', 'B-2 Tourist Visa', 'Temporary visitor visa for tourism.', 'Valid passport, ties to home country.', 'DS-160 form, visa interview, financial proof, return ticket intent', '2-8 weeks', '$185', 'https://travel.state.gov/'),
('any', 'us', 'Investor', 'EB-5 Immigrant Investor', 'Investment-based permanent residence.', '$800,000-$1,050,000 investment creating 10+ jobs.', 'Investment proof, business plan, source of funds, job creation', '2-5 years', '$11,160 + investment', 'https://www.uscis.gov/');

-- United Kingdom (GB) - Any Passport Pathways  
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'gb', 'Work', 'Skilled Worker Visa', 'Work visa for skilled professionals with job offers.', 'Job offer from licensed sponsor, £26,200+ salary or going rate.', 'Certificate of Sponsorship, English proficiency, maintenance funds', '3 weeks outside UK, 8 weeks inside', '£625-£1,423', 'https://www.gov.uk/skilled-worker-visa'),
('any', 'gb', 'Study', 'Student Visa', 'Study visa for courses over 6 months.', 'Confirmation of Acceptance for Studies from licensed institution.', 'CAS, financial proof £1,023-£1,334/month, English proficiency', '3 weeks', '£363-£490', 'https://www.gov.uk/student-visa'),
('any', 'gb', 'Visit', 'Standard Visitor Visa', 'Short-term visitor visa for tourism/business.', 'Valid passport, proof of departure intent.', 'Financial evidence, accommodation details, travel itinerary', '3 weeks', '£100-£822', 'https://www.gov.uk/standard-visitor-visa'),
('any', 'gb', 'Investor', 'Innovator Founder Visa', 'For innovative business founders.', '£50,000 funding, endorsement from approved body.', 'Business plan, endorsement, innovation criteria, maintenance funds', '3 weeks', '£1,191', 'https://www.gov.uk/innovator-founder-visa');

-- Canada (CA) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'ca', 'Work', 'Temporary Foreign Worker Program', 'Work permit through employer sponsorship.', 'Valid job offer and Labour Market Impact Assessment.', 'Job offer, LMIA approval, work permit application, medical exam', '2-6 months', 'CAD $155-$255', 'https://www.canada.ca/en/immigration-refugees-citizenship/services/work-canada.html'),
('any', 'ca', 'Study', 'Study Permit', 'Permit for international students.', 'Acceptance from Designated Learning Institution.', 'Letter of acceptance, proof of funds CAD $20,635/year, medical exam', '4-8 weeks online, 2-4 months paper', 'CAD $150', 'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada.html'),
('any', 'ca', 'Visit', 'Visitor Visa (TRV)', 'Temporary resident visa for tourism.', 'Valid passport, ties to home country.', 'Application form, financial proof, ties to home, travel history', '2-4 weeks', 'CAD $100', 'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada.html'),
('any', 'ca', 'Residency', 'Express Entry (Federal Skilled Worker)', 'Permanent residence for skilled workers.', 'Skilled work experience, language proficiency, education.', 'CRS score, language tests, education assessment, work experience', '6 months', 'CAD $1,365 + dependents', 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html');

-- Australia (AU) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'au', 'Work', 'Temporary Skill Shortage (TSS) Visa (482)', 'Temporary work visa for skilled workers.', 'Nomination by approved sponsor, skills on occupation list.', 'Employer sponsorship, skills assessment, English proficiency, 2+ years experience', '1-4 months', 'AUD $1,455-$3,035', 'https://immi.homeaffairs.gov.au/'),
('any', 'au', 'Study', 'Student Visa (Subclass 500)', 'Study visa for international students.', 'Confirmation of Enrolment from registered institution.', 'CoE, Genuine Student requirement, financial capacity, health insurance', '4-8 weeks', 'AUD $650', 'https://immi.homeaffairs.gov.au/'),
('any', 'au', 'Visit', 'Visitor Visa (Subclass 600)', 'Tourist and business visitor visa.', 'Valid passport, genuine visitor intent.', 'Application, financial evidence, health/character requirements', '2-4 weeks', 'AUD $150-$380', 'https://immi.homeaffairs.gov.au/'),
('any', 'au', 'Retirement', 'Investor Retirement Visa (Subclass 405)', 'Retirement visa for self-funded retirees.', 'Age 55+, AUD $500,000+ investment, no dependents.', 'Age proof, investment in complying instrument, health insurance', '6-12 months', 'AUD $2,470', 'https://immi.homeaffairs.gov.au/');

-- Germany (DE) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'de', 'Work', 'EU Blue Card', 'Work permit for highly qualified professionals.', 'University degree, €45,300+ annual salary (€41,041.80 for shortage occupations).', 'Job offer, degree recognition, salary threshold, health insurance', '1-3 months', '€100-€140', 'https://www.make-it-in-germany.com/'),
('any', 'de', 'Study', 'Student Visa', 'Study permit for university students.', 'Admission to German university.', 'University admission, blocked account €11,208/year, health insurance', '6-12 weeks', '€75-€110', 'https://www.make-it-in-germany.com/'),
('any', 'de', 'Visit', 'Schengen Tourist Visa', 'Short-stay visa for tourism.', 'Valid passport and travel purpose.', 'Application form, travel insurance, financial proof, accommodation', '15 days', '€80', 'https://www.auswaertiges-amt.de/');

-- Spain (ES) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'es', 'Work', 'Work Visa (Cuenta Ajena)', 'Employment authorization for employees.', 'Job offer from Spanish employer.', 'Employment contract, work authorization, health insurance, no criminal record', '1-3 months', '€70-€150', 'https://www.inclusion.gob.es/'),
('any', 'es', 'Digital Nomad', 'Digital Nomad Visa', 'Remote work visa for digital professionals.', 'Remote employment or clients outside Spain, €2,160+ monthly income.', 'Employment/client contracts, income proof, health insurance, degree', '1-3 months', '€80', 'https://www.inclusion.gob.es/'),
('any', 'es', 'Study', 'Student Visa', 'Study authorization for academic programs.', 'Acceptance from Spanish institution.', 'Admission letter, financial means €6,000-€8,000/year, health insurance', '1-2 months', '€80', 'https://www.inclusion.gob.es/');

-- Portugal (PT) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'pt', 'Work', 'Work Visa (Type D1)', 'Employment authorization.', 'Job offer or employment contract.', 'Employment contract, criminal record, health insurance, accommodation', '2-4 months', '€83-€169', 'https://imigrante.sef.pt/'),
('any', 'pt', 'Digital Nomad', 'Digital Nomad Visa', 'Remote work visa.', 'Remote employment, €3,280+ monthly income (4x minimum wage).', 'Employment proof, income statements, health insurance, accommodation', '2-4 months', '€83', 'https://imigrante.sef.pt/'),
('any', 'pt', 'Study', 'Student Visa (Type D4)', 'Student authorization.', 'Acceptance from Portuguese institution.', 'Admission proof, financial means, health insurance, accommodation', '2-3 months', '€83', 'https://imigrante.sef.pt/');

-- New Zealand (NZ) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'nz', 'Work', 'Accredited Employer Work Visa', 'Work visa for skilled employment.', 'Job offer from accredited employer.', 'Job offer, job check approval, health/character requirements', '2-6 months', 'NZD $495-$680', 'https://www.immigration.govt.nz/'),
('any', 'nz', 'Study', 'Student Visa', 'Study authorization.', 'Enrollment in approved institution.', 'Offer of place, tuition fees paid, living costs proof NZD $20,000/year', '4-8 weeks', 'NZD $295-$375', 'https://www.immigration.govt.nz/'),
('any', 'nz', 'Visit', 'Visitor Visa', 'Tourism and short visits.', 'Valid passport.', 'Application, financial proof, health/character requirements', '2-4 weeks', 'NZD $211-$246', 'https://www.immigration.govt.nz/');

-- Singapore (SG) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'sg', 'Work', 'Employment Pass', 'Work pass for professionals and managers.', 'Fixed monthly salary SGD $5,000+, acceptable qualifications.', 'Job offer, degree, salary threshold, valid passport', '3 weeks', 'SGD $105', 'https://www.mom.gov.sg/'),
('any', 'sg', 'Study', 'Student''s Pass', 'Study authorization.', 'Acceptance from approved institution.', 'Admission letter, student''s pass application, in-principle approval', '2-4 weeks', 'SGD $90', 'https://www.ica.gov.sg/'),
('any', 'sg', 'Visit', 'Visit Pass', 'Short-term visit authorization.', 'Valid passport (many visa-free).', 'Passport, return ticket, sufficient funds', 'On arrival or 5 days', 'Free-$30 SGD', 'https://www.ica.gov.sg/');

-- Japan (JP) - Any Passport Pathways
INSERT INTO immigration_pathways (passport_slug, destination_slug, goal, pathway_name, summary, eligibility, key_requirements, typical_timeline, estimated_fees, official_url) VALUES
('any', 'jp', 'Work', 'Engineer/Specialist in Humanities/International Services', 'Work visa for skilled professionals.', 'University degree, employment contract with Japanese company.', 'Job offer, Certificate of Eligibility, degree, work experience', '1-3 months', '¥3,000-¥4,000', 'https://www.mofa.go.jp/'),
('any', 'jp', 'Study', 'Student Visa', 'Study authorization for students.', 'Acceptance from Japanese educational institution.', 'Certificate of Eligibility, admission letter, financial proof', '1-3 months', '¥3,000', 'https://www.mofa.go.jp/'),
('any', 'jp', 'Visit', 'Temporary Visitor Visa', 'Short-term visit for tourism.', 'Valid passport.', 'Application form, passport, photo, itinerary', '5-10 days', '¥700-¥7,000 varies by nationality', 'https://www.mofa.go.jp/');
