export interface StarterCountryGuide {
  overview: string;
  documentsRequired: string[];
  commonPathways: string[];
  importantNotes: string[];
}

export function generateStarterCountryGuide(
  countryName: string
): StarterCountryGuide {
  return {
    overview: `${countryName} offers various immigration pathways for individuals seeking to relocate for work, study, retirement, or investment purposes. Each pathway has specific eligibility criteria, documentation requirements, and processing procedures. Immigration policies can change, so it's essential to verify current requirements through official government channels.`,

    documentsRequired: [
      'Valid passport with sufficient validity (typically 6+ months)',
      'Completed visa application forms',
      'Recent passport-sized photographs',
      'Proof of financial means or income',
      'Criminal background check from country of residence',
      'Medical examination and health certificates',
      'Proof of health insurance coverage',
      'Accommodation proof or address in destination country',
      'Supporting documents specific to visa category (employment contract, admission letter, investment proof, etc.)',
      'Application fees and payment receipts',
    ],

    commonPathways: [
      'Employment-based residence permits for skilled workers',
      'Student visas for enrolled international students',
      'Digital nomad or remote work visas',
      'Retirement visas for those with passive income',
      'Investor or entrepreneur visas',
      'Family reunification for relatives of citizens or residents',
    ],

    importantNotes: [
      'Always verify current requirements through official government immigration websites',
      'Processing times can vary significantly based on visa type and application volume',
      'Some countries require documents to be translated, notarized, or apostilled',
      'Health insurance requirements vary by country and visa type',
      'Financial requirements differ by program and family size',
      'This is informational content only and does not constitute legal advice',
      'Consider consulting with immigration professionals for complex cases',
      'Maintain valid immigration status and comply with reporting requirements',
    ],
  };
}
