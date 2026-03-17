'use client';

import { useState } from 'react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { ReviewStatusBadge } from './ReviewStatusBadge';
import { formatCurrency } from '@/lib/immigrationCostUtils';
import { ArrowRight, TrendingUp, TrendingDown } from 'lucide-react';

interface PathwayComparison {
  id: string;
  pathway_name: string;
  lowEstimate: number;
  highEstimate: number;
  proofOfFunds: number | null;
  legalMin: number;
  legalMax: number;
  relocationMin: number;
  relocationMax: number;
  verificationStatus: string;
  currencyCode: string;
}

interface PathwayComparisonCardProps {
  pathway1: PathwayComparison;
  pathway2: PathwayComparison;
  onClose?: () => void;
}

export function PathwayComparisonCard({ pathway1, pathway2, onClose }: PathwayComparisonCardProps) {
  return (
    <Card className="border-2 border-indigo-200">
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle className="text-xl font-bold text-gray-900">Pathway Comparison</CardTitle>
          {onClose && (
            <Button variant="ghost" size="sm" onClick={onClose}>
              Close
            </Button>
          )}
        </div>
      </CardHeader>
      <CardContent>
        <div className="grid md:grid-cols-2 gap-6">
          {/* Pathway 1 */}
          <div className="space-y-4">
            <div>
              <h3 className="font-semibold text-gray-900 mb-2">{pathway1.pathway_name}</h3>
              <ReviewStatusBadge verificationStatus={pathway1.verificationStatus} size="sm" />
            </div>

            <div className="space-y-3">
              <ComparisonRow
                label="Low Estimate"
                value={formatCurrency(pathway1.lowEstimate, pathway1.currencyCode)}
                icon={<TrendingDown size={16} className="text-green-600" />}
              />
              <ComparisonRow
                label="High Estimate"
                value={formatCurrency(pathway1.highEstimate, pathway1.currencyCode)}
                icon={<TrendingUp size={16} className="text-amber-600" />}
              />
              {pathway1.proofOfFunds && pathway1.proofOfFunds > 0 && (
                <ComparisonRow
                  label="Proof of Funds"
                  value={formatCurrency(pathway1.proofOfFunds, pathway1.currencyCode)}
                />
              )}
              {pathway1.legalMin > 0 && (
                <ComparisonRow
                  label="Legal Fees"
                  value={`${formatCurrency(pathway1.legalMin, pathway1.currencyCode)} - ${formatCurrency(pathway1.legalMax, pathway1.currencyCode)}`}
                />
              )}
              {pathway1.relocationMin > 0 && (
                <ComparisonRow
                  label="Relocation"
                  value={`${formatCurrency(pathway1.relocationMin, pathway1.currencyCode)} - ${formatCurrency(pathway1.relocationMax, pathway1.currencyCode)}`}
                />
              )}
            </div>
          </div>

          {/* Pathway 2 */}
          <div className="space-y-4">
            <div>
              <h3 className="font-semibold text-gray-900 mb-2">{pathway2.pathway_name}</h3>
              <ReviewStatusBadge verificationStatus={pathway2.verificationStatus} size="sm" />
            </div>

            <div className="space-y-3">
              <ComparisonRow
                label="Low Estimate"
                value={formatCurrency(pathway2.lowEstimate, pathway2.currencyCode)}
                icon={<TrendingDown size={16} className="text-green-600" />}
                highlight={pathway2.lowEstimate < pathway1.lowEstimate}
              />
              <ComparisonRow
                label="High Estimate"
                value={formatCurrency(pathway2.highEstimate, pathway2.currencyCode)}
                icon={<TrendingUp size={16} className="text-amber-600" />}
                highlight={pathway2.highEstimate < pathway1.highEstimate}
              />
              {pathway2.proofOfFunds && pathway2.proofOfFunds > 0 && (
                <ComparisonRow
                  label="Proof of Funds"
                  value={formatCurrency(pathway2.proofOfFunds, pathway2.currencyCode)}
                  highlight={!pathway1.proofOfFunds || pathway2.proofOfFunds < pathway1.proofOfFunds}
                />
              )}
              {pathway2.legalMin > 0 && (
                <ComparisonRow
                  label="Legal Fees"
                  value={`${formatCurrency(pathway2.legalMin, pathway2.currencyCode)} - ${formatCurrency(pathway2.legalMax, pathway2.currencyCode)}`}
                />
              )}
              {pathway2.relocationMin > 0 && (
                <ComparisonRow
                  label="Relocation"
                  value={`${formatCurrency(pathway2.relocationMin, pathway2.currencyCode)} - ${formatCurrency(pathway2.relocationMax, pathway2.currencyCode)}`}
                />
              )}
            </div>
          </div>
        </div>

        <div className="mt-4 pt-4 border-t border-gray-200">
          <p className="text-sm text-gray-600 text-center">
            Comparison based on your selected options. Actual costs may vary based on individual circumstances.
          </p>
        </div>
      </CardContent>
    </Card>
  );
}

function ComparisonRow({
  label,
  value,
  icon,
  highlight = false
}: {
  label: string;
  value: string;
  icon?: React.ReactNode;
  highlight?: boolean;
}) {
  return (
    <div className={`flex items-center justify-between p-2 rounded ${highlight ? 'bg-green-50 border border-green-200' : 'bg-gray-50'}`}>
      <div className="flex items-center gap-2">
        {icon}
        <span className="text-sm text-gray-700">{label}</span>
      </div>
      <span className={`text-sm font-semibold ${highlight ? 'text-green-700' : 'text-gray-900'}`}>
        {value}
      </span>
    </div>
  );
}
