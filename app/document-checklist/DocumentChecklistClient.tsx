'use client';

import { useState } from 'react';
import { Check, FileCheck, Printer, Download, CircleAlert as AlertCircle, FileText, Plane } from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import { Select, SelectContent, SelectGroup, SelectItem, SelectLabel, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Alert, AlertDescription } from '@/components/ui/alert';

interface Document {
  id: string;
  name: string;
  description: string;
  category: string;
  processingTime?: string;
  notes?: string;
}

interface ChecklistState {
  [key: string]: boolean;
}

const countries = [
  { value: 'argentina', label: 'Argentina', region: 'South America' },
  { value: 'australia', label: 'Australia', region: 'Oceania' },
  { value: 'austria', label: 'Austria', region: 'Europe' },
  { value: 'belgium', label: 'Belgium', region: 'Europe' },
  { value: 'brazil', label: 'Brazil', region: 'South America' },
  { value: 'canada', label: 'Canada', region: 'North America' },
  { value: 'chile', label: 'Chile', region: 'South America' },
  { value: 'china', label: 'China', region: 'Asia' },
  { value: 'colombia', label: 'Colombia', region: 'South America' },
  { value: 'croatia', label: 'Croatia', region: 'Europe' },
  { value: 'czech-republic', label: 'Czech Republic', region: 'Europe' },
  { value: 'denmark', label: 'Denmark', region: 'Europe' },
  { value: 'egypt', label: 'Egypt', region: 'Africa' },
  { value: 'finland', label: 'Finland', region: 'Europe' },
  { value: 'france', label: 'France', region: 'Europe' },
  { value: 'germany', label: 'Germany', region: 'Europe' },
  { value: 'greece', label: 'Greece', region: 'Europe' },
  { value: 'hungary', label: 'Hungary', region: 'Europe' },
  { value: 'india', label: 'India', region: 'Asia' },
  { value: 'indonesia', label: 'Indonesia', region: 'Asia' },
  { value: 'ireland', label: 'Ireland', region: 'Europe' },
  { value: 'israel', label: 'Israel', region: 'Middle East' },
  { value: 'italy', label: 'Italy', region: 'Europe' },
  { value: 'japan', label: 'Japan', region: 'Asia' },
  { value: 'malaysia', label: 'Malaysia', region: 'Asia' },
  { value: 'mexico', label: 'Mexico', region: 'North America' },
  { value: 'morocco', label: 'Morocco', region: 'Africa' },
  { value: 'netherlands', label: 'Netherlands', region: 'Europe' },
  { value: 'new-zealand', label: 'New Zealand', region: 'Oceania' },
  { value: 'nigeria', label: 'Nigeria', region: 'Africa' },
  { value: 'norway', label: 'Norway', region: 'Europe' },
  { value: 'peru', label: 'Peru', region: 'South America' },
  { value: 'philippines', label: 'Philippines', region: 'Asia' },
  { value: 'poland', label: 'Poland', region: 'Europe' },
  { value: 'portugal', label: 'Portugal', region: 'Europe' },
  { value: 'qatar', label: 'Qatar', region: 'Middle East' },
  { value: 'romania', label: 'Romania', region: 'Europe' },
  { value: 'russia', label: 'Russia', region: 'Europe' },
  { value: 'saudi-arabia', label: 'Saudi Arabia', region: 'Middle East' },
  { value: 'singapore', label: 'Singapore', region: 'Asia' },
  { value: 'south-africa', label: 'South Africa', region: 'Africa' },
  { value: 'south-korea', label: 'South Korea', region: 'Asia' },
  { value: 'spain', label: 'Spain', region: 'Europe' },
  { value: 'sweden', label: 'Sweden', region: 'Europe' },
  { value: 'switzerland', label: 'Switzerland', region: 'Europe' },
  { value: 'thailand', label: 'Thailand', region: 'Asia' },
  { value: 'turkey', label: 'Turkey', region: 'Europe' },
  { value: 'ukraine', label: 'Ukraine', region: 'Europe' },
  { value: 'united-arab-emirates', label: 'United Arab Emirates', region: 'Middle East' },
  { value: 'united-kingdom', label: 'United Kingdom', region: 'Europe' },
  { value: 'united-states', label: 'United States', region: 'North America' },
  { value: 'vietnam', label: 'Vietnam', region: 'Asia' },
];

const regions = Array.from(new Set(countries.map(c => c.region))).sort();

const pathwayTypes = [
  { value: 'work', label: 'Work Visa' },
  { value: 'study', label: 'Study Visa' },
  { value: 'digital-nomad', label: 'Digital Nomad Visa' },
  { value: 'retirement', label: 'Retirement Visa' },
  { value: 'investor', label: 'Investor/Business Visa' },
  { value: 'family', label: 'Family Sponsorship' },
  { value: 'permanent-residency', label: 'Permanent Residency' },
];

const getDocuments = (country: string, pathway: string): Document[] => {
  const baseDocuments: Document[] = [
    {
      id: 'passport',
      name: 'Valid Passport',
      description: 'Passport valid for at least 6 months beyond intended stay',
      category: 'Identity Documents',
      notes: 'Must have at least 2 blank pages'
    },
    {
      id: 'passport-photos',
      name: 'Passport-sized Photos',
      description: 'Recent color photographs meeting specific requirements',
      category: 'Identity Documents',
      notes: 'Usually 2-4 photos, check specific country requirements'
    },
    {
      id: 'birth-certificate',
      name: 'Birth Certificate',
      description: 'Original or certified copy of birth certificate',
      category: 'Identity Documents',
      notes: 'May need to be translated and notarized'
    },
    {
      id: 'police-certificate',
      name: 'Police Clearance Certificate',
      description: 'Criminal background check from countries lived in',
      category: 'Background Checks',
      processingTime: '4-12 weeks',
      notes: 'Required for countries lived in for 6+ months'
    },
    {
      id: 'medical-exam',
      name: 'Medical Examination',
      description: 'Health examination by approved panel physician',
      category: 'Medical Documents',
      processingTime: '1-2 weeks',
      notes: 'Results valid for 6-12 months'
    },
  ];

  if (pathway === 'work') {
    baseDocuments.push(
      {
        id: 'job-offer',
        name: 'Job Offer Letter',
        description: 'Official job offer from employer in destination country',
        category: 'Employment Documents',
        notes: 'Must include salary, job title, and duties'
      },
      {
        id: 'labor-market',
        name: 'Labor Market Impact Assessment (if applicable)',
        description: 'Proof that employer cannot find local worker',
        category: 'Employment Documents',
        notes: 'Required in Canada, varies by country'
      },
      {
        id: 'employment-contract',
        name: 'Employment Contract',
        description: 'Signed employment agreement',
        category: 'Employment Documents',
      },
      {
        id: 'resume',
        name: 'Resume/CV',
        description: 'Detailed work history and qualifications',
        category: 'Employment Documents',
      },
      {
        id: 'education-certificates',
        name: 'Educational Certificates',
        description: 'Degrees, diplomas, and transcripts',
        category: 'Educational Documents',
        notes: 'May require credential evaluation'
      },
      {
        id: 'work-experience',
        name: 'Work Experience Letters',
        description: 'Reference letters from previous employers',
        category: 'Employment Documents',
        notes: 'Should include job duties, dates, and contact info'
      },
      {
        id: 'professional-licenses',
        name: 'Professional Licenses/Certifications',
        description: 'Relevant professional qualifications',
        category: 'Employment Documents',
      }
    );
  }

  if (pathway === 'study') {
    baseDocuments.push(
      {
        id: 'acceptance-letter',
        name: 'Letter of Acceptance',
        description: 'Official acceptance from educational institution',
        category: 'Educational Documents',
      },
      {
        id: 'proof-of-tuition',
        name: 'Proof of Tuition Payment',
        description: 'Receipt or proof of tuition fee payment',
        category: 'Financial Documents',
      },
      {
        id: 'academic-transcripts',
        name: 'Academic Transcripts',
        description: 'Official transcripts from previous institutions',
        category: 'Educational Documents',
        notes: 'May require translation and notarization'
      },
      {
        id: 'language-test',
        name: 'Language Test Results',
        description: 'IELTS, TOEFL, or other language proficiency test',
        category: 'Educational Documents',
        processingTime: '2-4 weeks',
        notes: 'Valid for 2 years'
      },
      {
        id: 'financial-proof',
        name: 'Proof of Financial Support',
        description: 'Bank statements or sponsor letter',
        category: 'Financial Documents',
        notes: 'Must show sufficient funds for tuition and living expenses'
      },
      {
        id: 'study-plan',
        name: 'Statement of Purpose/Study Plan',
        description: 'Essay explaining your study goals',
        category: 'Educational Documents',
      }
    );
  }

  if (pathway === 'digital-nomad') {
    baseDocuments.push(
      {
        id: 'proof-of-remote-work',
        name: 'Proof of Remote Employment',
        description: 'Employment contract or client agreements',
        category: 'Employment Documents',
      },
      {
        id: 'income-proof',
        name: 'Proof of Income',
        description: 'Bank statements or tax returns showing income',
        category: 'Financial Documents',
        notes: 'Usually need to show minimum monthly income'
      },
      {
        id: 'health-insurance',
        name: 'International Health Insurance',
        description: 'Valid health insurance covering destination country',
        category: 'Insurance Documents',
      },
      {
        id: 'portfolio',
        name: 'Professional Portfolio',
        description: 'Evidence of professional work/business',
        category: 'Employment Documents',
      }
    );
  }

  if (pathway === 'retirement') {
    baseDocuments.push(
      {
        id: 'pension-proof',
        name: 'Proof of Pension/Retirement Income',
        description: 'Official pension statements or income proof',
        category: 'Financial Documents',
      },
      {
        id: 'bank-statements',
        name: 'Bank Statements',
        description: 'Recent bank statements showing savings',
        category: 'Financial Documents',
        notes: 'Usually last 3-6 months'
      },
      {
        id: 'retirement-health-insurance',
        name: 'Health Insurance',
        description: 'International or local health insurance coverage',
        category: 'Insurance Documents',
      },
      {
        id: 'proof-of-age',
        name: 'Proof of Age Requirement',
        description: 'Documentation showing you meet minimum age',
        category: 'Identity Documents',
        notes: 'Age requirement varies by country (typically 50-65)'
      }
    );
  }

  if (pathway === 'investor') {
    baseDocuments.push(
      {
        id: 'business-plan',
        name: 'Business Plan',
        description: 'Detailed business plan and financial projections',
        category: 'Business Documents',
      },
      {
        id: 'proof-of-funds',
        name: 'Proof of Investment Funds',
        description: 'Bank statements showing required investment amount',
        category: 'Financial Documents',
        notes: 'Amount varies significantly by country'
      },
      {
        id: 'source-of-funds',
        name: 'Source of Funds Documentation',
        description: 'Documentation proving legal source of investment funds',
        category: 'Financial Documents',
      },
      {
        id: 'business-experience',
        name: 'Business Experience Evidence',
        description: 'Proof of business management experience',
        category: 'Business Documents',
      },
      {
        id: 'financial-statements',
        name: 'Financial Statements',
        description: 'Personal and/or business financial statements',
        category: 'Financial Documents',
        notes: 'Usually last 2-3 years'
      }
    );
  }

  if (pathway === 'family') {
    baseDocuments.push(
      {
        id: 'marriage-certificate',
        name: 'Marriage Certificate',
        description: 'Original or certified copy of marriage certificate',
        category: 'Relationship Documents',
        notes: 'If applicable, may require translation'
      },
      {
        id: 'relationship-proof',
        name: 'Proof of Relationship',
        description: 'Photos, correspondence, joint accounts, etc.',
        category: 'Relationship Documents',
        notes: 'Show genuine and continuing relationship'
      },
      {
        id: 'sponsor-documents',
        name: 'Sponsor Documents',
        description: 'Sponsor\'s citizenship or residency proof',
        category: 'Relationship Documents',
      },
      {
        id: 'sponsor-financial',
        name: 'Sponsor\'s Financial Documents',
        description: 'Proof of sponsor\'s income and ability to support',
        category: 'Financial Documents',
      }
    );
  }

  if (pathway === 'permanent-residency') {
    baseDocuments.push(
      {
        id: 'pr-education',
        name: 'Educational Credential Assessment',
        description: 'Foreign credential evaluation',
        category: 'Educational Documents',
        processingTime: '4-8 weeks',
      },
      {
        id: 'pr-language',
        name: 'Language Test Results',
        description: 'IELTS, CELPIP, TEF, or other language test',
        category: 'Educational Documents',
        processingTime: '2-4 weeks',
      },
      {
        id: 'pr-work-experience',
        name: 'Detailed Work Experience',
        description: 'Reference letters with job duties',
        category: 'Employment Documents',
      },
      {
        id: 'settlement-funds',
        name: 'Proof of Settlement Funds',
        description: 'Bank statements showing required funds',
        category: 'Financial Documents',
        notes: 'Amount varies by country and family size'
      }
    );
  }

  baseDocuments.push(
    {
      id: 'application-form',
      name: 'Completed Application Form',
      description: 'Official visa application form',
      category: 'Application Documents',
    },
    {
      id: 'visa-fee',
      name: 'Visa Application Fee Payment',
      description: 'Receipt of visa application fee payment',
      category: 'Application Documents',
    },
    {
      id: 'travel-itinerary',
      name: 'Travel Itinerary (if applicable)',
      description: 'Flight bookings or travel plans',
      category: 'Travel Documents',
      notes: 'Don\'t purchase tickets until visa approved'
    },
    {
      id: 'accommodation-proof',
      name: 'Proof of Accommodation',
      description: 'Hotel booking, rental agreement, or sponsor letter',
      category: 'Travel Documents',
    }
  );

  return baseDocuments;
};

export default function DocumentChecklistClient() {
  const [selectedCountry, setSelectedCountry] = useState<string>('');
  const [selectedPathway, setSelectedPathway] = useState<string>('');
  const [checklist, setChecklist] = useState<ChecklistState>({});
  const [documents, setDocuments] = useState<Document[]>([]);
  const [showChecklist, setShowChecklist] = useState(false);

  const handleGenerate = () => {
    if (!selectedCountry || !selectedPathway) return;

    const docs = getDocuments(selectedCountry, selectedPathway);
    setDocuments(docs);
    setChecklist({});
    setShowChecklist(true);
  };

  const handleCheckboxChange = (documentId: string) => {
    setChecklist(prev => ({
      ...prev,
      [documentId]: !prev[documentId]
    }));
  };

  const handlePrint = () => {
    window.print();
  };

  const handleDownload = () => {
    const checkedDocs = documents.filter(doc => checklist[doc.id]);
    const uncheckedDocs = documents.filter(doc => !checklist[doc.id]);

    let content = `IMMIGRATION DOCUMENT CHECKLIST\n\n`;
    content += `Country: ${countries.find(c => c.value === selectedCountry)?.label}\n`;
    content += `Pathway: ${pathwayTypes.find(p => p.value === selectedPathway)?.label}\n\n`;
    content += `Generated: ${new Date().toLocaleDateString()}\n\n`;
    content += `=======================================================\n\n`;

    const categories = Array.from(new Set(documents.map(d => d.category)));

    categories.forEach(category => {
      const categoryDocs = documents.filter(d => d.category === category);
      content += `\n${category.toUpperCase()}\n`;
      content += `${'-'.repeat(50)}\n\n`;

      categoryDocs.forEach(doc => {
        const isChecked = checklist[doc.id];
        content += `${isChecked ? 'DONE' : '[ ]'} ${doc.name}\n`;
        content += `   ${doc.description}\n`;
        if (doc.processingTime) {
          content += `   Processing Time: ${doc.processingTime}\n`;
        }
        if (doc.notes) {
          content += `   Notes: ${doc.notes}\n`;
        }
        content += `\n`;
      });
    });

    content += `\n=======================================================\n`;
    content += `\nProgress: ${checkedDocs.length} of ${documents.length} documents completed\n`;
    content += `\nIMPORTANT: Always verify current requirements with official government sources.\n`;
    content += `Requirements may change and individual circumstances vary.\n`;

    const blob = new Blob([content], { type: 'text/plain' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `immigration-checklist-${selectedCountry}-${selectedPathway}.txt`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    window.URL.revokeObjectURL(url);
  };

  const completedCount = Object.values(checklist).filter(Boolean).length;
  const progressPercentage = documents.length > 0 ? (completedCount / documents.length) * 100 : 0;

  const groupedDocuments = documents.reduce((acc, doc) => {
    if (!acc[doc.category]) {
      acc[doc.category] = [];
    }
    acc[doc.category].push(doc);
    return acc;
  }, {} as Record<string, Document[]>);

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="text-center mb-8">
          <div className="inline-flex items-center justify-center w-16 h-16 bg-indigo-100 rounded-full mb-4">
            <FileCheck className="w-8 h-8 text-brand-primary" />
          </div>
          <h1 className="text-3xl font-bold text-gray-900 mb-3">
            Immigration Document Checklist
          </h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Generate a customized checklist of required documents for your immigration pathway
          </p>
        </div>

        <Card className="mb-8">
          <CardHeader>
            <CardTitle>Generate Your Checklist</CardTitle>
            <CardDescription>
              Select your destination country and pathway type to see required documents
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="grid md:grid-cols-2 gap-6">
              <div className="space-y-2">
                <label className="text-sm font-medium text-gray-700">
                  Destination Country
                </label>
                <Select value={selectedCountry} onValueChange={setSelectedCountry}>
                  <SelectTrigger>
                    <SelectValue placeholder="Select country" />
                  </SelectTrigger>
                  <SelectContent>
                    {regions.map(region => (
                      <SelectGroup key={region}>
                        <SelectLabel className="text-xs font-semibold text-gray-500 uppercase tracking-wider px-2 py-1.5">{region}</SelectLabel>
                        {countries.filter(c => c.region === region).map(country => (
                          <SelectItem key={country.value} value={country.value}>
                            {country.label}
                          </SelectItem>
                        ))}
                      </SelectGroup>
                    ))}
                  </SelectContent>
                </Select>
              </div>

              <div className="space-y-2">
                <label className="text-sm font-medium text-gray-700">
                  Pathway Type
                </label>
                <Select value={selectedPathway} onValueChange={setSelectedPathway}>
                  <SelectTrigger>
                    <SelectValue placeholder="Select pathway" />
                  </SelectTrigger>
                  <SelectContent>
                    {pathwayTypes.map(pathway => (
                      <SelectItem key={pathway.value} value={pathway.value}>
                        {pathway.label}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
            </div>

            <Button
              onClick={handleGenerate}
              disabled={!selectedCountry || !selectedPathway}
              className="w-full bg-brand-primary hover:bg-indigo-700"
            >
              Generate Checklist
            </Button>
          </CardContent>
        </Card>

        {showChecklist && documents.length > 0 && (
          <>
            <Alert className="mb-6 border-amber-200 bg-amber-50">
              <AlertCircle className="h-4 w-4 text-amber-600" />
              <AlertDescription className="text-amber-800">
                This checklist is for general guidance only. Always verify current requirements with official government sources.
                Requirements may vary based on individual circumstances.
              </AlertDescription>
            </Alert>

            <Card className="mb-6">
              <CardHeader className="pb-3">
                <div className="flex items-center justify-between">
                  <div>
                    <CardTitle>Your Document Checklist</CardTitle>
                    <CardDescription>
                      {countries.find(c => c.value === selectedCountry)?.label} - {pathwayTypes.find(p => p.value === selectedPathway)?.label}
                    </CardDescription>
                  </div>
                  <div className="flex gap-2">
                    <Button variant="outline" size="sm" onClick={handlePrint}>
                      <Printer className="w-4 h-4 mr-2" />
                      Print
                    </Button>
                    <Button variant="outline" size="sm" onClick={handleDownload}>
                      <Download className="w-4 h-4 mr-2" />
                      Download
                    </Button>
                  </div>
                </div>
              </CardHeader>
              <CardContent>
                <div className="mb-6">
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-sm font-medium text-gray-700">Progress</span>
                    <span className="text-sm text-gray-600">
                      {completedCount} of {documents.length} completed
                    </span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-3">
                    <div
                      className="bg-brand-primary h-3 rounded-full transition-all duration-300"
                      style={{ width: `${progressPercentage}%` }}
                    />
                  </div>
                </div>

                <div className="space-y-6">
                  {Object.entries(groupedDocuments).map(([category, docs]) => (
                    <div key={category}>
                      <h3 className="text-lg font-semibold text-gray-900 mb-3 border-b pb-2">
                        {category}
                      </h3>
                      <div className="space-y-4">
                        {docs.map(doc => (
                          <div
                            key={doc.id}
                            className={`p-4 border rounded-lg transition-colors ${
                              checklist[doc.id]
                                ? 'bg-indigo-50 border-indigo-200'
                                : 'bg-white border-gray-200'
                            }`}
                          >
                            <div className="flex items-start space-x-3">
                              <Checkbox
                                id={doc.id}
                                checked={checklist[doc.id] || false}
                                onCheckedChange={() => handleCheckboxChange(doc.id)}
                                className="mt-1"
                              />
                              <div className="flex-1">
                                <label
                                  htmlFor={doc.id}
                                  className={`font-medium cursor-pointer ${
                                    checklist[doc.id] ? 'text-indigo-900' : 'text-gray-900'
                                  }`}
                                >
                                  {doc.name}
                                  {checklist[doc.id] && (
                                    <Check className="inline-block w-4 h-4 ml-2 text-brand-primary" />
                                  )}
                                </label>
                                <p className="text-sm text-gray-600 mt-1">
                                  {doc.description}
                                </p>
                                {doc.processingTime && (
                                  <p className="text-sm text-blue-600 mt-1">
                                    Processing Time: {doc.processingTime}
                                  </p>
                                )}
                                {doc.notes && (
                                  <p className="text-sm text-amber-700 mt-1 bg-amber-50 p-2 rounded">
                                    [Note] {doc.notes}
                                  </p>
                                )}
                              </div>
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>

            <Alert className="border-blue-200 bg-blue-50">
              <AlertCircle className="h-4 w-4 text-blue-600" />
              <AlertDescription className="text-blue-800">
                <strong>Next Steps:</strong> Once you've gathered all documents, verify with the official immigration website
                or consult with a licensed immigration advisor. Keep copies of all documents for your records.
              </AlertDescription>
            </Alert>

            <div className="grid sm:grid-cols-2 gap-4 p-5 bg-sky-50 border border-sky-200 rounded-xl">
              <a
                href="https://www.visainfoguide.com"
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-start gap-3 group"
              >
                <FileText className="h-5 w-5 text-sky-600 mt-0.5 flex-shrink-0" />
                <div>
                  <p className="text-sm font-semibold text-sky-900 group-hover:text-sky-700 transition-colors">Need an entry visa while waiting? →</p>
                  <p className="text-xs text-sky-700 mt-0.5">Check if you need a tourist or short-stay visa to enter your destination while your main permit is being processed. VisaInfoGuide.com</p>
                </div>
              </a>
              <a
                href="https://www.restinairport.com"
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-start gap-3 group"
              >
                <Plane className="h-5 w-5 text-sky-600 mt-0.5 flex-shrink-0" />
                <div>
                  <p className="text-sm font-semibold text-sky-900 group-hover:text-sky-700 transition-colors">Plan your relocation flight →</p>
                  <p className="text-xs text-sky-700 mt-0.5">Long-haul international relocation flights often involve layovers. Find airside hotels and sleep pods at RestInAirport.com.</p>
                </div>
              </a>
            </div>
          </>
        )}
      </div>
    </div>
  );
}
