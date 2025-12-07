# Research Data: November 2025

**Generated**: 2025-12-07 14:15 UTC (Updated)  
**Method**: REST API (historical data >30 days) + Direct commit analysis  
**Rate Limit Remaining**: 4800 core, 30 search

---

## Data Sources & References

**GitHub Organizations**:
- [greymass](https://github.com/greymass)
- [wharfkit](https://github.com/wharfkit)

**Personal Repositories**:
- [aaroncox/vaulta-contracts](https://github.com/aaroncox/vaulta-contracts)

**Publications**:
- [jesta.blog RSS](https://jesta.blog/feed)
- [Medium @greymass RSS](https://medium.com/feed/@greymass)

---

## Summary Statistics

- **Greymass**: 2 PRs merged + significant direct commit activity across 7 repositories
- **Wharfkit**: 2 PRs merged + direct commits across 2 repositories
- **New Repositories**: 4 created (3 Greymass, 1 Wharfkit)
- **Publications**: 1 blog post (jesta.blog)
- **Top Repositories by Activity**: 
  - greymass/web-authenticator (4 commits - UI improvements)
  - greymass/unicove (9 commits - localization and wallet integration)
  - greymass/msigs (40 commits - VF transition proposal documents and tooling)
  - greymass/msigs-ui (25 commits - multisig UI)
  - greymass/sentiment-api (13 commits - sentiment voting API)
  - greymass/unicove-components (3 commits - component library)
  - wharfkit/msigs (8 commits - multisig API client)
  - wharfkit/mock-data (2 commits - mock data tooling)

---

## Greymass Organization

### greymass/sextant

**Repository**: https://github.com/greymass/sextant  
**Activity**: 1 PR merged

**Strategic Context**: Sextant is the **account creation platform** that powers account creation across multiple Greymass products including Anchor, MetaMask integration, Unicove, and Web Authenticator. This is shared infrastructure used across the product ecosystem to provide consistent account creation experiences.

#### PR #7: Adding vaulta to forbidden words

**Link**: https://github.com/greymass/sextant/pull/7  
**Merged**: 2025-11-03  
**Body Summary**: Updated forbidden words list to include "vaulta" to prevent name conflicts or inappropriate content in accounts created through the platform.

---

### greymass/web-authenticator

**Repository**: https://github.com/greymass/web-authenticator  
**Activity**: 4 commits to main branch

**Strategic Context**: Web Authenticator is a **no-download web-based non-custodial "cloud wallet"** that fundamentally changes blockchain onboarding. Users can create a free account and start using blockchain applications in 1-2 minutes without any downloads or installations. The wallet integrates with **Wharf (WharfKit)**, enabling any dapp to leverage this frictionless onboarding experience for transaction signing and account management. This product removes the traditional barrier of wallet installation that blocks new users from trying blockchain applications.

**Work Summary**: November focused on improving the onboarding and transaction signing experience with significant UI improvements to transaction prompts and session management. **Wharf Integration**: Because Web Authenticator integrates with Wharf (WharfKit), these UX improvements benefit any dapp using Wharf - providing a seamless, no-download onboarding option for their users without requiring dapp-specific integration work.

#### Commit f0a0f1e: Updates to transaction prompt (#221)
**Date**: 2025-11-28  
**Link**: https://github.com/greymass/web-authenticator/commit/f0a0f1e

**Onboarding Impact**: Major improvements to the transaction signing experience - critical for new users trying blockchain for the first time. Clearer presentation of transaction details helps users understand what they're signing without overwhelming them, making the no-download wallet experience more trustworthy and accessible.

**Changes Implemented**:
- Fixed TypeScript build configuration to properly catch Svelte component errors
- Resolved vertical overflow bug in UI components
- Added scroll area component for better content handling
- Refactored account button component for improved UX
- Created new modal account selector component
- Redesigned transaction prompt styling including:
  - Expiry card styling
  - Action summary presentation
  - Ricardian contract display
  - Transaction details component using melt-ui tabs
  - Dangerous action warning styles with tooltips
- Added balance display by default
- Updated environment variable configuration

#### Commit 022d69c: Simplified Dialog component (#219)
**Date**: 2025-11-04  
**Link**: https://github.com/greymass/web-authenticator/commit/022d69c

**Onboarding Impact**: Simplified and unified session management UI makes it easier for new users to understand and manage their dapp connections. Consistent modal behavior and improved visual hierarchy reduce confusion during the onboarding flow.

**Changes Implemented**:
- Integrated melt-ui dialog component for consistent modal behavior
- Simplified styling on session details page
- Unified dialog usage across session list and account details pages
- Fixed key handling in wallet connections loop
- Fixed fallback icon display for wallet connections
- Upgraded unicove-components dependency
- Applied button width consistency fixes
- Improved spacing and layout consistency using buttongroup component

#### Commit 2c284cb: Add adaptive favicon (#218)
**Date**: 2025-11-04  
**Link**: https://github.com/greymass/web-authenticator/commit/2c284cb

**Onboarding Impact**: Better visual identity across platforms helps establish trust and brand recognition when users first encounter the wallet.

**Changes**: Added adaptive favicon support for better branding across different platforms and themes.

#### Commit c364533: Fix overflowing id on connections page (#220)
**Date**: 2025-11-04  
**Link**: https://github.com/greymass/web-authenticator/commit/c364533

**Onboarding Impact**: Fixed visual polish issue that could confuse users managing their dapp connections.

**Changes**: Fixed UI overflow issue when displaying connection IDs on the connections management page.

---

### greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Activity**: 9 commits to main branch

**Work Summary**: Localization prototype implementation and wallet integration enhancements

#### Localization Prototype (Wuchale Integration)
**Date Range**: 2025-11-06 to 2025-11-15  
**Key Commits**:
- Commit 443b8a6: Merged localization prototype (#539) - [link](https://github.com/greymass/unicove/commit/443b8a6)
- Commit 1c7cd17: Merged fixes to wuchale integration (#542) - [link](https://github.com/greymass/unicove/commit/1c7cd17)
- Commit e3aac9e: Load locale in every layout.ts load function - [link](https://github.com/greymass/unicove/commit/e3aac9e)

**Implementation Details**:
- Integrated "Wuchale" localization system for multi-language support
- Added locale loading to all layout load functions for consistent i18n
- Applied fixes for locale handling across the application

#### Wallet Integration
**Commit 9358fdb**: Merged wallet-plugin-gatewallet (#545)  
**Date**: 2025-11-15  
**Link**: https://github.com/greymass/unicove/commit/9358fdb

**Changes**: 
- Added GateWallet plugin support
- Commit ed42718: Integrated wallet-plugin-gatewallet for expanded wallet options

#### Multisig Page Improvements
**Date**: 2025-11-15  
**Key Commits**:
- Commit 272d1f2: Always show variant selector on msig page - [link](https://github.com/greymass/unicove/commit/272d1f2)
- Commit cf30a43: Split apart the msig page into sections - [link](https://github.com/greymass/unicove/commit/cf30a43)
- Commit 858f512: Disable newaccount summary element - [link](https://github.com/greymass/unicove/commit/858f512)

**Changes**: Refactored multisig proposal page into logical sections with improved navigation and disabled incomplete features.

---

### greymass/evm-bridge-frontend

**Repository**: https://github.com/greymass/evm-bridge-frontend  
**Activity**: 1 PR merged

**Context**: This project was originally built by Vaulta Foundation (VF) for the **Vaulta EVM**, which was shut down by VF in October 2025. When the Vaulta EVM infrastructure was shut down, token holders still needed access to withdraw their tokens from the EVM. The project was forked and relaunched to ensure continued access for token holders - part of the community response to the EVM bridge infrastructure shutdown, similar to the governance transition work in greymass/msigs. This work is about protecting user access to their assets.

#### PR #1: Initial cleanup

**Link**: https://github.com/greymass/evm-bridge-frontend/pull/1  
**Merged**: 2025-11-15  
**Body Summary**: Initial cleanup work on the forked EVM bridge frontend codebase to restore functionality for token holders needing to withdraw assets from the EVM after the Vaulta EVM infrastructure was shut down by VF in October.

---

### greymass/roborovski

**Repository**: https://github.com/greymass/roborovski  
**Activity**: Active deployments (last pushed 2025-11-29)

**Strategic Context**: Roborovski is the core infrastructure powering the multisig ecosystem. Prototype work was done in November to build a new **multisig indexing service and API** on top of the existing Roborovski history solution. This msig indexer indexes all multisig proposals on the Vaulta blockchain and provides a queryable API for applications to access proposal data.

**Current & Future Usage**:
- **msigs.io** (Current): Powers the public multisig search engine via the Roborovski msigs API
- **unicove.com** (Future): Will integrate this same API to add native multisig functionality

**Work Summary**: No direct commits to the repository in November, but active deployment indicates ongoing infrastructure and API service work to support the new msig indexing capabilities that power both msigs.io and future Unicove features.

---

### greymass/msigs

**Repository**: https://github.com/greymass/msigs  
**Activity**: 40 commits to main branch (Nov 15 - Nov 26)

**Context**: This repository contains proposals for resolving the Vaulta Foundation (VF) shutdown. The primary work is developing **proposal documents** (markdown files) that outline governance transitions, not just code for submitting proposals on-chain.

**Work Summary**: VF transition proposal development and iteration

#### Stage 1 Proposal Document Development
**Primary Document**: `documents/stage-1.md` (VF Transition Proposal)  
**Purpose**: Proposes transition from Vaulta Foundation to two new entities (VDT & VNT)

**Document Evolution in November**:
- Commit 340d25c (Nov 24): Converting V6 document to Markdown - [link](https://github.com/greymass/msigs/commit/340d25c)
- Commit d7fc052 (Nov 24): Diagram updates - [link](https://github.com/greymass/msigs/commit/d7fc052)
- Commit a7e6e3d (Nov 24): Refined comparison table, updated ownership language, simplified messaging - [link](https://github.com/greymass/msigs/commit/a7e6e3d)
- Commit 406bacb (Nov 24): Added version number - [link](https://github.com/greymass/msigs/commit/406bacb)
- Commit 0bd105b (Nov 24): Adding links to the technical documents - [link](https://github.com/greymass/msigs/commit/0bd105b)
- Commit 7e23e0c (Nov 24): Updating links - [link](https://github.com/greymass/msigs/commit/7e23e0c)
- Commit fcbec19 (Nov 26): Update stage-1.md - [link](https://github.com/greymass/msigs/commit/fcbec19)

**Status by End of November**: Stage 1 Proposal at v8 (Draft)

**v8 Key Changes** (from document):
- dev.vaulta account created with network authority (15 of 21 BPs)
- fund.vaulta account created with network authority
- VDT multi-sig structure to be defined before final approval

#### Technical Proposals (On-Chain Implementation)
**Date Range**: 2025-11-15 to 2025-11-20

Four technical proposals created to implement Stage 1 on-chain:

1. **dev.accounts** - Account Creation Proposal
   - Commit e74ac4b: Adding dev.vaulta proposal - [link](https://github.com/greymass/msigs/commit/e74ac4b)
   - Creates infrastructure accounts for VDT (dev.vaulta and fund.vaulta)

2. **coredevdist** - Contracts & Configuration Proposal
   - Deploys distribution contracts and funding configuration

3. **unwindvf1** - Foundation Permission Reset
   - Commit 906a8d2: Initial commit with unwindvf proposal - [link](https://github.com/greymass/msigs/commit/906a8d2)
   - Status: Completed during November
   - Resets permissions for admin.grants and eosio.grants accounts

4. **miscaccounts** - Platform Infrastructure Accounts
   - Commit 494eb26: Adding miscaccounts proposal - [link](https://github.com/greymass/msigs/commit/494eb26)
   - Creates accounts for new Vaulta platform contracts

#### Proposal Tooling Development
**Key Commits**:
- Commit 2fce69b: Extracting reusable parts - [link](https://github.com/greymass/msigs/commit/2fce69b)
- Commit 7576204: Moved system contract to lib - [link](https://github.com/greymass/msigs/commit/7576204)
- Commit ec73135: Resolve top 30 producers if eosio is the account - [link](https://github.com/greymass/msigs/commit/ec73135)
- Commit 219893b: Hashing helper script - [link](https://github.com/greymass/msigs/commit/219893b)

**Tooling**: Created reusable libraries and hash verification scripts for submitting proposals on-chain with document references.

#### Repository Documentation
**Key Commits**:
- Commit c23ac80 (Nov 15): Added root README - [link](https://github.com/greymass/msigs/commit/c23ac80)
- Multiple README updates for proposal tracking

**README Features**: Status tracking, proposal links to unicove.com/msigs.io, documentation references

---

### greymass/msigs-ui

**Repository**: https://github.com/greymass/msigs-ui  
**Activity**: 25 commits to main branch (Nov 23 - Nov 29)

**Strategic Context**: This repository powers **msigs.io**, a public search engine and viewer for multisig proposals on Vaulta. It consumes the **Roborovski msig indexing API** built in greymass/roborovski, serving as both:
1. A production tool for the Vaulta community to search and review proposals
2. A **reference implementation** demonstrating how to integrate the public Roborovski msigs API

The Roborovski msigs API provides the indexed proposal data that powers msigs.io, and will be integrated into unicove.com in the future to add native multisig functionality. This work demonstrates the complete data flow: Roborovski indexes proposals → API provides data → msigs.io/Unicove consume and display.

**Work Summary**: Reference implementation and public tool for browsing multisig proposals using the Roborovski msigs API

#### Initial Implementation
**Commit 2f705b8**: Initial commit  
**Date**: 2025-11-23  
**Link**: https://github.com/greymass/msigs-ui/commit/2f705b8

**Foundation**: SvelteKit-based UI demonstrating msigs API integration patterns.

#### API Integration (Reference Implementation)
**Key Commits**:
- Commit 55836be: Configure Cloudflare adapter and use npm package for @wharfkit/msigs - [link](https://github.com/greymass/msigs-ui/commit/55836be)
- Commit d431f44: Use published version rather than local file - [link](https://github.com/greymass/msigs-ui/commit/d431f44)
- Commit a1e3e4d: Updated to search engine - [link](https://github.com/greymass/msigs-ui/commit/a1e3e4d)

**Integration**: Connected to the **Roborovski msig indexing API** via the @wharfkit/msigs client library, enabling search and display of indexed proposal data. Demonstrates best practices for integrating the public Roborovski msigs API into applications - patterns that will be reused when adding multisig features to Unicove.

#### UI Development
**Key Commits**:
- Commit d1c457f: Adjust headers and permission tree - [link](https://github.com/greymass/msigs-ui/commit/d1c457f)
- Commit 667453f: Better page to page navigation - [link](https://github.com/greymass/msigs-ui/commit/667453f)
- Commit d4e9fb4: Simplifying site - [link](https://github.com/greymass/msigs-ui/commit/d4e9fb4)
- Commit f3b15ee: Light/dark mode - [link](https://github.com/greymass/msigs-ui/commit/f3b15ee)
- Commit b9235a1: Light/dark mode fixes - [link](https://github.com/greymass/msigs-ui/commit/b9235a1)

**Features**: Permission visualization, navigation improvements, theme support. Provides developers with patterns for displaying complex multisig data.

#### Deployment
**Key Commits**:
- Commit d1673e0: Fix Cloudflare Pages build by adding explicit Rollup Linux binary dependency - [link](https://github.com/greymass/msigs-ui/commit/d1673e0)
- Commit beaf125: Added wrangler config - [link](https://github.com/greymass/msigs-ui/commit/beaf125)

**Infrastructure**: Cloudflare Pages deployment configuration for msigs.io.

**Data Infrastructure**: The project demonstrates the complete multisig data stack: the **Roborovski msig indexing service** (built on top of Roborovski's history solution) indexes all multisig proposals from the blockchain, provides a queryable API, and msigs.io consumes this API to display proposal data to users. This infrastructure now powers msigs.io and will power Unicove's future multisig features.

**Strategic Impact**: This work accomplishes multiple goals: (1) provides a public tool for the Vaulta community to search and review multisig proposals, (2) serves as documentation-by-example for developers wanting to use the public Roborovski msigs API, and (3) establishes patterns that will be integrated into Unicove's upcoming multisig features.

---

### greymass/sentiment-api

**Repository**: https://github.com/greymass/sentiment-api  
**Activity**: 13 commits to main branch (Nov 17 - Nov 19)

**Strategic Context**: This work is being done to add Sentiment voting functionality to Unicove.com. The API serves as the backend that will power this new Unicove feature, enabling stake-weighted community sentiment on topics and proposals. The API reads data from the **sentiment voting smart contracts** (aaroncox/vaulta-contracts sentiment branch) deployed on-chain and provides a queryable interface for applications.

**Sentiment Voting Infrastructure**: This API is the middle layer connecting the on-chain smart contracts (aaroncox/vaulta-contracts) to the Unicove frontend. It indexes sentiment data from the blockchain contracts and provides fast queries for displaying real-time stake-weighted sentiment.

**Work Summary**: Backend API indexing sentiment voting smart contracts and powering Unicove's Sentiment feature

#### Initial Development
**Commit 35ff9d7**: Initial scaffolding  
**Date**: 2025-11-17  
**Link**: https://github.com/greymass/sentiment-api/commit/35ff9d7

**Foundation**: Base API structure created to support Unicove's sentiment voting integration.

#### Database and Syncing
**Key Commits**:
- Commit 500f2ca: Initial database setup for weights and syncing - [link](https://github.com/greymass/sentiment-api/commit/500f2ca)
- Commit 0acca98: Embedding Drizzle like resource-provider - [link](https://github.com/greymass/sentiment-api/commit/0acca98)
- Commit cdf6a08: Fixed syncing logic - [link](https://github.com/greymass/sentiment-api/commit/cdf6a08)

**Data Layer**: Database with embedded Drizzle ORM for stake weight tracking and blockchain syncing to power real-time sentiment display in Unicove.

#### API Endpoints
**Key Commits**:
- Commit 16f3465: Added /topics API and unified pagination - [link](https://github.com/greymass/sentiment-api/commit/16f3465)
- Commit 993f206: Update timestamps when votes update - [link](https://github.com/greymass/sentiment-api/commit/993f206)
- Commit 0217db5: Fixed deletion logic - [link](https://github.com/greymass/sentiment-api/commit/0217db5)
- Commit 67a4348: Added error handling and quick syncing to start - [link](https://github.com/greymass/sentiment-api/commit/67a4348)

**API**: Topics listing with pagination, vote tracking with timestamps, error handling - all designed to integrate with Unicove's frontend.

**Context**: Rapid development cycle from concept (Nov 17) to working API (Nov 19) supporting the sentiment voting system announced in the blog post. The API powers the Unicove sentiment feature launched at https://unicove.com/en/vaulta/topic/sentiment.

---

### greymass/unicove-components

**Repository**: https://github.com/greymass/unicove-components  
**Activity**: 3 commits to main branch (Nov 3 - Nov 20)

**Strategic Context**: Svelte-based UI framework and component library providing Antelope blockchain components. This is the UI infrastructure used by Unicove to build its interface - essentially Unicove's design system and component library. The components provide consistent UI patterns for blockchain interactions, wallet connections, and data display across Unicove's features.

**Work Summary**: Component library maintenance and improvements

**Key Commits**:
- Commit 04c45aa: Export default HTML attributes from description list elements - [link](https://github.com/greymass/unicove-components/commit/04c45aa)
- Commit f3d629b: Update toggle examples to include onCheckedChange callbacks - [link](https://github.com/greymass/unicove-components/commit/f3d629b)
- Commit 81bce81: Remove size-fit from medium+ breakpoints causing button size to change - [link](https://github.com/greymass/unicove-components/commit/81bce81)

**Improvements**: Fixed button sizing responsiveness, improved component API documentation, enhanced description list components. These improvements directly support Unicove's UI development and maintain consistency across the application.

---

## Wharfkit Organization

### wharfkit/website

**Repository**: https://github.com/wharfkit/website  
**Activity**: 1 PR merged

#### PR #255: Sitemap

**Link**: https://github.com/wharfkit/website/pull/255  
**Merged**: 2025-11-23  
**Body Summary**: Added sitemap functionality to the WharfKit website to improve SEO and site navigation.

**Strategic Context**: This is SEO and discoverability work to help search engines discover root pages and crawl the WharfKit documentation site more effectively. The sitemap enables better indexing of WharfKit's documentation, making it easier for developers to find relevant SDK information through search engines.

---

### wharfkit/console-renderer

**Repository**: https://github.com/wharfkit/console-renderer  
**Activity**: 1 PR merged

#### PR #2: Making publish public

**Link**: https://github.com/wharfkit/console-renderer/pull/2  
**Merged**: 2025-11-12  
**Body Summary**: Updated package configuration to make the package publicly available on npm.

---

### wharfkit/msigs

**Repository**: https://github.com/wharfkit/msigs  
**Activity**: 8 commits to main branch (Nov 23 - Nov 24)

**Strategic Context**: TypeScript client library for the **Roborovski msig indexing API**. This library provides a developer-friendly interface to query the Roborovski msig indexer, which indexes all multisig proposals on Vaulta. Currently powers msigs.io and will be used to add multisig features to Unicove.

**Work Summary**: API client library connecting applications to the Roborovski msig indexing service

#### Initial Implementation
**Commit 9c2dec2**: Initial commit  
**Date**: 2025-11-23  
**Link**: https://github.com/wharfkit/msigs/commit/9c2dec2

**Foundation**: TypeScript API client scaffolding.

#### API Methods
**Key Commits**:
- Commit b888582: Added Search functionality - [link](https://github.com/wharfkit/msigs/commit/b888582)
- Commit 049105a: Updating get_approvals - [link](https://github.com/wharfkit/msigs/commit/049105a)
- Commit 4bb8a1b: Removed get_active and added debug_proposal - [link](https://github.com/wharfkit/msigs/commit/4bb8a1b)
- Commit 011bd7b: Updated to match API fields - [link](https://github.com/wharfkit/msigs/commit/011bd7b)

**API Coverage** (wraps Roborovski msig indexing API):
- Service status checking
- Proposal retrieval by ID from the index
- Proposals requiring approval query
- Account activity tracking
- Search functionality across indexed proposals
- Debug endpoints

**Technical Role**: Provides TypeScript types and methods for the Roborovski msig indexing API, enabling type-safe access to indexed proposal data. Used by msigs.io and will be integrated into Unicove for multisig features.

#### Releases
**Key Commits**:
- Commit c621226: v0.2.0 - [link](https://github.com/wharfkit/msigs/commit/c621226)
- Commit c8ccca7: v0.3.1 - [link](https://github.com/wharfkit/msigs/commit/c8ccca7)

**Versioning**: Two releases published during November with API improvements.

---

### wharfkit/mock-data

**Repository**: https://github.com/wharfkit/mock-data  
**Activity**: 2 commits to main branch (Nov 23)

**Work Summary**: Mock data tooling improvements

**Key Commits**:
- Commit 4097a57: Allow unix sock with mockFetch provider - [link](https://github.com/wharfkit/mock-data/commit/4097a57)
- Commit 9cf701d: v1.3.1 release - [link](https://github.com/wharfkit/mock-data/commit/9cf701d)

**Enhancement**: Added Unix socket support to mock fetch provider for testing scenarios.

---

### wharfkit/roborovski

**Repository**: https://github.com/wharfkit/roborovski  
**Branch**: https://github.com/wharfkit/roborovski/tree/filtered  
**Activity**: Active (last pushed 2025-11-21)

**Strategic Context**: This is an **initial prototype for filtered history responses**. The work enables filtering of blockchain history data to return more targeted results for applications. This filtered history capability will be used on **Unicove and other dapps** to improve history query performance and relevance.

**Important Distinction**: This filtered history work is **separate from the msig indexing work** done in greymass/roborovski. While the greymass/roborovski repository contains the msig indexing service and API that powers msigs.io, this wharfkit/roborovski work focuses on general-purpose filtered history responses for dapp usage.

**Use Cases**: The filtered history prototype will enable Unicove and other applications to request specific subsets of blockchain history data rather than receiving complete history, improving performance and user experience when displaying transaction history and account activity.

---

## Individual Developer Activity

### aaroncox/vaulta-contracts

**Repository**: https://github.com/aaroncox/vaulta-contracts  
**Branch**: https://github.com/aaroncox/vaulta-contracts/tree/Sentiment  
**Activity**: 9 commits (Nov 16-17, 2025)

**Strategic Context**: This work builds the **on-chain foundation for the sentiment voting system** - the base smart contracts that enable sentiment voting on the Vaulta blockchain. This is the foundational layer of the sentiment voting infrastructure stack.

**Sentiment Voting Infrastructure Stack**:
1. **aaroncox/vaulta-contracts (sentiment branch)** - Smart contracts on-chain providing the core sentiment voting functionality
2. **greymass/sentiment-api** - Reads data from these contracts, indexes sentiment data, and provides a queryable API
3. **Unicove** - Consumes the sentiment-api to offer the sentiment voting feature to users at unicove.com/en/vaulta/topic/sentiment

**Technical Role**: The smart contracts deployed from this branch provide the on-chain storage and logic for sentiment voting. The contracts handle vote recording, stake-weight calculation, and topic management. The sentiment-api indexes data from these contracts to provide fast queries, and Unicove integrates with the API to display real-time stake-weighted sentiment to users.

**Context**: These contracts are the blockchain foundation announced in the November 19 blog post "Stake-weighted Sentiment" and power the sentiment voting system launched at Unicove. Without these contracts, the sentiment-api would have no data source, and Unicove would have no sentiment voting feature.

#### Smart Contract Implementation (Nov 16-17)

**Commit 619ad50**: Rough implementation of sentiment voting contract  
**Date**: 2025-11-17  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/619ad50454aced22e5ce96a15f82bf9ad7550bce  
**Changes**: Initial implementation of the core sentiment voting smart contract with voting logic and data structures.

**Commit b3d3e3b**: Added getweight/getweights readonly actions  
**Date**: 2025-11-17  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/b3d3e3b3668163d38deba35aa16c15d48a6df2ae  
**Changes**: Added readonly query actions for retrieving sentiment weight data, enabling the sentiment-api to efficiently read voting data.

**Commit 9f35f86**: Enabled config wipe during reset  
**Date**: 2025-11-17  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/9f35f8648504635ac09b75d97ccbb1d2cb36dbb4  
**Changes**: Added configuration reset functionality for development and testing workflows.

**Commit 0d2135d**: Configured to use development build  
**Date**: 2025-11-17  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/0d2135d35f9d28768b6548fb1d34cd955dc510aa  
**Changes**: Updated build configuration for development environment.

**Commit 4b07cd6**: Added publishing command  
**Date**: 2025-11-17  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/4b07cd63683900955b37093e4254e5b3eccc80ba  
**Changes**: Added contract publishing automation for deployment workflows.

**Commit c4bcb2f**: Updated Makefile  
**Date**: 2025-11-17  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/c4bcb2f1a0fd203c8eeb2d231172dc2fdd2a2fe0  
**Changes**: Makefile updates for build and deployment processes.

**Commit 2434c70**: Updated test.yml for CI/CD  
**Date**: 2025-11-17  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/2434c709cb6af1c8bcc9f0eca8da24d2e730745c  
**Changes**: CI/CD pipeline configuration updates for automated testing.

**Commit 77e5830**: Updated Makefile  
**Date**: 2025-11-16  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/77e58306758ecc448389743566f16748bcbf6516  
**Changes**: Additional Makefile refinements.

**Commit da0fd12**: Initial commit on Sentiment branch  
**Date**: 2025-11-16  
**Link**: https://github.com/aaroncox/vaulta-contracts/commit/da0fd12177d0c0969c8b942b86a766eddaa7751c  
**Changes**: Created Sentiment branch and initial project structure for sentiment voting contracts.

**Development Timeline**: Complete smart contract implementation from initial commit (Nov 16) to deployed contracts with query APIs (Nov 17), enabling the sentiment-api development that started Nov 17 and the public launch announced Nov 19.

---

## New Repositories

### greymass/evm-bridge-frontend

**Created**: 2025-11-13  
**Repository**: https://github.com/greymass/evm-bridge-frontend  
**Purpose**: Community response to Vaulta EVM shutdown - forked and relaunched to maintain token holder access to withdraw assets from the EVM  
**Technology Stack**: Vue.js, Yarn, ESLint  
**Initial Activity**: 1 PR merged (cleanup), active development

**Context**: Originally built by Vaulta Foundation (VF), this bridge frontend was shut down when VF ceased Vaulta EVM operations in October 2025. Token holders still needed access to withdraw their tokens from the EVM, creating an urgent access problem. The project was forked and relaunched to restore this critical functionality, ensuring users could continue to access and withdraw their assets. This work is part of the broader community response to the EVM infrastructure shutdown - while greymass/msigs addresses governance transition, evm-bridge-frontend addresses immediate user access needs.

**README Summary**: The frontend application for interacting with the Vaulta EVM trustless bridge. The application runs on Mainnet by default but can access testnet by adding `?testnet` to the URL. Built with Vue.js and provides a user interface for bridging assets between networks. Following the Vaulta EVM shutdown by VF, maintaining this interface became essential for protecting token holder access to their assets.

---

### greymass/msigs

**Created**: 2025-11-14  
**Repository**: https://github.com/greymass/msigs  
**Purpose**: Vaulta Foundation transition proposals and on-chain multisig tooling  
**Technology Stack**: TypeScript (Bun runtime), Antelope smart contracts  
**Initial Activity**: 40 commits in November, active development continuing into December

**README Summary**: Repository containing multisig proposals for the Vaulta network, focusing on Stage 1 transition from Vaulta Foundation to new entities (VDT & VNT). Includes proposal documents (markdown), technical implementations (TypeScript), and tooling for creating and submitting on-chain multisig proposals. Features document hashing for on-chain verification and comprehensive documentation for each proposal with status tracking.

---

### greymass/sentiment-api

**Created**: 2025-11-17  
**Repository**: https://github.com/greymass/sentiment-api  
**Purpose**: Backend API powering Unicove's new Sentiment voting feature - reads from sentiment voting smart contracts and provides queryable API for stake-weighted community sentiment  
**Technology Stack**: Not specified  
**Initial Activity**: Initial commits, last pushed 2025-11-19

**Strategic Context**: This work is being done to add Sentiment voting functionality to Unicove.com. The API is the middle layer that reads data from the **sentiment voting smart contracts** (aaroncox/vaulta-contracts sentiment branch) deployed on-chain and provides a backend for Unicove's frontend to display real-time stake-weighted sentiment.

**Sentiment Voting Infrastructure**: Part of the complete sentiment voting stack - smart contracts on-chain (aaroncox/vaulta-contracts) → API indexes and serves data (sentiment-api) → Unicove displays to users. Without the smart contracts, this API would have no data source; without this API, Unicove would need to query blockchain data directly.

**README Summary**: No public README available at time of research. Related to the sentiment voting system described in the November 19 blog post and launched at https://unicove.com/en/vaulta/topic/sentiment.

---

### greymass/msigs-ui

**Created**: 2025-11-23  
**Repository**: https://github.com/greymass/msigs-ui  
**Purpose**: Powers msigs.io - a public search engine and viewer for multisig proposals. Consumes the **Roborovski msig indexing API** and serves as a reference implementation.  
**Technology Stack**: SvelteKit, @wharfkit/msigs API client, Cloudflare Pages  
**Initial Activity**: 25 commits in November, deployed to production at msigs.io

**Data Infrastructure**: Consumes indexed proposal data from the **Roborovski msig indexing service** (greymass/roborovski), which was built as a prototype on top of Roborovski's existing history solution. This indexer is now the data source powering msigs.io.

**README Summary**: Reference implementation demonstrating how to build applications using the public Roborovski msigs API. The project serves dual purposes: (1) providing a community tool for searching and reviewing multisig proposals, and (2) showcasing API integration patterns that will be reused when adding multisig functionality to Unicove. This demonstrates the complete stack: Roborovski indexes proposals → provides API → msigs.io/Unicove display data.

---

### wharfkit/msigs

**Created**: 2025-11-23  
**Repository**: https://github.com/wharfkit/msigs  
**Purpose**: TypeScript client library for the **Roborovski msig indexing API**  
**Technology Stack**: TypeScript, @wharfkit/antelope  
**Initial Activity**: Initial release, last pushed 2025-11-24

**Data Infrastructure**: Client library for the **Roborovski msig indexing service** built in greymass/roborovski. This indexer indexes all multisig proposals on Vaulta and provides an API for applications to query proposal data. Currently used by msigs.io and will power Unicove's future multisig features.

**README Summary**: An API client library for interacting with the Roborovski msig indexing API. Provides methods to get service status, retrieve specific proposals from the index, query proposals requiring approval, and get account activity. Supports filtering by status and includes pagination options. Install via `yarn add @wharfkit/msigs`.

---

## Publications

### "Stake-weighted Sentiment"

**Published**: 2025-11-19  
**Source**: https://jesta.blog/p/stake-weighted-sentiment  
**RSS Entry**: https://jesta.blog/feed (item 2025-11-19)

**Content Summary**: Introduction and explanation of a new stake-weighted sentiment system prototype that allows DPoS token holders to express support or opposition to ideas and topics. The system is designed to gauge community sentiment and inform block producers without directly impacting governance decisions.

**Key Topics**:
- **Sentiment Polling System**: A simple smart contract and UI that enables stake-weighted polling on topics and ideas
- **Opinion Visibility**: Provides token holders a way to express opinions that can inform block producer decisions
- **User Experience**: Positions are weighted by staked tokens, votes are stored on-chain using user's RAM and can be removed to reclaim RAM
- **Real-time Sentiment**: Provides a real-time snapshot of overall sentiment towards specific topics with sufficient participation
- **Prototype Launch**: System launched at https://unicove.com/en/vaulta/topic/sentiment with the first topic being about whether the sentiment system itself is useful
- **Technical Implementation**: Built rapidly leveraging existing Wharf and Unicove infrastructure
- **Call to Action**: Encourages community participation to determine if the system is valuable enough to continue developing

**Technical Details**:
- Votes stored on-chain using voter's RAM allocation
- Support/opposition expressed as binary choice
- Weight calculated based on staked token amount
- Topics consist of human-readable identifier and text description
- Topics page shows all active topics sorted by total weight
- Current implementation requires authorized accounts to create topics
- System depends on engagement to determine future development

**Context**: This publication directly relates to the sentiment-api repository created on November 17, 2025, showing the rapid development and deployment cycle from concept to working prototype to public announcement.

---

## Notable Technical Discussions

No PRs with significant discussion activity (>5 comments) were found during November 2025. The merged PRs were straightforward changes without extended technical discussion threads.

---

## For Downstream Agents

**Summary Writer** (`agents/summary.md`):
- Read this file for complete context
- Use source links for verification
- Focus on outcomes and business impact
- Reference repo-names.md for display names
- Key themes: sentiment voting system, multisig tooling, EVM bridge development

**Technical Writer** (`agents/technical.md`):
- Read this file for complete context
- Include PR numbers and links from here
- Cite sources when making technical claims
- Use discussion summaries for context
- Notable technical work: sentiment voting smart contracts, multisig API development

**Both agents**: Focus on the WORK and DISCUSSIONS documented here, not the individuals. This research emphasizes what was done and what was decided.

**November 2025 Themes**:
1. **VF Transition Governance**: Stage 1 proposal development for transitioning from Vaulta Foundation to new entities (VDT & VNT), including proposal documents at v8 and technical implementation tooling (greymass/msigs)
2. **Multisig Data Infrastructure**: Built complete multisig ecosystem powered by the **Roborovski msig indexing service** (greymass/roborovski) - a prototype indexer and API built on Roborovski's history solution that now powers msigs.io and will enable multisig features in Unicove. Includes TypeScript client library (wharfkit/msigs) and reference implementation UI (greymass/msigs-ui)
3. **Sentiment Voting**: New stake-weighted sentiment system from concept to deployment
4. **Developer Experience**: WharfKit adoption across projects, localization prototype
5. **UI/UX Improvements**: Web-authenticator transaction prompts, Unicove internationalization, component library refinements
6. **EVM Bridge Development**: Frontend development for the Vaulta EVM trustless bridge
