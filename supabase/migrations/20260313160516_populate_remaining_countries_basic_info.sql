/*
  # Populate Remaining Countries Basic Info

  1. Updates
    - Add official_language, currency, capital_city for all remaining countries
*/

-- Update all remaining countries with basic info
UPDATE countries SET official_language = 'Swedish', currency = 'SEK', capital_city = 'Stockholm' WHERE slug = 'sweden' AND official_language IS NULL;
UPDATE countries SET official_language = 'Danish', currency = 'DKK', capital_city = 'Copenhagen' WHERE slug = 'denmark' AND official_language IS NULL;
UPDATE countries SET official_language = 'Norwegian', currency = 'NOK', capital_city = 'Oslo' WHERE slug = 'norway' AND official_language IS NULL;
UPDATE countries SET official_language = 'Finnish', currency = 'EUR', capital_city = 'Helsinki' WHERE slug = 'finland' AND official_language IS NULL;
UPDATE countries SET official_language = 'German', currency = 'EUR', capital_city = 'Vienna' WHERE slug = 'austria' AND official_language IS NULL;
UPDATE countries SET official_language = 'Dutch, French, German', currency = 'EUR', capital_city = 'Brussels' WHERE slug = 'belgium' AND official_language IS NULL;
UPDATE countries SET official_language = 'Czech', currency = 'CZK', capital_city = 'Prague' WHERE slug = 'czech-republic' AND official_language IS NULL;
UPDATE countries SET official_language = 'Croatian', currency = 'EUR', capital_city = 'Zagreb' WHERE slug = 'croatia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Spanish', currency = 'ARS', capital_city = 'Buenos Aires' WHERE slug = 'argentina' AND official_language IS NULL;
UPDATE countries SET official_language = 'Portuguese', currency = 'BRL', capital_city = 'Brasília' WHERE slug = 'brazil' AND official_language IS NULL;
UPDATE countries SET official_language = 'Spanish', currency = 'CLP', capital_city = 'Santiago' WHERE slug = 'chile' AND official_language IS NULL;
UPDATE countries SET official_language = 'Spanish', currency = 'COP', capital_city = 'Bogotá' WHERE slug = 'colombia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Spanish', currency = 'USD', capital_city = 'Quito' WHERE slug = 'ecuador' AND official_language IS NULL;
UPDATE countries SET official_language = 'Spanish', currency = 'PEN', capital_city = 'Lima' WHERE slug = 'peru' AND official_language IS NULL;
UPDATE countries SET official_language = 'Spanish', currency = 'PAB', capital_city = 'Panama City' WHERE slug = 'panama' AND official_language IS NULL;
UPDATE countries SET official_language = 'Spanish', currency = 'CRC', capital_city = 'San José' WHERE slug = 'costa-rica' AND official_language IS NULL;
UPDATE countries SET official_language = 'Hungarian', currency = 'HUF', capital_city = 'Budapest' WHERE slug = 'hungary' AND official_language IS NULL;
UPDATE countries SET official_language = 'Polish', currency = 'PLN', capital_city = 'Warsaw' WHERE slug = 'poland' AND official_language IS NULL;
UPDATE countries SET official_language = 'Romanian', currency = 'RON', capital_city = 'Bucharest' WHERE slug = 'romania' AND official_language IS NULL;
UPDATE countries SET official_language = 'Bulgarian', currency = 'BGN', capital_city = 'Sofia' WHERE slug = 'bulgaria' AND official_language IS NULL;
UPDATE countries SET official_language = 'Estonian', currency = 'EUR', capital_city = 'Tallinn' WHERE slug = 'estonia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Latvian', currency = 'EUR', capital_city = 'Riga' WHERE slug = 'latvia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Lithuanian', currency = 'EUR', capital_city = 'Vilnius' WHERE slug = 'lithuania' AND official_language IS NULL;
UPDATE countries SET official_language = 'Slovenian', currency = 'EUR', capital_city = 'Ljubljana' WHERE slug = 'slovenia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Greek, Turkish', currency = 'EUR', capital_city = 'Nicosia' WHERE slug = 'cyprus' AND official_language IS NULL;
UPDATE countries SET official_language = 'Greek', currency = 'EUR', capital_city = 'Athens' WHERE slug = 'greece' AND official_language IS NULL;
UPDATE countries SET official_language = 'Maltese, English', currency = 'EUR', capital_city = 'Valletta' WHERE slug = 'malta' AND official_language IS NULL;
UPDATE countries SET official_language = 'Luxembourgish, French, German', currency = 'EUR', capital_city = 'Luxembourg City' WHERE slug = 'luxembourg' AND official_language IS NULL;
UPDATE countries SET official_language = 'Icelandic', currency = 'ISK', capital_city = 'Reykjavik' WHERE slug = 'iceland' AND official_language IS NULL;
UPDATE countries SET official_language = 'Hebrew, Arabic', currency = 'ILS', capital_city = 'Jerusalem' WHERE slug = 'israel' AND official_language IS NULL;
UPDATE countries SET official_language = 'Turkish', currency = 'TRY', capital_city = 'Ankara' WHERE slug = 'turkey' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'EGP', capital_city = 'Cairo' WHERE slug = 'egypt' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'MAD', capital_city = 'Rabat' WHERE slug = 'morocco' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'TND', capital_city = 'Tunis' WHERE slug = 'tunisia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'JOD', capital_city = 'Amman' WHERE slug = 'jordan' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'LBP', capital_city = 'Beirut' WHERE slug = 'lebanon' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'OMR', capital_city = 'Muscat' WHERE slug = 'oman' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'QAR', capital_city = 'Doha' WHERE slug = 'qatar' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'BHD', capital_city = 'Manama' WHERE slug = 'bahrain' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'KWD', capital_city = 'Kuwait City' WHERE slug = 'kuwait' AND official_language IS NULL;
UPDATE countries SET official_language = 'Arabic', currency = 'SAR', capital_city = 'Riyadh' WHERE slug = 'saudi-arabia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Vietnamese', currency = 'VND', capital_city = 'Hanoi' WHERE slug = 'vietnam' AND official_language IS NULL;
UPDATE countries SET official_language = 'Hindi, English', currency = 'INR', capital_city = 'New Delhi' WHERE slug = 'india' AND official_language IS NULL;
UPDATE countries SET official_language = 'Russian', currency = 'RUB', capital_city = 'Moscow' WHERE slug = 'russia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Mandarin Chinese', currency = 'CNY', capital_city = 'Beijing' WHERE slug = 'china' AND official_language IS NULL;
UPDATE countries SET official_language = 'Indonesian', currency = 'IDR', capital_city = 'Jakarta' WHERE slug = 'indonesia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Filipino, English', currency = 'PHP', capital_city = 'Manila' WHERE slug = 'philippines' AND official_language IS NULL;
UPDATE countries SET official_language = 'Azerbaijani', currency = 'AZN', capital_city = 'Baku' WHERE slug = 'azerbaijan' AND official_language IS NULL;
UPDATE countries SET official_language = 'Georgian', currency = 'GEL', capital_city = 'Tbilisi' WHERE slug = 'georgia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Armenian', currency = 'AMD', capital_city = 'Yerevan' WHERE slug = 'armenia' AND official_language IS NULL;
UPDATE countries SET official_language = 'Kazakh, Russian', currency = 'KZT', capital_city = 'Astana' WHERE slug = 'kazakhstan' AND official_language IS NULL;
UPDATE countries SET official_language = 'Uzbek', currency = 'UZS', capital_city = 'Tashkent' WHERE slug = 'uzbekistan' AND official_language IS NULL;
UPDATE countries SET official_language = 'English', currency = 'NGN', capital_city = 'Abuja' WHERE slug = 'nigeria' AND official_language IS NULL;
UPDATE countries SET official_language = 'English, Swahili', currency = 'KES', capital_city = 'Nairobi' WHERE slug = 'kenya' AND official_language IS NULL;
UPDATE countries SET official_language = 'English, Afrikaans', currency = 'ZAR', capital_city = 'Pretoria' WHERE slug = 'south-africa' AND official_language IS NULL;
UPDATE countries SET official_language = 'English', currency = 'GHS', capital_city = 'Accra' WHERE slug = 'ghana' AND official_language IS NULL;
UPDATE countries SET official_language = 'English', currency = 'UGX', capital_city = 'Kampala' WHERE slug = 'uganda' AND official_language IS NULL;
UPDATE countries SET official_language = 'Swahili, English', currency = 'TZS', capital_city = 'Dodoma' WHERE slug = 'tanzania' AND official_language IS NULL;
UPDATE countries SET official_language = 'Ukrainian', currency = 'UAH', capital_city = 'Kyiv' WHERE slug = 'ukraine' AND official_language IS NULL;
