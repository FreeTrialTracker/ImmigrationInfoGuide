export interface ImmigrationCostCountry {
  id: string;
  name: string;
  slug: string;
  region: string;
  iso2: string | null;
  iso3: string | null;
  is_destination: boolean;
  is_passport_source: boolean;
  is_active: boolean;
  display_order: number;
  created_at: string;
  updated_at: string;
}

export interface ImmigrationCostPathway {
  id: string;
  country_id: string;
  pathway_name: string;
  pathway_slug: string;
  category: string;
  short_description: string | null;
  is_active: boolean;
  is_popular: boolean;
  display_order: number;
  seo_title: string | null;
  seo_description: string | null;
  created_at: string;
  updated_at: string;
}

export interface ImmigrationCostProfile {
  id: string;
  pathway_id: string;
  currency_code: string;
  visa_fee_min: number | null;
  visa_fee_max: number | null;
  biometrics_fee_min: number | null;
  biometrics_fee_max: number | null;
  medical_fee_min: number | null;
  medical_fee_max: number | null;
  police_fee_min: number | null;
  police_fee_max: number | null;
  document_fee_min: number | null;
  document_fee_max: number | null;
  language_test_fee_min: number | null;
  language_test_fee_max: number | null;
  credential_assessment_fee_min: number | null;
  credential_assessment_fee_max: number | null;
  legal_fee_min: number | null;
  legal_fee_max: number | null;
  relocation_fee_min: number | null;
  relocation_fee_max: number | null;
  settlement_fee_min: number | null;
  settlement_fee_max: number | null;
  proof_of_funds_single: number | null;
  proof_of_funds_couple: number | null;
  proof_of_funds_family_3: number | null;
  proof_of_funds_family_4: number | null;
  dependent_fee_each: number | null;
  spouse_fee: number | null;
  child_fee: number | null;
  notes: string | null;
  source_label: string | null;
  last_verified_at: string | null;
  is_estimate: boolean;
  is_active: boolean;
  created_at: string;
  updated_at: string;
  fee_model?: string;
  verification_status?: string;
  official_fee_url?: string | null;
  official_fee_notes?: string | null;
  review_priority?: number;
  update_frequency_days?: number;
  next_review_due_at?: string | null;
  source_currency_note?: string | null;
  relocation_assumption_note?: string | null;
  legal_assumption_note?: string | null;
  settlement_assumption_note?: string | null;
}

export interface ImmigrationCostVisaGuide {
  id: string;
  pathway_id: string;
  guide_title: string;
  guide_url: string;
  guide_type: string | null;
  anchor_text: string | null;
  is_primary: boolean;
  created_at: string;
}

export interface ImmigrationCostContent {
  id: string;
  country_id: string;
  pathway_id: string | null;
  intro_md: string | null;
  faq_json: FAQ[] | null;
  warning_md: string | null;
  next_steps_md: string | null;
  created_at: string;
  updated_at: string;
}

export interface FAQ {
  question: string;
  answer: string;
}

export type ApplicantType = 'single' | 'couple' | 'family';

export interface CalculatorInput {
  passportCountrySlug: string;
  destinationCountrySlug: string;
  pathwayId: string;
  applicantType: ApplicantType;
  numberOfChildren: number;
  includeLegalFees: boolean;
  includeRelocationCosts: boolean;
  includeSettlementBuffer: boolean;
}

export interface CostBreakdown {
  category: string;
  items: {
    name: string;
    minCost: number;
    maxCost: number;
  }[];
  subtotalMin: number;
  subtotalMax: number;
}

export interface CalculationResult {
  totalMin: number;
  totalMax: number;
  midEstimate: number;
  currencyCode: string;
  proofOfFunds: number | null;
  breakdowns: CostBreakdown[];
  includedItems: string[];
  excludedItems: string[];
  lastVerified: string | null;
  isEstimate: boolean;
  sourceLabel: string | null;
  notes: string | null;
  feeModel?: string;
  verificationStatus?: string;
  legalAssumption?: string;
  relocationAssumption?: string;
  settlementAssumption?: string;
  pathwayId?: string;
}

export interface PathwayWithCountry extends ImmigrationCostPathway {
  country: ImmigrationCostCountry;
}

export interface PathwayWithCostProfile extends ImmigrationCostPathway {
  country: ImmigrationCostCountry;
  cost_profile: ImmigrationCostProfile | null;
}

export interface CountryWithPathways extends ImmigrationCostCountry {
  pathways: ImmigrationCostPathway[];
}
