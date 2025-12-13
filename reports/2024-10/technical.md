# Technical Activity Report
## October 2024

**Navigation**: [← Previous Month](../2024-09/technical.md) | [Next Month →](../2024-11/technical.md)

*Also available: [Executive Summary](README.md) | [Research Data](research.md)*

October 2024 focused on Unicove UI/UX improvements, resource pricing fixes, and security audit remediations for antelope-snap. Development concentrated on frontend refinements, account management interfaces, and resource calculation accuracy.

**Key Achievements**:
- Improved account overview pages with balances, staking, and resource information
- Enhanced search functionality with history tracking and keyboard navigation
- Fixed resource pricing calculations for NET and CPU (powerup, REX, staking)
- Completed security audit remediations for Antelope Snap MetaMask integration

**Technical Significance**: October focused on polish and accuracy improvements, refining user-facing features and fixing calculation bugs in resource pricing. Security audit completion ensured MetaMask Snap integration meets security standards.

---

## Table of Contents

- [Cross-Repository Insights](#cross-repository-insights)

- [greymass/unicove](#greymassunicove)
- [greymass/unicove-v1](#greymassunicove-v1)
- [greymass/antelope-snap](#greymassantelope-snap)
- [greymass/website](#greymasswebsite)
- [wharfkit/resources](#wharfkitresources)
- [wharfkit/website](#wharfkitwebsite)
- [New Repositories](#new-repositories)

---

## Cross-Repository Insights

October 2024 work consisted primarily of independent improvements across repositories without significant cross-repository integration or coordinated technical efforts. Development focused on polish and refinement within individual projects.

---

## greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Activity**: 26 PRs merged

### Overview

October's work on Unicove focused on interface polish, search improvements, and resource management accuracy. Multiple UI components were styled, refactored, or added to improve the user experience. Resource pricing calculations were fixed across powerup, REX, and staking systems.

### Pull Requests

#### Major Changes

**[#185](https://github.com/greymass/unicove/pull/185) - adapt full variant for asset component**  
*Merged: 2024-10-31*

Adapted the asset component to support a full display variant, providing more flexibility in how token amounts and assets are rendered throughout the application.

---

**[#184](https://github.com/greymass/unicove/pull/184) - Design and content pass**  
*Merged: 2024-10-30*

Comprehensive design and content review resulting in refinements across the application for improved visual consistency and user experience.

---

**[#178](https://github.com/greymass/unicove/pull/178) - Resources page refactor and ui update**  
*Merged: 2024-10-29*

Refactored the resources management page with updated UI patterns to improve the interface for managing CPU, NET, and RAM resources.

---

**[#168](https://github.com/greymass/unicove/pull/168) - Homepage**  
*Merged: 2024-10-28*

Implemented the Unicove homepage with new design and content structure.

---

**[#167](https://github.com/greymass/unicove/pull/167) - refactor resource rent price calculation**  
*Merged: 2024-10-21*

**Description**: 
1. Moved price calculation methods to utilities
2. Fixed REX price calculation for NET and CPU resources

**Impact**: Improved code organization and fixed incorrect resource pricing display for REX rental calculations.

---

**[#166](https://github.com/greymass/unicove/pull/166) - add acount overview pages**  
*Merged: 2024-10-21*

Added account overview pages displaying account statistics, balances, and resource information.

---

**[#162](https://github.com/greymass/unicove/pull/162) - feat: basic error page**  
*Merged: 2024-10-09*

**Description**: Added a basic error page that re-uses the default layout so users can still navigate when searches fail. The page is applied at `/src/routes/[network]/+layout.svelte`. Alternative designs are needed for other error scenarios like `/en/asdf` or `/en/eos/asdf`.

**Impact**: Improves user experience when encountering errors by maintaining navigation capabilities.

---

**[#158](https://github.com/greymass/unicove/pull/158) - Merging RAM interfaces**  
*Merged: 2024-10-22*

Consolidated RAM management interfaces for unified resource management experience.

---

**[#157](https://github.com/greymass/unicove/pull/157) - refactor: table component**  
*Merged: 2024-10-07*

**Description**: Removed the `Table` component and reverted to using class-based styles on standard HTML table elements. The component overhead wasn't justified when only applying styles. Standard `<table>` elements with `.table-styles` class are now used for non-interactive tabular data, while more complex layouts use `div class="grid"` with `.table-row-styles` for flexibility (such as clickable rows in search history).

**Impact**: Simplified codebase by removing unnecessary component abstraction while maintaining consistent styling. Improved flexibility for complex table layouts requiring interactivity.

---

**[#154](https://github.com/greymass/unicove/pull/154) - Search improvements**  
*Merged: 2024-10-09*

**Description**: Major search functionality enhancements including:
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

**Impact**: Significantly improved search UX with history tracking and keyboard navigation. Enhanced mobile responsiveness.

---

**[#147](https://github.com/greymass/unicove/pull/147) - Signup and welcome pages**  
*Merged: 2024-10-22*

Implemented signup and welcome pages for the new user onboarding flow.

---

#### Minor Changes

- **[#181](https://github.com/greymass/unicove/pull/181)**: style: increase font sizing - Increased font sizing throughout the application
- **[#180](https://github.com/greymass/unicove/pull/180)**: Tooltip component - Added tooltip component
- **[#179](https://github.com/greymass/unicove/pull/179)**: Fix default asset symbol in overview page - Fixed default asset symbol display
- **[#176](https://github.com/greymass/unicove/pull/176)**: chore: add install package command - Added Makefile command for package installation
- **[#174](https://github.com/greymass/unicove/pull/174)**: replace the value of system token in balances with liquid - Updated system token display
- **[#165](https://github.com/greymass/unicove/pull/165)**: Style wallet selection - Styled wallet selection interface
- **[#161](https://github.com/greymass/unicove/pull/161)**: style: choose wallet type page - Styled wallet type selection
- **[#160](https://github.com/greymass/unicove/pull/160)**: style: signup step indicator - Styled signup step indicator
- **[#156](https://github.com/greymass/unicove/pull/156)**: fix account balances parse - Fixed balance array parsing
- **[#153](https://github.com/greymass/unicove/pull/153)**: Linting - Applied linting fixes
- **[#152](https://github.com/greymass/unicove/pull/152)**: fix: type error in seoconfig - Fixed TypeScript type error
- **[#150](https://github.com/greymass/unicove/pull/150)**: Fixing ram buying calculation and fixing type errors - Fixed RAM calculation
- **[#149](https://github.com/greymass/unicove/pull/149)**: fix: default balance - Fixed default balance display
- **[#138](https://github.com/greymass/unicove/pull/138)**: RAM pages polishing - Polished RAM management pages
- **[#134](https://github.com/greymass/unicove/pull/134)**: Staking changes - Implemented staking changes

---

## greymass/unicove-v1

**Repository**: https://github.com/greymass/unicove-v1  
**Activity**: 3 PRs merged

### Pull Requests

**[#223](https://github.com/greymass/unicove-v1/pull/223) - Release Updates**  
*Merged: 2024-10-02*

Release updates for Unicove v1.

---

**[#212](https://github.com/greymass/unicove-v1/pull/212) - staked value fix**  
*Merged: 2024-10-02*

Fixed staked value calculation display.

---

**[#211](https://github.com/greymass/unicove-v1/pull/211) - fix net price for powerup and stake**  
*Merged: 2024-10-02*

**Description**: Fixed NET price calculations for different resource rental methods:

1. **Added NET powerup price, REX price, and staking price calculations**:
   - **Powerup rent**: 0.0001 EOS per KB
     - Example: renting 1000KB for 0.1000 EOS increased available NET from 102981.54 KB to 103981.54 KB
   - **REX rent**: 0.00004 EOS per KB
     - Example: renting 100KB for 0.0040 EOS increased available NET from 103981.54 KB to 106955.54 KB
   - **Staking rent**: 0.0528 EOS per KB
     - Example: staking 0.0528 EOS increased available NET from 106955.54 KB to 106956.54 KB

2. **Calculate staking price in KB or MS units** to avoid situations where asset values appear as 0 in smaller units.

**Impact**: Users can now accurately compare resource rental costs across different methods to make informed economic decisions.

---

## greymass/antelope-snap

**Repository**: https://github.com/greymass/antelope-snap  
**Activity**: 2 PRs merged

### Overview

Security audit remediation work focused on removing information leakage vectors and sanitizing transaction data.

### Pull Requests

**[#9](https://github.com/greymass/antelope-snap/pull/9) - GRY-01-002 WP1: sanitizing transaction data**  
*Merged: 2024-10-22*

Implemented transaction data sanitization as part of security audit remediation (GRY-01-002 WP1). Ensures transaction information is properly sanitized before processing or display.

---

**[#8](https://github.com/greymass/antelope-snap/pull/8) - GRY-01-001 WP1: removing console logging**  
*Merged: 2024-10-22*

Removed console logging statements as part of security audit remediation (GRY-01-001 WP1). Prevents potential information leakage through console output.

---

## greymass/website

**Repository**: https://github.com/greymass/website  
**Activity**: 1 PR merged

### Pull Requests

**[#82](https://github.com/greymass/website/pull/82) - Release**  
*Merged: 2024-10-04*

Release update for the Greymass website.

---

## wharfkit/resources

**Repository**: https://github.com/wharfkit/resources  
**Activity**: 2 PRs merged

### Pull Requests

**[#15](https://github.com/wharfkit/resources/pull/15) - fixed REXState#net_price_per_kb method calling itself**  
*Merged: 2024-10-15*

**Description**: Fixed a critical bug where the `REXState#net_price_per_kb` method was recursively calling itself instead of performing the correct price calculation.

**Impact**: Resolves infinite recursion issue and enables proper NET resource price calculations from REX state data.

---

**[#14](https://github.com/wharfkit/resources/pull/14) - add rex price calculation for net and cpu**  
*Merged: 2024-10-09*

Added REX price calculation functionality for NET and CPU resources to the resources library.

---

## wharfkit/website

**Repository**: https://github.com/wharfkit/website  
**Activity**: 1 PR merged

### Pull Requests

**[#247](https://github.com/wharfkit/website/pull/247) - Add quantity property information in rendering assets**  
*Merged: 2024-10-09*

**Description**: Added documentation hint about the asset quantity property to help developers understand how to properly render token amounts.

**Impact**: Improves developer documentation for asset rendering.

---

## New Repositories

### greymass/2nicove-api

**Created**: 2024-10-03  
**Repository**: https://github.com/greymass/2nicove-api  
**Description**: API service repository created for infrastructure development  
**Purpose**: Not yet documented in README  
**Initial Activity**: Repository created but no merged PRs during October 2024  
**Technology Stack**: Not yet documented
