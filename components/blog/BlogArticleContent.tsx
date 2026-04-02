import Link from 'next/link';
import type { ContentSection } from '@/lib/blogTypes';

type Props = {
  content: ContentSection[];
};

function parseInlineMarkup(text: string): React.ReactNode[] {
  const parts: React.ReactNode[] = [];
  const regex = /(\*\*[^*]+\*\*|\[([^\]]+)\]\(([^)]+)\))/g;
  let lastIndex = 0;
  let match: RegExpExecArray | null;

  while ((match = regex.exec(text)) !== null) {
    if (match.index > lastIndex) {
      parts.push(text.slice(lastIndex, match.index));
    }

    if (match[0].startsWith('**')) {
      parts.push(
        <strong key={match.index} className="font-semibold text-gray-900">
          {match[0].slice(2, -2)}
        </strong>
      );
    } else if (match[2] && match[3]) {
      const href = match[3];
      const isExternal = href.startsWith('http') && !href.includes('immigrationinfoguide.com');
      if (isExternal) {
        parts.push(
          <a
            key={match.index}
            href={href}
            className="text-brand-primary underline underline-offset-2 hover:text-brand-primary-hover transition-colors"
            target="_blank"
            rel="noopener noreferrer"
          >
            {match[2]}
          </a>
        );
      } else {
        const internalHref = href.startsWith('http') ? new URL(href).pathname : href;
        parts.push(
          <Link
            key={match.index}
            href={internalHref}
            className="text-brand-primary underline underline-offset-2 hover:text-brand-primary-hover transition-colors"
          >
            {match[2]}
          </Link>
        );
      }
    }

    lastIndex = match.index + match[0].length;
  }

  if (lastIndex < text.length) {
    parts.push(text.slice(lastIndex));
  }

  return parts;
}

function parseBodyText(text: string): React.ReactNode[] {
  const paragraphs = text.split('\n\n');
  return paragraphs.map((para, pIdx) => {
    if (para.trim() === '') return null;

    const lines = para.split('\n').filter((l) => l.trim() !== '');

    const isBullet = lines.every((l) => l.trim().startsWith('- '));
    if (isBullet) {
      return (
        <ul key={pIdx} className="my-5 space-y-2.5 pl-5">
          {lines.map((item, i) => (
            <li key={i} className="text-gray-700 leading-relaxed list-disc marker:text-brand-primary">
              {parseInlineMarkup(item.replace(/^-\s*/, ''))}
            </li>
          ))}
        </ul>
      );
    }

    const isNumbered = lines.every((l) => /^\d+\.\s/.test(l.trim()));
    if (isNumbered) {
      return (
        <ol key={pIdx} className="my-5 space-y-2.5 pl-5">
          {lines.map((item, i) => (
            <li key={i} className="text-gray-700 leading-relaxed list-decimal marker:text-brand-primary marker:font-semibold">
              {parseInlineMarkup(item.replace(/^\d+\.\s*/, ''))}
            </li>
          ))}
        </ol>
      );
    }

    return (
      <p key={pIdx} className="text-gray-700 leading-[1.85] mb-5 text-[1.0125rem]">
        {parseInlineMarkup(para)}
      </p>
    );
  });
}

export default function BlogArticleContent({ content }: Props) {
  if (!content || content.length === 0) return null;

  return (
    <div className="blog-article-body">
      {content.map((section) => (
        <section key={section.id} id={section.id} className="mb-10 scroll-mt-28">
          {section.level === 2 ? (
            <h2 className="text-2xl font-bold text-gray-900 mb-4 mt-2 pb-2.5 border-b border-gray-100 leading-snug">
              {section.heading}
            </h2>
          ) : (
            <h3 className="text-xl font-semibold text-gray-800 mb-3 mt-7 leading-snug">
              {section.heading}
            </h3>
          )}
          <div>{parseBodyText(section.body)}</div>
        </section>
      ))}
    </div>
  );
}
