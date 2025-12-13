# Research Data: October 2024

**Generated**: 2025-12-08 21:43 UTC  
**Method**: REST API (Historical data >30 days old)  
**Rate Limit Remaining**: 4293 core, 30 search

---

## Data Sources & References

**GitHub Organizations**:
- [greymass](https://github.com/greymass)
- [wharfkit](https://github.com/wharfkit)

**Publications**:
- [Medium @greymass RSS](https://medium.com/feed/@greymass)

---

## Summary Statistics

- **Greymass**: 32 PRs merged across 4 repositories
- **Wharfkit**: 3 PRs merged across 2 repositories
- **New Repositories**: 1 created (2nicove-api)
- **Publications**: 1 Medium article
- **Top Repositories**: unicove (26 PRs), unicove-v1 (3 PRs), antelope-snap (2 PRs), website (1 PR)

---

## Greymass Organization

### greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Activity**: 26 PRs merged

#### PR #185: adapt full variant for asset component

**Link**: https://github.com/greymass/unicove/pull/185  
**Merged**: 2024-10-31

Adapted the asset component to support a full variant for improved display flexibility.

#### PR #184: Design and content pass

**Link**: https://github.com/greymass/unicove/pull/184  
**Merged**: 2024-10-30

Design and content refinements across the application for improved user experience.

#### PR #181: style: increase font sizing

**Link**: https://github.com/greymass/unicove/pull/181  
**Merged**: 2024-10-28

Increased font sizing throughout the application for better readability.

#### PR #180: Tooltip component

**Link**: https://github.com/greymass/unicove/pull/180  
**Merged**: 2024-10-25

Added tooltip component for providing contextual information to users.

#### PR #179: Fix default asset symbol in overview page

**Link**: https://github.com/greymass/unicove/pull/179  
**Merged**: 2024-10-28

Fixed the default asset symbol display in the account overview page.

#### PR #178: Resources page refactor and ui update

**Link**: https://github.com/greymass/unicove/pull/178  
**Merged**: 2024-10-29

Refactored the resources page with updated UI to improve resource management interface.

#### PR #176: chore: add install package command

**Link**: https://github.com/greymass/unicove/pull/176  
**Merged**: 2024-10-22

**Body Summary**: Added a Makefile command `make install package_name` that runs `bun install --yarn package_name` to keep the lockfile in sync when installing new packages.

#### PR #174: replace the value of system token in balances with liquid

**Link**: https://github.com/greymass/unicove/pull/174  
**Merged**: 2024-10-21

Updated the system token value in balances to display liquid balance instead of total balance.

#### PR #168: Homepage

**Link**: https://github.com/greymass/unicove/pull/168  
**Merged**: 2024-10-28

Implemented the Unicove homepage with new design and content.

#### PR #167: refactor resource rent price calculation

**Link**: https://github.com/greymass/unicove/pull/167  
**Merged**: 2024-10-21

**Body Summary**: 
1. Moved price calculation method to utils
2. Fixed REX price calculation for NET and CPU resources

#### PR #166: add acount overview pages

**Link**: https://github.com/greymass/unicove/pull/166  
**Merged**: 2024-10-21

Added account overview pages to display account information and statistics.

#### PR #165: Style wallet selection

**Link**: https://github.com/greymass/unicove/pull/165  
**Merged**: 2024-10-09

Styled the wallet selection interface for improved visual consistency.

#### PR #162: feat: basic error page

**Link**: https://github.com/greymass/unicove/pull/162  
**Merged**: 2024-10-09

**Body Summary**: Added a basic error page that re-uses the default layout so users can still navigate when searches fail. The page is applied at `/src/routes/[network]/+layout.svelte` but alternative designs are needed for other error scenarios like `/en/asdf` or `/en/eos/asdf`.

#### PR #161: style: choose wallet type page

**Link**: https://github.com/greymass/unicove/pull/161  
**Merged**: 2024-10-09

Styled the wallet type selection page.

#### PR #160: style: signup step indicator

**Link**: https://github.com/greymass/unicove/pull/160  
**Merged**: 2024-10-09

Styled the signup step indicator for better visual clarity during account creation.

#### PR #158: Merging RAM interfaces

**Link**: https://github.com/greymass/unicove/pull/158  
**Merged**: 2024-10-22

Merged RAM management interfaces for consolidated resource management.

#### PR #157: refactor: table component

**Link**: https://github.com/greymass/unicove/pull/157  
**Merged**: 2024-10-07

**Body Summary**: Removed the `Table` component and reverted to using class-based styles on standard HTML table elements. The decision was made because the component overhead wasn't justified when only applying styles. Standard `<table>` elements with `.table-styles` class are now used for non-interactive tabular data, while more complex layouts use `div class="grid"` with `.table-row-styles` for flexibility (such as clickable rows in search history).

#### PR #156: fix account balances parse

**Link**: https://github.com/greymass/unicove/pull/156  
**Merged**: 2024-10-09

**Body Summary**: Fixed parsing of account balances. The server returns an array of balances (LightAPIBalanceRow[]) which needed proper handling.

#### PR #154: Search improvements

**Link**: https://github.com/greymass/unicove/pull/154  
**Merged**: 2024-10-09

**Body Summary**: Major search functionality enhancements including:
- Added search history showing last 10 searches with keyboard/mouse navigation
- Added button to close search dialog
- Added button to submit search
- Fixed horizontal overflow on mobile
- Updated search dialog styles
- Updated table styles
- Refactored button component
- Refactored table components
- Refactored `$lib/utils` with barrel export `index.ts`
- Added utility function for middle-truncating strings
- Added tests for string truncate function
- Added JetBrains monospace font

#### PR #153: Linting

**Link**: https://github.com/greymass/unicove/pull/153  
**Merged**: 2024-10-03

Applied linting fixes across the codebase for code quality and consistency.

#### PR #152: fix: type error in seoconfig

**Link**: https://github.com/greymass/unicove/pull/152  
**Merged**: 2024-10-02

**Body Summary**: Fixed type error where the `extend` function was returning `object` but the expected type in `$derived` was `SeoConfig`. Also removed unused `onMount` import.

#### PR #150: Fixing ram buying calculation and fixing type errors

**Link**: https://github.com/greymass/unicove/pull/150  
**Merged**: 2024-10-02

Fixed RAM buying calculations and resolved type errors in the RAM management interface.

#### PR #149: fix: default balance

**Link**: https://github.com/greymass/unicove/pull/149  
**Merged**: 2024-10-01

Fixed default balance display in the account interface.

#### PR #147: Signup and welcome pages

**Link**: https://github.com/greymass/unicove/pull/147  
**Merged**: 2024-10-22

Implemented signup and welcome pages for new user onboarding flow.

#### PR #138: RAM pages polishing

**Link**: https://github.com/greymass/unicove/pull/138  
**Merged**: 2024-10-01

Polished RAM management pages for improved user interface and experience.

#### PR #134: Staking changes

**Link**: https://github.com/greymass/unicove/pull/134  
**Merged**: 2024-10-01

Implemented changes to the staking interface and functionality.

---

### greymass/unicove-v1

**Repository**: https://github.com/greymass/unicove-v1  
**Activity**: 3 PRs merged

#### PR #223: Release Updates

**Link**: https://github.com/greymass/unicove-v1/pull/223  
**Merged**: 2024-10-02

Release updates for Unicove v1.

#### PR #212: staked value fix

**Link**: https://github.com/greymass/unicove-v1/pull/212  
**Merged**: 2024-10-02

Fixed staked value calculation display.

#### PR #211: fix net price for powerup and stake

**Link**: https://github.com/greymass/unicove-v1/pull/211  
**Merged**: 2024-10-02

**Body Summary**: Fixed NET price calculations for different resource rental methods:

1. **Added NET powerup price, REX price, and staking price calculations**:
   - **Powerup rent**: 0.0001 EOS per KB. Example: renting 1000KB for 0.1000 EOS increased available NET from 102981.54 KB to 103981.54 KB
   - **REX rent**: 0.00004 EOS per KB. Example: renting 100KB for 0.0040 EOS increased available NET from 103981.54 KB to 106955.54 KB
   - **Staking rent**: 0.0528 EOS per KB. Example: staking 0.0528 EOS increased available NET from 106955.54 KB to 106956.54 KB

2. **Calculate staking price in KB or MS units** to avoid situations where asset values appear as 0 in smaller units.

---

### greymass/antelope-snap

**Repository**: https://github.com/greymass/antelope-snap  
**Activity**: 2 PRs merged

#### PR #9: GRY-01-002 WP1: sanitizing transaction data

**Link**: https://github.com/greymass/antelope-snap/pull/9  
**Merged**: 2024-10-22

Implemented transaction data sanitization as part of security audit remediation (GRY-01-002 WP1).

#### PR #8: GRY-01-001 WP1: removing console logging

**Link**: https://github.com/greymass/antelope-snap/pull/8  
**Merged**: 2024-10-22

Removed console logging as part of security audit remediation (GRY-01-001 WP1).

---

### greymass/website

**Repository**: https://github.com/greymass/website  
**Activity**: 1 PR merged

#### PR #82: Release

**Link**: https://github.com/greymass/website/pull/82  
**Merged**: 2024-10-04

Release update for the Greymass website.

---

## Wharfkit Organization

### wharfkit/resources

**Repository**: https://github.com/wharfkit/resources  
**Activity**: 2 PRs merged

#### PR #15: fixed REXState#net_price_per_kb method calling itself

**Link**: https://github.com/wharfkit/resources/pull/15  
**Merged**: 2024-10-15

Fixed a bug where the `REXState#net_price_per_kb` method was recursively calling itself instead of performing the correct calculation.

#### PR #14: add rex price calculation for net and cpu

**Link**: https://github.com/wharfkit/resources/pull/14  
**Merged**: 2024-10-09

Added REX price calculation functionality for NET and CPU resources.

---

### wharfkit/website

**Repository**: https://github.com/wharfkit/website  
**Activity**: 1 PR merged

#### PR #247: Add quantity property information in rendering assets

**Link**: https://github.com/wharfkit/website/pull/247  
**Merged**: 2024-10-09

**Body Summary**: Added hint about the asset quantity property to the documentation for rendering assets.

---

## New Repositories

### greymass/2nicove-api

**Created**: 2024-10-03  
**Repository**: https://github.com/greymass/2nicove-api  
**Purpose**: API service repository (specific purpose not documented in README at time of creation)  
**Technology Stack**: Not yet documented  
**Initial Activity**: Repository created but no merged PRs during October 2024

**README Summary**: Repository had no README at time of creation.

---

## Publications

### "Progress Update (October 2024)"

**Published**: 2024-10-15  
**Source**: https://greymass.medium.com/progress-update-october-2024-e6b46b8b4c1b  
**RSS Entry**: https://medium.com/feed/@greymass (item 2024-10-15)

**Content Summary**: October 2024 progress update covering ongoing development work across Greymass projects.

**Key Topics**:
- Development progress on Greymass projects
- Product updates and announcements
- Ecosystem developments

---

## For Downstream Agents

**Summary Writer** (`agents/summary.md`):
- Read this file for complete context
- Use source links for verification
- Focus on outcomes and business impact
- Reference github-projects.md for display names and descriptions
- Review prior months' README.md for narrative continuity

**Technical Writer** (`agents/technical.md`):
- Read this file for complete context
- Include PR numbers and links from here
- Cite sources when making technical claims
- Use discussion summaries for context
- Review prior months' technical.md for project continuity

**Both agents**: Focus on the WORK and DISCUSSIONS documented here, not the individuals. This research emphasizes what was done and what was decided. Prior months' reports provide valuable context for ongoing projects and narrative flow.
