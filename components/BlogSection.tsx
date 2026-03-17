import Link from 'next/link';
import Image from 'next/image';
import { Calendar, Clock, ChevronRight, Rss } from 'lucide-react';
import { getLatestBlogPosts, formatBlogDate } from '@/lib/blogData';
import type { BlogPostSummary } from '@/lib/blogTypes';

export default async function BlogSection() {
  const posts = await getLatestBlogPosts(3);

  if (!posts || posts.length === 0) return null;

  const [featured, ...rest] = posts;

  return (
    <section className="bg-white py-16 border-t border-gray-100">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex items-end justify-between mb-8">
          <div>
            <div className="flex items-center gap-2 mb-2">
              <Rss className="h-4 w-4 text-brand-primary" />
              <span className="text-sm font-semibold text-brand-primary uppercase tracking-wider">
                Immigration Blog
              </span>
            </div>
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900">
              Guides & Migration Insights
            </h2>
            <p className="text-gray-600 mt-1.5 max-w-xl">
              In-depth articles on visa pathways, residency programs, and moving abroad.
            </p>
          </div>
          <Link
            href="/blog"
            className="hidden sm:flex items-center gap-1.5 text-sm font-semibold text-brand-primary hover:gap-2.5 transition-all"
          >
            View all articles <ChevronRight className="h-4 w-4" />
          </Link>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          {featured && <FeaturedCard post={featured} />}
          <div className="lg:col-span-1 flex flex-col gap-4">
            {rest.map((post) => (
              <SmallCard key={post.slug} post={post} />
            ))}
          </div>
        </div>

        <div className="mt-8 sm:hidden">
          <Link
            href="/blog"
            className="flex items-center justify-center gap-2 w-full border border-brand-primary text-brand-primary font-semibold py-3 rounded-xl hover:bg-brand-primary hover:text-white transition-all text-sm"
          >
            View all articles <ChevronRight className="h-4 w-4" />
          </Link>
        </div>
      </div>
    </section>
  );
}

function FeaturedCard({ post }: { post: BlogPostSummary }) {
  return (
    <Link
      href={`/blog/${post.slug}`}
      className="group lg:col-span-2 flex flex-col bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-md hover:border-brand-primary/30 transition-all duration-300"
    >
      {post.featured_image_url && (
        <div className="relative h-52 sm:h-64 overflow-hidden">
          <Image
            src={post.featured_image_url}
            alt={post.featured_image_alt || post.title}
            fill
            priority
            className="object-cover group-hover:scale-105 transition-transform duration-500"
            sizes="(max-width: 1024px) 100vw, 66vw"
          />
        </div>
      )}
      <div className="flex-1 p-6">
        <span className="text-xs font-semibold text-brand-primary bg-brand-primary/10 px-2.5 py-1 rounded-full">
          {post.category}
        </span>
        <h3 className="text-lg font-bold text-gray-900 mt-3 mb-2 group-hover:text-brand-primary transition-colors leading-snug">
          {post.title}
        </h3>
        <p className="text-sm text-gray-500 leading-relaxed line-clamp-2">{post.excerpt}</p>
        <div className="flex items-center gap-4 mt-4 pt-3 border-t border-gray-100 text-xs text-gray-400">
          <span className="flex items-center gap-1.5">
            <Calendar className="h-3.5 w-3.5" />
            {formatBlogDate(post.published_at)}
          </span>
          <span className="flex items-center gap-1.5">
            <Clock className="h-3.5 w-3.5" />
            {post.reading_time_minutes} min read
          </span>
        </div>
      </div>
    </Link>
  );
}

function SmallCard({ post }: { post: BlogPostSummary }) {
  return (
    <Link
      href={`/blog/${post.slug}`}
      className="group flex gap-4 bg-white rounded-xl border border-gray-200 p-4 hover:shadow-sm hover:border-brand-primary/30 transition-all duration-200 items-start"
    >
      {post.featured_image_url && (
        <div className="relative w-20 h-20 flex-shrink-0 rounded-lg overflow-hidden">
          <Image
            src={post.featured_image_url}
            alt={post.featured_image_alt || post.title}
            fill
            className="object-cover group-hover:scale-105 transition-transform duration-500"
            sizes="80px"
          />
        </div>
      )}
      <div className="min-w-0 flex-1">
        <span className="text-xs font-semibold text-brand-primary">{post.category}</span>
        <h3 className="text-sm font-bold text-gray-900 mt-1 group-hover:text-brand-primary transition-colors leading-snug line-clamp-2">
          {post.title}
        </h3>
        <div className="flex items-center gap-2 mt-2 text-xs text-gray-400">
          <Clock className="h-3 w-3" />
          {post.reading_time_minutes} min read
        </div>
      </div>
    </Link>
  );
}
