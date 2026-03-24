/*
  # Add Comprehensive Residency Pathways
  
  Adds general residency pathways for various passport holders.
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_name, summary,
  eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type
) VALUES

-- Various passports to residency destinations
('angola', 'pt', 'Residency', 'Portugal D7 Visa (Passive Income)', 
  'Residency for those with passive or remote income.',
  'Minimum €820/month passive income, NIF, Portuguese bank account.',
  'Income proof, accommodation, health insurance, clean criminal record.',
  '2-4 months', '€90-180',
  'Temporary Residence'),

('nigeria', 'es', 'Residency', 'Spain Family Reunification Visa', 
  'For family members of Spanish residents or citizens.',
  'Family relationship with Spanish resident/citizen (spouse, children, parents).',
  'Relationship proof, sponsor financial capacity, accommodation, health insurance.',
  '1-3 months', '€80-160',
  'Family Reunification'),

('south-africa', 'de', 'Residency', 'Germany Family Reunification', 
  'For spouses and children of German residents.',
  'Family relationship, German language A1 (spouses), sufficient living space.',
  'Marriage certificate, language certificate, accommodation proof, health insurance.',
  '2-6 months', '€75-100',
  'Family Reunification'),

('kenya', 'gb', 'Residency', 'UK Spouse/Partner Visa', 
  'For partners of UK citizens or settled persons.',
  'Genuine relationship, meet financial requirement (£18,600+/year), English proficiency.',
  'Relationship evidence, financial proof, English test, accommodation.',
  '2-6 months', '£1,846 outside UK',
  'Family Visa'),

('egypt', 'fr', 'Residency', 'France Long-Stay Family Visa', 
  'For family members of French citizens or residents.',
  'Family relationship with French citizen/resident.',
  'Relationship proof, financial capacity, accommodation, health insurance.',
  '2-4 months', '€99',
  'Family Visa'),

('morocco', 'it', 'Residency', 'Italy Family Reunification Visa', 
  'For family members of Italian residents.',
  'Family relationship, sponsor financial capacity, adequate housing.',
  'Relationship documents, financial proof, accommodation, health insurance.',
  '3-6 months', '€116',
  'Family Reunification'),

('philippines', 'ca', 'Residency', 'Canada Spousal Sponsorship', 
  'Permanent residence through Canadian spouse/partner sponsorship.',
  'Genuine relationship, sponsor meets income requirements.',
  'Relationship proof, medical exam, police clearances, sponsor application.',
  '12-24 months', 'CAD 1,135',
  'Permanent Residence'),

('vietnam', 'au', 'Residency', 'Australia Partner Visa', 
  'Permanent residence for partners of Australian citizens/PR.',
  'Genuine relationship, sponsor commitment, meet health/character requirements.',
  'Relationship evidence, medical exams, police checks, sponsor application.',
  '18-24 months', 'AUD 8,850',
  'Partner Visa'),

('bangladesh', 'nz', 'Residency', 'New Zealand Partnership Visa', 
  'Residence for partners of New Zealand citizens/residents.',
  'Living together in genuine relationship, partnership 12+ months.',
  'Relationship evidence, joint finances, medical certificates, police clearances.',
  '6-12 months', 'NZD 3,470',
  'Residence Visa'),

('pakistan', 'se', 'Residency', 'Sweden Family Reunification', 
  'For family members of Swedish residents.',
  'Family relationship, sponsor financial capacity and housing.',
  'Relationship proof, financial documents, accommodation, identity documents.',
  '8-15 months', 'SEK 1,000-2,000',
  'Residence Permit'),

('jordan', 'nl', 'Residency', 'Netherlands Family Reunification', 
  'For family members of Dutch residents.',
  'Family relationship, sponsor meets income requirement, basic civic integration exam.',
  'Relationship documents, income proof, civic integration diploma.',
  '3-6 months', '€350',
  'Regular Provisional Residence Permit'),

('lebanon', 'be', 'Residency', 'Belgium Family Reunification', 
  'For family members of Belgian residents.',
  'Family relationship, sufficient housing, health insurance.',
  'Relationship proof, accommodation, insurance, identity documents.',
  '3-9 months', '€215-350',
  'Family Reunification'),

('argentina', 'mx', 'Residency', 'Mexico Temporary Residence (Unity)', 
  'For family members of Mexican citizens or residents.',
  'Family relationship with Mexican national or temporary/permanent resident.',
  'Birth/marriage certificate, sponsor documents, application form.',
  '3-6 weeks', '$44-51',
  'Temporary Residence'),

('peru', 'chile', 'Residency', 'Chile Family Reunification Visa', 
  'For family members of Chilean residents.',
  'Family relationship with temporary or permanent resident.',
  'Relationship proof, sponsor financial capacity, clean criminal record.',
  '2-4 months', '$150-300',
  'Temporary Residence'),

('bolivia', 'br', 'Residency', 'Brazil Family Reunification Visa', 
  'For family members of Brazilian citizens or residents.',
  'Family relationship (spouse, children, parents).',
  'Relationship documents, sponsor proof of residence, police clearance.',
  '1-3 months', '$160-290',
  'Temporary or Permanent Visa'),

('ghana', 'ie', 'Residency', 'Ireland Join Family Permission', 
  'For non-EEA family members of Irish residents.',
  'Family relationship, sponsor financial capacity.',
  'Relationship proof, sponsor employment/income, marriage/birth certificates.',
  '4-8 months', '€60-300',
  'Stamp 4'),

('tunisia', 'no', 'Residency', 'Norway Family Immigration', 
  'For family members of Norwegian residents.',
  'Family relationship, sponsor meets income requirement.',
  'Relationship documentation, financial proof, identity documents.',
  '4-12 months', 'NOK 6,300',
  'Family Immigration'),

('algeria', 'dk', 'Residency', 'Denmark Family Reunification', 
  'For spouses and children of Danish residents.',
  'Marriage/relationship, attachment to Denmark stronger than home country, housing.',
  'Relationship proof, attachment documentation, accommodation, bank guarantee.',
  '4-10 months', 'DKK 3,675',
  'Family Reunification'),

('sri-lanka', 'fi', 'Residency', 'Finland Family Reunification', 
  'For family members of Finnish residents.',
  'Family relationship, sponsor financial capacity and housing.',
  'Relationship documents, financial proof, accommodation proof.',
  '4-9 months', '€520',
  'Residence Permit'),

('nepal', 'at', 'Residency', 'Austria Family Reunification', 
  'For family members of Austrian residents.',
  'Family relationship, adequate housing, health insurance, income.',
  'Relationship proof, accommodation, insurance, German language A1.',
  '4-8 months', '€160-180',
  'Red-White-Red Card Plus')

ON CONFLICT DO NOTHING;
