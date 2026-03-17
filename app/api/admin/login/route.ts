import { NextRequest, NextResponse } from 'next/server';
import { checkRateLimit, getClientIp, rateLimitResponse } from '@/lib/rateLimit';

const LOGIN_RATE_LIMIT = {
  maxTokens: 5,
  refillRate: 1,
  refillIntervalMs: 60_000,
};

export async function POST(request: NextRequest) {
  const ip = getClientIp(request);
  if (!checkRateLimit(`admin:login:${ip}`, LOGIN_RATE_LIMIT)) {
    return rateLimitResponse();
  }

  try {
    const body = await request.json();
    const { password } = body;

    const correctPassword = process.env.ADMIN_IMPORT_PASSWORD;

    if (!correctPassword) {
      return NextResponse.json(
        { error: 'Admin password not configured' },
        { status: 500 }
      );
    }

    if (password !== correctPassword) {
      return NextResponse.json(
        { error: 'Invalid password' },
        { status: 401 }
      );
    }

    const response = NextResponse.json({ success: true });

    const isProduction = process.env.NODE_ENV === 'production';

    response.cookies.set('admin_import', 'true', {
      httpOnly: true,
      secure: isProduction,
      sameSite: 'lax',
      maxAge: 7200,
      path: '/',
    });

    return response;
  } catch (error) {
    return NextResponse.json(
      { error: 'Invalid request' },
      { status: 400 }
    );
  }
}
