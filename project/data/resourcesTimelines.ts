export type TimelineEntry = {
  country: string;
  slug: string;
  region: string;
  visaTypes: {
    name: string;
    standard: string;
    expedited?: string;
    notes?: string;
    speed: 'fast' | 'moderate' | 'slow' | 'variable';
  }[];
};

export const timelines: TimelineEntry[] = [
  {
    country: 'Australia', slug: 'australia', region: 'Oceania',
    visaTypes: [
      { name: 'Skilled Independent (189)', standard: '6-12 months', expedited: 'N/A', notes: 'Invitation-based; depends on points score and invitation round', speed: 'slow' },
      { name: 'Employer Sponsored (482)', standard: '1-3 months', expedited: '2-4 weeks (priority)', notes: 'Faster if employer has standard business sponsor status', speed: 'moderate' },
      { name: 'Student Visa (500)', standard: '4-6 weeks', expedited: '1-3 weeks', notes: 'Apply at least 6 weeks before course start', speed: 'moderate' },
      { name: 'Partner Visa (820/801)', standard: '12-24 months', notes: 'Temporary grant issued first; permanent after 2 years', speed: 'slow' },
    ],
  },
  {
    country: 'Canada', slug: 'canada', region: 'North America',
    visaTypes: [
      { name: 'Express Entry (PR)', standard: '6 months', notes: 'From ITA to PR; IRCC target is 80% within 6 months', speed: 'moderate' },
      { name: 'Work Permit (Employer-specific)', standard: '6-8 weeks', expedited: '10 business days (PGWP/Global Talent)', speed: 'moderate' },
      { name: 'Study Permit', standard: '8-12 weeks', expedited: '3-5 weeks (SDS countries)', notes: 'Student Direct Stream available for select countries', speed: 'moderate' },
      { name: 'Visitor Visa (TRV)', standard: '2-4 weeks', notes: 'Biometrics may add processing time', speed: 'fast' },
      { name: 'Spousal Sponsorship (PR)', standard: '12 months', notes: 'Inland or outland; Service standard 12 months', speed: 'slow' },
    ],
  },
  {
    country: 'Germany', slug: 'germany', region: 'Europe',
    visaTypes: [
      { name: 'Skilled Worker Visa', standard: '1-3 months', notes: 'Appointment wait times at embassies can add 1-3 months', speed: 'moderate' },
      { name: 'Job Seeker Visa', standard: '2-4 weeks', notes: 'Valid 6 months; appointment availability varies', speed: 'fast' },
      { name: 'EU Blue Card', standard: '1-3 months', notes: 'After arrival; Auslanderbehorde appointment times vary by city', speed: 'moderate' },
      { name: 'Student Visa', standard: '4-8 weeks', notes: 'Apply early; embassy appointment slots often limited', speed: 'moderate' },
      { name: 'Settlement Permit (Niederlassungserlaubnis)', standard: '3-6 months', notes: 'Processed at local Auslanderbehorde after qualifying period', speed: 'slow' },
    ],
  },
  {
    country: 'United Kingdom', slug: 'united-kingdom', region: 'Europe',
    visaTypes: [
      { name: 'Skilled Worker Visa', standard: '3 weeks', expedited: '5 business days (priority)', notes: 'Applying from outside UK', speed: 'fast' },
      { name: 'Student Visa', standard: '3 weeks', expedited: '5 business days (priority)', speed: 'fast' },
      { name: 'Global Talent Visa', standard: '3-8 weeks', notes: 'Endorsement decision from relevant body is separate and additional', speed: 'moderate' },
      { name: 'Indefinite Leave to Remain', standard: '6 months', expedited: '5 business days (super priority)', notes: 'Super priority service available at significant extra cost', speed: 'slow' },
      { name: 'Spouse / Partner Visa', standard: '8-12 weeks', expedited: '30 working days (priority)', speed: 'moderate' },
    ],
  },
  {
    country: 'United States', slug: 'united-states', region: 'North America',
    visaTypes: [
      { name: 'H-1B (Specialty Occupation)', standard: '3-6 months', expedited: '15 business days (premium)', notes: 'Annual cap applies; lottery required in most years', speed: 'slow' },
      { name: 'L-1 (Intracompany Transfer)', standard: '2-3 months', expedited: '15 business days (premium)', speed: 'moderate' },
      { name: 'F-1 Student Visa', standard: '2-4 weeks (consular)', notes: 'SEVIS I-20 from school required first; consulate wait times vary widely', speed: 'variable' },
      { name: 'B-1/B-2 Visitor Visa', standard: '2-4 weeks', notes: 'Consulate interview wait times can be 6-12 months at busy posts', speed: 'variable' },
      { name: 'Green Card (EB-1/EB-2)', standard: '12-24+ months', notes: 'Priority date backlog applies to most nationalities; Indian/Chinese applicants face decade+ waits', speed: 'slow' },
    ],
  },
  {
    country: 'Portugal', slug: 'portugal', region: 'Europe',
    visaTypes: [
      { name: 'D7 Passive Income Visa', standard: '2-3 months', notes: 'Consulate appointment availability varies; AIMA appointment for residence permit after entry', speed: 'moderate' },
      { name: 'Digital Nomad Visa (D8)', standard: '2-3 months', notes: 'Similar to D7; appointment scarcity at some consulates', speed: 'moderate' },
      { name: 'Golden Visa (ARI)', standard: '3-6 months', notes: 'AIMA backlogs have historically caused delays of 12-18 months; improving in 2024-25', speed: 'slow' },
      { name: 'Student Visa (D4)', standard: '4-8 weeks', speed: 'moderate' },
      { name: 'Temporary Stay / Job Seeker', standard: '4-8 weeks', speed: 'moderate' },
    ],
  },
  {
    country: 'Spain', slug: 'spain', region: 'Europe',
    visaTypes: [
      { name: 'Non-Lucrative Visa', standard: '1-3 months', notes: 'Processing at Spanish consulate; appointment availability varies by location', speed: 'moderate' },
      { name: 'Digital Nomad Visa', standard: '1-2 months', notes: 'Introduced under Startups Act 2023; consulate processing varies', speed: 'moderate' },
      { name: 'Work Visa (cuenta ajena)', standard: '2-4 months', notes: 'Employer must initiate labour market test at SEPE', speed: 'slow' },
      { name: 'Student Visa', standard: '1-3 months', speed: 'moderate' },
      { name: 'Long-Term Residence', standard: '3-6 months', notes: 'Processed at local Extranjería office; wait times vary by region', speed: 'slow' },
    ],
  },
  {
    country: 'Netherlands', slug: 'netherlands', region: 'Europe',
    visaTypes: [
      { name: 'Highly Skilled Migrant', standard: '2-4 weeks', notes: 'IND target; employer must be recognised sponsor', speed: 'fast' },
      { name: 'Orientation Year (Zoekjaar)', standard: '2-4 weeks', speed: 'fast' },
      { name: 'Study Permit (MVV + Residence)', standard: '4-8 weeks', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '3-6 months', speed: 'slow' },
      { name: 'Family Reunification', standard: '3-6 months', notes: 'MVV required; IND processes after embassy approval', speed: 'slow' },
    ],
  },
  {
    country: 'Japan', slug: 'japan', region: 'Asia',
    visaTypes: [
      { name: 'Highly Skilled Professional (HSP)', standard: '1-3 months', notes: 'Points-based; Certificate of Eligibility (CoE) required first', speed: 'moderate' },
      { name: 'Work Visa (Engineer/Specialist)', standard: '1-3 months', notes: 'CoE from ISA typically 1-2 months; consular stamp 1-2 weeks', speed: 'moderate' },
      { name: 'Student Visa', standard: '1-2 months', notes: 'CoE issued by school/ISA first', speed: 'fast' },
      { name: 'Spouse of Japanese National', standard: '1-3 months', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '6-12 months', notes: 'ISA review; High Points system can reduce qualifying period to 1-3 years', speed: 'slow' },
    ],
  },
  {
    country: 'Singapore', slug: 'singapore', region: 'Asia',
    visaTypes: [
      { name: 'Employment Pass (EP)', standard: '3-8 weeks', notes: 'MOM online application; COMPASS points system since 2023', speed: 'fast' },
      { name: 'S Pass', standard: '3-8 weeks', speed: 'fast' },
      { name: 'EntrePass', standard: '4-8 weeks', notes: 'For entrepreneurs; requires evaluation by MOM', speed: 'moderate' },
      { name: 'Personalised Employment Pass', standard: '8-12 weeks', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '4-6 months', notes: 'ICA approval; no guarantee; typically requires 6+ months on EP/S Pass first', speed: 'slow' },
    ],
  },
  {
    country: 'United Arab Emirates', slug: 'united-arab-emirates', region: 'Middle East',
    visaTypes: [
      { name: 'Golden Visa (10-year)', standard: '2-4 weeks', notes: 'Via ICA or relevant emirate authority; fast after eligibility confirmed', speed: 'fast' },
      { name: 'Employment Visa', standard: '1-2 weeks', notes: 'Employer handles most steps; medical + Emirates ID after entry', speed: 'fast' },
      { name: 'Freelance / Remote Work Visa', standard: '2-4 weeks', speed: 'fast' },
      { name: 'Student Visa', standard: '1-2 weeks', speed: 'fast' },
      { name: 'Retirement Visa (5-year)', standard: '2-4 weeks', speed: 'fast' },
    ],
  },
  {
    country: 'Thailand', slug: 'thailand', region: 'Asia',
    visaTypes: [
      { name: 'Long-Term Resident (LTR)', standard: '4-8 weeks', notes: 'BOI-administered; one of the faster premium residency programmes in Asia', speed: 'moderate' },
      { name: 'Thailand Elite Visa', standard: '1-3 months', notes: 'Fee-based membership programme', speed: 'moderate' },
      { name: 'Non-B Work Visa', standard: '1-3 months', notes: 'Work permit must be obtained separately after entry', speed: 'moderate' },
      { name: 'Non-O Retirement Visa', standard: '2-4 weeks', notes: 'Annual renewal required; proof of funds or pension required', speed: 'fast' },
      { name: 'Education Visa (Non-ED)', standard: '2-4 weeks', speed: 'fast' },
    ],
  },
  {
    country: 'Ireland', slug: 'ireland', region: 'Europe',
    visaTypes: [
      { name: 'Critical Skills Employment Permit', standard: '1 month', notes: 'DETE target 1 month; employer-led', speed: 'fast' },
      { name: 'General Employment Permit', standard: '2-4 months', notes: 'LMT required; slower than Critical Skills', speed: 'slow' },
      { name: 'Student Visa', standard: '4-8 weeks', speed: 'moderate' },
      { name: 'Stamp 4 (Permanent Residence)', standard: '3-6 months', speed: 'slow' },
      { name: 'Join Family Visa', standard: '6-12 months', notes: 'Family reunification backlogs have been significant', speed: 'slow' },
    ],
  },
  {
    country: 'New Zealand', slug: 'new-zealand', region: 'Oceania',
    visaTypes: [
      { name: 'Skilled Migrant Category (SMC)', standard: '12-18 months', notes: 'Points-based; ballot system paused and restarted in recent years', speed: 'slow' },
      { name: 'Accredited Employer Work Visa (AEWV)', standard: '4-8 weeks', notes: 'Employer must be accredited with INZ', speed: 'moderate' },
      { name: 'Student Visa', standard: '4-6 weeks', speed: 'moderate' },
      { name: 'Visitor Visa', standard: '2-3 weeks', speed: 'fast' },
      { name: 'Partner of NZ Citizen/Resident', standard: '6-12 months', speed: 'slow' },
    ],
  },
  {
    country: 'France', slug: 'france', region: 'Europe',
    visaTypes: [
      { name: 'Talent Passport (Passeport Talent)', standard: '1-3 months', notes: 'Multiple sub-categories; consulate processing varies', speed: 'moderate' },
      { name: 'Work Visa (salarie)', standard: '2-4 months', notes: 'Employer must obtain work authorisation from DREETS first', speed: 'slow' },
      { name: 'Student Visa (VLS-TS Étudiant)', standard: '4-8 weeks', notes: 'Campus France procedure required for most non-EU nationals', speed: 'moderate' },
      { name: 'Visitor Long-Stay Visa', standard: '4-8 weeks', speed: 'moderate' },
      { name: 'Permanent Residence (CR-10)', standard: '6-12 months', notes: 'Prefecture processing varies significantly by location', speed: 'slow' },
    ],
  },
  {
    country: 'Italy', slug: 'italy', region: 'Europe',
    visaTypes: [
      { name: 'Digital Nomad / Self-Employment Visa', standard: '60-90 days', notes: 'Consulate processing; quota system (decreto flussi) applies to some categories', speed: 'moderate' },
      { name: 'Work Visa (decreto flussi)', standard: '3-6 months', notes: 'Annual quota releases cause major delays; appointment backlogs common', speed: 'slow' },
      { name: 'Student Visa', standard: '30-60 days', speed: 'moderate' },
      { name: 'Elective Residence Visa', standard: '30-60 days', notes: 'No work permitted; for those with passive income', speed: 'moderate' },
      { name: 'Long-Term EU Residence Permit', standard: '6-12 months', notes: 'Questura processing; notorious backlogs in major cities', speed: 'slow' },
    ],
  },
  {
    country: 'Brazil', slug: 'brazil', region: 'Latin America',
    visaTypes: [
      { name: 'VITEM V (Work Visa)', standard: '2-4 weeks', notes: 'Consulate processing once documents submitted', speed: 'fast' },
      { name: 'VITEM IV (Investor/Business)', standard: '4-8 weeks', speed: 'moderate' },
      { name: 'Student Visa', standard: '2-4 weeks', speed: 'fast' },
      { name: 'Permanent Residence (CRNM)', standard: '6-12 months', notes: 'Federal Police processing after visa entry', speed: 'slow' },
      { name: 'Digital Nomad Visa (VITEM I)', standard: '4-6 weeks', notes: 'Introduced 2022; consulate processing', speed: 'moderate' },
    ],
  },
  {
    country: 'Mexico', slug: 'mexico', region: 'Latin America',
    visaTypes: [
      { name: 'Temporary Resident Visa', standard: '4-8 weeks', notes: 'Consulate issues visa; then INM processes residence card after entry (30 days)', speed: 'moderate' },
      { name: 'Permanent Resident Visa', standard: '4-8 weeks', notes: 'Criteria: 4+ years temporary, or financial threshold', speed: 'moderate' },
      { name: 'Work Visa (FM3 equivalent)', standard: '4-8 weeks', notes: 'Employer or individual sponsorship; INM processes locally', speed: 'moderate' },
      { name: 'Student Visa', standard: '2-4 weeks', speed: 'fast' },
    ],
  },
  {
    country: 'South Korea', slug: 'south-korea', region: 'Asia',
    visaTypes: [
      { name: 'E-7 Specific Activities (Work)', standard: '1-2 months', notes: 'Requires employer sponsorship and ministry confirmation', speed: 'fast' },
      { name: 'D-8 Corporate Investment', standard: '2-4 weeks', speed: 'fast' },
      { name: 'D-2 Student', standard: '2-4 weeks', speed: 'fast' },
      { name: 'F-2 Residence', standard: '2-4 weeks', notes: 'For those with qualifying status; points-based scoring system', speed: 'fast' },
      { name: 'F-5 Permanent Residence', standard: '3-6 months', notes: 'Requires 5+ years in Korea plus points; immigration office processing', speed: 'slow' },
    ],
  },
  {
    country: 'India', slug: 'india', region: 'Asia',
    visaTypes: [
      { name: 'Employment Visa (E Visa)', standard: '2-4 weeks', notes: 'For foreign nationals earning above USD 25,000/year; BLS/VFS application centres', speed: 'fast' },
      { name: 'Business Visa', standard: '1-3 weeks', speed: 'fast' },
      { name: 'Student Visa (S Visa)', standard: '2-4 weeks', speed: 'fast' },
      { name: 'Research Visa', standard: '3-6 weeks', speed: 'moderate' },
      { name: 'OCI Card (Overseas Citizen)', standard: '3-6 months', notes: 'Consulate + BLS processing; OCI is a lifelong status once issued', speed: 'slow' },
    ],
  },
  {
    country: 'Switzerland', slug: 'switzerland', region: 'Europe',
    visaTypes: [
      { name: 'L Permit (Short-term Residence)', standard: '4-8 weeks', notes: 'Cantonal migration office processes; employer must demonstrate no suitable EU/EFTA candidate', speed: 'moderate' },
      { name: 'B Permit (Annual Residence)', standard: '4-8 weeks', notes: 'Quota system for non-EU/EFTA nationals; cantonal approval required', speed: 'moderate' },
      { name: 'C Permit (Settlement)', standard: '3-6 months', notes: 'After 5-10 years on B permit depending on nationality', speed: 'slow' },
      { name: 'Student Visa', standard: '4-8 weeks', notes: 'Cantonal processing; language proficiency may be required', speed: 'moderate' },
      { name: 'Long-stay Visa (D Visa)', standard: '4-8 weeks', notes: 'For stays over 90 days; processed at Swiss embassy', speed: 'moderate' },
    ],
  },
  {
    country: 'Sweden', slug: 'sweden', region: 'Europe',
    visaTypes: [
      { name: 'Work Permit', standard: '2-6 months', notes: 'Migrationsverket processing; employer must advertise role in EU/EEA first for 10 days', speed: 'moderate' },
      { name: 'EU Blue Card', standard: '2-4 months', notes: 'High-salary threshold required; faster in practice than regular work permit', speed: 'moderate' },
      { name: 'Student Residence Permit', standard: '4-8 weeks', notes: 'Apply via Migrationsverket; biometrics required for non-EU nationals', speed: 'moderate' },
      { name: 'Permanent Residence Permit', standard: '3-12 months', notes: 'Requires 4 years on valid permit; Migrationsverket processing times vary', speed: 'slow' },
      { name: 'Self-Employment Permit', standard: '3-6 months', notes: 'Must demonstrate viable business; Migrationsverket assessment', speed: 'slow' },
    ],
  },
  {
    country: 'Norway', slug: 'norway', region: 'Europe',
    visaTypes: [
      { name: 'Skilled Worker Permit', standard: '2-4 months', notes: 'UDI processing; employer sponsorship required; labour market test may apply', speed: 'moderate' },
      { name: 'Student Residence Permit', standard: '4-8 weeks', notes: 'UDI application; letter of admission required', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '3-6 months', notes: 'After 3 years on work permit; Norwegian language requirement (A2)', speed: 'slow' },
      { name: 'Independent Contractor Permit', standard: '3-6 months', notes: 'Self-employed must document sufficient income and qualifications', speed: 'slow' },
      { name: 'Family Immigration Permit', standard: '3-9 months', notes: 'Income requirement on sponsor; UDI processing', speed: 'slow' },
    ],
  },
  {
    country: 'Denmark', slug: 'denmark', region: 'Europe',
    visaTypes: [
      { name: 'Pay Limit Scheme', standard: '1-2 months', notes: 'Fast-track for high earners (DKK 448,000+ annually); SIRI processing', speed: 'fast' },
      { name: 'Positive List (Shortage Occupations)', standard: '1-2 months', notes: 'SIRI fast-track; employer sponsors', speed: 'fast' },
      { name: 'Work Permit (Standard)', standard: '2-4 months', notes: 'SIRI processing; labour market test required for most categories', speed: 'moderate' },
      { name: 'Student Visa', standard: '4-8 weeks', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '3-6 months', notes: 'After 8 years ordinarily; 4 years for fast-track; Danish language test required', speed: 'slow' },
    ],
  },
  {
    country: 'Poland', slug: 'poland', region: 'Europe',
    visaTypes: [
      { name: 'Work Visa (Type D)', standard: '1-3 months', notes: 'Employer obtains work permit (zezwolenie) first; consulate then issues visa; backlogs at some embassies', speed: 'moderate' },
      { name: 'Temporary Residence Permit', standard: '3-12 months', notes: 'Voivodeship office processing; notorious backlogs in Warsaw and other major cities', speed: 'slow' },
      { name: 'EU Blue Card', standard: '2-6 months', notes: 'High-salary threshold; voivodeship office', speed: 'moderate' },
      { name: 'Student Visa', standard: '2-4 weeks', speed: 'fast' },
      { name: 'Permanent Residence', standard: '6-12 months', notes: 'After 5 years legal stay; voivodeship office review', speed: 'slow' },
    ],
  },
  {
    country: 'Austria', slug: 'austria', region: 'Europe',
    visaTypes: [
      { name: 'Red-White-Red Card (Skilled Worker)', standard: '4-8 weeks', notes: 'Points-based; AMS labour market test; BFA (immigration authority) processing', speed: 'moderate' },
      { name: 'EU Blue Card', standard: '4-8 weeks', notes: 'Salary must exceed threshold; BFA processing', speed: 'moderate' },
      { name: 'Student Visa (C/D)', standard: '4-8 weeks', notes: 'Austrian consulate or embassy; university admission required', speed: 'moderate' },
      { name: 'Long-Stay Visa (D)', standard: '4-8 weeks', notes: 'For stays over 6 months; processed at Austrian representation', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '3-6 months', notes: 'After 5 years; A2 German language and civic integration exam required', speed: 'slow' },
    ],
  },
  {
    country: 'Belgium', slug: 'belgium', region: 'Europe',
    visaTypes: [
      { name: 'Single Permit (Travail/Arbeid)', standard: '3-5 months', notes: 'Combined work and residence permit; processed by regional employment authorities + CGVS', speed: 'slow' },
      { name: 'EU Blue Card', standard: '3-5 months', notes: 'Salary-based; processed by SPF Employment and CGVS', speed: 'slow' },
      { name: 'Student Visa (Type D)', standard: '1-3 months', notes: 'Belgian embassy processing; enrolment confirmation required', speed: 'moderate' },
      { name: 'Professional Card (Self-Employment)', standard: '3-6 months', notes: 'Processed by regional authorities; business viability assessed', speed: 'slow' },
      { name: 'Unlimited Residence', standard: '6-12 months', notes: 'After 5 years legal stay; commune registration required', speed: 'slow' },
    ],
  },
  {
    country: 'Czech Republic', slug: 'czech-republic', region: 'Europe',
    visaTypes: [
      { name: 'Employee Card', standard: '2-4 months', notes: 'Combined work and residence; Czech embassy abroad, then MOI in CZ; quotas apply for some nationalities', speed: 'slow' },
      { name: 'EU Blue Card', standard: '2-4 months', notes: 'University degree + salary above 1.5x average; MOI processing', speed: 'moderate' },
      { name: 'Student Visa (Long-Stay)', standard: '4-8 weeks', notes: 'Czech embassy processes; enrollment required', speed: 'moderate' },
      { name: 'Business/Trade License Visa', standard: '3-6 months', notes: 'Trade license (zivnostenske opravneni) required first', speed: 'slow' },
      { name: 'Permanent Residence', standard: '6-12 months', notes: 'After 5 years; A1 Czech language exam required', speed: 'slow' },
    ],
  },
  {
    country: 'Hungary', slug: 'hungary', region: 'Europe',
    visaTypes: [
      { name: 'Guest Worker Visa', standard: '2-4 weeks', notes: 'Fast bilateral scheme for certain nationalities; employer handles application', speed: 'fast' },
      { name: 'White Card (Digital Nomad)', standard: '3-5 weeks', notes: 'For remote workers earning above EUR 3,000/month; introduced 2022', speed: 'fast' },
      { name: 'Single Permit (Work + Residence)', standard: '2-4 months', notes: 'Employer-initiated; NDO processing', speed: 'moderate' },
      { name: 'Student Residence Permit', standard: '4-8 weeks', notes: 'Applies after entry on national D visa', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '3-6 months', notes: 'After 3 years; basic Hungarian language skills assessed', speed: 'slow' },
    ],
  },
  {
    country: 'Turkey', slug: 'turkey', region: 'Middle East',
    visaTypes: [
      { name: 'Work Permit', standard: '1-3 months', notes: 'Ministry of Labour processes; employer must have min 5 Turkish employees per 1 foreign worker', speed: 'moderate' },
      { name: 'Short-Term Residence Permit', standard: '2-4 weeks', notes: 'Applied online or at PDMM; covers tourism, study prep, property ownership', speed: 'fast' },
      { name: 'Long-Term Residence Permit', standard: '2-4 months', notes: 'After 8 years continuous legal stay; indefinite once granted', speed: 'moderate' },
      { name: 'Student Residence Permit', standard: '2-4 weeks', notes: 'University acceptance required; PDMM processes', speed: 'fast' },
      { name: 'Turkish Citizenship by Investment', standard: '3-6 months', notes: 'USD 400,000 real estate or USD 500,000 bank deposit; Presidency processes', speed: 'moderate' },
    ],
  },
  {
    country: 'Malaysia', slug: 'malaysia', region: 'Asia',
    visaTypes: [
      { name: 'Employment Pass (EP)', standard: '4-8 weeks', notes: 'Expatriate Services Division (ESD) processing; three categories by salary', speed: 'moderate' },
      { name: 'Malaysia My Second Home (MM2H)', standard: '3-6 months', notes: 'Restructured in 2021 with stricter financial requirements; Ministry of Tourism processes', speed: 'slow' },
      { name: 'DE Rantau (Digital Nomad)', standard: '4-8 weeks', notes: 'Malaysia Digital Economy Corp (MDEC) programme; for remote workers', speed: 'moderate' },
      { name: 'Student Pass', standard: '4-6 weeks', notes: 'EMGS handles medical screening and pass; 2-stage process', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '12-24 months', notes: 'JPN processing; very limited approvals; often longer than stated', speed: 'slow' },
    ],
  },
  {
    country: 'Indonesia', slug: 'indonesia', region: 'Asia',
    visaTypes: [
      { name: 'KITAS (Temporary Stay Permit)', standard: '1-2 months', notes: 'Employer-sponsored; Ministry of Manpower approval + Directorate General of Immigration processing', speed: 'moderate' },
      { name: 'Retirement KITAS', standard: '4-8 weeks', notes: 'For those 55+; social visa basis; approved by immigration office', speed: 'moderate' },
      { name: 'Investor KITAS', standard: '1-2 months', notes: 'BKPM/OSS facilitation for investors; minimum investment required', speed: 'moderate' },
      { name: 'Student VITAS', standard: '4-6 weeks', notes: 'Sponsor letter from educational institution required; embassy issues visa', speed: 'moderate' },
      { name: 'KITAP (Permanent Stay Permit)', standard: '2-4 months', notes: 'After 5 years on KITAS; immigration directorate general approval', speed: 'slow' },
    ],
  },
  {
    country: 'Philippines', slug: 'philippines', region: 'Asia',
    visaTypes: [
      { name: 'Special Work Permit (SWP)', standard: '2-4 weeks', notes: 'BI processing; short-term work authorization for specific projects', speed: 'fast' },
      { name: 'Alien Employment Permit (AEP)', standard: '2-4 weeks', notes: 'DOLE issues; required before obtaining work visa', speed: 'fast' },
      { name: 'SRRV (Special Resident Retiree Visa)', standard: '1-2 months', notes: 'PRA-administered; minimum age 35; financial requirements apply', speed: 'fast' },
      { name: '9(g) Pre-arranged Employment Visa', standard: '1-3 months', notes: 'BI processing after DOLE AEP; employer sponsorship', speed: 'moderate' },
      { name: 'Permanent Resident Visa', standard: '6-12 months', notes: 'BI processing; limited pathways for non-quota immigrants', speed: 'slow' },
    ],
  },
  {
    country: 'Vietnam', slug: 'vietnam', region: 'Asia',
    visaTypes: [
      { name: 'Work Permit', standard: '2-4 weeks', notes: 'DOLISA issues; employer must prove no suitable Vietnamese candidate; 2-year validity', speed: 'fast' },
      { name: 'Temporary Residence Card (TRC)', standard: '4-8 weeks', notes: 'Immigration Department; obtained after entry with work permit; 2-year validity', speed: 'moderate' },
      { name: 'Business Visa (DN)', standard: '3-5 business days', notes: 'E-visa or approval letter system; fast for short stays', speed: 'fast' },
      { name: 'Student Visa (DH)', standard: '1-2 weeks', notes: 'Approval letter from school required; embassy issues visa', speed: 'fast' },
      { name: 'Investor/Business TRC', standard: '4-8 weeks', notes: 'For those with investment certificate or business registration', speed: 'moderate' },
    ],
  },
  {
    country: 'South Africa', slug: 'south-africa', region: 'Africa',
    visaTypes: [
      { name: 'Critical Skills Work Visa', standard: '4-8 weeks', notes: 'DHA processing; occupation must be on critical skills list; significant delays common', speed: 'moderate' },
      { name: 'General Work Visa', standard: '3-6 months', notes: 'LMTD required; DHA notorious for backlogs; practical timeline often 6-12 months', speed: 'slow' },
      { name: 'Study Visa', standard: '4-8 weeks', notes: 'DHA processes; acceptance from SA institution required', speed: 'moderate' },
      { name: 'Retirement Visa', standard: '4-8 weeks', notes: 'ZAR 37,000/month pension/income required; DHA processing', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '2-4 years', notes: 'DHA severely backlogged; 5-year PR process often takes much longer in practice', speed: 'slow' },
    ],
  },
  {
    country: 'Nigeria', slug: 'nigeria', region: 'Africa',
    visaTypes: [
      { name: 'Subject to Regularisation (STR) Visa', standard: '4-8 weeks', notes: 'Employer applies for expatriate quota first; NIS processing after entry', speed: 'moderate' },
      { name: 'Combined Expatriate Residence Permit and Aliens Card (CERPAC)', standard: '2-4 months', notes: 'NIS issues; renewable annually; employer must hold valid expatriate quota', speed: 'slow' },
      { name: 'Business Visa', standard: '1-2 weeks', notes: 'Nigerian embassy abroad; letter of invitation from Nigerian entity required', speed: 'fast' },
      { name: 'Student Visa', standard: '2-4 weeks', notes: 'Acceptance from Nigerian institution required; embassy processing', speed: 'fast' },
      { name: 'Permanent Residence', standard: '12-24 months', notes: 'Very limited; NIS discretionary approval; rare for non-citizens', speed: 'slow' },
    ],
  },
  {
    country: 'Egypt', slug: 'egypt', region: 'Africa',
    visaTypes: [
      { name: 'Work Permit', standard: '1-3 months', notes: 'Ministry of Manpower issues; employer must show preference given to Egyptian workers', speed: 'moderate' },
      { name: 'Residence Visa (Annual)', standard: '2-4 weeks', notes: 'Interior Ministry processes; linked to work contract or investment', speed: 'fast' },
      { name: 'Investor Visa', standard: '1-2 months', notes: 'GAFI facilitates; investment threshold applies', speed: 'moderate' },
      { name: 'Student Visa', standard: '2-4 weeks', notes: 'University acceptance required; embassy or Interior Ministry processes', speed: 'fast' },
      { name: 'Permanent Residency', standard: '3-6 months', notes: 'After 5+ years or via investment/property purchase pathway', speed: 'slow' },
    ],
  },
  {
    country: 'Morocco', slug: 'morocco', region: 'Africa',
    visaTypes: [
      { name: 'Work Permit', standard: '1-3 months', notes: 'ANAPEC labour market test required; Ministry of Labour approval', speed: 'moderate' },
      { name: 'Residence Card (Carte de Sejour)', standard: '1-3 months', notes: 'Prefecture processes after entry; required for stays over 3 months', speed: 'moderate' },
      { name: 'Business/Investor Visa', standard: '4-8 weeks', notes: 'Investment through AMDI; consulate issues long-stay visa', speed: 'moderate' },
      { name: 'Student Visa', standard: '2-4 weeks', notes: 'Consulate processing; university acceptance required', speed: 'fast' },
      { name: 'Long-Stay Residence Permit', standard: '2-4 months', notes: 'Renewable annually; prefecture discretion', speed: 'moderate' },
    ],
  },
  {
    country: 'Argentina', slug: 'argentina', region: 'Latin America',
    visaTypes: [
      { name: 'Temporary Residence (work)', standard: '2-4 months', notes: 'DNM (Direccion Nacional de Migraciones) processing; apostilled documents required', speed: 'moderate' },
      { name: 'Rentista/Pensionado Visa', standard: '2-4 months', notes: 'Proof of passive income; notarised documents; DNM review', speed: 'moderate' },
      { name: 'Digital Nomad Visa', standard: '4-8 weeks', notes: 'Introduced 2022; Ministry of Interior processes', speed: 'moderate' },
      { name: 'Student Visa', standard: '4-8 weeks', notes: 'University acceptance required; DNM processes', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '2-4 months', notes: 'After 2 years temporary residence; DNM processing', speed: 'moderate' },
    ],
  },
  {
    country: 'Colombia', slug: 'colombia', region: 'Latin America',
    visaTypes: [
      { name: 'Migrant Visa (M) - Work', standard: '4-8 weeks', notes: 'Cancilleria processes online; employer-sponsored or self-employed categories', speed: 'moderate' },
      { name: 'Migrant Visa (M) - Pensioner', standard: '4-8 weeks', notes: 'Proof of min USD 750/month pension; Cancilleria online portal', speed: 'moderate' },
      { name: 'Digital Nomad Visa', standard: '4-8 weeks', notes: 'Part of Migrant (M) category; online processing via Cancilleria', speed: 'moderate' },
      { name: 'Student Visa', standard: '2-4 weeks', speed: 'fast' },
      { name: 'Resident Visa (R)', standard: '2-4 months', notes: 'After 5 years Migrant visa or via investment/marriage/ancestry', speed: 'moderate' },
    ],
  },
  {
    country: 'Chile', slug: 'chile', region: 'Latin America',
    visaTypes: [
      { name: 'Temporary Residence Visa', standard: '2-3 months', notes: 'PDI (immigration police) processes; Extranjeria handles online applications', speed: 'moderate' },
      { name: 'Work Visa', standard: '2-3 months', notes: 'Employer or self-employed; DEM (Departamento de Extranjeria) processes', speed: 'moderate' },
      { name: 'Digital Nomad Visa', standard: '4-6 weeks', notes: 'Launched 2023; Extranjeria online portal; income threshold applies', speed: 'moderate' },
      { name: 'Student Visa', standard: '4-8 weeks', notes: 'Consulate issues; DEM processes residence after entry', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '2-4 months', notes: 'After 1 year temporary residence; DEM processes', speed: 'moderate' },
    ],
  },
  {
    country: 'Peru', slug: 'peru', region: 'Latin America',
    visaTypes: [
      { name: 'Work Visa (Calidad Migratoria Designada)', standard: '1-3 months', notes: 'Ministry of Foreign Affairs + Migraciones; employer-sponsored', speed: 'moderate' },
      { name: 'Investor Visa', standard: '1-3 months', notes: 'Min USD 30,000 investment in Peruvian company; Migraciones processes', speed: 'moderate' },
      { name: 'Resident Visa (Residente)', standard: '2-4 months', notes: 'After one-year stay on temporary visa; biometrics required', speed: 'moderate' },
      { name: 'Student Visa', standard: '4-8 weeks', notes: 'Consulate processes; institution acceptance required', speed: 'moderate' },
      { name: 'Permanent Residence', standard: '3-6 months', notes: 'After 3 years as resident; Migraciones discretionary approval', speed: 'slow' },
    ],
  },
];

export const speedConfig = {
  fast:     { label: 'Fast',     color: 'bg-green-100 text-green-700',  dot: 'bg-green-500'  },
  moderate: { label: 'Moderate', color: 'bg-amber-100 text-amber-700',  dot: 'bg-amber-500'  },
  slow:     { label: 'Slow',     color: 'bg-red-100 text-red-700',      dot: 'bg-red-500'    },
  variable: { label: 'Variable', color: 'bg-gray-100 text-gray-600',    dot: 'bg-gray-400'   },
};

export const TIMELINE_REGIONS = ['All Regions', 'Africa', 'Asia', 'Europe', 'Latin America', 'Middle East', 'North America', 'Oceania'];
