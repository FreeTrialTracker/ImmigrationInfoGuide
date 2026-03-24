import { createClient } from '@supabase/supabase-js';
import type { BlogPost, BlogPostSummary } from './blogTypes';

function getBlogClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';
  return createClient(url, key);
}

export async function getAllBlogPosts(): Promise<BlogPostSummary[]> {
  const supabase = getBlogClient();
  const { data, error } = await supabase
    .from('blog_posts')
    .select('slug, title, excerpt, author, published_at, featured_image_url, featured_image_alt, category, tags, reading_time_minutes')
    .eq('is_published', true)
    .order('published_at', { ascending: false });

  if (error || !data) return [];
  return data as BlogPostSummary[];
}

export async function getBlogPostBySlug(slug: string): Promise<BlogPost | null> {
  const supabase = getBlogClient();
  const { data, error } = await supabase
    .from('blog_posts')
    .select('*')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle();

  if (error || !data) return null;
  return data as BlogPost;
}

export async function getRelatedBlogPosts(slugs: string[]): Promise<BlogPostSummary[]> {
  if (!slugs || slugs.length === 0) return [];
  const supabase = getBlogClient();
  const { data, error } = await supabase
    .from('blog_posts')
    .select('slug, title, excerpt, author, published_at, featured_image_url, featured_image_alt, category, tags, reading_time_minutes')
    .in('slug', slugs)
    .eq('is_published', true);

  if (error || !data) return [];
  return data as BlogPostSummary[];
}

export async function getLatestBlogPosts(limit = 3): Promise<BlogPostSummary[]> {
  const supabase = getBlogClient();
  const { data, error } = await supabase
    .from('blog_posts')
    .select('slug, title, excerpt, author, published_at, featured_image_url, featured_image_alt, category, tags, reading_time_minutes')
    .eq('is_published', true)
    .order('published_at', { ascending: false })
    .limit(limit);

  if (error || !data) return [];
  return data as BlogPostSummary[];
}

export function formatBlogDate(dateStr: string): string {
  return new Date(dateStr).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  });
}
