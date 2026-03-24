import {
  buildBreadcrumbSchema,
  buildFaqSchema,
  buildArticleSchema,
  buildWebPageSchema,
  buildHowToSchema,
  type BreadcrumbItem,
  type FaqEntry,
  type HowToOptions,
  type ArticleOptions,
  type WebPageOptions,
} from '@/lib/schemaBuilders';

interface StructuredDataProps {
  type: 'BreadcrumbList' | 'FAQPage' | 'WebPage' | 'HowTo' | 'Article';
  breadcrumbs?: BreadcrumbItem[];
  faqs?: FaqEntry[];
  webpage?: WebPageOptions;
  howTo?: HowToOptions;
  article?: ArticleOptions;
}

export function StructuredData({
  type,
  breadcrumbs,
  faqs,
  webpage,
  howTo,
  article,
}: StructuredDataProps) {
  let structuredData: object | null = null;

  if (type === 'BreadcrumbList' && breadcrumbs) {
    structuredData = buildBreadcrumbSchema(breadcrumbs);
  } else if (type === 'FAQPage' && faqs) {
    structuredData = buildFaqSchema(faqs);
  } else if (type === 'HowTo' && howTo) {
    structuredData = buildHowToSchema(howTo);
  } else if (type === 'Article' && article) {
    structuredData = buildArticleSchema(article);
  } else if (type === 'WebPage' && webpage) {
    structuredData = buildWebPageSchema(webpage);
  }

  if (!structuredData) return null;

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(structuredData) }}
    />
  );
}
