'use client';

import { useState } from 'react';
import ImmigrationCostCalculatorForm from '@/components/ImmigrationCostCalculatorForm';
import ImmigrationCostResultsEnhanced from '@/components/ImmigrationCostResultsEnhanced';
import { Alert, AlertDescription } from '@/components/ui/alert';
import { CircleAlert as AlertCircle, Calculator } from 'lucide-react';
import {
  ImmigrationCostCountry,
  ImmigrationCostPathway,
  CalculatorInput,
  CalculationResult,
  PathwayWithCountry,
} from '@/lib/immigrationCostTypes';
import {
  getCostProfileByPathwayId,
  getPathwayById,
} from '@/lib/immigrationCostData';
import { calculateProfileEstimate } from '@/lib/immigrationCostCalculator';

interface CalculatorPageClientProps {
  passportCountries: ImmigrationCostCountry[];
  destinationCountries: ImmigrationCostCountry[];
  initialPathways?: ImmigrationCostPathway[];
  prefillDestination?: string;
  prefillPassport?: string;
  prefillPathway?: string;
  prefillApplicantType?: string;
  prefillChildren?: number;
  prefillLegal?: boolean;
  prefillRelocation?: boolean;
  prefillSettlement?: boolean;
}

export default function CalculatorPageClient({
  passportCountries,
  destinationCountries,
  initialPathways,
  prefillDestination,
  prefillPassport,
  prefillPathway,
  prefillApplicantType,
  prefillChildren,
  prefillLegal,
  prefillRelocation,
  prefillSettlement,
}: CalculatorPageClientProps) {
  const [isCalculating, setIsCalculating] = useState(false);
  const [result, setResult] = useState<CalculationResult | null>(null);
  const [pathway, setPathway] = useState<PathwayWithCountry | null>(null);
  const [calculatorInput, setCalculatorInput] = useState<CalculatorInput | null>(null);
  const [error, setError] = useState<string | null>(null);

  async function handleCalculate(input: CalculatorInput) {
    setIsCalculating(true);
    setError(null);

    try {
      const [pathwayData, costProfile] = await Promise.all([
        getPathwayById(input.pathwayId),
        getCostProfileByPathwayId(input.pathwayId),
      ]);

      if (!pathwayData) {
        throw new Error('Pathway not found');
      }

      if (!costProfile) {
        throw new Error('Cost data not available for this pathway');
      }

      const calculationResult = calculateProfileEstimate(costProfile, input);
      setResult(calculationResult);
      setPathway(pathwayData);
      setCalculatorInput(input);
      window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Calculation failed');
      setResult(null);
      setPathway(null);
    } finally {
      setIsCalculating(false);
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 via-blue-50/30 to-slate-50">
      <div className="container mx-auto px-4 py-12 max-w-7xl">
        <div className="text-center mb-12">
          <div className="inline-flex items-center gap-2 mb-4 px-4 py-2 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">
            <Calculator className="h-4 w-4" />
            <span>Free Immigration Cost Calculator</span>
          </div>
          <h1 className="text-4xl md:text-5xl font-bold mb-4 text-slate-900">
            Immigration Cost Calculator
          </h1>
          <p className="text-lg text-slate-600 max-w-3xl mx-auto leading-relaxed">
            Estimate the total cost of immigrating to your chosen destination. Get transparent
            breakdowns of visa fees, medical exams, legal costs, and more.
          </p>
        </div>

        <Alert className="mb-8 border-blue-200 bg-blue-50">
          <AlertCircle className="h-4 w-4 text-blue-600" />
          <AlertDescription className="text-slate-700">
            Estimates vary by immigration pathway, family size, and individual circumstances. Always
            verify official government fees before applying.
          </AlertDescription>
        </Alert>

        <div className="grid lg:grid-cols-2 gap-8">
          <div>
            <ImmigrationCostCalculatorForm
              passportCountries={passportCountries}
              destinationCountries={destinationCountries}
              initialPathways={initialPathways}
              onCalculate={handleCalculate}
              isCalculating={isCalculating}
              prefillDestination={prefillDestination}
              prefillPassport={prefillPassport}
              prefillPathway={prefillPathway}
              prefillApplicantType={prefillApplicantType}
              prefillChildren={prefillChildren}
              prefillLegal={prefillLegal}
              prefillRelocation={prefillRelocation}
              prefillSettlement={prefillSettlement}
            />
          </div>

          <div>
            {error && (
              <Alert variant="destructive" className="mb-4">
                <AlertCircle className="h-4 w-4" />
                <AlertDescription>{error}</AlertDescription>
              </Alert>
            )}

            {!result && !error && (
              <div className="bg-white rounded-xl border-2 border-dashed border-slate-200 p-12 text-center">
                <Calculator className="h-16 w-16 text-slate-300 mx-auto mb-4" />
                <p className="text-slate-500 text-lg">
                  Select your details and click Calculate to see cost estimates
                </p>
              </div>
            )}

            {result && pathway && calculatorInput && (
              <ImmigrationCostResultsEnhanced
                result={result}
                countryName={pathway.country.name}
                countrySlug={pathway.country.slug}
                pathwayName={pathway.pathway_name}
                input={{
                  applicantType: calculatorInput.applicantType,
                  includeLegalFees: calculatorInput.includeLegalFees,
                  includeRelocationCosts: calculatorInput.includeRelocationCosts,
                  includeSettlementBuffer: calculatorInput.includeSettlementBuffer,
                }}
              />
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
