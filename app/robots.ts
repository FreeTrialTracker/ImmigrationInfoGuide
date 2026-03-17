import { MetadataRoute } from 'next';

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: '*',
        allow: '/',
        disallow: [
          '/admin/',
          '/api/',
          '/api/*',
        ],
      },
    ],
    sitemap: 'https://immigrationinfoguide.com/sitemap.xml',
    host: 'https://immigrationinfoguide.com',
  };
}
