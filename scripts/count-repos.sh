#!/usr/bin/env bash
#
# count-repos.sh - Fetch repository and activity metrics from GitHub
#
# This script fetches various metrics from Greymass and WharfKit organizations
# and saves them to a JSON file that can be consumed by the Astro site.
#
# Usage: ./scripts/count-repos.sh
# Output: src/data/github.json (committed to git, updated by agent)
#
# Maintenance: Run quarterly or when stats become stale
# Director agent: See agent.md "Maintenance Task: Update GitHub Statistics"
#
# Optional: Set GITHUB_TOKEN environment variable for higher API rate limits
#   export GITHUB_TOKEN="ghp_xxxxx"

set -euo pipefail

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Output file - in src/data so Astro can import it
OUTPUT_DIR="src/data"
OUTPUT_FILE="$OUTPUT_DIR/github.json"

echo "Fetching GitHub metrics..."

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Set up GitHub API authentication if token is available
AUTH_HEADER=""
if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    AUTH_HEADER="Authorization: token $GITHUB_TOKEN"
    echo "  Using authenticated GitHub API (higher rate limits)"
else
    echo "  Using unauthenticated GitHub API (60 requests/hour limit)"
    echo "  Tip: Set GITHUB_TOKEN env var for higher limits"
fi

# Function to call GitHub API
github_api() {
    local url="$1"
    if [[ -n "$AUTH_HEADER" ]]; then
        curl -s -H "$AUTH_HEADER" "$url"
    else
        curl -s "$url"
    fi
}

# Function to get org metrics
get_org_metrics() {
    local org="$1"
    local org_data
    
    org_data=$(github_api "https://api.github.com/orgs/$org")
    
    # Extract metrics
    local public_repos=$(echo "$org_data" | grep -o '"public_repos": [0-9]*' | grep -o '[0-9]*' || echo "0")
    local followers=$(echo "$org_data" | grep -o '"followers": [0-9]*' | grep -o '[0-9]*' || echo "0")
    
    echo "$public_repos|$followers"
}

# Function to get recent activity (repos updated in last 30 days)
get_recent_activity() {
    local org="$1"
    local thirty_days_ago=$(date -u -d '30 days ago' +"%Y-%m-%d" 2>/dev/null || date -u -v-30d +"%Y-%m-%d")
    local repos_data
    
    # Get first page of repos (sorted by updated, most recent first)
    repos_data=$(github_api "https://api.github.com/orgs/$org/repos?sort=updated&direction=desc&per_page=100")
    
    # Count repos updated since thirty_days_ago
    local count=$(echo "$repos_data" | grep -o "\"updated_at\": \"[^\"]*\"" | cut -d'"' -f4 | while read -r date; do
        if [[ "$date" > "$thirty_days_ago" ]]; then
            echo "1"
        fi
    done | wc -l | tr -d ' ')
    
    echo "$count"
}

# Function to get language stats from recent repos
get_language_stats() {
    local org="$1"
    local repos_data
    
    repos_data=$(github_api "https://api.github.com/orgs/$org/repos?sort=updated&direction=desc&per_page=30")
    
    # Extract languages and count occurrences
    echo "$repos_data" | grep -o '"language": "[^"]*"' | cut -d'"' -f4 | grep -v '^$' | sort | uniq -c | sort -rn | head -5
}

echo ""
echo "=== Greymass ==="
greymass_metrics=$(get_org_metrics "greymass")
greymass_repos=$(echo "$greymass_metrics" | cut -d'|' -f1)
greymass_followers=$(echo "$greymass_metrics" | cut -d'|' -f2)
greymass_active=$(get_recent_activity "greymass")
echo "  Repositories: $greymass_repos"
echo "  Followers: $greymass_followers"
echo "  Active (30d): $greymass_active"

echo ""
echo "=== WharfKit ==="
wharfkit_metrics=$(get_org_metrics "wharfkit")
wharfkit_repos=$(echo "$wharfkit_metrics" | cut -d'|' -f1)
wharfkit_followers=$(echo "$wharfkit_metrics" | cut -d'|' -f2)
wharfkit_active=$(get_recent_activity "wharfkit")
echo "  Repositories: $wharfkit_repos"
echo "  Followers: $wharfkit_followers"
echo "  Active (30d): $wharfkit_active"

# Calculate totals
total_repos=$((greymass_repos + wharfkit_repos))
total_followers=$((greymass_followers + wharfkit_followers))
total_active=$((greymass_active + wharfkit_active))

echo ""
echo "=== Totals ==="
echo "  Repositories: $total_repos"
echo "  Followers: $total_followers"
echo "  Active (30d): $total_active"

# Get current timestamp
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Create JSON output (valid JavaScript module for Astro)
cat > "$OUTPUT_FILE" << JSON
{
  "updated": "$timestamp",
  "organizations": {
    "greymass": {
      "name": "Greymass",
      "repositories": $greymass_repos,
      "followers": $greymass_followers,
      "activeRepos30d": $greymass_active,
      "url": "https://github.com/greymass"
    },
    "wharfkit": {
      "name": "WharfKit",
      "repositories": $wharfkit_repos,
      "followers": $wharfkit_followers,
      "activeRepos30d": $wharfkit_active,
      "url": "https://github.com/wharfkit"
    }
  },
  "totals": {
    "repositories": $total_repos,
    "followers": $total_followers,
    "activeRepos30d": $total_active
  }
}
JSON

echo ""
echo -e "${GREEN}✓${NC} GitHub stats saved to $OUTPUT_FILE"
echo ""
echo "Usage in Astro:"
echo "  import github from '../data/github.json';"
echo "  console.log(github.totals.repositories); // $total_repos"
