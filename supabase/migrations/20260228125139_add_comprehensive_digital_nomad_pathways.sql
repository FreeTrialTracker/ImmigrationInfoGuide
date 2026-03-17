/*
  # Add Comprehensive Digital Nomad Pathways
  
  Adds digital nomad pathways for various passport holders to popular destinations.
  Covers African, Asian, Middle Eastern, and Latin American passport combinations.
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_name, summary,
  eligibility, key_requirements, typical_timeline, estimated_fees, pathway_type
) VALUES

-- Angola to Australia Digital Nomad
('angola', 'au', 'Digital Nomad', 'Temporary Activity Visa (Digital Nomad)', 
  'Australia does not have a specific digital nomad visa but remote workers can use visitor or temporary activity visas for short stays.',
  'Remote workers employed by overseas companies. Must not work for Australian clients.',
  'Valid passport, proof of overseas employment, health insurance, sufficient funds ($5,000+ AUD), return ticket.',
  '2-4 weeks online application', '$150-365 AUD visa fee',
  'Temporary Activity'),

-- African passports to various destinations
('nigeria', 'pt', 'Digital Nomad', 'Portugal Digital Nomad Visa (D7/D8)', 
  'Portugal offers attractive digital nomad visas for remote workers with stable income from foreign sources.',
  'Remote workers or freelancers with minimum €3,040/month income. Must work for non-Portuguese clients.',
  'Proof of remote work, income statements, health insurance, accommodation proof, clean criminal record.',
  '2-4 months', '€90-180 application fee',
  'Temporary Residence'),

('south-africa', 'es', 'Digital Nomad', 'Spain Digital Nomad Visa', 
  'Spain launched a digital nomad visa in 2023 for remote workers from non-EU countries.',
  'Remote workers earning €2,500+/month from foreign companies or clients (max 20% Spanish income).',
  'Employment contract or client contracts, proof of income, health insurance, university degree or 3+ years experience.',
  '1-3 months', '€80-150',
  'Temporary Residence'),

('kenya', 'ae', 'Digital Nomad', 'UAE Remote Work Visa', 
  'One-year renewable visa for remote workers employed by companies outside the UAE.',
  'Remote workers earning $3,500+/month from overseas companies.',
  'Valid passport, employment contract, proof of income ($3,500+/month), health insurance, passport photo.',
  '2-4 weeks', 'AED 1,150 (~$310)',
  'Remote Work'),

('egypt', 'thailand', 'Digital Nomad', 'Thailand Digital Nomad Visa (DTV)', 
  'New 5-year multiple-entry visa for digital nomads and remote workers.',
  'Remote workers, freelancers, or digital nomads with stable income.',
  'Proof of remote work, $16,000+ in bank account (6 months), passport valid 6+ months.',
  '2-4 weeks', '10,000 THB (~$280)',
  'Long-term Visa'),

('morocco', 'mx', 'Digital Nomad', 'Mexico Temporary Resident Visa', 
  'While not specifically a digital nomad visa, temporary residence works for remote workers.',
  'Remote workers with sufficient income or savings.',
  'Proof of income ($2,600+/month) or savings ($43,000+), application form, passport.',
  '3-6 weeks', '$44-51 USD',
  'Temporary Residence'),

-- Asian passports
('philippines', 'cr', 'Digital Nomad', 'Costa Rica Rentista Visa for Digital Nomads', 
  'Allows remote workers to stay up to 2 years with passive income or remote employment.',
  'Minimum $2,500/month guaranteed income for 2 years.',
  'Proof of income, clean criminal record, health certificate, birth certificate.',
  '3-6 months', '$250-350',
  'Temporary Residence'),

('vietnam', 'colombia', 'Digital Nomad', 'Colombia Digital Nomad Visa (V)', 
  'Two-year visa for remote workers earning from foreign sources.',
  'Remote workers or freelancers earning $684+/month from overseas.',
  'Employment letter or contracts, proof of income (3 months), health insurance, passport.',
  '4-8 weeks', '$55-200 USD',
  'Visitor Visa'),

('bangladesh', 'indonesia', 'Digital Nomad', 'Indonesia Second Home Visa', 
  'Long-term visa (5-10 years) for foreign nationals including remote workers.',
  'Proof of funds ($130,000 for 5 years or $260,000 for 10 years).',
  'Financial proof, passport valid 3+ years, health insurance, local sponsor.',
  '1-3 months', 'IDR 15-31 million (~$950-2,000)',
  'Long-stay Permit'),

('pakistan', 'malaysia', 'Digital Nomad', 'Malaysia DE Rantau Digital Nomad Pass', 
  'One-year renewable visa for digital workers and freelancers.',
  'Remote workers or freelancers earning $24,000+/year.',
  'Proof of income ($24,000+/year), employment letter or business proof, passport.',
  '4-8 weeks', 'RM 1,060 (~$235)',
  'Professional Visit Pass'),

-- Middle Eastern passports
('jordan', 'greece', 'Digital Nomad', 'Greece Digital Nomad Visa', 
  'One-year renewable visa for remote workers from non-EU countries.',
  'Remote workers earning €3,500+/month from non-Greek sources.',
  'Employment contract or freelance contracts, proof of income, health insurance, accommodation.',
  '2-4 months', '€75-150',
  'National Visa'),

('lebanon', 'czech-republic', 'Digital Nomad', 'Czech Freelance/Entrepreneur Visa', 
  'Long-term visa for freelancers and independent contractors working remotely.',
  'Freelancers with regular income and Czech trade license.',
  'Trade license (Zivnostensky list), proof of income, accommodation, health insurance.',
  '2-4 months', '2,500 CZK (~$110)',
  'Business Visa'),

-- Latin American passports
('argentina', 'pt', 'Digital Nomad', 'Portugal Digital Nomad Visa (D7)', 
  'Attractive visa for remote workers with passive or remote income.',
  'Remote workers earning €3,040+/month from foreign sources.',
  'Proof of income, NIF number, health insurance, accommodation proof, clean criminal record.',
  '2-4 months', '€90-180',
  'Temporary Residence'),

('peru', 'es', 'Digital Nomad', 'Spain Digital Nomad Visa', 
  'Allows non-EU remote workers to live in Spain while working for foreign companies.',
  'Remote workers earning €2,500+/month, max 20% from Spanish sources.',
  'Employment contract, proof of income, health insurance, degree or 3+ years experience.',
  '1-3 months', '€80-150',
  'Temporary Residence'),

('bolivia', 'nz', 'Digital Nomad', 'New Zealand Visitor Visa for Remote Work', 
  'Visitors can work remotely while in NZ on tourist visa but cannot work for NZ companies.',
  'Remote workers employed by overseas companies.',
  'Valid passport, return ticket, proof of funds ($1,000+ NZD/month), accommodation details.',
  '1-3 weeks', 'NZD 246 (~$150)',
  'Visitor Visa'),

-- More African combinations
('ghana', 'brazil', 'Digital Nomad', 'Brazil Digital Nomad/VITEM XIV Visa', 
  'Brazil launched a digital nomad visa category for remote workers.',
  'Remote workers earning $1,500+/month from foreign sources.',
  'Employment or service contract, proof of income, valid passport, health insurance.',
  '1-3 months', '$160-290 USD',
  'Temporary Visa'),

('tunisia', 'chile', 'Digital Nomad', 'Chile Temporary Visa for Digital Nomads', 
  'Temporary residence visa allowing remote work for foreign companies.',
  'Remote workers with verifiable foreign income.',
  'Remote work proof, bank statements, passport, clean criminal record.',
  '2-4 months', '$150-300 USD',
  'Temporary Residence'),

('algeria', 'ecuador', 'Digital Nomad', 'Ecuador Rentista Visa for Remote Workers', 
  'Allows remote workers to reside with guaranteed monthly income.',
  'Minimum $1,350/month guaranteed income from abroad.',
  'Proof of income, clean criminal record, health certificate, apostilled documents.',
  '2-4 months', '$450-550',
  'Temporary Residence'),

-- More Asian combinations  
('sri-lanka', 'cambodia', 'Digital Nomad', 'Cambodia E-Class Long-term Visa', 
  'Flexible visa allowing remote work and long stays.',
  'Remote workers or retirees seeking longer stay.',
  'Valid passport, passport photo, application form.',
  '1-2 weeks', '$300-385 per year',
  'Business/Retirement Visa'),

('nepal', 'italy', 'Digital Nomad', 'Italy Digital Nomad/Self-Employment Visa', 
  'For highly qualified remote workers and freelancers.',
  'Remote workers or freelancers with university degree and stable income.',
  'University degree, employment or client contracts, health insurance, financial proof.',
  '2-4 months', '€116',
  'Self-Employment Visa')

ON CONFLICT DO NOTHING;
