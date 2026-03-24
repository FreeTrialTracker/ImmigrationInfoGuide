import { ReviewStatusBadge } from './ReviewStatusBadge';
import { formatCurrency, getConfidenceMessage } from '@/lib/immigrationCostUtils';
import { Calendar, TrendingUp, TrendingDown, DollarSign } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';

interface EstimateTrustPanelProps {
  lowEstimate: number;
  midEstimate: number;
  highEstimate: number;
  currencyCode: string;
  verificationStatus: string;
  feeModel: string;
  lastVerifiedAt?: string;
}

export function EstimateTrustPanel({
  lowEstimate,
  midEstimate,
  highEstimate,
  currencyCode,
  verificationStatus,
  feeModel,
  lastVerifiedAt
}: EstimateTrustPanelProps) {
  const confidenceMessage = getConfidenceMessage(verificationStatus, feeModel);

  return (
    <Card className="border-2 border-indigo-200 bg-indigo-50/30">
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle className="text-xl font-bold text-gray-900">Estimate Summary</CardTitle>
          <ReviewStatusBadge verificationStatus={verificationStatus} size="md" />
        </div>
      </CardHeader>
      <CardContent className="space-y-4">
        <div className="grid gap-3">
          <div className="flex items-center justify-between p-3 bg-white rounded-lg border border-gray-200">
            <div className="flex items-center gap-2">
              <TrendingDown className="text-green-600" size={20} />
              <span className="font-medium text-gray-700">Low Estimate</span>
            </div>
            <span className="text-lg font-bold text-gray-900">
              {formatCurrency(lowEstimate, currencyCode)}
            </span>
          </div>

          <div className="flex items-center justify-between p-3 bg-indigo-50 rounded-lg border border-indigo-300">
            <div className="flex items-center gap-2">
              <DollarSign className="text-brand-primary" size={20} />
              <span className="font-semibold text-gray-900">Mid Estimate</span>
            </div>
            <span className="text-xl font-bold text-indigo-700">
              {formatCurrency(midEstimate, currencyCode)}
            </span>
          </div>

          <div className="flex items-center justify-between p-3 bg-white rounded-lg border border-gray-200">
            <div className="flex items-center gap-2">
              <TrendingUp className="text-amber-600" size={20} />
              <span className="font-medium text-gray-700">High Estimate</span>
            </div>
            <span className="text-lg font-bold text-gray-900">
              {formatCurrency(highEstimate, currencyCode)}
            </span>
          </div>
        </div>

        <div className="p-3 bg-white rounded-lg border border-gray-200">
          <div className="flex items-start gap-2">
            <Calendar className="text-gray-500 mt-0.5 shrink-0" size={16} />
            <div className="text-sm">
              <span className="text-gray-600">Last reviewed: </span>
              <span className="font-medium text-gray-900">
                {lastVerifiedAt
                  ? new Date(lastVerifiedAt).toLocaleDateString('en-US', {
                      year: 'numeric',
                      month: 'long',
                      day: 'numeric'
                    })
                  : 'Not verified'}
              </span>
            </div>
          </div>
        </div>

        <div className="p-3 bg-blue-50 rounded-lg border border-blue-200">
          <p className="text-sm text-blue-900">
            {confidenceMessage}
          </p>
        </div>
      </CardContent>
    </Card>
  );
}
