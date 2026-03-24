/*
  # Add Digital Nomad Alternatives for Countries Without DN Visas

  ## Overview
  Some countries (US, UK, Canada, Australia, New Zealand, Singapore) don't have specific 
  digital nomad visas. For these, we provide alternative work visas that remote workers 
  can use, with clear explanations.

  ## Countries Covered
  - United States (alternative work visas for digital nomads)
  - United Kingdom (alternative visas)
  - Canada (alternative visas)
  - Australia (alternative visas)
  - New Zealand (alternative visas)
  - Singapore (alternative visas)
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_type, pathway_name,
  summary, eligibility, key_requirements, requirements, typical_timeline,
  processing_time, estimated_fees, validity_period, official_url
) VALUES

-- Digital Nomad alternatives for US (Work visas that remote workers can use)
('gb', 'us', 'Digital Nomad', 'Digital Nomad', 'B-1 Business Visitor Visa (Short-term Remote Work)',
 'B-1 visa allows some remote work while visiting US for short periods. Note: US does not have a dedicated digital nomad visa.',
 'UK citizens who work remotely for non-US employer while temporarily in US.',
 'Employment with non-US company, proof of temporary stay, return ticket.',
 'Foreign employment contract, proof working remotely for non-US company, ties to home country, return ticket.',
 '2-4 weeks', '2-4 weeks', 'USD 185',
 '6 months',
 'https://travel.state.gov/content/travel/en/us-visas/tourism-visit/visitor.html'),

('ca', 'us', 'Digital Nomad', 'Digital Nomad', 'Visa-Free Entry for Remote Work (Short-term)',
 'Canadian citizens can enter US visa-free for short visits and work remotely for Canadian employers. US does not offer a dedicated digital nomad visa.',
 'Canadian citizens working remotely for Canadian employer.',
 'Proof of Canadian employment, return plans, sufficient funds.',
 'Canadian passport, employment with Canadian company, proof of remote work arrangement.',
 'Immediate at border', 'Immediate', 'Free',
 'Up to 180 days',
 'https://www.cbp.gov/travel/canadian-citizens'),

('au', 'us', 'Digital Nomad', 'Digital Nomad', 'ESTA with Remote Work (Short-term)',
 'ESTA allows Australian citizens to visit US while working remotely for Australian employers. US does not have a digital nomad visa program.',
 'Australian citizens working remotely for non-US employer.',
 'ESTA authorization, remote employment with Australian company.',
 'Valid passport, ESTA authorization, employment outside US, return ticket.',
 '72 hours', '72 hours', 'USD 21',
 '90 days',
 'https://esta.cbp.dhs.gov/'),

('de', 'us', 'Digital Nomad', 'Digital Nomad', 'ESTA with Remote Work (Short-term)',
 'ESTA allows short visits while working remotely for non-US employers. No dedicated digital nomad visa available.',
 'German citizens working remotely for non-US company.',
 'ESTA, remote employment outside US.',
 'Valid passport, ESTA authorization, foreign employer, return ticket.',
 '72 hours', '72 hours', 'USD 21',
 '90 days',
 'https://esta.cbp.dhs.gov/'),

('fr', 'us', 'Digital Nomad', 'Digital Nomad', 'ESTA with Remote Work (Short-term)',
 'ESTA for short visits while working remotely. US does not offer digital nomad visas.',
 'French citizens working remotely for non-US employer.',
 'ESTA authorization, foreign employment.',
 'Valid passport, ESTA, employment outside US, return ticket.',
 '72 hours', '72 hours', 'USD 21',
 '90 days',
 'https://esta.cbp.dhs.gov/'),

-- Digital Nomad alternatives for UK
('us', 'gb', 'Digital Nomad', 'Digital Nomad', 'Standard Visitor Visa (Remote Work)',
 'UK Standard Visitor visa allows remote work for overseas employer during short stays. UK does not have a specific digital nomad visa.',
 'US citizens visiting UK while working remotely for US employer.',
 'Remote employment with non-UK company, return ticket, sufficient funds.',
 'Valid passport, proof of overseas employment, return ticket, accommodation, £95 visa fee.',
 '3 weeks', '3 weeks', 'GBP 100',
 '6 months',
 'https://www.gov.uk/standard-visitor-visa'),

('ca', 'gb', 'Digital Nomad', 'Digital Nomad', 'Standard Visitor Visa (Remote Work)',
 'Visit UK while working remotely for Canadian employer. UK has no dedicated digital nomad visa.',
 'Canadian citizens working remotely.',
 'Overseas employment, return ticket, funds.',
 'Valid passport, Canadian employment proof, return ticket, sufficient funds.',
 '3 weeks', '3 weeks', 'GBP 100',
 '6 months',
 'https://www.gov.uk/standard-visitor-visa'),

('au', 'gb', 'Digital Nomad', 'Digital Nomad', 'Standard Visitor Visa (Remote Work)',
 'Work remotely for Australian employer while visiting UK. No digital nomad visa available.',
 'Australian citizens with remote employment.',
 'Foreign employment, return ticket.',
 'Valid passport, proof of Australian employment, return ticket, funds.',
 '3 weeks', '3 weeks', 'GBP 100',
 '6 months',
 'https://www.gov.uk/standard-visitor-visa'),

-- Digital Nomad alternatives for Canada
('us', 'ca', 'Digital Nomad', 'Digital Nomad', 'Visitor Status with Remote Work',
 'US citizens can visit Canada and work remotely for US employers. Canada does not have a digital nomad visa.',
 'US citizens working remotely for US employer.',
 'Employment outside Canada, eTA if flying.',
 'Valid passport, eTA (if flying), proof of US employment, return plans.',
 'Minutes', 'Minutes', 'CAD 7 (if flying)',
 'Up to 6 months',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada.html'),

('gb', 'ca', 'Digital Nomad', 'Digital Nomad', 'Visitor Status with Remote Work',
 'Visit Canada while working remotely for UK employer. No dedicated digital nomad visa.',
 'UK citizens with remote employment.',
 'eTA, overseas employment.',
 'Valid passport, eTA, proof of UK employment, sufficient funds.',
 'Minutes', 'Minutes', 'CAD 7',
 'Up to 6 months',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada/eta.html'),

('au', 'ca', 'Digital Nomad', 'Digital Nomad', 'Visitor Status with Remote Work',
 'Work remotely for Australian employer while visiting Canada. No digital nomad visa program.',
 'Australian citizens working remotely.',
 'eTA, foreign employment.',
 'Valid passport, eTA, Australian employment proof.',
 'Minutes', 'Minutes', 'CAD 7',
 'Up to 6 months',
 'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada/eta.html'),

-- Digital Nomad alternatives for Australia
('us', 'au', 'Digital Nomad', 'Digital Nomad', 'Visitor Visa with Remote Work (Subclass 600)',
 'Tourist visa allowing remote work for overseas employer. Australia does not offer a digital nomad visa.',
 'US citizens working remotely for US employer while visiting.',
 'Overseas employment, return ticket, funds.',
 'Valid passport, proof of US employment, return ticket, sufficient funds, no local work.',
 '1-2 weeks', '1-2 weeks', 'AUD 145',
 'Up to 12 months',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/visitor-600'),

('gb', 'au', 'Digital Nomad', 'Digital Nomad', 'eVisitor with Remote Work (Subclass 651)',
 'Free tourist visa allowing remote work for overseas employer. No dedicated digital nomad visa.',
 'UK citizens working remotely.',
 'Foreign employment, return plans.',
 'Valid passport, proof of UK employment, no Australian work.',
 'Instant-24 hours', 'Instant-24 hours', 'Free',
 'Up to 3 months',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/evisitor-651'),

('ca', 'au', 'Digital Nomad', 'Digital Nomad', 'eVisitor with Remote Work (Subclass 651)',
 'Free visa allowing remote work while visiting. Australia has no digital nomad visa.',
 'Canadian citizens working remotely.',
 'Foreign employment.',
 'Valid passport, Canadian employment proof, no local work.',
 'Instant-24 hours', 'Instant-24 hours', 'Free',
 'Up to 3 months',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/evisitor-651'),

('de', 'au', 'Digital Nomad', 'Digital Nomad', 'eVisitor with Remote Work (Subclass 651)',
 'Free tourist visa with remote work for German employer. No digital nomad visa available.',
 'German citizens working remotely.',
 'Foreign employment.',
 'Valid passport, German employment proof.',
 'Instant-24 hours', 'Instant-24 hours', 'Free',
 'Up to 3 months',
 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/evisitor-651'),

-- Digital Nomad alternatives for New Zealand
('us', 'nz', 'Digital Nomad', 'Digital Nomad', 'Visitor Visa with Remote Work',
 'Visit NZ while working remotely for US employer. NZ does not have a digital nomad visa program.',
 'US citizens working remotely.',
 'Foreign employment, return ticket, funds.',
 'Valid passport, US employment proof, return ticket, NZD 1,000/month funds.',
 '2-4 weeks', '2-4 weeks', 'NZD 211',
 'Up to 9 months',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/visitor-visa'),

('gb', 'nz', 'Digital Nomad', 'Digital Nomad', 'Visitor Visa with Remote Work',
 'Work remotely while visiting NZ. No dedicated digital nomad visa.',
 'UK citizens working remotely.',
 'Foreign employment, funds.',
 'Valid passport, UK employment proof, NZD 1,000/month, return ticket.',
 '2-4 weeks', '2-4 weeks', 'NZD 211',
 'Up to 9 months',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/visitor-visa'),

('ca', 'nz', 'Digital Nomad', 'Digital Nomad', 'Visitor Visa with Remote Work',
 'Visit while working remotely for Canadian employer. NZ has no digital nomad visa.',
 'Canadian citizens working remotely.',
 'Foreign employment.',
 'Valid passport, Canadian employment proof, sufficient funds.',
 '2-4 weeks', '2-4 weeks', 'NZD 211',
 'Up to 9 months',
 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/visitor-visa'),

-- Digital Nomad alternatives for Singapore
('us', 'sg', 'Digital Nomad', 'Digital Nomad', 'Short-term Visit Pass with Remote Work',
 'Visit Singapore while working remotely. Singapore does not offer a digital nomad visa.',
 'US citizens working remotely for US employer.',
 'Foreign employment, return ticket.',
 'Valid passport (6+ months), US employment proof, return ticket, sufficient funds.',
 'On arrival', 'Immediate', 'Free',
 '30-90 days',
 'https://www.ica.gov.sg/enter-depart/entry_requirements/visa_requirements'),

('gb', 'sg', 'Digital Nomad', 'Digital Nomad', 'Short-term Visit Pass with Remote Work',
 'Work remotely while visiting Singapore. No digital nomad visa available.',
 'UK citizens working remotely.',
 'Foreign employment.',
 'Valid passport (6+ months), UK employment proof, return ticket.',
 'On arrival', 'Immediate', 'Free',
 '30-90 days',
 'https://www.ica.gov.sg/enter-depart/entry_requirements/visa_requirements'),

('ca', 'sg', 'Digital Nomad', 'Digital Nomad', 'Short-term Visit Pass with Remote Work',
 'Visit while working remotely. Singapore has no digital nomad visa program.',
 'Canadian citizens working remotely.',
 'Foreign employment.',
 'Valid passport (6+ months), Canadian employment proof.',
 'On arrival', 'Immediate', 'Free',
 '30-90 days',
 'https://www.ica.gov.sg/')

ON CONFLICT (id) DO NOTHING;