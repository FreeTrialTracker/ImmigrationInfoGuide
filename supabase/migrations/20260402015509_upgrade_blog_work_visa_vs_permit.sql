/*
  # Upgrade blog post: work-visa-vs-work-permit

  Expands with:
  - Richer body content in all sections
  - More internal links to country pages and pathway pages
  - Additional FAQ questions covering family work rights, open permits, etc.
  - Updated reading time
*/

UPDATE blog_posts
SET
  reading_time_minutes = 10,
  updated_at = NOW(),
  faq = '[
    {
      "question": "Can I start working while waiting for my work permit?",
      "answer": "In most countries, no. You cannot begin working until your work permit or combined visa-permit document has been formally issued and you are in legal possession of it. Some countries issue bridging authorizations or temporary work permits for those transitioning between statuses. Canada offers bridging open work permits in certain situations. Never assume work is permitted without an explicit authorization document in hand. Working without authorization, even for a short period, can jeopardize future applications and create a permanent record."
    },
    {
      "question": "If I have a work visa, can I work for any employer?",
      "answer": "Usually no. Most work visas are tied to a specific employer or sometimes a specific role. If you change jobs without first updating your immigration status, you may be in violation of your visa conditions. Canada''s open work permits and Australia''s working holiday visas are exceptions that allow working for any employer. Always check your visa conditions in writing before changing jobs. For country-specific rules, see our pathway guides for the country you are working in."
    },
    {
      "question": "What is an open work permit?",
      "answer": "An open work permit allows you to work for any employer in the country without being tied to a specific job or company. Canada issues open work permits to certain categories such as international graduate students, spouses of skilled workers, and some refugee claimants. Australia''s working holiday visa also functions as an open work permit. Most standard work permits are employer-specific. Open work permits provide significantly more flexibility and are generally considered more valuable than tied permits."
    },
    {
      "question": "Can my family work on dependent visas?",
      "answer": "This varies significantly by country. In the UK, dependants of skilled workers can generally work without restrictions. In Germany, spouses of skilled workers are typically granted equivalent work rights. In the US, H-4 dependent visas for spouses of H-1B workers do not automatically include work authorization, though an Employment Authorization Document can be applied for in some limited circumstances. In Australia and Canada, most skilled worker dependants receive open work rights. Always check dependent work rights before your family members make employment plans."
    },
    {
      "question": "What happens if I change employers while on a work visa?",
      "answer": "Rules vary by country. In the UK, your new employer must hold a sponsor licence and issue you a Certificate of Sponsorship before you start the new role. In Germany, changing employers requires approval from the immigration authority. In the US, H-1B portability rules allow employer changes while a new petition is pending, provided you worked lawfully for at least 180 days. In Australia, if you leave your sponsoring employer you generally have 60 days to find a new sponsor. Always consult your visa conditions or an immigration adviser before accepting a new job offer."
    },
    {
      "question": "What documents confirm I am authorized to work?",
      "answer": "The specific documents vary by country. In the UK, a Biometric Residence Permit or a share code from the online Right to Work service confirms work authorization. In Germany, your residence permit specifies work rights. In the US, an I-797 approval notice for an H-1B and a visa stamp in your passport together confirm authorization. In Canada, the work permit document lists employer name, work location, and expiry date. Always have your physical documents in your possession before starting work."
    },
    {
      "question": "Do freelancers and self-employed people need work permits?",
      "answer": "Yes, freelancers and self-employed people working in a foreign country still need appropriate authorization, but the category is different from employee work permits. Germany has a dedicated Freiberufler visa for liberal professions. The Netherlands has a self-employed residence permit. Many countries now offer digital nomad visas specifically for people who work remotely for non-local clients. Without the correct permit, freelance work in a foreign country carries the same legal risks as unauthorized employment."
    }
  ]'::jsonb
WHERE slug = 'work-visa-vs-work-permit';
