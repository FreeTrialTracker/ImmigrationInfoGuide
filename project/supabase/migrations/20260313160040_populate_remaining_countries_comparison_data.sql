/*
  # Populate Remaining Countries Comparison Data

  1. Countries Updated
    - All remaining countries from the 52 country list
    - Complete comparison metrics for comprehensive coverage
*/

-- Latin America
UPDATE country_guides SET
  quality_of_life_score = 76,
  ease_of_immigration_score = 74,
  cost_of_living_index = 52,
  healthcare_quality = 'Good private healthcare. Excellent medical tourism. Affordable quality care.',
  climate = 'Varied. Mediterranean coast, alpine mountains, desert interior. Hot summers.',
  popular_cities = ARRAY['Buenos Aires', 'Córdoba', 'Rosario', 'Mendoza', 'Bariloche', 'Salta', 'Mar del Plata', 'Puerto Madryn']
WHERE country_slug = 'argentina' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 69,
  ease_of_immigration_score = 75,
  cost_of_living_index = 46,
  healthcare_quality = 'Universal healthcare system. Quality varies. Good private options in cities.',
  climate = 'Diverse. Tropical Amazon, temperate south, coastal. Hot and humid in most areas.',
  popular_cities = ARRAY['São Paulo', 'Rio de Janeiro', 'Brasília', 'Salvador', 'Fortaleza', 'Belo Horizonte', 'Curitiba', 'Florianópolis']
WHERE country_slug = 'brazil' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 72,
  ease_of_immigration_score = 77,
  cost_of_living_index = 50,
  healthcare_quality = 'Mixed healthcare system. Good private hospitals. Public system improving.',
  climate = 'Diverse. Desert north, Mediterranean center, alpine south, Patagonia. Four seasons.',
  popular_cities = ARRAY['Santiago', 'Valparaíso', 'Viña del Mar', 'Concepción', 'La Serena', 'Antofagasta', 'Puerto Varas', 'Pucón']
WHERE country_slug = 'chile' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 70,
  ease_of_immigration_score = 76,
  cost_of_living_index = 44,
  healthcare_quality = 'Improving healthcare system. Good private hospitals in cities. Affordable care.',
  climate = 'Tropical. Hot year-round. Varied by region from coastal to Andes to Amazon.',
  popular_cities = ARRAY['Bogotá', 'Medellín', 'Cali', 'Cartagena', 'Barranquilla', 'Santa Marta', 'Pereira', 'Manizales']
WHERE country_slug = 'colombia' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 67,
  ease_of_immigration_score = 58,
  cost_of_living_index = 38,
  healthcare_quality = 'Developing healthcare system. Quality varies. Good private hospitals in cities.',
  climate = 'Highly varied. Tropical, temperate, and cold zones due to altitude. Year-round spring in Quito.',
  popular_cities = ARRAY['Quito', 'Guayaquil', 'Cuenca', 'Manta', 'Loja', 'Ambato', 'Salinas', 'Montañita']
WHERE country_slug = 'ecuador' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 65,
  ease_of_immigration_score = 62,
  cost_of_living_index = 36,
  healthcare_quality = 'Improving healthcare. Quality varies greatly. Good private options in cities.',
  climate = 'Tropical and subtropical. Hot and humid. Varied from coast to Andes to Amazon.',
  popular_cities = ARRAY['Lima', 'Cusco', 'Arequipa', 'Trujillo', 'Miraflores', 'Huaraz', 'Iquitos', 'Paracas']
WHERE country_slug = 'peru' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 71,
  ease_of_immigration_score = 72,
  cost_of_living_index = 55,
  healthcare_quality = 'Modern healthcare system. High quality. Good expat-focused facilities.',
  climate = 'Tropical. Hot and humid year-round. Monsoon season June-November.',
  popular_cities = ARRAY['Panama City', 'Bocas del Toro', 'Boquete', 'Coronado', 'David', 'Pedasí', 'El Valle', 'Santa Catalina']
WHERE country_slug = 'panama' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 74,
  ease_of_immigration_score = 70,
  cost_of_living_index = 47,
  healthcare_quality = 'Good private healthcare. Growing medical tourism. Quality varies by region.',
  climate = 'Tropical coastal areas, temperate highlands. Pleasant year-round climate.',
  popular_cities = ARRAY['San José', 'Manuel Antonio', 'Tamarindo', 'Puerto Viejo', 'Jacó', 'Uvita', 'Nosara', 'Santa Teresa']
WHERE country_slug = 'costa-rica' AND quality_of_life_score IS NULL;

-- Eastern Europe
UPDATE country_guides SET
  quality_of_life_score = 74,
  ease_of_immigration_score = 59,
  cost_of_living_index = 60,
  healthcare_quality = 'Good healthcare system. Quality improving. Mix of public and private.',
  climate = 'Temperate continental. Hot summers, cold winters. Four distinct seasons.',
  popular_cities = ARRAY['Budapest', 'Debrecen', 'Szeged', 'Miskolc', 'Pécs', 'Győr', 'Eger', 'Sopron']
WHERE country_slug = 'hungary' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 73,
  ease_of_immigration_score = 65,
  cost_of_living_index = 53,
  healthcare_quality = 'Improving healthcare system. EU standards. Quality varies by region.',
  climate = 'Temperate. Warm summers, cold winters. Transitional between oceanic and continental.',
  popular_cities = ARRAY['Warsaw', 'Kraków', 'Wrocław', 'Poznań', 'Gdańsk', 'Szczecin', 'Zakopane', 'Toruń']
WHERE country_slug = 'poland' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 72,
  ease_of_immigration_score = 63,
  cost_of_living_index = 51,
  healthcare_quality = 'Good healthcare system. EU standards. Quality improving steadily.',
  climate = 'Temperate continental. Hot summers, cold winters. Four seasons.',
  popular_cities = ARRAY['Bucharest', 'Cluj-Napoca', 'Timișoara', 'Iași', 'Brașov', 'Constanța', 'Sibiu', 'Oradea']
WHERE country_slug = 'romania' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 70,
  ease_of_immigration_score = 62,
  cost_of_living_index = 49,
  healthcare_quality = 'Developing healthcare. Quality varies. Good private options in Sofia.',
  climate = 'Temperate continental. Hot summers, cold winters. Four seasons.',
  popular_cities = ARRAY['Sofia', 'Plovdiv', 'Varna', 'Burgas', 'Ruse', 'Veliko Tarnovo', 'Bansko', 'Sozopol']
WHERE country_slug = 'bulgaria' AND quality_of_life_score IS NULL;

-- Baltic and Small EU States
UPDATE country_guides SET
  quality_of_life_score = 74,
  ease_of_immigration_score = 66,
  cost_of_living_index = 57,
  healthcare_quality = 'Good healthcare system. Modern facilities. EU standards.',
  climate = 'Temperate. Warm summers, cold winters. Four seasons. Pleasant spring and fall.',
  popular_cities = ARRAY['Tallinn', 'Tartu', 'Pärnu', 'Narva', 'Kuressaare', 'Haapsalu', 'Viljandi', 'Rakvere']
WHERE country_slug = 'estonia' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 73,
  ease_of_immigration_score = 65,
  cost_of_living_index = 58,
  healthcare_quality = 'Good healthcare system. Modern facilities. EU standards.',
  climate = 'Temperate. Maritime influences. Mild summers, cold winters.',
  popular_cities = ARRAY['Riga', 'Jūrmala', 'Liepāja', 'Daugavpils', 'Ventspils', 'Sigulda', 'Cēsis', 'Kuldīga']
WHERE country_slug = 'latvia' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 72,
  ease_of_immigration_score = 64,
  cost_of_living_index = 56,
  healthcare_quality = 'Good healthcare system. EU standards. Quality care available.',
  climate = 'Temperate to continental. Cold winters, mild summers. Four seasons.',
  popular_cities = ARRAY['Vilnius', 'Kaunas', 'Klaipėda', 'Šiauliai', 'Panevėžys', 'Palanga', 'Nida', 'Trakai']
WHERE country_slug = 'lithuania' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 73,
  ease_of_immigration_score = 68,
  cost_of_living_index = 59,
  healthcare_quality = 'Good healthcare system. Modern facilities. EU standards.',
  climate = 'Mediterranean coast, continental interior. Hot summers, cold winters inland.',
  popular_cities = ARRAY['Ljubljana', 'Maribor', 'Koper', 'Celje', 'Kranj', 'Bled', 'Piran', 'Portorož']
WHERE country_slug = 'slovenia' AND quality_of_life_score IS NULL;

-- Mediterranean
UPDATE country_guides SET
  quality_of_life_score = 76,
  ease_of_immigration_score = 69,
  cost_of_living_index = 71,
  healthcare_quality = 'Good healthcare system. Quality care. Mix of public and private.',
  climate = 'Mediterranean. Hot, dry summers. Mild winters. Very sunny.',
  popular_cities = ARRAY['Nicosia', 'Limassol', 'Larnaca', 'Paphos', 'Famagusta', 'Kyrenia', 'Protaras', 'Ayia Napa']
WHERE country_slug = 'cyprus' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 75,
  ease_of_immigration_score = 67,
  cost_of_living_index = 64,
  healthcare_quality = 'Good healthcare system. Modern facilities. Quality care available.',
  climate = 'Mediterranean. Hot, dry summers. Mild, wet winters. Islands cooler.',
  popular_cities = ARRAY['Athens', 'Thessaloniki', 'Crete', 'Rhodes', 'Santorini', 'Mykonos', 'Patras', 'Corfu']
WHERE country_slug = 'greece' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 74,
  ease_of_immigration_score = 67,
  cost_of_living_index = 63,
  healthcare_quality = 'Good healthcare system. Modern facilities. High quality.',
  climate = 'Mediterranean islands. Hot, dry summers. Mild winters. Very sunny.',
  popular_cities = ARRAY['Valletta', 'Sliema', 'St. Julian''s', 'Gozo', 'Mdina', 'Marsaxlokk', 'Mellieħa', 'Birgu']
WHERE country_slug = 'malta' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 75,
  ease_of_immigration_score = 63,
  cost_of_living_index = 67,
  healthcare_quality = 'Excellent healthcare system. Modern facilities. High quality.',
  climate = 'Temperate. Warm summers, cold winters. Distinct seasons.',
  popular_cities = ARRAY['Luxembourg City', 'Esch-sur-Alzette', 'Differdange', 'Dudelange', 'Ettelbruck', 'Diekirch', 'Wiltz']
WHERE country_slug = 'luxembourg' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 79,
  ease_of_immigration_score = 54,
  cost_of_living_index = 94,
  healthcare_quality = 'Excellent healthcare system. Modern facilities. High-quality care.',
  climate = 'Cold temperate. Mild summers, cold winters. Significant rainfall.',
  popular_cities = ARRAY['Reykjavik', 'Akureyri', 'Reykjanesbær', 'Kópavogur', 'Hafnarfjörður', 'Selfoss', 'Ísafjörður']
WHERE country_slug = 'iceland' AND quality_of_life_score IS NULL;

-- Middle East and North Africa
UPDATE country_guides SET
  quality_of_life_score = 77,
  ease_of_immigration_score = 60,
  cost_of_living_index = 65,
  healthcare_quality = 'Excellent healthcare system. Advanced technology. Mix of public and private.',
  climate = 'Mediterranean coast, temperate Tel Aviv region, arid south. Hot, dry summers.',
  popular_cities = ARRAY['Tel Aviv', 'Jerusalem', 'Haifa', 'Eilat', 'Herzliya', 'Netanya', 'Beer Sheva', 'Rishon LeZion']
WHERE country_slug = 'israel' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 71,
  ease_of_immigration_score = 64,
  cost_of_living_index = 56,
  healthcare_quality = 'Developing healthcare. Growing medical tourism. Quality improving in cities.',
  climate = 'Temperate Black Sea coast, continental interior, varied by region.',
  popular_cities = ARRAY['Istanbul', 'Ankara', 'Izmir', 'Antalya', 'Bodrum', 'Bursa', 'Fethiye', 'Cappadocia']
WHERE country_slug = 'turkey' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 68,
  ease_of_immigration_score = 59,
  cost_of_living_index = 39,
  healthcare_quality = 'Improving healthcare. Quality varies. Better in major cities and resorts.',
  climate = 'Mediterranean coast, desert interior. Hot summers, mild winters. Arid inland.',
  popular_cities = ARRAY['Cairo', 'Alexandria', 'Giza', 'Sharm El Sheikh', 'Hurghada', 'Luxor', 'Aswan', 'Dahab']
WHERE country_slug = 'egypt' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 67,
  ease_of_immigration_score = 62,
  cost_of_living_index = 47,
  healthcare_quality = 'Good private healthcare. Quality improving. Medical tourism emerging.',
  climate = 'Mediterranean coast, desert interior. Hot summers, mild winters. Arid inland.',
  popular_cities = ARRAY['Casablanca', 'Marrakech', 'Rabat', 'Fes', 'Tangier', 'Agadir', 'Essaouira', 'Chefchaouen']
WHERE country_slug = 'morocco' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 69,
  ease_of_immigration_score = 62,
  cost_of_living_index = 47,
  healthcare_quality = 'Good healthcare system. Modern facilities. Quality improving.',
  climate = 'Mediterranean coast, desert south. Hot summers, mild winters. Arid interior.',
  popular_cities = ARRAY['Tunis', 'Sousse', 'Sfax', 'Hammamet', 'Djerba', 'Monastir', 'Bizerte', 'Nabeul']
WHERE country_slug = 'tunisia' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 66,
  ease_of_immigration_score = 55,
  cost_of_living_index = 45,
  healthcare_quality = 'Developing healthcare. Quality varies. Better in Amman and Aqaba.',
  climate = 'Arid desert. Hot, dry summers. Cool winters. Limited rainfall.',
  popular_cities = ARRAY['Amman', 'Petra', 'Aqaba', 'Wadi Rum', 'Jerash', 'Dead Sea', 'Irbid', 'Madaba']
WHERE country_slug = 'jordan' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 68,
  ease_of_immigration_score = 59,
  cost_of_living_index = 53,
  healthcare_quality = 'Good private healthcare. Quality facilities. Medical tourism destination.',
  climate = 'Mediterranean coast, continental interior. Hot summers, cold winters inland.',
  popular_cities = ARRAY['Beirut', 'Byblos', 'Batroun', 'Tripoli', 'Sidon', 'Tyre', 'Zahle', 'Jounieh']
WHERE country_slug = 'lebanon' AND quality_of_life_score IS NULL;

-- Rest of Middle East
UPDATE country_guides SET
  quality_of_life_score = 70,
  ease_of_immigration_score = 61,
  cost_of_living_index = 61,
  healthcare_quality = 'Good healthcare system. Modern facilities in Muscat. Quality care.',
  climate = 'Desert climate. Extremely hot summers. Mild winters. Arid.',
  popular_cities = ARRAY['Muscat', 'Salalah', 'Nizwa', 'Sur', 'Sohar', 'Khasab', 'Wahiba Sands', 'Jebel Akhdar']
WHERE country_slug = 'oman' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 72,
  ease_of_immigration_score = 63,
  cost_of_living_index = 69,
  healthcare_quality = 'Excellent healthcare. Modern facilities. High quality care.',
  climate = 'Desert climate. Extremely hot summers. Mild winters. Very low rainfall.',
  popular_cities = ARRAY['Doha', 'Al Wakrah', 'Al Khor', 'Lusail', 'The Pearl', 'West Bay', 'Katara', 'Souq Waqif']
WHERE country_slug = 'qatar' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 73,
  ease_of_immigration_score = 64,
  cost_of_living_index = 73,
  healthcare_quality = 'Excellent healthcare. Modern facilities. High standards.',
  climate = 'Desert climate. Extremely hot summers. Mild winters. Coastal humidity.',
  popular_cities = ARRAY['Manama', 'Riffa', 'Muharraq', 'Hamad Town', 'Isa Town', 'Sitra', 'Budaiya', 'Juffair']
WHERE country_slug = 'bahrain' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 74,
  ease_of_immigration_score = 65,
  cost_of_living_index = 78,
  healthcare_quality = 'Excellent healthcare. Modern facilities. High quality care.',
  climate = 'Desert climate. Extremely hot summers. Mild winters. Very low rainfall.',
  popular_cities = ARRAY['Kuwait City', 'Hawalli', 'Salmiya', 'Sabah Al Salem', 'Jahra', 'Ahmadi', 'Fintas', 'Mangaf']
WHERE country_slug = 'kuwait' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 75,
  ease_of_immigration_score = 66,
  cost_of_living_index = 81,
  healthcare_quality = 'Excellent healthcare. World-class facilities. High standards.',
  climate = 'Desert climate. Extremely hot summers. Mild winters. Very low rainfall.',
  popular_cities = ARRAY['Riyadh', 'Jeddah', 'Dammam', 'Khobar', 'Mecca', 'Medina', 'Taif', 'Abha']
WHERE country_slug = 'saudi-arabia' AND quality_of_life_score IS NULL;

-- Asia
UPDATE country_guides SET
  quality_of_life_score = 64,
  ease_of_immigration_score = 56,
  cost_of_living_index = 34,
  healthcare_quality = 'Developing healthcare. Quality varies. Better facilities in major cities.',
  climate = 'Tropical and temperate. Varied from Himalayan cold to tropical heat. Monsoon season.',
  popular_cities = ARRAY['Ho Chi Minh City', 'Hanoi', 'Da Nang', 'Hoi An', 'Nha Trang', 'Hue', 'Dalat', 'Phu Quoc']
WHERE country_slug = 'vietnam' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 67,
  ease_of_immigration_score = 61,
  cost_of_living_index = 40,
  healthcare_quality = 'Improving healthcare. Quality varies widely. Good private hospitals in major cities.',
  climate = 'Tropical and temperate. Varied from Himalayan cold to tropical heat. Monsoon season.',
  popular_cities = ARRAY['Mumbai', 'Delhi', 'Bangalore', 'Goa', 'Pune', 'Hyderabad', 'Chennai', 'Kochi']
WHERE country_slug = 'india' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 68,
  ease_of_immigration_score = 57,
  cost_of_living_index = 41,
  healthcare_quality = 'Excellent healthcare system. Advanced technology. Mix of public and private.',
  climate = 'Varied. Extreme continental. Very cold winters (-40°C), hot summers. Arid and semi-arid.',
  popular_cities = ARRAY['Moscow', 'St. Petersburg', 'Novosibirsk', 'Yekaterinburg', 'Kazan', 'Sochi', 'Vladivostok', 'Irkutsk']
WHERE country_slug = 'russia' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 70,
  ease_of_immigration_score = 53,
  cost_of_living_index = 70,
  healthcare_quality = 'Rapidly developing healthcare. Modern facilities in cities. Quality improving.',
  climate = 'Varied. Tropical south, temperate east, desert west, cold north. Monsoon season.',
  popular_cities = ARRAY['Beijing', 'Shanghai', 'Shenzhen', 'Guangzhou', 'Chengdu', 'Hangzhou', 'Xi''an', 'Suzhou']
WHERE country_slug = 'china' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 63,
  ease_of_immigration_score = 54,
  cost_of_living_index = 34,
  healthcare_quality = 'Developing healthcare. Quality varies. Better facilities in major cities.',
  climate = 'Tropical. Hot year-round. Wet and dry seasons. High humidity.',
  popular_cities = ARRAY['Jakarta', 'Bali', 'Yogyakarta', 'Bandung', 'Surabaya', 'Lombok', 'Ubud', 'Canggu']
WHERE country_slug = 'indonesia' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 65,
  ease_of_immigration_score = 60,
  cost_of_living_index = 37,
  healthcare_quality = 'Improving healthcare. Good private hospitals. Quality varies by region.',
  climate = 'Tropical. Hot and humid year-round. Monsoon seasons. Consistent temperatures.',
  popular_cities = ARRAY['Manila', 'Cebu', 'Davao', 'Boracay', 'Makati', 'Taguig', 'El Nido', 'Palawan']
WHERE country_slug = 'philippines' AND quality_of_life_score IS NULL;

-- Caucasus and Central Asia
UPDATE country_guides SET
  quality_of_life_score = 70,
  ease_of_immigration_score = 58,
  cost_of_living_index = 52,
  healthcare_quality = 'Developing healthcare system. Quality varies. Private care improving.',
  climate = 'Varied. Coastal subtropical, interior continental. Hot summers, cold winters.',
  popular_cities = ARRAY['Baku', 'Ganja', 'Sumqayit', 'Mingachevir', 'Lankaran', 'Sheki', 'Quba', 'Gabala']
WHERE country_slug = 'azerbaijan' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 71,
  ease_of_immigration_score = 60,
  cost_of_living_index = 50,
  healthcare_quality = 'Developing healthcare system. Quality improving. Private sector growing.',
  climate = 'Varied. Subtropical coast, Alpine mountains, continental east. Mild overall.',
  popular_cities = ARRAY['Tbilisi', 'Batumi', 'Kutaisi', 'Rustavi', 'Gori', 'Zugdidi', 'Mestia', 'Kazbegi']
WHERE country_slug = 'georgia' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 69,
  ease_of_immigration_score = 57,
  cost_of_living_index = 48,
  healthcare_quality = 'Developing healthcare system. Quality varies. Good private hospitals in Yerevan.',
  climate = 'Continental. Cold winters, hot summers. Highland climate. Dry overall.',
  popular_cities = ARRAY['Yerevan', 'Gyumri', 'Vanadzor', 'Vagharshapat', 'Dilijan', 'Jermuk', 'Sevan', 'Goris']
WHERE country_slug = 'armenia' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 68,
  ease_of_immigration_score = 55,
  cost_of_living_index = 43,
  healthcare_quality = 'Developing healthcare. Quality varies significantly. Better in major cities.',
  climate = 'Continental. Very hot summers, cold winters. Arid and semi-arid.',
  popular_cities = ARRAY['Almaty', 'Nur-Sultan', 'Shymkent', 'Aktobe', 'Karaganda', 'Taraz', 'Pavlodar', 'Semey']
WHERE country_slug = 'kazakhstan' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 66,
  ease_of_immigration_score = 53,
  cost_of_living_index = 41,
  healthcare_quality = 'Developing healthcare system. Quality limited. Private care emerging.',
  climate = 'Continental. Hot summers, cold winters. Arid with limited rainfall.',
  popular_cities = ARRAY['Tashkent', 'Samarkand', 'Bukhara', 'Khiva', 'Fergana', 'Nukus', 'Termez', 'Kokand']
WHERE country_slug = 'uzbekistan' AND quality_of_life_score IS NULL;

-- Africa
UPDATE country_guides SET
  quality_of_life_score = 64,
  ease_of_immigration_score = 51,
  cost_of_living_index = 33,
  healthcare_quality = 'Developing healthcare. Quality varies. Good private care in Lagos and Abuja.',
  climate = 'Tropical. Hot year-round. Wet and dry seasons. High humidity.',
  popular_cities = ARRAY['Lagos', 'Abuja', 'Port Harcourt', 'Kano', 'Ibadan', 'Calabar', 'Enugu', 'Jos']
WHERE country_slug = 'nigeria' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 62,
  ease_of_immigration_score = 50,
  cost_of_living_index = 32,
  healthcare_quality = 'Mixed quality. Good private care in Nairobi. Public system limited.',
  climate = 'Varied. Tropical coast, temperate highlands, arid north. Two rainy seasons.',
  popular_cities = ARRAY['Nairobi', 'Mombasa', 'Kisumu', 'Nakuru', 'Eldoret', 'Malindi', 'Lamu', 'Nanyuki']
WHERE country_slug = 'kenya' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 71,
  ease_of_immigration_score = 48,
  cost_of_living_index = 66,
  healthcare_quality = 'Excellent private healthcare. World-class facilities. Public system strained.',
  climate = 'Varied. Mediterranean coast, desert interior. Hot, dry summers. Mild winters.',
  popular_cities = ARRAY['Cape Town', 'Johannesburg', 'Durban', 'Pretoria', 'Stellenbosch', 'Port Elizabeth', 'Knysna', 'Hermanus']
WHERE country_slug = 'south-africa' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 66,
  ease_of_immigration_score = 56,
  cost_of_living_index = 31,
  healthcare_quality = 'Developing healthcare. Quality improving. Good private care available.',
  climate = 'Tropical savanna. Hot year-round. Wet and dry seasons.',
  popular_cities = ARRAY['Accra', 'Kumasi', 'Takoradi', 'Tamale', 'Cape Coast', 'Tema', 'Koforidua', 'Elmina']
WHERE country_slug = 'ghana' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 60,
  ease_of_immigration_score = 52,
  cost_of_living_index = 29,
  healthcare_quality = 'Limited healthcare. Quality varies. Better facilities in capital.',
  climate = 'Tropical. Hot and humid. Heavy rainfall. Consistent temperatures.',
  popular_cities = ARRAY['Kampala', 'Entebbe', 'Jinja', 'Mbarara', 'Gulu', 'Fort Portal', 'Kabale', 'Masaka']
WHERE country_slug = 'uganda' AND quality_of_life_score IS NULL;

UPDATE country_guides SET
  quality_of_life_score = 61,
  ease_of_immigration_score = 53,
  cost_of_living_index = 30,
  healthcare_quality = 'Limited healthcare. Developing infrastructure. Better in Dar es Salaam and Arusha.',
  climate = 'Tropical. Hot and humid coast, temperate highlands. Dry and wet seasons.',
  popular_cities = ARRAY['Dar es Salaam', 'Arusha', 'Zanzibar', 'Moshi', 'Mwanza', 'Dodoma', 'Stone Town', 'Nungwi']
WHERE country_slug = 'tanzania' AND quality_of_life_score IS NULL;

-- Ukraine (if not already populated)
UPDATE country_guides SET
  quality_of_life_score = 65,
  ease_of_immigration_score = 58,
  cost_of_living_index = 35,
  healthcare_quality = 'Developing healthcare. Quality varies. Private sector growing in major cities.',
  climate = 'Temperate continental. Cold winters, warm summers. Four distinct seasons.',
  popular_cities = ARRAY['Kyiv', 'Lviv', 'Odesa', 'Dnipro', 'Kharkiv', 'Ivano-Frankivsk', 'Chernivtsi', 'Uzhhorod']
WHERE country_slug = 'ukraine' AND quality_of_life_score IS NULL;
