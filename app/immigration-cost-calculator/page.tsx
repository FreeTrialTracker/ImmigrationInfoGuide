import { Metadata } from 'next';
import { getInitialCalculatorHydrationPayload } from '@/lib/immigrationCostData';
import CalculatorPageClient from './CalculatorPageClient';
import { StructuredData } from '@/components/StructuredData';

export const metadata: Metadata = {
  title: 'Immigration Cost Calculator | Estimate Visa & Immigration Costs',
  description: 'Calculate total immigration costs: visa fees, medical exams, legal fees, proof of funds, and more. Transparent breakdowns for 50+ countries and all major pathways.',
  keywords: 'immigration cost calculator, visa cost estimator, immigration fees, visa fees calculator, immigration expenses',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/immigration-cost-calculator',
  },
  openGraph: {
    title: 'Immigration Cost Calculator | Estimate Visa & Immigration Costs',
    description: 'Calculate total immigration costs: visa fees, medical exams, legal fees, and proof of funds. Transparent breakdowns for 50+ countries.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/immigration-cost-calculator',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Immigration Cost Calculator | Estimate Visa & Immigration Costs',
    description: 'Calculate total immigration costs: visa fees, medical exams, legal fees, and proof of funds for 50+ countries.',
    images: ['/og-image.webp'],
  },
};

const calculatorFAQs = [
  {
    question: 'What costs does the immigration calculator include?',
    answer: 'The calculator includes visa application fees, biometrics fees, medical examination costs, police clearance certificates, translation and document certification fees, legal and immigration consultant fees (optional), proof of funds requirements, travel costs for relocation, and initial settlement expenses. Costs vary significantly by pathway and individual circumstances.',
  },
  {
    question: 'How accurate are the cost estimates?',
    answer: 'Our estimates are based on current official government fees and typical costs reported by immigrants. However, actual costs vary based on your specific situation, service providers you choose, and whether you use professional legal assistance. Always verify official government fees and get quotes from service providers before making financial decisions.',
  },
  {
    question: 'Are legal fees required for immigration?',
    answer: 'Legal fees are optional but recommended for complex cases. Many people successfully apply without legal representation, especially for straightforward visa categories. However, immigration lawyers can help with complicated situations, increase application success rates, and save time. Our calculator lets you toggle legal assistance to see the cost impact.',
  },
  {
    question: 'What are settlement funds and why are they required?',
    answer: 'Settlement funds (proof of funds) are financial resources you must demonstrate to support yourself and your family initially after arrival. Most countries require evidence you can support yourself without public assistance. Amounts vary by country, family size, and visa type. Some visas have no settlement fund requirement, while others require significant savings.',
  },
  {
    question: 'Can I include my family in the cost calculation?',
    answer: 'Yes, the calculator accounts for family members including spouse/partner and dependent children. Family inclusion typically increases government fees, medical exam costs, and settlement fund requirements. Some visa types allow family members at no additional cost, while others charge per person.',
  },
  {
    question: 'Do immigration costs differ by passport country?',
    answer: 'Yes, visa fees, processing times, and requirements can vary significantly based on your citizenship. Some passport holders may qualify for simplified procedures or lower fees due to bilateral agreements. Others may face additional requirements like biometrics, interviews, or higher bond amounts. Select your passport country for accurate estimates.',
  },
];

const calculatorSteps = [
  {
    name: 'Select Your Passport Country',
    text: 'Choose your current citizenship. This determines visa fees, processing requirements, and bilateral agreements that may affect costs.',
  },
  {
    name: 'Choose Destination Country',
    text: 'Select where you want to immigrate. Different countries have vastly different fee structures and cost of living requirements.',
  },
  {
    name: 'Pick Immigration Pathway',
    text: 'Select your visa type (work, study, family, investment, etc.). Each pathway has unique fees, requirements, and processing costs.',
  },
  {
    name: 'Specify Family Details',
    text: 'Indicate if you are applying alone, with a partner, or with children. Family members affect total costs through additional fees and higher settlement fund requirements.',
  },
  {
    name: 'Configure Optional Costs',
    text: 'Toggle optional services: legal representation, relocation assistance, and settlement services. These significantly impact total costs but may be worth the investment for complex cases.',
  },
  {
    name: 'Review Cost Breakdown',
    text: 'Get a detailed breakdown showing government fees, mandatory costs, optional services, and settlement funds. Compare scenarios to understand your total financial commitment.',
  },
];

export default async function ImmigrationCostCalculatorPage({
  searchParams,
}: {
  searchParams: { [key: string]: string | string[] | undefined };
}) {
  const hydrationData = await getInitialCalculatorHydrationPayload(searchParams);

  const breadcrumbs = [
    { name: 'Home', url: 'https://immigrationinfoguide.com/' },
    { name: 'Immigration Cost Calculator', url: 'https://immigrationinfoguide.com/immigration-cost-calculator' },
  ];

  return (
    <>
      <StructuredData
        type="BreadcrumbList"
        breadcrumbs={breadcrumbs}
      />
      <StructuredData
        type="HowTo"
        howTo={{
          name: 'How to Use the Immigration Cost Calculator',
          description: 'Step-by-step guide to estimating your total immigration costs including visa fees, medical exams, legal costs, and settlement funds.',
          totalTime: 'PT10M',
          steps: calculatorSteps,
        }}
      />
      <StructuredData
        type="FAQPage"
        faqs={calculatorFAQs}
      />
      <CalculatorPageClient
        passportCountries={hydrationData.passportCountries}
        destinationCountries={hydrationData.destinationCountries}
        initialPathways={hydrationData.initialPathways}
        prefillDestination={hydrationData.initialDestinationSlug}
        prefillPassport={hydrationData.initialPassportSlug}
        prefillPathway={hydrationData.initialPathway?.id}
        prefillApplicantType={hydrationData.initialApplicantType}
        prefillChildren={hydrationData.initialChildren}
        prefillLegal={hydrationData.initialLegal}
        prefillRelocation={hydrationData.initialRelocation}
        prefillSettlement={hydrationData.initialSettlement}
      />
    </>
  );
}
