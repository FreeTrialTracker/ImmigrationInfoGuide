export interface PathwayType {
  slug: string;
  type: string;
  title: string;
  description: string;
}

export const PATHWAY_TYPES: PathwayType[] = [
  {
    slug: 'work-visa',
    type: 'Work',
    title: 'Work Visa and Employment Immigration',
    description: 'Employment-based residence permits and work authorization pathways',
  },
  {
    slug: 'study-visa',
    type: 'Study',
    title: 'Student Visa and Education Immigration',
    description: 'Student visas and education-based residence options',
  },
  {
    slug: 'digital-nomad-visa',
    type: 'Digital Nomad',
    title: 'Digital Nomad and Remote Work Visas',
    description: 'Remote work visas and digital nomad residence programs',
  },
  {
    slug: 'retirement-visa',
    type: 'Retirement',
    title: 'Retirement Visas and Long-Stay Options',
    description: 'Retirement residence permits and long-term stay visas',
  },
  {
    slug: 'investor-visa',
    type: 'Investor',
    title: 'Investor Visas and Residency by Investment',
    description: 'Investment-based residence and citizenship by investment programs',
  },
  {
    slug: 'family-visa',
    type: 'Family',
    title: 'Family Visa and Reunification',
    description: 'Family reunification visas and spouse-dependent residence permits',
  },
];

export function getPathwayTypeBySlug(slug: string): PathwayType | undefined {
  return PATHWAY_TYPES.find((pt) => pt.slug === slug);
}

export function getPathwayTypeByType(type: string): PathwayType | undefined {
  return PATHWAY_TYPES.find((pt) => pt.type === type);
}

export function parsePathwayRoute(route: string): { pathwaySlug: string; countrySlug: string } | null {
  const parts = route.split('-');

  if (parts.length < 3) return null;

  for (const pathwayType of PATHWAY_TYPES) {
    const pathwayParts = pathwayType.slug.split('-');

    if (parts.length >= pathwayParts.length) {
      const possiblePathway = parts.slice(0, pathwayParts.length).join('-');

      if (possiblePathway === pathwayType.slug) {
        const countrySlug = parts.slice(pathwayParts.length).join('-');
        return { pathwaySlug: possiblePathway, countrySlug };
      }
    }
  }

  return null;
}
