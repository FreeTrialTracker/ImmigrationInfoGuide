/*
  # Limit Database to 52 Countries Only

  1. Purpose
    - Removes all countries except the core 52 countries
    - Ensures consistency across all tables
    - Cleans up pathways, guides, and related data for removed countries

  2. Changes
    - Deletes related data first (pathways, guides, crosslinks)
    - Then deletes countries and passports not in the 52-country list
    - Keeps only the essential 52 countries

  3. The 52 Countries
    Argentina, Australia, Austria, Belgium, Brazil, Canada, Chile, China,
    Colombia, Croatia, Czech Republic, Denmark, Egypt, Finland, France,
    Germany, Greece, Hungary, India, Indonesia, Ireland, Israel, Italy,
    Japan, Malaysia, Mexico, Morocco, Netherlands, New Zealand, Nigeria,
    Norway, Peru, Philippines, Poland, Portugal, Qatar, Romania, Russia,
    Saudi Arabia, Singapore, South Africa, South Korea, Spain, Sweden,
    Switzerland, Thailand, Turkey, Ukraine, United Arab Emirates,
    United Kingdom, United States, Vietnam
*/

-- First, delete immigration pathways for countries not in the 52-country list
DELETE FROM immigration_pathways
WHERE destination_slug NOT IN (
  'argentina', 'australia', 'austria', 'belgium', 'brazil', 'canada', 'chile', 'china',
  'colombia', 'croatia', 'czech-republic', 'denmark', 'egypt', 'finland', 'france',
  'germany', 'greece', 'hungary', 'india', 'indonesia', 'ireland', 'israel', 'italy',
  'japan', 'malaysia', 'mexico', 'morocco', 'netherlands', 'new-zealand', 'nigeria',
  'norway', 'peru', 'philippines', 'poland', 'portugal', 'qatar', 'romania', 'russia',
  'saudi-arabia', 'singapore', 'south-africa', 'south-korea', 'spain', 'sweden',
  'switzerland', 'thailand', 'turkey', 'ukraine', 'united-arab-emirates',
  'united-kingdom', 'united-states', 'vietnam'
)
OR passport_slug NOT IN (
  'argentina', 'australia', 'austria', 'belgium', 'brazil', 'canada', 'chile', 'china',
  'colombia', 'croatia', 'czech-republic', 'denmark', 'egypt', 'finland', 'france',
  'germany', 'greece', 'hungary', 'india', 'indonesia', 'ireland', 'israel', 'italy',
  'japan', 'malaysia', 'mexico', 'morocco', 'netherlands', 'new-zealand', 'nigeria',
  'norway', 'peru', 'philippines', 'poland', 'portugal', 'qatar', 'romania', 'russia',
  'saudi-arabia', 'singapore', 'south-africa', 'south-korea', 'spain', 'sweden',
  'switzerland', 'thailand', 'turkey', 'ukraine', 'united-arab-emirates',
  'united-kingdom', 'united-states', 'vietnam'
);

-- Delete country guides for countries not in the 52-country list
DELETE FROM country_guides
WHERE country_slug NOT IN (
  'argentina', 'australia', 'austria', 'belgium', 'brazil', 'canada', 'chile', 'china',
  'colombia', 'croatia', 'czech-republic', 'denmark', 'egypt', 'finland', 'france',
  'germany', 'greece', 'hungary', 'india', 'indonesia', 'ireland', 'israel', 'italy',
  'japan', 'malaysia', 'mexico', 'morocco', 'netherlands', 'new-zealand', 'nigeria',
  'norway', 'peru', 'philippines', 'poland', 'portugal', 'qatar', 'romania', 'russia',
  'saudi-arabia', 'singapore', 'south-africa', 'south-korea', 'spain', 'sweden',
  'switzerland', 'thailand', 'turkey', 'ukraine', 'united-arab-emirates',
  'united-kingdom', 'united-states', 'vietnam'
);

-- Delete country crosslinks for countries not in the 52-country list
DELETE FROM country_crosslinks
WHERE visa_slug NOT IN (
  'argentina', 'australia', 'austria', 'belgium', 'brazil', 'canada', 'chile', 'china',
  'colombia', 'croatia', 'czech-republic', 'denmark', 'egypt', 'finland', 'france',
  'germany', 'greece', 'hungary', 'india', 'indonesia', 'ireland', 'israel', 'italy',
  'japan', 'malaysia', 'mexico', 'morocco', 'netherlands', 'new-zealand', 'nigeria',
  'norway', 'peru', 'philippines', 'poland', 'portugal', 'qatar', 'romania', 'russia',
  'saudi-arabia', 'singapore', 'south-africa', 'south-korea', 'spain', 'sweden',
  'switzerland', 'thailand', 'turkey', 'ukraine', 'united-arab-emirates',
  'united-kingdom', 'united-states', 'vietnam'
);

-- Delete all countries that are NOT in the 52-country list
DELETE FROM countries
WHERE slug NOT IN (
  'argentina', 'australia', 'austria', 'belgium', 'brazil', 'canada', 'chile', 'china',
  'colombia', 'croatia', 'czech-republic', 'denmark', 'egypt', 'finland', 'france',
  'germany', 'greece', 'hungary', 'india', 'indonesia', 'ireland', 'israel', 'italy',
  'japan', 'malaysia', 'mexico', 'morocco', 'netherlands', 'new-zealand', 'nigeria',
  'norway', 'peru', 'philippines', 'poland', 'portugal', 'qatar', 'romania', 'russia',
  'saudi-arabia', 'singapore', 'south-africa', 'south-korea', 'spain', 'sweden',
  'switzerland', 'thailand', 'turkey', 'ukraine', 'united-arab-emirates',
  'united-kingdom', 'united-states', 'vietnam'
);

-- Delete all passports that are NOT in the 52-country list
DELETE FROM passports
WHERE slug NOT IN (
  'argentina', 'australia', 'austria', 'belgium', 'brazil', 'canada', 'chile', 'china',
  'colombia', 'croatia', 'czech-republic', 'denmark', 'egypt', 'finland', 'france',
  'germany', 'greece', 'hungary', 'india', 'indonesia', 'ireland', 'israel', 'italy',
  'japan', 'malaysia', 'mexico', 'morocco', 'netherlands', 'new-zealand', 'nigeria',
  'norway', 'peru', 'philippines', 'poland', 'portugal', 'qatar', 'romania', 'russia',
  'saudi-arabia', 'singapore', 'south-africa', 'south-korea', 'spain', 'sweden',
  'switzerland', 'thailand', 'turkey', 'ukraine', 'united-arab-emirates',
  'united-kingdom', 'united-states', 'vietnam'
);
