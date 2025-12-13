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
 * Returns the bullet points under the "### Highlights" section
 */
export function extractHighlights(markdown: string): string[] {
  // Find the Highlights section
  const highlightsMatch = markdown.match(/###\s+Highlights\s*\n\n((?:[-*]\s+.+\n?)+)/i);
  
  if (!highlightsMatch) {
    return [];
  }
  
  const highlightsText = highlightsMatch[1];
  
  // Extract bullet points and strip markdown formatting
  const highlights = highlightsText
    .split('\n')
    .filter(line => line.trim().startsWith('-') || line.trim().startsWith('*'))
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
