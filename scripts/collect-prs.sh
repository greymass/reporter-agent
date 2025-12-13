#!/bin/bash
# collect-prs.sh - Collect merged pull requests from an organization
# Usage: ./collect-prs.sh <org> <since> <until>
# Example: ./collect-prs.sh greymass 2025-12-01T00:00:00Z 2025-12-08T23:59:59Z

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

echo "Collecting merged PRs from $ORG between $SINCE and $UNTIL" >&2

# Helper function to fetch comments for a PR
fetch_pr_comments() {
    local REPO=$1
    local PR_NUM=$2
    local COMMENTS=$3
    local REVIEW_COMMENTS=$4
    
    local ALL_COMMENTS="[]"
    
    # Fetch issue comments (general discussion)
    if [ "$COMMENTS" -gt 0 ]; then
        echo "      Fetching $COMMENTS discussion comments..." >&2
        local ISSUE_COMMENTS=$(gh api "/repos/$ORG/$REPO/issues/$PR_NUM/comments" 2>/dev/null | jq \
            '[.[] | 
                select(.user.login | test("bot|dependabot|renovate|cloudflare"; "i") | not) |
                {
                    type: "discussion",
                    user: .user.login,
                    created_at: .created_at,
                    body: .body
                }
            ]' || echo "[]")
        ALL_COMMENTS=$(jq -s '.[0] + .[1]' <(echo "$ALL_COMMENTS") <(echo "$ISSUE_COMMENTS"))
    fi
    
    # Fetch review comments (code-specific)
    if [ "$REVIEW_COMMENTS" -gt 0 ]; then
        echo "      Fetching $REVIEW_COMMENTS review comments..." >&2
        local CODE_COMMENTS=$(gh api "/repos/$ORG/$REPO/pulls/$PR_NUM/comments" 2>/dev/null | jq \
            '[.[] | 
                select(.user.login | test("bot|dependabot|renovate|cloudflare"; "i") | not) |
                {
                    type: "review",
                    user: .user.login,
                    created_at: .created_at,
                    path: .path,
                    body: .body
                }
            ]' || echo "[]")
        ALL_COMMENTS=$(jq -s '.[0] + .[1]' <(echo "$ALL_COMMENTS") <(echo "$CODE_COMMENTS"))
    fi
    
    echo "$ALL_COMMENTS"
}

# Step 1: Try Events API first (only works for recent data within ~30 days)
echo "Step 1: Checking Events API..." >&2

EVENTS_PRS=$(gh api "/orgs/$ORG/events" --paginate | jq \
    --arg since "$SINCE" \
    --arg until "$UNTIL" \
    '[.[] | 
        select(.type == "PullRequestEvent") | 
        select(.payload.action == "closed") | 
        select(.payload.pull_request.merged_at != null) | 
        select(.payload.pull_request.merged_at >= $since and .payload.pull_request.merged_at <= $until) |
        select(.actor.login | test("bot|dependabot|renovate"; "i") | not) |
        {
            repo: (.repo.name | split("/")[1]),
            pr_number: .payload.pull_request.number,
            title: .payload.pull_request.title,
            body: .payload.pull_request.body,
            merged_at: .payload.pull_request.merged_at,
            author: .payload.pull_request.user.login,
            url: .payload.pull_request.html_url,
            base_branch: .payload.pull_request.base.ref,
            head_branch: .payload.pull_request.head.ref,
            comments: .payload.pull_request.comments,
            review_comments: .payload.pull_request.review_comments
        }
    ] | unique_by(.repo, .pr_number)')

EVENTS_COUNT=$(echo "$EVENTS_PRS" | jq 'length')
echo "Found $EVENTS_COUNT PRs from Events API" >&2

# If Events API found PRs, fetch their comments and output
if [ "$EVENTS_COUNT" -gt 0 ]; then
    echo "Events API has coverage for this date range - using those results" >&2
    echo "Step 2: Fetching comments for PRs with discussion..." >&2
    
    # For each PR, fetch comments if they exist
    echo "$EVENTS_PRS" | jq -c '.[]' | while read -r PR; do
        REPO=$(echo "$PR" | jq -r '.repo')
        PR_NUM=$(echo "$PR" | jq -r '.pr_number')
        COMMENTS=$(echo "$PR" | jq -r '.comments // 0')
        REVIEW_COMMENTS=$(echo "$PR" | jq -r '.review_comments // 0')
        
        if [ "$COMMENTS" -gt 0 ] 2>/dev/null || [ "$REVIEW_COMMENTS" -gt 0 ] 2>/dev/null; then
            echo "    PR #$PR_NUM in $REPO..." >&2
            PR_COMMENTS=$(fetch_pr_comments "$REPO" "$PR_NUM" "$COMMENTS" "$REVIEW_COMMENTS")
            
            # Add comments to PR data
            PR=$(echo "$PR" | jq --argjson comments "$PR_COMMENTS" '. + {comment_list: $comments}')
        else
            PR=$(echo "$PR" | jq '. + {comment_list: []}')
        fi
        
        # Save to temp file
        if [ -f "/tmp/prs_with_comments_$ORG.json" ]; then
            jq -s '.[0] + [.[1]]' "/tmp/prs_with_comments_$ORG.json" <(echo "$PR") > "/tmp/prs_with_comments_$ORG.json.tmp"
            mv "/tmp/prs_with_comments_$ORG.json.tmp" "/tmp/prs_with_comments_$ORG.json"
        else
            echo "[$PR]" > "/tmp/prs_with_comments_$ORG.json"
        fi
    done
    
    if [ -f "/tmp/prs_with_comments_$ORG.json" ]; then
        FINAL_PRS=$(cat "/tmp/prs_with_comments_$ORG.json")
        rm "/tmp/prs_with_comments_$ORG.json"
    else
        FINAL_PRS="[]"
    fi
    
    TOTAL_REPOS=$(echo "$FINAL_PRS" | jq 'group_by(.repo) | length')
    
    echo "# Pull Requests: $EVENTS_COUNT across $TOTAL_REPOS repos"
    echo ""
    
    echo "$FINAL_PRS" | jq -r '
        group_by(.repo) | 
        map(
            "## " + .[0].repo + " (" + (length | tostring) + " PRs)\n" +
            (map(
                "- #" + (.pr_number | tostring) + " (" + .base_branch + ") " + (.merged_at | split("T")[0]) + " | " + .title + "\n" +
                "  " + .url + "\n" +
                (if .body and .body != "" then "  Description: " + (.body | split("\n")[0]) + "\n" else "" end) +
                (if (.comment_list | length) > 0 then 
                    "  Comments:\n" + 
                    (.comment_list | map(
                        "  - " + .user + " (" + .type + "): " + (.body | split("\n")[0])
                    ) | join("\n")) + "\n"
                else "" end)
            ) | join("\n"))
        ) | join("\n\n")
    '
    
    echo "Done!" >&2
    exit 0
fi

# Step 2: Fallback for old data - query only repos with activity in date range
echo "No PRs found in Events API - falling back to repository scan..." >&2

# Get repos that had activity in the date range
ACTIVE_REPOS=$(gh api "/orgs/$ORG/repos" --paginate | jq \
    --arg since "$SINCE" \
    --arg until "$UNTIL" \
    '[.[] | select(.pushed_at >= $since and .pushed_at <= $until) | .name]')

if [ -z "$ACTIVE_REPOS" ] || [ "$ACTIVE_REPOS" = "[]" ]; then
    echo "No active repositories found in date range" >&2
    echo "No merged pull requests found."
    exit 0
fi

REPO_COUNT=$(echo "$ACTIVE_REPOS" | jq 'length')
echo "Checking $REPO_COUNT active repositories..." >&2

echo "$ACTIVE_REPOS" | jq -r '.[]' | while read -r REPO; do
    echo "  Checking $ORG/$REPO..." >&2
    
    # Search for merged PRs in date range
    PRS=$(gh api "/repos/$ORG/$REPO/pulls?state=closed&sort=updated&direction=desc&per_page=100" \
        --paginate 2>/dev/null | jq --arg since "$SINCE" --arg until "$UNTIL" --arg repo "$REPO" \
        '[.[] | 
            select(.merged_at != null) |
            select(.merged_at >= $since and .merged_at <= $until) |
            select(.user.login | test("bot|dependabot|renovate"; "i") | not) |
            {
                repo: $repo,
                pr_number: .number,
                title: .title,
                body: .body,
                merged_at: .merged_at,
                author: .user.login,
                url: .html_url,
                base_branch: .base.ref,
                head_branch: .head.ref,
                comments: .comments,
                review_comments: .review_comments
            }
        ]' 2>/dev/null || echo "[]")
    
    PR_COUNT=$(echo "$PRS" | jq 'length')
    
    if [ "$PR_COUNT" -gt 0 ]; then
        echo "    Found $PR_COUNT merged PRs" >&2
        
        # Fetch comments for each PR
        echo "$PRS" | jq -c '.[]' | while read -r PR; do
            PR_NUM=$(echo "$PR" | jq -r '.pr_number')
            
            # Get full PR details to check comment counts (the /pulls list endpoint returns null)
            echo "      Checking PR #$PR_NUM for comments..." >&2
            PR_DETAILS=$(gh api "/repos/$ORG/$REPO/pulls/$PR_NUM" 2>/dev/null | jq '{comments, review_comments}')
            COMMENTS=$(echo "$PR_DETAILS" | jq -r '.comments // 0')
            REVIEW_COMMENTS=$(echo "$PR_DETAILS" | jq -r '.review_comments // 0')
            
            if [ "$COMMENTS" -gt 0 ] 2>/dev/null || [ "$REVIEW_COMMENTS" -gt 0 ] 2>/dev/null; then
                PR_COMMENTS=$(fetch_pr_comments "$REPO" "$PR_NUM" "$COMMENTS" "$REVIEW_COMMENTS")
                PR=$(echo "$PR" | jq --argjson comments "$PR_COMMENTS" '. + {comment_list: $comments}')
            else
                PR=$(echo "$PR" | jq '. + {comment_list: []}')
            fi
            
            # Append to results
            if [ -f "/tmp/prs_$ORG.json" ]; then
                jq -s '.[0] + [.[1]]' "/tmp/prs_$ORG.json" <(echo "$PR") > "/tmp/prs_$ORG.json.tmp"
                mv "/tmp/prs_$ORG.json.tmp" "/tmp/prs_$ORG.json"
            else
                echo "[$PR]" > "/tmp/prs_$ORG.json"
            fi
        done
    fi
done

# Step 3: Output results
if [ -f "/tmp/prs_$ORG.json" ]; then
    REPO_PRS=$(cat "/tmp/prs_$ORG.json")
    rm "/tmp/prs_$ORG.json"
    
    TOTAL_COUNT=$(echo "$REPO_PRS" | jq 'length')
    TOTAL_REPOS=$(echo "$REPO_PRS" | jq 'group_by(.repo) | length')
    
    echo "Total unique PRs found: $TOTAL_COUNT" >&2
    
    echo "# Pull Requests: $TOTAL_COUNT across $TOTAL_REPOS repos"
    echo ""
    
    echo "$REPO_PRS" | jq -r '
        group_by(.repo) | 
        map(
            "## " + .[0].repo + " (" + (length | tostring) + " PRs)\n" +
            (map(
                "- #" + (.pr_number | tostring) + " (" + .base_branch + ") " + (.merged_at | split("T")[0]) + " | " + .title + "\n" +
                "  " + .url + "\n" +
                (if .body and .body != "" then "  Description: " + (.body | split("\n")[0]) + "\n" else "" end) +
                (if (.comment_list | length) > 0 then 
                    "  Comments:\n" + 
                    (.comment_list | map(
                        "  - " + .user + " (" + .type + "): " + (.body | split("\n")[0])
                    ) | join("\n")) + "\n"
                else "" end)
            ) | join("\n"))
        ) | join("\n\n")
    '
else
    echo "No merged pull requests found."
fi

echo "Done!" >&2
