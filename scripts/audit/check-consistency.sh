#!/usr/bin/env bash
# Check cross-file consistency
# Usage: check-consistency.sh REPORT_DIR REPORT_NAME

source "$(dirname "$0")/lib.sh"

REPORT_DIR="$1"
REPORT_NAME="$2"

echo "--- Checking cross-file consistency ---"

if [[ ! -d "$REPORT_DIR" ]]; then
    exit 1
fi

# Check technical.md has metrics
if [[ -f "$REPORT_DIR/technical.md" ]]; then
    increment_check
    tech_pr_count=$(grep "Total PRs merged:" "$REPORT_DIR/technical.md" | grep -oE "[0-9]+" | head -1 2>/dev/null || echo "0")
    tech_pr_count=$(echo "$tech_pr_count" | tr -d ' \n\t')
    
    if [[ "$tech_pr_count" != "0" && $tech_pr_count -gt 0 ]]; then
        log_pass "technical.md has metrics"
        increment_pass
    else
        log_warning "technical.md may be missing PR count metrics in $REPORT_NAME" "consistency"
        increment_warning
    fi
fi

# Check README.md cross-reference links point to existing files
if [[ -f "$REPORT_DIR/README.md" ]]; then
    increment_check
    if grep -q "Technical Report.*technical.md" "$REPORT_DIR/README.md"; then
        if [[ -f "$REPORT_DIR/technical.md" ]]; then
            log_pass "Cross-reference to technical.md is valid"
            increment_pass
        else
            log_error "README.md links to technical.md but file doesn't exist in $REPORT_NAME" "consistency"
            increment_fail
        fi
    fi
    
    increment_check
    if grep -q "Research Data.*research.md" "$REPORT_DIR/README.md"; then
        if [[ -f "$REPORT_DIR/research.md" ]]; then
            log_pass "Cross-reference to research.md is valid"
            increment_pass
        else
            log_error "README.md links to research.md but file doesn't exist in $REPORT_NAME" "consistency"
            increment_fail
        fi
    fi
fi
