#!/usr/bin/env bash
# Check technical.md requirements (from agents/technical.md)
# Usage: check-technical.sh FILE REPORT_NAME

source "$(dirname "$0")/lib.sh"

FILE="$1"
REPORT_NAME="$2"

echo "--- Checking technical.md requirements ---"

if [[ ! -f "$FILE" ]]; then
    exit 1
fi

# Check for GitHub URLs (should have many)
increment_check
github_count=$(grep -c "https://github.com/" "$FILE" 2>/dev/null || echo 0)
github_count=$(echo "$github_count" | tr -d ' \n\t')
if [[ "$github_count" != "0" && $github_count -gt 5 ]]; then
    log_pass "Contains GitHub URLs ($github_count found)"
    increment_pass
else
    log_error "Few GitHub URLs in $REPORT_NAME ($github_count, expected many)" "technical"
    increment_fail
fi

# Check for PR numbers (should have many)
increment_check
pr_count=$(grep -cE "#[0-9]+" "$FILE" 2>/dev/null || echo 0)
pr_count=$(echo "$pr_count" | tr -d ' \n\t')
if [[ "$pr_count" != "0" && $pr_count -gt 3 ]]; then
    log_pass "Contains PR references ($pr_count found)"
    increment_pass
else
    log_warning "Few PR references in $REPORT_NAME ($pr_count)" "technical"
    increment_warning
fi

# Check for incomplete GitHub URLs
increment_check
incomplete_count=$(grep -cE '\[.*\]\(https://github\.com/[^)]*$' "$FILE" 2>/dev/null || echo 0)
incomplete_count=$(echo "$incomplete_count" | tr -d ' \n\t')
if [[ "$incomplete_count" != "0" && $incomplete_count -gt 0 ]]; then
    log_error "Found $incomplete_count incomplete GitHub URLs in $REPORT_NAME" "technical"
    increment_fail
else
    log_pass "No incomplete GitHub URLs"
    increment_pass
fi

# Check for Navigation (should be present)
increment_check
if grep -q "^\*\*Navigation\*\*:" "$FILE"; then
    log_pass "Has Navigation section"
    increment_pass
else
    log_error "Missing Navigation section in $REPORT_NAME" "technical"
    increment_fail
fi

# Check for cross-document links
increment_check
if grep -q "README\.md" "$FILE" && grep -q "research\.md" "$FILE"; then
    log_pass "Has cross-document links"
    increment_pass
else
    log_error "Missing cross-document links (README.md or research.md) in $REPORT_NAME" "technical"
    increment_fail
fi

# Check document structure order
increment_check
# Get line numbers for key sections (skip the title which is the first ## header)
toc_line=$(grep -n "^## Table of Contents" "$FILE" | cut -d: -f1)
cri_line=$(grep -n "^## Cross-Repository Insights" "$FILE" | cut -d: -f1)
# First real section after TOC (not title, not TOC, not Cross-Repository)
first_section_line=$(grep -n "^## " "$FILE" | grep -v "^[0-9]*:##.*202[0-9]" | grep -v "Table of Contents" | grep -v "Cross-Repository Insights" | head -1 | cut -d: -f1)

if [[ -z "$cri_line" ]]; then
    log_error "Missing Cross-Repository Insights section in $REPORT_NAME" "technical"
    increment_fail
elif [[ -z "$toc_line" ]]; then
    log_error "Missing Table of Contents in $REPORT_NAME" "technical"
    increment_fail
elif [[ $toc_line -ge $cri_line ]]; then
    log_error "Cross-Repository Insights must come AFTER Table of Contents in $REPORT_NAME (TOC line $toc_line, CRI line $cri_line)" "technical"
    increment_fail
elif [[ -n "$first_section_line" ]] && [[ $cri_line -ge $first_section_line ]]; then
    log_error "Cross-Repository Insights must come BEFORE repository sections in $REPORT_NAME (CRI line $cri_line, first section line $first_section_line)" "technical"
    increment_fail
else
    # Check content
    subsection_count=$(sed -n '/^## Cross-Repository Insights/,/^## /p' "$FILE" | grep -c "^### " || echo 0)
    placeholder_count=$(sed -n '/^## Cross-Repository Insights/,/^## /p' "$FILE" | grep -ciE "(no significant|consisted primarily of independent|no.*cross-repository)" || echo 0)
    
    if [[ $subsection_count -gt 0 ]]; then
        log_pass "Cross-Repository Insights in correct position with $subsection_count integration(s)"
        increment_pass
    elif [[ $placeholder_count -gt 0 ]]; then
        log_pass "Cross-Repository Insights in correct position (no integrations this month)"
        increment_pass
    else
        log_error "Cross-Repository Insights section appears empty in $REPORT_NAME" "technical"
        increment_fail
    fi
fi

# Check for Key Achievements in header
increment_check
if grep -q "^\*\*Key Achievements\*\*:" "$FILE"; then
    log_pass "Has Key Achievements in header"
    increment_pass
else
    log_error "Missing Key Achievements in header of $REPORT_NAME" "technical"
    increment_fail
fi

# Check for Technical Significance in header
increment_check
if grep -q "^\*\*Technical Significance\*\*:" "$FILE"; then
    log_pass "Has Technical Significance in header"
    increment_pass
else
    log_error "Missing Technical Significance in header of $REPORT_NAME" "technical"
    increment_fail
fi

# Check for velocity metrics (should NOT be present)
increment_check
if grep -qE "([0-9]+%|[0-9]+ PRs? \([0-9]+% of)" "$FILE"; then
    log_error "Contains velocity metrics in $REPORT_NAME (prohibited)" "technical"
    increment_fail
else
    log_pass "No velocity metrics found"
    increment_pass
fi

# Check for Publications section (should NOT be present)
increment_check
if grep -q "^## Publications" "$FILE"; then
    log_error "Contains Publications section in $REPORT_NAME (should be in executive summary only)" "technical"
    increment_fail
else
    log_pass "No Publications section (correct)"
    increment_pass
fi

# Check for effort quantification (should NOT be present)
increment_check
effort_count=$(grep -ciE "(intensive|heavy) (development|focus|effort)" "$FILE" 2>/dev/null || echo 0)
effort_count=$(echo "$effort_count" | tr -d ' \n\t')
if [[ "$effort_count" != "0" && $effort_count -gt 0 ]]; then
    log_error "Contains effort quantification ($effort_count instances) in $REPORT_NAME (prohibited)" "technical"
    increment_fail
else
    log_pass "No effort quantification language"
    increment_pass
fi

# Check for Summary section at end (should NOT be present - should be at top)
increment_check
if tail -50 "$FILE" | grep -q "^## Summary"; then
    log_error "Has Summary section at end of $REPORT_NAME (should be at top)" "technical"
    increment_fail
else
    log_pass "No Summary section at end (correct - should be at top)"
    increment_pass
fi

# Check Table of Contents links
increment_check
if command -v python3 &> /dev/null; then
    toc_result=$(python3 -c "
import re
import sys

def generate_anchor(text):
    text = text.replace('\`', '')
    text = text.lower()
    text = text.replace(' ', '-')
    text = re.sub(r'[^\w\s-]', '', text)
    text = re.sub(r'-+', '-', text)
    return text.strip('-')

filepath = '$FILE'
with open(filepath, 'r') as f:
    lines = f.readlines()

actual_anchors = set()
for line in lines:
    match = re.match(r'^##[#]?\s+(.+)$', line)
    if match:
        actual_anchors.add(generate_anchor(match.group(1).strip()))

toc_start = toc_end = None
for i, line in enumerate(lines):
    if re.match(r'^##\s+Table of Contents', line):
        toc_start = i
    elif toc_start and not toc_end and re.match(r'^##\s+', line) and 'Table of Contents' not in line:
        toc_end = i
        break

if not toc_start:
    print('0')
    sys.exit(0)

errors = 0
for i in range(toc_start, toc_end if toc_end else len(lines)):
    for match in re.finditer(r'\[([^\]]+)\]\(#([^)]+)\)', lines[i]):
        link_text, link_anchor = match.groups()
        if link_anchor not in actual_anchors:
            errors += 1

print(errors)
" 2>/dev/null || echo "-1")

    if [[ "$toc_result" == "-1" ]]; then
        log_warn "Could not check TOC links (Python error)"
    elif [[ "$toc_result" == "0" ]]; then
        log_pass "All TOC links are valid"
        increment_pass
    else
        log_error "Found $toc_result broken TOC links in $REPORT_NAME (run scripts/fix-toc-links.py)" "technical"
        increment_fail
    fi
else
    log_warn "Python3 not found - skipping TOC link check"
fi
