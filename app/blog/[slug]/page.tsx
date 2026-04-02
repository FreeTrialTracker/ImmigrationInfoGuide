import type { Metadata } from 'next';
import { notFound } from 'next/navigation';
import Image from 'next/image';
import Link from 'next/link';
import { getBlogPostBySlug, getRelatedBlogPosts, getAllBlogPosts, formatBlogDate } from '@/lib/blogData';
import { SEOBreadcrumbs } from '@/components/SEOBreadcrumbs';
import { Calendar, Clock, User, ChevronRight, BookOpen, Calculator, Compass, FileText, ChartBar as BarChart2, Globe, ArrowRight } from 'lucide-react';
import type { FaqItem, BlogPostSummary } from '@/lib/blogTypes';
import { buildArticleSchema, buildBreadcrumbSchema, buildFaqSchema } from '@/lib/schemaBuilders';
import BlogTableOfContents from '@/components/blog/BlogTableOfContents';
import BlogFaqSection from '@/components/blog/BlogFaqSection';
import BlogArticleContent from '@/components/blog/BlogArticleContent';
import { getBlogRelatedLinks } from '@/lib/seo/relatedLinks';
import RelatedLinksSection from '@/components/seo/RelatedLinksSection';
import BackNavigation from '@/components/BackNavigation';
import { detectArticleType, getArticleIntro, getArticleConclusion } from '@/lib/blog/articleEnhancements';

type Props = {
  params: { slug: string };
};

export async function generateStaticParams() {
  const posts = await getAllBlogPosts();
  return posts.map((p) => ({ slug: p.slug }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const post = await getBlogPostBySlug(params.slug);
  if (!post) return { title: 'Article Not Found' };

  return {
    title: post.meta_title,
    description: post.meta_description,
    alternates: { canonical: `https://immigrationinfoguide.com/blog/${post.slug}` },
    openGraph: {
      title: post.meta_title,
      description: post.meta_description,
      type: 'article',
      url: `https://immigrationinfoguide.com/blog/${post.slug}`,
      publishedTime: post.published_at,
      modifiedTime: post.updated_at,
      authors: [post.author],
      images: post.featured_image_url
        ? [{ url: post.featured_image_url, width: 1260, height: 750, alt: post.featured_image_alt || post.title }]
        : [{ url: '/og-image.webp', width: 1200, height: 630 }],
    },
    twitter: {
      card: 'summary_large_image',
      title: post.meta_title,
      description: post.meta_description,
      images: post.featured_image_url ? [post.featured_image_url] : ['/og-image.webp'],
    },
  };
}

export const revalidate = 3600;

export default async function BlogArticlePage({ params }: Props) {
  const post = await getBlogPostBySlug(params.slug);
  if (!post) notFound();

  const relatedPosts = await getRelatedBlogPosts(post.related_slugs || []);

  const blogRelatedGroups = getBlogRelatedLinks({
    slug: post.slug,
    title: post.title,
    tags: post.tags || [],
    category: post.category,
  });

  const articleSchema = buildArticleSchema({
    headline: post.title,
    description: post.meta_description,
    url: `https://immigrationinfoguide.com/blog/${post.slug}`,
    datePublished: post.published_at,
    dateModified: post.updated_at,
    authorName: post.author,
    authorJobTitle: post.author_title,
    authorType: 'Person',
    imageUrl: post.featured_image_url || undefined,
    imageAlt: post.featured_image_alt || undefined,
  });

  const breadcrumbSchema = buildBreadcrumbSchema([
    { name: 'Home', url: 'https://immigrationinfoguide.com' },
    { name: 'Blog', url: 'https://immigrationinfoguide.com/blog' },
    { name: post.title, url: `https://immigrationinfoguide.com/blog/${post.slug}` },
  ]);

  const faqSchema =
    post.faq && post.faq.length > 0
      ? buildFaqSchema(post.faq.map((item: FaqItem) => ({ question: item.question, answer: item.answer })))
      : null;

  const articleType = detectArticleType(post.slug, post.title, post.category, post.tags || []);
  const intro = getArticleIntro(post.slug, post.title, post.excerpt, articleType);
  const conclusion = getArticleConclusion(post.slug, post.title, articleType);

  const wordCountEstimate = post.content.reduce((acc, s) => acc + s.body.split(/\s+/).length, 0);
  const readingTime = post.reading_time_minutes || Math.max(3, Math.round(wordCountEstimate / 200));

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(articleSchema) }} />
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }} />
      {faqSchema && (
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(faqSchema) }} />
      )}

      <div className="min-h-screen bg-gray-50">
        <div className="bg-white border-b border-gray-200">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-3 flex items-center justify-between gap-4">
            <BackNavigation fallbackUrl="/blog" label="Back to Blog" />
            <SEOBreadcrumbs
              items={[
                { label: 'Home', href: '/' },
                { label: 'Blog', href: '/blog' },
                { label: post.title, href: `/blog/${post.slug}` },
              ]}
            />
          </div>
        </div>

        <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-8">
          <div className="lg:grid lg:grid-cols-[1fr_272px] lg:gap-12 xl:gap-16">
            <article className="min-w-0">

              <header className="mb-7">
                <div className="mb-3">
                  <span className="inline-block text-xs font-semibold px-3 py-1 rounded-full bg-brand-primary/10 text-brand-primary tracking-wide uppercase">
                    {post.category}
                  </span>
                </div>
                <h1 className="text-3xl sm:text-4xl font-bold text-gray-900 leading-tight mb-5">
                  {post.title}
                </h1>

                <p className="text-lg text-gray-600 leading-relaxed mb-5 max-w-prose">
                  {intro}
                </p>

                <div className="flex flex-wrap items-center gap-x-5 gap-y-2 text-sm text-gray-500 pb-5 border-b border-gray-200">
                  <span className="flex items-center gap-1.5">
                    <User className="h-4 w-4 text-gray-400" />
                    <span className="font-medium text-gray-700">{post.author}</span>
                    <span className="text-gray-400 hidden sm:inline">&middot; {post.author_title}</span>
                  </span>
                  <span className="flex items-center gap-1.5">
                    <Calendar className="h-4 w-4 text-gray-400" />
                    {formatBlogDate(post.published_at)}
                  </span>
                  {post.updated_at && post.updated_at !== post.published_at && (
                    <span className="flex items-center gap-1.5 text-xs">
                      <span className="text-gray-400">Updated</span>
                      {formatBlogDate(post.updated_at)}
                    </span>
                  )}
                  <span className="flex items-center gap-1.5">
                    <Clock className="h-4 w-4 text-gray-400" />
                    {readingTime} min read
                  </span>
                </div>
              </header>

              {post.featured_image_url && (
                <div className="relative w-full h-64 sm:h-80 rounded-xl overflow-hidden mb-8 shadow-sm">
                  <Image
                    src={post.featured_image_url}
                    alt={post.featured_image_alt || post.title}
                    fill
                    className="object-cover"
                    priority
                    sizes="(max-width: 1024px) 100vw, 780px"
                  />
                </div>
              )}

              <div className="lg:hidden mb-8">
                <BlogTableOfContents toc={post.toc} />
              </div>

              <BlogArticleContent content={post.content} />

              {conclusion && (
                <section className="mt-2 mb-10 bg-gray-50 rounded-xl border border-gray-200 p-6">
                  <h2 className="text-xl font-bold text-gray-900 mb-3">Summary</h2>
                  <p className="text-gray-600 leading-relaxed">{conclusion}</p>
                  <div className="mt-4 flex flex-wrap gap-3">
                    <Link
                      href="/path-finder"
                      className="inline-flex items-center gap-1.5 text-sm font-semibold text-brand-primary hover:underline"
                    >
                      Find your immigration pathway <ArrowRight className="h-4 w-4" />
                    </Link>
                    <Link
                      href="/immigration-cost-calculator"
                      className="inline-flex items-center gap-1.5 text-sm font-semibold text-brand-primary hover:underline"
                    >
                      Estimate your costs <ArrowRight className="h-4 w-4" />
                    </Link>
                  </div>
                </section>
              )}

              {post.faq && post.faq.length > 0 && <BlogFaqSection faq={post.faq} />}

              <ArticleToolsPanel />

              <RelatedLinksSection
                groups={blogRelatedGroups}
                intro="Explore immigration guides, costs, and pathway information related to this article."
              />

              {relatedPosts.length > 0 && <RelatedArticles posts={relatedPosts} />}
            </article>

            <aside className="hidden lg:block">
              <div className="sticky top-24 space-y-5">
                <BlogTableOfContents toc={post.toc} />
                <SidebarToolsCard />
              </div>
            </aside>
          </div>
        </div>
      </div>
    </>
  );
}

function SidebarToolsCard() {
  return (
    <div className="bg-white rounded-xl border border-gray-200 p-5">
      <h3 className="text-sm font-bold text-gray-900 mb-1">Plan Your Move</h3>
      <p className="text-xs text-gray-500 mb-4 leading-relaxed">
        Free tools to find the right pathway, estimate costs, and prepare documents.
      </p>
      <div className="space-y-2">
        <Link
          href="/path-finder"
          className="flex items-center justify-between w-full bg-brand-primary text-white text-sm font-medium py-2.5 px-4 rounded-lg hover:bg-brand-primary-hover transition-colors"
        >
          <span>Start Path Finder</span>
          <ChevronRight className="h-4 w-4" />
        </Link>
        <Link
          href="/immigration-cost-calculator"
          className="flex items-center justify-between w-full border border-gray-200 bg-white text-gray-700 text-sm font-medium py-2.5 px-4 rounded-lg hover:border-brand-primary/40 hover:text-brand-primary transition-colors"
        >
          <span>Cost Calculator</span>
          <ChevronRight className="h-4 w-4" />
        </Link>
        <Link
          href="/immigration-guides"
          className="flex items-center justify-between w-full border border-gray-200 bg-white text-gray-700 text-sm font-medium py-2.5 px-4 rounded-lg hover:border-brand-primary/40 hover:text-brand-primary transition-colors"
        >
          <span>Country Guides</span>
          <ChevronRight className="h-4 w-4" />
        </Link>
      </div>
    </div>
  );
}

function ArticleToolsPanel() {
  const tools = [
    { href: '/path-finder', icon: Compass, label: 'Path Finder', desc: 'Find your immigration pathway' },
    { href: '/immigration-cost-calculator', icon: Calculator, label: 'Cost Calculator', desc: 'Estimate total costs' },
    { href: '/country-comparison', icon: BarChart2, label: 'Compare Countries', desc: 'Side-by-side comparison' },
    { href: '/document-checklist', icon: FileText, label: 'Document Checklist', desc: 'Prepare your documents' },
    { href: '/immigration-guides', icon: Globe, label: 'Country Guides', desc: 'Deep-dive research' },
    { href: '/tools', icon: BookOpen, label: 'All Tools', desc: 'Browse every tool' },
  ];

  return (
    <section className="mt-10 pt-8 border-t border-gray-200">
      <h2 className="text-lg font-bold text-gray-900 mb-1">Free Immigration Planning Tools</h2>
      <p className="text-sm text-gray-500 mb-4">Use these tools to research, compare, and plan your immigration journey.</p>
      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
        {tools.map(({ href, icon: Icon, label, desc }) => (
          <Link
            key={href}
            href={href}
            className="flex items-start gap-2.5 rounded-lg border border-gray-200 p-3.5 hover:border-brand-primary hover:shadow-sm transition-all group"
          >
            <Icon className="h-4 w-4 text-brand-primary mt-0.5 flex-shrink-0" />
            <div>
              <p className="text-xs font-semibold text-gray-900 group-hover:text-brand-primary leading-tight">{label}</p>
              <p className="text-xs text-gray-400 mt-0.5 leading-tight hidden sm:block">{desc}</p>
            </div>
          </Link>
        ))}
      </div>
    </section>
  );
}

function RelatedArticles({ posts }: { posts: BlogPostSummary[] }) {
  return (
    <section className="mt-12 pt-8 border-t border-gray-200">
      <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center gap-2">
        <BookOpen className="h-5 w-5 text-brand-primary" />
        Related Immigration Guides
      </h2>
      <div className="grid sm:grid-cols-3 gap-4">
        {posts.map((post) => (
          <Link
            key={post.slug}
            href={`/blog/${post.slug}`}
            className="group block bg-white rounded-lg border border-gray-200 p-4 hover:border-brand-primary/30 hover:shadow-sm transition-all"
          >
            {post.featured_image_url && (
              <div className="relative h-32 rounded-md overflow-hidden mb-3">
                <Image
                  src={post.featured_image_url}
                  alt={post.featured_image_alt || post.title}
                  fill
                  className="object-cover group-hover:scale-105 transition-transform duration-500"
                  sizes="200px"
                />
              </div>
            )}
            <span className="text-xs font-medium text-brand-primary block mb-1">{post.category}</span>
            <h3 className="text-sm font-semibold text-gray-900 leading-snug group-hover:text-brand-primary transition-colors line-clamp-2">
              {post.title}
            </h3>
            <div className="flex items-center gap-1.5 mt-2 text-xs text-gray-400">
              <Clock className="h-3 w-3" />
              {post.reading_time_minutes} min read
            </div>
          </Link>
        ))}
      </div>
    </section>
  );
}
