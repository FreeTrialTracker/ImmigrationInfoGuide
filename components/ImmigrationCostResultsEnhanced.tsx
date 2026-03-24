'use client';

import { useState, useEffect } from 'react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion';
import { Separator } from '@/components/ui/separator';
import { ArrowRight, ExternalLink } from 'lucide-react';
import { CalculationResult } from '@/lib/immigrationCostTypes';
import { formatCurrencyByCode } from '@/lib/immigrationCostCalculator';
import { EstimateTrustPanel } from './EstimateTrustPanel';
import { IncludedCostsList } from './IncludedCostsList';
import { ExcludedCostsList } from './ExcludedCostsList';
import { CostAssumptionsCard } from './CostAssumptionsCard';
import { ProofOfFundsCard } from './ProofOfFundsCard';
import { getCostInclusions, getCostExclusions, type CostInclusion, type CostExclusion } from '@/lib/immigrationCostUtils';
import Link from 'next/link';

interface ImmigrationCostResultsEnhancedProps {
  result: CalculationResult;
  countryName: string;
  countrySlug: string;
  pathwayName: string;
  input: {
    applicantType: string;
    includeLegalFees: boolean;
    includeRelocationCosts: boolean;
    includeSettlementBuffer: boolean;
  };
}

export default function ImmigrationCostResultsEnhanced({
  result,
  countryName,
  countrySlug,
  pathwayName,
  input,
}: ImmigrationCostResultsEnhancedProps) {
  const {
    totalMin,
    totalMax,
    midEstimate,
    currencyCode,
    proofOfFunds,
    breakdowns,
    lastVerified,
    feeModel = 'range',
    verificationStatus = 'estimated',
    legalAssumption,
    relocationAssumption,
    settlementAssumption,
    pathwayId,
  } = result;

  const [inclusions, setInclusions] = useState<CostInclusion[]>([]);
  const [exclusions, setExclusions] = useState<CostExclusion[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadInclusionsAndExclusions() {
      if (!pathwayId) {
        setLoading(false);
        return;
      }

      try {
        const [inclusionsData, exclusionsData] = await Promise.all([
          getCostInclusions(pathwayId),
          getCostExclusions(pathwayId),
        ]);

        setInclusions(inclusionsData);
        setExclusions(exclusionsData);
      } catch (error) {
        console.error('Error loading inclusions/exclusions:', error);
      } finally {
        setLoading(false);
      }
    }

    loadInclusionsAndExclusions();
  }, [pathwayId]);

  const familySize =
    input.applicantType === 'single'
      ? 'single'
      : input.applicantType === 'couple'
      ? 'couple'
      : input.applicantType === 'family-3'
      ? 'family-3'
      : 'family-4';

  return (
    <div className="space-y-6">
      {/* Header Card */}
      <Card className="border-2 border-indigo-200 bg-gradient-to-br from-white to-indigo-50/30">
        <CardHeader>
          <CardTitle className="text-2xl font-bold text-gray-900">Your Immigration Cost Estimate</CardTitle>
          <CardDescription className="text-base">
            {countryName} - {pathwayName}
          </CardDescription>
        </CardHeader>
      </Card>

      <div className="grid lg:grid-cols-2 gap-6">
        {/* Estimate Summary */}
        <EstimateTrustPanel
          lowEstimate={totalMin}
          midEstimate={midEstimate}
          highEstimate={totalMax}
          currencyCode={currencyCode}
          verificationStatus={verificationStatus}
          feeModel={feeModel}
          lastVerifiedAt={lastVerified || undefined}
        />

        {/* Proof of Funds */}
        {proofOfFunds && proofOfFunds > 0 && (
          <ProofOfFundsCard amount={proofOfFunds} currencyCode={currencyCode} />
        )}
      </div>

      {/* Cost Breakdown */}
      <Card>
        <CardHeader>
          <CardTitle className="text-xl font-semibold text-gray-900">Detailed Cost Breakdown</CardTitle>
        </CardHeader>
        <CardContent>
          <Accordion type="single" collapsible className="w-full">
            {breakdowns.map((breakdown, index) => (
              <AccordionItem key={index} value={`item-${index}`}>
                <AccordionTrigger>
                  <div className="flex items-center justify-between w-full pr-4">
                    <span className="font-semibold text-gray-900">{breakdown.category}</span>
                    <span className="text-sm text-gray-700 font-medium">
                      {formatCurrencyByCode(breakdown.subtotalMin, currencyCode)} -{' '}
                      {formatCurrencyByCode(breakdown.subtotalMax, currencyCode)}
                    </span>
                  </div>
                </AccordionTrigger>
                <AccordionContent>
                  <div className="space-y-2 pt-2 pl-4">
                    {breakdown.items.map((item, itemIndex) => (
                      <div key={itemIndex} className="flex justify-between text-sm py-1">
                        <span className="text-gray-600">{item.name}</span>
                        <span className="font-medium text-gray-900">
                          {formatCurrencyByCode(item.minCost, currencyCode)} -{' '}
                          {formatCurrencyByCode(item.maxCost, currencyCode)}
                        </span>
                      </div>
                    ))}
                  </div>
                </AccordionContent>
              </AccordionItem>
            ))}
          </Accordion>
        </CardContent>
      </Card>

      <div className="grid lg:grid-cols-2 gap-6">
        {/* Included Costs */}
        {!loading && inclusions.length > 0 && <IncludedCostsList inclusions={inclusions} />}

        {/* Excluded Costs */}
        {!loading && exclusions.length > 0 && <ExcludedCostsList exclusions={exclusions} />}
      </div>

      {/* Assumptions */}
      <CostAssumptionsCard
        legalAssumption={legalAssumption}
        relocationAssumption={relocationAssumption}
        settlementAssumption={settlementAssumption}
        includeLegal={input.includeLegalFees}
        includeRelocation={input.includeRelocationCosts}
        includeSettlement={input.includeSettlementBuffer}
        familySize={familySize}
      />

      {/* CTA Row */}
      <Card className="bg-gradient-to-r from-indigo-50 to-blue-50 border-indigo-200">
        <CardContent className="pt-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Next Steps</h3>
          <div className="grid md:grid-cols-2 gap-3">
            <Link href={`/immigrate-to/${countrySlug}`}>
              <Button variant="default" className="w-full group bg-brand-primary hover:bg-indigo-700">
                View Full Immigration Guide
                <ArrowRight size={16} className="ml-2 group-hover:translate-x-1 transition-transform" />
              </Button>
            </Link>
            <Link href={`/immigration-cost/${countrySlug}`}>
              <Button variant="outline" className="w-full group">
                See All Pathways for {countryName}
                <ExternalLink size={16} className="ml-2" />
              </Button>
            </Link>
          </div>
        </CardContent>
      </Card>

      {/* Disclaimer */}
      <Card className="border-amber-200 bg-amber-50/50">
        <CardContent className="pt-6">
          <p className="text-sm text-gray-700">
            <strong className="text-gray-900">Important:</strong> These estimates are for planning purposes only.
            Immigration costs can vary based on individual circumstances, exchange rates, processing times, and
            government fee changes. Always verify current official fees before submitting your application.
          </p>
        </CardContent>
      </Card>
    </div>
  );
}
