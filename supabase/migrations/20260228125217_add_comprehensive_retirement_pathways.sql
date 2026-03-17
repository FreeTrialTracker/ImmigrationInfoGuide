/*
  # Add Comprehensive Retirement Pathways
  
  Adds retirement visa pathways for various passport holders to popular retirement destinations.
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_name, summary,
  eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type
) VALUES

-- Various passports to popular retirement destinations
('angola', 'pt', 'Retirement', 'Portugal D7 Passive Income Visa', 
  'Popular retirement visa for those with pension or passive income.',
  'Retirees with minimum €820/month passive income (pension, investments, rental income).',
  'Proof of passive income, NIF number, Portuguese bank account, accommodation, health insurance.',
  '2-4 months', '€90-180',
  'Passive Income Visa'),

('nigeria', 'es', 'Retirement', 'Spain Non-Lucrative Visa (Retirement)', 
  'Allows retirees to live in Spain without working.',
  'Retirees with €28,800+/year income (€2,400/month) or €43,000+ in savings.',
  'Proof of income/savings, health insurance, clean criminal record, accommodation proof.',
  '1-3 months', '€80-160',
  'Non-Lucrative Residence'),

('south-africa', 'mx', 'Retirement', 'Mexico Temporary Resident Visa (Retiree)', 
  'Affordable retirement destination with flexible visa for retirees.',
  'Retirees with $2,600+/month income or $43,000+ savings.',
  'Proof of income or savings, passport, application form, financial statements.',
  '3-6 weeks', '$44-51',
  'Temporary Residence'),

('kenya', 'thailand', 'Retirement', 'Thailand Retirement Visa (Non-O)', 
  'Long-term visa for retirees 50+ years old.',
  'Age 50+, minimum 800,000 THB (~$22,000) in Thai bank or 65,000 THB/month income.',
  'Passport, financial proof, health insurance, clean criminal record, photos.',
  '4-8 weeks', '1,900-10,000 THB (~$50-280)',
  'Non-Immigrant O Visa'),

('egypt', 'malaysia', 'Retirement', 'Malaysia My Second Home (MM2H)', 
  'Long-term renewable visa for retirees and their families.',
  'Age 35+, minimum RM 500,000 (~$108,000) liquid assets and RM 10,000/month income.',
  'Financial proof, medical report, clean criminal record, passport.',
  '2-6 months', 'RM 5,000-10,000 (~$1,100-2,200)',
  'Social Visit Pass'),

('morocco', 'cr', 'Retirement', 'Costa Rica Pensionado Visa', 
  'Popular retirement visa for those with guaranteed pension income.',
  'Minimum $1,000/month lifetime pension from government or private source.',
  'Pension proof, birth certificate, marriage certificate (if applicable), police clearance.',
  '3-6 months', '$250-350',
  'Pensionado Residence'),

('philippines', 'panama', 'Retirement', 'Panama Pensionado Visa', 
  'One of the best retirement visas with extensive discounts and benefits.',
  'Minimum $1,000/month lifetime pension ($750 if buying property worth $100,000+).',
  'Pension letter from issuing entity, police clearance, health certificate, marriage/birth certificates.',
  '4-8 months', '$300-500',
  'Permanent Residence'),

('vietnam', 'ecuador', 'Retirement', 'Ecuador Pensioner Visa', 
  'Affordable retirement destination with simple requirements.',
  'Minimum $1,450/month pension or Social Security income.',
  'Pension proof, background check, birth certificate, apostilled documents.',
  '2-4 months', '$450-550',
  'Temporary Residence'),

('bangladesh', 'colombia', 'Retirement', 'Colombia Retirement Visa (TP-7)', 
  'Attractive option for retirees with pension income.',
  'Minimum $750/month pension income (three times Colombian minimum wage).',
  'Pension proof, passport, photos, application form, income statements.',
  '4-8 weeks', '$55-200',
  'Temporary Permit'),

('pakistan', 'indonesia', 'Retirement', 'Indonesia Retirement Visa (KITAS)', 
  'Limited stay permit for retirees 55+ years old.',
  'Age 55+, sponsor Indonesian citizen or permanent resident or use agent, proof of income.',
  'Passport valid 18+ months, proof of pension/income ($1,500+/month), health insurance.',
  '1-3 months', '$800-1,500',
  'Limited Stay Permit'),

('jordan', 'italy', 'Retirement', 'Italy Elective Residence Visa', 
  'For those with sufficient passive income not seeking employment.',
  'Minimum €31,000+/year passive income, proof of accommodation in Italy.',
  'Financial proof, Italian accommodation, health insurance, no criminal record.',
  '2-4 months', '€116',
  'Elective Residence'),

('lebanon', 'greece', 'Retirement', 'Greece Financially Independent Person Visa', 
  'For retirees with stable passive income.',
  'Minimum €24,000/year passive income (€2,000/month).',
  'Financial proof, accommodation, health insurance, no employment in Greece.',
  '2-4 months', '€75-150',
  'National Visa'),

('argentina', 'chile', 'Retirement', 'Chile Retirement Visa (Visa Temporaria)', 
  'Temporary visa for retirees with guaranteed income.',
  'Minimum $1,000/month guaranteed pension income.',
  'Pension proof, clean criminal record, birth certificate, apostilled documents.',
  '2-4 months', '$150-300',
  'Temporary Residence'),

('peru', 'nz', 'Retirement', 'New Zealand Temporary Retirement Visitor Visa', 
  'Two-year visa for retirees investing in New Zealand.',
  'Age 66+, invest NZD 750,000+ for 2 years, minimum NZD 60,000/year income.',
  'Investment proof, financial statements, police clearance, medical certificates.',
  '2-4 months', 'NZD 2,290 (~$1,400)',
  'Temporary Visa'),

('bolivia', 'brazil', 'Retirement', 'Brazil Retirement Visa (VIPER)', 
  'For retirees with Brazilian pension or foreign pension transferred to Brazil.',
  'Minimum $2,000/month pension transferred to Brazilian bank.',
  'Pension proof, bank statements, passport, health insurance.',
  '1-3 months', '$160-290',
  'Permanent Visa'),

('ghana', 'au', 'Retirement', 'Australia Retirement Visa (subclass 410)', 
  'Temporary visa for self-funded retirees investing in Australia.',
  'Age 55+, no dependents, invest AUD 500,000+, annual income AUD 65,000+.',
  'Financial proof, health insurance, health examination, character check.',
  '12-18 months', 'AUD 7,850',
  'Temporary Visa'),

('tunisia', 'ae', 'Retirement', 'UAE Retirement Visa', 
  'Five-year renewable retirement visa.',
  'Age 55+, property worth AED 2 million+ OR AED 1 million savings OR AED 20,000/month income.',
  'Financial proof, passport, medical insurance, passport photo.',
  '2-4 weeks', 'AED 3,000-5,000 (~$800-1,360)',
  'Long-term Visa'),

('algeria', 'cambodia', 'Retirement', 'Cambodia Retirement Visa (ER Class)', 
  'Simple retirement visa for those 55+.',
  'Age 55+, proof of retirement income or savings.',
  'Passport, passport photo, application form, financial proof.',
  '1-2 weeks', '$290-385 per year',
  'Extension of Stay'),

('sri-lanka', 'sg', 'Retirement', 'Singapore Long Term Visit Pass', 
  'For foreign nationals wishing to retire in Singapore with sponsorship.',
  'Singapore PR or citizen sponsor (usually family member), proof of financial support.',
  'Sponsor documents, financial proof, passport, relationship proof.',
  '4-8 weeks', 'SGD 100-150',
  'Long Term Visit Pass'),

('nepal', 'gb', 'Retirement', 'UK Retirement Visa (Not Currently Available)', 
  'UK currently does not offer a specific retirement visa. Retirees must use other visa categories.',
  'N/A - No dedicated retirement visa currently.',
  'Consider Investor Visa, Innovator Visa, or Family Visa if eligible.',
  'N/A', 'N/A',
  'Not Available')

ON CONFLICT DO NOTHING;
