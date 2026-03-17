/*
  # Update verification dates for fact-checked pathways

  Updates last_updated and updated_at timestamps for two pathways that were
  fact-checked and corrected but whose last_updated date was not advanced:

  - Netherlands Highly Skilled Migrant Visa (73882e6b): salary threshold corrected
    to 2026 IND figures — last_updated was 2026-03-13, advancing to 2026-03-15
  - Thailand Digital Nomad Visa DTV (f83bc733): min income corrected $2,500→$2,000
    — last_updated was 2026-02-28, advancing to 2026-03-15
*/

UPDATE immigration_pathways
SET
  last_updated = '2026-03-15',
  updated_at   = now()
WHERE id IN (
  '73882e6b-27db-45ae-b566-74c2974974e9',
  'f83bc733-e17c-455c-8255-6267da5b5d69'
);
