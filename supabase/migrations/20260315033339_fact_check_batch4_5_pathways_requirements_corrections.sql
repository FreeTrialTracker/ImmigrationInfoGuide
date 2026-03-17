/*
  # Batch 4 & 5: Immigration Pathways and Visa Requirements Fact-Check Corrections

  ## Summary
  Corrects income thresholds, fee figures, and descriptive summaries across the
  immigration_pathways and visa_requirements tables. No schema changes.

  ## Corrections Applied

  ### immigration_pathways table

  1. Thailand LTR Work-from-Thailand summary:
     - Removes incorrect "$80,000/year" income requirement (removed by Thai Cabinet Jan 2025)
     - Updated to reflect 2026 status

  2. Thailand DTV min_income_requirement_usd:
     - $2,500 → $2,000/month (~$24,000/year, per Thai embassy guidance)
     - Summary enhanced with accurate DTV details (5-year, 180-day stays)

  3. Portugal D8: min_income_requirement_usd null → $4,000 (€3,680/month in 2026)
  4. Portugal D7: min_income_requirement_usd null → $1,000 (€920/month in 2026)
  5. Spain Digital Nomad: min_income_requirement_usd null → $3,100 (€2,849/month in 2026)

  ### visa_requirements table

  1. Netherlands HSM: min_income_usd $4,752 → $6,500; notes updated to 2026 thresholds
  2. Portugal D8: min_income_usd $3,480 → $4,000; notes updated to 2026 figures
  3. Portugal D3: notes updated (1.5× €920 = €1,380/month in 2026)
  4. Spain Digital Nomad: min_income_usd $2,646 → $3,100; notes updated to 2026 SMI
  5. Germany Student: min_savings_usd updated; notes corrected to €11,904 (not €11,208)
  6. UK Family Visa: notes clarified £38,700 is already in effect (2024); min_income_usd updated
  7. Thailand LTR: notes updated — Work-from-Thailand income requirement removed Jan 2025
*/

UPDATE immigration_pathways
SET
  summary = 'Thailand''s LTR Visa (launched 2022, updated January 2025) allows professionals and remote workers to live in Thailand for up to 10 years. Following a Thai Cabinet revision in January 2025, the Work-from-Thailand Professional category no longer has a minimum income requirement. The Wealthy Global Citizen category retains a $80,000/year income threshold (or $40,000/year with $250,000+ in assets). All LTR holders receive exemption on foreign-sourced income (a protected category under Thailand''s 2024 tax law changes).',
  updated_at = now()
WHERE id = '24b11641-207a-47a0-9793-f7c548ad9961';

UPDATE immigration_pathways
SET
  min_income_requirement_usd = 2000,
  summary = 'Thailand''s Destination Thailand Visa (DTV), launched July 2024, is the primary digital nomad option for remote workers. 5-year multiple-entry visa allowing 180-day stays (extendable once to 180 days). Requires approximately $24,000/year (~$2,000/month) in provable remote income from non-Thai sources. Fee: THB 10,000 (~$280). Does not require Thai employment. A more accessible option than the LTR Visa which targets higher-income categories.',
  updated_at = now()
WHERE id = 'f83bc733-e17c-455c-8255-6267da5b5d69';

UPDATE immigration_pathways
SET min_income_requirement_usd = 4000, updated_at = now()
WHERE id = '377ebdf1-0451-4eef-90ba-1a590336c6c4';

UPDATE immigration_pathways
SET min_income_requirement_usd = 1000, updated_at = now()
WHERE id = '6de8246a-a7f5-40f0-b306-1aa65aa57718';

UPDATE immigration_pathways
SET min_income_requirement_usd = 3100, updated_at = now()
WHERE id = '0f22a405-b3e0-4b1d-9591-8554dd5b036b';

UPDATE visa_requirements
SET
  min_income_usd = 6500,
  notes = 'Employer must be IND-recognised sponsor. Salary thresholds effective January 2026: €5,942/month gross (age 30+), €4,357/month gross (under 30), both excluding 8% holiday allowance. Fast-track IND processing typically 2 weeks.'
WHERE country_slug = 'netherlands' AND visa_type = 'Highly Skilled Migrant (Kennismigrant)';

UPDATE visa_requirements
SET
  min_income_usd = 4000,
  notes = 'Monthly income must be 4× Portuguese minimum wage. In 2026, the minimum wage is €920/month, making the D8 threshold €3,680/month (~$4,000 USD). Initial 4-month visa; convert to 2-year residence permit at AIMA in Portugal. AIMA appointment backlogs can add several months to the overall timeline.'
WHERE country_slug = 'portugal' AND visa_type = 'Digital Nomad Visa (D8)';

UPDATE visa_requirements
SET
  notes = 'For highly qualified workers. Leads to 2-year residence permit. Must earn at least 1.5× minimum wage (~€1,380/month in 2026, based on the updated minimum wage of €920/month). Occupation must qualify as a highly qualified activity under Portuguese immigration law.'
WHERE country_slug = 'portugal' AND visa_type = 'D3 Highly Qualified Activity Visa';

UPDATE visa_requirements
SET
  min_income_usd = 3100,
  notes = 'Income must be 200% of monthly Spanish SMI (Salario Mínimo Interprofesional). The 2026 SMI increase raised this threshold to €2,849/month (~$3,100 USD) for a single applicant. Maximum 20% of total income may come from Spanish clients. 1-year visa extendable to 3-year residence permit. Beckham Law: 24% flat tax rate for up to 6 years for qualifying applicants.'
WHERE country_slug = 'spain' AND visa_type = 'Digital Nomad Visa';

UPDATE visa_requirements
SET
  min_savings_usd = 13000,
  notes = 'Blocked account (Sperrkonto) of €11,904/year (€992/month × 12) required as of January 2025. Previous amount of €11,208 is outdated. Free tuition at most public German universities. English-taught programmes widely available. IELTS/TOEFL accepted for English-taught degrees; German B2/C1 for German-taught programmes.'
WHERE country_slug = 'germany' AND visa_type = 'Student Visa (Studienvisum)';

UPDATE visa_requirements
SET
  min_income_usd = 50000,
  notes = 'UK sponsor (partner/spouse) must earn at least £38,700/year — this threshold has been in effect since 2024. Both partners must be 18+. Initial 2.5-year visa, then further leave, then settlement (ILR) after 5 years. Immigration Health Surcharge of £1,035/year applies on top of the visa fee.'
WHERE country_slug = 'united-kingdom' AND visa_type = 'Family Visa (Partner Route)';

UPDATE visa_requirements
SET
  notes = 'Work-from-Thailand Professional category: minimum income requirement removed January 2025 (Thai Cabinet revision). Wealthy Global Citizen category: $80,000/year income (or $40,000/year + $250,000 in assets). 10-year visa (2 × 5 years). All LTR holders receive foreign-sourced income tax exemption as a protected category under Thailand''s 2024 tax rules.'
WHERE country_slug = 'thailand' AND visa_type = 'Long Term Resident (LTR) Visa';
