export type ChecklistItem = { label: string; detail?: string };
export type ChecklistSection = { title: string; items: ChecklistItem[] };
export type ChecklistData = {
  id: string;
  title: string;
  subtitle: string;
  iconName: string;
  color: string;
  badge: string;
  sections: ChecklistSection[];
};

export const checklistsData: ChecklistData[] = [
  {
    id: 'skilled-work-visa',
    title: 'Skilled Work Visa',
    subtitle: 'General requirements for employer-sponsored or points-based skilled work visas',
    iconName: 'Briefcase',
    color: 'blue',
    badge: 'Most Popular',
    sections: [
      {
        title: 'Identity & Travel Documents',
        items: [
          { label: 'Valid passport', detail: 'Must be valid for at least 6 months beyond intended stay' },
          { label: 'Passport-size photos', detail: 'Typically 2-4 photos meeting official specifications' },
          { label: 'Previous visas / residence permits', detail: 'Copies of all prior immigration documents' },
          { label: 'Travel history documentation', detail: 'Entry/exit stamps or travel records if requested' },
        ],
      },
      {
        title: 'Employment & Qualifications',
        items: [
          { label: 'Job offer letter from employer', detail: 'Must include role, salary, and contract duration' },
          { label: 'Employment contract', detail: 'Signed copy with terms and conditions' },
          { label: 'Academic degree certificates', detail: 'Originals and certified translations if not in destination language' },
          { label: 'Professional qualifications / licenses', detail: 'Relevant certifications, trade licences, or board memberships' },
          { label: 'Updated CV / resume', detail: 'Detailing relevant work experience' },
          { label: 'Employer sponsorship confirmation', detail: 'Sponsor licence number or equivalent (UK, Australia, etc.)' },
        ],
      },
      {
        title: 'Financial Documents',
        items: [
          { label: 'Bank statements (3-6 months)', detail: 'Showing sufficient funds for relocation and settling in' },
          { label: 'Salary slips from current employer', detail: 'Last 3-6 payslips' },
          { label: 'Proof of funds if self-funded', detail: 'Investment accounts, savings, etc.' },
        ],
      },
      {
        title: 'Supporting Documents',
        items: [
          { label: 'Police clearance certificate', detail: 'From home country and any country lived in for 12+ months in last 5 years' },
          { label: 'Medical / health examination', detail: 'From an approved panel physician' },
          { label: 'Language proficiency test results', detail: 'IELTS, TOEFL, or equivalent (if required)' },
          { label: 'Completed visa application form', detail: 'Signed and dated' },
          { label: 'Application fee payment receipt' },
        ],
      },
    ],
  },
  {
    id: 'student-visa',
    title: 'Student Visa',
    subtitle: 'Documents required for studying abroad at a university or recognised institution',
    iconName: 'GraduationCap',
    color: 'green',
    badge: '',
    sections: [
      {
        title: 'Identity & Travel Documents',
        items: [
          { label: 'Valid passport' },
          { label: 'Passport-size photos' },
          { label: 'Previous visa history', detail: 'Any prior visas or refusals' },
        ],
      },
      {
        title: 'Admission & Institution',
        items: [
          { label: 'Unconditional offer letter', detail: 'From an accredited institution confirming acceptance' },
          { label: 'Confirmation of Acceptance for Studies (CAS)', detail: 'UK-specific; equivalent letters for other countries' },
          { label: 'Course enrollment details', detail: 'Program name, start date, duration, and tuition fees' },
          { label: 'Proof of payment of tuition deposit', detail: 'Receipt or bank transfer confirmation' },
          { label: 'Academic transcripts', detail: 'From previous educational institutions' },
          { label: 'Language proficiency results', detail: 'IELTS / TOEFL / DELF or equivalent' },
        ],
      },
      {
        title: 'Financial Proof',
        items: [
          { label: 'Bank statements (3-6 months)', detail: 'Must demonstrate ability to cover tuition and living costs' },
          { label: 'Scholarship or sponsorship letter', detail: 'If costs are covered by a third party' },
          { label: 'Parental financial support letter', detail: 'If parent or guardian is funding the studies' },
        ],
      },
      {
        title: 'Supporting Documents',
        items: [
          { label: 'Accommodation proof', detail: 'University-arranged housing or signed rental agreement' },
          { label: 'Health insurance / OSHC', detail: 'Overseas Student Health Cover (Australia) or equivalent' },
          { label: 'Statement of purpose / motivation letter' },
          { label: 'Medical examination results', detail: 'If required by the destination country' },
          { label: 'Police clearance certificate', detail: 'If required (varies by country and course duration)' },
        ],
      },
    ],
  },
  {
    id: 'permanent-residency',
    title: 'Permanent Residency',
    subtitle: 'Common documentation for long-term or permanent residence applications',
    iconName: 'Home',
    color: 'teal',
    badge: '',
    sections: [
      {
        title: 'Identity & Civil Documents',
        items: [
          { label: 'Valid passport and all previous passports' },
          { label: 'Birth certificate', detail: 'With certified translation if applicable' },
          { label: 'Marriage / divorce certificates', detail: 'If applicable, with translations' },
          { label: "Children's birth certificates", detail: 'If including dependants' },
          { label: 'Change of name documents', detail: 'If name differs from passport' },
        ],
      },
      {
        title: 'Immigration History',
        items: [
          { label: 'Current and prior visa / permit copies' },
          { label: 'Entry and exit records', detail: 'Dates of all trips outside the country' },
          { label: 'Compliance with visa conditions', detail: 'Evidence you met previous visa requirements' },
        ],
      },
      {
        title: 'Employment & Financial',
        items: [
          { label: 'Employment contracts and payslips', detail: 'Covering the required qualifying period' },
          { label: 'Tax return copies', detail: 'Filed tax returns for qualifying years' },
          { label: 'Bank statements (12 months)', detail: 'Demonstrating financial stability' },
          { label: 'Evidence of ongoing employment or business', detail: 'Letter from employer or business registration' },
        ],
      },
      {
        title: 'Integration & Language',
        items: [
          { label: 'Language proficiency certificate', detail: 'IELTS, Goethe, DELF, NT2 etc. (country-dependent)' },
          { label: 'Civic integration course completion', detail: 'Required in Netherlands, Germany, and others' },
          { label: 'Community ties evidence', detail: 'Property ownership, children in school, memberships' },
        ],
      },
      {
        title: 'Health & Background',
        items: [
          { label: 'Police clearance from all countries of residence' },
          { label: 'Medical / chest X-ray examination', detail: 'From an approved physician' },
          { label: 'Health insurance coverage proof' },
        ],
      },
    ],
  },
  {
    id: 'digital-nomad-visa',
    title: 'Digital Nomad Visa',
    subtitle: 'Requirements for remote worker and digital nomad visa programmes',
    iconName: 'Globe',
    color: 'amber',
    badge: 'Trending',
    sections: [
      {
        title: 'Identity Documents',
        items: [
          { label: 'Valid passport', detail: 'Typically 1-2 years validity required' },
          { label: 'Passport photos' },
        ],
      },
      {
        title: 'Remote Work Evidence',
        items: [
          { label: 'Employment contract with remote work clause', detail: 'Confirming ability to work from anywhere' },
          { label: 'Self-employment / freelance documentation', detail: 'Business registration, client contracts, or company ownership proof' },
          { label: 'Letter from employer confirming remote status' },
          { label: 'Portfolio or professional profile', detail: 'LinkedIn, personal website, or equivalent' },
        ],
      },
      {
        title: 'Financial Requirements',
        items: [
          { label: 'Proof of monthly income', detail: 'Typically USD 2,000-3,500/month depending on country' },
          { label: 'Bank statements (3-6 months)' },
          { label: "Tax returns or accountant's letter", detail: 'For freelancers and self-employed applicants' },
        ],
      },
      {
        title: 'Supporting Documents',
        items: [
          { label: 'Health insurance with international coverage', detail: 'Minimum coverage amounts vary by country' },
          { label: 'Clean criminal record certificate' },
          { label: 'Proof of accommodation', detail: 'Rental agreement or hotel booking for initial period' },
          { label: 'Application form and fee payment' },
        ],
      },
    ],
  },
  {
    id: 'family-reunification',
    title: 'Family Reunification',
    subtitle: 'Joining a spouse, partner, or family member already residing abroad',
    iconName: 'FileText',
    color: 'rose',
    badge: '',
    sections: [
      {
        title: "Sponsor's Documents",
        items: [
          { label: "Sponsor's residence permit or citizenship proof" },
          { label: "Sponsor's passport copy" },
          { label: "Sponsor's proof of income / payslips", detail: 'Must typically meet minimum income threshold' },
          { label: "Sponsor's tax assessment or employment letter" },
          { label: 'Proof of accommodation in destination country', detail: 'Rental contract or property ownership' },
        ],
      },
      {
        title: "Applicant's Documents",
        items: [
          { label: 'Valid passport' },
          { label: 'Passport-size photos' },
          { label: 'Birth certificate', detail: 'With certified translation' },
          { label: 'Marriage certificate', detail: 'For spousal / partner reunification; officially translated' },
          { label: 'Proof of genuine relationship', detail: 'Photos, correspondence history, joint accounts, joint leases' },
          { label: 'Civil partnership or cohabitation proof', detail: 'For unmarried partner applications' },
        ],
      },
      {
        title: 'Children',
        items: [
          { label: "Children's birth certificates" },
          { label: 'Custody or consent documents', detail: 'If one parent does not have custody' },
          { label: 'School enrollment or records', detail: 'If children are of school age' },
        ],
      },
      {
        title: 'Health & Background',
        items: [
          { label: 'Police clearance certificate' },
          { label: 'Medical examination results', detail: 'If required by destination country' },
          { label: 'Health insurance', detail: 'Until covered by national health system' },
        ],
      },
    ],
  },
  {
    id: 'investor-visa',
    title: 'Investor / Golden Visa',
    subtitle: 'Residence by investment programmes requiring significant capital commitment',
    iconName: 'TrendingUp',
    color: 'yellow',
    badge: '',
    sections: [
      {
        title: 'Identity & Personal Documents',
        items: [
          { label: 'Valid passport (all pages)' },
          { label: 'Birth certificate with translation' },
          { label: 'Marriage certificate (if applicable)' },
          { label: "Dependants' identity documents" },
        ],
      },
      {
        title: 'Proof of Investment',
        items: [
          { label: 'Investment confirmation documents', detail: 'Purchase agreements, fund subscription docs, or bank transfer receipts' },
          { label: 'Property purchase deed', detail: 'For real estate investment programmes (Portugal, Greece, UAE, etc.)' },
          { label: 'Fund or venture capital subscription', detail: 'Qualifying investment fund documentation' },
          { label: 'Business registration and share certificates', detail: 'For business creation investment routes' },
          { label: 'Proof funds originated legally', detail: 'Source of wealth declaration and supporting evidence' },
        ],
      },
      {
        title: 'Financial Documents',
        items: [
          { label: 'Bank statements (12 months)' },
          { label: 'Tax returns (2-3 years)', detail: 'From country of residence or origin' },
          { label: 'Accountant / auditor certification of net worth' },
          { label: 'No outstanding tax liabilities certificate' },
        ],
      },
      {
        title: 'Background & Due Diligence',
        items: [
          { label: 'Police clearance from all countries of residence (last 10 years)' },
          { label: 'Medical examination', detail: 'From an approved physician' },
          { label: 'Health insurance with full coverage' },
          { label: 'No bankruptcy or insolvency declaration' },
          { label: 'CV / biography of business background' },
        ],
      },
    ],
  },
];

export const checklistColorMap: Record<string, { bg: string; text: string; border: string; badge: string }> = {
  blue:   { bg: 'bg-blue-50',   text: 'text-blue-600',   border: 'border-blue-200',   badge: 'bg-blue-100 text-blue-700' },
  green:  { bg: 'bg-green-50',  text: 'text-green-600',  border: 'border-green-200',  badge: 'bg-green-100 text-green-700' },
  teal:   { bg: 'bg-teal-50',   text: 'text-teal-600',   border: 'border-teal-200',   badge: 'bg-teal-100 text-teal-700' },
  amber:  { bg: 'bg-amber-50',  text: 'text-amber-600',  border: 'border-amber-200',  badge: 'bg-amber-100 text-amber-700' },
  rose:   { bg: 'bg-rose-50',   text: 'text-rose-600',   border: 'border-rose-200',   badge: 'bg-rose-100 text-rose-700' },
  yellow: { bg: 'bg-yellow-50', text: 'text-yellow-700', border: 'border-yellow-200', badge: 'bg-yellow-100 text-yellow-800' },
};
