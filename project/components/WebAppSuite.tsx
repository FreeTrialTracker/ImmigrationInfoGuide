import Image from 'next/image';
import { ArrowRight } from 'lucide-react';
import { Card, CardContent } from '@/components/ui/card';

const webapps = [
  {
    category: 'Immigration & Travel',
    name: 'VisaInfoGuide.com',
    url: 'https://visainfoguide.com',
    logo: '/VisaInfoGuide.com.png',
    description: 'Visit VisaInfoGuide.com, your trusted companion for navigating the world\'s visa landscape. Whether you\'re planning a short holiday, relocating abroad, or pursuing international opportunities, we cut through the red tape so you don\'t have to. Get clear, up-to-date guidance on visa requirements, application processes, and entry rules for countries worldwide. Travel smarter. Move with confidence.',
  },
  {
    category: 'Airport & Travel',
    name: 'RestInAirport.com',
    url: 'https://restinairport.com',
    logo: '/RestInAirport.com.png.png',
    description: 'RestInAirport.com is your go-to platform for finding the best way to rest during any airport layover, anywhere in the world. Long connections, overnight flights, and transit stops do not have to be exhausting or uncertain. Discover airside transit hotels, sleep pods, private suites, and lounges you can access without leaving the airport. Every listing is built to answer what actually matters: Can you stay without immigration, where is it located, and how do you get there. Clear information, no guesswork, real options, so you can rest smarter and travel better.',
  },
];

export default function WebAppSuite() {
  return (
    <section className="bg-slate-50 py-10">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            Explore Our Suite of Web Applications
          </h2>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Discover our family of specialized platforms designed to solve real problems and make your digital life easier
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {webapps.map((app) => (
            <Card key={app.name} className="overflow-hidden hover:shadow-xl transition-shadow duration-300 bg-white">
              <CardContent className="p-6">
                <div className="flex items-start gap-4 mb-4">
                  <div className="flex-shrink-0 w-20 h-20 bg-white rounded-lg p-2 border border-gray-200">
                    <Image
                      src={app.logo}
                      alt={`${app.name} logo`}
                      width={80}
                      height={80}
                      className="w-full h-full object-contain"
                    />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-xs font-semibold text-brand-primary uppercase tracking-wide mb-1">
                      {app.category}
                    </p>
                    <h3 className="text-xl font-bold text-gray-900 mb-2">
                      {app.name}
                    </h3>
                  </div>
                </div>
                <p className="text-sm text-gray-600 leading-relaxed mb-4">
                  {app.description}
                </p>
                <a
                  href={app.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 text-sm font-semibold text-brand-primary hover:text-brand-primary/80 transition-colors group"
                >
                  Visit {app.name === 'RestInAirport.com' ? 'Restinairport.com' : app.name}
                  <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                </a>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
}
