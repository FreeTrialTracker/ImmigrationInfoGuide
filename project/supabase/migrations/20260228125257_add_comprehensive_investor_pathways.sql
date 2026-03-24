/*
  # Add Comprehensive Investor Pathways
  
  Adds investor and entrepreneur visa pathways for various passport holders.
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_name, summary,
  eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type
) VALUES

-- Various passports to investment destinations
('angola', 'pt', 'Investor', 'Portugal Golden Visa', 
  'Residency by investment program with path to citizenship.',
  'Investment €280,000+ (property in low-density areas), €500,000 (funds), or €500,000 (capital transfer).',
  'Investment proof, clean criminal record, health insurance, Portuguese tax number.',
  '6-12 months', '€5,500-8,000 + investment',
  'Golden Visa'),

('nigeria', 'es', 'Investor', 'Spain Golden Visa', 
  'Residency through investment in property, business, or government bonds.',
  'Investment of €500,000 property, €1 million shares, or €2 million government bonds.',
  'Investment completion, NIE number, health insurance, clean criminal record.',
  '2-4 months', '€80-5,000 + investment',
  'Golden Visa'),

('south-africa', 'gr', 'Investor', 'Greece Golden Visa', 
  'Five-year renewable residence permit through real estate investment.',
  'Purchase property worth €250,000+ (€500,000+ from Sept 2024 in prime areas).',
  'Property purchase, proof of funds, passport, health insurance.',
  '2-4 months', '€2,000-3,000 + investment',
  'Golden Visa'),

('kenya', 'ae', 'Investor', 'UAE Investor Visa', 
  'Long-term residence through property or business investment.',
  'Invest AED 2 million+ in property, or establish business with AED 500,000+ capital.',
  'Investment proof, passport, business plan (if applicable), Emirates ID.',
  '4-8 weeks', 'AED 5,000-10,000 + investment',
  'Investor Visa'),

('egypt', 'sg', 'Investor', 'Singapore Global Investor Programme (GIP)', 
  'Permanent residence for high-net-worth investors and entrepreneurs.',
  'Invest SGD 10 million+ in fund, or own business with SGD 200 million revenue and invest SGD 10 million.',
  'Business plan, financial statements, investment commitment, qualifications.',
  '6-12 months', 'SGD 7,500 + investment',
  'Permanent Residence'),

('morocco', 'ca', 'Investor', 'Canada Start-Up Visa', 
  'Permanent residence for entrepreneurs with innovative business ideas.',
  'Secure investment from designated organization, meet language requirements (CLB 5), sufficient funds.',
  'Letter of support from designated organization, business plan, language test, proof of funds.',
  '12-18 months', 'CAD 2,140 + investment',
  'Permanent Residence'),

('philippines', 'au', 'Investor', 'Australia Business Innovation and Investment Visa', 
  'Pathway for business owners and investors.',
  'Business Investment stream: AUD 2.5 million investment. Entrepreneur stream: funding agreement.',
  'Business history or investment commitment, points test, financial proof.',
  '10-18 months', 'AUD 5,375-10,045 + investment',
  'Provisional Visa'),

('vietnam', 'nz', 'Investor', 'New Zealand Investor Visa', 
  'Residence through investment in New Zealand.',
  'Investor 1: NZD 10 million, 3 years. Investor 2: NZD 3 million, 4 years, age/English requirements.',
  'Investment funds, business experience, English proficiency (Investor 2), age under 65 (Investor 2).',
  '6-12 months', 'NZD 4,890 + investment',
  'Residence Visa'),

('bangladesh', 'gb', 'Investor', 'UK Innovator Founder Visa', 
  'For experienced businesspeople with innovative, scalable ideas.',
  'Endorsed business idea by UK endorsing body, £50,000 investment funds.',
  'Business plan, endorsement letter, English proficiency, maintenance funds.',
  '3-6 months', '£1,191 + £50,000 investment',
  'Innovator Visa'),

('pakistan', 'italy', 'Investor', 'Italy Investor Visa for Italy', 
  'Residence permit through significant investment.',
  'Invest €2 million government bonds, €500,000 company shares, €1 million Italian company, or €250,000 startup.',
  'Investment proof, clean criminal record, health insurance.',
  '3-6 months', '€116 + investment',
  'Investor Visa'),

('jordan', 'malta', 'Investor', 'Malta Permanent Residence Programme', 
  'Residence through property investment and government contribution.',
  '€100,000 government contribution, €300,000 property purchase or €16,000/year rental, €10,000 donation.',
  'Investment completion, clean criminal record, health insurance, proof of funds.',
  '4-6 months', '€40,000-50,000 + investment',
  'Permanent Residence'),

('lebanon', 'cy', 'Investor', 'Cyprus Permanent Residence', 
  'Fast-track permanent residence through real estate investment.',
  'Purchase property €300,000+, annual income €50,000+ (outside Cyprus).',
  'Property purchase, income proof, clean criminal record.',
  '2-3 months', '€500-2,000 + investment',
  'Permanent Residence'),

('argentina', 'us', 'Investor', 'US EB-5 Immigrant Investor Program', 
  'Permanent residence (green card) through investment in US business.',
  'Invest $800,000 (TEA) or $1.05 million, create 10+ full-time jobs.',
  'Investment in qualifying project, business plan, source of funds documentation.',
  '24-36 months', '$3,675 + investment + legal fees',
  'Immigrant Visa'),

('peru', 'de', 'Investor', 'Germany Entrepreneur/Investor Visa', 
  'Residence permit for entrepreneurs with viable business plan.',
  'Investment €250,000+ in German business, create jobs, economic benefit.',
  'Detailed business plan, proof of investment funds, relevant qualifications.',
  '3-6 months', '€100-140 + investment',
  'Entrepreneur Visa'),

('bolivia', 'fr', 'Investor', 'France Talent Passport - Investor', 
  'For investors making significant economic contribution to France.',
  'Invest €300,000+ in French business, create/preserve jobs.',
  'Business plan, investment proof, economic contribution evidence.',
  '2-4 months', '€200-250 + investment',
  'Talent Passport'),

('ghana', 'th', 'Investor', 'Thailand BOI Visa', 
  'Long-term visa through Board of Investment approved business.',
  'Establish BOI-promoted business with minimum 2 million THB investment.',
  'BOI approval, business registration, investment proof.',
  '2-4 months', '2,000 THB + investment',
  'Non-Immigrant B Visa'),

('tunisia', 'mx', 'Investor', 'Mexico Investor Residence Visa', 
  'Temporary residence through investment in Mexican business or property.',
  'Invest $200,000+ USD in business or property.',
  'Investment proof, business documents or property deed, financial statements.',
  '3-6 weeks', '$44-51 + investment',
  'Temporary Residence'),

('algeria', 'cr', 'Investor', 'Costa Rica Investor Residency', 
  'Residency through investment in business, property, or reforestation.',
  'Invest $200,000 in real estate, business, or forestry project.',
  'Investment proof, clean criminal record, financial statements.',
  '3-6 months', '$250-350 + investment',
  'Temporary Residence'),

('sri-lanka', 'panama', 'Investor', 'Panama Qualified Investor Visa', 
  'Fast permanent residence through investment.',
  'Invest $300,000+ in Panama real estate, forest reforestation, or fixed deposit.',
  'Investment completion, clean criminal record, health certificate.',
  '4-8 months', '$300-500 + investment',
  'Permanent Residence'),

('nepal', 'brazil', 'Investor', 'Brazil Investor Visa (VITEM II)', 
  'Temporary visa for foreign investors in Brazilian businesses.',
  'Invest BRL 500,000+ (~$100,000) in Brazilian company.',
  'Investment proof, business plan, company registration.',
  '1-3 months', '$160-290 + investment',
  'Temporary Visa')

ON CONFLICT DO NOTHING;
