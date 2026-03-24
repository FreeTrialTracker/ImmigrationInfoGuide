import type { PassportMeta } from './passportData';

const BASE_URL = 'https://immigrationinfoguide.com';

export interface PassportPageMetadata {
  title: string;
  description: string;
  canonical: string;
  ogTitle: string;
  ogDescription: string;
  ogUrl: string;
  shouldIndex: boolean;
}

export function buildPassportPageMetadata(passport: PassportMeta): PassportPageMetadata {
  const { citizenLabel, name, slug, isIndexable } = passport;
  const canonical = `${BASE_URL}/passport/${slug}`;

  const title = `Immigration Options for ${citizenLabel} – Where to Move in 2026`;
  const description = `Explore top immigration destinations, work and residency pathways, and planning resources for ${citizenLabel}. Find where your passport opens doors for relocation.`;

  return {
    title: `${title} | ImmigrationInfoGuide`,
    description,
    canonical,
    ogTitle: title,
    ogDescription: description,
    ogUrl: canonical,
    shouldIndex: isIndexable,
  };
}

export function buildPassportBreadcrumbSchema(
  passportName: string,
  slug: string,
): object {
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: [
      {
        '@type': 'ListItem',
        position: 1,
        name: 'Home',
        item: BASE_URL,
      },
      {
        '@type': 'ListItem',
        position: 2,
        name: 'Passport Guides',
        item: `${BASE_URL}/passports`,
      },
      {
        '@type': 'ListItem',
        position: 3,
        name: `${passportName} Passport`,
        item: `${BASE_URL}/passport/${slug}`,
      },
    ],
  };
}

export interface PassportFaq {
  question: string;
  answer: string;
}

export function buildPassportFaqs(passport: PassportMeta): PassportFaq[] {
  const { citizenLabel, name, popularDestinations } = passport;
  const topDest = popularDestinations[0]
    ? popularDestinations[0].split('-').map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')
    : 'popular destinations';

  return [
    {
      question: `Which countries are easiest to immigrate to for ${citizenLabel}?`,
      answer: `The easiest countries to immigrate to depend on your goals. ${name} passport holders often find the best pathways in countries that offer digital nomad visas, retirement programs, or skilled worker schemes. ${topDest} and Portugal are frequently accessible options.`,
    },
    {
      question: `Can ${citizenLabel} get permanent residency abroad?`,
      answer: `Yes. Many countries offer permanent residency pathways through employment, investment, or long-term residency requirements. ${citizenLabel} should research each destination's specific requirements, which vary significantly.`,
    },
    {
      question: `What is the most popular immigration pathway for ${citizenLabel}?`,
      answer: `Work visas and skilled worker programs are among the most common routes for ${citizenLabel} moving abroad. Study programs and digital nomad visas are also increasingly popular, especially in Europe.`,
    },
    {
      question: `How much does it cost ${citizenLabel} to immigrate abroad?`,
      answer: `Immigration costs vary widely by destination and pathway type. Government fees, proof-of-funds requirements, legal costs, and relocation expenses can range from a few hundred to tens of thousands of dollars. Use our cost calculator to estimate costs per destination.`,
    },
  ];
}

export function buildPassportFaqSchema(faqs: PassportFaq[]): object {
  return {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: faqs.map(({ question, answer }) => ({
      '@type': 'Question',
      name: question,
      acceptedAnswer: {
        '@type': 'Answer',
        text: answer,
      },
    })),
  };
}

export function buildPassportWebPageSchema(
  passport: PassportMeta,
  title: string,
  description: string,
): object {
  const canonical = `${BASE_URL}/passport/${passport.slug}`;
  return {
    '@context': 'https://schema.org',
    '@type': 'WebPage',
    name: title,
    description,
    url: canonical,
    inLanguage: 'en',
    isPartOf: { '@type': 'WebSite', url: BASE_URL, name: 'ImmigrationInfoGuide' },
    breadcrumb: buildPassportBreadcrumbSchema(passport.name, passport.slug),
  };
}

export function buildPassportDestinationListSchema(
  destinationNames: string[],
  passportName: string,
): object {
  return {
    '@context': 'https://schema.org',
    '@type': 'ItemList',
    name: `Top Immigration Destinations for ${passportName} Passport Holders`,
    itemListElement: destinationNames.map((name, index) => ({
      '@type': 'ListItem',
      position: index + 1,
      name,
    })),
  };
}
