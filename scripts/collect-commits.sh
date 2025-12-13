#!/bin/bash
# collect-commits.sh - Collect commits from all active branches in an organization
# Usage: ./collect-commits.sh <org> <since> <until>
# Example: ./collect-commits.sh greymass 2025-12-01T00:00:00Z 2025-12-08T23:59:59Z

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

echo "Collecting commits from $ORG between $SINCE and $UNTIL" >&2

# Step 1: Use Events API to discover active repos and branches (much more efficient)
echo "Step 1: Discovering activity via Events API..." >&2

PUSH_EVENTS=$(gh api "/orgs/$ORG/events" --paginate | jq \
    --arg since "$SINCE" \
    --arg until "$UNTIL" \
    '[.[] | 
        select(.type == "PushEvent") |
        select(.created_at >= $since and .created_at <= $until) |
        select(.actor.login | test("bot|dependabot|renovate"; "i") | not) |
        {
            repo: .repo.name | split("/")[1],
            branch: (.payload.ref | sub("refs/heads/"; "")),
            created_at: .created_at
        }
    ] | 
    group_by(.repo + "/" + .branch) |
    map({repo: .[0].repo, branch: .[0].branch}) |
    unique')

# Count unique repo/branch combinations
ACTIVE_COUNT=$(echo "$PUSH_EVENTS" | jq 'length')

if [ "$ACTIVE_COUNT" -eq 0 ]; then
    echo "No push events found in date range via Events API" >&2
    echo "Falling back to full repository scan..." >&2
    
    # Fallback: Check all repos (for date ranges >30 days or sparse activity)
    ACTIVE_REPOS=$(gh api "/orgs/$ORG/repos" --paginate | jq \
        --arg since "$SINCE" \
        --arg until "$UNTIL" \
        '[.[] | select(.pushed_at >= $since and .pushed_at <= $until) | .name]')
    
    if [ -z "$ACTIVE_REPOS" ] || [ "$ACTIVE_REPOS" = "[]" ]; then
        echo "No active repositories found in date range" >&2
        echo "No commits found."
        exit 0
    fi
    
    REPO_COUNT=$(echo "$ACTIVE_REPOS" | jq 'length')
    echo "Found $REPO_COUNT active repositories" >&2
    
    # Get all branches for each repo
    echo "$ACTIVE_REPOS" | jq -r '.[]' | while read -r REPO; do
        echo "Processing $ORG/$REPO..." >&2
        
        BRANCHES=$(gh api "/repos/$ORG/$REPO/branches" --paginate --jq '[.[].name | select(test("dependabot|renovate|bot"; "i") | not)]' 2>/dev/null || echo "[]")
        
        if [ "$BRANCHES" = "[]" ]; then
            echo "  No branches found, skipping..." >&2
            continue
        fi
        
        BRANCH_COUNT=$(echo "$BRANCHES" | jq 'length')
        echo "  Found $BRANCH_COUNT branches" >&2
        
        echo "$BRANCHES" | jq -r '.[]' | while read -r BRANCH; do
            echo "{\"repo\":\"$REPO\",\"branch\":\"$BRANCH\"}" >> "/tmp/repo_branches_$ORG.json"
        done
    done
    
    if [ -f "/tmp/repo_branches_$ORG.json" ]; then
        PUSH_EVENTS=$(jq -s '.' "/tmp/repo_branches_$ORG.json")
        rm "/tmp/repo_branches_$ORG.json"
    else
        echo "No branches to check" >&2
        echo "No commits found."
        exit 0
    fi
else
    echo "Found $ACTIVE_COUNT active repo/branch combinations from Events API" >&2
fi

# Step 2: For each repo/branch combination, get commits
echo "Step 2: Fetching commits for active branches..." >&2

echo "$PUSH_EVENTS" | jq -c '.[]' | while read -r ITEM; do
    REPO=$(echo "$ITEM" | jq -r '.repo')
    BRANCH=$(echo "$ITEM" | jq -r '.branch')
    
    echo "  Checking $ORG/$REPO @ $BRANCH..." >&2
    
    COMMITS=$(gh api "/repos/$ORG/$REPO/commits?sha=$BRANCH&since=$SINCE&until=$UNTIL&per_page=100" \
        --paginate 2>/dev/null | jq --arg repo "$REPO" --arg branch "$BRANCH" \
        '[.[] | 
            select(.commit.author.name | test("bot|dependabot|renovate"; "i") | not) |
            select(.commit.message | test("^(chore\\(deps\\)|bump |Bump )|dependabot"; "i") | not) |
            {
                repo: $repo,
                branch: $branch,
                sha: .sha[0:7],
                full_sha: .sha,
                message: .commit.message,
                author: .commit.author.name,
                author_email: .commit.author.email,
                date: .commit.author.date,
                url: .html_url
            }
        ]' 2>/dev/null || echo "[]")
    
    COMMIT_COUNT=$(echo "$COMMITS" | jq 'length')
    
    if [ "$COMMIT_COUNT" -gt 0 ]; then
        echo "    Found $COMMIT_COUNT commits" >&2
        
        # Append to results
        if [ -f "/tmp/commits_$ORG.json" ]; then
            jq -s '.[0] + .[1]' "/tmp/commits_$ORG.json" <(echo "$COMMITS") > "/tmp/commits_$ORG.json.tmp"
            mv "/tmp/commits_$ORG.json.tmp" "/tmp/commits_$ORG.json"
        else
            echo "$COMMITS" > "/tmp/commits_$ORG.json"
        fi
    fi
done

# Step 3: Output results and clean up
if [ -f "/tmp/commits_$ORG.json" ]; then
    # Remove duplicates based on full_sha (same commit may appear in multiple branches)
    COMMITS=$(jq 'unique_by(.full_sha) | sort_by(.repo, .date)' "/tmp/commits_$ORG.json")
    rm "/tmp/commits_$ORG.json"
    
    # Convert to ultra-compact markdown format
    TOTAL_COMMITS=$(echo "$COMMITS" | jq 'length')
    TOTAL_REPOS=$(echo "$COMMITS" | jq 'group_by(.repo) | length')
    
    echo "# Commits: $TOTAL_COMMITS across $TOTAL_REPOS repos"
    echo ""
    
    echo "$COMMITS" | jq -r '
        group_by(.repo) | 
        map(
            "## " + .[0].repo + " (" + (length | tostring) + " commits)\n" +
            (map(
                "- " + .sha + " (" + .branch + ") " + (.date | split("T")[0]) + " | " + (.message | split("\n")[0]) + "\n" +
                "  " + .url
            ) | join("\n"))
        ) | join("\n\n")
    '
else
    echo "No commits found."
fi

echo "Done!" >&2
