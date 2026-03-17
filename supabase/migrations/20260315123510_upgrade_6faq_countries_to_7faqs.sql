/*
  # Upgrade 6-FAQ Countries to 7 FAQs

  Countries upgraded (adding 1 well-targeted 7th FAQ each):
  - Egypt
  - Indonesia
  - Malaysia
  - Morocco
  - Nigeria
  - Singapore
  - South Africa
  - South Korea
  - Thailand

  Strategy: append a 7th FAQ using jsonb array concatenation to preserve existing data.
*/

DO $$
DECLARE
  v_id uuid;
BEGIN

  -- EGYPT: add 7th FAQ about citizenship pathway
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'egypt';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "Is it possible to get Egyptian citizenship as a foreigner?", "answer": "Egypt offers citizenship by investment: EGP 250,000-500,000 deposit (refundable after 3 years) or EGP 375,000-750,000 non-refundable investment depending on the economic zone. Citizenship can be granted in as little as 3 months under the investment program. Regular naturalization requires 10 years of legal residence, 4 years for those married to Egyptians. All applications go through the Ministry of Interior."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

  -- INDONESIA: add 7th FAQ about KITAS vs KITAP
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'indonesia';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "What is the difference between KITAS and KITAP in Indonesia?", "answer": "KITAS (Kartu Izin Tinggal Terbatas) is a temporary stay permit valid 1-2 years, issued to foreign workers, spouses of Indonesian citizens, and Second Home Visa holders. KITAP (Kartu Izin Tinggal Tetap) is a permanent stay permit, available after 5+ consecutive years on KITAS, to spouses of Indonesians, retirees, or those with demonstrated long-term ties. KITAP is valid 5 years renewable and allows more activities. Government fee for KITAP: IDR 1,000,000-2,500,000. Permanent residence does not grant citizenship; Indonesia generally does not recognize dual citizenship."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

  -- MALAYSIA: add 7th FAQ about tax benefits
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'malaysia';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "What are Malaysia''s tax advantages for expats and digital nomads?", "answer": "Malaysia has a territorial tax system: income earned outside Malaysia is generally not subject to Malaysian tax for residents. The DE Rantau Pass holders working for foreign employers pay no Malaysian income tax on their foreign-source income. Malaysian income tax rates for residents are progressive: 0% up to MYR 5,000, then 1-30%. Non-residents are taxed at a flat 30% on Malaysian-source income. The Labuan jurisdiction offers additional offshore structures for business owners. Consult a Malaysian tax advisor before establishing tax residency."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

  -- MOROCCO: add 7th FAQ about the path to citizenship
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'morocco';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "Can I eventually get Moroccan citizenship?", "answer": "Moroccan naturalization requires 5 years of legal residence (reduced to 2 years for nationals of Francophone African countries and those who have rendered exceptional service to Morocco). Applicants must speak Arabic or French, demonstrate good character, have stable means of support, and renounce previous citizenship (Morocco generally does not permit dual citizenship except for those of Moroccan descent). Application submitted to the Ministry of Justice. Processing can take several years and approval is at the government''s discretion."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

  -- NIGERIA: add 7th FAQ about permanent residence
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'nigeria';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "Is it possible to get Nigerian permanent residence or citizenship?", "answer": "Nigerian Permanent Residence (Permanent Residency Permit) can be applied for after a minimum of 15 years of legal residence. Application through the Nigeria Immigration Service at a fee of NGN 2,000,000+. Naturalization requires 15 years of residence and is discretionary. Nigeria does not generally allow dual citizenship (exceptions for Nigerians who acquired foreign citizenship before 1960 or minor children). Given these requirements, most foreign workers maintain renewable CERPAC status rather than pursuing permanent residence."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

  -- SINGAPORE: add 7th FAQ about citizenship
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'singapore';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "Can I get Singapore citizenship and is dual citizenship allowed?", "answer": "Singapore citizenship can be applied for after 2 years as a Permanent Resident (typically 4+ total years from EP). Singapore does NOT allow dual citizenship — you must renounce your original passport within 12 months of acquiring Singapore citizenship. Children born to Singapore citizens abroad must renounce any other citizenship by age 22. Despite this requirement, Singapore citizenship is highly valued for its passport strength (visa-free access to 195 countries), stability, and social benefits. Application is selective and not all PR holders are approved for citizenship."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

  -- SOUTH AFRICA: add 7th FAQ about permanent residence
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'south-africa';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "How do I get South African Permanent Residence?", "answer": "South African Permanent Residence can be applied for after 5 years on a valid work, critical skills, or other temporary permit. Categories include: Critical Skills (no time requirement if your skill qualifies), General Work Permit (5 years), and Retired Person. PR application fee is ZAR 4,100. Requirements include unabridged birth certificate, police clearances from all countries of residence, medical certificate, and proof of continuous legal stay. Processing through the Department of Home Affairs typically takes 18-36+ months due to administrative backlogs. PR holders can apply for citizenship after 5 years."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

  -- SOUTH KOREA: add 7th FAQ about healthcare
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'south-korea';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "How does healthcare work for foreign workers in South Korea?", "answer": "Foreign workers with valid E-series work visas are required to enroll in the National Health Insurance Service (NHIS) within their first month of employment. Contributions are approximately 7.09% of salary (split equally between employer and employee), covering the majority of medical costs at public and private hospitals. South Korea has excellent, affordable healthcare; a GP visit costs KRW 3,000-15,000 with insurance. Private supplemental insurance (sil손보험) costing KRW 30,000-80,000/month is popular for covering the remaining copay. D-10 job seeker visa holders must purchase private international health insurance."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

  -- THAILAND: add 7th FAQ about tax residency
  SELECT id INTO v_id FROM immigration_cost_countries WHERE slug = 'thailand';
  IF v_id IS NOT NULL THEN
    UPDATE immigration_cost_content
    SET faq_json = faq_json || '[{"question": "What are the tax rules for long-term foreign residents in Thailand?", "answer": "Thailand taxes residents (those spending 180+ days/year in Thailand) on income remitted to Thailand in the same calendar year it was earned. From 2024, Thailand changed its rules: foreign income remitted to Thailand in any year is potentially taxable (previously only same-year remittances counted). LTR visa holders in the Work-from-Thailand category receive an exemption from personal income tax on foreign-source income. Standard Thai income tax rates: 0-35% progressive. Consult a Thai tax advisor to understand your specific situation, especially regarding the post-2024 foreign income rules."}]'::jsonb
    WHERE country_id = v_id AND pathway_id IS NULL;
  END IF;

END $$;
