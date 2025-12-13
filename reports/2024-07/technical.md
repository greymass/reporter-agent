# Technical Activity Report
## July 2024

**Navigation**: [← Previous Month](../2024-06/technical.md) | [Next Month →](../2024-08/technical.md)

*Also available: [Executive Summary](README.md) | [Research Data](research.md)*

July 2024 focused on starting Unicove 2.0 development with creation of new repositories establishing modern architectural foundations. Supporting work implemented REX staking in Unicove v1, coordinated security hardening across web properties, expanded account creation infrastructure, and improved browser compatibility across the stack.

**Key Achievements**:
- Started Unicove 2.0 development with modern architecture foundation
- Implemented comprehensive REX staking in Unicove v1
- Expanded account creation infrastructure with multi-provider support
- Improved browser compatibility for Firefox and Brave
- Applied security hardening across web properties

**Technical Significance**: July established the architectural foundation for Unicove 2.0 with component library separation, transaction queue management, and multi-network support from inception.

---

## Table of Contents

- [Cross-Repository Insights](#cross-repository-insights)
- [New Repositories](#new-repositories)
- [greymass/unicove-v1](#greymassunicove-v1)
- [greymass/unicove](#greymassunicove)
- [greymass/create-account](#greymasscreate-account)
- [greymass/website](#greymasswebsite)
- [greymass/anchor-link-browser-transport](#greymassanchor-link-browser-transport)
- [greymass/scrap-ui](#greymassscrap-ui)
- [wharfkit/antelope](#wharfkitantelope)
- [wharfkit/web-renderer](#wharfkitweb-renderer)
- [wharfkit/atomicassets](#wharfkitatomicassets)

---

## Cross-Repository Insights

### Unicove 2.0 Component Architecture

Two repositories created simultaneously on July 16 establishing component-based architecture pattern:

**Integration Stack**:
1. **greymass/unicove** - Main application consuming shared components
2. **greymass/unicove-components** - Reusable component library providing UI primitives

**Technical Relationship**: Application-library split enabling:
- **Shared components**: Button, Checkbox, CopyButton, Stack consumed by main application
- **Tailwind CSS v4 integration**: Components use `@source` directive for style imports
- **Cross-project reuse**: Component library designed for consumption by multiple Greymass properties
- **Independent development**: Components can be developed and tested separately from application

**Integration Pattern**:
```css
@import 'tailwindcss';
@import 'unicove-components';
@source "../node_modules/unicove-components";
```

**Technology Stack Coordination**:
- Both repositories use Bun runtime
- Both repositories use Tailwind CSS v4
- Shared development workflows with Make

**Impact**: Architectural decision enabling code reuse across Greymass web properties while maintaining consistent design system. Foundation supported subsequent component development building on this library.

---

## New Repositories

### greymass/account-creation-portal

**Created**: 2024-07-03  
**Repository**: https://github.com/greymass/account-creation-portal  
**Description**: Portal that lets users easily create Antelope accounts

**Purpose**: User-facing portal for simplified [Antelope](../glossary.md#antelope) account creation workflows. Provides web interface enabling users to create blockchain accounts without technical knowledge.

**Technology Stack**:
- [SvelteKit](../glossary.md#sveltekit) web framework
- Node.js ecosystem (npm/yarn/pnpm)
- SvelteKit adapters for deployment

**Significance**: Lowers barriers to entry for new blockchain users by providing user-friendly account creation interface. Complements the create-account backend service which received updates in July to support multiple creation services.

---

### greymass/unicove

**Created**: 2024-07-16  
**Repository**: https://github.com/greymass/unicove  
**Description**: Unicove 2.0 - Web Wallet interfaces and block explorer

**Purpose**: Complete rewrite of Unicove as modern web-based wallet and block explorer for Antelope blockchains. Represents next generation with improved architecture, better user experience, and enhanced functionality.

**Technology Stack**:
- [Bun](../glossary.md#bun) (JavaScript runtime and package manager)
- [SvelteKit](../glossary.md#sveltekit) (web framework)
- Make (build automation)
- Tailwind CSS (styling)
- Melt UI (headless components)
- Multi-chain configuration system

**Configuration System**:
- Default: Jungle4 testnet (.env)
- Local overrides: .env.development and .env.local
- Pre-built chain configs: EOS, Jungle4, Kylin, Telos, WAX, and testnets
- Debug state inspection at /debug/state/config

**Initial Activity**: Five PRs merged by end of July establishing foundational infrastructure (asset input, transaction queue, network state, toasts, basic components).

**Significance**: Complete rewrite with modern architecture. July work established foundation enabling August development. See [August 2024 Technical Report](../2024-08/technical.md#greymass-unicove) for feature development building on this foundation.

**Architectural Foundation**:
- Multi-network support from inception
- Transaction queue management
- Component-based architecture
- Modern styling with Tailwind CSS
- Headless UI primitives with Melt UI
- Make-based development workflows

---

### greymass/unicove-components

**Created**: 2024-07-16  
**Repository**: https://github.com/greymass/unicove-components  
**Description**: Component library for Unicove

**Purpose**: Reusable Svelte component library providing UI components for Unicove and related projects. Enables consistent design patterns and code sharing across Greymass web properties.

**Technology Stack**:
- Svelte (component framework)
- Tailwind CSS v4 (styling with @source directive)
- Bun (development runtime)
- Component-based architecture

**Available Components**: Button, Checkbox, CopyButton, Stack

**Usage Pattern**:
```css
@import 'tailwindcss';
@import 'unicove-components';
@source "../node_modules/unicove-components";
```

**Significance**: Establishes shared component library architecture enabling code reuse across Greymass projects. Created same day as Unicove 2.0, demonstrating planning for component-based architecture from inception. Tailwind CSS v4 adoption with @source directive represents modern CSS tooling.

---

### wharfkit/account-creation-plugin-metamask

**Created**: 2024-07-26  
**Repository**: https://github.com/wharfkit/account-creation-plugin-metamask  
**Description**: WharfKit plugin enabling account creation using MetaMask Snap for Antelope accounts

**Purpose**: Enables MetaMask users to create Antelope accounts using MetaMask wallet's public key rather than generating new keys.

**Technology Stack**:
- [WharfKit](../glossary.md#wharfkit) Session Kit plugin system
- MetaMask Snap integration
- Make-based build system
- Node.js and yarn

**Status**: Work in progress - README states "not ready for production use"

**Significance**: Part of WharfKit's account creation plugin ecosystem, enabling MetaMask users to create Antelope accounts without leaving MetaMask environment. Represents effort to lower barriers to entry by leveraging familiar Web3 tools. See [August 2024 Technical Report](../2024-08/technical.md#cross-repository-insights) for MetaMask integration stack details.

---

## greymass/unicove-v1

**Repository**: https://github.com/greymass/unicove-v1  
**Previous Context**: See glossary for [REX (Resource Exchange)](../glossary.md#rex)  
**Activity**: 8 PRs merged

### Overview

Legacy Unicove version receiving updates in July focused on REX staking implementation and security hardening. This work occurred while Unicove 2.0 development began, with v1 serving as production system.

### Pull Requests

#### Major Changes

**#194 - Staking** ([link](https://github.com/greymass/unicove-v1/pull/194))  
*Merged: 2024-07-07*

**Description**: Comprehensive REX staking implementation including stake/unstake operations, bootstrap step handling, error detail display, default percent configuration, matured balance display with tooltip, claim functionality for matured REX, savings balance tracking, APY earnings calculation, and icon updates.

**Features Implemented**:
- REX stake and unstake operations
- Bootstrap step handling for initial REX setup
- Error detail display for failed transactions
- Default percent configuration
- Network support: EOS and Jungle4 testnet
- Matured balance display with tooltip
- Overview page button status updates
- Claim functionality for matured REX
- Savings balance tracking
- EOS REX conversion handling
- APY earnings calculation and display
- Removed 72-hour waiting period message
- Icon updates

**Technical Significance**: Established resource management patterns that informed Unicove 2.0 development. REX implementation in v1 provided working reference for building resource features in new version. See [August 2024 Technical Report](../2024-08/technical.md#greymass-unicove) for RAM operations and [September 2024 Technical Report](../2024-09/technical.md#greymass-unicove) for staking implementation in Unicove 2.0.

---

**#195 - Add liquid REX balances to claim + rename claim to withdraw** ([link](https://github.com/greymass/unicove-v1/pull/195))  
*Merged: 2024-07-10*

**Description**: Enhanced REX withdrawal functionality by incorporating liquid REX balances and improving terminology from "claim" to "withdraw" for better user understanding.

---

**#197 - REX calculation fixes** ([link](https://github.com/greymass/unicove-v1/pull/197))  
*Merged: 2024-07-16*

**Description**: Fixed calculation issues in REX-related operations to ensure accurate balance displays and transaction amounts.

---

#### Security Hardening

**#201 - added security headers via _headers file** ([link](https://github.com/greymass/unicove-v1/pull/201))  
*Merged: 2024-07-25*

**Security Headers Implemented**:
- X-Frame-Options: SAMEORIGIN (prevent clickjacking)
- X-XSS-Protection: 1; mode=block (XSS protection)
- X-Content-Type-Options: nosniff (prevent MIME sniffing)
- Referrer-Policy: strict-origin-when-cross-origin (referrer control)
- Strict-Transport-Security: max-age=31536000; includeSubDomains (enforce HTTPS)
- Cross-Origin-Opener-Policy: same-origin (isolate browsing context)

**Context**: Part of coordinated security hardening effort across multiple Greymass web properties on July 25, 2024 (see [Cross-Project Coordination](#cross-project-coordination)).

---

**#202 - Add security headers** ([link](https://github.com/greymass/unicove-v1/pull/202))  
*Merged: 2024-07-25*

**Description**: Additional security header configuration coordinating with PR #201 to ensure comprehensive coverage.

---

#### Browser Compatibility

**#199 - Fix: Opening Anchor on Firefox on Android** ([link](https://github.com/greymass/unicove-v1/pull/199))  
*Merged: 2024-07-24*

**Description**: Resolved compatibility issue preventing Anchor wallet from launching properly through Firefox browser on Android devices.

---

**#200 - Update package.json** ([link](https://github.com/greymass/unicove-v1/pull/200))  
*Merged: 2024-07-24*

**Description**: Package dependency update addressing Firefox Android compatibility issue.

---

## greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Previous Context**: See [New Repositories](#greymass-unicove) section above  
**Activity**: 5 PRs merged

### Overview

Unicove 2.0 repository created July 16, 2024. Initial PRs established architectural foundation that enabled August development. See [August 2024 Technical Report](../2024-08/technical.md#greymass-unicove) for feature development building on this foundation.

### Pull Requests

**#1 - Asset input element** ([link](https://github.com/greymass/unicove/pull/1))  
*Merged: 2024-07-19*

**Description**: First component merged into Unicove 2.0 - asset input element for token amount entry. Foundational UI component used throughout wallet for token transfers and resource operations.

**Significance**: First feature establishing component architecture patterns.

---

**#2 - Transaction queue, network state, and multi-network** ([link](https://github.com/greymass/unicove/pull/2))  
*Merged: 2024-07-25*

**Description**: Core infrastructure implementation establishing transaction queue management, network state handling, and multi-network support architecture.

**Technical Implementation**:
- Transaction queuing and processing
- Network-specific configuration and state management
- Multi-chain support from day one
- Foundation for network switching functionality

**Impact**: Architectural foundation enabling Unicove to support multiple Antelope blockchains from inception. Network state abstraction patterns established here supported subsequent multi-chain features and network management capabilities.

---

**#3 - feat: support alt bash locations** ([link](https://github.com/greymass/unicove/pull/3))  
*Merged: 2024-07-25*

**Description**: Development environment improvement supporting Linux systems where bash is not located at /bin/bash, improving developer experience across different platforms.

**Technical Context**: Different Unix systems install bash in different locations (/bin/bash vs /usr/bin/bash). This change makes development tooling work across environments.

---

**#4 - Add Toasts** ([link](https://github.com/greymass/unicove/pull/4))  
*Merged: 2024-07-25*

**Description**: User notification system implementation using Melt UI and Tailwind CSS.

**Implementation Details**:
- Melt UI for headless component primitives
- Tailwind CSS for utility-based styling
- Code formatting with `make format`

**Technical Stack Established**:
- Melt UI: Headless component primitives
- Tailwind CSS: Utility-first styling framework
- Make-based workflow for formatting and development

---

**#5 - Basic components** ([link](https://github.com/greymass/unicove/pull/5))  
*Merged: 2024-07-30*

**Description**: Implementation of basic UI components establishing component library foundation.

**Impact**: Foundation for subsequent component development including switches, language selectors, asset inputs, buttons, progress indicators, navigation, and form selects.

---

## greymass/create-account

**Repository**: https://github.com/greymass/create-account  
**Activity**: 2 PRs merged

### Overview

Account creation service infrastructure. July work extended support for multiple account creation service providers.

### Pull Requests

**#5 - Adding support for other account creation services** ([link](https://github.com/greymass/create-account/pull/5))  
*Merged: 2024-07-19*

**Description**: Extended account creation infrastructure to support integration with external account creation services, expanding options beyond default service.

**Significance**: Flexibility improvement enabling multiple account creation service providers.

---

**#6 - Allowing messages from fullCreationServiceUrl** ([link](https://github.com/greymass/create-account/pull/6))  
*Merged: 2024-07-20*

**Description**: Security and messaging improvement allowing communication from full creation service URL, enabling proper integration with external services added in PR #5.

---

## greymass/website

**Repository**: https://github.com/greymass/website  
**Activity**: 2 PRs merged

### Overview

Greymass.com website maintenance. July work focused on security hardening as part of coordinated effort.

### Pull Requests

**#76 - add security headers to application** ([link](https://github.com/greymass/website/pull/76))  
*Merged: 2024-07-25*

**Description**: Security hardening implementing HTTP security headers through SvelteKit hooks.

**Security Headers Added**:
- X-Frame-Options: SAMEORIGIN
- X-XSS-Protection: 1; mode=block
- X-Content-Type-Options: nosniff
- Referrer-Policy: strict-origin-when-cross-origin
- Strict-Transport-Security: max-age=31536000; includeSubDomains
- Cross-Origin-Opener-Policy: same-origin

**Implementation**: Used SvelteKit's server hooks (`hooks.server.ts`) for server-side header injection, providing more robust security than static _headers files.

**Technical Details**: SvelteKit hooks intercept every request, allowing headers to be added programmatically. This approach provides better control and flexibility than static configuration files.

---

**#77 - Publish** ([link](https://github.com/greymass/website/pull/77))  
*Merged: 2024-07-25*

**Description**: Deployment of website changes including security header implementation.

---

## greymass/anchor-link-browser-transport

**Repository**: https://github.com/greymass/anchor-link-browser-transport  
**Activity**: 1 PR merged

### Pull Request

**#26 - fix: launch anchor on firefox** ([link](https://github.com/greymass/anchor-link-browser-transport/pull/26))  
*Merged: 2024-07-23*

**Description**: Fixed Anchor wallet launching issue on Firefox and Brave browsers by correcting window location handling when processing Launch Anchor clicks.

**Implementation**: Includes change of window location when handling Launch Anchor click in Firefox/Brave browsers.

**Impact**: Browser compatibility fix ensuring Anchor Link protocol works correctly across major browsers. Complements similar Firefox Android fixes in unicove-v1 (PRs #199, #200).

---

## greymass/scrap-ui

**Repository**: https://github.com/greymass/scrap-ui  
**Activity**: 1 PR merged

### Pull Request

**#5 - added security headers via _headers file** ([link](https://github.com/greymass/scrap-ui/pull/5))  
*Merged: 2024-07-25*

**Security Headers Added**:
- X-Frame-Options: SAMEORIGIN
- X-XSS-Protection: 1; mode=block
- X-Content-Type-Options: nosniff
- Referrer-Policy: strict-origin-when-cross-origin
- Strict-Transport-Security: max-age=31536000; includeSubDomains
- Cross-Origin-Opener-Policy: same-origin

**Context**: Part of coordinated July 25 security hardening across three Greymass web properties.

---

## wharfkit/antelope

**Repository**: https://github.com/wharfkit/antelope  
**Activity**: 3 PRs merged

### Overview

Core Antelope blockchain library for WharfKit. July improvements focused on serialization fixes, type safety, and comparison operators.

### Pull Requests

**#109 - Adding gt/gte/lt/lte comparison operators** ([link](https://github.com/wharfkit/antelope/pull/109))  
*Merged: 2024-07-30*

**Description**: Added comparison operators for Int types enabling greater-than, greater-than-or-equal, less-than, and less-than-or-equal operations.

**Operators Added**:
- Greater than (gt)
- Greater than or equal (gte)
- Less than (lt)
- Less than or equal (lte)

**Significance**: Improved developer experience when working with integer comparisons in smart contract interactions.

---

**#110 - Prevent undefined/null values from being used in optionals** ([link](https://github.com/wharfkit/antelope/pull/110))  
*Merged: 2024-07-30*

**Description**: Type safety improvement preventing undefined or null values from being used in optional fields, catching potential bugs at development time.

**Significance**: Enhanced type safety and error prevention in contract interactions.

---

**#111 - Serializer fixes** ([link](https://github.com/wharfkit/antelope/pull/111))  
*Merged: 2024-07-30*

**Description**: Fixed issues in serialization system for encoding and decoding blockchain data structures.

**Impact**: Improved reliability of data serialization/deserialization operations critical for blockchain interactions.

---

## wharfkit/web-renderer

**Repository**: https://github.com/wharfkit/web-renderer  
**Activity**: 1 PR merged

### Pull Request

**#146 - Updating master branch** ([link](https://github.com/wharfkit/web-renderer/pull/146))  
*Merged: 2024-07-08*

**Description**: Maintenance update synchronizing master branch with recent development work.

---

## wharfkit/atomicassets

**Repository**: https://github.com/wharfkit/atomicassets  
**Activity**: 1 PR merged

### Pull Request

**#7 - Asset name optional** ([link](https://github.com/wharfkit/atomicassets/pull/7))  
*Merged: 2024-07-30*

**Description**: Made asset names optional in AtomicAssets data structures, reflecting reality that asset names can be empty in the NFT standard.

**Technical Context**: AtomicAssets is an NFT standard on Antelope blockchains. Asset names are optional fields that can be empty, requiring data structures to handle this case properly.

**Impact**: Data structure fix ensuring compatibility with AtomicAssets NFTs having empty name fields.


