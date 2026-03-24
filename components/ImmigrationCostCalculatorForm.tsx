'use client';

import { useState, useEffect } from 'react';
import { Button } from '@/components/ui/button';
import { Label } from '@/components/ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Checkbox } from '@/components/ui/checkbox';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Loader as Loader2, Calculator, RotateCcw } from 'lucide-react';
import {
  ImmigrationCostCountry,
  ImmigrationCostPathway,
  ApplicantType,
  CalculatorInput,
} from '@/lib/immigrationCostTypes';

interface ImmigrationCostCalculatorFormProps {
  passportCountries: ImmigrationCostCountry[];
  destinationCountries: ImmigrationCostCountry[];
  initialPathways?: ImmigrationCostPathway[];
  onCalculate: (input: CalculatorInput) => void;
  isCalculating: boolean;
  prefillDestination?: string;
  prefillPassport?: string;
  prefillPathway?: string;
  prefillApplicantType?: string;
  prefillChildren?: number;
  prefillLegal?: boolean;
  prefillRelocation?: boolean;
  prefillSettlement?: boolean;
}

export default function ImmigrationCostCalculatorForm({
  passportCountries,
  destinationCountries,
  initialPathways,
  onCalculate,
  isCalculating,
  prefillDestination,
  prefillPassport,
  prefillPathway,
  prefillApplicantType,
  prefillChildren,
  prefillLegal,
  prefillRelocation,
  prefillSettlement,
}: ImmigrationCostCalculatorFormProps) {
  const [passportCountry, setPassportCountry] = useState(prefillPassport || '');
  const [destinationCountry, setDestinationCountry] = useState(prefillDestination || '');
  const [pathways, setPathways] = useState<ImmigrationCostPathway[]>(initialPathways || []);
  const [selectedPathway, setSelectedPathway] = useState(prefillPathway || '');
  const [applicantType, setApplicantType] = useState<ApplicantType>((prefillApplicantType as ApplicantType) || 'single');
  const [numberOfChildren, setNumberOfChildren] = useState(prefillChildren || 0);
  const [includeLegalFees, setIncludeLegalFees] = useState(prefillLegal || false);
  const [includeRelocationCosts, setIncludeRelocationCosts] = useState(prefillRelocation || false);
  const [includeSettlementBuffer, setIncludeSettlementBuffer] = useState(prefillSettlement || false);
  const [loadingPathways, setLoadingPathways] = useState(false);
  const [pathwayError, setPathwayError] = useState<string | null>(null);
  const [pathwayCache, setPathwayCache] = useState<Record<string, ImmigrationCostPathway[]>>({});

  useEffect(() => {
    if (destinationCountry && destinationCountry !== prefillDestination) {
      if (pathwayCache[destinationCountry]) {
        setPathways(pathwayCache[destinationCountry]);
        setSelectedPathway('');
        setPathwayError(null);
      } else {
        fetchPathways(destinationCountry);
      }
    } else if (!destinationCountry) {
      setPathways([]);
      setSelectedPathway('');
      setPathwayError(null);
    }
  }, [destinationCountry]);

  async function fetchPathways(countrySlug: string) {
    setLoadingPathways(true);
    setPathwayError(null);
    try {
      const response = await fetch(`/api/immigration-cost/pathways?country=${countrySlug}`);
      if (response.ok) {
        const data = await response.json();
        setPathways(data);
        setPathwayCache(prev => ({ ...prev, [countrySlug]: data }));
        setSelectedPathway('');

        if (data.length === 0) {
          setPathwayError('No immigration pathways are currently available for this destination.');
        }
      } else {
        throw new Error('Failed to load pathways');
      }
    } catch (error) {
      console.error('Error fetching pathways:', error);
      setPathwayError('We could not refresh pathway options right now. Please try again.');
      setPathways([]);
      setSelectedPathway('');
    } finally {
      setLoadingPathways(false);
    }
  }

  function handleCalculate() {
    if (!passportCountry || !destinationCountry || !selectedPathway) {
      return;
    }

    const input: CalculatorInput = {
      passportCountrySlug: passportCountry,
      destinationCountrySlug: destinationCountry,
      pathwayId: selectedPathway,
      applicantType,
      numberOfChildren: applicantType === 'family' ? numberOfChildren : 0,
      includeLegalFees,
      includeRelocationCosts,
      includeSettlementBuffer,
    };

    onCalculate(input);
  }

  function handleReset() {
    setPassportCountry('');
    setDestinationCountry('');
    setSelectedPathway('');
    setPathways([]);
    setApplicantType('single');
    setNumberOfChildren(0);
    setIncludeLegalFees(false);
    setIncludeRelocationCosts(false);
    setIncludeSettlementBuffer(false);
  }

  const canCalculate = passportCountry && destinationCountry && selectedPathway && !isCalculating;

  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Calculator className="w-5 h-5" />
          Cost Calculator
        </CardTitle>
        <CardDescription>
          Select your details to estimate immigration costs
        </CardDescription>
      </CardHeader>
      <CardContent className="space-y-6">
        <div className="space-y-2">
          <Label htmlFor="passport-country">Your Passport Country</Label>
          <Select value={passportCountry} onValueChange={setPassportCountry}>
            <SelectTrigger id="passport-country">
              <SelectValue placeholder="Select passport country" />
            </SelectTrigger>
            <SelectContent>
              {passportCountries.map((country) => (
                <SelectItem key={country.slug} value={country.slug}>
                  {country.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>

        <div className="space-y-2">
          <Label htmlFor="destination-country">Destination Country</Label>
          <Select value={destinationCountry} onValueChange={setDestinationCountry}>
            <SelectTrigger id="destination-country">
              <SelectValue placeholder="Select destination country" />
            </SelectTrigger>
            <SelectContent>
              {destinationCountries.map((country) => (
                <SelectItem key={country.slug} value={country.slug}>
                  {country.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>

        <div className="space-y-2">
          <Label htmlFor="pathway">Immigration Pathway</Label>
          <Select
            value={selectedPathway}
            onValueChange={setSelectedPathway}
            disabled={!destinationCountry || loadingPathways || pathways.length === 0}
          >
            <SelectTrigger id="pathway">
              <SelectValue placeholder={loadingPathways ? 'Loading pathways...' : 'Select immigration pathway'} />
            </SelectTrigger>
            <SelectContent>
              {pathways.map((pathway) => (
                <SelectItem key={pathway.id} value={pathway.id}>
                  <div className="flex items-center gap-2">
                    {pathway.pathway_name}
                    {pathway.is_popular && (
                      <Badge variant="secondary" className="ml-2 text-xs">Popular</Badge>
                    )}
                  </div>
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
          {!destinationCountry && (
            <p className="text-sm text-muted-foreground">Select a destination country first</p>
          )}
          {pathwayError && (
            <div className="bg-destructive/10 text-destructive text-sm p-3 rounded-md border border-destructive/20">
              {pathwayError}
            </div>
          )}
        </div>

        <div className="space-y-3">
          <Label>Applicant Type</Label>
          <div className="flex gap-2">
            <Button
              type="button"
              variant={applicantType === 'single' ? 'default' : 'outline'}
              onClick={() => setApplicantType('single')}
              className="flex-1"
            >
              Single
            </Button>
            <Button
              type="button"
              variant={applicantType === 'couple' ? 'default' : 'outline'}
              onClick={() => setApplicantType('couple')}
              className="flex-1"
            >
              Couple
            </Button>
            <Button
              type="button"
              variant={applicantType === 'family' ? 'default' : 'outline'}
              onClick={() => setApplicantType('family')}
              className="flex-1"
            >
              Family
            </Button>
          </div>
        </div>

        {applicantType === 'family' && (
          <div className="space-y-2">
            <Label htmlFor="children">Number of Children</Label>
            <Select
              value={numberOfChildren.toString()}
              onValueChange={(val) => setNumberOfChildren(parseInt(val))}
            >
              <SelectTrigger id="children">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {[0, 1, 2, 3, 4, 5].map((num) => (
                  <SelectItem key={num} value={num.toString()}>
                    {num} {num === 1 ? 'child' : 'children'}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        )}

        <div className="space-y-3 pt-2 border-t">
          <Label>Optional Costs to Include</Label>

          <div className="flex items-center space-x-2">
            <Checkbox
              id="legal-fees"
              checked={includeLegalFees}
              onCheckedChange={(checked) => setIncludeLegalFees(checked as boolean)}
            />
            <label
              htmlFor="legal-fees"
              className="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
            >
              Include legal / consultant fees
            </label>
          </div>

          <div className="flex items-center space-x-2">
            <Checkbox
              id="relocation"
              checked={includeRelocationCosts}
              onCheckedChange={(checked) => setIncludeRelocationCosts(checked as boolean)}
            />
            <label
              htmlFor="relocation"
              className="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
            >
              Include relocation costs (flights, shipping)
            </label>
          </div>

          <div className="flex items-center space-x-2">
            <Checkbox
              id="settlement"
              checked={includeSettlementBuffer}
              onCheckedChange={(checked) => setIncludeSettlementBuffer(checked as boolean)}
            />
            <label
              htmlFor="settlement"
              className="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
            >
              Include settlement buffer (initial accommodation, etc.)
            </label>
          </div>
        </div>

        <div className="flex gap-3 pt-4">
          <Button
            onClick={handleCalculate}
            disabled={!canCalculate}
            className="flex-1"
          >
            {isCalculating && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
            Calculate Costs
          </Button>
          <Button
            type="button"
            variant="outline"
            onClick={handleReset}
          >
            <RotateCcw className="h-4 w-4" />
          </Button>
        </div>
      </CardContent>
    </Card>
  );
}
