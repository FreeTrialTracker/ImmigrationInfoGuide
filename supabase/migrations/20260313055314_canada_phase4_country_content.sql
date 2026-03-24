/*
  # Canada Phase 4 - Country-Level Content
  
  Creates comprehensive content for Canada country landing page:
  - Detailed intro
  - Comprehensive FAQ (8+ questions)
  - Warning notes about hidden costs
  - Next steps guidance
*/

DO $$
DECLARE
  canada_id uuid;
BEGIN
  SELECT id INTO canada_id FROM immigration_cost_countries WHERE slug = 'canada';

  -- Delete existing content if any
  DELETE FROM immigration_cost_content WHERE country_id = canada_id AND pathway_id IS NULL;

  -- Insert comprehensive Canada country content
  INSERT INTO immigration_cost_content (
    country_id,
    pathway_id,
    intro_md,
    warning_md,
    next_steps_md,
    faq_json
  ) VALUES (
    canada_id,
    NULL,
    'Canada offers multiple immigration pathways for skilled workers, families, students, and entrepreneurs. Immigration costs vary significantly by pathway, family size, and individual circumstances. This guide provides realistic cost estimates including government fees, testing, documentation, legal services, relocation, and settlement expenses. All costs are in Canadian dollars (CAD) based on 2024 IRCC official fees.',
    'Immigration costs can change without notice. Always verify current fees on the official IRCC website before applying. Proof of funds requirements are amounts you must demonstrate in your bank account, not fees you pay to the government. Processing times and costs vary by pathway and your country of residence. Budget for unexpected expenses and exchange rate fluctuations.',
    'Choose your immigration pathway based on your eligibility and goals. Use our cost calculator to get a personalized estimate for your situation. Review official IRCC requirements carefully. Consider consulting with a regulated Canadian immigration consultant (RCIC) or lawyer for complex cases. Ensure you meet all eligibility criteria before applying to avoid wasted fees.',
    '[
      {
        "question": "What is the total cost to immigrate to Canada?",
        "answer": "Total costs range from $2,300 to $15,000+ for a single applicant, depending on pathway. Express Entry typically costs $2,300-$8,000 (government fees + testing + documents) plus $13,310 proof of funds. Add $1,500-$5,000 for legal fees if using a consultant, $1,500-$3,000 for relocation, and $3,000-$6,000 for initial settlement. Families pay additional fees per spouse ($1,365) and child ($230)."
      },
      {
        "question": "What are proof of funds and why are they required?",
        "answer": "Proof of funds is money you must show you have available to support yourself and family after arriving in Canada. For Express Entry, single applicants need $13,310 CAD, couples need $16,570, families of 3 need $20,371, and families of 4+ need $24,553. This is NOT a fee you pay - it''s money you demonstrate in your bank account. You can use this money after arrival for living expenses. Different pathways have different proof of funds requirements or none at all."
      },
      {
        "question": "Do I need a lawyer or immigration consultant?",
        "answer": "Not required, but can help with complex cases. Many Express Entry applicants succeed without legal help using official IRCC resources and online communities. Consider legal help if: you have criminal inadmissibility issues, previous refusals, complex work history, or medical inadmissibility concerns. Regulated Canadian Immigration Consultants (RCIC) or lawyers charge $1,500-$10,000 depending on case complexity."
      },
      {
        "question": "What hidden costs do people forget to budget for?",
        "answer": "Common forgotten costs: language test retakes if you don''t score high enough ($300-$400 each time), courier fees for sending documents internationally ($50-$150), notary and translation services for documents in other languages ($100-$500), police certificates from multiple countries if you lived abroad ($50-$100 each), photographs meeting Canadian specifications ($15-$30), medical exam for family members ($200-$450 per person), and travel for biometrics appointment if no VAC nearby."
      },
      {
        "question": "How much should I budget for relocation to Canada?",
        "answer": "Budget $1,500-$3,000 for flights per person (more from distant countries), $1,000-$3,000 for shipping essential belongings, $2,000-$4,000 for temporary accommodation (1-2 weeks in hotel or Airbnb), $1,500-$3,000 for first month rent deposit, $500-$1,000 for winter clothing if arriving from warm climate, $200-$500 for Canadian phone and internet setup, and $500-$1,000 emergency buffer for unexpected costs. Total: $7,000-$15,000 for a couple."
      },
      {
        "question": "Which Canadian immigration pathway is cheapest?",
        "answer": "Study Permit has lowest immediate costs ($150 permit + $85 biometrics + $20,635 proof of funds for living), but requires paying tuition fees. Family Sponsorship costs $1,135 per person for spouse/partner with no proof of funds if sponsor meets income requirements. Express Entry and PNP have similar costs ($2,300-$3,800 in fees) but require $13,310+ proof of funds. Start-Up Visa has same government fees but higher legal and business setup costs."
      },
      {
        "question": "Can I get a refund if my application is refused?",
        "answer": "No. IRCC does not refund application fees if your application is refused or withdrawn. The Right of Permanent Residence Fee ($500) is refunded if your application is refused or you withdraw before becoming a permanent resident. This is why it''s critical to ensure you meet all eligibility requirements before applying. Consider using IRCC''s Come to Canada tool to check eligibility before paying fees."
      },
      {
        "question": "Do costs differ by province in Canada?",
        "answer": "Government immigration fees are the same across Canada. However, Provincial Nominee Program (PNP) adds $1,500 provincial nomination fee. Settlement costs vary dramatically: housing in Toronto/Vancouver costs 2-3x more than Saskatchewan/Atlantic provinces. Some provinces have additional requirements or documentation that may increase preparation costs. Consider cost of living in your target province when budgeting total relocation expenses."
      },
      {
        "question": "How do I pay IRCC fees?",
        "answer": "Most IRCC fees are paid online by credit card (Visa, MasterCard, American Express), debit card, or prepaid card when submitting your application. Fees must be paid in Canadian dollars. Your bank may charge foreign transaction fees. Keep payment receipts as proof. Some fees like the Right of Permanent Residence Fee ($500) are paid later in the process when your application is approved but before you get permanent residence."
      },
      {
        "question": "What if exchange rates change during my application?",
        "answer": "IRCC fees are fixed in Canadian dollars, but if paying from another currency, exchange rates affect the amount you pay. Budget 3-5% buffer for potential exchange rate fluctuations between when you budget and when you pay. Proof of funds are also calculated in CAD, so a weakening home currency means you need more in local currency to meet the CAD requirement. Monitor exchange rates and aim to have slightly above minimum requirements."
      }
    ]'::jsonb
  );

END $$;