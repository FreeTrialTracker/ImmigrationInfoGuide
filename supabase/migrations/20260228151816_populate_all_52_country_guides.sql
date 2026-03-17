/*
  # Populate All 52 Country Guides

  1. Purpose
    - Adds comprehensive country guides for all 52 countries
    - Ensures every country in the database has a corresponding guide

  2. Changes
    - Inserts country guides for all missing countries
    - Provides overview and basic information for each

  3. Notes
    - Uses ON CONFLICT to safely update existing records
    - All 52 countries will have immigration guides
*/

INSERT INTO country_guides (country_slug, overview, why_immigrate) VALUES
  ('argentina', 'Argentina offers diverse immigration pathways for those seeking to relocate to South America.', 'Strong cultural scene, affordable cost of living, and various visa options for professionals and retirees.'),
  ('australia', 'Australia is a popular destination with robust immigration programs for skilled workers and families.', 'High quality of life, strong economy, excellent healthcare and education systems.'),
  ('austria', 'Austria provides immigration options through work, study, and investment programs.', 'Central European location, high living standards, rich cultural heritage.'),
  ('belgium', 'Belgium offers various visa categories for work, business, and family reunification.', 'EU hub location, multilingual environment, strong economy.'),
  ('canada', 'Canada has one of the most welcoming immigration systems globally with multiple pathways.', 'Multicultural society, excellent quality of life, strong economy and social services.'),
  ('china', 'China provides work permits and residency options for foreign professionals and investors.', 'Rapidly growing economy, business opportunities, rich cultural experience.'),
  ('croatia', 'Croatia offers EU residency options through work, business, and digital nomad visas.', 'Beautiful coastline, affordable living, EU member state benefits.'),
  ('czech-republic', 'Czech Republic provides various visa types for work, study, and entrepreneurship.', 'Central European location, affordable cost of living, growing tech scene.'),
  ('denmark', 'Denmark offers immigration programs for skilled workers and researchers.', 'High quality of life, strong social welfare system, excellent work-life balance.'),
  ('egypt', 'Egypt provides residency options for investors, retirees, and professionals.', 'Rich history, affordable living, growing business opportunities.'),
  ('finland', 'Finland welcomes skilled workers and entrepreneurs with various visa programs.', 'Excellent education system, high quality of life, innovative society.'),
  ('france', 'France offers diverse immigration pathways including talent passports and entrepreneur visas.', 'Cultural richness, excellent healthcare, central location in Europe.'),
  ('germany', 'Germany has robust immigration programs for skilled workers and job seekers.', 'Strong economy, excellent infrastructure, opportunities for professionals.'),
  ('greece', 'Greece offers golden visa programs and residency through investment or retirement.', 'Mediterranean climate, affordable living, rich history and culture.'),
  ('hungary', 'Hungary provides residency through investment, work, or study programs.', 'Central European location, affordable cost of living, EU member benefits.'),
  ('india', 'India offers various visa categories for business, work, and long-term stays.', 'Growing economy, diverse culture, business opportunities in tech sector.'),
  ('indonesia', 'Indonesia provides retirement visas and business permits for foreigners.', 'Tropical climate, affordable living, beautiful landscapes and beaches.'),
  ('ireland', 'Ireland welcomes skilled workers and entrepreneurs with streamlined visa processes.', 'English-speaking, thriving tech industry, EU member state benefits.'),
  ('israel', 'Israel offers immigration programs for professionals and those with Jewish heritage.', 'Innovation hub, Mediterranean climate, strong tech ecosystem.'),
  ('italy', 'Italy provides various visa options including elective residency and investor visas.', 'Rich culture and history, excellent cuisine, Mediterranean lifestyle.'),
  ('japan', 'Japan offers work visas, highly skilled professional programs, and startup visas.', 'Advanced technology, strong economy, unique culture and safety.'),
  ('malaysia', 'Malaysia has attractive programs like MM2H for retirees and professionals.', 'Affordable living, tropical climate, strategic location in Southeast Asia.'),
  ('mexico', 'Mexico offers temporary and permanent residency options for retirees and remote workers.', 'Affordable living, rich culture, proximity to United States.'),
  ('morocco', 'Morocco provides residency options for retirees and investors.', 'African gateway, affordable living, diverse landscapes and culture.'),
  ('netherlands', 'Netherlands welcomes highly skilled migrants and entrepreneurs with various programs.', 'Excellent infrastructure, international environment, high quality of life.'),
  ('new-zealand', 'New Zealand offers skilled migrant programs and investor visas.', 'Stunning natural beauty, high quality of life, English-speaking.'),
  ('nigeria', 'Nigeria provides work permits and residency options for investors and professionals.', 'Largest African economy, business opportunities, young dynamic population.'),
  ('norway', 'Norway offers immigration for skilled workers through its point-based system.', 'Exceptional quality of life, natural beauty, strong social welfare.'),
  ('peru', 'Peru provides residency options for investors, retirees, and professionals.', 'Rich history, affordable living, growing economy in South America.'),
  ('philippines', 'Philippines offers retirement visas and special resident programs.', 'English-speaking, tropical climate, affordable cost of living.'),
  ('poland', 'Poland provides work permits and EU Blue Card options for skilled workers.', 'Growing economy, affordable living, central European location.'),
  ('portugal', 'Portugal offers golden visa programs and D7 passive income visas.', 'Excellent climate, affordable living, gateway to Europe.'),
  ('qatar', 'Qatar provides work permits and residency for professionals in various sectors.', 'Tax-free income, modern infrastructure, strategic Middle East location.'),
  ('romania', 'Romania offers work permits and residency options for EU and non-EU citizens.', 'Affordable living, EU member benefits, growing tech scene.'),
  ('russia', 'Russia provides work permits and residency programs for skilled professionals.', 'Vast territory, business opportunities, rich cultural heritage.'),
  ('saudi-arabia', 'Saudi Arabia offers work visas and premium residency programs.', 'Tax-free income, modern development, strategic Middle East location.'),
  ('singapore', 'Singapore has highly competitive skilled migration and entrepreneur programs.', 'Global business hub, excellent infrastructure, high standard of living.'),
  ('south-africa', 'South Africa provides various visa categories including critical skills and business visas.', 'Diverse landscapes, affordable living, gateway to African continent.'),
  ('south-korea', 'South Korea offers work visas and points-based skilled migration programs.', 'Advanced technology, strong economy, unique culture and cuisine.'),
  ('spain', 'Spain offers golden visa programs and non-lucrative residence visas.', 'Mediterranean lifestyle, excellent climate, rich culture and history.'),
  ('sweden', 'Sweden welcomes skilled workers and entrepreneurs with various programs.', 'High quality of life, innovative society, excellent social welfare.'),
  ('switzerland', 'Switzerland offers work permits for highly qualified professionals.', 'High income potential, excellent quality of life, central European location.'),
  ('thailand', 'Thailand provides retirement visas, elite residence programs, and digital nomad options.', 'Affordable living, tropical climate, excellent food and hospitality.'),
  ('turkey', 'Turkey offers residency through investment, work, or property purchase.', 'Bridge between Europe and Asia, rich history, growing economy.'),
  ('ukraine', 'Ukraine provides work permits and temporary residency for professionals.', 'Affordable living, growing IT sector, cultural richness.'),
  ('united-arab-emirates', 'UAE offers golden visas, investor programs, and remote work visas.', 'Tax-free income, modern infrastructure, strategic location.'),
  ('united-kingdom', 'UK provides various visa routes including skilled worker and innovator visas.', 'Global financial center, cultural diversity, English-speaking.'),
  ('united-states', 'USA offers diverse immigration pathways including employment and investment-based visas.', 'World''s largest economy, career opportunities, cultural diversity.'),
  ('vietnam', 'Vietnam provides work permits and temporary residence cards for professionals.', 'Affordable living, growing economy, beautiful landscapes and culture.')
ON CONFLICT (country_slug) 
DO UPDATE SET 
  overview = EXCLUDED.overview,
  why_immigrate = EXCLUDED.why_immigrate,
  updated_at = now();
