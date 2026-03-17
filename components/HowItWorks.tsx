import { Search, FileText, CircleCheck as CheckCircle } from 'lucide-react';

const STEPS = [
  {
    number: '1',
    title: 'Pick passport + destination',
    description: 'Select your citizenship and where you want to relocate.',
    icon: Search,
  },
  {
    number: '2',
    title: 'Review common pathways',
    description: 'Explore available immigration options and requirements.',
    icon: FileText,
  },
  {
    number: '3',
    title: 'Verify via official sources',
    description: 'Confirm details with government websites and plan next steps.',
    icon: CheckCircle,
  },
];

export default function HowItWorks() {
  return (
    <div className="py-10 bg-gray-50">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <h2 className="text-3xl font-bold text-gray-900 mb-2 text-center">
          How It Works
        </h2>
        <p className="text-gray-600 text-center mb-12 max-w-2xl mx-auto">
          Find immigration pathways in three simple steps.
        </p>

        <div className="grid md:grid-cols-3 gap-8">
          {STEPS.map((step, index) => {
            const Icon = step.icon;
            return (
              <div key={index} className="relative">
                <div className="bg-white rounded-lg border border-gray-200 p-6 h-full">
                  <div className="flex items-start space-x-4">
                    <div className="flex-shrink-0">
                      <div className="w-12 h-12 rounded-full bg-indigo-100 flex items-center justify-center">
                        <span className="text-xl font-bold text-brand-primary">
                          {step.number}
                        </span>
                      </div>
                    </div>
                    <div className="flex-1">
                      <h3 className="text-lg font-semibold text-gray-900 mb-2">
                        {step.title}
                      </h3>
                      <p className="text-sm text-gray-600">
                        {step.description}
                      </p>
                    </div>
                  </div>
                  <div className="mt-4 flex justify-center">
                    <Icon className="h-12 w-12 text-gray-300" />
                  </div>
                </div>

                {index < STEPS.length - 1 && (
                  <div className="hidden md:block absolute top-1/2 -right-4 transform -translate-y-1/2 z-10">
                    <svg
                      className="h-8 w-8 text-indigo-400"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                    >
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth={2}
                        d="M9 5l7 7-7 7"
                      />
                    </svg>
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
