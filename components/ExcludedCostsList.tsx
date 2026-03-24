import { Circle as XCircle } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { CostExclusion } from '@/lib/immigrationCostUtils';

interface ExcludedCostsListProps {
  exclusions: CostExclusion[];
}

export function ExcludedCostsList({ exclusions }: ExcludedCostsListProps) {
  if (exclusions.length === 0) return null;

  return (
    <Card className="border-amber-200 bg-amber-50/30">
      <CardHeader>
        <CardTitle className="text-lg font-semibold text-gray-900">Not Included</CardTitle>
      </CardHeader>
      <CardContent>
        <ul className="space-y-3">
          {exclusions.map((exclusion) => (
            <li key={exclusion.id} className="flex items-start gap-3">
              <XCircle className="text-amber-600 shrink-0 mt-0.5" size={18} />
              <div>
                <div className="font-medium text-gray-900">{exclusion.label}</div>
                {exclusion.description && (
                  <p className="text-sm text-gray-600 mt-0.5">{exclusion.description}</p>
                )}
              </div>
            </li>
          ))}
        </ul>
      </CardContent>
    </Card>
  );
}
