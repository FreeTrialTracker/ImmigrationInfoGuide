/*
  # Batch 2: Immigration Cost Calculator Fact-Check Corrections

  ## Summary
  Updates government fee amounts in immigration_cost_profiles based on official
  fee schedules current as of early 2026. No schema changes — data corrections only.

  ## Corrections Applied

  ### Australia — Skilled Independent Visa (Subclass 189)
  - visa_fee_min/max: AUD $4,640 → $4,910
    Source: Australian Department of Home Affairs, July 2025 fee increase
  - last_verified_at updated to 2026-03-15

  ### Australia — Partner Visa (Subclass 820/801)
  - visa_fee_min/max: AUD $8,850 → $9,365
    Source: Australian Department of Home Affairs, July 2025 fee increase
  - last_verified_at updated to 2026-03-15

  ### United Kingdom — Skilled Worker Visa
  - visa_fee_min: £719 → £769 (up to 3 years, April 2025 increase)
  - visa_fee_max: £1,420 → £1,519 (over 3 years, April 2025 increase)
    Source: UK Home Office Statement of Changes, effective 9 April 2025
  - Notes updated to reflect April 2025 fee increase context
  - last_verified_at updated to 2026-03-15

  ### United States — H-1B Work Visa
  - Notes updated to include important advisory about the 2025 executive
    proclamation $100,000 additional fee that applies to H-1B petitions
    for employees of certain countries/companies. Standard petitions
    from US-based employers are not typically affected.
  - last_verified_at updated to 2026-03-15

  ### Canada — Express Entry (Federal Skilled Worker)
  - Notes corrected: Right of PR Fee is $575 (not $500) per IRCC fee schedule
  - Total principal applicant fee is $950 processing + $575 RPRF = $1,525
  - last_verified_at updated to 2026-03-15
*/

UPDATE immigration_cost_profiles
SET
  visa_fee_min = 4910.00,
  visa_fee_max = 4910.00,
  last_verified_at = '2026-03-15',
  notes = 'Skills assessment required before applying. IELTS or PTE for English proficiency. Fee increased to AUD $4,910 from July 2025. Must demonstrate settlement capacity.'
WHERE id = '11cd7325-f46c-43cd-bde0-d23d6f493365';

UPDATE immigration_cost_profiles
SET
  visa_fee_min = 9365.00,
  visa_fee_max = 9365.00,
  last_verified_at = '2026-03-15',
  notes = 'Partner visa (820/801) is a two-stage process. Subclass 820 granted first (temporary), then 801 (permanent) after 2 years. For married/de facto partners of Australian citizens or PR holders. Combined application fee of AUD $9,365 from July 2025. Processing typically 24–40 months.'
WHERE id = 'f8c7dbe1-e471-44d1-8baa-821b11ec80d2';

UPDATE immigration_cost_profiles
SET
  visa_fee_min = 769.00,
  visa_fee_max = 1519.00,
  last_verified_at = '2026-03-15',
  notes = 'Visa fee varies by duration: £769 for up to 3 years, £1,519 for over 3 years (fees updated April 2025). Immigration Health Surcharge of £1,035/year is paid upfront for the full visa duration. Certificate of Sponsorship from a licensed employer is required.'
WHERE id = '9a3fd999-e919-42c8-b379-253a96903e0e';

UPDATE immigration_cost_profiles
SET
  last_verified_at = '2026-03-15',
  notes = 'H-1B requires employer sponsorship. Standard USCIS filing fees apply (~$2,400 total for employer). H-1B registration fee: $215 per beneficiary. Important: A 2025 executive proclamation added a $100,000 additional fee for H-1B petitions from employers in certain countries — consult an immigration attorney to determine if this applies. H-4 dependent visas allow spouses and children under 21 to accompany.'
WHERE id = '97ba1ba3-9765-402b-8644-59bb3e8b47c0';

UPDATE immigration_cost_profiles
SET
  last_verified_at = '2026-03-15',
  notes = 'Principal applicant: $950 processing fee + $575 Right of PR Fee = $1,525 total. Spouse: $950 processing + $575 RPRF = $1,525. Dependent child: $150 each. Biometrics: $85 per person or $170 per family (2+ members). Fees effective per IRCC fee schedule (updated January 2026).'
WHERE id = '370441b7-9071-4b94-9f30-c0bbda375242';

UPDATE immigration_cost_profiles p
SET
  visa_fee_min = 1525.00,
  visa_fee_max = 1525.00,
  last_verified_at = '2026-03-15'
WHERE id = '370441b7-9071-4b94-9f30-c0bbda375242';
