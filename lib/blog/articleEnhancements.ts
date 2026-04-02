export type ArticleType =
  | 'country-guide'
  | 'comparison'
  | 'cost'
  | 'pathway-explainer'
  | 'visa-explainer'
  | 'relocation-guide'
  | 'news-policy'
  | 'general';

export function detectArticleType(
  slug: string,
  title: string,
  category: string,
  tags: string[]
): ArticleType {
  const text = `${slug} ${title} ${category} ${tags.join(' ')}`.toLowerCase();

  if (
    text.includes('cost') ||
    text.includes('fee') ||
    text.includes('price') ||
    text.includes('budget') ||
    text.includes('expensive') ||
    text.includes('cheap')
  ) {
    return 'cost';
  }

  if (
    text.includes('vs') ||
    text.includes('versus') ||
    text.includes('compare') ||
    text.includes('comparison') ||
    text.includes('best country') ||
    text.includes('easiest country') ||
    text.includes('top country') ||
    text.includes('easiest countries') ||
    text.includes('best countries') ||
    text.includes('10 easiest') ||
    text.includes('top 10')
  ) {
    return 'comparison';
  }

  if (
    text.includes('digital nomad') ||
    text.includes('country-by-country') ||
    text.includes('country guide') ||
    text.includes('destination guide') ||
    (text.includes('guide') && (text.includes('canada') || text.includes('germany') || text.includes('australia') || text.includes('portugal')))
  ) {
    return 'country-guide';
  }

  if (
    text.includes('work visa') ||
    text.includes('work permit') ||
    text.includes('student visa') ||
    text.includes('spouse visa') ||
    text.includes('family visa') ||
    text.includes('visa difference') ||
    text.includes('visa vs')
  ) {
    return 'visa-explainer';
  }

  if (
    text.includes('skilled worker') ||
    text.includes('express entry') ||
    text.includes('points based') ||
    text.includes('blue card') ||
    text.includes('pathway') ||
    text.includes('residency')
  ) {
    return 'pathway-explainer';
  }

  if (
    text.includes('how immigration works') ||
    text.includes('moving abroad') ||
    text.includes('relocat') ||
    text.includes('immigration basics') ||
    text.includes('immigration guide')
  ) {
    return 'relocation-guide';
  }

  if (
    text.includes('update') ||
    text.includes('change') ||
    text.includes('new rule') ||
    text.includes('policy') ||
    text.includes('announce')
  ) {
    return 'news-policy';
  }

  return 'general';
}

const INTRO_MAP: Record<string, string> = {
  'digital-nomad-visa-guide':
    'Over 60 countries now offer dedicated digital nomad visa programs, but the quality, cost, and long-term value of these programs varies enormously. This guide covers the most significant programs currently active in 2026, with verified income thresholds, processing times, tax implications, and honest assessments of which programs actually deliver on their promises.',
  'easiest-countries-to-immigrate-to':
    'Immigration systems range from open and accessible to highly competitive and bureaucratically complex. This guide identifies the ten most accessible destination countries for international movers in 2026, ranked by a combination of income threshold, documentation burden, processing speed, and long-term residency quality. Whether you are a remote worker, retiree, or skilled professional, at least one option here will fit your situation.',
  'how-immigration-works':
    'Immigration is the legal process of moving to a foreign country and establishing the right to live and work there. Understanding how immigration systems work before you apply saves time, money, and significant frustration. This guide explains the core concepts every international mover needs to know: visa categories, eligibility rules, the journey from temporary visa to permanent residency, and the most common mistakes that cause applications to fail.',
  'work-visa-vs-work-permit':
    'The terms "work visa" and "work permit" are frequently used as if they mean the same thing, but in most immigration systems they refer to legally distinct documents with different functions. Getting this distinction wrong at the start of an international job search can lead to applying for the wrong authorization, working illegally without realizing it, or missing critical steps in the application process. This article clarifies the difference and explains how the two documents interact in major destination countries.',
  'skilled-worker-immigration':
    'Skilled worker immigration is one of the most structured and accessible pathways available to professionals who want to build a life abroad. Rather than relying on luck or employer connections, most skilled migration programs evaluate applicants against clear, published criteria. This guide covers how skilled worker programs work, which countries offer the strongest pathways, and what applicants need to prepare for a competitive application.',
};

const CONCLUSION_MAP: Record<string, string> = {
  'digital-nomad-visa-guide':
    'The digital nomad visa landscape has matured significantly since 2020. Portugal and Spain remain the strongest options for those who want EU residency as a long-term outcome. Georgia and Costa Rica suit those prioritizing flexibility and low cost. Thailand offers unmatched duration through the LTR Visa. The right choice depends on your income level, tax situation, lifestyle preferences, and long-term plans. Use the immigration tools below to compare specific countries and estimate your total costs before committing to an application.',
  'easiest-countries-to-immigrate-to':
    'The ten countries covered in this guide represent the most accessible immigration pathways for a wide range of nationalities and income levels. Georgia suits those who want maximum flexibility with minimal barriers. Portugal and Canada offer the strongest combination of accessibility and long-term quality. Panama and Thailand are compelling options for retirees and those with passive income. The best choice depends on what you are trying to achieve: a temporary base, a long-term residency, a path to citizenship, or simply the right environment for the next chapter of your life. Use the Path Finder tool to match your specific situation to the most relevant options.',
  'how-immigration-works':
    'Immigration is a process that rewards preparation. The more clearly you understand which visa category you need, what documents are required, and how the processing system works, the smoother your experience will be. The fundamentals covered in this guide apply across almost every destination. For country-specific details, use the country guides, pathway pages, and cost calculator available on this site. When in doubt, verify directly against the official government source for the country you are applying to.',
  'work-visa-vs-work-permit':
    'The distinction between a work visa and a work permit matters most when you are planning a move or navigating a change of employer. In countries that separate the two documents, understanding the sequence and dependency between them prevents costly delays. In countries that combine them, the process is simpler but the conditions tied to your authorization still need careful reading. When you start a new role in a foreign country, always confirm in writing that your authorization is current, your employer is aware of any conditions, and your documents are physically in your possession.',
  'skilled-worker-immigration':
    'Skilled worker immigration is one of the most reliable paths to permanent residency in major destination countries. The strongest systems, such as Canada Express Entry and Australia skilled migration, are competitive but transparent. Germany and the Netherlands offer employer-sponsored routes with fast processing. Success depends on early preparation, accurate credential assessment, and choosing the right country for your occupation and qualifications. Use the tools on this site to explore specific pathways, compare costs, and start building your application roadmap.',
};

const INTRO_BY_TYPE: Record<ArticleType, (title: string, excerpt: string) => string> = {
  'country-guide': (title, excerpt) =>
    excerpt ||
    `This guide covers the most important details you need to evaluate ${title.replace(/guide|complete|the|in 2026/gi, '').trim()} as a potential destination. Eligibility rules, income thresholds, processing times, and practical considerations are all covered in plain language.`,
  'comparison': (title, excerpt) =>
    excerpt ||
    `Not all immigration options are created equal. This guide compares the key options side by side so you can make a clear-eyed decision based on your actual situation, budget, and long-term goals.`,
  'cost': (title, excerpt) =>
    excerpt ||
    `Immigration costs go well beyond the official government fee. This guide breaks down the full cost picture so you can budget accurately and avoid unpleasant surprises.`,
  'pathway-explainer': (title, excerpt) =>
    excerpt ||
    `Understanding how this immigration pathway works before applying significantly improves your chances of success. This guide explains the core requirements, common misunderstandings, and practical steps involved.`,
  'visa-explainer': (title, excerpt) =>
    excerpt ||
    `Visa terminology can be confusing, and getting the details wrong at the start of an application can cause costly delays. This guide explains the key concepts clearly and practically.`,
  'relocation-guide': (title, excerpt) =>
    excerpt ||
    `Planning an international move involves more decisions than most people anticipate. This guide covers the most important things to understand before you commit to a destination or begin an application.`,
  'news-policy': (title, excerpt) =>
    excerpt ||
    `Immigration policy changes can affect pending and future applications in significant ways. Here is what has changed, who it affects, and what you should consider next.`,
  'general': (title, excerpt) =>
    excerpt ||
    `This guide covers the key things you need to know about this topic to make a well-informed immigration decision.`,
};

const CONCLUSION_BY_TYPE: Record<ArticleType, (title: string) => string> = {
  'country-guide': () =>
    'Every immigration program has trade-offs. The income thresholds, processing timelines, and long-term residency quality described in this guide are verified against current official sources, but requirements do change. Always confirm the latest rules directly through the relevant government immigration authority before submitting any application. Use the Path Finder and Cost Calculator tools on this site to continue your research.',
  'comparison': () =>
    'Comparing immigration options is a useful starting point, but the right choice ultimately depends on your specific circumstances: your nationality, income, occupation, family situation, and long-term goals. Use the country guides and planning tools on this site to explore the options that fit your profile in more depth.',
  'cost': () =>
    'Accurate cost planning is one of the most important steps in a successful immigration journey. Government fees change periodically, so always verify current amounts through official sources before submitting your application. For a full breakdown of immigration costs by country and pathway, use the Cost Calculator tool on this site.',
  'pathway-explainer': () =>
    'Each immigration pathway has specific conditions attached to it. Understanding the full requirements, renewal conditions, and path to permanent residency before you apply avoids expensive mistakes. For country-specific pathway details, explore the country guides and pathway pages on this site.',
  'visa-explainer': () =>
    'Immigration rules are country-specific and change frequently. The distinctions explained in this guide apply broadly across major destination countries, but the specific rules in your target country may differ. Always verify current requirements through the official government immigration authority before beginning your application.',
  'relocation-guide': () =>
    'Moving to another country is one of the most significant decisions a person can make. The concepts in this guide apply broadly, but every country has its own rules, processing quirks, and cultural considerations. Use the detailed country guides and planning tools on this site to research your specific destination in depth, and verify the latest requirements through official government sources.',
  'news-policy': () =>
    'Policy changes can affect pending applications, approved visas, and future planning. If you are in the middle of an application or considering a move, review the updated requirements carefully and consult an immigration professional if you are uncertain about the impact on your specific situation.',
  'general': () =>
    'Immigration decisions benefit from thorough research and early preparation. Use the guides, tools, and country pages on ImmigrationInfoGuide.com to continue building your knowledge, and always verify current rules through official government immigration sources before submitting any application.',
};

export function getArticleIntro(
  slug: string,
  title: string,
  excerpt: string,
  type: ArticleType
): string {
  if (INTRO_MAP[slug]) return INTRO_MAP[slug];
  return INTRO_BY_TYPE[type](title, excerpt);
}

export function getArticleConclusion(slug: string, title: string, type: ArticleType): string {
  if (CONCLUSION_MAP[slug]) return CONCLUSION_MAP[slug];
  return CONCLUSION_BY_TYPE[type](title);
}
