/*
  # Populate Country Guides Comparison Data - Part 2

  1. Countries Updated (M-Z)
    - Additional major destinations
    - Complete comparison metrics
*/

-- Switzerland
UPDATE country_guides SET
  quality_of_life_score = 86,
  ease_of_immigration_score = 42,
  cost_of_living_index = 122,
  healthcare_quality = 'World-class healthcare. Mandatory insurance. Excellent facilities. Very high quality.',
  climate = 'Alpine climate. Cold winters, mild summers. Varies with altitude. Four distinct seasons.',
  popular_cities = ARRAY['Zurich', 'Geneva', 'Basel', 'Bern', 'Lausanne', 'Lucerne', 'Lugano', 'St. Gallen']
WHERE country_slug = 'switzerland';

-- Singapore
UPDATE country_guides SET
  quality_of_life_score = 84,
  ease_of_immigration_score = 55,
  cost_of_living_index = 105,
  healthcare_quality = 'World-class healthcare system. Highly efficient. Mix of public and private. Excellent facilities.',
  climate = 'Tropical. Hot and humid year-round. Frequent afternoon showers. No seasons.',
  popular_cities = ARRAY['Singapore City', 'Marina Bay', 'Sentosa', 'Jurong', 'Tampines', 'Woodlands', 'Punggol']
WHERE country_slug = 'singapore';

-- South Korea
UPDATE country_guides SET
  quality_of_life_score = 78,
  ease_of_immigration_score = 52,
  cost_of_living_index = 82,
  healthcare_quality = 'Excellent universal healthcare. Advanced medical facilities. Affordable high-quality care.',
  climate = 'Four distinct seasons. Hot, humid summers. Cold, dry winters. Beautiful spring and fall.',
  popular_cities = ARRAY['Seoul', 'Busan', 'Incheon', 'Daegu', 'Daejeon', 'Gwangju', 'Ulsan', 'Jeju']
WHERE country_slug = 'south-korea';

-- New Zealand
UPDATE country_guides SET
  quality_of_life_score = 83,
  ease_of_immigration_score = 71,
  cost_of_living_index = 84,
  healthcare_quality = 'Good public healthcare system. Universal coverage. Quality care with some wait times.',
  climate = 'Temperate maritime. Mild year-round. Regional variations. More rain in west.',
  popular_cities = ARRAY['Auckland', 'Wellington', 'Christchurch', 'Hamilton', 'Tauranga', 'Dunedin', 'Palmerston North', 'Queenstown']
WHERE country_slug = 'new-zealand';

-- Mexico
UPDATE country_guides SET
  quality_of_life_score = 68,
  ease_of_immigration_score = 78,
  cost_of_living_index = 48,
  healthcare_quality = 'Mixed quality. Excellent private hospitals in major cities. Public system varies. Affordable care.',
  climate = 'Diverse: tropical coasts, temperate highlands, desert north. Generally warm year-round.',
  popular_cities = ARRAY['Mexico City', 'Guadalajara', 'Monterrey', 'Cancún', 'Playa del Carmen', 'Puerto Vallarta', 'San Miguel de Allende', 'Mérida']
WHERE country_slug = 'mexico';

-- Thailand
UPDATE country_guides SET
  quality_of_life_score = 72,
  ease_of_immigration_score = 76,
  cost_of_living_index = 45,
  healthcare_quality = 'Excellent medical tourism destination. Quality private hospitals. Affordable care. Public system basic.',
  climate = 'Tropical. Hot year-round. Rainy season May-October. Cool season November-February.',
  popular_cities = ARRAY['Bangkok', 'Chiang Mai', 'Phuket', 'Pattaya', 'Hua Hin', 'Krabi', 'Koh Samui', 'Chiang Rai']
WHERE country_slug = 'thailand';

-- Malaysia
UPDATE country_guides SET
  quality_of_life_score = 74,
  ease_of_immigration_score = 73,
  cost_of_living_index = 42,
  healthcare_quality = 'Good private healthcare. Medical tourism hub. Affordable quality care. Public system adequate.',
  climate = 'Tropical. Hot and humid year-round. Monsoon seasons. Consistent temperatures.',
  popular_cities = ARRAY['Kuala Lumpur', 'Penang', 'Johor Bahru', 'Malacca', 'Ipoh', 'Kota Kinabalu', 'Langkawi', 'Petaling Jaya']
WHERE country_slug = 'malaysia';

-- United Arab Emirates
UPDATE country_guides SET
  quality_of_life_score = 76,
  ease_of_immigration_score = 68,
  cost_of_living_index = 75,
  healthcare_quality = 'Modern healthcare facilities. High-quality private care. Mandatory insurance. Advanced technology.',
  climate = 'Desert climate. Extremely hot summers (40-50°C). Pleasant winters. Minimal rainfall.',
  popular_cities = ARRAY['Dubai', 'Abu Dhabi', 'Sharjah', 'Ajman', 'Ras Al Khaimah', 'Fujairah', 'Al Ain', 'Umm Al Quwain']
WHERE country_slug = 'uae';

-- Nordic Countries
UPDATE country_guides SET
  quality_of_life_score = 79,
  ease_of_immigration_score = 64,
  cost_of_living_index = 83,
  healthcare_quality = 'Excellent healthcare system. Universal coverage. High-quality care.',
  climate = 'Temperate oceanic. Cold winters, warm summers. Distinct seasons.',
  popular_cities = ARRAY['Stockholm', 'Gothenburg', 'Malmö', 'Uppsala', 'Västerås', 'Örebro', 'Linköping', 'Helsingborg']
WHERE country_slug = 'sweden';

UPDATE country_guides SET
  quality_of_life_score = 81,
  ease_of_immigration_score = 66,
  cost_of_living_index = 87,
  healthcare_quality = 'Excellent universal healthcare. High-quality services. Short wait times.',
  climate = 'Temperate. Cool winters, mild summers. Frequent wind and rain.',
  popular_cities = ARRAY['Copenhagen', 'Aarhus', 'Odense', 'Aalborg', 'Esbjerg', 'Randers', 'Kolding', 'Horsens']
WHERE country_slug = 'denmark';

UPDATE country_guides SET
  quality_of_life_score = 83,
  ease_of_immigration_score = 67,
  cost_of_living_index = 91,
  healthcare_quality = 'Excellent universal healthcare. High-quality medical services. Well-funded system.',
  climate = 'Temperate. Cold winters, mild summers. Long, dark winters in north.',
  popular_cities = ARRAY['Oslo', 'Bergen', 'Trondheim', 'Stavanger', 'Drammen', 'Fredrikstad', 'Kristiansand', 'Tromsø']
WHERE country_slug = 'norway';

UPDATE country_guides SET
  quality_of_life_score = 82,
  ease_of_immigration_score = 70,
  cost_of_living_index = 88,
  healthcare_quality = 'Excellent healthcare system. Universal coverage. High quality of care.',
  climate = 'Subarctic and continental. Very cold winters, warm summers. Long summer days.',
  popular_cities = ARRAY['Helsinki', 'Espoo', 'Tampere', 'Vantaa', 'Oulu', 'Turku', 'Jyväskylä', 'Lahti']
WHERE country_slug = 'finland';

-- Central Europe
UPDATE country_guides SET
  quality_of_life_score = 80,
  ease_of_immigration_score = 63,
  cost_of_living_index = 79,
  healthcare_quality = 'Excellent healthcare system. Efficient and modern. Universal coverage.',
  climate = 'Temperate. Warm summers, cold winters. Alpine regions colder.',
  popular_cities = ARRAY['Vienna', 'Graz', 'Linz', 'Salzburg', 'Innsbruck', 'Klagenfurt', 'Villach', 'Wels']
WHERE country_slug = 'austria';

UPDATE country_guides SET
  quality_of_life_score = 78,
  ease_of_immigration_score = 61,
  cost_of_living_index = 72,
  healthcare_quality = 'Good universal healthcare. Quality improving. Regional variations.',
  climate = 'Temperate. Warm summers, cold winters. Coastal areas milder.',
  popular_cities = ARRAY['Brussels', 'Antwerp', 'Ghent', 'Charleroi', 'Liège', 'Bruges', 'Namur', 'Leuven']
WHERE country_slug = 'belgium';

UPDATE country_guides SET
  quality_of_life_score = 73,
  ease_of_immigration_score = 68,
  cost_of_living_index = 58,
  healthcare_quality = 'Good healthcare system. Universal coverage. Quality varies by region.',
  climate = 'Temperate continental. Warm summers, cold winters. Four seasons.',
  popular_cities = ARRAY['Prague', 'Brno', 'Ostrava', 'Plzeň', 'Liberec', 'Olomouc', 'České Budějovice', 'Hradec Králové']
WHERE country_slug = 'czech-republic';

UPDATE country_guides SET
  quality_of_life_score = 75,
  ease_of_immigration_score = 66,
  cost_of_living_index = 54,
  healthcare_quality = 'Good healthcare system. Modern facilities in cities. Affordable care.',
  climate = 'Mediterranean coast, continental interior. Hot summers, cold winters inland.',
  popular_cities = ARRAY['Zagreb', 'Split', 'Rijeka', 'Osijek', 'Zadar', 'Pula', 'Dubrovnik', 'Slavonski Brod']
WHERE country_slug = 'croatia';
