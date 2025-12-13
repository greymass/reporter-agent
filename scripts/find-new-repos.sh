#!/bin/bash
# find-new-repos.sh - Find newly created repositories and fetch their READMEs
# Usage: ./find-new-repos.sh <org> <since> <until>
# Example: ./find-new-repos.sh greymass 2025-12-01T00:00:00Z 2025-12-08T23:59:59Z

set -e

ORG="${1:?Organization name required}"
SINCE="${2:?Start date required (ISO 8601 format)}"
UNTIL="${3:?End date required (ISO 8601 format)}"

# Check if gh is installed and authenticated
if ! command -v gh &> /dev/null; then
    echo "Error: gh CLI is not installed" >&2
    exit 1
fi

if ! gh auth status &> /dev/null; then
    echo "Error: Not authenticated with GitHub CLI" >&2
    exit 1
fi

echo "Finding new repositories in $ORG between $SINCE and $UNTIL" >&2

# Step 1: Find repos created in date range
NEW_REPOS=$(gh api "/orgs/$ORG/repos" --paginate | jq \
    --arg since "$SINCE" \
    --arg until "$UNTIL" \
    '[.[] | select(.created_at >= $since and .created_at <= $until) | {
        name: .name,
        full_name: .full_name,
        description: .description,
        created_at: .created_at,
        pushed_at: .pushed_at,
        url: .html_url,
        default_branch: .default_branch,
        language: .language,
        topics: .topics
    }]')

if [ -z "$NEW_REPOS" ] || [ "$NEW_REPOS" = "[]" ]; then
    echo "No new repositories found in date range" >&2
    echo "[]"
    exit 0
fi

REPO_COUNT=$(echo "$NEW_REPOS" | jq 'length')
echo "Found $REPO_COUNT new repositories" >&2

# Step 2: For each repo, fetch README content
RESULTS="[]"

echo "$NEW_REPOS" | jq -c '.[]' | while read -r REPO_JSON; do
    REPO_NAME=$(echo "$REPO_JSON" | jq -r '.name')
    echo "Fetching README for $ORG/$REPO_NAME..." >&2
    
    # Try to get README
    README_CONTENT=$(gh api "/repos/$ORG/$REPO_NAME/readme" --jq '.content' 2>/dev/null | base64 -d 2>/dev/null || echo "")
    
    if [ -z "$README_CONTENT" ]; then
        echo "  No README found" >&2
        README_CONTENT="No README available"
    else
        README_LENGTH=$(echo "$README_CONTENT" | wc -c | tr -d ' ')
        echo "  README fetched ($README_LENGTH bytes)" >&2
    fi
    
    # Combine repo metadata with README content
    RESULT=$(echo "$REPO_JSON" | jq --arg readme "$README_CONTENT" '. + {readme: $readme}')
    
    # Append to results
    if [ -f "/tmp/new_repos_$ORG.json" ]; then
        jq -s '.[0] + [.[1]]' "/tmp/new_repos_$ORG.json" <(echo "$RESULT") > "/tmp/new_repos_$ORG.json.tmp"
        mv "/tmp/new_repos_$ORG.json.tmp" "/tmp/new_repos_$ORG.json"
    else
        echo "[$RESULT]" > "/tmp/new_repos_$ORG.json"
    fi
done

# Step 3: Output results in compact markdown format
if [ -f "/tmp/new_repos_$ORG.json" ]; then
    REPOS=$(cat "/tmp/new_repos_$ORG.json")
    rm "/tmp/new_repos_$ORG.json"
    
    REPO_COUNT=$(echo "$REPOS" | jq 'length')
    
    echo "# New Repositories: $REPO_COUNT"
    echo ""
    
    echo "$REPOS" | jq -r '.[] | 
        "## " + .name + "\n" +
        "Created: " + (.created_at | split("T")[0]) + "\n" +
        "URL: " + .url + "\n" +
        (if .description then "Description: " + .description + "\n" else "" end) +
        (if .language then "Language: " + .language + "\n" else "" end) +
        "\nREADME:\n```\n" + .readme + "\n```\n"
    '
else
    echo "No new repositories found."
fi

echo "Done!" >&2
