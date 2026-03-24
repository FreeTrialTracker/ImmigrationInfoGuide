import Link from 'next/link';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { ArrowRight, MapPin } from 'lucide-react';
import { PathwayWithPopularity } from '@/lib/immigrationCostUtils';

interface FeaturedPathwaysGridProps {
  pathways: PathwayWithPopularity[];
  title?: string;
  showCountryName?: boolean;
}

export function FeaturedPathwaysGrid({
  pathways,
  title = 'Featured Immigration Pathways',
  showCountryName = true
}: FeaturedPathwaysGridProps) {
  if (pathways.length === 0) return null;

  return (
    <div>
      <h2 className="text-2xl font-bold text-gray-900 mb-6">{title}</h2>
      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
        {pathways.map((pathway) => (
          <Card key={pathway.id} className="hover:shadow-lg transition-shadow">
            <CardHeader>
              <CardTitle className="text-lg font-semibold text-gray-900 line-clamp-2">
                {pathway.pathway_name}
              </CardTitle>
              {showCountryName && (
                <div className="flex items-center gap-1 text-sm text-gray-600 mt-1">
                  <MapPin size={14} />
                  <span className="capitalize">{pathway.destination_slug.replace(/-/g, ' ')}</span>
                </div>
              )}
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                <div className="flex items-center gap-2">
                  <span className="inline-block px-2 py-1 text-xs font-medium rounded-full bg-indigo-100 text-indigo-800">
                    {pathway.goal}
                  </span>
                  {pathway.is_featured && (
                    <span className="inline-block px-2 py-1 text-xs font-medium rounded-full bg-amber-100 text-amber-800">
                      Popular
                    </span>
                  )}
                </div>

                <Link
                  href={`/immigration-cost/${pathway.destination_slug}/${encodeURIComponent(pathway.pathway_name.toLowerCase().replace(/\s+/g, '-').replace(/[()]/g, ''))}`}
                >
                  <Button variant="outline" className="w-full group">
                    View Cost Details
                    <ArrowRight size={16} className="ml-2 group-hover:translate-x-1 transition-transform" />
                  </Button>
                </Link>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
