import { Info } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';

interface CostAssumptionsCardProps {
  legalAssumption?: string;
  relocationAssumption?: string;
  settlementAssumption?: string;
  includeLegal: boolean;
  includeRelocation: boolean;
  includeSettlement: boolean;
  familySize: string;
}

export function CostAssumptionsCard({
  legalAssumption,
  relocationAssumption,
  settlementAssumption,
  includeLegal,
  includeRelocation,
  includeSettlement,
  familySize
}: CostAssumptionsCardProps) {
  const hasAnyAssumptions = includeLegal || includeRelocation || includeSettlement;

  if (!hasAnyAssumptions) return null;

  const assumptions = [];

  if (includeLegal && legalAssumption) {
    assumptions.push({
      label: 'Legal Fees',
      text: legalAssumption
    });
  }

  if (includeRelocation && relocationAssumption) {
    assumptions.push({
      label: 'Relocation Costs',
      text: relocationAssumption
    });
  }

  if (includeSettlement && settlementAssumption) {
    assumptions.push({
      label: 'Settlement Buffer',
      text: settlementAssumption
    });
  }

  assumptions.push({
    label: 'Family Size',
    text: `Calculated for ${familySize === 'single' ? 'a single applicant' : familySize === 'couple' ? 'a couple (2 adults)' : familySize === 'family-3' ? 'a family of 3' : 'a family of 4'}${familySize !== 'single' ? ' including all applicable dependent fees' : ''}.`
  });

  return (
    <Card className="bg-gray-50">
      <CardHeader>
        <CardTitle className="text-lg font-semibold text-gray-900 flex items-center gap-2">
          <Info size={20} className="text-gray-600" />
          Cost Assumptions
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-3">
          {assumptions.map((assumption, index) => (
            <div key={index} className="text-sm">
              <div className="font-semibold text-gray-900 mb-1">{assumption.label}</div>
              <p className="text-gray-700">{assumption.text}</p>
            </div>
          ))}
          <div className="pt-2 mt-3 border-t border-gray-300">
            <p className="text-xs text-gray-600 italic">
              Official immigration costs can change without notice. Always verify current fees with immigration authorities before applying.
            </p>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
