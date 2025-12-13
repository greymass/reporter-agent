#!/usr/bin/env bash
# Check research.md requirements (from agents/researcher.md)
# Usage: check-research.sh FILE REPORT_NAME

source "$(dirname "$0")/lib.sh"

FILE="$1"
REPORT_NAME="$2"

echo "--- Checking research.md requirements ---"

if [[ ! -f "$FILE" ]]; then
    exit 1
fi

# Check for required sections
increment_check
if grep -q "^## Data Sources & References" "$FILE"; then
    log_pass "Has 'Data Sources & References' section"
    increment_pass
else
    log_error "Missing 'Data Sources & References' section in $REPORT_NAME" "research"
    increment_fail
fi

increment_check
if grep -q "^## Summary Statistics" "$FILE"; then
    log_pass "Has 'Summary Statistics' section"
    increment_pass
else
    log_error "Missing 'Summary Statistics' section in $REPORT_NAME" "research"
    increment_fail
fi

# Check for GitHub URLs (should have many)
increment_check
github_count=$(grep -c "https://github.com/" "$FILE" 2>/dev/null || echo 0)
github_count=$(echo "$github_count" | tr -d ' \n\t')
if [[ "$github_count" != "0" && $github_count -gt 5 ]]; then
    log_pass "Contains GitHub URLs ($github_count found)"
    increment_pass
else
    log_warning "Few GitHub URLs in $REPORT_NAME ($github_count found)" "research"
    increment_warning
fi

# Check for incomplete GitHub URLs
increment_check
incomplete_count=$(grep -cE '\[.*\]\(https://github\.com/[^)]*$' "$FILE" 2>/dev/null || echo 0)
incomplete_count=$(echo "$incomplete_count" | tr -d ' \n\t')
if [[ "$incomplete_count" != "0" && $incomplete_count -gt 0 ]]; then
    log_error "Found $incomplete_count incomplete GitHub URLs in $REPORT_NAME" "research"
    increment_fail
else
    log_pass "No incomplete GitHub URLs"
    increment_pass
fi

# Check focus is on work, not individuals
increment_check
people_pattern="Aaron|John|implemented by|authored by|@[a-zA-Z]+ (implemented|created|wrote|added)"
people_count=$(grep -cE "$people_pattern" "$FILE" 2>/dev/null || echo 0)
people_count=$(echo "$people_count" | tr -d ' \n\t')
if [[ "$people_count" != "0" && $people_count -gt 5 ]]; then
    log_warning "May focus too much on individuals ($people_count mentions) in $REPORT_NAME" "research"
    increment_warning
else
    log_pass "Focus appears to be on work, not individuals"
    increment_pass
fi
