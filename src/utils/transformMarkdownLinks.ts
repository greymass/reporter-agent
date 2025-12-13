/**
 * Remove navigation sections from markdown HTML
 * Removes lines like:
 * - **Navigation**: [← Previous Month](...)
 * - *Also available: [Technical Report](...) | [Research Data](...)*
 */
function stripNavigationSection(html: string): string {
  // Remove "Navigation:" paragraph
  html = html.replace(/<p><strong>Navigation<\/strong>:.*?<\/p>/gi, '');
  
  // Remove "Also available:" paragraph
  html = html.replace(/<p><em>Also available:.*?<\/em><\/p>/gi, '');
  
  return html;
}

/**
 * Replace the main title on summary (README) pages
 * Changes "Greymass Team Activity Report" to "Progress Summary"
 */
function replaceMainTitle(html: string): string {
  html = html.replace(
    /<h1[^>]*>Greymass Team Activity Report<\/h1>/gi,
    '<h1 id="progress-summary">Progress Summary</h1>'
  );
  
  return html;
}

/**
 * Transform markdown links to work with Astro routing
 * Converts:
 * - ../2025-10/README.md -> /reports/2025-10/readme/
 * - technical.md -> /reports/2025-11/technical/
 * - ./research.md -> /reports/2025-11/research/
 * - ../glossary.md#term -> /reports/glossary/#term
 * - ../../glossary.md#term -> /reports/glossary/#term
 * - ../github-projects.md -> https://github.com/greymass/reporter-agent/blob/master/github-projects.md
 */

export function transformMarkdownLinks(html: string, currentMonth: string): string {
  // First, strip the navigation section
  html = stripNavigationSection(html);
  
  // Replace main title on summary pages
  html = replaceMainTitle(html);
  // Replace relative links to other months: ../YYYY-MM/README.md or ../YYYY-MM/technical.md
  html = html.replace(
    /href="\.\.\/(\d{4}-\d{2})\/(README|readme|technical|research)\.md(#[^"]*)?"/gi,
    (match, month, filename, hash = '') => {
      const normalizedFilename = filename.toLowerCase();
      return `href="/reports/${month}/${normalizedFilename}/${hash}"`;
    }
  );

  // Replace links to glossary: ../glossary.md or ../../glossary.md with optional hash
  html = html.replace(
    /href="(\.\.\/)+glossary\.md(#[^"]*)?"/gi,
    (match, dotdots, hash = '') => {
      return `href="/reports/glossary/${hash}"`;
    }
  );

  // Replace links to github-projects.md with GitHub URL
  html = html.replace(
    /href="\.\.\/+github-projects\.md(#[^"]*)?"/gi,
    (match, hash = '') => {
      return `href="https://github.com/greymass/reporter-agent/blob/master/github-projects.md${hash}" target="_blank" rel="noopener"`;
    }
  );

  // Replace links to README.md in parent directory with GitHub URL
  html = html.replace(
    /href="\.\.\/+README\.md"/gi,
    'href="https://github.com/greymass/reporter-agent/blob/master/README.md" target="_blank" rel="noopener"'
  );

  // Replace same-directory links: technical.md, ./technical.md
  html = html.replace(
    /href="\.?\/?(\w+)\.md(#[^"]*)?"/gi,
    (match, filename, hash = '') => {
      const normalizedFilename = filename.toLowerCase();
      // Check if it's a report type (readme, technical, research)
      if (['readme', 'technical', 'research'].includes(normalizedFilename)) {
        return `href="/reports/${currentMonth}/${normalizedFilename}/${hash}"`;
      }
      // Check if it's glossary
      if (normalizedFilename === 'glossary') {
        return `href="/reports/glossary/${hash}"`;
      }
      // Check if it's github-projects
      if (normalizedFilename === 'github-projects') {
        return `href="https://github.com/greymass/reporter-agent/blob/master/github-projects.md${hash}" target="_blank" rel="noopener"`;
      }
      // Otherwise keep original (might be external)
      return match;
    }
  );

  return html;
}
