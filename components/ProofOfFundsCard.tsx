import { Banknote, CircleAlert as AlertCircle } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { formatCurrency } from '@/lib/immigrationCostUtils';

interface ProofOfFundsCardProps {
  amount: number;
  currencyCode: string;
}

export function ProofOfFundsCard({ amount, currencyCode }: ProofOfFundsCardProps) {
  if (!amount || amount <= 0) return null;

  return (
    <Card className="border-2 border-blue-200 bg-blue-50/50">
      <CardHeader>
        <CardTitle className="text-lg font-semibold text-gray-900 flex items-center gap-2">
          <Banknote size={20} className="text-blue-600" />
          Proof of Funds Requirement
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-3">
        <div className="text-center p-4 bg-white rounded-lg border border-blue-300">
          <div className="text-3xl font-bold text-blue-700">
            {formatCurrency(amount, currencyCode)}
          </div>
          <p className="text-sm text-gray-600 mt-1">Required financial threshold</p>
        </div>

        <div className="flex items-start gap-2 p-3 bg-blue-100 rounded-lg">
          <AlertCircle className="text-blue-700 shrink-0 mt-0.5" size={18} />
          <div className="text-sm text-blue-900">
            <p className="font-semibold mb-1">Important Note</p>
            <p>
              Proof of funds is usually money you may need to show, not necessarily money you pay as a fee.
              This demonstrates you have sufficient financial resources to support yourself during the initial period.
            </p>
          </div>
        </div>

        <p className="text-xs text-gray-600 italic">
          Requirements vary by visa type and individual circumstances. Some pathways may require funds to be held for a specific period or in specific account types.
        </p>
      </CardContent>
    </Card>
  );
}
