import { MapPin, Briefcase, Shield, Banknote, Users } from 'lucide-react';
import { Card, CardContent } from '@/components/ui/card';

interface PathwayQuickFactsProps {
  destinationCountry: string;
  pathwayType: string;
  feeModel: string;
  verificationStatus: string;
  hasProofOfFunds: boolean;
  isFamilyFriendly: boolean;
}

export function PathwayQuickFacts({
  destinationCountry,
  pathwayType,
  feeModel,
  verificationStatus,
  hasProofOfFunds,
  isFamilyFriendly
}: PathwayQuickFactsProps) {
  const facts = [
    {
      icon: <MapPin size={18} className="text-brand-primary" />,
      label: 'Destination',
      value: destinationCountry.split('-').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ')
    },
    {
      icon: <Briefcase size={18} className="text-brand-primary" />,
      label: 'Pathway Type',
      value: pathwayType
    },
    {
      icon: <Shield size={18} className="text-brand-primary" />,
      label: 'Data Quality',
      value: feeModel === 'exact' ? 'Exact Fees' : feeModel === 'range' ? 'Fee Range' : 'Mixed Data'
    },
    {
      icon: <Banknote size={18} className="text-brand-primary" />,
      label: 'Proof of Funds',
      value: hasProofOfFunds ? 'Required' : 'Not Required'
    },
    {
      icon: <Users size={18} className="text-brand-primary" />,
      label: 'Family Friendly',
      value: isFamilyFriendly ? 'Yes' : 'Individual Only'
    }
  ];

  return (
    <Card className="bg-gradient-to-br from-indigo-50 to-blue-50 border-indigo-200">
      <CardContent className="pt-6">
        <h3 className="text-sm font-semibold text-gray-700 uppercase tracking-wide mb-4">
          Quick Facts
        </h3>
        <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
          {facts.map((fact, index) => (
            <div key={index} className="flex flex-col items-center text-center p-3 bg-white rounded-lg">
              <div className="mb-2">{fact.icon}</div>
              <div className="text-xs text-gray-600 mb-1">{fact.label}</div>
              <div className="text-sm font-semibold text-gray-900">{fact.value}</div>
            </div>
          ))}
        </div>
      </CardContent>
    </Card>
  );
}
