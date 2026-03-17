/*
  # Add More Comprehensive Country Immigration Guides
  
  Coverage: Costa Rica, Italy, South Korea, Malaysia, France (already exists, skip)
*/

INSERT INTO country_guides (
  country_slug, overview, why_immigrate, popular_pathways,
  cost_of_living, language_requirements, climate_lifestyle,
  employment_opportunities, healthcare_system, education_system,
  visa_free_travel, key_facts, official_resources
) VALUES

-- Costa Rica
('cr',
  'Costa Rica has become a top retirement and digital nomad destination in Central America. Known for its biodiversity, friendly locals, and affordable living, it offers several residency options including the popular pensionado and rentista programs.',
  'Affordable living, natural beauty, biodiversity, friendly people, stable democracy, good healthcare, proximity to US, no army since 1948.',
  '[{"type": "Retirement", "name": "Pensionado (Retirement) Visa"}, {"type": "Residency", "name": "Rentista (Income) Visa"}, {"type": "Investor", "name": "Investor Residence"}, {"type": "Digital Nomad", "name": "Digital Nomad options"}]'::jsonb,
  'Affordable compared to North America. Rent: $600-1,200/month for 2-bedroom. Healthcare inexpensive. Dining out affordable. Budget $1,500-2,500/month comfortably.',
  'Spanish is official language. English widely spoken in tourist areas and expat communities but Spanish essential for daily life and integration.',
  'Tropical climate with rainy and dry seasons. Coastal areas hot and humid, highlands cooler. Outdoor lifestyle - beaches, rainforests, volcanoes. Relaxed pura vida culture.',
  'Limited job opportunities for foreigners. Main options: remote work, tourism, teaching English. Starting a business possible. Lower local salaries than US/Europe.',
  'Universal public healthcare (Caja) available to residents at low cost. High quality. Private healthcare excellent and affordable. Medical tourism destination.',
  'Good public education. Many international schools. Universities adequate. Many expat families use private schools.',
  'Costa Rican passport offers visa-free access to 150+ countries.',
  '[{"label": "Population", "value": "5.1 million"}, {"label": "Capital", "value": "San Jose"}, {"label": "Currency", "value": "Costa Rican Colon (CRC)"}, {"label": "GDP per capita", "value": "$12,000"}, {"label": "Languages", "value": "Spanish"}, {"label": "Timezone", "value": "CST (UTC-6)"}]'::jsonb,
  '[{"name": "Immigration Costa Rica", "url": "https://www.migracion.go.cr/"}, {"name": "ARCR - Expat Association", "url": "https://arcr.cr/"}]'::jsonb
),

-- Italy
('italy',
  'Italy offers diverse immigration options including the elective residence visa for retirees, work permits, and the innovative startup visa. Known for its rich culture, cuisine, and history, Italy attracts those seeking la dolce vita.',
  'Rich culture and history, world-class cuisine, beautiful landscapes, art and architecture, slower pace of life, EU membership, Mediterranean climate.',
  '[{"type": "Residency", "name": "Elective Residence Visa"}, {"type": "Work", "name": "Work Visa (Nulla Osta)"}, {"type": "Study", "name": "Student Visa"}, {"type": "Investor", "name": "Startup/Investor Visa"}]'::jsonb,
  'Varies widely. Rome/Milan expensive: €1,200-2,000/month rent for 1-bedroom. Southern Italy much cheaper. Food reasonable. Budget €1,500-3,000/month depending on location.',
  'Italian language essential for daily life and integration. English limited outside tourist areas. Language requirement for permanent residence (A2 level). Language courses widely available.',
  'Mediterranean climate - hot dry summers, mild winters. Regional variation. Slower pace of life, emphasis on family, food culture. Long lunch breaks common.',
  'Challenging job market with high unemployment. Better opportunities in north. Tourism, fashion, design sectors. Average salaries €25k-45k. Bureaucracy can be difficult.',
  'Universal public healthcare (SSN) for residents. High quality especially in north. Free or low cost. Private insurance available. Prescription costs subsidized.',
  'Good public education. Top universities: Bologna, Sapienza Rome. International schools in major cities. University tuition low €1,000-4,000/year.',
  'Italian passport offers visa-free access to 190+ countries.',
  '[{"label": "Population", "value": "59 million"}, {"label": "Capital", "value": "Rome"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "$34,000"}, {"label": "Languages", "value": "Italian"}, {"label": "Timezone", "value": "CET/CEST"}]'::jsonb,
  '[{"name": "Ministry of Interior", "url": "https://www.interno.gov.it/"}, {"name": "Visa Information", "url": "https://vistoperitalia.esteri.it/"}]'::jsonb
),

-- South Korea
('south-korea',
  'South Korea combines cutting-edge technology with rich traditions. The E-7 work visa and F-2 points-based residence visa offer pathways for skilled professionals, while the D-10 job seeker visa helps graduates find employment.',
  'Advanced technology, excellent public transport, fast internet, safe cities, rich culture, K-pop and entertainment, good food, modern infrastructure.',
  '[{"type": "Work", "name": "E-7 Skilled Worker Visa"}, {"type": "Work", "name": "F-2 Points-based Residence"}, {"type": "Study", "name": "D-2 Student Visa"}, {"type": "Work", "name": "D-10 Job Seeker Visa"}]'::jsonb,
  'Moderate to high. Seoul expensive: 1-2 million won/month for 1-bedroom. Food affordable. Public transport excellent and cheap. Budget 2-3.5 million won/month.',
  'Korean language important for integration and most jobs. TOPIK exam for visa points. English teaching jobs available. Korean proficiency expected for permanent residence.',
  'Four distinct seasons. Hot humid summers, cold winters. Fast-paced urban lifestyle. Strong work culture but improving. Tech-savvy society. Hierarchical culture.',
  'Strong job market in tech, engineering, education (English teaching). Major companies: Samsung, LG, Hyundai. Competitive. Long work hours common.',
  'National health insurance mandatory and affordable. High quality medical care. Low out-of-pocket costs. Advanced medical technology.',
  'Highly competitive education system. Top universities: Seoul National, KAIST. International schools available. University affordable compared to West.',
  'South Korean passport offers visa-free access to 190+ countries.',
  '[{"label": "Population", "value": "51 million"}, {"label": "Capital", "value": "Seoul"}, {"label": "Currency", "value": "Korean Won (KRW)"}, {"label": "GDP per capita", "value": "$35,000"}, {"label": "Languages", "value": "Korean"}, {"label": "Timezone", "value": "KST (UTC+9)"}]'::jsonb,
  '[{"name": "Korea Immigration Service", "url": "https://www.immigration.go.kr/immigration_eng/"}, {"name": "HiKorea", "url": "https://www.hikorea.go.kr/"}]'::jsonb
),

-- Malaysia  
('malaysia',
  'Malaysia offers the MM2H (Malaysia My Second Home) program making it easy for retirees and remote workers to obtain long-term residence. The country combines modern cities, tropical islands, and diverse culture with affordable living.',
  'Affordable living, tropical climate, English widely spoken, diverse culture, good food, modern cities, proximity to rest of Asia, MM2H program.',
  '[{"type": "Residency", "name": "MM2H (Malaysia My Second Home)"}, {"type": "Work", "name": "Employment Pass"}, {"type": "Digital Nomad", "name": "DE Rantau Nomad Pass"}, {"type": "Investor", "name": "Investor visas"}]'::jsonb,
  'Very affordable. Kuala Lumpur: 2,000-4,000 RM/month for nice apartment. Food inexpensive. Budget 5,000-8,000 RM/month comfortably.',
  'Malay official but English widely spoken in cities. Multilingual society (Malay, English, Chinese, Tamil). No language requirement for most visas.',
  'Tropical climate - hot and humid year-round. Monsoon seasons vary by region. Modern cities, tropical islands, rainforests. Multicultural society. Great food scene.',
  'Growing economy. Jobs in tech, finance, oil/gas, education. Lower salaries than Singapore but cost of living also lower.',
  'Public healthcare affordable and decent quality. Private healthcare excellent and very affordable. Medical tourism destination. Health insurance recommended.',
  'Good international schools but expensive. Public universities adequate. Lower cost than Western countries.',
  'Malaysian passport offers visa-free access to 180+ countries.',
  '[{"label": "Population", "value": "33 million"}, {"label": "Capital", "value": "Kuala Lumpur"}, {"label": "Currency", "value": "Malaysian Ringgit (MYR)"}, {"label": "GDP per capita", "value": "$11,000"}, {"label": "Languages", "value": "Malay, English"}, {"label": "Timezone", "value": "MYT (UTC+8)"}]'::jsonb,
  '[{"name": "Immigration Malaysia", "url": "https://www.imi.gov.my/"}, {"name": "MM2H Official", "url": "https://mm2h.gov.my/"}]'::jsonb
)

ON CONFLICT (country_slug) DO NOTHING;
