/*
  # Populate Country Guides Comparison Data - Part 1

  1. Countries Updated (A-J)
    - Major immigration destinations with complete comparison metrics
    - Scores based on international indices and immigration ease
    - Cost of living indexed to NYC = 100
*/

-- United States
UPDATE country_guides SET
  quality_of_life_score = 78,
  ease_of_immigration_score = 45,
  cost_of_living_index = 100,
  healthcare_quality = 'World-class healthcare system with advanced medical facilities, though expensive. Insurance typically required.',
  climate = 'Highly diverse: tropical (Hawaii/Florida), arctic (Alaska), desert (Southwest), temperate (Northeast/Northwest)',
  popular_cities = ARRAY['New York', 'Los Angeles', 'San Francisco', 'Chicago', 'Miami', 'Seattle', 'Austin', 'Boston']
WHERE country_slug = 'united-states';

-- Canada
UPDATE country_guides SET
  quality_of_life_score = 82,
  ease_of_immigration_score = 72,
  cost_of_living_index = 85,
  healthcare_quality = 'Universal public healthcare (Medicare). High-quality care, though wait times can be long for non-emergency procedures.',
  climate = 'Cold winters, mild summers. Varies from temperate coast (Vancouver) to arctic (Yukon). Four distinct seasons.',
  popular_cities = ARRAY['Toronto', 'Vancouver', 'Montreal', 'Calgary', 'Ottawa', 'Edmonton', 'Quebec City', 'Winnipeg']
WHERE country_slug = 'canada';

-- United Kingdom
UPDATE country_guides SET
  quality_of_life_score = 79,
  ease_of_immigration_score = 52,
  cost_of_living_index = 92,
  healthcare_quality = 'National Health Service (NHS) provides free healthcare. Good quality but increasing wait times for some services.',
  climate = 'Temperate maritime climate. Mild winters, cool summers. Frequent rain throughout the year.',
  popular_cities = ARRAY['London', 'Manchester', 'Edinburgh', 'Birmingham', 'Bristol', 'Glasgow', 'Liverpool', 'Leeds']
WHERE country_slug = 'united-kingdom';

-- Australia
UPDATE country_guides SET
  quality_of_life_score = 83,
  ease_of_immigration_score = 68,
  cost_of_living_index = 95,
  healthcare_quality = 'Medicare system provides universal healthcare. High-quality medical services. Mix of public and private options.',
  climate = 'Diverse: tropical north, temperate south. Generally warm and sunny. Mild winters in most major cities.',
  popular_cities = ARRAY['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Adelaide', 'Gold Coast', 'Canberra', 'Newcastle']
WHERE country_slug = 'australia';

-- Germany
UPDATE country_guides SET
  quality_of_life_score = 81,
  ease_of_immigration_score = 65,
  cost_of_living_index = 78,
  healthcare_quality = 'Excellent universal healthcare system. Mix of public and private insurance. High-quality medical care.',
  climate = 'Temperate seasonal climate. Warm summers, cold winters. More moderate in west, continental in east.',
  popular_cities = ARRAY['Berlin', 'Munich', 'Hamburg', 'Frankfurt', 'Cologne', 'Stuttgart', 'Düsseldorf', 'Leipzig']
WHERE country_slug = 'germany';

-- France
UPDATE country_guides SET
  quality_of_life_score = 80,
  ease_of_immigration_score = 58,
  cost_of_living_index = 88,
  healthcare_quality = 'Excellent public healthcare system. Ranked among world''s best. Universal coverage with high reimbursement rates.',
  climate = 'Varied: Mediterranean south, oceanic west, continental east. Generally temperate with regional variations.',
  popular_cities = ARRAY['Paris', 'Lyon', 'Marseille', 'Toulouse', 'Nice', 'Bordeaux', 'Strasbourg', 'Nantes']
WHERE country_slug = 'france';

-- Spain
UPDATE country_guides SET
  quality_of_life_score = 77,
  ease_of_immigration_score = 70,
  cost_of_living_index = 68,
  healthcare_quality = 'Excellent public healthcare system. Universal coverage. High-quality care at low cost.',
  climate = 'Mediterranean coast and south, continental interior, oceanic north. Generally warm and sunny.',
  popular_cities = ARRAY['Madrid', 'Barcelona', 'Valencia', 'Seville', 'Málaga', 'Bilbao', 'Alicante', 'Granada']
WHERE country_slug = 'spain';

-- Portugal
UPDATE country_guides SET
  quality_of_life_score = 76,
  ease_of_immigration_score = 75,
  cost_of_living_index = 62,
  healthcare_quality = 'Good public healthcare (SNS). Affordable private options. Quality improving steadily.',
  climate = 'Mediterranean climate. Warm, dry summers. Mild, wet winters. Consistent sunshine.',
  popular_cities = ARRAY['Lisbon', 'Porto', 'Algarve', 'Cascais', 'Braga', 'Coimbra', 'Funchal', 'Aveiro']
WHERE country_slug = 'portugal';

-- Italy
UPDATE country_guides SET
  quality_of_life_score = 75,
  ease_of_immigration_score = 62,
  cost_of_living_index = 76,
  healthcare_quality = 'Universal healthcare (SSN). Good quality care. Regional variations in service quality.',
  climate = 'Mediterranean climate. Hot summers, mild winters. More temperate in north, warmer in south.',
  popular_cities = ARRAY['Rome', 'Milan', 'Florence', 'Venice', 'Naples', 'Turin', 'Bologna', 'Palermo']
WHERE country_slug = 'italy';

-- Netherlands
UPDATE country_guides SET
  quality_of_life_score = 82,
  ease_of_immigration_score = 67,
  cost_of_living_index = 86,
  healthcare_quality = 'Excellent healthcare system. Mandatory insurance. High-quality care. Short wait times.',
  climate = 'Temperate maritime. Mild winters, cool summers. Frequent rain. Windy conditions.',
  popular_cities = ARRAY['Amsterdam', 'Rotterdam', 'The Hague', 'Utrecht', 'Eindhoven', 'Groningen', 'Maastricht', 'Delft']
WHERE country_slug = 'netherlands';

-- Ireland
UPDATE country_guides SET
  quality_of_life_score = 80,
  ease_of_immigration_score = 69,
  cost_of_living_index = 90,
  healthcare_quality = 'Mixed public-private system. Good quality care. Public system can have wait times.',
  climate = 'Temperate oceanic. Mild year-round. Frequent rain. Cool summers, mild winters.',
  popular_cities = ARRAY['Dublin', 'Cork', 'Galway', 'Limerick', 'Waterford', 'Kilkenny', 'Drogheda', 'Sligo']
WHERE country_slug = 'ireland';

-- Japan
UPDATE country_guides SET
  quality_of_life_score = 81,
  ease_of_immigration_score = 48,
  cost_of_living_index = 89,
  healthcare_quality = 'Excellent universal healthcare. Advanced medical technology. Affordable high-quality care.',
  climate = 'Four distinct seasons. Hot, humid summers. Cold winters in north. Mild in south.',
  popular_cities = ARRAY['Tokyo', 'Osaka', 'Kyoto', 'Yokohama', 'Sapporo', 'Fukuoka', 'Nagoya', 'Kobe']
WHERE country_slug = 'japan';
