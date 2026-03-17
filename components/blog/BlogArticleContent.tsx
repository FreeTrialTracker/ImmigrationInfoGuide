import type { ContentSection } from '@/lib/blogTypes';

type Props = {
  content: ContentSection[];
};

function InlineFormatted({ text }: { text: string }) {
  const parts = text.split(/(\*\*[^*]+\*\*)/g);
  return (
    <>
      {parts.map((part, i) =>
        part.startsWith('**') && part.endsWith('**') ? (
          <strong key={i} className="font-semibold text-gray-900">
            {part.slice(2, -2)}
          </strong>
        ) : (
          <span key={i}>{part}</span>
        )
      )}
    </>
  );
}

function parseBodyText(text: string): React.ReactNode[] {
  const paragraphs = text.split('\n\n');
  return paragraphs.map((para, pIdx) => {
    if (para.trim() === '') return null;

    const lines = para.split('\n').filter((l) => l.trim() !== '');
    const isBullet = lines.every((l) => l.trim().startsWith('- '));
    if (isBullet) {
      return (
        <ul key={pIdx} className="my-4 space-y-2 pl-5">
          {lines.map((item, i) => (
            <li key={i} className="text-gray-700 leading-relaxed list-disc">
              <InlineFormatted text={item.replace(/^-\s*/, '')} />
            </li>
          ))}
        </ul>
      );
    }

    const isNumbered = lines.every((l) => /^\d+\.\s/.test(l.trim()));
    if (isNumbered) {
      return (
        <ol key={pIdx} className="my-4 space-y-2 pl-5">
          {lines.map((item, i) => (
            <li key={i} className="text-gray-700 leading-relaxed list-decimal">
              <InlineFormatted text={item.replace(/^\d+\.\s*/, '')} />
            </li>
          ))}
        </ol>
      );
    }

    return (
      <p key={pIdx} className="text-gray-700 leading-[1.8] mb-4">
        <InlineFormatted text={para} />
      </p>
    );
  });
}

export default function BlogArticleContent({ content }: Props) {
  if (!content || content.length === 0) return null;

  return (
    <div>
      {content.map((section) => (
        <section key={section.id} id={section.id} className="mb-10 scroll-mt-24">
          {section.level === 2 ? (
            <h2 className="text-2xl font-bold text-gray-900 mb-4 pb-2 border-b border-gray-100">
              {section.heading}
            </h2>
          ) : (
            <h3 className="text-xl font-bold text-gray-900 mb-3 mt-6">
              {section.heading}
            </h3>
          )}
          <div>{parseBodyText(section.body)}</div>
        </section>
      ))}
    </div>
  );
}
