import { COUNTRIES_52 } from './countries52';

export interface StarterPassport {
  slug: string;
  name: string;
}

export const starterPassports: StarterPassport[] = COUNTRIES_52.map(c => ({
  slug: c.slug,
  name: c.name
}));
