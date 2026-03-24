import {
  ImmigrationCostProfile,
  ApplicantType,
  CalculatorInput,
  CalculationResult,
  CostBreakdown,
} from './immigrationCostTypes';

const CURRENCY_SYMBOLS: Record<string, string> = {
  USD: '$',
  CAD: 'CA$',
  AUD: 'A$',
  GBP: '£',
  EUR: 'EUR ',
  NZD: 'NZ$',
  SGD: 'S$',
  JPY: '¥',
  AED: 'AED ',
  THB: 'THB ',
};

export function formatCurrencyByCode(amount: number, currencyCode: string): string {
  const symbol = CURRENCY_SYMBOLS[currencyCode] || currencyCode + ' ';

  if (currencyCode === 'JPY') {
    return symbol + Math.round(amount).toLocaleString();
  }

  return symbol + amount.toLocaleString(undefined, {
    minimumFractionDigits: 0,
    maximumFractionDigits: 0,
  });
}

export function getProofOfFundsForHousehold(
  profile: ImmigrationCostProfile,
  applicantType: ApplicantType,
  numberOfChildren: number
): number | null {
  if (applicantType === 'single') {
    return profile.proof_of_funds_single || null;
  }

  if (applicantType === 'couple' && numberOfChildren === 0) {
    return profile.proof_of_funds_couple || null;
  }

  const totalFamilySize = applicantType === 'couple' ? 2 + numberOfChildren : 1 + numberOfChildren;

  if (totalFamilySize === 3) {
    return profile.proof_of_funds_family_3 || null;
  }

  if (totalFamilySize >= 4) {
    return profile.proof_of_funds_family_4 || null;
  }

  return null;
}

export function calculateProfileEstimate(
  profile: ImmigrationCostProfile,
  input: CalculatorInput
): CalculationResult {
  const breakdowns: CostBreakdown[] = [];
  const includedItems: string[] = [];
  const excludedItems: string[] = [];

  let totalMin = 0;
  let totalMax = 0;

  const governmentItems: { name: string; minCost: number; maxCost: number }[] = [];

  if (profile.visa_fee_min !== null || profile.visa_fee_max !== null) {
    const visaMin = profile.visa_fee_min || 0;
    const visaMax = profile.visa_fee_max || profile.visa_fee_min || 0;

    let adjustedMin = visaMin;
    let adjustedMax = visaMax;

    if (input.applicantType === 'couple' && profile.spouse_fee) {
      adjustedMin += profile.spouse_fee;
      adjustedMax += profile.spouse_fee;
    }

    if (input.numberOfChildren > 0 && profile.child_fee) {
      const childTotal = profile.child_fee * input.numberOfChildren;
      adjustedMin += childTotal;
      adjustedMax += childTotal;
    }

    governmentItems.push({ name: 'Visa application fee', minCost: adjustedMin, maxCost: adjustedMax });
    totalMin += adjustedMin;
    totalMax += adjustedMax;
    includedItems.push('Visa application fees');
  }

  if (profile.biometrics_fee_min !== null || profile.biometrics_fee_max !== null) {
    const bioMin = profile.biometrics_fee_min || 0;
    const bioMax = profile.biometrics_fee_max || profile.biometrics_fee_min || 0;

    let multiplier = 1;
    if (input.applicantType === 'couple') multiplier = 2;
    if (input.applicantType === 'family') multiplier = 2 + input.numberOfChildren;

    governmentItems.push({ name: 'Biometrics', minCost: bioMin * multiplier, maxCost: bioMax * multiplier });
    totalMin += bioMin * multiplier;
    totalMax += bioMax * multiplier;
    includedItems.push('Biometrics');
  }

  if (governmentItems.length > 0) {
    breakdowns.push({
      category: 'Government Fees',
      items: governmentItems,
      subtotalMin: governmentItems.reduce((sum, item) => sum + item.minCost, 0),
      subtotalMax: governmentItems.reduce((sum, item) => sum + item.maxCost, 0),
    });
  }

  const documentItems: { name: string; minCost: number; maxCost: number }[] = [];

  if (profile.medical_fee_min !== null || profile.medical_fee_max !== null) {
    const medMin = profile.medical_fee_min || 0;
    const medMax = profile.medical_fee_max || profile.medical_fee_min || 0;

    let multiplier = 1;
    if (input.applicantType === 'couple') multiplier = 2;
    if (input.applicantType === 'family') multiplier = 2 + input.numberOfChildren;

    documentItems.push({ name: 'Medical examination', minCost: medMin * multiplier, maxCost: medMax * multiplier });
    totalMin += medMin * multiplier;
    totalMax += medMax * multiplier;
    includedItems.push('Medical examination');
  }

  if (profile.police_fee_min !== null || profile.police_fee_max !== null) {
    const policeMin = profile.police_fee_min || 0;
    const policeMax = profile.police_fee_max || profile.police_fee_min || 0;

    let multiplier = 1;
    if (input.applicantType === 'couple') multiplier = 2;
    if (input.applicantType === 'family') multiplier = 2 + input.numberOfChildren;

    documentItems.push({ name: 'Police certificate', minCost: policeMin * multiplier, maxCost: policeMax * multiplier });
    totalMin += policeMin * multiplier;
    totalMax += policeMax * multiplier;
    includedItems.push('Police certificates');
  }

  if (profile.document_fee_min !== null || profile.document_fee_max !== null) {
    const docMin = profile.document_fee_min || 0;
    const docMax = profile.document_fee_max || profile.document_fee_min || 0;
    documentItems.push({ name: 'Document preparation, translation, notarization', minCost: docMin, maxCost: docMax });
    totalMin += docMin;
    totalMax += docMax;
    includedItems.push('Document preparation and translation');
  }

  if (profile.language_test_fee_min !== null || profile.language_test_fee_max !== null) {
    const langMin = profile.language_test_fee_min || 0;
    const langMax = profile.language_test_fee_max || profile.language_test_fee_min || 0;

    let multiplier = 1;
    if (input.applicantType !== 'single') multiplier = 2;

    documentItems.push({ name: 'Language test', minCost: langMin * multiplier, maxCost: langMax * multiplier });
    totalMin += langMin * multiplier;
    totalMax += langMax * multiplier;
    includedItems.push('Language tests');
  }

  if (profile.credential_assessment_fee_min !== null || profile.credential_assessment_fee_max !== null) {
    const credMin = profile.credential_assessment_fee_min || 0;
    const credMax = profile.credential_assessment_fee_max || profile.credential_assessment_fee_min || 0;
    documentItems.push({ name: 'Credential assessment', minCost: credMin, maxCost: credMax });
    totalMin += credMin;
    totalMax += credMax;
    includedItems.push('Credential assessment');
  }

  if (documentItems.length > 0) {
    breakdowns.push({
      category: 'Documents & Testing',
      items: documentItems,
      subtotalMin: documentItems.reduce((sum, item) => sum + item.minCost, 0),
      subtotalMax: documentItems.reduce((sum, item) => sum + item.maxCost, 0),
    });
  }

  const professionalItems: { name: string; minCost: number; maxCost: number }[] = [];

  if (input.includeLegalFees && (profile.legal_fee_min !== null || profile.legal_fee_max !== null)) {
    const legalMin = profile.legal_fee_min || 0;
    const legalMax = profile.legal_fee_max || profile.legal_fee_min || 0;
    professionalItems.push({ name: 'Legal / immigration consultant fees', minCost: legalMin, maxCost: legalMax });
    totalMin += legalMin;
    totalMax += legalMax;
    includedItems.push('Legal / consultant fees');
  } else if (profile.legal_fee_min !== null || profile.legal_fee_max !== null) {
    excludedItems.push('Legal / immigration consultant fees (optional)');
  }

  if (professionalItems.length > 0) {
    breakdowns.push({
      category: 'Professional Services',
      items: professionalItems,
      subtotalMin: professionalItems.reduce((sum, item) => sum + item.minCost, 0),
      subtotalMax: professionalItems.reduce((sum, item) => sum + item.maxCost, 0),
    });
  }

  const relocationItems: { name: string; minCost: number; maxCost: number }[] = [];

  if (input.includeRelocationCosts && (profile.relocation_fee_min !== null || profile.relocation_fee_max !== null)) {
    const relocMin = profile.relocation_fee_min || 0;
    const relocMax = profile.relocation_fee_max || profile.relocation_fee_min || 0;
    relocationItems.push({ name: 'Flights and initial relocation', minCost: relocMin, maxCost: relocMax });
    totalMin += relocMin;
    totalMax += relocMax;
    includedItems.push('Relocation costs');
  } else if (profile.relocation_fee_min !== null || profile.relocation_fee_max !== null) {
    excludedItems.push('Relocation and flight costs (optional)');
  }

  if (input.includeSettlementBuffer && (profile.settlement_fee_min !== null || profile.settlement_fee_max !== null)) {
    const settleMin = profile.settlement_fee_min || 0;
    const settleMax = profile.settlement_fee_max || profile.settlement_fee_min || 0;
    relocationItems.push({ name: 'Settlement buffer (initial accommodation, etc.)', minCost: settleMin, maxCost: settleMax });
    totalMin += settleMin;
    totalMax += settleMax;
    includedItems.push('Settlement buffer');
  } else if (profile.settlement_fee_min !== null || profile.settlement_fee_max !== null) {
    excludedItems.push('Settlement buffer costs (optional)');
  }

  if (relocationItems.length > 0) {
    breakdowns.push({
      category: 'Relocation & Setup',
      items: relocationItems,
      subtotalMin: relocationItems.reduce((sum, item) => sum + item.minCost, 0),
      subtotalMax: relocationItems.reduce((sum, item) => sum + item.maxCost, 0),
    });
  }

  const proofOfFunds = getProofOfFundsForHousehold(profile, input.applicantType, input.numberOfChildren);

  const midEstimate = Math.round((totalMin + totalMax) / 2);

  return {
    totalMin,
    totalMax,
    midEstimate,
    currencyCode: profile.currency_code,
    proofOfFunds,
    breakdowns,
    includedItems,
    excludedItems,
    lastVerified: profile.last_verified_at,
    isEstimate: profile.is_estimate,
    sourceLabel: profile.source_label,
    notes: profile.notes,
    feeModel: profile.fee_model || 'range',
    verificationStatus: profile.verification_status || 'estimated',
    legalAssumption: profile.legal_assumption_note || undefined,
    relocationAssumption: profile.relocation_assumption_note || undefined,
    settlementAssumption: profile.settlement_assumption_note || undefined,
    pathwayId: profile.pathway_id,
  };
}

export function normalizeApplicantType(type: string): ApplicantType {
  const normalized = type.toLowerCase();
  if (normalized === 'couple') return 'couple';
  if (normalized === 'family') return 'family';
  return 'single';
}

export function generateCostSummaryText(result: CalculationResult): string {
  const { currencyCode, totalMin, totalMax, midEstimate, proofOfFunds } = result;

  const rangeText = `${formatCurrencyByCode(totalMin, currencyCode)} - ${formatCurrencyByCode(totalMax, currencyCode)}`;
  const midText = formatCurrencyByCode(midEstimate, currencyCode);

  let summary = `Estimated total cost: ${rangeText} (mid-point: ${midText})`;

  if (proofOfFunds !== null) {
    summary += ` - Proof of funds required: ${formatCurrencyByCode(proofOfFunds, currencyCode)} (not included in payable fees)`;
  }

  return summary;
}
