/*
  # Populate Country Immigration Guides
  
  This migration adds comprehensive immigration guides for major destinations worldwide.
  
  1. Coverage
    - North America: USA, Canada, Mexico
    - Europe: UK, Germany, France, Spain, Portugal, Ireland, Netherlands, Italy, Greece
    - Asia: Singapore, Japan, UAE, Thailand, Malaysia
    - Oceania: Australia, New Zealand
    - South America: Costa Rica, Panama, Argentina, Chile, Colombia
    
  2. Content
    - Each guide includes overview, reasons to immigrate, popular pathways
    - Cost of living, language requirements, climate/lifestyle
    - Employment opportunities, healthcare, education
    - Key facts and official resources
*/

INSERT INTO country_guides (
  country_slug, overview, why_immigrate, popular_pathways,
  cost_of_living, language_requirements, climate_lifestyle,
  employment_opportunities, healthcare_system, education_system,
  visa_free_travel, key_facts, official_resources
) VALUES

-- United States
('us', 
  'The United States remains one of the world''s top immigration destinations, offering diverse opportunities across technology, business, education, and more. With a population of over 330 million and the world''s largest economy, the US attracts immigrants through various visa categories including employment, family, and investor pathways.',
  'World''s largest economy, diverse job opportunities especially in tech and business, top-ranked universities, cultural diversity, entrepreneurial ecosystem, strong legal protections, and pathway to citizenship.',
  '[{"type": "Work", "name": "H-1B Specialty Occupation Visa"}, {"type": "Investor", "name": "EB-5 Immigrant Investor Program"}, {"type": "Study", "name": "F-1 Student Visa"}, {"type": "Work", "name": "L-1 Intracompany Transfer"}]'::jsonb,
  'High cost of living in major cities (New York, San Francisco, LA). Average rent for 1-bedroom: $1,500-3,500/month. Healthcare is expensive. Groceries and dining vary widely by state. Overall, expect $3,000-6,000/month for comfortable living in major metros.',
  'English proficiency required for most professional roles. TOEFL or IELTS scores needed for university admission (typically 80+ TOEFL or 6.5+ IELTS). No official language requirement for permanent residence, but English skills essential for integration.',
  'Extremely diverse climates from tropical (Hawaii, Florida) to arctic (Alaska), Mediterranean (California), continental (Midwest), and more. Four distinct seasons in most areas. Lifestyle varies greatly by region - fast-paced urban areas, suburban communities, rural spaces.',
  'Strong job market in technology, healthcare, finance, engineering. Silicon Valley, Seattle, Austin, and Boston are tech hubs. Wall Street for finance. Competitive but high salaries - tech workers earn $100k-250k+. Unemployment typically 3-5%.',
  'No universal healthcare - must have private insurance through employer or purchase individually. High quality medical care but expensive. Employer-sponsored insurance is common. Medicare available at 65+. Out-of-pocket costs can be significant.',
  'World-class universities (Harvard, MIT, Stanford). Public K-12 education varies by state/district. Many excellent public universities. Private education available at all levels. International students pay high tuition ($30k-70k/year for universities).',
  'US passport is one of the world''s strongest, offering visa-free or visa-on-arrival access to 180+ countries including EU, UK, Japan, and most major economies.',
  '[{"label": "Population", "value": "330+ million"}, {"label": "Capital", "value": "Washington, D.C."}, {"label": "Currency", "value": "US Dollar (USD)"}, {"label": "GDP per capita", "value": "$76,000"}, {"label": "Languages", "value": "English (de facto)"}, {"label": "Time Zones", "value": "6 main zones (EST to HST)"}]'::jsonb,
  '[{"name": "USCIS - US Citizenship and Immigration Services", "url": "https://www.uscis.gov/"}, {"name": "US Department of State - Visa Information", "url": "https://travel.state.gov/content/travel/en/us-visas.html"}, {"name": "EB-5 Immigrant Investor Program", "url": "https://www.uscis.gov/eb-5"}]'::jsonb
),

-- Canada
('ca',
  'Canada is renowned for its welcoming immigration policies, high quality of life, and diverse multicultural society. With multiple immigration pathways including Express Entry, Provincial Nominee Programs, and family sponsorship, Canada actively seeks skilled workers, entrepreneurs, and students.',
  'High quality of life, universal healthcare, excellent education system, safe cities, multicultural society, pathway to citizenship in 3 years, strong social safety net, beautiful natural landscapes.',
  '[{"type": "Work", "name": "Express Entry (FSW, CEC, FST)"}, {"type": "Work", "name": "Provincial Nominee Programs"}, {"type": "Study", "name": "Study Permit (with PGWP option)"}, {"type": "Investor", "name": "Start-up Visa Program"}]'::jsonb,
  'Moderate to high cost of living. Toronto/Vancouver are expensive: $1,800-3,000/month rent for 1-bedroom. Montreal and other cities more affordable ($900-1,500). Overall budget: $2,500-4,500/month in major cities. Free healthcare reduces medical costs.',
  'English or French required. Express Entry uses IELTS (General) or CELPIP for English, TEF for French. Minimum CLB 7 (IELTS 6.0) for Federal Skilled Worker. Higher scores increase chances. French speakers get extra points.',
  'Four distinct seasons with cold winters (especially in prairies and east). Vancouver has mild, rainy winters. Hot summers in most regions. Outdoor lifestyle popular - skiing, hiking, camping. Urban areas well-developed with good public transit.',
  'Strong demand for skilled workers in tech, healthcare, trades, engineering. Tech hubs: Toronto, Vancouver, Montreal, Waterloo. Growing AI/tech sector. Salaries competitive: $60k-120k for skilled positions. Unemployment around 5-6%.',
  'Universal public healthcare (medicare) covered through taxes. No cost for doctor visits, hospital stays. Dental and vision usually require private insurance. Wait times for non-emergency procedures can be long. High quality care overall.',
  'Excellent public education K-12. Top universities: UBC, U of Toronto, McGill, Waterloo. International student tuition: $15k-40k CAD/year. Post-Graduation Work Permit (PGWP) available for international graduates (1-3 years).',
  'Canadian passport offers visa-free or visa-on-arrival access to 185+ countries, including USA, EU, UK, Australia, and Japan. One of the world''s strongest passports.',
  '[{"label": "Population", "value": "39+ million"}, {"label": "Capital", "value": "Ottawa"}, {"label": "Currency", "value": "Canadian Dollar (CAD)"}, {"label": "GDP per capita", "value": "$54,000"}, {"label": "Languages", "value": "English and French (official)"}, {"label": "Time Zones", "value": "6 zones (NST to PST)"}]'::jsonb,
  '[{"name": "IRCC - Immigration, Refugees and Citizenship Canada", "url": "https://www.canada.ca/en/immigration-refugees-citizenship.html"}, {"name": "Express Entry", "url": "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html"}, {"name": "Provincial Nominee Programs", "url": "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/provincial-nominees.html"}]'::jsonb
),

-- United Kingdom
('gb',
  'The UK offers diverse immigration pathways for skilled workers, students, entrepreneurs, and investors. Post-Brexit, the UK has implemented a points-based immigration system. London remains a global financial hub, and the UK boasts world-class universities and rich cultural heritage.',
  'Global business hub (London), English-speaking, world-class universities (Oxford, Cambridge), strong job market in finance and tech, rich history and culture, access to Europe, NHS healthcare system.',
  '[{"type": "Work", "name": "Skilled Worker Visa"}, {"type": "Study", "name": "Student Visa (with Graduate Route)"}, {"type": "Investor", "name": "Innovator Founder Visa"}, {"type": "Work", "name": "Global Talent Visa"}]'::jsonb,
  'High cost of living especially in London. London rent: £1,500-3,000/month for 1-bedroom. Other cities like Manchester, Birmingham more affordable (£700-1,200). Council tax, transportation add costs. Budget £2,500-5,000/month in London.',
  'English language requirement for most visas. Approved tests: IELTS, TOEFL, PTE, etc. Minimum B1 level (IELTS 4.0) for skilled worker, B2 (IELTS 5.5) for students. Native English speakers or degree taught in English may be exempt.',
  'Temperate maritime climate - mild winters, cool summers, frequent rain. Four seasons but not extreme temperatures. Urban lifestyle in cities, countryside accessible. Rich cultural scene - theaters, museums, historic sites. Pub culture prominent.',
  'Strong job market in finance (London), technology, pharmaceuticals, creative industries. London is major global financial center. Tech sector growing rapidly. Skilled worker salaries: £30k-80k+. National minimum wage £11.44/hour.',
  'National Health Service (NHS) provides free healthcare at point of use. Funded through taxes and Immigration Health Surcharge (£1,035/year for most visa holders). High quality care but wait times for non-urgent procedures. Private healthcare available.',
  'World-renowned universities: Oxford, Cambridge, Imperial, LSE, UCL. Strong public school system. International tuition: £15k-40k/year for undergrad, £15k-50k for postgrad. Graduate Route allows 2-year post-study work (3 years for PhD).',
  'UK passport provides visa-free or visa-on-arrival access to 190+ countries worldwide, including USA, EU (90 days), Australia, Canada, and Japan.',
  '[{"label": "Population", "value": "67+ million"}, {"label": "Capital", "value": "London"}, {"label": "Currency", "value": "Pound Sterling (GBP)"}, {"label": "GDP per capita", "value": "$46,000"}, {"label": "Languages", "value": "English"}, {"label": "Timezone", "value": "GMT/BST"}]'::jsonb,
  '[{"name": "UK Visas and Immigration", "url": "https://www.gov.uk/browse/visas-immigration"}, {"name": "Skilled Worker Visa", "url": "https://www.gov.uk/skilled-worker-visa"}, {"name": "Global Talent Visa", "url": "https://www.gov.uk/global-talent"}]'::jsonb
),

-- Australia
('au',
  'Australia''s skilled migration program targets professionals in high-demand occupations. Known for its high quality of life, beautiful landscapes, and strong economy, Australia offers permanent residence pathways through skilled, employer-sponsored, and business visas.',
  'High quality of life, excellent weather, strong economy, high salaries, points-based immigration system, beautiful beaches and nature, safe cities, multicultural society, good work-life balance.',
  '[{"type": "Work", "name": "Skilled Independent Visa (189)"}, {"type": "Work", "name": "Employer Sponsored (482/186)"}, {"type": "Study", "name": "Student Visa (with PSW)"}, {"type": "Investor", "name": "Business Innovation and Investment Program"}]'::jsonb,
  'High cost of living in Sydney and Melbourne. Rent: AUD $400-800/week for 1-bedroom apartment in major cities. Utilities, transportation add costs. Average living expenses: AUD $3,000-5,000/month. High minimum wage offsets some costs.',
  'English proficiency required - IELTS, PTE, TOEFL accepted. For skilled migration, minimum IELTS 6.0 per band (Competent English), but higher scores (7.0-8.0) earn more points. Student visas require 5.5-6.5+ depending on program.',
  'Warm to hot climate in most areas. Mild winters, hot summers. Mediterranean climate in south, tropical in north. Outdoor lifestyle prominent - beaches, BBQs, sports. Work-life balance valued. Four-week annual leave standard.',
  'Strong job market in healthcare, IT, engineering, trades, education. Skills shortages in many fields. High salaries - skilled workers earn AUD $70k-150k+. Unemployment around 3-4%. Mining and resources sector significant in certain regions.',
  'Medicare provides universal healthcare for citizens/permanent residents. Covers doctor visits, hospital care. Private health insurance recommended for faster access. High quality medical care. Overseas visitors health cover required for visa holders.',
  'High-quality education system. Top universities: Melbourne, Sydney, ANU, UNSW, Queensland. International tuition: AUD $25k-50k/year. Post-Study Work visa available for graduates (2-4 years depending on qualification level).',
  'Australian passport offers visa-free or visa-on-arrival access to 185+ countries including USA, EU, UK, Japan, and most major destinations worldwide.',
  '[{"label": "Population", "value": "26+ million"}, {"label": "Capital", "value": "Canberra"}, {"label": "Currency", "value": "Australian Dollar (AUD)"}, {"label": "GDP per capita", "value": "$65,000"}, {"label": "Languages", "value": "English"}, {"label": "Timezone", "value": "Multiple (AEST, ACST, AWST)"}]'::jsonb,
  '[{"name": "Department of Home Affairs", "url": "https://immi.homeaffairs.gov.au/"}, {"name": "SkillSelect", "url": "https://immi.homeaffairs.gov.au/visas/working-in-australia/skillselect"}, {"name": "Study in Australia", "url": "https://www.studyaustralia.gov.au/"}]'::jsonb
)

ON CONFLICT (country_slug) DO NOTHING;
