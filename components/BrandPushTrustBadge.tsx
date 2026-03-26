'use client';

import { useEffect, useState } from 'react';

export default function BrandPushTrustBadge() {
  const [mounted, setMounted] = useState(false);
  useEffect(() => { setMounted(true); }, []);
  if (!mounted) return null;

  return (
    <div style={{ width: '100%', marginTop: '10px', all: 'unset' as any }}>
      <style>{`
        .brandpush-logo-container-item { height: auto; width: 100%; position: relative; padding: 25px 50px; }
        .brandpush-vertical-center { height: inherit; display: flex; align-content: center; flex-wrap: wrap; flex-direction: row; justify-content: center; align-content: center; align-items: center; }
        .brandpush-vertical-center img.brandpush-news-logo { max-width: 100px; max-height: 66px; min-width: 50px; min-height: 14px; height: auto; width: auto; margin: 7px 10px; overflow: visible; }
        .brandpush-trust-badge, .brandpush-title, .brandpush-footer { font-family: sans-serif !important; }
        .brandpush-title:before, .brandpush-title:after { content: ""; flex: 1 1; border-bottom: 1px solid #d8d8d8; margin: auto; width: 27%; display: block; position: relative; }
        .brandpush-title:before { margin-left: 30px; top: 12px; width: 25.5%; }
        .brandpush-title:after { margin-right: 30px; top: -13px; }
        @media screen and (min-width: 585px) { .brandpush-logo-container { padding: 0 20px; } }
        @media screen and (max-width: 584px) { .brandpush-news-logo { max-width: 70px !important; } .brandpush-title { font-size: 15px; top: -5px; letter-spacing: 6px; } .brandpush-title:before, .brandpush-title:after { border-bottom: none !important; } .brandpush-leaf { display: none !important; } }
        @media screen and (max-width: 340px) { .brandpush-title-hr { display: none !important; } .brandpush-title { font-size: 14px; padding: 0 !important; } .brandpush-footer { font-size: 11px !important; margin: 20px 0 25px 0 !important; letter-spacing: 2px !important; } .brandpush-news-logo { max-width: 50px !important; } }
        .brandpush-logo-container { text-align: center; margin: 0 auto 0 auto; display: flex; align-content: center; justify-content: space-between; align-items: center; flex-wrap: nowrap; flex-direction: row; }
        .brandpush-newslogos { display: inline-block; position: relative; }
      `}</style>
      <div
        id="brandpush-trust-badge"
        style={{
          position: 'relative',
          width: '100%',
          background: '#ffffff',
          borderRadius: '10px',
          minHeight: 'auto',
          marginLeft: 'auto',
          marginRight: 'auto',
          paddingBottom: '12px',
        }}
      >
        <div
          style={{
            textAlign: 'center',
            padding: '0px 5px 10px 5px',
            fontSize: '18px',
            fontFamily: 'sans-serif',
            fontWeight: 600,
            letterSpacing: '8px',
            lineHeight: 1.3,
          }}
        >
          <div style={{ height: '58px' }}>
            <span
              className="brandpush-title"
              style={{ zIndex: 1, position: 'relative', padding: '0 20px', margin: 0, color: '#0e0e0e' }}
            >
              AS SEEN ON
            </span>
          </div>
          <div className="brandpush-logo-container">
            <img
              className="brandpush-leaf"
              alt="Trust Reef"
              style={{ position: 'absolute', height: '110px', left: '25px', margin: 0, padding: 0, zIndex: 0, opacity: 0.2 }}
              src="https://www.brandpush.co/cdn-cgi/imagedelivery/gKm6BYVdHCj_SVQET_Msrw/3fb10293-8878-4ce5-5496-cef376fe9300/public"
            />
            <img
              className="brandpush-leaf"
              alt="Trust Reef"
              style={{ position: 'absolute', height: '110px', right: '25px', margin: 0, padding: 0, zIndex: 0, opacity: 0.2, transform: 'scaleX(-1)' }}
              src="https://www.brandpush.co/cdn-cgi/imagedelivery/gKm6BYVdHCj_SVQET_Msrw/3fb10293-8878-4ce5-5496-cef376fe9300/public"
            />
            <div className="brandpush-logo-container-item">
              <div className="brandpush-vertical-center">
                <a
                  href="https://money.mymotherlode.com/clarkebroadcasting.mymotherlode/news/article/marketersmedia-2026-3-17-visainfoguidecom-launches-enhanced-2026-global-travel-intelligence-platform-to-simplify-complex-international-visa-requirements-and-entry-rules-for-travelers-worldwide"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="brandpush-newslogos"
                >
                  <img
                    alt="Featured on My Mother Lode"
                    className="brandpush-news-logo"
                    style={{ marginRight: '14px' }}
                    src="https://www.brandpush.co/cdn-cgi/imagedelivery/gKm6BYVdHCj_SVQET_Msrw/d3e046d7-03ea-40d6-f101-13d5098e6700/public"
                  />
                </a>
                <a
                  href="http://markets.chroniclejournal.com/chroniclejournal/news/article/marketersmedia-2026-3-17-visainfoguidecom-launches-enhanced-2026-global-travel-intelligence-platform-to-simplify-complex-international-visa-requirements-and-entry-rules-for-travelers-worldwide"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="brandpush-newslogos"
                >
                  <img
                    alt="Featured on The Chronicle Journal"
                    className="brandpush-news-logo"
                    style={{ marginRight: '14px' }}
                    src="https://www.brandpush.co/cdn-cgi/imagedelivery/gKm6BYVdHCj_SVQET_Msrw/ac708810-3bf8-4cd0-f934-a3f51cd64e00/public"
                  />
                </a>
                <a
                  href="http://finance.minyanville.com/minyanville/news/article/marketersmedia-2026-3-17-visainfoguidecom-launches-enhanced-2026-global-travel-intelligence-platform-to-simplify-complex-international-visa-requirements-and-entry-rules-for-travelers-worldwide"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="brandpush-newslogos"
                >
                  <img
                    alt="Featured on Minyanville"
                    className="brandpush-news-logo"
                    style={{ marginRight: '14px' }}
                    src="https://www.brandpush.co/cdn-cgi/imagedelivery/gKm6BYVdHCj_SVQET_Msrw/b79268ce-3bb2-42ee-7919-7c650b840700/public"
                  />
                </a>
              </div>
            </div>
          </div>
          <div style={{ marginTop: '0px', fontFamily: 'sans-serif' }}>
            <span
              className="brandpush-footer"
              style={{
                textAlign: 'center',
                padding: '0 20px',
                fontSize: '13px',
                fontFamily: 'sans-serif',
                fontWeight: 600,
                letterSpacing: '3px',
                position: 'relative',
                width: '100%',
                margin: '0 0 8px 0',
                display: 'inline-block',
                color: '#a5a5a5',
              }}
            >
              AND OVER 350 NEWS SITES
            </span>
            <div
              style={{
                color: '#717171',
                fontSize: '10px',
                letterSpacing: 0,
                height: '15px',
                margin: '3px 0 0 0',
                display: 'flex',
                justifyContent: 'center',
                alignContent: 'center',
                alignItems: 'center',
              }}
            >
              <img
                style={{ width: '12px', margin: '0 3px 0 0' }}
                src="https://www.brandpush.co/cdn-cgi/imagedelivery/gKm6BYVdHCj_SVQET_Msrw/5e5b9b47-6288-4640-2b2a-cd2459605c00/public"
                alt=""
              />
              <span style={{ fontFamily: 'sans-serif' }}>
                Verified by{' '}
                <a
                  style={{ color: '#717171' }}
                  href="https://www.brandpush.co?utm_source=Client+Referral&utm_medium=Trust+Badge&utm_campaign=Trust+Badge&utm_content=1773393683134"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  BrandPush.co
                </a>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
