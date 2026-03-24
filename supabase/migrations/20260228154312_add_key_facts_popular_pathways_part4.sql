/*
  # Add Key Facts and Popular Pathways - Part 4

  1. Coverage
    - Countries P-S (Peru through Sweden)
*/

-- Peru
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "34 million"},
    {"label": "Capital", "value": "Lima"},
    {"label": "Currency", "value": "Peruvian Sol (PEN)"},
    {"label": "GDP per capita", "value": "$7,000"},
    {"label": "Languages", "value": "Spanish"},
    {"label": "Timezone", "value": "PET (UTC-5)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Visa"},
    {"type": "Residency", "name": "Temporary Residency"},
    {"type": "Investor", "name": "Investor Visa"},
    {"type": "Digital Nomad", "name": "Digital Nomad considerations"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Migraciones Peru", "url": "https://www.migraciones.gob.pe/"},
    {"name": "Peruvian Government", "url": "https://www.gob.pe/"}
  ]'::jsonb,
  visa_free_travel = 'Peruvian passport provides visa-free access to 135+ countries.',
  updated_at = now()
WHERE country_slug = 'peru';

-- Philippines
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "115 million"},
    {"label": "Capital", "value": "Manila"},
    {"label": "Currency", "value": "Philippine Peso (PHP)"},
    {"label": "GDP per capita", "value": "$3,500"},
    {"label": "Languages", "value": "Filipino, English"},
    {"label": "Timezone", "value": "PHT (UTC+8)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "9(g) Work Visa"},
    {"type": "Retirement", "name": "SRRV (Retirement Visa)"},
    {"type": "Investor", "name": "Investor Visa"},
    {"type": "Study", "name": "Student Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Bureau of Immigration", "url": "https://immigration.gov.ph/"},
    {"name": "Philippine Government", "url": "https://www.gov.ph/"}
  ]'::jsonb,
  visa_free_travel = 'Philippine passport provides visa-free access to 70+ countries.',
  updated_at = now()
WHERE country_slug = 'philippines';

-- Poland
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "38 million"},
    {"label": "Capital", "value": "Warsaw"},
    {"label": "Currency", "value": "Polish Zloty (PLN)"},
    {"label": "GDP per capita", "value": "$18,000"},
    {"label": "Languages", "value": "Polish"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Work", "name": "Seasonal Work"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Office for Foreigners", "url": "https://www.gov.pl/web/udsc"},
    {"name": "Polish Government", "url": "https://www.gov.pl/"}
  ]'::jsonb,
  visa_free_travel = 'Polish passport provides visa-free access to 185+ countries with EU membership.',
  updated_at = now()
WHERE country_slug = 'poland';

-- Portugal
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "10.3 million"},
    {"label": "Capital", "value": "Lisbon"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$24,000"},
    {"label": "Languages", "value": "Portuguese"},
    {"label": "Timezone", "value": "WET (UTC+0)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Digital Nomad", "name": "Digital Nomad Visa (D8)"},
    {"type": "Work", "name": "Work Visa (D2)"},
    {"type": "Investor", "name": "Golden Visa"},
    {"type": "Residency", "name": "D7 Passive Income Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "SEF (Immigration Service)", "url": "https://www.sef.pt/"},
    {"name": "Portugal.gov.pt", "url": "https://www.portugal.gov.pt/"}
  ]'::jsonb,
  visa_free_travel = 'Portuguese passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'portugal';

-- Qatar
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "3 million"},
    {"label": "Capital", "value": "Doha"},
    {"label": "Currency", "value": "Qatari Riyal (QAR)"},
    {"label": "GDP per capita", "value": "$62,000"},
    {"label": "Languages", "value": "Arabic"},
    {"label": "Timezone", "value": "AST (UTC+3)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Visa (Sponsored)"},
    {"type": "Residency", "name": "Permanent Residency"},
    {"type": "Investor", "name": "Investor Residence"},
    {"type": "Work", "name": "Company Transfer"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Interior", "url": "https://portal.moi.gov.qa/"},
    {"name": "Hukoomi Qatar", "url": "https://hukoomi.gov.qa/"}
  ]'::jsonb,
  visa_free_travel = 'Qatari passport provides visa-free access to 105+ countries.',
  updated_at = now()
WHERE country_slug = 'qatar';

-- Romania
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "19 million"},
    {"label": "Capital", "value": "Bucharest"},
    {"label": "Currency", "value": "Romanian Leu (RON)"},
    {"label": "GDP per capita", "value": "$15,000"},
    {"label": "Languages", "value": "Romanian"},
    {"label": "Timezone", "value": "EET (UTC+2)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Digital Nomad", "name": "Digital Nomad Visa"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Romanian Immigration Office", "url": "https://igi.mai.gov.ro/"},
    {"name": "Romanian Government", "url": "https://www.gov.ro/"}
  ]'::jsonb,
  visa_free_travel = 'Romanian passport provides visa-free access to 175+ countries with EU membership.',
  updated_at = now()
WHERE country_slug = 'romania';

-- Russia
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "145 million"},
    {"label": "Capital", "value": "Moscow"},
    {"label": "Currency", "value": "Russian Ruble (RUB)"},
    {"label": "GDP per capita", "value": "$12,000"},
    {"label": "Languages", "value": "Russian"},
    {"label": "Timezone", "value": "MSK (UTC+3)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Visa"},
    {"type": "Work", "name": "Highly Qualified Specialist"},
    {"type": "Residency", "name": "Temporary Residence Permit"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Internal Affairs", "url": "https://мвд.рф/"},
    {"name": "Russian Government", "url": "http://government.ru/"}
  ]'::jsonb,
  visa_free_travel = 'Russian passport provides visa-free access to 120+ countries.',
  updated_at = now()
WHERE country_slug = 'russia';

-- Saudi Arabia
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "36 million"},
    {"label": "Capital", "value": "Riyadh"},
    {"label": "Currency", "value": "Saudi Riyal (SAR)"},
    {"label": "GDP per capita", "value": "$23,000"},
    {"label": "Languages", "value": "Arabic"},
    {"label": "Timezone", "value": "AST (UTC+3)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Visa (Iqama)"},
    {"type": "Residency", "name": "Premium Residency"},
    {"type": "Investor", "name": "Investor Residence"},
    {"type": "Work", "name": "Professional Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Interior", "url": "https://www.moi.gov.sa/"},
    {"name": "Saudi Government", "url": "https://www.my.gov.sa/"}
  ]'::jsonb,
  visa_free_travel = 'Saudi passport provides visa-free access to 85+ countries.',
  updated_at = now()
WHERE country_slug = 'saudi-arabia';

-- Singapore
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "5.9 million"},
    {"label": "Capital", "value": "Singapore"},
    {"label": "Currency", "value": "Singapore Dollar (SGD)"},
    {"label": "GDP per capita", "value": "$72,000"},
    {"label": "Languages", "value": "English, Mandarin, Malay, Tamil"},
    {"label": "Timezone", "value": "SGT (UTC+8)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Employment Pass"},
    {"type": "Work", "name": "Tech.Pass"},
    {"type": "Investor", "name": "Global Investor Programme"},
    {"type": "Residency", "name": "Permanent Residence"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Immigration & Checkpoints Authority", "url": "https://www.ica.gov.sg/"},
    {"name": "Ministry of Manpower", "url": "https://www.mom.gov.sg/"}
  ]'::jsonb,
  visa_free_travel = 'Singapore passport provides visa-free access to 195+ countries, ranked #1-2 globally.',
  updated_at = now()
WHERE country_slug = 'singapore';

-- South Korea
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "52 million"},
    {"label": "Capital", "value": "Seoul"},
    {"label": "Currency", "value": "South Korean Won (KRW)"},
    {"label": "GDP per capita", "value": "$35,000"},
    {"label": "Languages", "value": "Korean"},
    {"label": "Timezone", "value": "KST (UTC+9)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "E-7 Skilled Worker Visa"},
    {"type": "Digital Nomad", "name": "Digital Nomad Visa (Workcation)"},
    {"type": "Work", "name": "E-9 Employment Permit"},
    {"type": "Study", "name": "D-2 Student Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Korea Immigration Service", "url": "https://www.immigration.go.kr/"},
    {"name": "HiKorea", "url": "https://www.hikorea.go.kr/"}
  ]'::jsonb,
  visa_free_travel = 'South Korean passport provides visa-free access to 195+ countries.',
  updated_at = now()
WHERE country_slug = 'south-korea';

-- Spain
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "47 million"},
    {"label": "Capital", "value": "Madrid"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$30,000"},
    {"label": "Languages", "value": "Spanish"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Digital Nomad", "name": "Digital Nomad Visa"},
    {"type": "Work", "name": "Work Visa"},
    {"type": "Investor", "name": "Golden Visa"},
    {"type": "Residency", "name": "Non-Lucrative Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Inclusion", "url": "https://extranjeros.inclusion.gob.es/"},
    {"name": "Spanish Government", "url": "https://www.lamoncloa.gob.es/"}
  ]'::jsonb,
  visa_free_travel = 'Spanish passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'spain';

-- Sweden
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "10.5 million"},
    {"label": "Capital", "value": "Stockholm"},
    {"label": "Currency", "value": "Swedish Krona (SEK)"},
    {"label": "GDP per capita", "value": "$60,000"},
    {"label": "Languages", "value": "Swedish"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Work", "name": "Self-Employment Visa"},
    {"type": "Study", "name": "Student Residence"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Swedish Migration Agency", "url": "https://www.migrationsverket.se/"},
    {"name": "Sweden.se", "url": "https://sweden.se/"}
  ]'::jsonb,
  visa_free_travel = 'Swedish passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'sweden';
