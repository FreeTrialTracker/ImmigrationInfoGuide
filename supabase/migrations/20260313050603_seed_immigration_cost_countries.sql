/*
  # Seed Immigration Cost Calculator Countries
  
  Populates all 52 destination countries organized by region.
  Also marks key passport source countries for the calculator selectors.
*/

-- Insert all 52 destination countries with passport source flags
INSERT INTO immigration_cost_countries (name, slug, region, iso2, iso3, is_destination, is_passport_source, display_order) VALUES
  -- Europe (24 countries)
  ('Austria', 'austria', 'Europe', 'AT', 'AUT', true, true, 10),
  ('Belgium', 'belgium', 'Europe', 'BE', 'BEL', true, true, 20),
  ('Croatia', 'croatia', 'Europe', 'HR', 'HRV', true, true, 30),
  ('Czech Republic', 'czech-republic', 'Europe', 'CZ', 'CZE', true, true, 40),
  ('Denmark', 'denmark', 'Europe', 'DK', 'DNK', true, true, 50),
  ('Finland', 'finland', 'Europe', 'FI', 'FIN', true, true, 60),
  ('France', 'france', 'Europe', 'FR', 'FRA', true, true, 70),
  ('Germany', 'germany', 'Europe', 'DE', 'DEU', true, true, 80),
  ('Greece', 'greece', 'Europe', 'GR', 'GRC', true, true, 90),
  ('Hungary', 'hungary', 'Europe', 'HU', 'HUN', true, true, 100),
  ('Ireland', 'ireland', 'Europe', 'IE', 'IRL', true, true, 110),
  ('Italy', 'italy', 'Europe', 'IT', 'ITA', true, true, 120),
  ('Netherlands', 'netherlands', 'Europe', 'NL', 'NLD', true, true, 130),
  ('Norway', 'norway', 'Europe', 'NO', 'NOR', true, true, 140),
  ('Poland', 'poland', 'Europe', 'PL', 'POL', true, true, 150),
  ('Portugal', 'portugal', 'Europe', 'PT', 'PRT', true, true, 160),
  ('Romania', 'romania', 'Europe', 'RO', 'ROU', true, true, 170),
  ('Russia', 'russia', 'Europe', 'RU', 'RUS', true, true, 180),
  ('Spain', 'spain', 'Europe', 'ES', 'ESP', true, true, 190),
  ('Sweden', 'sweden', 'Europe', 'SE', 'SWE', true, true, 200),
  ('Switzerland', 'switzerland', 'Europe', 'CH', 'CHE', true, true, 210),
  ('Ukraine', 'ukraine', 'Europe', 'UA', 'UKR', true, true, 220),
  ('United Kingdom', 'united-kingdom', 'Europe', 'GB', 'GBR', true, true, 230),
  
  -- Asia (10 countries)
  ('China', 'china', 'Asia', 'CN', 'CHN', true, true, 310),
  ('India', 'india', 'Asia', 'IN', 'IND', true, true, 320),
  ('Indonesia', 'indonesia', 'Asia', 'ID', 'IDN', true, true, 330),
  ('Japan', 'japan', 'Asia', 'JP', 'JPN', true, true, 340),
  ('Malaysia', 'malaysia', 'Asia', 'MY', 'MYS', true, true, 350),
  ('Philippines', 'philippines', 'Asia', 'PH', 'PHL', true, true, 360),
  ('Singapore', 'singapore', 'Asia', 'SG', 'SGP', true, true, 370),
  ('South Korea', 'south-korea', 'Asia', 'KR', 'KOR', true, true, 380),
  ('Thailand', 'thailand', 'Asia', 'TH', 'THA', true, true, 390),
  ('Vietnam', 'vietnam', 'Asia', 'VN', 'VNM', true, true, 400),
  
  -- North America (3 countries)
  ('Canada', 'canada', 'North America', 'CA', 'CAN', true, true, 510),
  ('Mexico', 'mexico', 'North America', 'MX', 'MEX', true, true, 520),
  ('United States', 'united-states', 'North America', 'US', 'USA', true, true, 530),
  
  -- South America (5 countries)
  ('Argentina', 'argentina', 'South America', 'AR', 'ARG', true, true, 610),
  ('Brazil', 'brazil', 'South America', 'BR', 'BRA', true, true, 620),
  ('Chile', 'chile', 'South America', 'CL', 'CHL', true, true, 630),
  ('Colombia', 'colombia', 'South America', 'CO', 'COL', true, true, 640),
  ('Peru', 'peru', 'South America', 'PE', 'PER', true, true, 650),
  
  -- Middle East (5 countries)
  ('Israel', 'israel', 'Middle East', 'IL', 'ISR', true, true, 710),
  ('Qatar', 'qatar', 'Middle East', 'QA', 'QAT', true, true, 720),
  ('Saudi Arabia', 'saudi-arabia', 'Middle East', 'SA', 'SAU', true, true, 730),
  ('Turkey', 'turkey', 'Middle East', 'TR', 'TUR', true, true, 740),
  ('United Arab Emirates', 'united-arab-emirates', 'Middle East', 'AE', 'ARE', true, true, 750),
  
  -- Africa (4 countries)
  ('Egypt', 'egypt', 'Africa', 'EG', 'EGY', true, true, 810),
  ('Morocco', 'morocco', 'Africa', 'MA', 'MAR', true, true, 820),
  ('Nigeria', 'nigeria', 'Africa', 'NG', 'NGA', true, true, 830),
  ('South Africa', 'south-africa', 'Africa', 'ZA', 'ZAF', true, true, 840),
  
  -- Oceania (2 countries)
  ('Australia', 'australia', 'Oceania', 'AU', 'AUS', true, true, 910),
  ('New Zealand', 'new-zealand', 'Oceania', 'NZ', 'NZL', true, true, 920)
ON CONFLICT (slug) DO NOTHING;