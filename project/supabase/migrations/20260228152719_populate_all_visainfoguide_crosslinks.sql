/*
  # Populate VisaInfoGuide Crosslinks for All 52 Countries

  1. Purpose
    - Ensures all 52 countries have links to VisaInfoGuide.com
    - Provides external resource links for visa information

  2. Changes
    - Inserts/updates country_crosslinks for all 52 countries
    - Links to corresponding VisaInfoGuide pages
*/

INSERT INTO country_crosslinks (visa_slug, visa_url, immigration_url, is_active) VALUES
  ('argentina', 'https://visainfoguide.com/destination/argentina', 'https://immigrationinfoguide.com/immigrate-to/argentina', true),
  ('australia', 'https://visainfoguide.com/destination/australia', 'https://immigrationinfoguide.com/immigrate-to/australia', true),
  ('austria', 'https://visainfoguide.com/destination/austria', 'https://immigrationinfoguide.com/immigrate-to/austria', true),
  ('belgium', 'https://visainfoguide.com/destination/belgium', 'https://immigrationinfoguide.com/immigrate-to/belgium', true),
  ('brazil', 'https://visainfoguide.com/destination/brazil', 'https://immigrationinfoguide.com/immigrate-to/brazil', true),
  ('canada', 'https://visainfoguide.com/destination/canada', 'https://immigrationinfoguide.com/immigrate-to/canada', true),
  ('chile', 'https://visainfoguide.com/destination/chile', 'https://immigrationinfoguide.com/immigrate-to/chile', true),
  ('china', 'https://visainfoguide.com/destination/china', 'https://immigrationinfoguide.com/immigrate-to/china', true),
  ('colombia', 'https://visainfoguide.com/destination/colombia', 'https://immigrationinfoguide.com/immigrate-to/colombia', true),
  ('croatia', 'https://visainfoguide.com/destination/croatia', 'https://immigrationinfoguide.com/immigrate-to/croatia', true),
  ('czech-republic', 'https://visainfoguide.com/destination/czech-republic', 'https://immigrationinfoguide.com/immigrate-to/czech-republic', true),
  ('denmark', 'https://visainfoguide.com/destination/denmark', 'https://immigrationinfoguide.com/immigrate-to/denmark', true),
  ('egypt', 'https://visainfoguide.com/destination/egypt', 'https://immigrationinfoguide.com/immigrate-to/egypt', true),
  ('finland', 'https://visainfoguide.com/destination/finland', 'https://immigrationinfoguide.com/immigrate-to/finland', true),
  ('france', 'https://visainfoguide.com/destination/france', 'https://immigrationinfoguide.com/immigrate-to/france', true),
  ('germany', 'https://visainfoguide.com/destination/germany', 'https://immigrationinfoguide.com/immigrate-to/germany', true),
  ('greece', 'https://visainfoguide.com/destination/greece', 'https://immigrationinfoguide.com/immigrate-to/greece', true),
  ('hungary', 'https://visainfoguide.com/destination/hungary', 'https://immigrationinfoguide.com/immigrate-to/hungary', true),
  ('india', 'https://visainfoguide.com/destination/india', 'https://immigrationinfoguide.com/immigrate-to/india', true),
  ('indonesia', 'https://visainfoguide.com/destination/indonesia', 'https://immigrationinfoguide.com/immigrate-to/indonesia', true),
  ('ireland', 'https://visainfoguide.com/destination/ireland', 'https://immigrationinfoguide.com/immigrate-to/ireland', true),
  ('israel', 'https://visainfoguide.com/destination/israel', 'https://immigrationinfoguide.com/immigrate-to/israel', true),
  ('italy', 'https://visainfoguide.com/destination/italy', 'https://immigrationinfoguide.com/immigrate-to/italy', true),
  ('japan', 'https://visainfoguide.com/destination/japan', 'https://immigrationinfoguide.com/immigrate-to/japan', true),
  ('malaysia', 'https://visainfoguide.com/destination/malaysia', 'https://immigrationinfoguide.com/immigrate-to/malaysia', true),
  ('mexico', 'https://visainfoguide.com/destination/mexico', 'https://immigrationinfoguide.com/immigrate-to/mexico', true),
  ('morocco', 'https://visainfoguide.com/destination/morocco', 'https://immigrationinfoguide.com/immigrate-to/morocco', true),
  ('netherlands', 'https://visainfoguide.com/destination/netherlands', 'https://immigrationinfoguide.com/immigrate-to/netherlands', true),
  ('new-zealand', 'https://visainfoguide.com/destination/new-zealand', 'https://immigrationinfoguide.com/immigrate-to/new-zealand', true),
  ('nigeria', 'https://visainfoguide.com/destination/nigeria', 'https://immigrationinfoguide.com/immigrate-to/nigeria', true),
  ('norway', 'https://visainfoguide.com/destination/norway', 'https://immigrationinfoguide.com/immigrate-to/norway', true),
  ('peru', 'https://visainfoguide.com/destination/peru', 'https://immigrationinfoguide.com/immigrate-to/peru', true),
  ('philippines', 'https://visainfoguide.com/destination/philippines', 'https://immigrationinfoguide.com/immigrate-to/philippines', true),
  ('poland', 'https://visainfoguide.com/destination/poland', 'https://immigrationinfoguide.com/immigrate-to/poland', true),
  ('portugal', 'https://visainfoguide.com/destination/portugal', 'https://immigrationinfoguide.com/immigrate-to/portugal', true),
  ('qatar', 'https://visainfoguide.com/destination/qatar', 'https://immigrationinfoguide.com/immigrate-to/qatar', true),
  ('romania', 'https://visainfoguide.com/destination/romania', 'https://immigrationinfoguide.com/immigrate-to/romania', true),
  ('russia', 'https://visainfoguide.com/destination/russia', 'https://immigrationinfoguide.com/immigrate-to/russia', true),
  ('saudi-arabia', 'https://visainfoguide.com/destination/saudi-arabia', 'https://immigrationinfoguide.com/immigrate-to/saudi-arabia', true),
  ('singapore', 'https://visainfoguide.com/destination/singapore', 'https://immigrationinfoguide.com/immigrate-to/singapore', true),
  ('south-africa', 'https://visainfoguide.com/destination/south-africa', 'https://immigrationinfoguide.com/immigrate-to/south-africa', true),
  ('south-korea', 'https://visainfoguide.com/destination/south-korea', 'https://immigrationinfoguide.com/immigrate-to/south-korea', true),
  ('spain', 'https://visainfoguide.com/destination/spain', 'https://immigrationinfoguide.com/immigrate-to/spain', true),
  ('sweden', 'https://visainfoguide.com/destination/sweden', 'https://immigrationinfoguide.com/immigrate-to/sweden', true),
  ('switzerland', 'https://visainfoguide.com/destination/switzerland', 'https://immigrationinfoguide.com/immigrate-to/switzerland', true),
  ('thailand', 'https://visainfoguide.com/destination/thailand', 'https://immigrationinfoguide.com/immigrate-to/thailand', true),
  ('turkey', 'https://visainfoguide.com/destination/turkey', 'https://immigrationinfoguide.com/immigrate-to/turkey', true),
  ('ukraine', 'https://visainfoguide.com/destination/ukraine', 'https://immigrationinfoguide.com/immigrate-to/ukraine', true),
  ('united-arab-emirates', 'https://visainfoguide.com/destination/united-arab-emirates', 'https://immigrationinfoguide.com/immigrate-to/united-arab-emirates', true),
  ('united-kingdom', 'https://visainfoguide.com/destination/united-kingdom', 'https://immigrationinfoguide.com/immigrate-to/united-kingdom', true),
  ('united-states', 'https://visainfoguide.com/destination/united-states', 'https://immigrationinfoguide.com/immigrate-to/united-states', true),
  ('vietnam', 'https://visainfoguide.com/destination/vietnam', 'https://immigrationinfoguide.com/immigrate-to/vietnam', true)
ON CONFLICT (visa_slug) 
DO UPDATE SET 
  visa_url = EXCLUDED.visa_url,
  immigration_url = EXCLUDED.immigration_url,
  is_active = EXCLUDED.is_active,
  updated_at = now();
