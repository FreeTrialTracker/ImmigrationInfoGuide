/*
  # Add Key Facts and Popular Pathways - Part 3

  1. Coverage
    - Countries J-N (Japan through Norway)
*/

-- Japan
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "125 million"},
    {"label": "Capital", "value": "Tokyo"},
    {"label": "Currency", "value": "Japanese Yen (JPY)"},
    {"label": "GDP per capita", "value": "$42,000"},
    {"label": "Languages", "value": "Japanese"},
    {"label": "Timezone", "value": "JST (UTC+9)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Highly Skilled Professional Visa"},
    {"type": "Work", "name": "Engineer/Specialist Visa"},
    {"type": "Work", "name": "Skilled Worker Visa"},
    {"type": "Study", "name": "Student Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Immigration Services Agency", "url": "https://www.isa.go.jp/"},
    {"name": "MOFA Japan", "url": "https://www.mofa.go.jp/"}
  ]'::jsonb,
  visa_free_travel = 'Japanese passport provides visa-free access to 195+ countries, consistently ranked #1 globally.',
  updated_at = now()
WHERE country_slug = 'japan';

-- Malaysia
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "33 million"},
    {"label": "Capital", "value": "Kuala Lumpur"},
    {"label": "Currency", "value": "Malaysian Ringgit (MYR)"},
    {"label": "GDP per capita", "value": "$11,000"},
    {"label": "Languages", "value": "Malay, English"},
    {"label": "Timezone", "value": "MYT (UTC+8)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Residency", "name": "MM2H (Malaysia My Second Home)"},
    {"type": "Work", "name": "Employment Pass"},
    {"type": "Digital Nomad", "name": "DE Rantau Nomad Pass"},
    {"type": "Investor", "name": "Investor visas"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Immigration Department", "url": "https://www.imi.gov.my/"},
    {"name": "MM2H Programme", "url": "https://mm2h.gov.my/"}
  ]'::jsonb,
  visa_free_travel = 'Malaysian passport provides visa-free access to 180+ countries.',
  updated_at = now()
WHERE country_slug = 'malaysia';

-- Mexico
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "130 million"},
    {"label": "Capital", "value": "Mexico City"},
    {"label": "Currency", "value": "Mexican Peso (MXN)"},
    {"label": "GDP per capita", "value": "$10,000"},
    {"label": "Languages", "value": "Spanish"},
    {"label": "Timezone", "value": "CST (UTC-6)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Residency", "name": "Temporary Resident Visa"},
    {"type": "Residency", "name": "Permanent Resident Visa"},
    {"type": "Work", "name": "Work Visa"},
    {"type": "Retirement", "name": "Retirement Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "National Migration Institute", "url": "https://www.inm.gob.mx/"},
    {"name": "Mexican Government", "url": "https://www.gob.mx/"}
  ]'::jsonb,
  visa_free_travel = 'Mexican passport provides visa-free access to 160+ countries.',
  updated_at = now()
WHERE country_slug = 'mexico';

-- Morocco
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "37 million"},
    {"label": "Capital", "value": "Rabat"},
    {"label": "Currency", "value": "Moroccan Dirham (MAD)"},
    {"label": "GDP per capita", "value": "$3,500"},
    {"label": "Languages", "value": "Arabic, French"},
    {"label": "Timezone", "value": "WET (UTC+0)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "Residence Card"},
    {"type": "Investor", "name": "Investor Residence"},
    {"type": "Retirement", "name": "Retirement Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Interior", "url": "https://www.interieur.gov.ma/"},
    {"name": "Moroccan Government", "url": "https://www.maroc.ma/"}
  ]'::jsonb,
  visa_free_travel = 'Moroccan passport provides visa-free access to 70+ countries.',
  updated_at = now()
WHERE country_slug = 'morocco';

-- Netherlands
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "17.5 million"},
    {"label": "Capital", "value": "Amsterdam"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$61,000"},
    {"label": "Languages", "value": "Dutch"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Highly Skilled Migrant"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Work", "name": "Orientation Year Visa"},
    {"type": "Investor", "name": "Dutch American Friendship Treaty"}
  ]'::jsonb,
  official_resources = '[
    {"name": "IND (Immigration Service)", "url": "https://ind.nl/"},
    {"name": "Government.nl", "url": "https://www.government.nl/"}
  ]'::jsonb,
  visa_free_travel = 'Dutch passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'netherlands';

-- New Zealand
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "5.1 million"},
    {"label": "Capital", "value": "Wellington"},
    {"label": "Currency", "value": "New Zealand Dollar (NZD)"},
    {"label": "GDP per capita", "value": "$48,000"},
    {"label": "Languages", "value": "English, Māori"},
    {"label": "Timezone", "value": "NZST (UTC+12)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Skilled Migrant Visa"},
    {"type": "Work", "name": "Essential Skills Work Visa"},
    {"type": "Residency", "name": "Residence from Work"},
    {"type": "Investor", "name": "Investor Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Immigration New Zealand", "url": "https://www.immigration.govt.nz/"},
    {"name": "New Zealand Government", "url": "https://www.govt.nz/"}
  ]'::jsonb,
  visa_free_travel = 'New Zealand passport provides visa-free access to 185+ countries.',
  updated_at = now()
WHERE country_slug = 'new-zealand';

-- Nigeria
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "220 million"},
    {"label": "Capital", "value": "Abuja"},
    {"label": "Currency", "value": "Nigerian Naira (NGN)"},
    {"label": "GDP per capita", "value": "$2,400"},
    {"label": "Languages", "value": "English"},
    {"label": "Timezone", "value": "WAT (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Subject to Regularization (STR) Permit"},
    {"type": "Work", "name": "Temporary Work Permit"},
    {"type": "Investor", "name": "Business Permit"},
    {"type": "Residency", "name": "Permanent Residence"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Nigeria Immigration Service", "url": "https://immigration.gov.ng/"},
    {"name": "Federal Government", "url": "https://www.nigeria.gov.ng/"}
  ]'::jsonb,
  visa_free_travel = 'Nigerian passport provides visa-free access to 45+ countries.',
  updated_at = now()
WHERE country_slug = 'nigeria';

-- Norway
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "5.5 million"},
    {"label": "Capital", "value": "Oslo"},
    {"label": "Currency", "value": "Norwegian Krone (NOK)"},
    {"label": "GDP per capita", "value": "$89,000"},
    {"label": "Languages", "value": "Norwegian"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Skilled Worker Visa"},
    {"type": "Work", "name": "Seasonal Work Permit"},
    {"type": "Residency", "name": "Permanent Residence"},
    {"type": "Study", "name": "Student Residence"}
  ]'::jsonb,
  official_resources = '[
    {"name": "UDI (Immigration Authority)", "url": "https://www.udi.no/"},
    {"name": "Work in Norway", "url": "https://www.workinnorway.no/"}
  ]'::jsonb,
  visa_free_travel = 'Norwegian passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'norway';
