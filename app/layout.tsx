import './globals.css';
import type { Metadata } from 'next';
import { Inter, Space_Grotesk } from 'next/font/google';
import Header from '@/components/Header';
import Footer from '@/components/Footer';
import { buildOrganizationSchema } from '@/lib/schemaBuilders';

const inter = Inter({
  subsets: ['latin'],
  variable: '--font-inter',
});

const spaceGrotesk = Space_Grotesk({
  subsets: ['latin'],
  weight: '700',
  variable: '--font-space-grotesk',
});

export const metadata: Metadata = {
  metadataBase: new URL('https://immigrationinfoguide.com'),
  title: {
    default: 'ImmigrationInfoGuide.com - Immigration Pathways & Relocation Planning',
    template: '%s | ImmigrationInfoGuide.com',
  },
  description: 'Plan your relocation and explore legal pathways for long-term stay. Find immigration options based on your passport, destination, and goals.',
  keywords: ['immigration', 'visa', 'relocation', 'expat', 'move abroad', 'work permit', 'residency'],
  icons: {
    icon: [
      { url: '/IMMIGRATION_INFO_NEW_FAVICON.png', sizes: 'any' },
      { url: '/IMMIGRATION_INFO_NEW_FAVICON.png', sizes: '32x32', type: 'image/png' },
    ],
    shortcut: '/IMMIGRATION_INFO_NEW_FAVICON.png',
    apple: '/IMMIGRATION_INFO_NEW_FAVICON.png',
  },
  openGraph: {
    type: 'website',
    locale: 'en_US',
    url: 'https://immigrationinfoguide.com',
    siteName: 'ImmigrationInfoGuide.com',
    title: 'ImmigrationInfoGuide.com - Immigration Pathways & Relocation Planning',
    description: 'Plan your relocation and explore legal pathways for long-term stay. Find immigration options based on your passport, destination, and goals.',
    images: [{
      url: '/og-image.webp',
      width: 1200,
      height: 630,
      alt: 'ImmigrationInfoGuide.com - Immigration Pathways & Relocation Planning',
    }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'ImmigrationInfoGuide.com - Immigration Pathways & Relocation Planning',
    description: 'Plan your relocation and explore legal pathways for long-term stay. Find immigration options based on your passport, destination, and goals.',
    images: ['/og-image.webp'],
  },
  alternates: {
    canonical: 'https://immigrationinfoguide.com',
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const organizationSchema = buildOrganizationSchema();

  return (
    <html lang="en">
      <head>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(organizationSchema) }}
        />
      </head>
      <body className={`${inter.variable} ${spaceGrotesk.variable} font-sans`}>
        <Header />
        <main>{children}</main>
        <Footer />
      </body>
    </html>
  );
}
