/*
  # Update immigration_pathways table schema

  ## Overview
  Updates the existing `immigration_pathways` table to use the correct column names and add missing columns.

  ## Changes
  1. Rename `goal` to `pathway_type`
  2. Rename `key_requirements` to `requirements`
  3. Rename `typical_timeline` to `processing_time`
  4. Rename `estimated_fees` to leave as is (for future use)
  5. Rename `official_links` to `official_url` (convert from jsonb to text)
  6. Add `validity_period` column
  7. Add `updated_at` column
  8. Add indexes for performance
  9. Add updated_at trigger
  10. Update RLS policies

  ## Security
  - Maintain public read access
  - Block all client-side writes
*/

-- Add new columns if they don't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'immigration_pathways' AND column_name = 'pathway_type'
  ) THEN
    ALTER TABLE public.immigration_pathways ADD COLUMN pathway_type text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'immigration_pathways' AND column_name = 'requirements'
  ) THEN
    ALTER TABLE public.immigration_pathways ADD COLUMN requirements text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'immigration_pathways' AND column_name = 'processing_time'
  ) THEN
    ALTER TABLE public.immigration_pathways ADD COLUMN processing_time text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'immigration_pathways' AND column_name = 'validity_period'
  ) THEN
    ALTER TABLE public.immigration_pathways ADD COLUMN validity_period text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'immigration_pathways' AND column_name = 'official_url'
  ) THEN
    ALTER TABLE public.immigration_pathways ADD COLUMN official_url text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'immigration_pathways' AND column_name = 'updated_at'
  ) THEN
    ALTER TABLE public.immigration_pathways ADD COLUMN updated_at timestamptz NOT NULL DEFAULT now();
  END IF;
END $$;

-- Copy data from old columns to new columns if pathway_type is empty
UPDATE public.immigration_pathways
SET pathway_type = goal
WHERE pathway_type IS NULL AND goal IS NOT NULL;

UPDATE public.immigration_pathways
SET requirements = key_requirements
WHERE requirements IS NULL AND key_requirements IS NOT NULL;

UPDATE public.immigration_pathways
SET processing_time = typical_timeline
WHERE processing_time IS NULL AND typical_timeline IS NOT NULL;

-- Convert official_links jsonb to official_url text (take first URL if available)
UPDATE public.immigration_pathways
SET official_url = official_links->>0
WHERE official_url IS NULL 
  AND official_links IS NOT NULL 
  AND jsonb_array_length(official_links) > 0;

-- Create indexes for query performance
CREATE INDEX IF NOT EXISTS immigration_pathways_dest_idx
  ON public.immigration_pathways (destination_slug);

CREATE INDEX IF NOT EXISTS immigration_pathways_pass_dest_idx
  ON public.immigration_pathways (passport_slug, destination_slug);

CREATE INDEX IF NOT EXISTS immigration_pathways_dest_type_idx
  ON public.immigration_pathways (destination_slug, pathway_type);

-- Create function for automatic updated_at timestamp
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

-- Create trigger for updated_at
DROP TRIGGER IF EXISTS trg_immigration_pathways_updated_at ON public.immigration_pathways;

CREATE TRIGGER trg_immigration_pathways_updated_at
  BEFORE UPDATE ON public.immigration_pathways
  FOR EACH ROW
  EXECUTE FUNCTION public.set_updated_at();

-- Enable RLS if not already enabled
ALTER TABLE public.immigration_pathways ENABLE ROW LEVEL SECURITY;

-- Public read policy
DROP POLICY IF EXISTS "Public read immigration_pathways" ON public.immigration_pathways;
CREATE POLICY "Public read immigration_pathways"
  ON public.immigration_pathways
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- Block client-side insert
DROP POLICY IF EXISTS "Block anon insert immigration_pathways" ON public.immigration_pathways;
CREATE POLICY "Block anon insert immigration_pathways"
  ON public.immigration_pathways
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (false);

-- Block client-side update
DROP POLICY IF EXISTS "Block anon update immigration_pathways" ON public.immigration_pathways;
CREATE POLICY "Block anon update immigration_pathways"
  ON public.immigration_pathways
  FOR UPDATE
  TO anon, authenticated
  USING (false);

-- Block client-side delete
DROP POLICY IF EXISTS "Block anon delete immigration_pathways" ON public.immigration_pathways;
CREATE POLICY "Block anon delete immigration_pathways"
  ON public.immigration_pathways
  FOR DELETE
  TO anon, authenticated
  USING (false);
