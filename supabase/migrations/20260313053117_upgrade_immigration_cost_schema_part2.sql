/*
  # Upgrade Immigration Cost Calculator Schema - Part 2: New Support Tables
  
  1. New Tables
    - immigration_cost_inclusions: explicit list of what's included
    - immigration_cost_exclusions: explicit list of what's not included
    - immigration_cost_change_log: track fee changes over time
    - immigration_pathway_popularity: track featured and popular pathways
  
  2. Purpose
    - Inclusions/exclusions provide transparency
    - Change log enables editorial tracking
    - Popularity helps rank and feature pathways
  
  3. Security
    - Enable RLS on all new tables
    - Add appropriate access policies
*/

-- Create immigration_cost_inclusions table
CREATE TABLE IF NOT EXISTS immigration_cost_inclusions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid NOT NULL REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  label text NOT NULL,
  description text,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create immigration_cost_exclusions table
CREATE TABLE IF NOT EXISTS immigration_cost_exclusions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid NOT NULL REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  label text NOT NULL,
  description text,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create immigration_cost_change_log table
CREATE TABLE IF NOT EXISTS immigration_cost_change_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid NOT NULL REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  changed_field text NOT NULL,
  old_value text,
  new_value text,
  change_reason text,
  changed_by text,
  changed_at timestamptz DEFAULT now()
);

-- Create immigration_pathway_popularity table
CREATE TABLE IF NOT EXISTS immigration_pathway_popularity (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pathway_id uuid NOT NULL UNIQUE REFERENCES immigration_pathways(id) ON DELETE CASCADE,
  popularity_score integer DEFAULT 0,
  is_featured boolean DEFAULT false,
  is_high_intent boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create indexes
CREATE INDEX IF NOT EXISTS immigration_cost_inclusions_pathway_idx 
ON immigration_cost_inclusions(pathway_id, display_order);

CREATE INDEX IF NOT EXISTS immigration_cost_exclusions_pathway_idx 
ON immigration_cost_exclusions(pathway_id, display_order);

CREATE INDEX IF NOT EXISTS immigration_cost_change_log_pathway_idx 
ON immigration_cost_change_log(pathway_id);

CREATE INDEX IF NOT EXISTS immigration_cost_change_log_changed_at_idx 
ON immigration_cost_change_log(changed_at DESC);

CREATE INDEX IF NOT EXISTS immigration_pathway_popularity_score_idx 
ON immigration_pathway_popularity(popularity_score DESC);

CREATE INDEX IF NOT EXISTS immigration_pathway_popularity_featured_idx 
ON immigration_pathway_popularity(is_featured) 
WHERE is_featured = true;

-- Enable RLS
ALTER TABLE immigration_cost_inclusions ENABLE ROW LEVEL SECURITY;
ALTER TABLE immigration_cost_exclusions ENABLE ROW LEVEL SECURITY;
ALTER TABLE immigration_cost_change_log ENABLE ROW LEVEL SECURITY;
ALTER TABLE immigration_pathway_popularity ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access
CREATE POLICY "Allow public read access to inclusions"
  ON immigration_cost_inclusions FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Allow public read access to exclusions"
  ON immigration_cost_exclusions FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Allow public read access to change log"
  ON immigration_cost_change_log FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Allow public read access to popularity"
  ON immigration_pathway_popularity FOR SELECT
  TO anon, authenticated
  USING (true);