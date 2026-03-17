/*
  # Batch 3: Country Guides — Passport Visa-Free Access Corrections

  ## Summary
  Corrects visa_free_travel text in country_guides based on the 2026 Henley
  Passport Index (January 2026 release), which uses IATA data.

  ## Corrections Applied

  | Country        | Old Text                           | Corrected Text                           |
  |----------------|------------------------------------|------------------------------------------|
  | Japan          | 195+ countries, ranked #1          | ~194 countries (2026 Henley, tied #1)    |
  | Germany        | 190+ countries, ranked #1          | ~194 countries (2026 Henley, tied #1)    |
  | United Kingdom | 190+ countries                     | ~182 countries (2026 Henley, 7th place)  |
  | United States  | 190+ countries                     | ~179 countries (2026 Henley)             |
  | Australia      | 185+ — already accurate            | Clarified with Henley rank context       |
  | Canada         | 185+ — already accurate            | Clarified with Henley rank context       |
  | Portugal       | 190+ — accurate                    | Clarified with Henley rank context       |
  | Singapore      | 195+ ranked #1 — accurate          | Confirmed correct                        |

  ## Source
  Henley Passport Index, January 2026 release
*/

UPDATE country_guides
SET
  visa_free_travel = 'Japanese passport provides visa-free access to approximately 194 destinations (2026 Henley Passport Index, joint 1st place globally).',
  updated_at = now()
WHERE country_slug = 'japan';

UPDATE country_guides
SET
  visa_free_travel = 'German passport provides visa-free access to approximately 194 destinations (2026 Henley Passport Index, joint 1st place globally).',
  updated_at = now()
WHERE country_slug = 'germany';

UPDATE country_guides
SET
  visa_free_travel = 'UK passport provides visa-free access to approximately 182 destinations (2026 Henley Passport Index, 7th place globally).',
  updated_at = now()
WHERE country_slug = 'united-kingdom';

UPDATE country_guides
SET
  visa_free_travel = 'US passport provides visa-free access to approximately 179 destinations (2026 Henley Passport Index). US citizens can travel visa-free to most of Europe, Americas, and many Asia-Pacific nations.',
  updated_at = now()
WHERE country_slug = 'united-states';

UPDATE country_guides
SET
  visa_free_travel = 'Australian passport provides visa-free access to approximately 185 destinations (2026 Henley Passport Index), consistently ranked among the world''s top 10 strongest passports.',
  updated_at = now()
WHERE country_slug = 'australia';

UPDATE country_guides
SET
  visa_free_travel = 'Canadian passport provides visa-free access to approximately 185 destinations (2026 Henley Passport Index), consistently ranked among the world''s top 10.',
  updated_at = now()
WHERE country_slug = 'canada';

UPDATE country_guides
SET
  visa_free_travel = 'Singapore passport provides visa-free access to approximately 195 destinations (2026 Henley Passport Index, ranked #1 globally). The world''s most powerful passport.',
  updated_at = now()
WHERE country_slug = 'singapore';

UPDATE country_guides
SET
  visa_free_travel = 'Portuguese passport (EU) provides visa-free access to approximately 190 destinations (2026 Henley Passport Index), including unrestricted travel across all 27 EU member states.',
  updated_at = now()
WHERE country_slug = 'portugal';

UPDATE country_guides
SET
  visa_free_travel = 'Spanish passport (EU) provides visa-free access to approximately 190 destinations (2026 Henley Passport Index), including unrestricted travel across all 27 EU member states.',
  updated_at = now()
WHERE country_slug = 'spain';

UPDATE country_guides
SET
  visa_free_travel = 'Netherlands passport (EU) provides visa-free access to approximately 190 destinations (2026 Henley Passport Index), including unrestricted travel across all 27 EU member states.',
  updated_at = now()
WHERE country_slug = 'netherlands';

UPDATE country_guides
SET
  visa_free_travel = 'New Zealand passport provides visa-free access to approximately 185 destinations (2026 Henley Passport Index), consistently ranked among the world''s top 10.',
  updated_at = now()
WHERE country_slug = 'new-zealand';
