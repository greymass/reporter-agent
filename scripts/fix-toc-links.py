#!/usr/bin/env python3
"""
Fix Table of Contents links in technical reports to match actual heading anchors.
Usage: ./scripts/fix-toc-links.py reports/2025-11/technical.md
"""

import re
import sys

def generate_anchor(text):
    """Generate GitHub-flavored markdown anchor ID"""
    # Remove code formatting
    text = text.replace('`', '')
    # Lowercase
    text = text.lower()
    # Replace spaces with hyphens
    text = text.replace(' ', '-')
    # Remove special characters except hyphens and word characters
    text = re.sub(r'[^\w\s-]', '', text)
    # Collapse multiple hyphens
    text = re.sub(r'-+', '-', text)
    # Strip leading/trailing hyphens
    text = text.strip('-')
    return text

def fix_toc_links(filepath, dry_run=False):
    """Fix TOC links in a markdown file"""
    with open(filepath, 'r') as f:
        lines = f.readlines()
    
    # Extract actual headings and their anchors
    actual_anchors = {}
    for i, line in enumerate(lines, 1):
        match = re.match(r'^(##[#]?)\s+(.+)$', line)
        if match:
            level, heading_text = match.groups()
            heading_text = heading_text.strip()
            anchor = generate_anchor(heading_text)
            actual_anchors[heading_text] = anchor
    
    # Find TOC section boundaries
    toc_start = None
    toc_end = None
    for i, line in enumerate(lines):
        if re.match(r'^##\s+Table of Contents', line):
            toc_start = i
        elif toc_start is not None and toc_end is None and re.match(r'^##\s+', line) and 'Table of Contents' not in line:
            toc_end = i
            break
    
    if toc_start is None:
        print("No Table of Contents found")
        return 0
    
    # Fix TOC links
    fixes = 0
    for i in range(toc_start, toc_end if toc_end else len(lines)):
        line = lines[i]
        new_line = line
        
        # Find all [text](#anchor) patterns
        for match in re.finditer(r'\[([^\]]+)\]\(#([^)]+)\)', line):
            link_text, old_anchor = match.groups()
            correct_anchor = generate_anchor(link_text)
            
            if old_anchor != correct_anchor:
                # Replace the anchor in the line
                old_link = f'[{link_text}](#{old_anchor})'
                new_link = f'[{link_text}](#{correct_anchor})'
                new_line = new_line.replace(old_link, new_link)
                fixes += 1
                print(f"Line {i+1}: #{old_anchor} → #{correct_anchor}")
        
        lines[i] = new_line
    
    if fixes == 0:
        print("✓ No TOC links need fixing")
        return 0
    
    if dry_run:
        print(f"\nDry run: {fixes} links would be fixed")
        return fixes
    
    # Write back
    with open(filepath, 'w') as f:
        f.writelines(lines)
    
    print(f"\n✓ Fixed {fixes} TOC links in {filepath}")
    return fixes

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: ./scripts/fix-toc-links.py <path-to-technical.md> [--dry-run]")
        sys.exit(1)
    
    filepath = sys.argv[1]
    dry_run = '--dry-run' in sys.argv
    
    try:
        fixes = fix_toc_links(filepath, dry_run)
        sys.exit(0 if fixes == 0 else 0)  # Success either way
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)
