#!/usr/bin/env bash
# Check report directory structure
# Usage: check-structure.sh REPORT_DIR

source "$(dirname "$0")/lib.sh"

REPORT_DIR="$1"
REPORT_NAME=$(basename "$REPORT_DIR")

echo "--- Checking structure ---"

# Check directory exists
increment_check
if [[ ! -d "$REPORT_DIR" ]]; then
    log_error "Report directory does not exist: $REPORT_DIR" "structure"
    increment_fail
    exit 1
fi

# Check research.md
increment_check
if [[ ! -f "$REPORT_DIR/research.md" ]]; then
    log_error "Missing research.md in $REPORT_NAME" "structure"
    increment_fail
else
    log_pass "research.md exists"
    increment_pass
fi

# Check README.md
increment_check
if [[ ! -f "$REPORT_DIR/README.md" ]]; then
    log_error "Missing README.md in $REPORT_NAME" "structure"
    increment_fail
else
    log_pass "README.md exists"
    increment_pass
fi

# Check technical.md
increment_check
if [[ ! -f "$REPORT_DIR/technical.md" ]]; then
    log_error "Missing technical.md in $REPORT_NAME" "structure"
    increment_fail
else
    log_pass "technical.md exists"
    increment_pass
fi
