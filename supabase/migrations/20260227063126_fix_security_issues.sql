/*
  # Fix Security and Performance Issues

  1. Index Cleanup
    - Remove all unused indexes on immigration_pathways table
    - Keep only necessary indexes for actual query patterns
    
  2. RLS Policy Cleanup
    - Remove duplicate permissive policies for SELECT operations
    - Keep single, clear policy for public read access
    
  3. Function Security
    - Fix set_updated_at function to use immutable search_path

  ## Changes Made
  
  ### Dropped Unused Indexes
  - `idx_immigration_pathways_passport` (unused)
  - `idx_immigration_pathways_destination` (unused)
  - `idx_immigration_pathways_goal` (unused)
  - `idx_immigration_pathways_lookup` (unused)
  - `immigration_pathways_dest_idx` (duplicate of idx_immigration_pathways_destination)
  - `immigration_pathways_pass_dest_idx` (unused)
  - `immigration_pathways_dest_type_idx` (unused)
  
  ### Removed Duplicate Policies
  - Dropped older duplicate SELECT policies
  - Kept single consolidated public read policy
  
  ### Fixed Function Security
  - Updated set_updated_at function with stable search_path
*/

-- Drop all unused and duplicate indexes
DROP INDEX IF EXISTS idx_immigration_pathways_passport;
DROP INDEX IF EXISTS idx_immigration_pathways_destination;
DROP INDEX IF EXISTS idx_immigration_pathways_goal;
DROP INDEX IF EXISTS idx_immigration_pathways_lookup;
DROP INDEX IF EXISTS immigration_pathways_dest_idx;
DROP INDEX IF EXISTS immigration_pathways_pass_dest_idx;
DROP INDEX IF EXISTS immigration_pathways_dest_type_idx;

-- Remove duplicate RLS policies on immigration_pathways
-- Keep only the most recent/appropriate policy
DROP POLICY IF EXISTS "Allow public read access to immigration pathways" ON immigration_pathways;

-- Ensure we have one clear public read policy
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'immigration_pathways' 
    AND policyname = 'Public read immigration_pathways'
  ) THEN
    CREATE POLICY "Public read immigration_pathways"
      ON immigration_pathways
      FOR SELECT
      TO public
      USING (true);
  END IF;
END $$;

-- Fix the set_updated_at function to use immutable search_path
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;
