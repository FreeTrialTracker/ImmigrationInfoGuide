'use client';

import { useState, useEffect } from 'react';
import { MapPin, Plus, X, TrendingUp, DollarSign, Clock, Users, GraduationCap, Chrome as Home, Heart } from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Badge } from '@/components/ui/badge';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { Skeleton } from '@/components/ui/skeleton';
import { useToast } from '@/hooks/use-toast';
import { supabase } from '@/lib/supabaseClient';

interface Country {
  id: string;
  name: string;
  slug: string;
  region: string;
  official_language: string;
  currency: string;
  capital_city: string;
}

interface CountryGuide {
  cost_of_living_index: number | null;
  quality_of_life_score: number | null;
  ease_of_immigration_score: number | null;
  healthcare_quality: string | null;
  education_system: string | null;
  climate: string | null;
  popular_cities: string[] | null;
}

interface Pathway {
  id: string;
  pathway_type: string;
  min_investment_usd: number | null;
  min_income_requirement_usd: number | null;
  processing_time_months: string | null;
  language_requirement: string | null;
  popularity_score: number | null;
}

interface CountryData {
  country: Country;
  guide: CountryGuide | null;
  pathways: Pathway[];
}

const countryOptions = [
  { value: 'canada', label: 'Canada' },
  { value: 'united-states', label: 'United States' },
  { value: 'united-kingdom', label: 'United Kingdom' },
  { value: 'australia', label: 'Australia' },
  { value: 'germany', label: 'Germany' },
  { value: 'new-zealand', label: 'New Zealand' },
  { value: 'spain', label: 'Spain' },
  { value: 'portugal', label: 'Portugal' },
  { value: 'france', label: 'France' },
  { value: 'netherlands', label: 'Netherlands' },
  { value: 'italy', label: 'Italy' },
  { value: 'ireland', label: 'Ireland' },
  { value: 'japan', label: 'Japan' },
  { value: 'singapore', label: 'Singapore' },
  { value: 'south-korea', label: 'South Korea' },
  { value: 'mexico', label: 'Mexico' },
  { value: 'thailand', label: 'Thailand' },
  { value: 'malaysia', label: 'Malaysia' },
  { value: 'uae', label: 'United Arab Emirates' },
  { value: 'switzerland', label: 'Switzerland' },
];

const pathwayTypeLabels: Record<string, string> = {
  'work': 'Work Visa',
  'study': 'Study Visa',
  'digital-nomad': 'Digital Nomad',
  'retirement': 'Retirement',
  'investor': 'Investor/Business',
  'family': 'Family Sponsorship',
  'permanent-residency': 'Permanent Residency',
};

export default function CountryComparisonClient() {
  const [selectedCountries, setSelectedCountries] = useState<string[]>([]);
  const [countryData, setCountryData] = useState<Record<string, CountryData>>({});
  const [loading, setLoading] = useState(false);
  const [addingCountry, setAddingCountry] = useState('');
  const { toast } = useToast();

  const loadCountryData = async (countrySlug: string) => {
    try {
      // Fetch country basic info
      const countryResponse = await supabase
        .from('countries')
        .select('*')
        .eq('slug', countrySlug)
        .maybeSingle();

      const country = countryResponse.data;
      if (!country) return null;

      // Fetch country guide
      const guideResponse = await supabase
        .from('country_guides')
        .select('cost_of_living_index, quality_of_life_score, ease_of_immigration_score, healthcare_quality, education_system, climate, popular_cities')
        .eq('country_slug', countrySlug)
        .maybeSingle();

      // Fetch pathways
      const pathwaysResponse = await supabase
        .from('immigration_pathways')
        .select('id, pathway_type, min_investment_usd, min_income_requirement_usd, processing_time_months, language_requirement, popularity_score')
        .eq('destination_slug', countrySlug)
        .order('popularity_score', { ascending: false, nullsFirst: false })
        .limit(10);

      return {
        country: country as Country,
        guide: guideResponse.data || null,
        pathways: pathwaysResponse.data || [],
      };
    } catch (error) {
      console.error('Error loading country data:', error);
      return null;
    }
  };

  const handleAddCountry = async () => {
    if (!addingCountry || selectedCountries.includes(addingCountry)) {
      return;
    }

    if (selectedCountries.length >= 4) {
      toast({
        title: 'Maximum countries reached',
        description: 'You can compare up to 4 countries at once.',
        variant: 'destructive',
      });
      return;
    }

    setLoading(true);
    const data = await loadCountryData(addingCountry);

    if (data) {
      setSelectedCountries(prev => [...prev, addingCountry]);
      setCountryData(prev => ({
        ...prev,
        [addingCountry]: data,
      }));
    } else {
      toast({
        title: 'Could not load country data',
        description: 'Please try again or select a different country.',
        variant: 'destructive',
      });
    }

    setAddingCountry('');
    setLoading(false);
  };

  const handleRemoveCountry = (countrySlug: string) => {
    setSelectedCountries(prev => prev.filter(c => c !== countrySlug));
    setCountryData(prev => {
      const newData = { ...prev };
      delete newData[countrySlug];
      return newData;
    });
  };

  const getPathwaysByType = (data: CountryData) => {
    const grouped: Record<string, Pathway[]> = {};
    data.pathways.forEach(pathway => {
      if (!grouped[pathway.pathway_type]) {
        grouped[pathway.pathway_type] = [];
      }
      grouped[pathway.pathway_type].push(pathway);
    });
    return grouped;
  };

  const getScoreColor = (score: number | null) => {
    if (!score) return 'text-gray-400';
    if (score >= 80) return 'text-green-600';
    if (score >= 60) return 'text-blue-600';
    if (score >= 40) return 'text-yellow-600';
    return 'text-red-600';
  };

  const getScoreBadge = (score: number | null) => {
    if (!score) return 'N/A';
    if (score >= 80) return 'Excellent';
    if (score >= 60) return 'Good';
    if (score >= 40) return 'Fair';
    return 'Challenging';
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="text-center mb-8">
          <div className="inline-flex items-center justify-center w-16 h-16 bg-indigo-100 rounded-full mb-4">
            <MapPin className="w-8 h-8 text-brand-primary" />
          </div>
          <h1 className="text-3xl font-bold text-gray-900 mb-3">
            Country Comparison Tool
          </h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Compare immigration destinations side by side to find the best match for your goals
          </p>
        </div>

        <Card className="mb-8">
          <CardHeader>
            <CardTitle>Select Countries to Compare</CardTitle>
            <CardDescription>
              Choose up to 4 countries to compare their immigration options, costs, and quality of life
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="flex flex-col sm:flex-row gap-4">
              <div className="flex-1">
                <Select value={addingCountry} onValueChange={setAddingCountry}>
                  <SelectTrigger>
                    <SelectValue placeholder="Select a country to add" />
                  </SelectTrigger>
                  <SelectContent>
                    {countryOptions
                      .filter(c => !selectedCountries.includes(c.value))
                      .map(country => (
                        <SelectItem key={country.value} value={country.value}>
                          {country.label}
                        </SelectItem>
                      ))}
                  </SelectContent>
                </Select>
              </div>
              <Button
                onClick={handleAddCountry}
                disabled={!addingCountry || loading || selectedCountries.length >= 4}
                className="bg-brand-primary hover:bg-indigo-700"
              >
                <Plus className="w-4 h-4 mr-2" />
                Add Country
              </Button>
            </div>

            {selectedCountries.length > 0 && (
              <div className="flex flex-wrap gap-2 mt-4">
                {selectedCountries.map(slug => (
                  <Badge key={slug} variant="secondary" className="text-sm py-1 px-3">
                    {countryOptions.find(c => c.value === slug)?.label}
                    <button
                      onClick={() => handleRemoveCountry(slug)}
                      className="ml-2 text-gray-500 hover:text-gray-700"
                    >
                      <X className="w-3 h-3" />
                    </button>
                  </Badge>
                ))}
              </div>
            )}
          </CardContent>
        </Card>

        {loading && (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 mb-6">
            <Card>
              <CardHeader>
                <Skeleton className="h-5 w-32" />
                <Skeleton className="h-4 w-20 mt-1" />
              </CardHeader>
              <CardContent className="space-y-4">
                <Skeleton className="h-8 w-full" />
                <Skeleton className="h-8 w-full" />
                <Skeleton className="h-20 w-full" />
              </CardContent>
            </Card>
          </div>
        )}

        {!loading && selectedCountries.length === 0 && (
          <div className="text-center py-12 bg-white rounded-lg border border-gray-200">
            <MapPin className="w-16 h-16 text-gray-300 mx-auto mb-4" />
            <h3 className="text-lg font-medium text-gray-900 mb-2">No Countries Selected</h3>
            <p className="text-gray-600">
              Select countries above to start comparing immigration options
            </p>
          </div>
        )}

        {selectedCountries.length > 0 && (
          <Tabs defaultValue="overview" className="space-y-6">
            <TabsList className="grid w-full grid-cols-4">
              <TabsTrigger value="overview">Overview</TabsTrigger>
              <TabsTrigger value="pathways">Pathways</TabsTrigger>
              <TabsTrigger value="costs">Costs</TabsTrigger>
              <TabsTrigger value="lifestyle">Lifestyle</TabsTrigger>
            </TabsList>

            <TabsContent value="overview" className="space-y-6">
              <div className="grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                {selectedCountries.map(slug => {
                  const data = countryData[slug];
                  if (!data) return null;

                  return (
                    <Card key={slug}>
                      <CardHeader>
                        <CardTitle className="flex items-center justify-between">
                          {data.country.name}
                          <button
                            onClick={() => handleRemoveCountry(slug)}
                            className="text-gray-400 hover:text-gray-600"
                          >
                            <X className="w-4 h-4" />
                          </button>
                        </CardTitle>
                        <CardDescription>{data.country.region}</CardDescription>
                      </CardHeader>
                      <CardContent className="space-y-4">
                        <div>
                          <div className="text-sm text-gray-600 mb-1">Quality of Life</div>
                          <div className="flex items-center justify-between">
                            <span className={`text-2xl font-bold ${getScoreColor(data.guide?.quality_of_life_score || null)}`}>
                              {data.guide?.quality_of_life_score || 'N/A'}
                            </span>
                            <Badge variant="outline">
                              {getScoreBadge(data.guide?.quality_of_life_score || null)}
                            </Badge>
                          </div>
                        </div>

                        <div>
                          <div className="text-sm text-gray-600 mb-1">Ease of Immigration</div>
                          <div className="flex items-center justify-between">
                            <span className={`text-2xl font-bold ${getScoreColor(data.guide?.ease_of_immigration_score || null)}`}>
                              {data.guide?.ease_of_immigration_score || 'N/A'}
                            </span>
                            <Badge variant="outline">
                              {getScoreBadge(data.guide?.ease_of_immigration_score || null)}
                            </Badge>
                          </div>
                        </div>

                        <div className="pt-4 border-t space-y-2">
                          <div className="flex justify-between text-sm">
                            <span className="text-gray-600">Language</span>
                            <span className="font-medium">{data.country.official_language}</span>
                          </div>
                          <div className="flex justify-between text-sm">
                            <span className="text-gray-600">Currency</span>
                            <span className="font-medium">{data.country.currency}</span>
                          </div>
                          <div className="flex justify-between text-sm">
                            <span className="text-gray-600">Capital</span>
                            <span className="font-medium">{data.country.capital_city}</span>
                          </div>
                          <div className="flex justify-between text-sm">
                            <span className="text-gray-600">Pathways</span>
                            <span className="font-medium">{data.pathways.length}</span>
                          </div>
                        </div>
                      </CardContent>
                    </Card>
                  );
                })}
              </div>
            </TabsContent>

            <TabsContent value="pathways" className="space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle>Available Immigration Pathways</CardTitle>
                  <CardDescription>
                    Compare the types of visas and immigration programs available in each country
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                      <thead className="bg-gray-50">
                        <tr>
                          <th className="text-left p-3 font-semibold text-gray-700">Pathway Type</th>
                          {selectedCountries.map(slug => (
                            <th key={slug} className="text-center p-3 font-semibold text-gray-700">
                              {countryData[slug]?.country.name}
                            </th>
                          ))}
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-200">
                        {Object.keys(pathwayTypeLabels).map(pathwayType => (
                          <tr key={pathwayType} className="hover:bg-gray-50">
                            <td className="p-3 font-medium text-gray-900">
                              {pathwayTypeLabels[pathwayType]}
                            </td>
                            {selectedCountries.map(slug => {
                              const data = countryData[slug];
                              const hasPathway = data?.pathways.some(p => p.pathway_type === pathwayType);
                              const pathwayCount = data?.pathways.filter(p => p.pathway_type === pathwayType).length || 0;

                              return (
                                <td key={slug} className="p-3 text-center">
                                  {hasPathway ? (
                                    <div className="flex items-center justify-center">
                                      <Badge className="bg-green-100 text-green-700 hover:bg-green-100">
                                        {pathwayCount} {pathwayCount === 1 ? 'option' : 'options'}
                                      </Badge>
                                    </div>
                                  ) : (
                                    <span className="text-gray-400">-</span>
                                  )}
                                </td>
                              );
                            })}
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </CardContent>
              </Card>

              {selectedCountries.map(slug => {
                const data = countryData[slug];
                if (!data || data.pathways.length === 0) return null;

                return (
                  <Card key={slug}>
                    <CardHeader>
                      <CardTitle>{data.country.name} - Top Pathways</CardTitle>
                      <CardDescription>Most popular immigration options</CardDescription>
                    </CardHeader>
                    <CardContent>
                      <div className="grid md:grid-cols-2 gap-4">
                        {data.pathways.slice(0, 6).map(pathway => (
                          <div key={pathway.id} className="border rounded-lg p-4">
                            <div className="flex items-start justify-between mb-2">
                              <h4 className="font-semibold text-gray-900">
                                {pathwayTypeLabels[pathway.pathway_type] || pathway.pathway_type}
                              </h4>
                              {pathway.popularity_score && (
                                <Badge variant="outline" className="text-xs">
                                  <TrendingUp className="w-3 h-3 mr-1" />
                                  {pathway.popularity_score}
                                </Badge>
                              )}
                            </div>
                            <div className="space-y-1 text-sm">
                              {pathway.processing_time_months && (
                                <div className="flex items-center text-gray-600">
                                  <Clock className="w-4 h-4 mr-2" />
                                  {pathway.processing_time_months} months
                                </div>
                              )}
                              {pathway.language_requirement && (
                                <div className="text-gray-600">
                                  Language: {pathway.language_requirement}
                                </div>
                              )}
                            </div>
                          </div>
                        ))}
                      </div>
                    </CardContent>
                  </Card>
                );
              })}
            </TabsContent>

            <TabsContent value="costs" className="space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle>Cost Comparison</CardTitle>
                  <CardDescription>
                    Compare living costs and financial requirements
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                    {selectedCountries.map(slug => {
                      const data = countryData[slug];
                      if (!data) return null;

                      const minInvestment = Math.min(
                        ...data.pathways
                          .map(p => p.min_investment_usd)
                          .filter((v): v is number => v !== null)
                      );

                      const minIncome = Math.min(
                        ...data.pathways
                          .map(p => p.min_income_requirement_usd)
                          .filter((v): v is number => v !== null)
                      );

                      return (
                        <Card key={slug}>
                          <CardHeader>
                            <CardTitle className="text-lg">{data.country.name}</CardTitle>
                          </CardHeader>
                          <CardContent className="space-y-4">
                            <div>
                              <div className="flex items-center text-sm text-gray-600 mb-1">
                                <DollarSign className="w-4 h-4 mr-1" />
                                Cost of Living Index
                              </div>
                              <div className="text-2xl font-bold text-gray-900">
                                {data.guide?.cost_of_living_index || 'N/A'}
                              </div>
                            </div>

                            {isFinite(minInvestment) && (
                              <div>
                                <div className="text-sm text-gray-600 mb-1">Min Investment</div>
                                <div className="text-lg font-semibold text-gray-900">
                                  ${minInvestment.toLocaleString()}
                                </div>
                              </div>
                            )}

                            {isFinite(minIncome) && (
                              <div>
                                <div className="text-sm text-gray-600 mb-1">Min Income Req.</div>
                                <div className="text-lg font-semibold text-gray-900">
                                  ${minIncome.toLocaleString()}/year
                                </div>
                              </div>
                            )}
                          </CardContent>
                        </Card>
                      );
                    })}
                  </div>
                </CardContent>
              </Card>
            </TabsContent>

            <TabsContent value="lifestyle" className="space-y-6">
              <div className="grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                {selectedCountries.map(slug => {
                  const data = countryData[slug];
                  if (!data) return null;

                  return (
                    <Card key={slug}>
                      <CardHeader>
                        <CardTitle>{data.country.name}</CardTitle>
                      </CardHeader>
                      <CardContent className="space-y-4">
                        <div>
                          <div className="flex items-center text-sm font-semibold text-gray-700 mb-2">
                            <Heart className="w-4 h-4 mr-2 text-red-500" />
                            Healthcare
                          </div>
                          <p className="text-sm text-gray-600">
                            {data.guide?.healthcare_quality || 'Information not available'}
                          </p>
                        </div>

                        <div>
                          <div className="flex items-center text-sm font-semibold text-gray-700 mb-2">
                            <GraduationCap className="w-4 h-4 mr-2 text-blue-500" />
                            Education
                          </div>
                          <p className="text-sm text-gray-600">
                            {data.guide?.education_system || 'Information not available'}
                          </p>
                        </div>

                        <div>
                          <div className="flex items-center text-sm font-semibold text-gray-700 mb-2">
                            <Home className="w-4 h-4 mr-2 text-green-500" />
                            Climate
                          </div>
                          <p className="text-sm text-gray-600">
                            {data.guide?.climate || 'Information not available'}
                          </p>
                        </div>

                        {data.guide?.popular_cities && data.guide.popular_cities.length > 0 && (
                          <div>
                            <div className="flex items-center text-sm font-semibold text-gray-700 mb-2">
                              <Users className="w-4 h-4 mr-2 text-purple-500" />
                              Popular Cities
                            </div>
                            <div className="flex flex-wrap gap-1">
                              {data.guide.popular_cities.slice(0, 3).map((city, idx) => (
                                <Badge key={idx} variant="secondary" className="text-xs">
                                  {city}
                                </Badge>
                              ))}
                            </div>
                          </div>
                        )}
                      </CardContent>
                    </Card>
                  );
                })}
              </div>
            </TabsContent>
          </Tabs>
        )}
      </div>
    </div>
  );
}
