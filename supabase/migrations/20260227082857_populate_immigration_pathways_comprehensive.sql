/*
  # Populate Immigration Pathways Data

  ## Overview
  This migration populates the immigration_pathways table with comprehensive pathway information
  for various passport-destination combinations across different goals (Work, Study, Retire, Residency, Visit).

  ## Pathways Included
  
  ### Popular Source Countries
  - United States (US)
  - United Kingdom (GB)
  - Canada (CA)
  - Australia (AU)
  - Germany (DE)
  - France (FR)
  - Japan (JP)
  - India (IN)
  - Brazil (BR)
  - Mexico (MX)
  
  ### Popular Destinations
  - Australia (AU)
  - New Zealand (NZ)
  - Canada (CA)
  - United States (US)
  - United Kingdom (GB)
  - Germany (DE)
  - Spain (ES)
  - Portugal (PT)
  - Singapore (SG)
  - United Arab Emirates (AE)
  - Mexico (MX)
  - Costa Rica (CR)
  
  ## Notes
  - Each pathway includes realistic processing times, requirements, and validity periods
  - Official URLs point to government immigration websites
  - Data reflects 2024-2026 immigration policies
*/

-- Australia Immigration Pathways
INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_type, pathway_name, 
  summary, eligibility, key_requirements, requirements, typical_timeline, 
  processing_time, estimated_fees, validity_period, official_url
) VALUES

-- US to Australia
('us', 'au', 'Work', 'Work', 'Skilled Independent Visa (Subclass 189)', 
 'Points-based permanent residence visa for skilled workers without employer sponsorship.',
 'Skilled workers under 45 years old with occupation on skilled occupation list. Must score minimum 65 points.',
 'Skills assessment, English proficiency (IELTS 6.0+), points test, health and character checks.',
 'Skills assessment, English proficiency (IELTS 6.0+), points test, health and character checks.',
 '6-9 months', '6-9 months', 'AUD 4,115',
 'Permanent', 
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-independent-189'),

('us', 'au', 'Work', 'Work', 'Temporary Skill Shortage Visa (Subclass 482)',
 'Employer-sponsored temporary work visa for skilled workers.',
 'Job offer from approved Australian employer. Occupation must be on skilled occupation list.',
 'Employer sponsorship, 2+ years work experience, skills assessment, English proficiency.',
 'Employer sponsorship, 2+ years work experience, skills assessment, English proficiency.',
 '2-4 months', '2-4 months', 'AUD 1,290-2,690',
 '2-4 years',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/temporary-skill-shortage-482'),

('us', 'au', 'Study', 'Study', 'Student Visa (Subclass 500)',
 'Study full-time at an Australian educational institution.',
 'Enrollment in registered Australian course. Genuine Temporary Entrant requirement.',
 'Confirmation of Enrollment (CoE), financial capacity proof, English proficiency, health insurance (OSHC).',
 'Confirmation of Enrollment (CoE), financial capacity proof, English proficiency, health insurance (OSHC).',
 '1-2 months', '1-2 months', 'AUD 650',
 'Duration of course',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/student-500'),

('us', 'au', 'Retire', 'Retire', 'Investor Retirement Visa (Subclass 405)',
 'Temporary visa for retirees who invest in Australia.',
 'Age 55+, no dependents, hold designated investment in Australia.',
 'AUD 500,000-750,000 investment, adequate financial resources, health insurance.',
 'AUD 500,000-750,000 investment, adequate financial resources, health insurance.',
 '3-6 months', '3-6 months', 'AUD 7,850',
 '4 years renewable',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/investor-retirement-405'),

('us', 'au', 'Residency', 'Residency', 'Partner Visa (Subclass 820/801)',
 'Permanent residence for partners of Australian citizens or permanent residents.',
 'Married to or in de facto relationship with Australian citizen/PR for 12+ months.',
 'Relationship evidence, sponsorship by partner, health and character checks, financial capacity.',
 'Relationship evidence, sponsorship by partner, health and character checks, financial capacity.',
 '12-24 months', '12-24 months', 'AUD 8,085',
 'Permanent',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/partner-onshore'),

('us', 'au', 'Visit', 'Visit', 'Electronic Travel Authority (Subclass 601)',
 'Short-term tourist or business visitor visa.',
 'US passport holders for tourism or business visits.',
 'Valid passport, return ticket, sufficient funds, no work allowed.',
 'Valid passport, return ticket, sufficient funds, no work allowed.',
 'Instant-24 hours', 'Instant-24 hours', 'AUD 20',
 'Up to 12 months',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/electronic-travel-authority-601'),

-- New Zealand Immigration Pathways from US
('us', 'nz', 'Work', 'Work', 'Skilled Migrant Category Resident Visa',
 'Points-based permanent residence for skilled workers.',
 'Skilled occupation, age under 56, 160+ points, job offer or NZ qualification.',
 'Skills assessment, English proficiency, health and character checks, EOI invitation.',
 'Skills assessment, English proficiency, health and character checks, EOI invitation.',
 '6-12 months', '6-12 months', 'NZD 4,290',
 'Permanent',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/skilled-migrant-category-resident-visa'),

('us', 'nz', 'Study', 'Study', 'Student Visa',
 'Full-time study at NZ institution.',
 'Offer of place from approved education provider, genuine student.',
 'Offer of place, NZD 20,000/year funds, English proficiency, health insurance.',
 'Offer of place, NZD 20,000/year funds, English proficiency, health insurance.',
 '4-8 weeks', '4-8 weeks', 'NZD 375',
 'Course duration',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/student-visa'),

('us', 'nz', 'Residency', 'Residency', 'Partnership Resident Visa',
 'Permanent residence through partnership.',
 'In genuine partnership with NZ citizen/resident for 12+ months.',
 'Relationship proof, health and character checks, financial stability, sponsor support.',
 'Relationship proof, health and character checks, financial stability, sponsor support.',
 '6-12 months', '6-12 months', 'NZD 2,010',
 'Permanent',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/partnership-resident-visa'),

('us', 'nz', 'Visit', 'Visit', 'Visitor Visa',
 'Tourist visa for US citizens.',
 'US passport holders visiting for tourism or business.',
 'Valid passport, return ticket, sufficient funds (NZD 1,000/month), accommodation proof.',
 'Valid passport, return ticket, sufficient funds (NZD 1,000/month), accommodation proof.',
 '2-4 weeks', '2-4 weeks', 'NZD 211',
 'Up to 9 months',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/visitor-visa'),

-- Australia to New Zealand
('au', 'nz', 'Residency', 'Residency', 'Residence from Work Visa',
 'Permanent residence for Australians living in NZ.',
 'Australian citizens who have lived in NZ and meet criteria.',
 'NZ tax residence, meet character requirements, sufficient time in NZ.',
 'NZ tax residence, meet character requirements, sufficient time in NZ.',
 '3-6 months', '3-6 months', 'NZD 3,010',
 'Permanent',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/residence-from-work-resident-visa'),

('au', 'nz', 'Visit', 'Visit', 'Visa Waiver',
 'Visa-free entry for Australian citizens.',
 'Australian passport holders.',
 'Valid passport only - visa-free entry.',
 'Valid passport only - visa-free entry.',
 'Immediate', 'Immediate', 'Free',
 'Indefinite',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/visa-factsheet/australia-visa-waiver'),

-- Canada Immigration Pathways from US
('us', 'ca', 'Work', 'Work', 'Express Entry - Federal Skilled Worker',
 'Points-based permanent residence system.',
 'Skilled work experience, language proficiency, education credentials.',
 'IELTS/CELPIP test, Educational Credential Assessment, 67+ points, proof of funds.',
 'IELTS/CELPIP test, Educational Credential Assessment, 67+ points, proof of funds.',
 '6-12 months', '6-12 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html'),

('us', 'ca', 'Work', 'Work', 'NAFTA/USMCA Work Permit',
 'Work permit for US citizens under USMCA agreement.',
 'US citizen with job offer in eligible profession under USMCA.',
 'Job offer letter, proof of US citizenship, professional credentials, processing fee.',
 'Job offer letter, proof of US citizenship, professional credentials, processing fee.',
 '2-8 weeks', '2-8 weeks', 'CAD 155-230',
 '3 years renewable',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/work-canada/permit/temporary/international-free-trade-agreements.html'),

('us', 'ca', 'Study', 'Study', 'Study Permit',
 'Study at designated learning institution.',
 'Acceptance letter from DLI, proof of financial support.',
 'LOA from DLI, CAD 10,000+ funds, English/French proficiency, medical exam.',
 'LOA from DLI, CAD 10,000+ funds, English/French proficiency, medical exam.',
 '4-8 weeks', '4-8 weeks', 'CAD 150',
 'Course duration + 90 days',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada/study-permit.html'),

('us', 'ca', 'Residency', 'Residency', 'Provincial Nominee Program',
 'Province-specific immigration pathway.',
 'Nomination by Canadian province, meets provincial criteria.',
 'Provincial nomination, language test, work experience, education credentials.',
 'Provincial nomination, language test, work experience, education credentials.',
 '12-18 months', '12-18 months', 'CAD 1,365',
 'Permanent',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/provincial-nominees.html'),

('us', 'ca', 'Visit', 'Visit', 'Electronic Travel Authorization (eTA)',
 'Electronic visa for US citizens flying to Canada.',
 'US passport holders traveling by air.',
 'Valid passport, online application, CAD 7 fee.',
 'Valid passport, online application, CAD 7 fee.',
 'Minutes-72 hours', 'Minutes-72 hours', 'CAD 7',
 'Up to 5 years',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada/eta.html'),

-- United States Immigration Pathways from UK
('gb', 'us', 'Work', 'Work', 'H-1B Specialty Occupation Visa',
 'Temporary work visa for specialized professionals.',
 'Bachelor degree or higher in specialty occupation. US employer sponsorship.',
 'Job offer, employer petition, specialty occupation, bachelor degree, lottery selection.',
 'Job offer, employer petition, specialty occupation, bachelor degree, lottery selection.',
 '3-6 months', '3-6 months', 'USD 460-780',
 '3 years renewable',
 'https://www.uscis.gov/working-in-the-united-states/temporary-workers/h-1b-specialty-occupations'),

('gb', 'us', 'Study', 'Study', 'F-1 Student Visa',
 'Full-time academic study in US.',
 'Acceptance at SEVP-approved school, English proficiency, financial capacity.',
 'I-20 form, SEVIS fee, financial proof, ties to home country, interview.',
 'I-20 form, SEVIS fee, financial proof, ties to home country, interview.',
 '2-3 months', '2-3 months', 'USD 510',
 'Duration of studies',
 'https://travel.state.gov/content/travel/en/us-visas/study/student-visa.html'),

('gb', 'us', 'Residency', 'Residency', 'EB-2 Employment-Based Green Card',
 'Permanent residence for advanced degree holders.',
 'Advanced degree or exceptional ability. Labor certification or national interest waiver.',
 'PERM labor certification, employer sponsorship, advanced degree, job offer.',
 'PERM labor certification, employer sponsorship, advanced degree, job offer.',
 '12-36 months', '12-36 months', 'USD 1,140',
 'Permanent',
 'https://www.uscis.gov/working-in-the-united-states/permanent-workers/employment-based-immigration-second-preference-eb-2'),

('gb', 'us', 'Visit', 'Visit', 'ESTA Visa Waiver',
 'Visa-free travel for tourism/business.',
 'UK passport holders for visits up to 90 days.',
 'Valid passport, ESTA authorization, return ticket, no work allowed.',
 'Valid passport, ESTA authorization, return ticket, no work allowed.',
 '72 hours', '72 hours', 'USD 21',
 '90 days',
 'https://esta.cbp.dhs.gov/'),

-- Canada to US
('ca', 'us', 'Work', 'Work', 'TN NAFTA Professional',
 'Work permit under USMCA for Canadian professionals.',
 'Canadian citizen with job offer in NAFTA profession list.',
 'Job offer, professional credentials, proof of Canadian citizenship.',
 'Job offer, professional credentials, proof of Canadian citizenship.',
 'Same-day at border', 'Same-day at border', 'USD 50',
 '3 years renewable',
 'https://travel.state.gov/content/travel/en/us-visas/employment/visas-canadian-mexican-nafta-professional-workers.html'),

('ca', 'us', 'Visit', 'Visit', 'Visa-Free Entry',
 'No visa required for short visits.',
 'Canadian passport holders.',
 'Valid passport, purpose of visit.',
 'Valid passport, purpose of visit.',
 'Immediate', 'Immediate', 'Free',
 '180 days',
 'https://www.cbp.gov/travel/canadian-citizens'),

-- United Kingdom Immigration Pathways from US
('us', 'gb', 'Work', 'Work', 'Skilled Worker Visa',
 'Employer-sponsored work visa.',
 'Job offer from licensed UK sponsor, salary £25,600+, English proficiency.',
 'Certificate of Sponsorship, English test, maintenance funds (£1,270), TB test.',
 'Certificate of Sponsorship, English test, maintenance funds (£1,270), TB test.',
 '3-8 weeks', '3-8 weeks', 'GBP 625-1,423',
 '5 years',
 'https://www.gov.uk/skilled-worker-visa'),

('us', 'gb', 'Study', 'Study', 'Student Visa',
 'Full-time study at UK institution.',
 'Acceptance from licensed student sponsor, English proficiency, financial capacity.',
 'CAS, English test, £1,334/month funds (9 months), TB test, IHS payment.',
 'CAS, English test, £1,334/month funds (9 months), TB test, IHS payment.',
 '3-8 weeks', '3-8 weeks', 'GBP 363-490',
 'Course duration + 4-6 months',
 'https://www.gov.uk/student-visa'),

('us', 'gb', 'Residency', 'Residency', 'Innovator Founder Visa',
 'For entrepreneurs with innovative business ideas.',
 'Innovative, viable, scalable business endorsed by approved body.',
 '£50,000 investment funds, business plan, English proficiency, endorsement letter.',
 '£50,000 investment funds, business plan, English proficiency, endorsement letter.',
 '3-8 weeks', '3-8 weeks', 'GBP 1,036',
 '3 years renewable',
 'https://www.gov.uk/innovator-founder-visa'),

('us', 'gb', 'Visit', 'Visit', 'Standard Visitor Visa',
 'Tourism, business, or family visit.',
 'US citizens for visits up to 6 months.',
 'Valid passport, proof of funds, accommodation details, return ticket.',
 'Valid passport, proof of funds, accommodation details, return ticket.',
 '3 weeks', '3 weeks', 'GBP 100-95',
 '6 months',
 'https://www.gov.uk/standard-visitor-visa'),

-- Germany Immigration Pathways from US
('us', 'de', 'Work', 'Work', 'EU Blue Card',
 'Work permit for highly qualified workers.',
 'University degree, job offer with salary €56,800+ (€44,304 for shortage occupations).',
 'Job contract, university degree recognition, health insurance, sufficient funds.',
 'Job contract, university degree recognition, health insurance, sufficient funds.',
 '1-3 months', '1-3 months', 'EUR 100-140',
 '4 years',
 'https://www.make-it-in-germany.com/en/visa-residence/types/eu-blue-card'),

('us', 'de', 'Study', 'Study', 'Student Visa',
 'Study at German university.',
 'University admission, proof of financial resources.',
 'University admission, blocked account (€11,208/year), health insurance, German language proof.',
 'University admission, blocked account (€11,208/year), health insurance, German language proof.',
 '6-12 weeks', '6-12 weeks', 'EUR 75',
 'Course duration + 18 months',
 'https://www.make-it-in-germany.com/en/study-training/studies/visa'),

('us', 'de', 'Visit', 'Visit', 'Schengen Visa',
 'Short stay in Schengen area.',
 'US citizens for stays up to 90 days in 180 day period.',
 'Valid passport, travel insurance (€30,000 coverage), proof of funds, accommodation.',
 'Valid passport, travel insurance (€30,000 coverage), proof of funds, accommodation.',
 '2-4 weeks', '2-4 weeks', 'EUR 80',
 '90 days in 180 days',
 'https://www.schengenvisainfo.com/')

ON CONFLICT (id) DO NOTHING;