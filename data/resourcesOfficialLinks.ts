export const officialLinks: {
  country: string;
  slug: string;
  region: string;
  links: { label: string; url: string; type: string }[];
}[] = [
  {
    country: 'Argentina', slug: 'argentina', region: 'Latin America',
    links: [
      { label: 'Dirección Nacional de Migraciones', url: 'https://www.argentina.gob.ar/interior/migraciones', type: 'Immigration Authority' },
      { label: 'Online Visa Application (RADEX)', url: 'https://radex.migraciones.gov.ar', type: 'Application Portal' },
    ],
  },
  {
    country: 'Australia', slug: 'australia', region: 'Oceania',
    links: [
      { label: 'Department of Home Affairs', url: 'https://www.homeaffairs.gov.au/visas-subsite/pages/visas.aspx', type: 'Immigration Authority' },
      { label: 'ImmiAccount (Online Applications)', url: 'https://immi.homeaffairs.gov.au/help-support/departmental-forms/online-lodgement-system', type: 'Application Portal' },
      { label: 'Visa Finder Tool', url: 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-finder', type: 'Visa Finder' },
    ],
  },
  {
    country: 'Austria', slug: 'austria', region: 'Europe',
    links: [
      { label: 'Austrian Red-White-Red Card (BMI)', url: 'https://www.migration.gv.at/en/', type: 'Immigration Authority' },
      { label: 'AMS Employer Portal (Work Permits)', url: 'https://www.ams.at/arbeitsuchende/aus-dem-ausland-nach-oesterreich', type: 'Work Permits' },
    ],
  },
  {
    country: 'Belgium', slug: 'belgium', region: 'Europe',
    links: [
      { label: 'Immigration Office (Dienst Vreemdelingenzaken)', url: 'https://dofi.ibz.be/en', type: 'Immigration Authority' },
      { label: 'Visa Application (FPS Foreign Affairs)', url: 'https://diplomatie.belgium.be/en/travelling-to-belgium/visa-for-belgium', type: 'Visa Applications' },
    ],
  },
  {
    country: 'Brazil', slug: 'brazil', region: 'Latin America',
    links: [
      { label: 'Polícia Federal - Immigration', url: 'https://www.gov.br/pf/en/subjects/passport-and-immigration', type: 'Immigration Authority' },
      { label: 'Consular Visa Portal (SISCONSU)', url: 'https://scedv.serpro.gov.br', type: 'Application Portal' },
      { label: 'Ministry of Justice - SINCRE', url: 'https://www.gov.br/mj/pt-br/assuntos/seus-direitos/imigracao', type: 'Residence Permits' },
    ],
  },
  {
    country: 'Canada', slug: 'canada', region: 'North America',
    links: [
      { label: 'Immigration, Refugees & Citizenship Canada (IRCC)', url: 'https://www.canada.ca/en/immigration-refugees-citizenship.html', type: 'Immigration Authority' },
      { label: 'IRCC Online Application Portal', url: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/application.html', type: 'Application Portal' },
      { label: 'Express Entry Profile', url: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html', type: 'Skilled Immigration' },
      { label: 'Check Application Status', url: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/application/check-status.html', type: 'Status Check' },
    ],
  },
  {
    country: 'Chile', slug: 'chile', region: 'Latin America',
    links: [
      { label: 'Servicio Nacional de Migraciones (SERMIG)', url: 'https://www.migracioneschile.cl', type: 'Immigration Authority' },
      { label: 'Online Application Portal (UCHILE)', url: 'https://extranjeria.gob.cl', type: 'Application Portal' },
    ],
  },
  {
    country: 'China', slug: 'china', region: 'Asia',
    links: [
      { label: 'National Immigration Administration (NIA)', url: 'https://www.nia.gov.cn/n897453/index.html', type: 'Immigration Authority' },
      { label: 'Chinese Visa Application Service Center', url: 'https://www.visaforchina.cn', type: 'Application Portal' },
    ],
  },
  {
    country: 'Colombia', slug: 'colombia', region: 'Latin America',
    links: [
      { label: 'Migración Colombia', url: 'https://www.migracioncolombia.gov.co', type: 'Immigration Authority' },
      { label: 'Visa Online Application (Cancillería)', url: 'https://tramitesmre.cancilleria.gov.co/tramites/enlinea/solicitarVisa.xhtml', type: 'Application Portal' },
    ],
  },
  {
    country: 'Croatia', slug: 'croatia', region: 'Europe',
    links: [
      { label: 'Ministry of the Interior - Foreigners', url: 'https://mup.gov.hr/en/foreigners/aliens/230', type: 'Immigration Authority' },
      { label: 'E-Visa Application Portal', url: 'https://eviza.gov.hr', type: 'Application Portal' },
    ],
  },
  {
    country: 'Czech Republic', slug: 'czech-republic', region: 'Europe',
    links: [
      { label: 'Ministry of the Interior - Residence', url: 'https://www.mvcr.cz/mvcren/article/residence.aspx', type: 'Immigration Authority' },
      { label: 'Visa & Residence Portal (MZV)', url: 'https://www.mzv.gov.cz/jnp/en/information_for_aliens/index.html', type: 'Visa Information' },
    ],
  },
  {
    country: 'Denmark', slug: 'denmark', region: 'Europe',
    links: [
      { label: 'SIRI - Danish Agency for International Recruitment', url: 'https://www.siri.dk/english', type: 'Immigration Authority' },
      { label: 'New to Denmark (Ny i Danmark)', url: 'https://www.nyidanmark.dk/en-GB', type: 'Application Portal' },
    ],
  },
  {
    country: 'Egypt', slug: 'egypt', region: 'Africa',
    links: [
      { label: 'Ministry of Interior - Passports & Immigration', url: 'https://www.moiegypt.gov.eg', type: 'Immigration Authority' },
      { label: 'Egypt e-Visa Portal', url: 'https://www.visa2egypt.gov.eg', type: 'Application Portal' },
    ],
  },
  {
    country: 'Finland', slug: 'finland', region: 'Europe',
    links: [
      { label: 'Finnish Immigration Service (Migri)', url: 'https://migri.fi/en/frontpage', type: 'Immigration Authority' },
      { label: 'Enter Finland (Online Applications)', url: 'https://enterfinland.fi/AsioinntiAsiakas/faces/mainpage.xhtml', type: 'Application Portal' },
    ],
  },
  {
    country: 'France', slug: 'france', region: 'Europe',
    links: [
      { label: 'France-Visas (Official Visa Portal)', url: 'https://france-visas.gouv.fr/en_US/web/france-visas/', type: 'Application Portal' },
      { label: 'OFII (Office Français de l\'Immigration)', url: 'https://www.ofii.fr', type: 'Immigration Authority' },
      { label: 'Ministry of Interior - Foreigner Resources', url: 'https://www.interieur.gouv.fr/Immigration', type: 'Immigration Authority' },
    ],
  },
  {
    country: 'Germany', slug: 'germany', region: 'Europe',
    links: [
      { label: 'Federal Office for Migration & Refugees (BAMF)', url: 'https://www.bamf.de/EN/Themen/MigrationAufenthalt/migrationaufenthalt-node.html', type: 'Immigration Authority' },
      { label: 'Make it in Germany (Federal Portal)', url: 'https://www.make-it-in-germany.com/en/', type: 'Information Portal' },
      { label: 'German Missions Abroad (Visa Applications)', url: 'https://www.auswaertiges-amt.de/en/visa-service', type: 'Application Portal' },
    ],
  },
  {
    country: 'Greece', slug: 'greece', region: 'Europe',
    links: [
      { label: 'Ministry of Migration & Asylum', url: 'https://migration.gov.gr/en/', type: 'Immigration Authority' },
      { label: 'e-Permit (Online Residence Permits)', url: 'https://permits.migration.gov.gr', type: 'Application Portal' },
      { label: 'Visa Applications (Ministry of Foreign Affairs)', url: 'https://www.mfa.gr/en/visas/', type: 'Visa Applications' },
    ],
  },
  {
    country: 'Hungary', slug: 'hungary', region: 'Europe',
    links: [
      { label: 'National Directorate-General for Aliens Policing (OIF)', url: 'https://www.oif.gov.hu/en/', type: 'Immigration Authority' },
      { label: 'Enter Hungary (Online Applications)', url: 'https://enterhungary.gov.hu', type: 'Application Portal' },
    ],
  },
  {
    country: 'India', slug: 'india', region: 'Asia',
    links: [
      { label: 'Bureau of Immigration (MHA)', url: 'https://boi.gov.in', type: 'Immigration Authority' },
      { label: 'Indian e-Visa Portal', url: 'https://indianvisaonline.gov.in/evisa/tvoa.html', type: 'Application Portal' },
      { label: 'Foreigners Regional Registration Office (FRRO)', url: 'https://indianfrro.gov.in/eservices/home.jsp', type: 'Registration Portal' },
    ],
  },
  {
    country: 'Indonesia', slug: 'indonesia', region: 'Asia',
    links: [
      { label: 'Directorate General of Immigration', url: 'https://www.imigrasi.go.id', type: 'Immigration Authority' },
      { label: 'e-VOA / e-Visa Portal', url: 'https://evisa.imigrasi.go.id', type: 'Application Portal' },
      { label: 'Online Immigration Services (SIAK)', url: 'https://aplikasi.imigrasi.go.id', type: 'Residence Permits' },
    ],
  },
  {
    country: 'Ireland', slug: 'ireland', region: 'Europe',
    links: [
      { label: 'Irish Naturalisation & Immigration Service (INIS)', url: 'https://www.irishimmigration.ie', type: 'Immigration Authority' },
      { label: 'Visa Online Application System (AVATS)', url: 'https://www.visas.inis.gov.ie', type: 'Application Portal' },
      { label: 'My Ireland Stay (Registration)', url: 'https://www.burghquayregistrationoffice.inis.gov.ie', type: 'Registration' },
    ],
  },
  {
    country: 'Israel', slug: 'israel', region: 'Middle East',
    links: [
      { label: 'Population and Immigration Authority', url: 'https://www.gov.il/en/departments/population_and_immigration_authority', type: 'Immigration Authority' },
      { label: 'Visa Applications & Entry Permits', url: 'https://www.gov.il/en/service/request-for-an-entry-visa', type: 'Application Portal' },
    ],
  },
  {
    country: 'Italy', slug: 'italy', region: 'Europe',
    links: [
      { label: 'Ministry of Foreign Affairs - Visas', url: 'https://vistoperitalia.esteri.it/home/en', type: 'Application Portal' },
      { label: 'Sportello Unico Immigrazione (Residence Permits)', url: 'https://nullaostalavoro.interno.gov.it', type: 'Residence Permits' },
      { label: 'Polizia di Stato - Immigration', url: 'https://www.poliziadistato.it/articolo/191', type: 'Immigration Authority' },
    ],
  },
  {
    country: 'Japan', slug: 'japan', region: 'Asia',
    links: [
      { label: 'Immigration Services Agency of Japan', url: 'https://www.isa.go.jp/en/index.html', type: 'Immigration Authority' },
      { label: 'e-APP (Online Certificate of Eligibility)', url: 'https://e-app.isa.go.jp/portals/0/resources/lp/en/', type: 'Application Portal' },
      { label: 'MOFA - Visa Information', url: 'https://www.mofa.go.jp/j_info/visit/visa/index.html', type: 'Visa Information' },
    ],
  },
  {
    country: 'Malaysia', slug: 'malaysia', region: 'Asia',
    links: [
      { label: 'Immigration Department of Malaysia', url: 'https://www.imi.gov.my', type: 'Immigration Authority' },
      { label: 'eRELA (Online Residence Permits)', url: 'https://erela.imi.gov.my', type: 'Application Portal' },
      { label: 'DE Rantau Digital Nomad Pass', url: 'https://mdec.my/digital-economy-initiatives/for-the-people/de-rantau/', type: 'Digital Nomad' },
      { label: 'MM2H Programme', url: 'https://www.mm2h.gov.my', type: 'Retirement Programme' },
    ],
  },
  {
    country: 'Mexico', slug: 'mexico', region: 'Latin America',
    links: [
      { label: 'Instituto Nacional de Migración (INM)', url: 'https://www.gob.mx/inm', type: 'Immigration Authority' },
      { label: 'Tramites INM (Online Applications)', url: 'https://www.inm.gob.mx/tramites/publico/estancia.html', type: 'Application Portal' },
    ],
  },
  {
    country: 'Morocco', slug: 'morocco', region: 'Africa',
    links: [
      { label: 'Direction Generale de la Sûrete Nationale', url: 'https://www.dgsn.ma/visa/', type: 'Immigration Authority' },
      { label: 'Ministry of Foreign Affairs - Visas', url: 'https://www.diplomatie.ma/fr/formalites-administratives/visas/', type: 'Visa Information' },
    ],
  },
  {
    country: 'Netherlands', slug: 'netherlands', region: 'Europe',
    links: [
      { label: 'IND - Immigration and Naturalisation Service', url: 'https://ind.nl/en', type: 'Immigration Authority' },
      { label: 'IND Online Application Portal', url: 'https://ind.nl/en/apply-online', type: 'Application Portal' },
      { label: 'Check if you need a visa', url: 'https://www.netherlandsworldwide.nl/visas-and-permits', type: 'Visa Checker' },
    ],
  },
  {
    country: 'New Zealand', slug: 'new-zealand', region: 'Oceania',
    links: [
      { label: 'Immigration New Zealand', url: 'https://www.immigration.govt.nz', type: 'Immigration Authority' },
      { label: 'INZ Online Services (Visa Applications)', url: 'https://onlineservices.immigration.govt.nz', type: 'Application Portal' },
      { label: 'Expression of Interest (Skilled Migrant)', url: 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/visa-factsheet/skilled-migrant-category-resident-visa', type: 'Skilled Immigration' },
    ],
  },
  {
    country: 'Nigeria', slug: 'nigeria', region: 'Africa',
    links: [
      { label: 'Nigeria Immigration Service (NIS)', url: 'https://immigration.gov.ng', type: 'Immigration Authority' },
      { label: 'NIS e-Visa Portal', url: 'https://evisa.immigration.gov.ng', type: 'Application Portal' },
    ],
  },
  {
    country: 'Norway', slug: 'norway', region: 'Europe',
    links: [
      { label: 'Norwegian Directorate of Immigration (UDI)', url: 'https://www.udi.no/en/', type: 'Immigration Authority' },
      { label: 'UDI Application Portal', url: 'https://selfservice.udi.no', type: 'Application Portal' },
    ],
  },
  {
    country: 'Peru', slug: 'peru', region: 'Latin America',
    links: [
      { label: 'Superintendencia Nacional de Migraciones', url: 'https://www.migraciones.gob.pe', type: 'Immigration Authority' },
      { label: 'Virtual Procedures (Trámites Virtuales)', url: 'https://cel.migraciones.gob.pe/tramitesvirtuales/', type: 'Application Portal' },
    ],
  },
  {
    country: 'Philippines', slug: 'philippines', region: 'Asia',
    links: [
      { label: 'Bureau of Immigration Philippines', url: 'https://www.immigration.gov.ph', type: 'Immigration Authority' },
      { label: 'Philippine Retirement Authority (PRA)', url: 'https://pra.gov.ph', type: 'Retirement Programme' },
      { label: 'Board of Investments (BOI) - SIRV', url: 'https://www.boi.gov.ph', type: 'Investor Visa' },
    ],
  },
  {
    country: 'Poland', slug: 'poland', region: 'Europe',
    links: [
      { label: 'Office for Foreigners (Urz?d do Spraw Cudzoziemców)', url: 'https://www.gov.pl/web/udsc-en', type: 'Immigration Authority' },
      { label: 'e-Residence Permit Applications', url: 'https://www.gov.pl/web/udsc-en/residence-permit-applications', type: 'Application Portal' },
      { label: 'Poland Digital Nomad Visa (MZ)', url: 'https://www.gov.pl/web/mswia-en/digital-nomad-visa', type: 'Digital Nomad' },
    ],
  },
  {
    country: 'Portugal', slug: 'portugal', region: 'Europe',
    links: [
      { label: 'AIMA (Agency for Integration, Migrations & Asylum)', url: 'https://www.aima.gov.pt', type: 'Immigration Authority' },
      { label: 'SEF Online Services (Archive/Reference)', url: 'https://www.sef.pt/en/', type: 'Reference Portal' },
      { label: 'Portugal Visas (Ministry of Foreign Affairs)', url: 'https://vistos.mne.gov.pt', type: 'Application Portal' },
      { label: 'ARI - Golden Visa Portal', url: 'https://ari.sef.pt', type: 'Golden Visa' },
    ],
  },
  {
    country: 'Qatar', slug: 'qatar', region: 'Middle East',
    links: [
      { label: 'Qatar Ministry of Interior - e-Services', url: 'https://www.moi.gov.qa/en/services/Pages/residence.aspx', type: 'Immigration Authority' },
      { label: 'Qatar Visa Center', url: 'https://qatarvisacenter.com', type: 'Application Portal' },
      { label: 'Qatar Tourism e-Visa', url: 'https://www.discover.com.qa/plan/visas-entry-permits', type: 'Tourist Visa' },
    ],
  },
  {
    country: 'Romania', slug: 'romania', region: 'Europe',
    links: [
      { label: 'General Inspectorate for Immigration (IGI)', url: 'https://igi.mai.gov.ro/en/', type: 'Immigration Authority' },
      { label: 'e-Residence Portal', url: 'https://www.e-residence.ro', type: 'Application Portal' },
      { label: 'Romania Digital Nomad Visa (MAE)', url: 'https://www.mae.ro/en/node/2040', type: 'Digital Nomad' },
    ],
  },
  {
    country: 'Russia', slug: 'russia', region: 'Europe',
    links: [
      { label: 'Ministry of Internal Affairs - Migration', url: 'https://???.??/mvd/structure1/Glavnie_upravlenija/GUID', type: 'Immigration Authority' },
      { label: 'Consular Department - Visa Applications', url: 'https://visa.kdmid.ru', type: 'Application Portal' },
    ],
  },
  {
    country: 'Saudi Arabia', slug: 'saudi-arabia', region: 'Middle East',
    links: [
      { label: 'Saudi e-Visa Portal', url: 'https://visa.visitsaudi.com', type: 'Tourist e-Visa' },
      { label: 'Ministry of Human Resources - Work Visas', url: 'https://www.mol.gov.sa/en/', type: 'Work Permits' },
      { label: 'Saudi Premium Residency Center', url: 'https://www.prc.gov.sa/en/Pages/default.aspx', type: 'Premium Residency' },
      { label: 'Saudi MISA (Investment Authority)', url: 'https://misa.gov.sa/en/', type: 'Investor Visas' },
    ],
  },
  {
    country: 'Singapore', slug: 'singapore', region: 'Asia',
    links: [
      { label: 'Ministry of Manpower - Work Passes', url: 'https://www.mom.gov.sg/passes-and-permits', type: 'Work Permits' },
      { label: 'MOM EP Online Application', url: 'https://eservices.mom.gov.sg/ep-online/ep-online-main/login', type: 'Application Portal' },
      { label: 'Singapore ICA - Immigration', url: 'https://www.ica.gov.sg/enter-depart/entry_requirements/visa_requirements', type: 'Immigration Authority' },
      { label: 'Global Investor Programme (EDB)', url: 'https://www.edb.gov.sg/en/setting-up-in-singapore/global-investor-programme.html', type: 'Investor Programme' },
    ],
  },
  {
    country: 'South Africa', slug: 'south-africa', region: 'Africa',
    links: [
      { label: 'Department of Home Affairs - Visas', url: 'https://www.dha.gov.za/index.php/immigration-services/types-of-visas', type: 'Immigration Authority' },
      { label: 'eHome Affairs Portal', url: 'https://ehomeaffairs.dha.gov.za', type: 'Application Portal' },
      { label: 'VFS Global South Africa', url: 'https://visa.vfsglobal.com/one-pager/south-africa/', type: 'Visa Applications' },
    ],
  },
  {
    country: 'South Korea', slug: 'south-korea', region: 'Asia',
    links: [
      { label: 'Hi Korea (Immigration Portal)', url: 'https://www.hikorea.go.kr/Main.pt', type: 'Application Portal' },
      { label: 'Korea Immigration Service (KIS)', url: 'https://www.immigration.go.kr/immigration_eng/index.do', type: 'Immigration Authority' },
      { label: 'Korea Digital Nomad Visa (Workation)', url: 'https://www.hikorea.go.kr/info/InfoDetailR.pt?categoryId=&lang=en&catSeq=&cateGoryId=TBL_KR_CATG_0000000086', type: 'Digital Nomad' },
    ],
  },
  {
    country: 'Spain', slug: 'spain', region: 'Europe',
    links: [
      { label: 'Secretaría de Estado de Migraciones', url: 'https://www.inclusion.gob.es/web/migraciones/w/migraciones', type: 'Immigration Authority' },
      { label: 'Spanish Visa Application (MAE)', url: 'https://www.exteriores.gob.es/en/ServiciosAlCiudadano/Paginas/visas.aspx', type: 'Visa Applications' },
      { label: 'Digital Nomad Visa - Startups Act', url: 'https://www.inclusion.gob.es/web/migraciones/w/visa-para-trabajadores-de-caracter-internacional-nomadas-digitales-', type: 'Digital Nomad' },
    ],
  },
  {
    country: 'Sweden', slug: 'sweden', region: 'Europe',
    links: [
      { label: 'Swedish Migration Agency (Migrationsverket)', url: 'https://www.migrationsverket.se/English/Start-page.html', type: 'Immigration Authority' },
      { label: 'Migrationsverket Online Application', url: 'https://www.migrationsverket.se/English/Private-individuals/Apply-online.html', type: 'Application Portal' },
    ],
  },
  {
    country: 'Switzerland', slug: 'switzerland', region: 'Europe',
    links: [
      { label: 'State Secretariat for Migration (SEM)', url: 'https://www.sem.admin.ch/sem/en/home/themen/aufenthalt.html', type: 'Immigration Authority' },
      { label: 'Swiss Consular Services (visas)', url: 'https://www.eda.admin.ch/eda/en/home/entry-and-residence-in-switzerland.html', type: 'Visa Applications' },
    ],
  },
  {
    country: 'Thailand', slug: 'thailand', region: 'Asia',
    links: [
      { label: 'Thai Immigration Bureau', url: 'https://www.immigration.go.th', type: 'Immigration Authority' },
      { label: 'Thailand e-Visa', url: 'https://www.thaievisa.go.th', type: 'Application Portal' },
      { label: 'LTR Visa - BOI Thailand', url: 'https://ltr.boi.go.th', type: 'Long-Term Resident Visa' },
    ],
  },
  {
    country: 'Turkey', slug: 'turkey', region: 'Middle East',
    links: [
      { label: 'Directorate General of Migration Management', url: 'https://www.goc.gov.tr/en', type: 'Immigration Authority' },
      { label: 'Turkey e-Visa Portal', url: 'https://www.evisa.gov.tr/en/', type: 'Application Portal' },
      { label: 'Turkey Citizenship by Investment (TCA)', url: 'https://www.tcmb.gov.tr/wps/wcm/connect/en/tcmb+en/main+menu/publications/research/working+papers/2020/20-19', type: 'Investor Citizenship' },
    ],
  },
  {
    country: 'Ukraine', slug: 'ukraine', region: 'Europe',
    links: [
      { label: 'State Migration Service of Ukraine', url: 'https://dmsu.gov.ua/en/', type: 'Immigration Authority' },
      { label: 'Ukrainian e-Visa Portal', url: 'https://evisa.mfa.gov.ua', type: 'Application Portal' },
    ],
  },
  {
    country: 'United Arab Emirates', slug: 'united-arab-emirates', region: 'Middle East',
    links: [
      { label: 'Federal Authority for Identity & Citizenship (ICA)', url: 'https://www.ica.gov.ae/en/home', type: 'Immigration Authority' },
      { label: 'ICP Smart Services (Residence Permits)', url: 'https://smartservices.ica.gov.ae', type: 'Application Portal' },
      { label: 'Dubai Virtual Working Programme', url: 'https://www.dubai.com/en/living/travel-and-entry/remote-work-visa/', type: 'Remote Work Visa' },
      { label: 'UAE Golden Visa Portal', url: 'https://goldenvisa.gov.ae', type: 'Golden Visa' },
    ],
  },
  {
    country: 'United Kingdom', slug: 'united-kingdom', region: 'Europe',
    links: [
      { label: 'UK Visas & Immigration (UKVI)', url: 'https://www.gov.uk/government/organisations/uk-visas-and-immigration', type: 'Immigration Authority' },
      { label: 'Apply for a UK visa (GOV.UK)', url: 'https://www.gov.uk/apply-uk-visa', type: 'Application Portal' },
      { label: 'Check UK visa requirements', url: 'https://www.gov.uk/check-uk-visa', type: 'Visa Checker' },
      { label: 'Skilled Worker Visa', url: 'https://www.gov.uk/skilled-worker-visa', type: 'Work Visa' },
    ],
  },
  {
    country: 'United States', slug: 'united-states', region: 'North America',
    links: [
      { label: 'US Citizenship & Immigration Services (USCIS)', url: 'https://www.uscis.gov', type: 'Immigration Authority' },
      { label: 'US Department of State - Visas', url: 'https://travel.state.gov/content/travel/en/us-visas.html', type: 'Visa Applications' },
      { label: 'myUSCIS Online Account', url: 'https://my.uscis.gov', type: 'Application Portal' },
      { label: 'ESTA - Visa Waiver Program', url: 'https://esta.cbp.dhs.gov', type: 'Visa Waiver' },
    ],
  },
  {
    country: 'Vietnam', slug: 'vietnam', region: 'Asia',
    links: [
      { label: 'Immigration Department of Vietnam', url: 'https://xuatnhapcanh.gov.vn', type: 'Immigration Authority' },
      { label: 'Vietnam e-Visa Portal', url: 'https://evisa.xuatnhapcanh.gov.vn', type: 'Application Portal' },
    ],
  },
];

export const regionColors: Record<string, string> = {
  'Europe': 'bg-blue-50 text-blue-700 border-blue-200',
  'Asia': 'bg-amber-50 text-amber-700 border-amber-200',
  'Latin America': 'bg-green-50 text-green-700 border-green-200',
  'North America': 'bg-teal-50 text-teal-700 border-teal-200',
  'Oceania': 'bg-cyan-50 text-cyan-700 border-cyan-200',
  'Africa': 'bg-orange-50 text-orange-700 border-orange-200',
  'Middle East': 'bg-rose-50 text-rose-700 border-rose-200',
};

export const linkTypeColors: Record<string, string> = {
  'Immigration Authority': 'bg-slate-100 text-slate-700',
  'Application Portal': 'bg-teal-100 text-teal-700',
  'Work Permits': 'bg-blue-100 text-blue-700',
  'Visa Applications': 'bg-blue-100 text-blue-700',
  'Visa Information': 'bg-sky-100 text-sky-700',
  'Visa Checker': 'bg-cyan-100 text-cyan-700',
  'Skilled Immigration': 'bg-green-100 text-green-700',
  'Status Check': 'bg-gray-100 text-gray-700',
  'Digital Nomad': 'bg-teal-100 text-teal-800',
  'Retirement Programme': 'bg-amber-100 text-amber-700',
  'Investor Visa': 'bg-yellow-100 text-yellow-700',
  'Golden Visa': 'bg-yellow-100 text-yellow-800',
  'Tourist Visa': 'bg-orange-100 text-orange-700',
  'Tourist e-Visa': 'bg-orange-100 text-orange-700',
  'Registration': 'bg-gray-100 text-gray-700',
  'Registration Portal': 'bg-gray-100 text-gray-700',
  'Residence Permits': 'bg-teal-100 text-teal-700',
  'Investor Programme': 'bg-yellow-100 text-yellow-700',
  'Premium Residency': 'bg-yellow-100 text-yellow-800',
  'Investor Citizenship': 'bg-yellow-100 text-yellow-800',
  'Long-Term Resident Visa': 'bg-green-100 text-green-700',
  'Remote Work Visa': 'bg-teal-100 text-teal-800',
  'Reference Portal': 'bg-gray-100 text-gray-600',
  'Information Portal': 'bg-slate-100 text-slate-600',
  'Visa Waiver': 'bg-cyan-100 text-cyan-700',
  'Investor Visas': 'bg-yellow-100 text-yellow-700',
  'Work Visa': 'bg-blue-100 text-blue-700',
};

export const ALL_REGIONS = ['All Regions', 'Africa', 'Asia', 'Europe', 'Latin America', 'Middle East', 'North America', 'Oceania'];
