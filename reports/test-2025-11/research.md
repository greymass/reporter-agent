# Research Data: 2025-11-01 to 2025-11-07

**Generated**: 2025-12-08 19:30 UTC  
**Method**: REST API (fallback mode, Events API found no data)  
**Period**: First week of November 2025 (test run)

---

## Data Sources & References

**GitHub Organizations**:
- [greymass](https://github.com/greymass)
- [wharfkit](https://github.com/wharfkit)

---

## Summary Statistics

- **Greymass**: 1 PR merged, 2 commits across 1 repository
- **Wharfkit**: 0 PRs merged, 3 commits across 1 repository
- **New Repositories**: 0 created
- **Publications**: 0 blog posts
- **Top Repositories**: sextant, wallet-plugin-web-authenticator

---

## Greymass Organization

### greymass/sextant

**Repository**: https://github.com/greymass/sextant  
**Activity**: 1 PR merged, 2 commits

**Purpose**: Account creation platform powering Anchor, MetaMask Snap, Unicove, and Web Authenticator.

#### PR #7: Adding vaulta to forbidden words

**Link**: https://github.com/greymass/sextant/pull/7  
**Merged**: 2025-11-03  

**Summary**: Added "vaulta" to the forbidden words list to prevent account creation with names containing this term (e.g., `vaultaaaa.gm`). This differs from the reserved words list, which only prevents exact matches.

**Discussion** (2 comments):
- **Initial observation**: Noted that "vaulta" was already in reserved words
- **Clarification**: Reserved words only prevent exact matches, whereas forbidden words prevent any account names containing the substring. This change prevents all variations like `vaultaaaa.gm`
- **Link**: https://github.com/greymass/sextant/pull/7

**Commits**:
- 0b5fc59: chore: adding vaulta to badwords - https://github.com/greymass/sextant/commit/0b5fc59add51c5d5ddfc5f547491c6ef5b9f677b
- d434341: Merge pull request #7 from greymass/adding-vaulta-to-bad-words - https://github.com/greymass/sextant/commit/d434341100bf5776a94d444596c81cf873e593f2

---

## Wharfkit Organization

### wharfkit/wallet-plugin-web-authenticator

**Repository**: https://github.com/wharfkit/wallet-plugin-web-authenticator  
**Activity**: 3 commits (no PRs merged in this period)

**Purpose**: Plugin enabling Web Authenticator support in WharfKit applications for onboarding and transaction signing.

**Work Summary**:
- f85fd7e (dafuga-fix-race-condition): fix: removing duplicate waitForCallback - https://github.com/wharfkit/wallet-plugin-web-authenticator/commit/f85fd7e4ef41968e30fd5f5ca2fdcaf2ed2a97e5
- 739adab (dafuga-fix-race-condition): Next version 0.3.2 - https://github.com/wharfkit/wallet-plugin-web-authenticator/commit/739adabcde27d5dddc59baf1c73a46b31b9d8335
- 6149fff (key-rename): Fixed tests - https://github.com/wharfkit/wallet-plugin-web-authenticator/commit/6149fffd1ef26f41c737a9c353ca958b7d931e4b

**Branch Context**: Work occurred on feature branches `dafuga-fix-race-condition` (2 commits) and `key-rename` (1 commit). These branches contained fixes for race conditions in callback handling and test corrections.

---

## New Repositories

No new repositories were created during this period.

---

## Publications

No blog posts were published during this period on jesta.blog or Medium @greymass.

---

## For Downstream Agents

**Summary Writer** (`agents/summary.md`):
- Very light activity week - primarily maintenance work
- Focus on the technical nature of the changes rather than individual contributions
- Reference github-projects.md for display names and descriptions

**Technical Writer** (`agents/technical.md`):
- Include PR #7 link and discussion context
- Note the distinction between reserved words (exact match) and forbidden words (substring match)
- Wharfkit commits were on feature branches, not merged to main during this period
- Review prior months' technical.md for project continuity

---

## Notes

This is a test run covering only one week (Nov 1-7, 2025) to validate the script-based workflow. Activity was minimal during this period, with only maintenance-level changes to account creation safeguards and ongoing plugin development work.
