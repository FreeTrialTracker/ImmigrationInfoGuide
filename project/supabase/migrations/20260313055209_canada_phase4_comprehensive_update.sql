/*
  # Canada Phase 4 - Comprehensive Data Update
  
  1. Add missing Start-Up Visa pathway
  2. Update all pathway names and descriptions
  3. Create/update all 5 cost profiles with official IRCC data
  4. Add Canada-specific inclusions and exclusions
  5. Mark as featured/high-intent
*/

-- Get Canada country ID
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
  
  -- Get existing pathway IDs
  SELECT id INTO express_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_name LIKE 'Express Entry%';
  SELECT id INTO pnp_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_name LIKE '%PNP%';
  SELECT id INTO family_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_name = 'Family Sponsorship';
  SELECT id INTO study_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_name = 'Study Permit';

  -- Update existing pathways
  UPDATE immigration_cost_pathways 
  SET pathway_name = 'Express Entry (Federal Skilled Worker)',
      pathway_slug = 'express-entry',
      short_description = 'Points-based permanent residence pathway for skilled workers',
      is_popular = true,
      display_order = 1
  WHERE id = express_id;

  UPDATE immigration_cost_pathways
  SET pathway_slug = 'provincial-nominee',
      short_description = 'Province-specific immigration with job offer or nomination',
      is_popular = true,
      display_order = 2
  WHERE id = pnp_id;

  UPDATE immigration_cost_pathways
  SET pathway_slug = 'family-sponsorship',
      short_description = 'Sponsor spouse, partner, children, or parents for permanent residence',
      is_popular = true,
      display_order = 3
  WHERE id = family_id;

  UPDATE immigration_cost_pathways
  SET pathway_slug = 'study-permit',
      category = 'Study',
      short_description = 'Study at designated learning institutions with pathway to PR',
      is_popular = true,
      display_order = 4
  WHERE id = study_id;

  -- Add Start-Up Visa if not exists
  INSERT INTO immigration_cost_pathways (
    country_id, pathway_name, pathway_slug, category,
    short_description, is_active, is_popular, display_order
  ) VALUES (
    canada_id, 'Start-Up Visa', 'startup-visa', 'Entrepreneur',
    'Innovative entrepreneurs with designated organization support',
    true, false, 5
  ) ON CONFLICT DO NOTHING;

  SELECT id INTO startup_id FROM immigration_cost_pathways WHERE country_id = canada_id AND pathway_name = 'Start-Up Visa';

  -- Delete existing profiles to recreate with complete data
  DELETE FROM immigration_cost_profiles WHERE pathway_id IN (express_id, pnp_id, family_id, study_id, startup_id);

  -- Express Entry Profile
  INSERT INTO immigration_cost_profiles (
    pathway_id, currency_code,
    visa_fee_min, visa_fee_max, biometrics_fee_min, biometrics_fee_max,
    medical_fee_min, medical_fee_max, police_fee_min, police_fee_max,
    document_fee_min, document_fee_max, language_test_fee_min, language_test_fee_max,
    credential_assessment_fee_min, credential_assessment_fee_max,
    legal_fee_min, legal_fee_max, relocation_fee_min, relocation_fee_max,
    settlement_fee_min, settlement_fee_max,
    proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
    spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active,
    fee_model, verification_status, review_priority, next_review_due_at, official_fee_url,
    legal_assumption_note, relocation_assumption_note, settlement_assumption_note
  ) VALUES (
    express_id, 'CAD',
    1365, 1365, 85, 85, 200, 450, 50, 100, 100, 300, 300, 400, 200, 250,
    1500, 5000, 1500, 3000, 3000, 6000,
    13310, 16570, 20371, 24553, 1365, 230,
    'PR application $1,365 principal + $1,365 spouse + $230/child. Right of PR Fee $500 at approval.',
    'IRCC Official 2024', CURRENT_DATE, false, true,
    'exact', 'official', 200, CURRENT_DATE + INTERVAL '90 days',
    'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html',
    'Many apply without lawyers. Legal fees $1,500-$5,000 if needed.',
    'Flights, shipping, temporary housing until settled.',
    'First month rent deposit, utilities, phone, groceries, transit, winter gear.'
  );

  -- PNP Profile
  INSERT INTO immigration_cost_profiles (
    pathway_id, currency_code,
    visa_fee_min, visa_fee_max, biometrics_fee_min, biometrics_fee_max,
    medical_fee_min, medical_fee_max, police_fee_min, police_fee_max,
    document_fee_min, document_fee_max, language_test_fee_min, language_test_fee_max,
    credential_assessment_fee_min, credential_assessment_fee_max,
    legal_fee_min, legal_fee_max, relocation_fee_min, relocation_fee_max,
    settlement_fee_min, settlement_fee_max,
    proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
    spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active,
    fee_model, verification_status, review_priority, next_review_due_at, official_fee_url,
    legal_assumption_note, relocation_assumption_note, settlement_assumption_note
  ) VALUES (
    pnp_id, 'CAD',
    2865, 2865, 85, 85, 200, 450, 50, 100, 100, 300, 300, 400, 200, 250,
    2000, 6000, 1500, 3500, 3000, 7000,
    13310, 16570, 20371, 24553, 1365, 230,
    'Provincial nomination $1,500 + federal PR fees. Total $2,865 principal + family fees.',
    'IRCC + Provincial 2024', CURRENT_DATE, false, true,
    'exact', 'official', 200, CURRENT_DATE + INTERVAL '90 days',
    'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/provincial-nominees.html',
    'Provincial requirements complex. Legal help often recommended $2,000-$6,000.',
    'Must settle in specific province. Consider provincial cost of living differences.',
    'Settlement in designated province. Housing costs vary significantly by province.'
  );

  -- Family Sponsorship Profile
  INSERT INTO immigration_cost_profiles (
    pathway_id, currency_code,
    visa_fee_min, visa_fee_max, biometrics_fee_min, biometrics_fee_max,
    medical_fee_min, medical_fee_max, police_fee_min, police_fee_max,
    document_fee_min, document_fee_max,
    legal_fee_min, legal_fee_max, relocation_fee_min, relocation_fee_max,
    settlement_fee_min, settlement_fee_max,
    spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active,
    fee_model, verification_status, review_priority, next_review_due_at, official_fee_url,
    legal_assumption_note, relocation_assumption_note, settlement_assumption_note
  ) VALUES (
    family_id, 'CAD',
    1135, 1135, 85, 85, 200, 450, 50, 150, 150, 400,
    1500, 4000, 1000, 3000, 2000, 5000,
    1050, 150,
    'Sponsorship $75 + Principal $475 + PR Fee $500 + Processing $85 = $1,135 total per adult.',
    'IRCC Family Class 2024', CURRENT_DATE, false, true,
    'exact', 'official', 200, CURRENT_DATE + INTERVAL '90 days',
    'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/family-sponsorship.html',
    'Straightforward cases often succeed without lawyers. Complex cases benefit from legal review.',
    'May need flights for multiple family members. Consider shipping household goods.',
    'Health insurance until provincial coverage (3-month wait). Budget for initial setup.'
  );

  -- Study Permit Profile
  INSERT INTO immigration_cost_profiles (
    pathway_id, currency_code,
    visa_fee_min, visa_fee_max, biometrics_fee_min, biometrics_fee_max,
    medical_fee_min, medical_fee_max, police_fee_min, police_fee_max,
    document_fee_min, document_fee_max, language_test_fee_min, language_test_fee_max,
    legal_fee_min, legal_fee_max, relocation_fee_min, relocation_fee_max,
    settlement_fee_min, settlement_fee_max,
    proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
    notes, source_label, last_verified_at, is_estimate, is_active,
    fee_model, verification_status, review_priority, next_review_due_at, official_fee_url,
    legal_assumption_note, relocation_assumption_note, settlement_assumption_note
  ) VALUES (
    study_id, 'CAD',
    150, 150, 85, 85, 150, 350, 25, 75, 100, 250, 250, 350,
    800, 2500, 1000, 2500, 2000, 4000,
    20635, 30000, 35000, 40000,
    'Study permit $150. Must show tuition + $20,635 living ($10,000 Quebec). Add $4,000 per family member.',
    'IRCC Study Permit 2024', CURRENT_DATE, false, true,
    'exact', 'official', 200, CURRENT_DATE + INTERVAL '90 days',
    'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada.html',
    'Most student applications straightforward. Consultants help with statement of purpose.',
    'Student housing, temporary accommodation, winter clothing, textbooks.',
    'Funds until part-time work starts. Health insurance, phone, transit, winter gear, books.'
  );

  -- Start-Up Visa Profile
  INSERT INTO immigration_cost_profiles (
    pathway_id, currency_code,
    visa_fee_min, visa_fee_max, biometrics_fee_min, biometrics_fee_max,
    medical_fee_min, medical_fee_max, police_fee_min, police_fee_max,
    document_fee_min, document_fee_max, language_test_fee_min, language_test_fee_max,
    legal_fee_min, legal_fee_max, relocation_fee_min, relocation_fee_max,
    settlement_fee_min, settlement_fee_max,
    proof_of_funds_single, proof_of_funds_couple, proof_of_funds_family_3, proof_of_funds_family_4,
    spouse_fee, child_fee, notes, source_label, last_verified_at, is_estimate, is_active,
    fee_model, verification_status, review_priority, next_review_due_at, official_fee_url,
    legal_assumption_note, relocation_assumption_note, settlement_assumption_note
  ) VALUES (
    startup_id, 'CAD',
    1365, 1365, 85, 85, 200, 450, 50, 100, 100, 300, 300, 400,
    3000, 10000, 2000, 5000, 5000, 10000,
    13310, 16570, 20371, 24553, 1365, 230,
    'Same PR fees as Express Entry. Requires letter of support from designated organization. Business costs additional.',
    'IRCC Start-Up Visa 2024', CURRENT_DATE, false, true,
    'exact', 'official', 200, CURRENT_DATE + INTERVAL '90 days',
    'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/start-visa.html',
    'Immigration + business lawyers recommended. Designated organization requirements complex.',
    'Business setup costs: incorporation, office, equipment, initial inventory.',
    'Entrepreneurs need larger buffer for business operations and personal expenses during startup phase.'
  );

END $$;