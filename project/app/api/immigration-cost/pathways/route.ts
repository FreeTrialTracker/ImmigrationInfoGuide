import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const countrySlug = searchParams.get('country');

  if (!countrySlug) {
    return NextResponse.json({ error: 'Country slug is required' }, { status: 400 });
  }

  const supabase = createClient(supabaseUrl, supabaseKey);

  const { data: country } = await supabase
    .from('immigration_cost_countries')
    .select('id')
    .eq('slug', countrySlug)
    .eq('is_active', true)
    .maybeSingle();

  if (!country) {
    return NextResponse.json({ error: 'Country not found' }, { status: 404 });
  }

  const { data: pathways, error } = await supabase
    .from('immigration_cost_pathways')
    .select('*')
    .eq('country_id', country.id)
    .eq('is_active', true)
    .order('display_order');

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json(pathways || []);
}
