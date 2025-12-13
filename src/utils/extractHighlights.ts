/**
 * Strip markdown formatting from text
 */
function stripMarkdown(text: string): string {
  return text
    // Remove links: [text](url) -> text
    .replace(/\[([^\]]+)\]\([^\)]+\)/g, '$1')
    // Remove bold: **text** or __text__ -> text
    .replace(/\*\*([^\*]+)\*\*/g, '$1')
    .replace(/__([^_]+)__/g, '$1')
    // Remove italic: *text* or _text_ -> text
    .replace(/\*([^\*]+)\*/g, '$1')
    .replace(/_([^_]+)_/g, '$1')
    // Remove inline code: `code` -> code
    .replace(/`([^`]+)`/g, '$1')
    .trim();
}

/**
 * Extract highlights from README markdown content
 * Returns the top-level bullet points under the "### Highlights" section
 * (ignores nested sub-bullets)
 */
export function extractHighlights(markdown: string): string[] {
  // Find the Highlights section - capture until we hit another heading or end of content
  // This regex matches everything from "### Highlights" until the next "###" heading
  const highlightsMatch = markdown.match(/###\s+Highlights\s*\n\n([\s\S]+?)(?=\n###|\n\n###|$)/i);
  
  if (!highlightsMatch) {
    return [];
  }
  
  const highlightsText = highlightsMatch[1];
  
  // Extract only top-level bullet points (those that start at the beginning of the line)
  // Ignore nested bullets (those that start with whitespace)
  const highlights = highlightsText
    .split('\n')
    .filter(line => {
      // Check if line starts with - or * (top-level bullet)
      // and doesn't start with whitespace (which would indicate a nested bullet)
      return /^[-*]\s+/.test(line);
    })
    .map(line => stripMarkdown(line.replace(/^[-*]\s+/, '').trim()))
    .filter(Boolean);
  
  return highlights;
}

/**
 * Get a short excerpt from highlights (first N characters)
 */
export function getHighlightExcerpt(highlights: string[], maxLength: number = 200): string {
  if (highlights.length === 0) return '';
  
  // Take first highlight and truncate if needed
  const firstHighlight = highlights[0];
  if (firstHighlight.length <= maxLength) {
    return firstHighlight;
  }
  
  return firstHighlight.substring(0, maxLength).trim() + '...';
}
