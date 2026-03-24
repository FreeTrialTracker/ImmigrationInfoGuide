import { NextRequest, NextResponse } from 'next/server';

interface BucketEntry {
  tokens: number;
  lastRefill: number;
}

const buckets = new Map<string, BucketEntry>();

const CLEANUP_INTERVAL_MS = 5 * 60 * 1000;
let lastCleanup = Date.now();

function cleanup() {
  const now = Date.now();
  if (now - lastCleanup < CLEANUP_INTERVAL_MS) return;
  lastCleanup = now;
  Array.from(buckets.entries()).forEach(([key, entry]) => {
    if (now - entry.lastRefill > CLEANUP_INTERVAL_MS) {
      buckets.delete(key);
    }
  });
}

export interface RateLimitOptions {
  maxTokens: number;
  refillRate: number;
  refillIntervalMs: number;
}

export function checkRateLimit(key: string, options: RateLimitOptions): boolean {
  cleanup();

  const now = Date.now();
  let entry = buckets.get(key);

  if (!entry) {
    entry = { tokens: options.maxTokens, lastRefill: now };
    buckets.set(key, entry);
  }

  const elapsed = now - entry.lastRefill;
  const refills = Math.floor(elapsed / options.refillIntervalMs) * options.refillRate;
  if (refills > 0) {
    entry.tokens = Math.min(options.maxTokens, entry.tokens + refills);
    entry.lastRefill = now;
  }

  if (entry.tokens < 1) {
    return false;
  }

  entry.tokens -= 1;
  return true;
}

export function getClientIp(request: NextRequest): string {
  return (
    request.headers.get('x-forwarded-for')?.split(',')[0].trim() ||
    request.headers.get('x-real-ip') ||
    'unknown'
  );
}

export function rateLimitResponse(): NextResponse {
  return NextResponse.json(
    { error: 'Too many requests. Please try again later.' },
    {
      status: 429,
      headers: { 'Retry-After': '60' },
    }
  );
}
