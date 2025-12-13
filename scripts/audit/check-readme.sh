#!/usr/bin/env bash
# Check README.md requirements (from agents/summary.md)
# Usage: check-readme.sh FILE REPORT_NAME

source "$(dirname "$0")/lib.sh"

FILE="$1"
REPORT_NAME="$2"

echo "--- Checking README.md requirements ---"

if [[ ! -f "$FILE" ]]; then
    exit 1
fi

# Check for navigation links
increment_check
if grep -q "^\*\*Navigation\*\*:" "$FILE"; then
    log_pass "Has Navigation section"
    increment_pass
else
    log_warning "Missing Navigation links in $REPORT_NAME" "readme"
    increment_warning
fi

# Check for cross-reference links
increment_check
if grep -q "Also available:.*Technical Report.*Research Data" "$FILE"; then
    log_pass "Has cross-reference links"
    increment_pass
else
    log_error "Missing cross-reference links in $REPORT_NAME" "readme"
    increment_fail
fi

# Check for Highlights section
increment_check
if grep -q "^### Highlights" "$FILE"; then
    log_pass "Has Highlights section"
    increment_pass
else
    log_error "Missing Highlights section in $REPORT_NAME" "readme"
    increment_fail
fi

# Check word count (400-1000 words)
increment_check
word_count=$(wc -w < "$FILE" | tr -d ' ')
if [[ $word_count -ge 400 && $word_count -le 1000 ]]; then
    log_pass "Word count within range ($word_count words)"
    increment_pass
elif [[ $word_count -lt 400 ]]; then
    log_warning "README is short ($word_count words, target 400-1000)" "readme"
    increment_warning
else
    log_warning "README is long ($word_count words, target 400-1000)" "readme"
    increment_warning
fi

# Check for banned technical terms
increment_check
# Enhanced pattern to catch compound terms
banned_pattern="backend|frontend|infrastructure|refactor|refactoring|architecture|migration|framework"
banned_pattern="$banned_pattern|SvelteKit|React Native|React|Express|Vue|Angular"
banned_pattern="$banned_pattern|API|SDK|database|databases"
banned_pattern="$banned_pattern|server-side|client-side|server side|client side"
banned_pattern="$banned_pattern|\bserver\b|\bservers\b"
banned_pattern="$banned_pattern|component architecture|modern architecture|basic interface"
banned_count=$(grep -ciE "$banned_pattern" "$FILE" 2>/dev/null || echo 0)
banned_count=$(echo "$banned_count" | tr -d ' \n\t')
if [[ "$banned_count" != "0" && $banned_count -gt 0 ]]; then
    log_error "Found $banned_count banned technical terms in $REPORT_NAME" "readme"
    increment_fail
    # Show examples
    grep -niE "$banned_pattern" "$FILE" 2>/dev/null | head -3 | while read -r line; do
        echo "    ${line:0:100}..."
    done
else
    log_pass "No banned technical terms"
    increment_pass
fi

# Check for GitHub URLs (should NOT have any)
increment_check
github_count=$(grep -c "https://github.com/" "$FILE" 2>/dev/null || echo 0)
github_count=$(echo "$github_count" | tr -d ' \n\t')
if [[ "$github_count" != "0" && $github_count -gt 0 ]]; then
    log_error "Found $github_count GitHub URLs in $REPORT_NAME (should use plain language)" "readme"
    increment_fail
else
    log_pass "No GitHub URLs (correct for executive summary)"
    increment_pass
fi

# Check for PR numbers (should NOT have any)
increment_check
pr_count=$(grep -cE "PR #[0-9]+|#[0-9]+\)" "$FILE" 2>/dev/null || echo 0)
pr_count=$(echo "$pr_count" | tr -d ' \n\t')
if [[ "$pr_count" != "0" && $pr_count -gt 0 ]]; then
    log_error "Found $pr_count PR number references in $REPORT_NAME (should avoid technical details)" "readme"
    increment_fail
else
    log_pass "No PR numbers (correct for executive summary)"
    increment_pass
fi
