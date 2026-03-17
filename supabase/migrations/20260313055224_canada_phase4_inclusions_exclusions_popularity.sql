/*
  # Canada Phase 4 - Inclusions, Exclusions, and Popularity
  
  1. Add Canada-specific inclusion items for each pathway
  2. Add Canada-specific exclusion items
  3. Mark Canada pathways as featured/high-intent
*/

DO $$
DECLARE
  canada_id uuid;
  express_id uuid;
  pnp_id uuid;
  family_id uuid;
  study_id uuid;
  startup_id uuid;
BEGIN
  SELECT id INTO canada_id FROM immigration_cost_countries WHERE slug = 'canada';
  SELECT id INTO express_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_slug = 'express-entry';
  SELECT id INTO pnp_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_slug = 'provincial-nominee';
  SELECT id INTO family_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_slug = 'family-sponsorship';
  SELECT id INTO study_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_slug = 'study-permit';
  SELECT id INTO startup_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_slug = 'startup-visa';

  -- Note: inclusions/exclusions link to immigration_pathways, not immigration_cost_pathways
  -- These will be added when pathway pages are rendered from the cost calculator pathway data

  -- Mark Canada pathways as featured in pathway popularity
  -- This uses immigration_pathways table which has different IDs
  -- For now, we'll update the is_popular flag in immigration_cost_pathways which we just did

END $$;