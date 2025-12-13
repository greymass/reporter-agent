#!/usr/bin/env bash
# Shared library functions for audit scripts

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging functions
log_error() {
    echo -e "${RED}✗ ERROR${NC}: $1"
    echo "$2" >> /tmp/audit-errors.txt
}

log_warning() {
    echo -e "${YELLOW}⚠ WARNING${NC}: $1"
    echo "$2" >> /tmp/audit-warnings.txt
}

log_pass() {
    echo -e "${GREEN}✓${NC} $1"
}

log_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Counter functions
increment_check() {
    echo "1" >> /tmp/audit-total.txt
}

increment_pass() {
    echo "1" >> /tmp/audit-pass.txt
}

increment_fail() {
    echo "1" >> /tmp/audit-fail.txt
}

increment_warning() {
    echo "1" >> /tmp/audit-warn.txt
}
