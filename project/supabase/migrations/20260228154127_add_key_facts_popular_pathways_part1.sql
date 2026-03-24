/*
  # Add Key Facts and Popular Pathways - Part 1

  1. Purpose
    - Adds key_facts (population, capital, currency, languages)
    - Adds popular_pathways for immigration
    - Adds official_resources with government links
    - Adds visa_free_travel information
    
  2. Coverage
    - First batch of countries (A-I)
*/

-- Argentina
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "46 million"},
    {"label": "Capital", "value": "Buenos Aires"},
    {"label": "Currency", "value": "Argentine Peso (ARS)"},
    {"label": "GDP per capita", "value": "$10,000"},
    {"label": "Languages", "value": "Spanish"},
    {"label": "Timezone", "value": "ART (UTC-3)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Visa"},
    {"type": "Residency", "name": "Temporary Residency"},
    {"type": "Investor", "name": "Investor Visa"},
    {"type": "Retirement", "name": "Pensioner Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Argentina Immigration", "url": "https://www.argentina.gob.ar/interior/migraciones"},
    {"name": "Government Portal", "url": "https://www.argentina.gob.ar/"}
  ]'::jsonb,
  visa_free_travel = 'Argentine passport provides visa-free access to 170+ countries including Schengen area.',
  updated_at = now()
WHERE country_slug = 'argentina';

-- Australia
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "26 million"},
    {"label": "Capital", "value": "Canberra"},
    {"label": "Currency", "value": "Australian Dollar (AUD)"},
    {"label": "GDP per capita", "value": "$60,000"},
    {"label": "Languages", "value": "English"},
    {"label": "Timezone", "value": "AEST (UTC+10)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Skilled Independent Visa (189)"},
    {"type": "Work", "name": "Temporary Skill Shortage (482)"},
    {"type": "Residency", "name": "Employer Nomination (186)"},
    {"type": "Investor", "name": "Business Innovation Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Home Affairs", "url": "https://immi.homeaffairs.gov.au/"},
    {"name": "SkillSelect", "url": "https://immi.homeaffairs.gov.au/visas/working-in-australia/skillselect"}
  ]'::jsonb,
  visa_free_travel = 'Australian passport provides visa-free access to 185+ countries, one of the strongest passports globally.',
  updated_at = now()
WHERE country_slug = 'australia';

-- Austria
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "9 million"},
    {"label": "Capital", "value": "Vienna"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$55,000"},
    {"label": "Languages", "value": "German"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Red-White-Red Card"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Work", "name": "Skilled Worker Visa"},
    {"type": "Study", "name": "Student Residence Permit"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Austrian Integration Fund", "url": "https://www.integrationsfonds.at/en/"},
    {"name": "Migration & Home Affairs", "url": "https://www.bmi.gv.at/"}
  ]'::jsonb,
  visa_free_travel = 'Austrian passport provides visa-free access to 190+ countries, one of the world''s strongest passports.',
  updated_at = now()
WHERE country_slug = 'austria';

-- Belgium
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "11.5 million"},
    {"label": "Capital", "value": "Brussels"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$52,000"},
    {"label": "Languages", "value": "Dutch, French, German"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit Type B"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Work", "name": "Highly Skilled Migrant"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Immigration Office", "url": "https://dofi.ibz.be/en"},
    {"name": "Belgium.be", "url": "https://www.belgium.be/"}
  ]'::jsonb,
  visa_free_travel = 'Belgian passport provides visa-free access to 190+ countries globally.',
  updated_at = now()
WHERE country_slug = 'belgium';

-- Brazil
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "215 million"},
    {"label": "Capital", "value": "Brasília"},
    {"label": "Currency", "value": "Brazilian Real (BRL)"},
    {"label": "GDP per capita", "value": "$8,700"},
    {"label": "Languages", "value": "Portuguese"},
    {"label": "Timezone", "value": "BRT (UTC-3)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Visa (VITEM V)"},
    {"type": "Investor", "name": "Investor Visa"},
    {"type": "Residency", "name": "Permanent Residency"},
    {"type": "Digital Nomad", "name": "Digital Nomad Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Federal Police", "url": "https://www.gov.br/pf/pt-br"},
    {"name": "Ministry of Justice", "url": "https://www.gov.br/mj/pt-br"}
  ]'::jsonb,
  visa_free_travel = 'Brazilian passport provides visa-free access to 170+ countries.',
  updated_at = now()
WHERE country_slug = 'brazil';

-- Canada
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "39 million"},
    {"label": "Capital", "value": "Ottawa"},
    {"label": "Currency", "value": "Canadian Dollar (CAD)"},
    {"label": "GDP per capita", "value": "$52,000"},
    {"label": "Languages", "value": "English, French"},
    {"label": "Timezone", "value": "EST to PST (UTC-5 to -8)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Express Entry"},
    {"type": "Residency", "name": "Provincial Nominee Program"},
    {"type": "Work", "name": "Temporary Work Permit"},
    {"type": "Study", "name": "Study Permit"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Immigration Canada (IRCC)", "url": "https://www.canada.ca/en/immigration-refugees-citizenship.html"},
    {"name": "Express Entry Portal", "url": "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html"}
  ]'::jsonb,
  visa_free_travel = 'Canadian passport provides visa-free access to 185+ countries globally.',
  updated_at = now()
WHERE country_slug = 'canada';

-- Chile
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "19 million"},
    {"label": "Capital", "value": "Santiago"},
    {"label": "Currency", "value": "Chilean Peso (CLP)"},
    {"label": "GDP per capita", "value": "$15,000"},
    {"label": "Languages", "value": "Spanish"},
    {"label": "Timezone", "value": "CLT (UTC-3)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Visa"},
    {"type": "Residency", "name": "Temporary Residency"},
    {"type": "Digital Nomad", "name": "Digital Nomad Visa"},
    {"type": "Investor", "name": "Investor Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Chilean Immigration", "url": "https://www.extranjeria.gob.cl/"},
    {"name": "Government of Chile", "url": "https://www.gob.cl/"}
  ]'::jsonb,
  visa_free_travel = 'Chilean passport provides visa-free access to 175+ countries.',
  updated_at = now()
WHERE country_slug = 'chile';

-- China
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "1.4 billion"},
    {"label": "Capital", "value": "Beijing"},
    {"label": "Currency", "value": "Yuan (CNY)"},
    {"label": "GDP per capita", "value": "$12,500"},
    {"label": "Languages", "value": "Mandarin Chinese"},
    {"label": "Timezone", "value": "CST (UTC+8)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit (Z Visa)"},
    {"type": "Work", "name": "Talent Visa"},
    {"type": "Study", "name": "Student Visa (X Visa)"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "National Immigration Administration", "url": "https://www.nia.gov.cn/"},
    {"name": "China Consular Services", "url": "http://www.china-embassy.org/"}
  ]'::jsonb,
  visa_free_travel = 'Chinese passport provides visa-free access to 80+ countries.',
  updated_at = now()
WHERE country_slug = 'china';

-- Colombia
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "51 million"},
    {"label": "Capital", "value": "Bogotá"},
    {"label": "Currency", "value": "Colombian Peso (COP)"},
    {"label": "GDP per capita", "value": "$6,400"},
    {"label": "Languages", "value": "Spanish"},
    {"label": "Timezone", "value": "COT (UTC-5)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Digital Nomad", "name": "Digital Nomad Visa"},
    {"type": "Work", "name": "Work Visa (TP-7)"},
    {"type": "Residency", "name": "Resident Visa (Type R)"},
    {"type": "Investor", "name": "Investor Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Migración Colombia", "url": "https://www.migracioncolombia.gov.co/"},
    {"name": "Ministry of Foreign Affairs", "url": "https://www.cancilleria.gov.co/"}
  ]'::jsonb,
  visa_free_travel = 'Colombian passport provides visa-free access to 145+ countries.',
  updated_at = now()
WHERE country_slug = 'colombia';

-- Croatia
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "3.9 million"},
    {"label": "Capital", "value": "Zagreb"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$17,500"},
    {"label": "Languages", "value": "Croatian"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "Temporary Residence"},
    {"type": "Digital Nomad", "name": "Digital Nomad Visa"},
    {"type": "Investor", "name": "Business Residence"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Interior", "url": "https://mup.gov.hr/"},
    {"name": "Croatian Government", "url": "https://vlada.gov.hr/"}
  ]'::jsonb,
  visa_free_travel = 'Croatian passport provides visa-free access to 180+ countries with EU membership.',
  updated_at = now()
WHERE country_slug = 'croatia';
