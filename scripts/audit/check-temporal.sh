#!/usr/bin/env bash
# Check for temporal/chronological issues (future tense in past reports)
# Usage: check-temporal.sh FILE REPORT_NAME

source "$(dirname "$0")/lib.sh"

FILE="$1"
REPORT_NAME="$2"
FILE_TYPE=$(basename "$FILE")

if [[ ! -f "$FILE" ]]; then
    exit 1
fi

# Check for future tense phrases
increment_check
future_pattern="will be|will have|going to|planning to|upcoming"
future_count=$(grep -ciE "$future_pattern" "$FILE" 2>/dev/null || echo 0)
future_count=$(echo "$future_count" | tr -d ' \n\t')

if [[ "$future_count" != "0" && $future_count -gt 0 ]]; then
    log_warning "Found $future_count future tense phrases in $REPORT_NAME/$FILE_TYPE" "temporal"
    increment_warning
    # Show examples
    grep -niE "$future_pattern" "$FILE" 2>/dev/null | head -3 | while read -r line; do
        echo "    ${line:0:100}..."
    done
else
    log_pass "No future tense detected"
    increment_pass
fi
