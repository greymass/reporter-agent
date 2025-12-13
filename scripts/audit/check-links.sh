#!/usr/bin/env bash
# Check links in markdown files
# Usage: check-links.sh FILE REPORT_NAME

source "$(dirname "$0")/lib.sh"

FILE="$1"
REPORT_NAME="$2"
FILE_TYPE=$(basename "$FILE")
REPORT_DIR=$(dirname "$FILE")

echo "--- Checking links in $FILE_TYPE ---"

if [[ ! -f "$FILE" ]]; then
    exit 1
fi

# Check for malformed markdown links (missing closing paren)
increment_check
malformed_count=$(grep -cE '\[.*\]\([^)]*$' "$FILE" 2>/dev/null || echo 0)
malformed_count=$(echo "$malformed_count" | tr -d ' \n\t')
if [[ "$malformed_count" != "0" && $malformed_count -gt 0 ]]; then
    log_error "Found $malformed_count malformed markdown links in $REPORT_NAME/$FILE_TYPE" "links"
    increment_fail
    grep -nE '\[.*\]\([^)]*$' "$FILE" 2>/dev/null | head -3 | while read -r line; do
        echo "    Line: $line"
    done
else
    log_pass "No malformed markdown links"
    increment_pass
fi

# Check for empty markdown links
increment_check
empty_count=$(grep -cE '\[.*\]\(\s*\)' "$FILE" 2>/dev/null || echo 0)
empty_count=$(echo "$empty_count" | tr -d ' \n\t')
if [[ "$empty_count" != "0" && $empty_count -gt 0 ]]; then
    log_error "Found $empty_count empty markdown links in $REPORT_NAME/$FILE_TYPE" "links"
    increment_fail
    grep -nE '\[.*\]\(\s*\)' "$FILE" 2>/dev/null | head -3 | while read -r line; do
        echo "    Line: $line"
    done
else
    log_pass "No empty markdown links"
    increment_pass
fi

# Check relative links point to existing files
increment_check
broken_relative=0
while IFS= read -r link; do
    url=$(echo "$link" | sed -n 's/.*](\([^)]*\)).*/\1/p')
    
    # Skip absolute URLs
    [[ "$url" =~ ^https?:// ]] && continue
    
    # Skip anchor-only links
    [[ "$url" =~ ^# ]] && continue

    # Strip anchor from URL for file existence check
    url_without_anchor="${url%%#*}"

    # Check if file exists
    target_path="$REPORT_DIR/$url_without_anchor"
    if [[ ! -f "$target_path" ]]; then
        ((broken_relative++))
        [[ $broken_relative -le 3 ]] && echo "    Broken: $url"
    fi
done < <(grep -oE '\[.*\]\([^)]+\)' "$FILE" 2>/dev/null || true)

if [[ $broken_relative -gt 0 ]]; then
    log_error "Found $broken_relative broken relative links in $REPORT_NAME/$FILE_TYPE" "links"
    increment_fail
else
    log_pass "All relative links valid"
    increment_pass
fi

# Check GitHub URLs are properly formed
increment_check
bad_github=0

# Incomplete GitHub URLs
incomplete_gh=$(grep -oE 'https://github\.com/[a-zA-Z0-9_-]+/*\)' "$FILE" 2>/dev/null | grep -cE '/\)$' || echo 0)
incomplete_gh=$(echo "$incomplete_gh" | tr -d ' \n\t')
[[ -z "$incomplete_gh" ]] && incomplete_gh=0
bad_github=$((bad_github + incomplete_gh))

# Typos in domain
typo_gh=$(grep -ciE 'https://(githib|guthub|github\.co[^m])' "$FILE" 2>/dev/null || echo 0)
typo_gh=$(echo "$typo_gh" | tr -d ' \n\t')
[[ -z "$typo_gh" ]] && typo_gh=0
bad_github=$((bad_github + typo_gh))

if [[ $bad_github -gt 0 ]]; then
    log_error "Found $bad_github malformed GitHub URLs in $REPORT_NAME/$FILE_TYPE" "links"
    increment_fail
    grep -nE 'https://github\.com/[a-zA-Z0-9_-]+/*\)|https://(githib|guthub|github\.co[^m])' "$FILE" 2>/dev/null | head -3 | while read -r line; do
        echo "    $line"
    done
else
    log_pass "All GitHub URLs properly formed"
    increment_pass
fi

# Check navigation links in README.md
if [[ "$FILE_TYPE" == "README.md" ]]; then
    increment_check
    nav_line=$(grep "^\*\*Navigation\*\*:" "$FILE" 2>/dev/null || echo "")
    broken_nav=0
    
    if [[ -n "$nav_line" ]]; then
        while IFS= read -r nav_link; do
            target=$(echo "$nav_link" | sed -n 's/.*](\.\.\([^)]*\)).*/\1/p')
            if [[ -n "$target" ]]; then
                nav_target="reports$target"
                if [[ ! -f "$nav_target" ]]; then
                    ((broken_nav++))
                    echo "    Broken nav link: $target"
                fi
            fi
        done < <(echo "$nav_line" | grep -oE '\[.*\]\(\.\.[^)]+\)' || true)
        
        if [[ $broken_nav -gt 0 ]]; then
            log_error "Found $broken_nav broken navigation links in $REPORT_NAME/$FILE_TYPE" "links"
            increment_fail
        else
            log_pass "All navigation links valid"
            increment_pass
        fi
    else
        # No navigation section - don't count as error here (handled elsewhere)
        :
    fi
fi
