/** @type {import('next').NextConfig} */
const nextConfig = {
  eslint: {
    ignoreDuringBuilds: true,
  },
  async redirects() {
    return [
      {
        source: '/immigration-pathway/:slug',
        destination: '/immigrate-to/:slug',
        permanent: true,
      },
      {
        source: '/pathway/:slug',
        destination: '/immigrate-to/:slug',
        permanent: true,
      },
      {
        source: '/guides/:slug',
        destination: '/country/:slug',
        permanent: true,
      },
    ];
  },
  images: {
    formats: ['image/avif', 'image/webp'],
    deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'images.pexels.com',
        port: '',
        pathname: '/**',
      },
    ],
  },
};

module.exports = nextConfig;
