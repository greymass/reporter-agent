#!/bin/bash
# check-blogs.sh - Check RSS feeds for blog posts in date range
# Usage: ./check-blogs.sh <since> <until> <feed_url1> [feed_url2] [...]
# Example: ./check-blogs.sh 2025-12-01 2025-12-08 https://jesta.blog/feed https://medium.com/feed/@greymass

set -e

SINCE="${1:?Start date required (YYYY-MM-DD format)}"
UNTIL="${2:?End date required (YYYY-MM-DD format)}"
shift 2
FEED_URLS=("$@")

if [ ${#FEED_URLS[@]} -eq 0 ]; then
    echo "Error: At least one RSS feed URL required" >&2
    exit 1
fi

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed" >&2
    exit 1
fi

echo "Checking ${#FEED_URLS[@]} RSS feeds for posts between $SINCE and $UNTIL" >&2

# Convert dates to seconds since epoch for comparison
SINCE_EPOCH=$(date -j -f "%Y-%m-%d" "$SINCE" "+%s" 2>/dev/null || date -d "$SINCE" "+%s" 2>/dev/null)
UNTIL_EPOCH=$(date -j -f "%Y-%m-%d" "$UNTIL 23:59:59" "+%s" 2>/dev/null || date -d "$UNTIL 23:59:59" "+%s" 2>/dev/null)

ALL_POSTS=()

for FEED_URL in "${FEED_URLS[@]}"; do
    echo "Fetching $FEED_URL..." >&2
    
    # Fetch RSS feed
    RSS_CONTENT=$(curl -s "$FEED_URL" 2>/dev/null || echo "")
    
    if [ -z "$RSS_CONTENT" ]; then
        echo "  Failed to fetch feed" >&2
        continue
    fi
    
    # Extract post data line by line
    IN_ITEM=false
    TITLE=""
    LINK=""
    PUBDATE=""
    
    while IFS= read -r line; do
        if echo "$line" | grep -q "<item>"; then
            IN_ITEM=true
            TITLE=""
            LINK=""
            PUBDATE=""
        elif echo "$line" | grep -q "</item>"; then
            if [ -n "$TITLE" ] && [ -n "$LINK" ] && [ -n "$PUBDATE" ]; then
                # Parse date and check range
                POST_EPOCH=$(date -j -f "%a, %d %b %Y %H:%M:%S %z" "$PUBDATE" "+%s" 2>/dev/null || \
                             date -d "$PUBDATE" "+%s" 2>/dev/null || echo "0")
                
                if [ "$POST_EPOCH" -ge "$SINCE_EPOCH" ] && [ "$POST_EPOCH" -le "$UNTIL_EPOCH" ]; then
                    ALL_POSTS+=("$TITLE|$LINK|$PUBDATE|$FEED_URL")
                fi
            fi
            IN_ITEM=false
        elif $IN_ITEM; then
            if echo "$line" | grep -q "<title>"; then
                TITLE=$(echo "$line" | sed 's/.*<title[^>]*>\(<!\[CDATA\[\)\?\(.*\)\(\]\]>\)\?<\/title>.*/\2/' | sed 's/<[^>]*>//g')
            elif echo "$line" | grep -q "<link>"; then
                LINK=$(echo "$line" | sed 's/.*<link>\(.*\)<\/link>.*/\1/')
            elif echo "$line" | grep -q "<pubDate>"; then
                PUBDATE=$(echo "$line" | sed 's/.*<pubDate>\(.*\)<\/pubDate>.*/\1/')
            fi
        fi
    done <<< "$RSS_CONTENT"
done

# Output in compact markdown format
if [ ${#ALL_POSTS[@]} -eq 0 ]; then
    echo "No blog posts found."
else
    echo "# Blog Posts: ${#ALL_POSTS[@]}"
    echo ""
    
    for post in "${ALL_POSTS[@]}"; do
        IFS='|' read -r title link pubdate feed <<< "$post"
        echo "## $title"
        echo "Published: $pubdate"
        echo "URL: $link"
        echo ""
    done
fi

echo "Done!" >&2
