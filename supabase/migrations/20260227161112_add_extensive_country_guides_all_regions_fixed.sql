/*
  # Add Extensive Country Immigration Guides
  
  Adds comprehensive guides for popular destinations across all regions
*/

INSERT INTO country_guides (
  country_slug, overview, why_immigrate, popular_pathways,
  cost_of_living, language_requirements, climate_lifestyle,
  employment_opportunities, healthcare_system, education_system,
  visa_free_travel, key_facts, official_resources
) VALUES

-- France
('fr',
  'France offers quality of life, culture, excellent healthcare, and the Talent Passport for skilled workers and investors. Paris remains a global center for arts, fashion, and gastronomy.',
  'Rich culture and arts, excellent cuisine, quality healthcare, good work-life balance, beautiful countryside, strong social benefits, central location in Europe.',
  '[{"type": "Work", "name": "Talent Passport"}, {"type": "Investor", "name": "Investor Visa"}, {"type": "Study", "name": "Student Visa"}, {"type": "Work", "name": "Employee Visa"}]'::jsonb,
  'Paris expensive: €1,200-2,500/month rent. Other cities cheaper (€600-1,000). Budget €2,000-4,000/month.',
  'French language essential. DELF/DALF exams. English limited outside Paris. B1 level for citizenship.',
  'Temperate climate, four seasons. Strong work-life balance. 35-hour work week. Long vacations. Cafe culture.',
  'Large economy - tech, aerospace, luxury goods, tourism. Salaries: €30k-70k. Strong worker protections.',
  'Excellent universal healthcare. Residents covered through social security. Among world''s best.',
  'Excellent public education, free through university. Top universities (grandes ecoles). Very low tuition.',
  'French passport offers visa-free access to 190+ countries.',
  '[{"label": "Population", "value": "67 million"}, {"label": "Capital", "value": "Paris"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "Languages", "value": "French"}]'::jsonb,
  '[{"name": "France Visas", "url": "https://france-visas.gouv.fr/"}, {"name": "Immigration Portal", "url": "https://www.immigration.interieur.gouv.fr/"}]'::jsonb
),

-- Panama
('panama',
  'Panama offers the Friendly Nations Visa and attractive residency programs. The country uses the US dollar, has growing economy, and serves as a regional hub.',
  'US dollar economy, tax benefits, Friendly Nations Visa, regional hub, tropical lifestyle, affordable living, proximity to US.',
  '[{"type": "Residency", "name": "Friendly Nations Visa"}, {"type": "Retirement", "name": "Pensionado Visa"}, {"type": "Investor", "name": "Investor Visa"}]'::jsonb,
  'Panama City moderate: $800-1,500/month rent. Outside capital much cheaper. Budget $1,500-2,500/month.',
  'Spanish official language. English spoken in business and expat areas. Spanish helpful for integration.',
  'Tropical climate - hot and humid. Coastal areas, mountains, rainforest. Growing expat community.',
  'Growing economy - logistics, finance, tourism, services. Regional corporate hub. Salaries moderate.',
  'Mixed public/private system. Private healthcare good quality and affordable. Medical tourism growing.',
  'Public education adequate. Private and international schools popular with expats. Universities decent.',
  'Panamanian passport offers visa-free access to 145+ countries.',
  '[{"label": "Population", "value": "4.3 million"}, {"label": "Capital", "value": "Panama City"}, {"label": "Currency", "value": "US Dollar (USD)"}, {"label": "Languages", "value": "Spanish"}]'::jsonb,
  '[{"name": "Immigration Panama", "url": "https://www.migracion.gob.pa/"}, {"name": "Invest Panama", "url": "https://www.proinvex.gob.pa/"}]'::jsonb
),

-- Chile
('chile',
  'Chile offers stable economy, modern infrastructure, and various visa options for professionals, entrepreneurs, and retirees. Known for natural beauty from desert to glaciers.',
  'Stable economy, modern infrastructure, natural beauty, safe cities, good healthcare, gateway to South America.',
  '[{"type": "Work", "name": "Work Visa"}, {"type": "Residency", "name": "Temporary Residence"}, {"type": "Investor", "name": "Investor Visa"}, {"type": "Digital Nomad", "name": "Digital Nomad options"}]'::jsonb,
  'Santiago moderate: $500-1,000/month rent for 1-bedroom. Good value compared to US/Europe. Budget $1,200-2,000/month.',
  'Spanish essential for daily life and work. English limited outside business circles. Language courses available.',
  'Varied climate - desert north, Mediterranean center, cold south. Modern cities. Outdoor lifestyle - hiking, skiing.',
  'Stable economy - mining, agriculture, services, tech growing. Salaries moderate. Lower than US but decent locally.',
  'Good public healthcare system (FONASA) for residents. Private healthcare (ISAPRE) excellent and affordable.',
  'Good public education. Several strong universities. International schools in Santiago. Affordable tuition.',
  'Chilean passport offers visa-free access to 175+ countries.',
  '[{"label": "Population", "value": "19 million"}, {"label": "Capital", "value": "Santiago"}, {"label": "Currency", "value": "Chilean Peso (CLP)"}, {"label": "Languages", "value": "Spanish"}]'::jsonb,
  '[{"name": "Chile Immigration", "url": "https://www.extranjeria.gob.cl/"}, {"name": "Invest Chile", "url": "https://investchile.gob.cl/"}]'::jsonb
),

-- Colombia
('colombia',
  'Colombia offers growing economy, affordable living, and friendly people. Digital nomad visa and various residency options make it attractive for remote workers and entrepreneurs.',
  'Affordable living, friendly culture, improving safety, growing economy, beautiful landscapes, coffee culture, digital nomad visa.',
  '[{"type": "Digital Nomad", "name": "Digital Nomad Visa"}, {"type": "Work", "name": "Work Visa"}, {"type": "Residency", "name": "Investor/Rentista Visa"}, {"type": "Retirement", "name": "Retirement Visa"}]'::jsonb,
  'Very affordable. Medellin/Bogota: $300-700/month rent. Food inexpensive. Budget $1,000-1,800/month comfortably.',
  'Spanish essential for daily life. English limited outside tourist areas and expat communities. Courses widely available.',
  'Varied climate by altitude. Eternal spring in Medellin. Coastal areas hot. Friendly culture. Improving safety.',
  'Growing economy - tech, coffee, services, tourism. Lower salaries than US but cost of living matches. Remote work popular.',
  'Mixed system. Public healthcare basic. Private healthcare excellent and very affordable. EPS system for residents.',
  'Public education improving. Private schools good. Universities decent. International schools in major cities.',
  'Colombian passport offers visa-free access to 130+ countries.',
  '[{"label": "Population", "value": "51 million"}, {"label": "Capital", "value": "Bogota"}, {"label": "Currency", "value": "Colombian Peso (COP)"}, {"label": "Languages", "value": "Spanish"}]'::jsonb,
  '[{"name": "Colombia Migration", "url": "https://www.migracioncolombia.gov.co/"}, {"name": "Invest Colombia", "url": "https://www.investincolombia.com.co/"}]'::jsonb
),

-- Brazil
('brazil',
  'Brazil, South America''s largest economy, offers diverse opportunities from tech hubs to beaches. Various visa options for investors, retirees, and skilled workers.',
  'Large economy, diverse culture, beautiful beaches, friendly people, growing tech sector, affordable living in many areas.',
  '[{"type": "Work", "name": "Work Visa"}, {"type": "Investor", "name": "Investor Visa"}, {"type": "Retirement", "name": "Retirement Visa"}, {"type": "Digital Nomad", "name": "Digital Nomad options"}]'::jsonb,
  'Varies widely. Rio/Sao Paulo: $400-1,000/month rent. Other cities cheaper. Budget $1,000-2,000/month.',
  'Portuguese essential. Spanish helps but different language. English limited. Language requirement for permanent residence.',
  'Varied climate - tropical coast, temperate south. Beach culture. Friendly people. Carnival and festivals.',
  'Large economy but challenging. Tech growing in Sao Paulo. Tourism, agriculture. Bureaucracy can be difficult. Salaries moderate.',
  'Universal public healthcare (SUS) for residents. Quality varies. Private healthcare good and affordable in cities.',
  'Public universities free and some are excellent. Private universities affordable. International schools in major cities.',
  'Brazilian passport offers visa-free access to 170+ countries.',
  '[{"label": "Population", "value": "215 million"}, {"label": "Capital", "value": "Brasilia"}, {"label": "Currency", "value": "Brazilian Real (BRL)"}, {"label": "Languages", "value": "Portuguese"}]'::jsonb,
  '[{"name": "Brazil Immigration", "url": "https://www.gov.br/pt-br/servicos/obter-visto-de-imigracao"}]'::jsonb
),

-- Vietnam
('vietnam',
  'Vietnam offers affordable living, delicious cuisine, and growing economy. Popular with digital nomads and English teachers. E-visa makes entry easy.',
  'Very affordable, delicious food, friendly people, beautiful landscapes, growing economy, safe cities, good internet.',
  '[{"type": "Work", "name": "Work Permit"}, {"type": "Digital Nomad", "name": "Digital Nomad options"}, {"type": "Investor", "name": "Investor Visa"}, {"type": "Retirement", "name": "Retirement options"}]'::jsonb,
  'Very affordable. Hanoi/HCMC: $300-600/month rent. Street food cheap. Budget $700-1,500/month comfortably.',
  'Vietnamese official language. English growing especially in cities. Not required for most visas but helpful.',
  'Tropical climate. Hot humid summers, mild winters in north. Friendly culture. Delicious food scene. Motorbike culture.',
  'Growing economy - manufacturing, tech, tourism, English teaching. Salaries low by Western standards but cost of living matches.',
  'Healthcare improving. Public system basic. Private hospitals good in cities and very affordable. Insurance recommended.',
  'Education system competitive. International schools expensive. Universities adequate. Many attend international schools.',
  'Vietnamese passport offers visa-free access to 55+ countries.',
  '[{"label": "Population", "value": "98 million"}, {"label": "Capital", "value": "Hanoi"}, {"label": "Currency", "value": "Vietnamese Dong (VND)"}, {"label": "Languages", "value": "Vietnamese"}]'::jsonb,
  '[{"name": "Vietnam Immigration", "url": "https://evisa.xuatnhapcanh.gov.vn/"}, {"name": "Invest Vietnam", "url": "https://fia.mpi.gov.vn/"}]'::jsonb
),

-- Indonesia
('indonesia',
  'Indonesia offers tropical paradise lifestyle with Bali as popular digital nomad hub. New visa options make long-term stays easier.',
  'Tropical islands, affordable living, rich culture, friendly locals, growing digital nomad scene, beautiful beaches.',
  '[{"type": "Digital Nomad", "name": "Second Home Visa"}, {"type": "Retirement", "name": "Retirement Visa"}, {"type": "Work", "name": "Work Permit (KITAS)"}, {"type": "Investor", "name": "Investor Visa"}]'::jsonb,
  'Very affordable. Bali: $300-800/month rent. Local food cheap. Western lifestyle more expensive. Budget $800-1,800/month.',
  'Bahasa Indonesia official. English spoken in tourist areas. Indonesian helpful but not required for most visas.',
  'Tropical climate - hot and humid year-round. Island lifestyle. Rich culture and traditions. Relaxed atmosphere.',
  'Limited formal employment for foreigners. Popular for remote work, tourism, surfing schools. Local salaries very low.',
  'Healthcare quality varies. Private hospitals good in Bali/Jakarta and affordable. Insurance essential. Medical evacuation coverage recommended.',
  'Public education basic. International schools expensive but high quality. Popular with expat families in Bali.',
  'Indonesian passport offers visa-free access to 73+ countries.',
  '[{"label": "Population", "value": "275 million"}, {"label": "Capital", "value": "Jakarta"}, {"label": "Currency", "value": "Indonesian Rupiah (IDR)"}, {"label": "Languages", "value": "Bahasa Indonesia"}]'::jsonb,
  '[{"name": "Indonesia Immigration", "url": "https://www.imigrasi.go.id/"}, {"name": "Invest Indonesia", "url": "https://www.bkpm.go.id/"}]'::jsonb
),

-- Norway
('norway',
  'Norway offers high quality of life, excellent social benefits, and stunning nature. High salaries offset high cost of living. Skilled Worker Visa for in-demand professions.',
  'High quality of life, excellent healthcare, beautiful nature, strong economy, work-life balance, social benefits, safe society.',
  '[{"type": "Work", "name": "Skilled Worker Visa"}, {"type": "Study", "name": "Student Visa"}, {"type": "Work", "name": "Job Seeker Visa"}]'::jsonb,
  'Very expensive. Oslo rent expensive. Food, transport expensive. Budget high.',
  'Norwegian helpful for integration and jobs. English widely spoken. Free language courses for residents.',
  'Cold climate, long dark winters, beautiful summers. Outdoor lifestyle - hiking, skiing. Work-life balance. Expensive but high quality.',
  'Strong economy - oil, maritime, tech, healthcare. High salaries. Low unemployment. Worker-friendly.',
  'Excellent universal healthcare for residents. High quality, minimal costs. Among world''s best.',
  'Excellent public education, free through university. Top universities. International schools available.',
  'Norwegian passport offers visa-free access to 190+ countries.',
  '[{"label": "Population", "value": "5.5 million"}, {"label": "Capital", "value": "Oslo"}, {"label": "Currency", "value": "Norwegian Krone (NOK)"}, {"label": "Languages", "value": "Norwegian"}]'::jsonb,
  '[{"name": "UDI Immigration", "url": "https://www.udi.no/"}, {"name": "Work in Norway", "url": "https://www.work.norway.no/"}]'::jsonb
),

-- Sweden
('sweden',
  'Sweden offers high quality of life, innovative economy, and excellent work-life balance. Work permits available for skilled workers and entrepreneurs.',
  'High quality of life, innovative tech sector, work-life balance, excellent social benefits, safe cities, English widely spoken.',
  '[{"type": "Work", "name": "Work Permit"}, {"type": "Study", "name": "Student Visa"}, {"type": "Work", "name": "Job Seeker Visa"}]'::jsonb,
  'Expensive. Stockholm rent expensive. Budget high.',
  'Swedish helpful but English widely spoken. Free Swedish courses for immigrants. Integration courses available.',
  'Cold climate, dark winters, light summers. Modern cities. Strong work-life balance culture. Lagom (moderation) lifestyle.',
  'Strong economy - tech, engineering, healthcare. Companies: Spotify, Ericsson. High salaries.',
  'Excellent universal healthcare. High quality, low costs for residents. Among best in world.',
  'Excellent free education through university. Top universities: KTH, Lund. International programs available.',
  'Swedish passport offers visa-free access to 190+ countries.',
  '[{"label": "Population", "value": "10.5 million"}, {"label": "Capital", "value": "Stockholm"}, {"label": "Currency", "value": "Swedish Krona (SEK)"}, {"label": "Languages", "value": "Swedish"}]'::jsonb,
  '[{"name": "Migration Agency", "url": "https://www.migrationsverket.se/"}, {"name": "Work in Sweden", "url": "https://work.sweden.se/"}]'::jsonb
),

-- Denmark
('denmark',
  'Denmark offers exceptional quality of life, innovative economy, and the happiness-focused hygge lifestyle. Positive List scheme for in-demand skills.',
  'High quality of life, work-life balance, hygge culture, excellent social benefits, bike-friendly cities, English widely spoken.',
  '[{"type": "Work", "name": "Positive List Scheme"}, {"type": "Work", "name": "Fast-track Scheme"}, {"type": "Study", "name": "Student Visa"}]'::jsonb,
  'Expensive. Copenhagen rent expensive. Budget high.',
  'Danish helpful for integration. English very widely spoken. Free Danish courses for immigrants.',
  'Temperate maritime climate. Bike culture. Hygge lifestyle. Work-life balance strong. Modern welfare state.',
  'Strong economy - pharmaceuticals, renewable energy, shipping. High salaries. Low unemployment.',
  'Excellent universal healthcare. High quality, free for residents. Among world''s best systems.',
  'Excellent free education including university. Top universities. International programs available.',
  'Danish passport offers visa-free access to 190+ countries.',
  '[{"label": "Population", "value": "5.9 million"}, {"label": "Capital", "value": "Copenhagen"}, {"label": "Currency", "value": "Danish Krone (DKK)"}, {"label": "Languages", "value": "Danish"}]'::jsonb,
  '[{"name": "Immigration Service", "url": "https://www.nyidanmark.dk/"}, {"name": "Work in Denmark", "url": "https://www.workindenmark.dk/"}]'::jsonb
),

-- South Africa
('south-africa',
  'South Africa offers diverse landscapes, English as business language, and various visa options. Critical Skills Work Visa and Business Visa available.',
  'English widely spoken, diverse culture, beautiful landscapes, affordable living, good weather, gateway to Africa.',
  '[{"type": "Work", "name": "Critical Skills Work Visa"}, {"type": "Work", "name": "General Work Visa"}, {"type": "Investor", "name": "Business Visa"}, {"type": "Retirement", "name": "Retirement Visa"}]'::jsonb,
  'Affordable. Cape Town affordable rent. Budget moderate.',
  'English widely spoken. 11 official languages. No language requirement for visas.',
  'Mediterranean climate in Cape Town. Varied elsewhere. Outdoor lifestyle. Wine regions. Safety concerns in some areas.',
  'Largest African economy - mining, finance, tourism, tech growing. Unemployment high.',
  'Two-tier system. Public healthcare strained. Private healthcare excellent and affordable. Insurance essential.',
  'Mixed quality. Private schools and universities good. Several top universities. International schools available.',
  'South African passport offers visa-free access to 105+ countries.',
  '[{"label": "Population", "value": "60 million"}, {"label": "Capital", "value": "Pretoria/Cape Town"}, {"label": "Currency", "value": "South African Rand (ZAR)"}, {"label": "Languages", "value": "English, Afrikaans"}]'::jsonb,
  '[{"name": "Home Affairs", "url": "http://www.dha.gov.za/"}, {"name": "Invest South Africa", "url": "https://www.investsa.gov.za/"}]'::jsonb
)

ON CONFLICT (country_slug) DO NOTHING;
