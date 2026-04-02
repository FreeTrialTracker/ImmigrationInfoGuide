import type { Metadata } from 'next';
import Link from 'next/link';
import Image from 'next/image';
import { getAllBlogPosts, formatBlogDate } from '@/lib/blogData';
import { Calendar, Clock, ChevronRight, BookOpen, Globe, Briefcase, Plane, ArrowRight, Compass } from 'lucide-react';
import { SEOBreadcrumbs } from '@/components/SEOBreadcrumbs';
import type { BlogPostSummary } from '@/lib/blogTypes';
import { buildBreadcrumbSchema } from '@/lib/schemaBuilders';

export const metadata: Metadata = {
  title: 'Immigration Blog & Global Migration Guides | ImmigrationInfoGuide',
  description:
    'In-depth guides on immigration policies, visa pathways, residency programs, and relocation planning. Expert coverage of skilled worker visas, digital nomad programs, cost breakdowns, and the easiest countries to immigrate to in 2026.',
  alternates: {
    canonical: 'https://immigrationinfoguide.com/blog',
  },
  openGraph: {
    title: 'Immigration Blog & Global Migration Guides | ImmigrationInfoGuide',
    description:
      'In-depth guides on immigration policies, visa pathways, residency programs, and relocation planning.',
    type: 'website',
    url: 'https://immigrationinfoguide.com/blog',
    images: [{ url: '/og-image.webp', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Immigration Blog & Global Migration Guides | ImmigrationInfoGuide',
    description: 'In-depth guides on immigration policies, visa pathways, residency programs, and relocation planning.',
    images: ['/og-image.webp'],
  },
};

const CATEGORY_STYLES: Record<string, { bg: string; text: string; icon: React.ElementType }> = {
  'Immigration Basics': { bg: 'bg-slate-100', text: 'text-slate-700', icon: BookOpen },
  'Destination Guides': { bg: 'bg-blue-100', text: 'text-blue-700', icon: Globe },
  'Work Visas': { bg: 'bg-teal-100', text: 'text-teal-700', icon: Briefcase },
  'Digital Nomad': { bg: 'bg-amber-100', text: 'text-amber-700', icon: Plane },
  default: { bg: 'bg-gray-100', text: 'text-gray-600', icon: BookOpen },
};

function getCategoryStyle(category: string) {
  return CATEGORY_STYLES[category] || CATEGORY_STYLES.default;
}

const breadcrumbSchema = buildBreadcrumbSchema([
  { name: 'Home', url: 'https://immigrationinfoguide.com' },
  { name: 'Blog', url: 'https://immigrationinfoguide.com/blog' },
]);

export const revalidate = 3600;

export default async function BlogIndexPage() {
  const posts = await getAllBlogPosts();
  const featuredPost = posts[0] || null;
  const remainingPosts = posts.slice(1);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }}
      />
      <div className="min-h-screen bg-gray-50">
        <div className="bg-white border-b border-gray-200">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-10 lg:py-14">
            <SEOBreadcrumbs
              items={[
                { label: 'Home', href: '/' },
                { label: 'Blog', href: '/blog' },
              ]}
            />
            <div className="max-w-2xl mt-4">
              <h1 className="text-3xl sm:text-4xl font-bold text-gray-900 mb-4 leading-tight">
                Immigration Blog &amp; Global Migration Guides
              </h1>
              <p className="text-lg text-gray-600 leading-relaxed mb-5">
                In-depth guides on immigration policies, visa pathways, residency programs, and international relocation. Written for people making real decisions about moving abroad, not for casual readers.
              </p>
              <p className="text-sm text-gray-500 leading-relaxed">
                Topics include skilled worker visas, digital nomad programs, cost breakdowns, the easiest countries to move to, and how immigration systems actually work. All guides are fact-checked against official government sources.
              </p>
            </div>
          </div>
        </div>

        <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-10">
          {posts.length === 0 ? (
            <div className="py-20 text-center">
              <BookOpen className="h-10 w-10 text-gray-300 mx-auto mb-4" />
              <p className="text-gray-500">No articles published yet. Check back soon.</p>
            </div>
          ) : (
            <>
              {featuredPost && <FeaturedPostCard post={featuredPost} getCategoryStyle={getCategoryStyle} />}

              {remainingPosts.length > 0 && (
                <div className="mt-12">
                  <div className="flex items-center justify-between mb-6">
                    <h2 className="text-xl font-bold text-gray-900">More Immigration Guides</h2>
                    <span className="text-sm text-gray-400">{posts.length} articles</span>
                  </div>
                  <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    {remainingPosts.map((post) => (
                      <BlogCard key={post.slug} post={post} getCategoryStyle={getCategoryStyle} />
                    ))}
                  </div>
                </div>
              )}

              <BlogIndexToolsSection />
            </>
          )}
        </div>
      </div>
    </>
  );
}

type StyleFn = (cat: string) => { bg: string; text: string; icon: React.ElementType };

function FeaturedPostCard({ post, getCategoryStyle }: { post: BlogPostSummary; getCategoryStyle: StyleFn }) {
  const style = getCategoryStyle(post.category);
  const CategoryIcon = style.icon;

  return (
    <div>
      <div className="flex items-center gap-2 mb-4">
        <span className="text-xs font-semibold text-gray-500 uppercase tracking-wider">Featured Article</span>
      </div>
      <Link
        href={`/blog/${post.slug}`}
        className="group block bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-all duration-300 hover:border-brand-primary/30"
      >
        <div className="sm:flex">
          {post.featured_image_url && (
            <div className="sm:w-2/5 relative h-56 sm:h-auto overflow-hidden">
              <Image
                src={post.featured_image_url}
                alt={post.featured_image_alt || post.title}
                fill
                className="object-cover group-hover:scale-105 transition-transform duration-500"
                sizes="(max-width: 640px) 100vw, 40vw"
                priority
              />
            </div>
          )}
          <div className="flex-1 p-6 sm:p-8 flex flex-col justify-between">
            <div>
              <div className="flex items-center gap-2 mb-3">
                <span className={`inline-flex items-center gap-1.5 text-xs font-semibold px-2.5 py-1 rounded-full ${style.bg} ${style.text}`}>
                  <CategoryIcon className="h-3.5 w-3.5" />
                  {post.category}
                </span>
              </div>
              <h2 className="text-xl sm:text-2xl font-bold text-gray-900 mb-3 group-hover:text-brand-primary transition-colors leading-tight">
                {post.title}
              </h2>
              <p className="text-gray-600 leading-relaxed line-clamp-3">{post.excerpt}</p>
            </div>
            <div className="flex items-center justify-between mt-5 pt-4 border-t border-gray-100">
              <div className="flex items-center gap-4 text-xs text-gray-400">
                <span className="flex items-center gap-1.5">
                  <Calendar className="h-3.5 w-3.5" />
                  {formatBlogDate(post.published_at)}
                </span>
                <span className="flex items-center gap-1.5">
                  <Clock className="h-3.5 w-3.5" />
                  {post.reading_time_minutes} min read
                </span>
              </div>
              <span className="flex items-center gap-1 text-sm font-semibold text-brand-primary group-hover:gap-2 transition-all">
                Read article <ChevronRight className="h-4 w-4" />
              </span>
            </div>
          </div>
        </div>
      </Link>
    </div>
  );
}

function BlogCard({ post, getCategoryStyle }: { post: BlogPostSummary; getCategoryStyle: StyleFn }) {
  const style = getCategoryStyle(post.category);
  const CategoryIcon = style.icon;

  return (
    <Link
      href={`/blog/${post.slug}`}
      className="group flex flex-col bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-md transition-all duration-300 hover:border-brand-primary/30 hover:-translate-y-0.5"
    >
      {post.featured_image_url && (
        <div className="relative h-44 overflow-hidden">
          <Image
            src={post.featured_image_url}
            alt={post.featured_image_alt || post.title}
            fill
            className="object-cover group-hover:scale-105 transition-transform duration-500"
            sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
          />
        </div>
      )}
      <div className="flex flex-col flex-1 p-5">
        <div className="flex items-center gap-2 mb-3">
          <span className={`inline-flex items-center gap-1.5 text-xs font-semibold px-2.5 py-1 rounded-full ${style.bg} ${style.text}`}>
            <CategoryIcon className="h-3 w-3" />
            {post.category}
          </span>
        </div>
        <h3 className="font-bold text-gray-900 mb-2 group-hover:text-brand-primary transition-colors leading-snug line-clamp-2">
          {post.title}
        </h3>
        <p className="text-sm text-gray-500 leading-relaxed line-clamp-3 flex-1">{post.excerpt}</p>
        <div className="flex items-center justify-between mt-4 pt-3 border-t border-gray-100">
          <div className="flex items-center gap-3 text-xs text-gray-400">
            <span className="flex items-center gap-1">
              <Calendar className="h-3 w-3" />
              {formatBlogDate(post.published_at)}
            </span>
            <span className="flex items-center gap-1">
              <Clock className="h-3 w-3" />
              {post.reading_time_minutes} min
            </span>
          </div>
          <span className="text-xs font-semibold text-brand-primary flex items-center gap-0.5 group-hover:gap-1.5 transition-all">
            Read <ChevronRight className="h-3.5 w-3.5" />
          </span>
        </div>
      </div>
    </Link>
  );
}

function BlogIndexToolsSection() {
  const tools = [
    {
      href: '/path-finder',
      icon: Compass,
      label: 'Immigration Path Finder',
      desc: 'Answer a few questions and get a shortlist of visa pathways matched to your situation.',
    },
    {
      href: '/immigration-cost-calculator',
      icon: ArrowRight,
      label: 'Cost Calculator',
      desc: 'Estimate the full cost of immigrating to a specific country, including hidden fees.',
    },
    {
      href: '/immigration-guides',
      icon: Globe,
      label: 'Country Guides',
      desc: 'In-depth immigration guides for over 50 destination countries.',
    },
  ];

  return (
    <div className="mt-14 pt-10 border-t border-gray-200">
      <h2 className="text-lg font-bold text-gray-900 mb-2">Free Immigration Planning Tools</h2>
      <p className="text-sm text-gray-500 mb-6 max-w-xl">
        Use these tools alongside the guides above to research destinations, estimate costs, and plan your move.
      </p>
      <div className="grid sm:grid-cols-3 gap-4">
        {tools.map(({ href, icon: Icon, label, desc }) => (
          <Link
            key={href}
            href={href}
            className="group flex items-start gap-3 bg-white rounded-xl border border-gray-200 p-5 hover:border-brand-primary/30 hover:shadow-sm transition-all"
          >
            <div className="w-9 h-9 rounded-lg bg-brand-primary/10 flex items-center justify-center flex-shrink-0 group-hover:bg-brand-primary/20 transition-colors">
              <Icon className="h-4 w-4 text-brand-primary" />
            </div>
            <div>
              <p className="font-semibold text-sm text-gray-900 group-hover:text-brand-primary transition-colors leading-tight mb-1">{label}</p>
              <p className="text-xs text-gray-500 leading-relaxed">{desc}</p>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}
