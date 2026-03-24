/*
  # Add Key Facts and Popular Pathways - Part 5 Final

  1. Coverage
    - Remaining countries S-V (Switzerland through Vietnam)
*/

-- Switzerland
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "8.7 million"},
    {"label": "Capital", "value": "Bern"},
    {"label": "Currency", "value": "Swiss Franc (CHF)"},
    {"label": "GDP per capita", "value": "$93,000"},
    {"label": "Languages", "value": "German, French, Italian"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "L Permit (Short-term)"},
    {"type": "Work", "name": "B Permit (Residence)"},
    {"type": "Residency", "name": "C Permit (Settlement)"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "State Secretariat for Migration", "url": "https://www.sem.admin.ch/"},
    {"name": "Swiss Government", "url": "https://www.admin.ch/"}
  ]'::jsonb,
  visa_free_travel = 'Swiss passport provides visa-free access to 190+ countries, consistently ranked #1-3 globally.',
  updated_at = now()
WHERE country_slug = 'switzerland';

-- Thailand
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "70 million"},
    {"label": "Capital", "value": "Bangkok"},
    {"label": "Currency", "value": "Thai Baht (THB)"},
    {"label": "GDP per capita", "value": "$7,800"},
    {"label": "Languages", "value": "Thai"},
    {"label": "Timezone", "value": "ICT (UTC+7)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Digital Nomad", "name": "Destination Thailand Visa (DTV)"},
    {"type": "Work", "name": "Work Permit"},
    {"type": "Retirement", "name": "Retirement Visa (O-A)"},
    {"type": "Investor", "name": "BOI Investor Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Thai Immigration Bureau", "url": "https://www.immigration.go.th/"},
    {"name": "Thai Government", "url": "https://www.thaigov.go.th/"}
  ]'::jsonb,
  visa_free_travel = 'Thai passport provides visa-free access to 80+ countries.',
  updated_at = now()
WHERE country_slug = 'thailand';

-- Turkey
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "85 million"},
    {"label": "Capital", "value": "Ankara"},
    {"label": "Currency", "value": "Turkish Lira (TRY)"},
    {"label": "GDP per capita", "value": "$10,000"},
    {"label": "Languages", "value": "Turkish"},
    {"label": "Timezone", "value": "TRT (UTC+3)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "Short-term Residence"},
    {"type": "Investor", "name": "Turkish Citizenship by Investment"},
    {"type": "Study", "name": "Student Residence"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Directorate General of Migration Management", "url": "https://www.goc.gov.tr/"},
    {"name": "Turkish Government", "url": "https://www.turkiye.gov.tr/"}
  ]'::jsonb,
  visa_free_travel = 'Turkish passport provides visa-free access to 110+ countries.',
  updated_at = now()
WHERE country_slug = 'turkey';

-- Ukraine
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "38 million"},
    {"label": "Capital", "value": "Kyiv"},
    {"label": "Currency", "value": "Ukrainian Hryvnia (UAH)"},
    {"label": "GDP per capita", "value": "$4,500"},
    {"label": "Languages", "value": "Ukrainian"},
    {"label": "Timezone", "value": "EET (UTC+2)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "Temporary Residence"},
    {"type": "Digital Nomad", "name": "IT Specialist considerations"},
    {"type": "Study", "name": "Student Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "State Migration Service", "url": "https://dmsu.gov.ua/"},
    {"name": "Ukrainian Government", "url": "https://www.kmu.gov.ua/"}
  ]'::jsonb,
  visa_free_travel = 'Ukrainian passport provides visa-free access to 145+ countries.',
  updated_at = now()
WHERE country_slug = 'ukraine';

-- United Arab Emirates
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "10 million"},
    {"label": "Capital", "value": "Abu Dhabi"},
    {"label": "Currency", "value": "UAE Dirham (AED)"},
    {"label": "GDP per capita", "value": "$44,000"},
    {"label": "Languages", "value": "Arabic"},
    {"label": "Timezone", "value": "GST (UTC+4)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Employment Visa"},
    {"type": "Digital Nomad", "name": "Remote Work Visa"},
    {"type": "Investor", "name": "Golden Visa"},
    {"type": "Retirement", "name": "Retirement Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Federal Authority for Identity", "url": "https://www.icp.gov.ae/"},
    {"name": "UAE Government", "url": "https://u.ae/"}
  ]'::jsonb,
  visa_free_travel = 'UAE passport provides visa-free access to 180+ countries.',
  updated_at = now()
WHERE country_slug = 'united-arab-emirates';

-- United Kingdom
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "68 million"},
    {"label": "Capital", "value": "London"},
    {"label": "Currency", "value": "British Pound (GBP)"},
    {"label": "GDP per capita", "value": "$47,000"},
    {"label": "Languages", "value": "English"},
    {"label": "Timezone", "value": "GMT (UTC+0)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Skilled Worker Visa"},
    {"type": "Work", "name": "Global Talent Visa"},
    {"type": "Investor", "name": "Innovator Founder Visa"},
    {"type": "Study", "name": "Student Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "UK Visas and Immigration", "url": "https://www.gov.uk/government/organisations/uk-visas-and-immigration"},
    {"name": "GOV.UK", "url": "https://www.gov.uk/"}
  ]'::jsonb,
  visa_free_travel = 'UK passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'united-kingdom';

-- United States
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "335 million"},
    {"label": "Capital", "value": "Washington, D.C."},
    {"label": "Currency", "value": "US Dollar (USD)"},
    {"label": "GDP per capita", "value": "$76,000"},
    {"label": "Languages", "value": "English"},
    {"label": "Timezone", "value": "EST to PST (UTC-5 to -8)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "H-1B Skilled Worker"},
    {"type": "Work", "name": "L-1 Intracompany Transfer"},
    {"type": "Investor", "name": "EB-5 Investor Visa"},
    {"type": "Work", "name": "O-1 Extraordinary Ability"}
  ]'::jsonb,
  official_resources = '[
    {"name": "USCIS", "url": "https://www.uscis.gov/"},
    {"name": "US Department of State", "url": "https://travel.state.gov/"}
  ]'::jsonb,
  visa_free_travel = 'US passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'united-states';

-- Vietnam
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "100 million"},
    {"label": "Capital", "value": "Hanoi"},
    {"label": "Currency", "value": "Vietnamese Dong (VND)"},
    {"label": "GDP per capita", "value": "$4,200"},
    {"label": "Languages", "value": "Vietnamese"},
    {"label": "Timezone", "value": "ICT (UTC+7)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "Temporary Residence Card"},
    {"type": "Investor", "name": "Investor Visa"},
    {"type": "Study", "name": "Student Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Vietnam Immigration Department", "url": "https://xuatnhapcanh.gov.vn/"},
    {"name": "Vietnamese Government", "url": "https://www.chinhphu.vn/"}
  ]'::jsonb,
  visa_free_travel = 'Vietnamese passport provides visa-free access to 55+ countries.',
  updated_at = now()
WHERE country_slug = 'vietnam';
