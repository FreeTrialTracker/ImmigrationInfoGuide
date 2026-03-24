'use client';

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Alert, AlertDescription } from '@/components/ui/alert';
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion';
import { Separator } from '@/components/ui/separator';
import { CircleAlert as AlertCircle, CircleCheck as CheckCircle2, Circle as XCircle, TrendingUp, Calendar } from 'lucide-react';
import { CalculationResult } from '@/lib/immigrationCostTypes';
import { formatCurrencyByCode } from '@/lib/immigrationCostCalculator';

interface ImmigrationCostResultsProps {
  result: CalculationResult;
  countryName: string;
  pathwayName: string;
}

export default function ImmigrationCostResults({
  result,
  countryName,
  pathwayName,
}: ImmigrationCostResultsProps) {
  const { totalMin, totalMax, midEstimate, currencyCode, proofOfFunds, breakdowns, includedItems, excludedItems, lastVerified, isEstimate, sourceLabel, notes } = result;

  return (
    <div className="space-y-6">
      <Card className="border-2">
        <CardHeader>
          <div className="flex items-start justify-between">
            <div>
              <CardTitle className="text-2xl">Cost Estimate</CardTitle>
              <CardDescription className="mt-1">
                {countryName} - {pathwayName}
              </CardDescription>
            </div>
            <Badge variant={isEstimate ? 'secondary' : 'default'}>
              {isEstimate ? 'Estimated' : 'Official'}
            </Badge>
          </div>
        </CardHeader>
        <CardContent className="space-y-6">
          <div className="space-y-3">
            <div className="flex items-baseline justify-between">
              <span className="text-sm text-muted-foreground">Low Estimate</span>
              <span className="text-2xl font-bold text-green-600 dark:text-green-400">
                {formatCurrencyByCode(totalMin, currencyCode)}
              </span>
            </div>
            <div className="flex items-baseline justify-between">
              <span className="text-sm text-muted-foreground">Mid-Point Estimate</span>
              <span className="text-3xl font-bold">
                {formatCurrencyByCode(midEstimate, currencyCode)}
              </span>
            </div>
            <div className="flex items-baseline justify-between">
              <span className="text-sm text-muted-foreground">High Estimate</span>
              <span className="text-2xl font-bold text-amber-600 dark:text-amber-400">
                {formatCurrencyByCode(totalMax, currencyCode)}
              </span>
            </div>
          </div>

          {proofOfFunds !== null && (
            <>
              <Separator />
              <Alert>
                <TrendingUp className="h-4 w-4" />
                <AlertDescription>
                  <div className="font-medium mb-1">Proof of Funds Required</div>
                  <div className="text-2xl font-bold">
                    {formatCurrencyByCode(proofOfFunds, currencyCode)}
                  </div>
                  <div className="text-sm text-muted-foreground mt-1">
                    This amount is not a payable fee but must be demonstrated in your bank account.
                  </div>
                </AlertDescription>
              </Alert>
            </>
          )}

          {lastVerified && (
            <div className="flex items-center gap-2 text-sm text-muted-foreground">
              <Calendar className="w-4 h-4" />
              <span>Last verified: {new Date(lastVerified).toLocaleDateString()}</span>
            </div>
          )}

          {sourceLabel && (
            <div className="text-sm text-muted-foreground">
              Source: {sourceLabel}
            </div>
          )}
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Cost Breakdown</CardTitle>
        </CardHeader>
        <CardContent>
          <Accordion type="single" collapsible className="w-full">
            {breakdowns.map((breakdown, index) => (
              <AccordionItem key={index} value={`item-${index}`}>
                <AccordionTrigger>
                  <div className="flex items-center justify-between w-full pr-4">
                    <span className="font-medium">{breakdown.category}</span>
                    <span className="text-sm text-muted-foreground">
                      {formatCurrencyByCode(breakdown.subtotalMin, currencyCode)} - {formatCurrencyByCode(breakdown.subtotalMax, currencyCode)}
                    </span>
                  </div>
                </AccordionTrigger>
                <AccordionContent>
                  <div className="space-y-2 pt-2">
                    {breakdown.items.map((item, itemIndex) => (
                      <div key={itemIndex} className="flex justify-between text-sm">
                        <span className="text-muted-foreground">{item.name}</span>
                        <span className="font-medium">
                          {formatCurrencyByCode(item.minCost, currencyCode)} - {formatCurrencyByCode(item.maxCost, currencyCode)}
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

      <Card>
        <CardHeader>
          <CardTitle>What's Included & Excluded</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {includedItems.length > 0 && (
            <div>
              <h4 className="font-medium mb-2 flex items-center gap-2">
                <CheckCircle2 className="w-4 h-4 text-green-600" />
                Included in Estimate
              </h4>
              <ul className="space-y-1">
                {includedItems.map((item, index) => (
                  <li key={index} className="text-sm text-muted-foreground flex items-start gap-2">
                    <span className="text-green-600 mt-0.5">-</span>
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          )}

          {excludedItems.length > 0 && (
            <div>
              <h4 className="font-medium mb-2 flex items-center gap-2">
                <XCircle className="w-4 h-4 text-amber-600" />
                Not Included in Estimate
              </h4>
              <ul className="space-y-1">
                {excludedItems.map((item, index) => (
                  <li key={index} className="text-sm text-muted-foreground flex items-start gap-2">
                    <span className="text-amber-600 mt-0.5">-</span>
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          )}
        </CardContent>
      </Card>

      {notes && (
        <Alert>
          <AlertCircle className="h-4 w-4" />
          <AlertDescription className="text-sm">
            {notes}
          </AlertDescription>
        </Alert>
      )}

      <Alert variant="destructive">
        <AlertCircle className="h-4 w-4" />
        <AlertDescription>
          <strong>Important:</strong> These estimates are for planning purposes only. Immigration costs can vary based on individual circumstances, exchange rates, processing times, and government fee changes. Always verify current official fees before submitting your application.
        </AlertDescription>
      </Alert>
    </div>
  );
}
