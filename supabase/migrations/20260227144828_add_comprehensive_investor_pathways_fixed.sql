/*
  # Add Comprehensive Investor Pathways for All Major Destinations
  
  This migration adds investor visa/residency pathways for countries that are missing them.
  We're focusing on Cambodia and other Southeast Asian countries first, then expanding globally.
  
  1. New Pathways Added
    - Cambodia investor pathways (any passport)
    - Thailand investor pathways (any passport)
    - Malaysia investor pathways (any passport)
    - Philippines investor pathways (any passport)
    - Indonesia investor pathways (any passport)
    - Vietnam investor pathways (any passport)
    - Singapore investor pathways (any passport)
  
  2. Coverage
    - Each pathway includes realistic requirements, timelines, and fees
    - All pathways use 'any' as passport_slug for maximum coverage
    - Focuses on legitimate investment-based immigration programs
*/

-- Cambodia Investor Pathway
INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_name, 
  summary, eligibility, key_requirements, typical_timeline, estimated_fees,
  requirements, processing_time, validity_period, official_url, pathway_type, last_updated
) VALUES 
(
  'any', 'cambodia', 'Investor', 
  'Cambodia Business/Investment Visa (E-Class)',
  'Investors can obtain long-term business visas by establishing a business or making significant investments in Cambodia. The EB (Business) visa is extendable and can lead to long-term residency.',
  'Foreign nationals wishing to invest or conduct business in Cambodia. Minimum investment typically starts from $50,000 USD for business establishment.',
  'Valid passport, business plan or proof of investment, company registration documents, financial statements showing investment capacity',
  '2-4 weeks for initial visa, business setup may take 1-3 months',
  '$35-40 USD for visa + $280 USD for annual extension + business registration costs (approx $1,000-3,000)',
  'Valid passport, completed application form, passport photos, business plan or proof of investment, company registration documents (if applicable), financial statements showing investment capacity, clean criminal record',
  '2-4 weeks for initial approval, business registration may take additional time',
  'Initially 1-3 months, renewable for 1, 3, 6, or 12 months at a time',
  'https://www.evisa.gov.kh/',
  'Business/Investment Visa',
  CURRENT_DATE
),

-- Thailand Investment Options
('any', 'thailand', 'Investor', 'Thailand BOI Investment Promotion',
  'The Board of Investment (BOI) offers incentives and long-term visas for qualified foreign investors establishing businesses in promoted sectors.',
  'Foreign investors willing to invest in BOI-promoted industries with minimum investment of 2 million THB ($55,000 USD) for most sectors',
  'BOI approval, minimum 2 million THB investment, business registration, work permit',
  '3-6 months for BOI approval, additional 1-2 months for visa',
  'BOI application: 100,000 THB, visa fees: 2,000-5,000 THB, work permit: 3,000-9,000 THB',
  'Approved business proposal in promoted sector, minimum capital investment, business registration, work permit application, BOI approval certificate',
  '3-6 months for BOI approval process',
  'Initial 1 year, renewable annually with active business',
  'https://www.boi.go.th/',
  'Investment Visa',
  CURRENT_DATE
),

('any', 'thailand', 'Investor', 'Thailand Elite Visa (Investment Option)',
  'A long-term residence program offering 5-20 year visas for individuals making qualifying investments or paying membership fees.',
  'Foreign nationals with financial means. Investment options range from 600,000 to 2,000,000 THB depending on duration',
  'Membership fee payment, financial proof, medical certificate, police clearance',
  '2-3 months',
  '600,000 - 2,000,000 THB depending on program (5, 10, or 20 years)',
  'Application form, passport copy, financial statements, membership fee payment, medical certificate, police clearance',
  '2-3 months',
  '5, 10, or 20 years depending on program selected',
  'https://www.thailandelite.com/',
  'Long-term Residence',
  CURRENT_DATE
),

-- Malaysia MM2H and Investment
('any', 'malaysia', 'Investor', 'Malaysia My Second Home (MM2H)',
  'A long-term visa program allowing foreigners to live in Malaysia. Requires fixed deposit and proof of offshore income or assets.',
  'Applicants over 35 with monthly offshore income of RM 40,000+ or liquid assets of RM 1,500,000+. Fixed deposit of RM 1,000,000 required.',
  'RM 1,000,000 fixed deposit, proof of RM 40,000 monthly offshore income, medical insurance, health screening',
  '3-6 months',
  'Application: RM 5,000, processing: RM 500, fixed deposit: RM 1,000,000',
  'Proof of offshore income or assets, fixed deposit in Malaysian bank, medical insurance, health screening, security bond, approval letter',
  '3-6 months',
  '5 years, renewable for another 5 years',
  'https://mm2h.gov.my/',
  'Long-term Social Visit',
  CURRENT_DATE
),

-- Philippines Investment Visas
('any', 'philippines', 'Investor', 'Philippines Special Investor Resident Visa (SIRV)',
  'Permanent resident status for foreigners who invest at least $75,000 USD in a Philippine company.',
  'Foreign nationals investing minimum $75,000 USD in an approved investment vehicle or Philippine company',
  'Investment of $75,000 USD minimum, proof of investment, incorporation documents, NBI clearance, medical certificate',
  '4-6 months',
  'Application fee: $3,000 USD, Investment: minimum $75,000 USD',
  'Investment of $75,000 USD minimum, proof of investment, incorporation documents, NBI clearance, medical certificate, passport and photos',
  '4-6 months',
  'Permanent residency (indefinite)',
  'https://www.immigration.gov.ph/',
  'Investor Visa',
  CURRENT_DATE
),

-- Indonesia Investment
('any', 'indonesia', 'Investor', 'Indonesia Investor KITAS',
  'Temporary residence permit for foreign investors establishing or investing in Indonesian companies.',
  'Foreign investors with minimum investment as per BKPM requirements (typically starts at $100,000+ depending on sector)',
  'BKPM investment approval, PT PMA company, sponsor letter, passport, investment proof of $100,000+',
  '2-4 months',
  'KITAS: $100-200 USD per year, company setup: $2,000-5,000, minimum investment varies by sector',
  'Company establishment (PT PMA), BKPM investment approval, sponsor letter, passport, photos, investment proof, business plan',
  '2-4 months',
  '1-2 years, renewable',
  'https://www.bkpm.go.id/',
  'Investor Stay Permit',
  CURRENT_DATE
),

-- Vietnam Investment
('any', 'vietnam', 'Investor', 'Vietnam Investment Visa (DT)',
  'Long-term visa for foreign investors with approved investment projects in Vietnam.',
  'Foreign investors with approved investment projects. Minimum investment varies by sector but typically $100,000+',
  'Investment registration certificate, business license, investment project approval, passport',
  '2-3 months',
  'Visa: $50-160 USD, investment registration: $500-2,000, minimum investment varies',
  'Investment registration certificate, business license, investment project approval, passport, photos, health check, police clearance',
  '2-3 months',
  'Up to 5 years depending on investment',
  'https://www.fia.gov.vn/',
  'Investment Visa',
  CURRENT_DATE
),

-- Singapore Investment
('any', 'sg', 'Investor', 'Singapore Global Investor Programme (GIP)',
  'Permanent residence for high-net-worth individuals investing significantly in Singapore.',
  'Successful entrepreneurs or investors with at least SGD $2.5 million to invest',
  'Minimum SGD $2.5 million investment, proven business track record, detailed business plan',
  '6-12 months',
  'Application fee: SGD $7,500, minimum investment: SGD $2.5 million',
  'Minimum investment of SGD $2.5 million in approved options, business track record, detailed business/investment plan, financial documents',
  '6-12 months',
  'Permanent Residence (renewable every 5 years)',
  'https://www.edb.gov.sg/en/how-we-help/global-investor-programme.html',
  'Investment Permanent Residence',
  CURRENT_DATE
)

ON CONFLICT DO NOTHING;
