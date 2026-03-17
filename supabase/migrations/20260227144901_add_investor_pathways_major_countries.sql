/*
  # Add Investor Pathways for Major Countries Missing Them
  
  This migration adds investor visa/residency pathways for major destinations
  that are currently missing Investor goal pathways.
  
  1. Countries Added
    - Costa Rica - Investor residence
    - France - Investor visa
    - Germany - Business/Investor visa
    - Mexico - Investor residence
  
  2. Coverage
    - Each pathway includes realistic requirements, timelines, and fees
    - All pathways use 'any' as passport_slug for maximum coverage
*/

INSERT INTO immigration_pathways (
  passport_slug, destination_slug, goal, pathway_name, 
  summary, eligibility, key_requirements, typical_timeline, estimated_fees,
  requirements, processing_time, validity_period, official_url, pathway_type, last_updated
) VALUES 

-- Costa Rica Investor Residence
('any', 'cr', 'Investor', 'Costa Rica Investor Residence',
  'Obtain temporary residency in Costa Rica by investing in real estate, businesses, or government bonds.',
  'Foreign nationals willing to invest minimum $200,000 USD in Costa Rican real estate or business, or $100,000 in reforestation projects',
  'Investment of $150,000-200,000 USD, proof of investment, clean criminal record, birth certificate, passport',
  '6-12 months',
  'Application: $250, legal fees: $2,000-5,000, minimum investment: $150,000-200,000 USD',
  'Proof of investment (property deed, business registration, or bond certificate), apostilled birth certificate, police clearance, passport copies, application forms, attorney representation',
  '6-12 months',
  '2 years temporary, renewable, eligible for permanent residency after 3 years',
  'https://www.migracion.go.cr/',
  'Investor Residence',
  CURRENT_DATE
),

-- France Investor Visa
('any', 'fr', 'Investor', 'France Talent Passport - Investor',
  'The Talent Passport allows investors making significant economic contributions to France to obtain a multi-year residence permit.',
  'Foreign investors willing to make direct tangible or intangible investment of at least €300,000, or create/preserve jobs',
  'Investment of €300,000 minimum or job creation plan, business plan, proof of funds, passport',
  '3-4 months',
  'Visa application: €200, investment: minimum €300,000, legal fees: €3,000-8,000',
  'Investment of €300,000+ in French business/property, detailed business plan, proof of financial capacity, passport, proof of accommodation, health insurance, clean criminal record',
  '3-4 months',
  '4 years, renewable',
  'https://www.immigration.interieur.gouv.fr/',
  'Talent Passport',
  CURRENT_DATE
),

-- Germany Investor/Business Visa
('any', 'de', 'Investor', 'Germany Entrepreneur/Investor Residence Permit',
  'Self-employed persons and investors can obtain residence permits by establishing a business and investing in Germany.',
  'Entrepreneurs and investors with viable business plan, typically requiring investment of €250,000+ and creation of 5+ jobs',
  'Viable business plan, investment of €250,000+, proof of funding, relevant qualifications or business experience',
  '3-6 months',
  'Visa: €100, residence permit: €100-110, business setup costs: €5,000-15,000, minimum investment: €250,000',
  'Detailed business plan showing economic interest to Germany, proof of financing/investment funds, health insurance, passport, qualifications/business experience documentation',
  '3-6 months',
  'Initial 1-3 years, renewable if business successful, permanent residence possible after 3 years',
  'https://www.germany.info/',
  'Business/Investor Permit',
  CURRENT_DATE
),

-- Mexico Investor Residence
('any', 'mx', 'Investor', 'Mexico Temporary Resident Investor',
  'Foreign investors can obtain temporary residence by investing in Mexican businesses, real estate, or financial instruments.',
  'Foreign nationals with minimum investment equivalent to 20,000 days of minimum wage (approximately $180,000 USD) in Mexico',
  'Investment proof (business, property, or bonds worth ~$180,000 USD), application form, passport, financial statements',
  '2-4 months',
  'Application: $50 USD, residence card: $200 USD, investment: minimum ~$180,000 USD',
  'Proof of investment in Mexican business, real estate, or government bonds; passport valid 6+ months; completed application forms; proof of legal stay in Mexico; financial solvency documents',
  '2-4 months',
  '1-4 years temporary residence, renewable, can lead to permanent residence',
  'https://www.gob.mx/inm',
  'Investor Temporary Residence',
  CURRENT_DATE
)

ON CONFLICT DO NOTHING;
