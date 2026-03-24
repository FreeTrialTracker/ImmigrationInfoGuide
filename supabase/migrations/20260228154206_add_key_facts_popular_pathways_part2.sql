/*
  # Add Key Facts and Popular Pathways - Part 2

  1. Coverage
    - Countries C-I (Czech Republic through Italy)
*/

-- Czech Republic
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "10.5 million"},
    {"label": "Capital", "value": "Prague"},
    {"label": "Currency", "value": "Czech Koruna (CZK)"},
    {"label": "GDP per capita", "value": "$27,000"},
    {"label": "Languages", "value": "Czech"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Employee Card"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Work", "name": "Freelance Visa (Zivno)"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Interior", "url": "https://www.mvcr.cz/"},
    {"name": "Czech Government", "url": "https://www.gov.cz/"}
  ]'::jsonb,
  visa_free_travel = 'Czech passport provides visa-free access to 185+ countries with EU membership.',
  updated_at = now()
WHERE country_slug = 'czech-republic';

-- Denmark
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "5.9 million"},
    {"label": "Capital", "value": "Copenhagen"},
    {"label": "Currency", "value": "Danish Krone (DKK)"},
    {"label": "GDP per capita", "value": "$68,000"},
    {"label": "Languages", "value": "Danish"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Pay Limit Scheme"},
    {"type": "Work", "name": "Fast-track Scheme"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Study", "name": "Student Residence"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Danish Immigration Service", "url": "https://www.nyidanmark.dk/"},
    {"name": "Work in Denmark", "url": "https://www.workindenmark.dk/"}
  ]'::jsonb,
  visa_free_travel = 'Danish passport provides visa-free access to 190+ countries, one of the strongest globally.',
  updated_at = now()
WHERE country_slug = 'denmark';

-- Egypt
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "105 million"},
    {"label": "Capital", "value": "Cairo"},
    {"label": "Currency", "value": "Egyptian Pound (EGP)"},
    {"label": "GDP per capita", "value": "$3,600"},
    {"label": "Languages", "value": "Arabic"},
    {"label": "Timezone", "value": "EET (UTC+2)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "Residence Visa"},
    {"type": "Investor", "name": "Investor Residence"},
    {"type": "Retirement", "name": "Retirement Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Interior", "url": "https://www.moi.gov.eg/"},
    {"name": "Egypt Immigration", "url": "https://www.immigration.gov.eg/"}
  ]'::jsonb,
  visa_free_travel = 'Egyptian passport provides visa-free access to 50+ countries.',
  updated_at = now()
WHERE country_slug = 'egypt';

-- Finland
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "5.5 million"},
    {"label": "Capital", "value": "Helsinki"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$55,000"},
    {"label": "Languages", "value": "Finnish, Swedish"},
    {"label": "Timezone", "value": "EET (UTC+2)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Specialist Residence Permit"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Work", "name": "Startup Permit"},
    {"type": "Study", "name": "Student Residence"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Finnish Immigration Service", "url": "https://migri.fi/"},
    {"name": "Work in Finland", "url": "https://www.tyosuomi.fi/"}
  ]'::jsonb,
  visa_free_travel = 'Finnish passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'finland';

-- France
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "68 million"},
    {"label": "Capital", "value": "Paris"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$45,000"},
    {"label": "Languages", "value": "French"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Talent Passport"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Work", "name": "Skills and Talents"},
    {"type": "Investor", "name": "Investor Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "France-Visas", "url": "https://france-visas.gouv.fr/"},
    {"name": "Ministry of Interior", "url": "https://www.interieur.gouv.fr/"}
  ]'::jsonb,
  visa_free_travel = 'French passport provides visa-free access to 190+ countries, one of the world''s strongest.',
  updated_at = now()
WHERE country_slug = 'france';

-- Germany
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "84 million"},
    {"label": "Capital", "value": "Berlin"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$54,000"},
    {"label": "Languages", "value": "German"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "EU Blue Card"},
    {"type": "Work", "name": "Skilled Worker Visa"},
    {"type": "Work", "name": "Job Seeker Visa"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Federal Foreign Office", "url": "https://www.auswaertiges-amt.de/"},
    {"name": "Make it in Germany", "url": "https://www.make-it-in-germany.com/"}
  ]'::jsonb,
  visa_free_travel = 'German passport provides visa-free access to 190+ countries, consistently ranked #1 globally.',
  updated_at = now()
WHERE country_slug = 'germany';

-- Greece
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "10.5 million"},
    {"label": "Capital", "value": "Athens"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$20,000"},
    {"label": "Languages", "value": "Greek"},
    {"label": "Timezone", "value": "EET (UTC+2)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Digital Nomad", "name": "Digital Nomad Visa"},
    {"type": "Work", "name": "Work Permit"},
    {"type": "Investor", "name": "Golden Visa"},
    {"type": "Residency", "name": "EU Blue Card"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Migration", "url": "https://migration.gov.gr/"},
    {"name": "Greek Government", "url": "https://www.gov.gr/"}
  ]'::jsonb,
  visa_free_travel = 'Greek passport provides visa-free access to 185+ countries with EU membership.',
  updated_at = now()
WHERE country_slug = 'greece';

-- Hungary
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "9.7 million"},
    {"label": "Capital", "value": "Budapest"},
    {"label": "Currency", "value": "Hungarian Forint (HUF)"},
    {"label": "GDP per capita", "value": "$19,000"},
    {"label": "Languages", "value": "Hungarian"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Permit"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Digital Nomad", "name": "Digital Nomad Visa (White Card)"},
    {"type": "Investor", "name": "Golden Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Immigration Office", "url": "http://www.bmbah.hu/"},
    {"name": "Hungarian Government", "url": "https://kormany.hu/"}
  ]'::jsonb,
  visa_free_travel = 'Hungarian passport provides visa-free access to 185+ countries with EU membership.',
  updated_at = now()
WHERE country_slug = 'hungary';

-- India
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "1.4 billion"},
    {"label": "Capital", "value": "New Delhi"},
    {"label": "Currency", "value": "Indian Rupee (INR)"},
    {"label": "GDP per capita", "value": "$2,400"},
    {"label": "Languages", "value": "Hindi, English"},
    {"label": "Timezone", "value": "IST (UTC+5:30)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Employment Visa"},
    {"type": "Work", "name": "Skilled Worker Visa"},
    {"type": "Study", "name": "Student Visa"},
    {"type": "Investor", "name": "Business Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Bureau of Immigration", "url": "https://boi.gov.in/"},
    {"name": "Ministry of Home Affairs", "url": "https://www.mha.gov.in/"}
  ]'::jsonb,
  visa_free_travel = 'Indian passport provides visa-free access to 60+ countries.',
  updated_at = now()
WHERE country_slug = 'india';

-- Indonesia
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "275 million"},
    {"label": "Capital", "value": "Jakarta"},
    {"label": "Currency", "value": "Indonesian Rupiah (IDR)"},
    {"label": "GDP per capita", "value": "$4,800"},
    {"label": "Languages", "value": "Indonesian"},
    {"label": "Timezone", "value": "WIB (UTC+7)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Digital Nomad", "name": "Digital Nomad Visa (B211A)"},
    {"type": "Work", "name": "Work Permit (KITAS)"},
    {"type": "Retirement", "name": "Retirement Visa"},
    {"type": "Investor", "name": "Investor KITAS"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Directorate General of Immigration", "url": "https://www.imigrasi.go.id/"},
    {"name": "Indonesia.go.id", "url": "https://www.indonesia.go.id/"}
  ]'::jsonb,
  visa_free_travel = 'Indonesian passport provides visa-free access to 70+ countries.',
  updated_at = now()
WHERE country_slug = 'indonesia';

-- Ireland
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "5.1 million"},
    {"label": "Capital", "value": "Dublin"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$99,000"},
    {"label": "Languages", "value": "English, Irish"},
    {"label": "Timezone", "value": "GMT (UTC+0)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Critical Skills Employment Permit"},
    {"type": "Work", "name": "General Employment Permit"},
    {"type": "Residency", "name": "Stamp 4 Residency"},
    {"type": "Investor", "name": "Immigrant Investor Programme"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Irish Immigration Service", "url": "http://www.inis.gov.ie/"},
    {"name": "Department of Enterprise", "url": "https://enterprise.gov.ie/"}
  ]'::jsonb,
  visa_free_travel = 'Irish passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'ireland';

-- Israel
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "9.5 million"},
    {"label": "Capital", "value": "Jerusalem"},
    {"label": "Currency", "value": "New Israeli Shekel (ILS)"},
    {"label": "GDP per capita", "value": "$55,000"},
    {"label": "Languages", "value": "Hebrew, Arabic"},
    {"label": "Timezone", "value": "IST (UTC+2)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "B-1 Work Visa"},
    {"type": "Work", "name": "Expert Worker Visa"},
    {"type": "Investor", "name": "Investor Visa"},
    {"type": "Study", "name": "Student Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Population and Immigration Authority", "url": "https://www.gov.il/en/departments/piba"},
    {"name": "Ministry of Interior", "url": "https://www.gov.il/en/departments/ministry_of_interior"}
  ]'::jsonb,
  visa_free_travel = 'Israeli passport provides visa-free access to 165+ countries.',
  updated_at = now()
WHERE country_slug = 'israel';

-- Italy
UPDATE country_guides SET
  key_facts = '[
    {"label": "Population", "value": "59 million"},
    {"label": "Capital", "value": "Rome"},
    {"label": "Currency", "value": "Euro (EUR)"},
    {"label": "GDP per capita", "value": "$37,000"},
    {"label": "Languages", "value": "Italian"},
    {"label": "Timezone", "value": "CET (UTC+1)"}
  ]'::jsonb,
  popular_pathways = '[
    {"type": "Work", "name": "Work Visa (Nulla Osta)"},
    {"type": "Residency", "name": "EU Blue Card"},
    {"type": "Digital Nomad", "name": "Digital Nomad Visa"},
    {"type": "Investor", "name": "Investor Visa"}
  ]'::jsonb,
  official_resources = '[
    {"name": "Ministry of Interior", "url": "https://www.interno.gov.it/"},
    {"name": "Italian Immigration Portal", "url": "https://www.portaleimmigrazione.it/"}
  ]'::jsonb,
  visa_free_travel = 'Italian passport provides visa-free access to 190+ countries.',
  updated_at = now()
WHERE country_slug = 'italy';
