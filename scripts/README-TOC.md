# Table of Contents Link Validation

## Problem

Markdown anchor generation follows specific rules that may not match manually-written TOC links:

- Spaces → hyphens (`-`)
- **Slashes (`/`) → removed entirely** (not converted to hyphens)
- Special characters → removed
- Uppercase → lowercase
- Multiple hyphens → collapsed to single hyphen

### Example

```markdown
### greymass/web-authenticator
```

**Incorrect TOC link**: `#greymass-web-authenticator` ❌  
**Correct TOC link**: `#greymassweb-authenticator` ✅

The slash is removed, not converted to hyphen!

## Tools

### 1. Check TOC Links (Integrated into Audit)

TOC link validation is now part of the standard audit:

```bash
./scripts/audit/check-technical.sh reports/2025-11/technical.md
```

Output:
```
✓ All TOC links are valid
```

or

```
✗ ERROR: Found 15 broken TOC links (run scripts/fix-toc-links.py)
```

### 2. Fix TOC Links Automatically

```bash
# Dry run (show what would be fixed)
python3 scripts/fix-toc-links.py reports/2025-11/technical.md --dry-run

# Actually fix the links
python3 scripts/fix-toc-links.py reports/2025-11/technical.md
```

### 3. Fix All Reports

```bash
for report in reports/*/technical.md; do
    python3 scripts/fix-toc-links.py "$report"
done
```

## Anchor Generation Rules

The scripts use GitHub-flavored markdown anchor generation:

1. Remove code formatting (backticks)
2. Convert to lowercase
3. Replace spaces with hyphens
4. **Remove all special characters** (including `/`, `(`, `)`, etc.)
5. Keep only word characters, spaces, and hyphens: `[a-z0-9-]`
6. Collapse multiple hyphens to single hyphen
7. Strip leading/trailing hyphens

### Examples

| Heading | Anchor |
|---------|--------|
| `greymass/web-authenticator` | `#greymassweb-authenticator` |
| `Cross-Repository Insights` | `#cross-repository-insights` |
| `aaroncox/vaulta-contracts` | `#aaroncoxvaulta-contracts` |
| `wharfkit/msigs` | `#wharfkitmsigs` |
| `New Repositories (2024)` | `#new-repositories-2024` |

## Astro Site Compatibility

The anchor generation rules match both:
- **GitHub-rendered markdown** (in repo browsing)
- **Astro-generated static site** (using standard markdown-it or similar)

Both renderers follow similar anchor generation rules, so links work in both contexts.

## Testing

To verify links work in both contexts:

1. **In GitHub**: Click TOC links in rendered markdown
2. **In Astro dev**: `bun run dev` and click TOC links
3. **After changes**: Run `./scripts/audit/check-technical.sh`

## Common Issues

### Issue: Slash in Repository Names

```markdown
### greymass/unicove

TOC link: [greymass/unicove](#greymass-unicove)  ❌
Should be: [greymass/unicove](#greymassunicove) ✅
```

**Fix**: Remove hyphen before repo name

### Issue: Hyphen in Repository Names

```markdown
### greymass/web-authenticator

TOC link: [greymass/web-authenticator](#greymass-web-authenticator) ❌
Should be: [greymass/web-authenticator](#greymassweb-authenticator)  ✅
```

**Fix**: Slash is removed, but hyphen in `web-authenticator` stays

### Issue: Organization Slash

```markdown
### aaroncox/vaulta-contracts

TOC link: [aaroncox/vaulta-contracts](#aaroncox-vaulta-contracts)  ❌
Should be: [aaroncox/vaulta-contracts](#aaroncoxvaulta-contracts)   ✅
```

**Fix**: Remove all slashes

## Maintenance

When adding new sections to technical reports:

1. **Write heading**: `### greymass/new-repo`
2. **Add to TOC**: `[greymass/new-repo](#greymass-new-repo)` ⚠️ **This is wrong!**
3. **Run fixer**: `python3 scripts/fix-toc-links.py reports/YYYY-MM/technical.md`
4. **Verify**: TOC link is now `#greymassnew-repo` ✅

Or use the correct anchor from the start by remembering to remove slashes.

## Implementation

The TOC checker is a Python script embedded in `scripts/audit/check-technical.sh`:

- Extracts all headings and generates their anchors
- Finds TOC section boundaries
- Checks each `[text](#anchor)` link against actual headings
- Reports count of broken links

The fixer script (`scripts/fix-toc-links.py`) automatically corrects links.

Both scripts use identical anchor generation logic to ensure consistency.
