/*
  # Populate Even More Country Immigration Guides Part 2
  
  Coverage: New Zealand, Ireland, Netherlands, Thailand, Japan, Mexico
*/

INSERT INTO country_guides (
  country_slug, overview, why_immigrate, popular_pathways,
  cost_of_living, language_requirements, climate_lifestyle,
  employment_opportunities, healthcare_system, education_system,
  visa_free_travel, key_facts, official_resources
) VALUES

-- New Zealand
('nz',
  'New Zealand offers a high quality of life with stunning natural landscapes and a welcoming immigration system. The Skilled Migrant Category and various work visas attract professionals, while business and investor visas welcome entrepreneurs.',
  'High quality of life, beautiful nature and outdoor activities, safe and peaceful, English-speaking, work-life balance, progressive values, pathway to citizenship.',
  '[{"type": "Work", "name": "Skilled Migrant Category"}, {"type": "Work", "name": "Essential Skills Work Visa"}, {"type": "Investor", "name": "Investor Visas"}, {"type": "Study", "name": "Student Visa"}]'::jsonb,
  'Moderate to high. Auckland rent: NZD $450-750/week for 1-bedroom. Other cities cheaper. Groceries more expensive than US/UK. Budget NZD $3,500-5,500/month.',
  'English proficiency required. IELTS minimum 6.5 overall for most work visas. Higher scores improve points for skilled migration. English-speaking environment.',
  'Temperate climate with regional variation. Mild winters, warm summers. Four seasons. Outdoor lifestyle prominent - hiking, beaches, adventure sports. Relaxed pace.',
  'Job market tight with skills shortages in IT, healthcare, engineering, trades, agriculture. Lower salaries than Australia: NZD $50k-100k for skilled roles. Unemployment around 4%.',
  'Public healthcare system free for citizens/residents. High quality. Private insurance available. ACC covers accident compensation.',
  'Good public education. Top universities: Auckland, Otago, Victoria. International tuition: NZD $22k-32k/year.',
  'New Zealand passport offers visa-free or visa-on-arrival access to 190+ countries.',
  '[{"label": "Population", "value": "5.1 million"}, {"label": "Capital", "value": "Wellington"}, {"label": "Currency", "value": "NZ Dollar (NZD)"}, {"label": "GDP per capita", "value": "$48,000"}, {"label": "Languages", "value": "English, Maori"}, {"label": "Timezone", "value": "NZST/NZDT"}]'::jsonb,
  '[{"name": "Immigration New Zealand", "url": "https://www.immigration.govt.nz/"}, {"name": "Skilled Migrant Category", "url": "https://www.immigration.govt.nz/new-zealand-visas/visas/visa/skilled-migrant-category-resident-visa"}]'::jsonb
),

-- Ireland
('ireland',
  'Ireland offers English-speaking environment, EU membership, thriving tech sector, and friendly immigration policies for skilled workers. Dublin has become a major European tech hub with many multinational headquarters.',
  'English-speaking EU country, thriving tech sector, friendly people, rich culture, EU access, growing economy, lower corporate tax, quality education.',
  '[{"type": "Work", "name": "Critical Skills Employment Permit"}, {"type": "Work", "name": "General Employment Permit"}, {"type": "Study", "name": "Student Visa (Stamp 2)"}, {"type": "Investor", "name": "Investor Programme"}]'::jsonb,
  'High cost especially Dublin. Dublin rent: €1,500-2,500/month for 1-bedroom. Other cities more affordable. Budget €2,500-4,000/month in Dublin.',
  'English is official language. No language test required for most visas. Irish (Gaelic) also official but rarely used in practice.',
  'Temperate maritime - mild, rainy. Frequent rain year-round. Green landscapes. Pub culture, music, literature. Friendly social atmosphere.',
  'Strong tech sector - Google, Facebook, Apple, Microsoft have European HQ. Jobs in pharma, finance, IT. Salaries: €40k-90k for skilled roles. Unemployment around 4-5%.',
  'Public health system (HSE) available but under strain. Private insurance common. EU health card accepted.',
  'Good public education. Trinity College Dublin, UCD top universities. International fees: €10k-25k/year.',
  'Irish passport offers visa-free access to 190+ countries, highly valued for both EU and UK access post-Brexit.',
  '[{"label": "Population", "value": "5.1 million"}, {"label": "Capital", "value": "Dublin"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "$99,000"}, {"label": "Languages", "value": "English, Irish"}, {"label": "Timezone", "value": "GMT/IST"}]'::jsonb,
  '[{"name": "Irish Immigration Service", "url": "https://www.irishimmigration.ie/"}, {"name": "Employment Permits", "url": "https://enterprise.gov.ie/en/what-we-do/workplace-and-skills/employment-permits/"}]'::jsonb
),

-- Netherlands
('netherlands',
  'The Netherlands is known for progressive values, excellent work-life balance, and the highly skilled migrant visa program. Amsterdam and other cities attract international talent in tech, finance, and creative industries.',
  'High quality of life, excellent English proficiency, bike-friendly cities, progressive society, strong economy, work-life balance, central European location.',
  '[{"type": "Work", "name": "Highly Skilled Migrant Visa"}, {"type": "Work", "name": "EU Blue Card"}, {"type": "Investor", "name": "Self-Employment Visa"}, {"type": "Study", "name": "Student Visa"}]'::jsonb,
  'High cost especially Amsterdam. Amsterdam rent: €1,400-2,500/month for 1-bedroom. Rotterdam, Utrecht cheaper. Budget €2,000-3,500/month.',
  'English widely spoken in business but Dutch helpful long-term. Integration exam required for permanent residence (A2 Dutch). Many English-taught jobs available.',
  'Maritime temperate - mild winters, cool summers, rainy. Flat landscape perfect for cycling. Liberal, tolerant society. Work-life balance valued.',
  'Strong job market in tech, logistics, agriculture, finance. Amsterdam tech hub. Salary: €35k-75k for skilled roles. Unemployment around 3-4%.',
  'Universal healthcare mandatory. Private insurance required. High quality care.',
  'Excellent education system. Top universities: Delft, Amsterdam, Leiden. Many English-taught programs. Tuition varies.',
  'Dutch passport offers visa-free access to 190+ countries.',
  '[{"label": "Population", "value": "17.8 million"}, {"label": "Capital", "value": "Amsterdam"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "$58,000"}, {"label": "Languages", "value": "Dutch"}, {"label": "Timezone", "value": "CET/CEST"}]'::jsonb,
  '[{"name": "IND - Immigration Service", "url": "https://ind.nl/en"}, {"name": "Highly Skilled Migrant", "url": "https://ind.nl/en"}]'::jsonb
),

-- Thailand
('thailand',
  'Thailand is increasingly popular for remote workers, retirees, and entrepreneurs. Recent visa reforms including the Long-Term Resident visa and improved digital nomad options make it more accessible for extended stays.',
  'Affordable cost of living, tropical climate, rich culture, delicious food, friendly people, modern cities with good infrastructure, growing expat community.',
  '[{"type": "Digital Nomad", "name": "Destination Thailand Visa (DTV)"}, {"type": "Retirement", "name": "Retirement Visa (Non-O)"}, {"type": "Work", "name": "Non-B Work Visa"}, {"type": "Investor", "name": "Thailand Elite / BOI"}]'::jsonb,
  'Very affordable. Bangkok rent: 15,000-40,000 THB/month for 1-bedroom. Food inexpensive. Budget 40,000-80,000 THB/month comfortably.',
  'Thai language not required for most visas but helpful. English limited outside tourist areas. Thai language schools widely available.',
  'Tropical climate - hot and humid most of year, monsoon season June-October. Beach lifestyle in south, mountains in north, modern city life in Bangkok.',
  'Jobs for foreigners mainly teaching English, tourism, tech, business management. Many expats work remotely. Salaries lower than West.',
  'Private healthcare excellent and affordable. Public system available but quality varies. Medical tourism destination. Health insurance recommended.',
  'Good international schools in major cities. Thai public schools less suitable for foreign children. Universities improving.',
  'Thai passport offers visa-free or visa-on-arrival access to 80+ countries.',
  '[{"label": "Population", "value": "71 million"}, {"label": "Capital", "value": "Bangkok"}, {"label": "Currency", "value": "Thai Baht (THB)"}, {"label": "GDP per capita", "value": "$7,200"}, {"label": "Languages", "value": "Thai"}, {"label": "Timezone", "value": "ICT (UTC+7)"}]'::jsonb,
  '[{"name": "Thai Immigration Bureau", "url": "https://www.immigration.go.th/en/"}, {"name": "BOI Thailand", "url": "https://www.boi.go.th/"}, {"name": "Thailand Elite", "url": "https://www.thailandelite.com/"}]'::jsonb
),

-- Japan
('jp',
  'Japan combines ancient traditions with cutting-edge technology. While the language barrier can be challenging, Japan offers unique cultural experiences, safety, excellent infrastructure, and growing opportunities for skilled professionals.',
  'Unique culture, advanced technology, safety and cleanliness, excellent public transport, quality healthcare, strong economy, blend of tradition and modernity.',
  '[{"type": "Work", "name": "Highly Skilled Professional Visa"}, {"type": "Work", "name": "Engineer/Specialist Visa"}, {"type": "Work", "name": "Intra-company Transfer"}, {"type": "Study", "name": "Student Visa"}]'::jsonb,
  'High cost especially Tokyo. Tokyo rent: ¥80,000-150,000/month for 1-bedroom. Food reasonable. Budget ¥250,000-400,000/month.',
  'Japanese language important for integration. JLPT N2-N1 level preferred. Some English jobs in tech/finance. Language study expected for long-term residence.',
  'Four distinct seasons with hot humid summers, cold winters. Typhoon season. Highly organized society. Rich cultural traditions. Excellent public safety.',
  'Strong economy but aging population. Demand for IT, engineering, healthcare workers. Salaries: ¥4-10 million for professionals. Unemployment low.',
  'Excellent universal healthcare system. National health insurance covers 70% of costs. Affordable and high quality.',
  'High-quality education. Top universities: Tokyo, Kyoto. Competitive. Many programs now offered in English.',
  'Japanese passport offers visa-free access to 190+ countries, one of the strongest globally.',
  '[{"label": "Population", "value": "123 million"}, {"label": "Capital", "value": "Tokyo"}, {"label": "Currency", "value": "Japanese Yen (JPY)"}, {"label": "GDP per capita", "value": "$33,000"}, {"label": "Languages", "value": "Japanese"}, {"label": "Timezone", "value": "JST (UTC+9)"}]'::jsonb,
  '[{"name": "Immigration Services Agency", "url": "https://www.moj.go.jp/isa/index.html"}, {"name": "JETRO", "url": "https://www.jetro.go.jp/en/"}, {"name": "HSP Visa", "url": "https://www.mofa.go.jp/j_info/visit/visa/"}]'::jsonb
),

-- Mexico
('mx',
  'Mexico offers affordable living, rich culture, proximity to the US, and increasingly popular temporary residence programs for remote workers and retirees. Diverse climates and lifestyle options from beach towns to cosmopolitan cities.',
  'Affordable cost of living, rich culture and history, delicious food, proximity to US, warm climate, growing expat communities, colonial cities, beautiful beaches.',
  '[{"type": "Digital Nomad", "name": "Temporary Resident Visa"}, {"type": "Retirement", "name": "Temporary/Permanent Resident"}, {"type": "Work", "name": "Work Visa"}, {"type": "Investor", "name": "Investor Visa"}]'::jsonb,
  'Very affordable. Major cities rent: $500-1,200/month for 1-bedroom. Food inexpensive. Budget $1,200-2,500/month comfortably.',
  'Spanish essential for daily life outside major expat areas. English limited. Learning Spanish highly recommended.',
  'Diverse climates - tropical coasts, temperate highlands, desert north. Year-round warm weather in most areas. Rich cultural heritage.',
  'Growing remote work destination. Local jobs limited for foreigners. Teaching English common. Mexico City tech scene emerging.',
  'Public healthcare limited. Private healthcare excellent and affordable. Health insurance recommended.',
  'Good private schools available. Public system variable. Universities affordable.',
  'Mexican passport offers visa-free or visa-on-arrival access to 160+ countries.',
  '[{"label": "Population", "value": "128 million"}, {"label": "Capital", "value": "Mexico City"}, {"label": "Currency", "value": "Mexican Peso (MXN)"}, {"label": "GDP per capita", "value": "$10,000"}, {"label": "Languages", "value": "Spanish"}, {"label": "Timezone", "value": "Multiple zones"}]'::jsonb,
  '[{"name": "Instituto Nacional de Migración", "url": "https://www.gob.mx/inm"}, {"name": "Mexican Consulates", "url": "https://consulmex.sre.gob.mx/"}]'::jsonb
)

ON CONFLICT (country_slug) DO NOTHING;
