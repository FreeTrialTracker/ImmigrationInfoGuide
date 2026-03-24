/*
  # Upgrade Immigration Cost Calculator Schema - Part 1: Profile Extensions
  
  1. Schema Changes
    - Add trust and verification fields to immigration_cost_profiles
    - Add fee model tracking
    - Add review scheduling fields
    - Add assumption notes for transparency
  
  2. New Columns Added
    - fee_model: tracks whether fees are exact, range, mixed, or unknown
    - verification_status: tracks data quality level
    - official_fee_url: link to government source
    - official_fee_notes: context about official fees
    - review_priority: helps prioritize manual review
    - update_frequency_days: expected update cadence
    - next_review_due_at: scheduled review date
    - source_currency_note: clarification on currency conversions
    - relocation_assumption_note: explains relocation cost basis
    - legal_assumption_note: explains legal fee assumptions
    - settlement_assumption_note: explains settlement buffer logic
  
  3. Security
    - No RLS changes needed (existing policies remain)
*/

-- Add new columns to immigration_cost_profiles if they don't exist
DO $$
BEGIN
  -- fee_model column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'fee_model'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN fee_model text DEFAULT 'range' CHECK (fee_model IN ('exact', 'range', 'mixed', 'unknown'));
  END IF;

  -- verification_status column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'verification_status'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN verification_status text DEFAULT 'estimated' CHECK (verification_status IN ('official', 'editorial_reviewed', 'estimated', 'needs_review'));
  END IF;

  -- official_fee_url column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'official_fee_url'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN official_fee_url text;
  END IF;

  -- official_fee_notes column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'official_fee_notes'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN official_fee_notes text;
  END IF;

  -- review_priority column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'review_priority'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN review_priority integer DEFAULT 0;
  END IF;

  -- update_frequency_days column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'update_frequency_days'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN update_frequency_days integer DEFAULT 180;
  END IF;

  -- next_review_due_at column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'next_review_due_at'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN next_review_due_at date;
  END IF;

  -- source_currency_note column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'source_currency_note'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN source_currency_note text;
  END IF;

  -- relocation_assumption_note column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'relocation_assumption_note'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN relocation_assumption_note text;
  END IF;

  -- legal_assumption_note column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'legal_assumption_note'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN legal_assumption_note text;
  END IF;

  -- settlement_assumption_note column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'immigration_cost_profiles' AND column_name = 'settlement_assumption_note'
  ) THEN
    ALTER TABLE immigration_cost_profiles 
    ADD COLUMN settlement_assumption_note text;
  END IF;
END $$;

-- Create index on review_priority for admin queries
CREATE INDEX IF NOT EXISTS immigration_cost_profiles_review_priority_idx 
ON immigration_cost_profiles(review_priority DESC);

-- Create index on next_review_due_at for maintenance queries
CREATE INDEX IF NOT EXISTS immigration_cost_profiles_next_review_idx 
ON immigration_cost_profiles(next_review_due_at) 
WHERE next_review_due_at IS NOT NULL;