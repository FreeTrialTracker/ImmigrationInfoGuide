export interface StarterPathway {
  id?: string;
  passport_slug: string;
  destination_slug: string;
  pathway_type: string;
  pathway_name: string;
  summary: string;
  eligibility: string;
  requirements: string;
  processing_time: string;
  validity_period: string;
  official_url: string;
  last_updated: string;
  isStarter: boolean;
}

export function generateStarterPathways(
  destinationSlug: string,
  destinationName: string
): StarterPathway[] {
  const today = new Date().toISOString().split('T')[0];

  return [
    {
      passport_slug: 'any',
      destination_slug: destinationSlug,
      pathway_type: 'Work',
      pathway_name: `${destinationName} Work Visa and Employment Residency (Starter)`,
      summary: `Many countries offer employment-based residence permits for foreign nationals. ${destinationName} typically requires employer sponsorship and relevant qualifications. Requirements and eligibility vary depending on local immigration policies.`,
      eligibility: 'Typically requires job offer from local employer, relevant qualifications, and compliance with immigration regulations. Age, health, and character requirements may apply.',
      requirements: 'Valid passport, completed application forms, employment contract or job offer, educational certificates, criminal background check, medical examination, proof of financial means, and government fees.',
      processing_time: 'Varies by country and program, typically 1-6 months.',
      validity_period: 'Varies by visa type. May be 1-3 years initially, often renewable.',
      official_url: '',
      last_updated: today,
      isStarter: true,
    },
    {
      passport_slug: 'any',
      destination_slug: destinationSlug,
      pathway_type: 'Study',
      pathway_name: `${destinationName} Student Visa (Starter)`,
      summary: `Student visas allow international students to study at recognized educational institutions in ${destinationName}. Requirements typically include proof of enrollment, financial means, and sometimes language proficiency.`,
      eligibility: 'Must be accepted by a recognized educational institution in the country. May require proof of language proficiency and financial capacity to support studies.',
      requirements: 'Valid passport, letter of acceptance from educational institution, proof of financial means, health insurance, accommodation proof, academic transcripts, language test results (if required), and application fees.',
      processing_time: 'Typically 2-8 weeks, depending on country and time of year.',
      validity_period: 'Duration of studies plus additional grace period. Often renewable if continuing education.',
      official_url: '',
      last_updated: today,
      isStarter: true,
    },
    {
      passport_slug: 'any',
      destination_slug: destinationSlug,
      pathway_type: 'Digital Nomad',
      pathway_name: `${destinationName} Digital Nomad / Remote Work Visa (Starter)`,
      summary: `Many countries now offer visas for remote workers and digital nomads. These allow individuals to live in ${destinationName} while working remotely for foreign employers or clients. Income requirements and restrictions typically apply.`,
      eligibility: 'Typically requires proof of remote employment or self-employment with clients outside the country. Minimum income thresholds often apply.',
      requirements: 'Valid passport, proof of remote work arrangement, income statements or employment contract, health insurance, criminal background check, proof of accommodation, and application fees.',
      processing_time: 'Varies, typically 2-8 weeks.',
      validity_period: 'Usually 6 months to 2 years, with possible renewal options.',
      official_url: '',
      last_updated: today,
      isStarter: true,
    },
    {
      passport_slug: 'any',
      destination_slug: destinationSlug,
      pathway_type: 'Retirement',
      pathway_name: `${destinationName} Retirement Visa (Starter)`,
      summary: `Retirement visas are available in many countries for individuals with sufficient passive income or pension. ${destinationName} may offer such programs with specific age and financial requirements.`,
      eligibility: 'Typically requires minimum age (often 50 or older) and proof of stable passive income from pension, investments, or rental income. Health insurance usually required.',
      requirements: 'Valid passport, proof of pension or passive income, bank statements, health insurance coverage, medical certificate, criminal background check, and proof of accommodation.',
      processing_time: 'Varies, typically 1-3 months.',
      validity_period: '1-2 years initially, usually renewable. May lead to permanent residence.',
      official_url: '',
      last_updated: today,
      isStarter: true,
    },
    {
      passport_slug: 'any',
      destination_slug: destinationSlug,
      pathway_type: 'Investor',
      pathway_name: `${destinationName} Investor / Business Visa (Starter)`,
      summary: `Investment-based visas allow foreign nationals to obtain residence through business investment, real estate purchase, or capital transfer. ${destinationName} may offer such programs with varying investment thresholds and conditions.`,
      eligibility: 'Requires significant financial investment in approved assets, businesses, or government programs. Minimum investment amounts vary widely by country and program.',
      requirements: 'Valid passport, proof of investment or capital transfer, business plan (if applicable), source of funds documentation, criminal background check, health insurance, and application fees.',
      processing_time: 'Typically 3-12 months depending on investment type and due diligence.',
      validity_period: 'Varies by program. May be 1-5 years initially with renewal options. Often provides path to permanent residence.',
      official_url: '',
      last_updated: today,
      isStarter: true,
    },
  ];
}

export function filterPathwaysByGoal(
  pathways: StarterPathway[],
  goal: string
): StarterPathway[] {
  const goalMapping: Record<string, string> = {
    Work: 'Work',
    Study: 'Study',
    'Digital Nomad': 'Digital Nomad',
    Retire: 'Retirement',
    Invest: 'Investor',
    Retirement: 'Retirement',
    Investor: 'Investor',
  };

  const mappedGoal = goalMapping[goal] || goal;
  return pathways.filter((p) => p.pathway_type === mappedGoal);
}
