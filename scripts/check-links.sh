#!/bin/bash
# Check for untransformed markdown links in generated HTML

echo "🔍 Checking for broken/untransformed links in generated HTML..."
echo ""

DIST_DIR="dist"
FOUND_ISSUES=0

# Check for any remaining .md file links in generated HTML (excluding Tailwind classes like md:)
if grep -rE 'href="[^"]*\.md["\?#)]' "$DIST_DIR" --include="*.html" 2>/dev/null | grep -v "https://github.com"; then
    echo ""
    echo "❌ Found untransformed .md links in HTML"
    FOUND_ISSUES=1
else
    echo "✅ No untransformed .md links found"
fi

echo ""

# Check for relative path issues (../ in href that weren't caught, excluding already transformed GitHub URLs)
RELATIVE_PATHS=$(grep -rE 'href="\.\./' "$DIST_DIR" --include="*.html" 2>/dev/null | grep -v "https://" | head -10)
if [ -n "$RELATIVE_PATHS" ]; then
    echo "$RELATIVE_PATHS"
    echo ""
    echo "⚠️  Found relative ../ paths in HTML (may need transformation)"
    FOUND_ISSUES=1
else
    echo "✅ No problematic relative paths found"
fi

echo ""

# Report summary
if [ $FOUND_ISSUES -eq 0 ]; then
    echo "✅ All links appear to be properly transformed!"
    exit 0
else
    echo "❌ Found issues that may need attention"
    exit 1
fi
