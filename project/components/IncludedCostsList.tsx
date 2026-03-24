import { CircleCheck as CheckCircle } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { CostInclusion } from '@/lib/immigrationCostUtils';

interface IncludedCostsListProps {
  inclusions: CostInclusion[];
}

export function IncludedCostsList({ inclusions }: IncludedCostsListProps) {
  if (inclusions.length === 0) return null;

  return (
    <Card>
      <CardHeader>
        <CardTitle className="text-lg font-semibold text-gray-900">What's Included</CardTitle>
      </CardHeader>
      <CardContent>
        <ul className="space-y-3">
          {inclusions.map((inclusion) => (
            <li key={inclusion.id} className="flex items-start gap-3">
              <CheckCircle className="text-brand-primary shrink-0 mt-0.5" size={18} />
              <div>
                <div className="font-medium text-gray-900">{inclusion.label}</div>
                {inclusion.description && (
                  <p className="text-sm text-gray-600 mt-0.5">{inclusion.description}</p>
                )}
              </div>
            </li>
          ))}
        </ul>
      </CardContent>
    </Card>
  );
}
