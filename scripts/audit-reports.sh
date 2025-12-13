#!/usr/bin/env bash
#
# Report Quality Audit - Main Orchestrator
# Runs all audit checks and generates summary
#
# Usage: ./scripts/audit-reports.sh [YYYY-MM]
#        (omit date to check all reports)

REPORTS_DIR="reports"
TARGET_REPORT="${1:-}"
AUDIT_DIR="$(dirname "$0")/audit"

# Clean temp files
rm -f /tmp/audit-*.txt

echo "========================================"
echo "Report Quality Audit"
echo "========================================"
echo ""

# Run audit for a single report
audit_report() {
    local report_dir="$1"
    local report_name=$(basename "$report_dir")
    
    echo ""
    echo "========================================"
    echo "Checking: $report_name"
    echo "========================================"
    
    # Structure check
    "$AUDIT_DIR/check-structure.sh" "$report_dir"
    
    # File-specific requirement checks
    [[ -f "$report_dir/research.md" ]] && "$AUDIT_DIR/check-research.sh" "$report_dir/research.md" "$report_name"
    [[ -f "$report_dir/README.md" ]] && "$AUDIT_DIR/check-readme.sh" "$report_dir/README.md" "$report_name"
    [[ -f "$report_dir/technical.md" ]] && "$AUDIT_DIR/check-technical.sh" "$report_dir/technical.md" "$report_name"
    
    # Link checks on each file
    [[ -f "$report_dir/research.md" ]] && "$AUDIT_DIR/check-links.sh" "$report_dir/research.md" "$report_name"
    [[ -f "$report_dir/README.md" ]] && "$AUDIT_DIR/check-links.sh" "$report_dir/README.md" "$report_name"
    [[ -f "$report_dir/technical.md" ]] && "$AUDIT_DIR/check-links.sh" "$report_dir/technical.md" "$report_name"
    
    # Temporal checks on each file
    [[ -f "$report_dir/research.md" ]] && "$AUDIT_DIR/check-temporal.sh" "$report_dir/research.md" "$report_name"
    [[ -f "$report_dir/README.md" ]] && "$AUDIT_DIR/check-temporal.sh" "$report_dir/README.md" "$report_name"
    [[ -f "$report_dir/technical.md" ]] && "$AUDIT_DIR/check-temporal.sh" "$report_dir/technical.md" "$report_name"
    
    # Cross-file consistency checks
    "$AUDIT_DIR/check-consistency.sh" "$report_dir" "$report_name"
}

# Main execution
if [[ -n "$TARGET_REPORT" ]]; then
    # Audit single report
    if [[ -d "$REPORTS_DIR/$TARGET_REPORT" ]]; then
        audit_report "$REPORTS_DIR/$TARGET_REPORT"
    else
        echo "Report not found: $REPORTS_DIR/$TARGET_REPORT"
        exit 1
    fi
else
    # Audit all reports
    for report_dir in "$REPORTS_DIR"/[0-9][0-9][0-9][0-9]-[0-9][0-9]; do
        [[ -d "$report_dir" ]] && audit_report "$report_dir"
    done
fi

# Generate summary
echo ""
echo "========================================"
echo "Audit Summary"
echo "========================================"

TOTAL=$(wc -l < /tmp/audit-total.txt 2>/dev/null || echo 0)
PASSED=$(wc -l < /tmp/audit-pass.txt 2>/dev/null || echo 0)
FAILED=$(wc -l < /tmp/audit-fail.txt 2>/dev/null || echo 0)
WARNED=$(wc -l < /tmp/audit-warn.txt 2>/dev/null || echo 0)

echo "Total checks: $TOTAL"
echo -e "\033[0;32mPassed: $PASSED\033[0m"
echo -e "\033[1;33mWarnings: $WARNED\033[0m"
echo -e "\033[0;31mFailed: $FAILED\033[0m"
echo ""

# Show errors if any
if [[ -f /tmp/audit-errors.txt ]] && [[ -s /tmp/audit-errors.txt ]]; then
    echo "Error types:"
    sort /tmp/audit-errors.txt | uniq -c | sort -rn | head -10
    echo ""
fi

# Exit code
[[ $FAILED -eq 0 ]] && exit 0 || exit 1
