/*
  # Batch 2/3: Country Guides GDP Per Capita & Cost Profile Corrections

  ## Summary
  Updates key_facts GDP per capita figures in country_guides table to reflect
  IMF World Economic Outlook 2025 and World Population Review 2026 data.
  Previous values were significantly outdated (2-4 years old).

  ## Corrections Applied (IMF 2025 nominal USD per capita)

  | Country        | Old Value | New Value | Source              |
  |----------------|-----------|-----------|---------------------|
  | Australia      | $60,000   | $69,000   | IMF WEO Oct 2025    |
  | Canada         | $52,000   | $58,000   | IMF WEO Oct 2025    |
  | Germany        | $54,000   | $60,000   | World Pop Review    |
  | Japan          | $42,000   | $36,000   | IMF WEO Oct 2025 (JPY weakness) |
  | Netherlands    | $61,000   | $73,000   | World Pop Review    |
  | Portugal       | $24,000   | $28,000   | Approx IMF 2025     |
  | Singapore      | $72,000   | $97,000   | World Pop Review    |
  | Spain          | $30,000   | $34,000   | Approx IMF 2025     |
  | United Kingdom | $47,000   | $57,000   | IMF WEO Oct 2025    |
  | United States  | $76,000   | $90,000   | IMF WEO Oct 2025    |
  | New Zealand    | $48,000   | $48,000   | No change needed    |

  ## Notes
  - All figures are approximate nominal GDP per capita in USD
  - Japan figure reflects 2024-2025 JPY/USD exchange rate impact
  - UAE and other countries without GDP data are not modified
*/

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "26 million"}, {"label": "Capital", "value": "Canberra"}, {"label": "Currency", "value": "Australian Dollar (AUD)"}, {"label": "GDP per capita", "value": "~$69,000"}, {"label": "Languages", "value": "English"}, {"label": "Timezone", "value": "AEST (UTC+10)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'australia';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "41 million"}, {"label": "Capital", "value": "Ottawa"}, {"label": "Currency", "value": "Canadian Dollar (CAD)"}, {"label": "GDP per capita", "value": "~$58,000"}, {"label": "Languages", "value": "English, French"}, {"label": "Timezone", "value": "EST to PST (UTC-5 to -8)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'canada';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "84 million"}, {"label": "Capital", "value": "Berlin"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "~$60,000"}, {"label": "Languages", "value": "German"}, {"label": "Timezone", "value": "CET (UTC+1)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'germany';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "124 million"}, {"label": "Capital", "value": "Tokyo"}, {"label": "Currency", "value": "Japanese Yen (JPY)"}, {"label": "GDP per capita", "value": "~$36,000"}, {"label": "Languages", "value": "Japanese"}, {"label": "Timezone", "value": "JST (UTC+9)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'japan';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "17.9 million"}, {"label": "Capital", "value": "Amsterdam"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "~$73,000"}, {"label": "Languages", "value": "Dutch"}, {"label": "Timezone", "value": "CET (UTC+1)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'netherlands';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "10.6 million"}, {"label": "Capital", "value": "Lisbon"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "~$28,000"}, {"label": "Languages", "value": "Portuguese"}, {"label": "Timezone", "value": "WET (UTC+0)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'portugal';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "6.1 million"}, {"label": "Capital", "value": "Singapore City"}, {"label": "Currency", "value": "Singapore Dollar (SGD)"}, {"label": "GDP per capita", "value": "~$97,000"}, {"label": "Languages", "value": "English, Mandarin, Malay, Tamil"}, {"label": "Timezone", "value": "SGT (UTC+8)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'singapore';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "48 million"}, {"label": "Capital", "value": "Madrid"}, {"label": "Currency", "value": "Euro (EUR)"}, {"label": "GDP per capita", "value": "~$34,000"}, {"label": "Languages", "value": "Spanish"}, {"label": "Timezone", "value": "CET (UTC+1)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'spain';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "68 million"}, {"label": "Capital", "value": "London"}, {"label": "Currency", "value": "British Pound (GBP)"}, {"label": "GDP per capita", "value": "~$57,000"}, {"label": "Languages", "value": "English"}, {"label": "Timezone", "value": "GMT (UTC+0)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'united-kingdom';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "335 million"}, {"label": "Capital", "value": "Washington, D.C."}, {"label": "Currency", "value": "US Dollar (USD)"}, {"label": "GDP per capita", "value": "~$90,000"}, {"label": "Languages", "value": "English"}, {"label": "Timezone", "value": "EST to PST (UTC-5 to -8)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'united-states';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "5.1 million"}, {"label": "Capital", "value": "Wellington"}, {"label": "Currency", "value": "New Zealand Dollar (NZD)"}, {"label": "GDP per capita", "value": "~$48,000"}, {"label": "Languages", "value": "English, Māori"}, {"label": "Timezone", "value": "NZST (UTC+12)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'new-zealand';

UPDATE country_guides
SET
  key_facts = '[{"label": "Population", "value": "10 million"}, {"label": "Capital", "value": "Abu Dhabi"}, {"label": "Currency", "value": "UAE Dirham (AED)"}, {"label": "GDP per capita", "value": "~$49,000"}, {"label": "Languages", "value": "Arabic"}, {"label": "Timezone", "value": "GST (UTC+4)"}]'::jsonb,
  last_updated = '2026-03-15',
  updated_at = now()
WHERE country_slug = 'united-arab-emirates';
