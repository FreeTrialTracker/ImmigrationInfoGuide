import { createClient } from '@supabase/supabase-js';
import {
  ImmigrationCostCountry,
  ImmigrationCostPathway,
  ImmigrationCostProfile,
} from './immigrationCostTypes';
import { formatCurrencyByCode } from './immigrationCostCalculator';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;
const supabase = createClient(supabaseUrl, supabaseKey);

export interface CountryCostSnapshot {
  country: ImmigrationCostCountry;
  pathways: ImmigrationCostPathway[];
  costRange: {
    min: number;
    max: number;
    currency: string;
  } | null;
  popularPathways: Array<ImmigrationCostPathway & { costProfile: ImmigrationCostProfile | null }>;
  avgProofOfFunds: number | null;
}

export interface PathwayCostSnapshot {
  country: ImmigrationCostCountry;
  pathway: ImmigrationCostPathway;
  costProfile: ImmigrationCostProfile | null;
  alternativePathways: Array<ImmigrationCostPathway & { costProfile: ImmigrationCostProfile | null }>;
}

export interface CountryComparison {
  country1: ImmigrationCostCountry;
  country2: ImmigrationCostCountry;
  pathways1: Array<ImmigrationCostPathway & { costProfile: ImmigrationCostProfile | null }>;
  pathways2: Array<ImmigrationCostPathway & { costProfile: ImmigrationCostProfile | null }>;
  costRange1: { min: number; max: number; currency: string } | null;
  costRange2: { min: number; max: number; currency: string } | null;
}

export async function getCountryCostSnapshot(countrySlug: string): Promise<CountryCostSnapshot | null> {
  const { data: country, error: countryError } = await supabase
    .from('immigration_cost_countries')
    .select('*')
    .eq('slug', countrySlug)
    .eq('is_active', true)
    .maybeSingle();

  if (countryError || !country) return null;

  const { data: pathways } = await supabase
    .from('immigration_cost_pathways')
    .select('*')
    .eq('country_id', country.id)
    .eq('is_active', true)
    .order('display_order');

  const pathwaysList = pathways || [];

  const pathwayIds = pathwaysList.map((p) => p.id);
  const { data: allProfiles } = pathwayIds.length
    ? await supabase
        .from('immigration_cost_profiles')
        .select('*')
        .in('pathway_id', pathwayIds)
        .eq('is_active', true)
    : { data: [] };

  const profileByPathwayId = new Map(
    (allProfiles || []).map((profile: ImmigrationCostProfile) => [profile.pathway_id, profile])
  );

  const pathwaysWithProfiles = pathwaysList.map((pathway) => ({
    ...pathway,
    costProfile: profileByPathwayId.get(pathway.id) ?? null,
  }));

  const costRange = pathwaysWithProfiles.reduce(
    (acc, p) => {
      if (p.costProfile) {
        const min = p.costProfile.visa_fee_min || 0;
        const max = p.costProfile.visa_fee_max || 0;
        return {
          min: Math.min(acc.min, min),
          max: Math.max(acc.max, max),
          currency: p.costProfile.currency_code,
        };
      }
      return acc;
    },
    { min: Infinity, max: 0, currency: 'USD' }
  );

  const popularPathways = pathwaysWithProfiles.filter(p => p.is_popular).slice(0, 5);

  const avgProofOfFunds = pathwaysWithProfiles.reduce((sum, p, _, arr) => {
    const pof = p.costProfile?.proof_of_funds_single || 0;
    return sum + pof / arr.length;
  }, 0);

  return {
    country,
    pathways: pathwaysList,
    costRange: costRange.min !== Infinity ? costRange : null,
    popularPathways,
    avgProofOfFunds: avgProofOfFunds > 0 ? avgProofOfFunds : null,
  };
}

export async function getPathwayCostSnapshot(
  countrySlug: string,
  pathwaySlug: string
): Promise<PathwayCostSnapshot | null> {
  const { data: country, error: countryError } = await supabase
    .from('immigration_cost_countries')
    .select('*')
    .eq('slug', countrySlug)
    .eq('is_active', true)
    .maybeSingle();

  if (countryError || !country) return null;

  const { data: pathway, error: pathwayError } = await supabase
    .from('immigration_cost_pathways')
    .select('*')
    .eq('country_id', country.id)
    .eq('pathway_slug', pathwaySlug)
    .eq('is_active', true)
    .maybeSingle();

  if (pathwayError || !pathway) return null;

  const { data: costProfile } = await supabase
    .from('immigration_cost_profiles')
    .select('*')
    .eq('pathway_id', pathway.id)
    .eq('is_active', true)
    .maybeSingle();

  const { data: alternatives } = await supabase
    .from('immigration_cost_pathways')
    .select('*')
    .eq('country_id', country.id)
    .eq('is_active', true)
    .neq('id', pathway.id)
    .order('display_order')
    .limit(3);

  const altList = alternatives || [];
  const altIds = altList.map((a) => a.id);
  const { data: altProfiles } = altIds.length
    ? await supabase
        .from('immigration_cost_profiles')
        .select('*')
        .in('pathway_id', altIds)
        .eq('is_active', true)
    : { data: [] };

  const altProfileByPathwayId = new Map(
    (altProfiles || []).map((profile: ImmigrationCostProfile) => [profile.pathway_id, profile])
  );

  const alternativesWithProfiles = altList.map((alt) => ({
    ...alt,
    costProfile: altProfileByPathwayId.get(alt.id) ?? null,
  }));

  return {
    country,
    pathway,
    costProfile: costProfile || null,
    alternativePathways: alternativesWithProfiles,
  };
}

export async function getCountryComparison(
  country1Slug: string,
  country2Slug: string
): Promise<CountryComparison | null> {
  const [snapshot1, snapshot2] = await Promise.all([
    getCountryCostSnapshot(country1Slug),
    getCountryCostSnapshot(country2Slug),
  ]);

  if (!snapshot1 || !snapshot2) return null;

  return {
    country1: snapshot1.country,
    country2: snapshot2.country,
    pathways1: snapshot1.popularPathways,
    pathways2: snapshot2.popularPathways,
    costRange1: snapshot1.costRange,
    costRange2: snapshot2.costRange,
  };
}

export function generateCountryFAQs(snapshot: CountryCostSnapshot): Array<{ question: string; answer: string }> {
  const { country, costRange, avgProofOfFunds, pathways } = snapshot;
  const currency = costRange?.currency || 'USD';

  const faqs = [
    {
      question: `How much does it cost to immigrate to ${country.name}?`,
      answer: costRange
        ? `Immigration costs to ${country.name} typically range from ${formatCurrencyByCode(costRange.min, currency)} to ${formatCurrencyByCode(costRange.max, currency)} for visa application fees alone. Total costs including medical exams, language tests, document translation, and legal services can be significantly higher. The exact cost depends on your chosen immigration pathway, family size, and whether you use professional immigration services.`
        : `Immigration costs to ${country.name} vary significantly depending on your chosen pathway, family size, and individual circumstances. Contact an immigration professional for accurate cost estimates.`,
    },
    {
      question: `What is the cheapest way to immigrate to ${country.name}?`,
      answer: pathways.length > 0
        ? `The most cost-effective immigration pathways to ${country.name} are typically ${pathways.slice(0, 2).map(p => p.pathway_name).join(' and ')}. However, eligibility requirements vary significantly between pathways. The "cheapest" option depends on your qualifications, work experience, and personal situation.`
        : `Immigration pathway costs vary. Research different visa types to find the most suitable option for your circumstances.`,
    },
    {
      question: `Do immigration costs include proof of funds?`,
      answer: avgProofOfFunds && avgProofOfFunds > 0
        ? `No, proof of funds is separate from immigration costs. Proof of funds (averaging around ${formatCurrencyByCode(avgProofOfFunds, currency)} for single applicants to ${country.name}) is money you must demonstrate in your bank account to prove you can support yourself after arrival. This is not a fee you pay to the government, but funds you must have available and cannot spend during the immigration process.`
        : `Proof of funds requirements are separate from visa fees. You must demonstrate you have sufficient funds to support yourself, but this money remains yours and is not paid to the government.`,
    },
    {
      question: `Are legal fees required for ${country.name} immigration?`,
      answer: `Legal fees are optional but recommended for complex cases. Many applicants to ${country.name} successfully apply for immigration visas themselves without hiring lawyers or consultants. However, immigration professionals can help navigate complex requirements, avoid costly mistakes, and potentially improve your chances of approval. Legal fees typically range from $2,000 to $10,000 depending on the complexity of your case.`,
    },
    {
      question: `What hidden costs should I expect when immigrating to ${country.name}?`,
      answer: `Beyond visa fees, expect costs for medical examinations ($200-$500 per person), language tests ($200-$300), document translation and notarization ($500-$2,000), police certificates ($50-$100), passport photos, courier services, and travel for biometrics. After approval, relocation costs include flights, temporary accommodation, shipping belongings, and initial settlement expenses. Budget an additional 30-50% above visa fees for these hidden costs.`,
    },
    {
      question: `How long does it take to immigrate to ${country.name}?`,
      answer: `Processing times for ${country.name} immigration vary widely by pathway, ranging from a few months to several years. Express processing options may be available for certain visa types at additional cost. During this time, you'll need to maintain sufficient funds and keep all documents current. Check official government sources for current processing times for your specific pathway.`,
    },
    {
      question: `Can I work while my ${country.name} immigration application is processing?`,
      answer: `Work authorization during application processing depends on your current visa status and the specific immigration pathway you're applying through. Some pathways allow work permits while others don't. Consult official immigration resources or an immigration lawyer to understand your specific situation.`,
    },
    {
      question: `What happens if my ${country.name} immigration application is rejected?`,
      answer: `If your application is rejected, visa fees are typically non-refundable. You may have the option to appeal the decision (with additional fees) or reapply after addressing the reasons for rejection. This is why many applicants choose to work with immigration professionals to maximize their chances of approval on the first attempt.`,
    },
  ];

  return faqs.slice(0, 8);
}

export function generatePathwayFAQs(
  snapshot: PathwayCostSnapshot
): Array<{ question: string; answer: string }> {
  const { country, pathway, costProfile } = snapshot;
  const currency = costProfile?.currency_code || 'USD';

  const faqs = [
    {
      question: `How much does the ${country.name} ${pathway.pathway_name} cost?`,
      answer: costProfile
        ? `The ${pathway.pathway_name} for ${country.name} has visa application fees ranging from ${formatCurrencyByCode(costProfile.visa_fee_min || 0, currency)} to ${formatCurrencyByCode(costProfile.visa_fee_max || 0, currency)}. Total costs including medical exams (${formatCurrencyByCode(costProfile.medical_fee_min || 0, currency)}-${formatCurrencyByCode(costProfile.medical_fee_max || 0, currency)}), language tests, and other requirements typically add 30-50% to the base visa fee.`
        : `Costs for the ${pathway.pathway_name} vary by individual circumstances. Contact official immigration authorities for current fee schedules.`,
    },
    {
      question: `What are the proof of funds requirements for ${country.name} ${pathway.pathway_name}?`,
      answer: costProfile?.proof_of_funds_single
        ? `For the ${pathway.pathway_name}, single applicants must demonstrate ${formatCurrencyByCode(costProfile.proof_of_funds_single, currency)} in available funds. Family applications require more. This money must be readily available in your bank account and cannot be borrowed or used during the application process.`
        : `Proof of funds requirements vary by pathway and family size. Check official government sources for specific requirements for the ${pathway.pathway_name}.`,
    },
    {
      question: `How long does ${country.name} ${pathway.pathway_name} processing take?`,
      answer: `Processing times vary significantly based on application volume, your country of origin, and application completeness. Typical processing ranges from several months to over a year. Some pathways offer expedited processing for additional fees. Check official government websites for current processing times.`,
    },
    {
      question: `Can I include my family in my ${country.name} ${pathway.pathway_name} application?`,
      answer: `Most immigration pathways allow you to include your spouse/partner and dependent children in your application. Each additional family member increases total costs for visa fees, medical exams, and proof of funds requirements. Family applications typically cost 2-3x single applicant fees.`,
    },
    {
      question: `Do I need a lawyer for ${country.name} ${pathway.pathway_name}?`,
      answer: `Hiring an immigration lawyer is optional. Many applicants successfully navigate the ${pathway.pathway_name} process independently. However, lawyers can help with complex situations, improve application quality, and potentially reduce processing delays. Legal fees typically range from $2,000-$10,000.`,
    },
    {
      question: `What documents are required for ${country.name} ${pathway.pathway_name}?`,
      answer: `Common documents include passport, birth certificates, marriage certificates (if applicable), educational credentials, work experience letters, language test results, police clearance certificates, and medical examination results. Document translation and notarization costs typically add $500-$2,000 to your total expenses.`,
    },
  ];

  return faqs.slice(0, 8);
}

export function generateComparisonFAQs(
  comparison: CountryComparison
): Array<{ question: string; answer: string }> {
  const { country1, country2, costRange1, costRange2 } = comparison;

  const cheaper = costRange1 && costRange2
    ? costRange1.min < costRange2.min ? country1.name : country2.name
    : null;

  const faqs = [
    {
      question: `Which is cheaper to immigrate to: ${country1.name} or ${country2.name}?`,
      answer: cheaper
        ? `Based on visa application fees, ${cheaper} tends to be more affordable. However, total immigration costs depend on your specific pathway, family size, and whether you use professional services. Both countries have pathways ranging from budget-friendly to expensive options.`
        : `Immigration costs vary significantly by pathway and individual circumstances. Both ${country1.name} and ${country2.name} offer various immigration options at different price points.`,
    },
    {
      question: `What are the proof of funds requirements for ${country1.name} vs ${country2.name}?`,
      answer: `Proof of funds requirements differ by immigration pathway and family size. Both ${country1.name} and ${country2.name} require demonstrating you have sufficient funds to support yourself after arrival. Amounts vary from $10,000 to $50,000+ for single applicants depending on the specific visa type.`,
    },
    {
      question: `Which country has faster immigration processing: ${country1.name} or ${country2.name}?`,
      answer: `Processing times vary significantly by pathway and application volume. Both countries have some fast-track options and some pathways with multi-year processing times. Research specific pathways you're eligible for in each country to compare current processing times.`,
    },
    {
      question: `Can I work immediately after immigrating to ${country1.name} or ${country2.name}?`,
      answer: `Work authorization depends on your specific visa type. Some pathways provide immediate work rights upon arrival, while others require additional permits or waiting periods. Research the specific pathways you're considering in each country.`,
    },
    {
      question: `Which country is easier to get permanent residence: ${country1.name} or ${country2.name}?`,
      answer: `"Easier" depends on your qualifications, work experience, education, and language skills. Both ${country1.name} and ${country2.name} have pathways designed for skilled workers, students, investors, and families. Evaluate which country's pathways align best with your profile.`,
    },
    {
      question: `What are the language requirements for ${country1.name} vs ${country2.name}?`,
      answer: `Language requirements vary by pathway. Both countries typically require language proficiency tests for economic immigration pathways. Test costs range from $200-$400, and preparation may require months of study if you're not already proficient.`,
    },
  ];

  return faqs;
}

export const TOP_IMMIGRATION_DESTINATIONS = [
  'canada',
  'united-states',
  'australia',
  'united-kingdom',
  'germany',
  'portugal',
  'spain',
  'france',
  'netherlands',
  'new-zealand',
  'ireland',
  'italy',
  'sweden',
  'norway',
  'denmark',
  'switzerland',
  'austria',
  'belgium',
  'singapore',
  'japan',
];
