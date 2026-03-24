export type TocItem = {
  id: string;
  title: string;
  level: 2 | 3;
};

export type FaqItem = {
  question: string;
  answer: string;
};

export type ContentSection = {
  type: 'section';
  id: string;
  heading: string;
  level: 2 | 3;
  body: string;
};

export type BlogPost = {
  id: string;
  slug: string;
  title: string;
  meta_title: string;
  meta_description: string;
  excerpt: string;
  author: string;
  author_title: string;
  published_at: string;
  updated_at: string;
  featured_image_url: string | null;
  featured_image_alt: string | null;
  category: string;
  tags: string[];
  content: ContentSection[];
  toc: TocItem[];
  faq: FaqItem[];
  related_slugs: string[];
  reading_time_minutes: number;
  is_published: boolean;
  created_at: string;
};

export type BlogPostSummary = Pick<
  BlogPost,
  | 'slug'
  | 'title'
  | 'excerpt'
  | 'author'
  | 'published_at'
  | 'featured_image_url'
  | 'featured_image_alt'
  | 'category'
  | 'tags'
  | 'reading_time_minutes'
>;
