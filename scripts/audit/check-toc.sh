#!/usr/bin/env bash
#
# check-toc.sh - Validate Table of Contents links in technical reports
#
# Usage: ./scripts/audit/check-toc.sh reports/2025-11/technical.md

set -euo pipefail

FILE="${1:-}"

if [[ -z "$FILE" ]]; then
    echo "Usage: $0 <path-to-technical.md>"
    exit 1
fi

if [[ ! -f "$FILE" ]]; then
    echo "Error: File not found: $FILE"
    exit 1
fi

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "--- Checking Table of Contents links ---"

# Function to generate GitHub-flavored markdown anchor ID
generate_anchor() {
    local text="$1"
    # Remove code formatting
    text="${text//\`/}"
    # Lowercase
    text=$(echo "$text" | tr '[:upper:]' '[:lower:]')
    # Replace spaces with hyphens
    text="${text// /-}"
    # Remove special characters except hyphens and word characters
    text=$(echo "$text" | sed 's/[^a-z0-9-]//g')
    # Collapse multiple hyphens
    text=$(echo "$text" | sed 's/-\+/-/g')
    # Strip leading/trailing hyphens
    text=$(echo "$text" | sed 's/^-//; s/-$//')
    echo "$text"
}

# Extract all headings (## and ###) and their line numbers
declare -A actual_headings
while IFS= read -r line; do
    if [[ $line =~ ^(##[#]?)[[:space:]](.+)$ ]]; then
        level="${BASH_REMATCH[1]}"
        heading_text="${BASH_REMATCH[2]}"
        anchor=$(generate_anchor "$heading_text")
        actual_headings["$anchor"]=1
    fi
done < "$FILE"

# Extract TOC links
errors=0
warnings=0
toc_started=false
toc_ended=false

while IFS= read -r line_num; do
    line=$(sed -n "${line_num}p" "$FILE")
    
    # Detect TOC start
    if [[ $line =~ ^##[[:space:]]Table[[:space:]]of[[:space:]]Contents ]]; then
        toc_started=true
        continue
    fi
    
    # Detect TOC end (next ## heading)
    if [[ $toc_started == true ]] && [[ $line =~ ^##[[:space:]] ]] && [[ ! $line =~ Table[[:space:]]of[[:space:]]Contents ]]; then
        toc_ended=true
        break
    fi
    
    # Check TOC links
    if [[ $toc_started == true ]] && [[ $toc_ended == false ]]; then
        if [[ $line =~ \[([^\]]+)\]\(#([^)]+)\) ]]; then
            link_text="${BASH_REMATCH[1]}"
            link_anchor="${BASH_REMATCH[2]}"
            
            # Check if anchor exists
            if [[ ! -v actual_headings[$link_anchor] ]]; then
                echo -e "${RED}✗ ERROR${NC}: TOC link '#$link_anchor' not found (line $line_num)"
                echo "    Link text: $link_text"
                
                # Try to suggest correct anchor
                suggested=$(generate_anchor "$link_text")
                if [[ -v actual_headings[$suggested] ]]; then
                    echo "    Suggested: #$suggested"
                fi
                ((errors++))
            fi
        fi
    fi
done < <(grep -n "." "$FILE")

# Summary
echo ""
if [[ $errors -eq 0 ]]; then
    echo -e "${GREEN}✓${NC} All TOC links are valid"
    exit 0
else
    echo -e "${RED}✗ Found $errors broken TOC links${NC}"
    exit 1
fi
