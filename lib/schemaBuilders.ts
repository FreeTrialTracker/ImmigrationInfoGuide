const SITE_URL = 'https://immigrationinfoguide.com';
const SITE_NAME = 'ImmigrationInfoGuide.com';
const SITE_LOGO = `${SITE_URL}/IMMIGRATION_FAVICON.png`;

export interface BreadcrumbItem {
  name: string;
  url: string;
}

export interface FaqEntry {
  question: string;
  answer: string;
}

export interface HowToStepEntry {
  name: string;
  text: string;
  url?: string;
  image?: string;
}

export interface ArticleOptions {
  headline: string;
  description: string;
  url: string;
  dateModified?: string;
  datePublished?: string;
  authorName?: string;
  authorJobTitle?: string;
  authorType?: 'Person' | 'Organization';
  imageUrl?: string;
  imageAlt?: string;
}

export interface HowToOptions {
  name: string;
  description: string;
  totalTime?: string;
  estimatedCost?: { currency: string; value: string };
  steps: HowToStepEntry[];
}

export interface WebPageOptions {
  name: string;
  description: string;
  url: string;
}

export interface CollectionPageOptions {
  name: string;
  description: string;
  url: string;
}

function sitePublisher() {
  return {
    '@type': 'Organization',
    name: SITE_NAME,
    url: SITE_URL,
    logo: { '@type': 'ImageObject', url: SITE_LOGO },
  };
}

export function buildOrganizationSchema() {
  return {
    '@context': 'https://schema.org',
    '@type': 'Organization',
    name: SITE_NAME,
    url: SITE_URL,
    logo: SITE_LOGO,
    description:
      'Plan your relocation and explore legal pathways for long-term stay. Find immigration options based on your passport, destination, and goals.',
    sameAs: [
      'https://www.visainfoguide.com',
    ],
  };
}

export function buildBreadcrumbSchema(items: BreadcrumbItem[]) {
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items.map((item, index) => ({
      '@type': 'ListItem',
      position: index + 1,
      name: item.name,
      item: item.url,
    })),
  };
}

export function buildFaqSchema(faqs: FaqEntry[]) {
  return {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: faqs.map((faq) => ({
      '@type': 'Question',
      name: faq.question,
      acceptedAnswer: { '@type': 'Answer', text: faq.answer },
    })),
  };
}

export function buildArticleSchema(options: ArticleOptions) {
  const {
    headline,
    description,
    url,
    dateModified,
    datePublished,
    authorName = SITE_NAME,
    authorJobTitle,
    authorType = 'Organization',
    imageUrl,
    imageAlt,
  } = options;

  return {
    '@context': 'https://schema.org',
    '@type': 'Article',
    headline,
    description,
    author:
      authorType === 'Person'
        ? {
            '@type': 'Person',
            name: authorName,
            ...(authorJobTitle && { jobTitle: authorJobTitle }),
          }
        : { '@type': 'Organization', name: authorName },
    publisher: sitePublisher(),
    ...(datePublished && { datePublished }),
    ...(dateModified && { dateModified }),
    mainEntityOfPage: { '@type': 'WebPage', '@id': url },
    ...(imageUrl && {
      image: { '@type': 'ImageObject', url: imageUrl, ...(imageAlt && { description: imageAlt }) },
    }),
  };
}

export function buildWebPageSchema(options: WebPageOptions) {
  return {
    '@context': 'https://schema.org',
    '@type': 'WebPage',
    name: options.name,
    description: options.description,
    url: options.url,
  };
}

export function buildCollectionPageSchema(options: CollectionPageOptions) {
  return {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: options.name,
    description: options.description,
    url: options.url,
  };
}

export function buildWebSiteSchema() {
  return {
    '@context': 'https://schema.org',
    '@type': 'WebSite',
    name: SITE_NAME,
    url: SITE_URL,
    potentialAction: {
      '@type': 'SearchAction',
      target: {
        '@type': 'EntryPoint',
        urlTemplate: `${SITE_URL}/path-finder?destination={search_term_string}`,
      },
      'query-input': 'required name=search_term_string',
    },
  };
}

export function buildHowToSchema(options: HowToOptions) {
  return {
    '@context': 'https://schema.org',
    '@type': 'HowTo',
    name: options.name,
    description: options.description,
    ...(options.totalTime && { totalTime: options.totalTime }),
    ...(options.estimatedCost && { estimatedCost: options.estimatedCost }),
    step: options.steps.map((step, index) => ({
      '@type': 'HowToStep',
      position: index + 1,
      name: step.name,
      text: step.text,
      ...(step.url && { url: step.url }),
      ...(step.image && { image: step.image }),
    })),
  };
}
