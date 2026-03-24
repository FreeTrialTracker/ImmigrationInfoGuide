import { NextRequest, NextResponse } from 'next/server';
import { getSupabaseAdmin } from '@/lib/supabaseAdmin';
import { checkRateLimit, getClientIp, rateLimitResponse } from '@/lib/rateLimit';

const IMPORT_RATE_LIMIT = {
  maxTokens: 10,
  refillRate: 2,
  refillIntervalMs: 60_000,
};

const VALID_PATHWAY_TYPES = [
  'Work',
  'Residency',
  'Digital Nomad',
  'Study',
  'Investor',
  'Retirement',
  'Family',
  'Other',
];

interface CSVRow {
  passport_slug: string;
  destination_slug: string;
  pathway_type: string;
  pathway_name: string;
  summary?: string;
  eligibility?: string;
  requirements?: string;
  processing_time?: string;
  validity_period?: string;
  official_url?: string;
  last_updated?: string;
}

interface ValidationError {
  row: number;
  message: string;
}

function parseCSV(text: string): string[][] {
  const lines: string[][] = [];
  let currentLine: string[] = [];
  let currentField = '';
  let inQuotes = false;

  for (let i = 0; i < text.length; i++) {
    const char = text[i];
    const nextChar = text[i + 1];

    if (char === '"' && inQuotes && nextChar === '"') {
      currentField += '"';
      i++;
    } else if (char === '"') {
      inQuotes = !inQuotes;
    } else if (char === ',' && !inQuotes) {
      currentLine.push(currentField.trim());
      currentField = '';
    } else if ((char === '\n' || char === '\r') && !inQuotes) {
      if (char === '\r' && nextChar === '\n') {
        i++;
      }
      if (currentField || currentLine.length > 0) {
        currentLine.push(currentField.trim());
        if (currentLine.some(field => field.length > 0)) {
          lines.push(currentLine);
        }
        currentLine = [];
        currentField = '';
      }
    } else {
      currentField += char;
    }
  }

  if (currentField || currentLine.length > 0) {
    currentLine.push(currentField.trim());
    if (currentLine.some(field => field.length > 0)) {
      lines.push(currentLine);
    }
  }

  return lines;
}

function validateDate(dateStr: string): boolean {
  if (!dateStr) return true;
  const regex = /^\d{4}-\d{2}-\d{2}$/;
  if (!regex.test(dateStr)) return false;
  const date = new Date(dateStr);
  return date instanceof Date && !isNaN(date.getTime());
}

export async function POST(request: NextRequest) {
  const ip = getClientIp(request);
  if (!checkRateLimit(`admin:import:${ip}`, IMPORT_RATE_LIMIT)) {
    return rateLimitResponse();
  }

  const adminCookie = request.cookies.get('admin_import');

  if (!adminCookie || adminCookie.value !== 'true') {
    return NextResponse.json(
      { error: 'Unauthorized' },
      { status: 401 }
    );
  }

  if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
    return NextResponse.json(
      { error: 'Server configuration error: SUPABASE_SERVICE_ROLE_KEY not set' },
      { status: 500 }
    );
  }

  try {
    const supabaseAdmin = getSupabaseAdmin();

    const formData = await request.formData();
    const file = formData.get('file') as File;
    const mode = (formData.get('mode') as string) || 'upsert';

    if (!file) {
      return NextResponse.json(
        { error: 'No file provided' },
        { status: 400 }
      );
    }

    const text = await file.text();
    const lines = parseCSV(text);

    if (lines.length === 0) {
      return NextResponse.json(
        { error: 'CSV file is empty' },
        { status: 400 }
      );
    }

    const headers = lines[0].map(h => h.toLowerCase().trim());
    const requiredColumns = ['passport_slug', 'destination_slug', 'pathway_type', 'pathway_name'];

    const missingColumns = requiredColumns.filter(col => !headers.includes(col));
    if (missingColumns.length > 0) {
      return NextResponse.json(
        { error: `Missing required columns: ${missingColumns.join(', ')}` },
        { status: 400 }
      );
    }

    const { data: passports } = await supabaseAdmin
      .from('passports')
      .select('slug');

    const { data: countries } = await supabaseAdmin
      .from('countries')
      .select('slug');

    const validPassportSlugs = new Set((passports || []).map((p: any) => p.slug));
    const validCountrySlugs = new Set((countries || []).map((c: any) => c.slug));

    const rows: CSVRow[] = [];
    const errors: ValidationError[] = [];

    for (let i = 1; i < lines.length; i++) {
      const line = lines[i];
      const rowNum = i + 1;

      if (line.length === 0 || line.every(field => !field)) {
        continue;
      }

      const row: any = {};
      headers.forEach((header, index) => {
        row[header] = line[index] || '';
      });

      if (!row.passport_slug) {
        errors.push({ row: rowNum, message: 'Missing passport_slug' });
        continue;
      }
      if (!row.destination_slug) {
        errors.push({ row: rowNum, message: 'Missing destination_slug' });
        continue;
      }
      if (!row.pathway_type) {
        errors.push({ row: rowNum, message: 'Missing pathway_type' });
        continue;
      }
      if (!row.pathway_name) {
        errors.push({ row: rowNum, message: 'Missing pathway_name' });
        continue;
      }

      if (!validPassportSlugs.has(row.passport_slug)) {
        errors.push({ row: rowNum, message: `Invalid passport_slug: ${row.passport_slug}` });
        continue;
      }

      if (!validCountrySlugs.has(row.destination_slug)) {
        errors.push({ row: rowNum, message: `Invalid destination_slug: ${row.destination_slug}` });
        continue;
      }

      if (!VALID_PATHWAY_TYPES.includes(row.pathway_type)) {
        errors.push({ row: rowNum, message: `Invalid pathway_type: ${row.pathway_type}. Must be one of: ${VALID_PATHWAY_TYPES.join(', ')}` });
        continue;
      }

      if (row.last_updated && !validateDate(row.last_updated)) {
        errors.push({ row: rowNum, message: `Invalid last_updated date format: ${row.last_updated}. Must be YYYY-MM-DD` });
        continue;
      }

      const csvRow: CSVRow = {
        passport_slug: row.passport_slug,
        destination_slug: row.destination_slug,
        pathway_type: row.pathway_type,
        pathway_name: row.pathway_name,
      };

      if (row.summary) csvRow.summary = row.summary;
      if (row.eligibility) csvRow.eligibility = row.eligibility;
      if (row.requirements) csvRow.requirements = row.requirements;
      if (row.processing_time) csvRow.processing_time = row.processing_time;
      if (row.validity_period) csvRow.validity_period = row.validity_period;
      if (row.official_url) csvRow.official_url = row.official_url;
      if (row.last_updated) csvRow.last_updated = row.last_updated;

      rows.push(csvRow);
    }

    const totalRows = lines.length - 1;
    const validRows = rows.length;

    if (mode === 'dry_run') {
      return NextResponse.json({
        mode: 'dry_run',
        total_rows: totalRows,
        valid_rows: validRows,
        invalid_rows: errors.length,
        imported_count: 0,
        updated_count: 0,
        skipped_count: 0,
        errors: errors.slice(0, 50),
        message: 'Dry run completed. No data was written.',
      });
    }

    const existingKeys = new Set<string>();
    if (rows.length > 0) {
      const keys = rows.map(r => ({
        passport_slug: r.passport_slug,
        destination_slug: r.destination_slug,
        pathway_type: r.pathway_type,
        pathway_name: r.pathway_name,
      }));

      for (const key of keys) {
        const { data } = await supabaseAdmin
          .from('immigration_pathways')
          .select('id')
          .eq('passport_slug', key.passport_slug)
          .eq('destination_slug', key.destination_slug)
          .eq('pathway_type', key.pathway_type)
          .eq('pathway_name', key.pathway_name)
          .maybeSingle();

        if (data) {
          existingKeys.add(`${key.passport_slug}|${key.destination_slug}|${key.pathway_type}|${key.pathway_name}`);
        }
      }
    }

    let importedCount = 0;
    let updatedCount = 0;

    for (const row of rows) {
      const key = `${row.passport_slug}|${row.destination_slug}|${row.pathway_type}|${row.pathway_name}`;
      const isUpdate = existingKeys.has(key);

      const { error: upsertError } = await supabaseAdmin
        .from('immigration_pathways')
        .upsert(row as any, {
          onConflict: 'passport_slug,destination_slug,pathway_type,pathway_name',
        });

      if (upsertError) {
        errors.push({
          row: 0,
          message: `Error upserting ${row.pathway_name}: ${upsertError.message}`,
        });
      } else {
        if (isUpdate) {
          updatedCount++;
        } else {
          importedCount++;
        }
      }
    }

    const exampleKeys = rows.slice(0, 5).map(r =>
      `${r.passport_slug} -> ${r.destination_slug}: ${r.pathway_name}`
    );

    return NextResponse.json({
      mode: 'upsert',
      total_rows: totalRows,
      valid_rows: validRows,
      invalid_rows: errors.length,
      imported_count: importedCount,
      updated_count: updatedCount,
      skipped_count: 0,
      errors: errors.slice(0, 50),
      example_keys: exampleKeys,
      message: `Successfully processed ${importedCount + updatedCount} pathways (${importedCount} new, ${updatedCount} updated)`,
    });

  } catch (error) {
    console.error('Import error:', error);
    return NextResponse.json(
      { error: 'Failed to process CSV file' },
      { status: 500 }
    );
  }
}
