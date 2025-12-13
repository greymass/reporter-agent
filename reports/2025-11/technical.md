# Technical Activity Report
## November 2025

**Navigation**: [← Previous Month](../2025-10/technical.md)

*Also available: [Executive Summary](README.md) | [Research Data](research.md)*

November 2025 focused on three major technical initiatives: (1) building a complete sentiment polling infrastructure stack from smart contracts to API to UI, (2) developing comprehensive multisig proposal tooling and documentation for the Vaulta Foundation transition, and (3) establishing a new multisig data infrastructure powered by the Roborovski msig indexing service. Additional work included Web Authenticator UI refinements, Unicove localization prototyping, and EVM bridge frontend development following the Vaulta EVM shutdown.

**Key Achievements**:
- Launched sentiment polling system with stake-weighted voting across smart contract, API, and UI layers
- Built complete proposal system with search engine (msigs.io) supporting governance transition
- Deployed Roborovski multisig indexer providing queryable proposal data infrastructure
- Improved Web Authenticator signing interface reducing onboarding confusion
- Restored bridge interface enabling token holders to recover assets after EVM shutdown
- Published WharfKit proposal libraries enabling developer access to multisig data
- Created 5 new repositories establishing governance and sentiment polling infrastructure

**Technical Significance**: November marked a strategic pivot toward governance infrastructure development responding to Vaulta Foundation transition. The sentiment polling stack demonstrates full-stack capability: smart contract implementation, backend API service, and production frontend integration at Unicove. Roborovski indexer establishes critical data infrastructure making proposal information queryable and accessible across applications. Work directly addresses foundation shutdown by providing community-managed governance tools and protecting user access to bridged assets. This month established foundational infrastructure for decentralized governance and community coordination.

---

## Table of Contents

- [Cross-Repository Insights](#cross-repository-insights)
- [Greymass Organization](#greymass-organization)
  - [greymass/web-authenticator](#greymassweb-authenticator)
  - [greymass/unicove](#greymassunicove)
  - [greymass/sextant](#greymasssextant)
  - [greymass/evm-bridge-frontend](#greymassevm-bridge-frontend)
  - [greymass/roborovski](#greymassroborovski)
  - [greymass/msigs](#greymassmsigs)
  - [greymass/msigs-ui](#greymassmsigs-ui)
  - [greymass/sentiment-api](#greymasssentiment-api)
  - [greymass/unicove-components](#greymassunicove-components)
- [Wharfkit Organization](#wharfkit-organization)
  - [wharfkit/website](#wharfkitwebsite)
  - [wharfkit/console-renderer](#wharfkitconsole-renderer)
  - [wharfkit/msigs](#wharfkitmsigs)
  - [wharfkit/mock-data](#wharfkitmock-data)
  - [wharfkit/roborovski](#wharfkitroborovski)
- [Individual Developer Activity](#individual-developer-activity)
  - [aaroncox/vaulta-contracts](#aaroncoxvaulta-contracts)
- [New Repositories](#new-repositories)
- [Development Patterns](#development-patterns)

---

## Cross-Repository Insights

### Sentiment Polling Full-Stack Integration

**Integration**: Complete sentiment voting system spanning smart contract, API service, and frontend UI across three repositories.

**How It Works**:
- vaulta-contracts implemented sentiment voting smart contract (aaroncox/vaulta-contracts) with stake-weighted voting logic and voter storage management
- sentiment-api provides backend service (greymass/sentiment-api) querying contract state and serving voting data through REST API
- Unicove integrated sentiment UI (greymass/unicove) displaying polls, vote submission, and real-time results visualization

**Technical Benefit**: Three-layer architecture separates concerns: smart contract handles blockchain logic and data storage, API service provides efficient data access without direct blockchain queries, frontend focuses on user experience. This pattern enables multiple frontends to consume the same data through shared API without duplicating blockchain integration logic.

**Strategic Impact**: Demonstrates capability to deliver complete product features spanning full technical stack. First production launch of stake-weighted community sentiment system on Antelope. Provides mechanism for token holder opinion visibility without binding governance decisions. Launched with self-referential first poll asking community if feature is valuable.

---

### Multisig Infrastructure with Roborovski Indexer

**Integration**: Roborovski indexer providing queryable multisig data consumed by multiple applications.

**How It Works**:
- Roborovski service (greymass/roborovski) indexes multisig proposals from blockchain, maintaining queryable database of proposal history, status, and metadata
- msigs.io application (greymass/msigs-ui) consumes Roborovski API to provide public search engine for browsing and filtering proposals
- Unicove (greymass/unicove) integrates Roborovski data for proposal visualization within block explorer context
- WharfKit libraries (wharfkit/roborovski, wharfkit/msigs) provide developer-friendly access to proposal data

**Technical Benefit**: Indexer pattern eliminates need for each application to query blockchain directly and build own proposal state. Single indexer service provides consistent data to multiple consumers. WharfKit library abstraction enables any developer to integrate proposal data without understanding indexer implementation details.

**Strategic Impact**: Establishes shared infrastructure for governance tools. msigs.io public search engine provides transparency into proposal process during foundation transition. Multiple consumer pattern demonstrates infrastructure thinking: build once, reuse across applications. Critical for decentralized governance requiring proposal visibility.

---

### WharfKit Proposal Library Ecosystem

**Integration**: Shared TypeScript libraries enabling developer access to multisig and proposal data.

**How It Works**:
- wharfkit/msigs library provides proposal query interfaces, data models, and helper functions for multisig operations
- wharfkit/roborovski library wraps Roborovski indexer API in TypeScript types and query builders
- Libraries enable applications to integrate proposal functionality with type safety and consistent patterns
- wharfkit/mock-data provides test fixtures for development without live blockchain dependency

**Technical Benefit**: Library abstraction reduces implementation complexity for applications needing proposal data. Type safety prevents runtime errors from API misuse. Mock data enables faster development and testing. Consistent patterns across WharfKit ecosystem improve developer experience and code maintainability.

**Strategic Impact**: Lowers barrier for community developers to build governance-aware applications. Open source libraries enable ecosystem growth beyond Greymass-built applications. Establishes WharfKit as governance data access layer for Antelope applications.

---

## Greymass Organization

### greymass/web-authenticator

**Repository**: https://github.com/greymass/web-authenticator  
**Activity**: 4 commits pushed to main

#### Overview

Web Authenticator is a no-download web-based non-custodial cloud wallet that integrates with Wharf (WharfKit) to provide frictionless blockchain onboarding. November focused on improving the transaction signing and session management UX - critical for first-time blockchain users who need clear, trustworthy interfaces without technical complexity.

#### Commits (Direct to main)

**[f0a0f1e](https://github.com/greymass/web-authenticator/commit/f0a0f1e) - Updates to transaction prompt (#221)**  
*Pushed: 2025-11-28*

Major improvements to the transaction signing experience with better presentation of transaction details:

**Changes**:
- Fixed TypeScript build configuration to properly catch Svelte component errors
- Resolved vertical overflow bug in UI components
- Added scroll area component for better content handling in transaction prompts
- Refactored account button component for improved UX
- Created new modal account selector component
- Redesigned transaction prompt styling:
  - Expiry card styling improvements
  - Action summary presentation enhancements
  - Ricardian contract display optimization
  - Transaction details component using melt-ui tabs
  - Dangerous action warning styles with tooltips
- Added balance display by default
- Updated environment variable configuration

**Impact**: Clearer transaction details help new users understand what they're signing without overwhelming them - critical for the no-download wallet onboarding experience.

---

**[022d69c](https://github.com/greymass/web-authenticator/commit/022d69c) - Simplified Dialog component (#219)**  
*Pushed: 2025-11-04*

Session management UI improvements for clearer dapp connection handling:

**Changes**:
- Integrated melt-ui dialog component for consistent modal behavior
- Simplified styling on session details page
- Unified dialog usage across session list and account details pages
- Fixed key handling in wallet connections loop
- Fixed fallback icon display for wallet connections
- Upgraded unicove-components dependency
- Applied button width consistency fixes
- Improved spacing and layout consistency using buttongroup component

**Impact**: Consistent modal behavior and improved visual hierarchy reduce confusion during the onboarding flow.

---

**[2c284cb](https://github.com/greymass/web-authenticator/commit/2c284cb) - Add adaptive favicon (#218)**  
*Pushed: 2025-11-04*

Added adaptive favicon support for better branding across different platforms and themes.

---

**[c364533](https://github.com/greymass/web-authenticator/commit/c364533) - Fix overflowing id on connections page (#220)**  
*Pushed: 2025-11-04*

Fixed UI overflow issue when displaying connection IDs on the connections management page.

---

### greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Activity**: 9 commits pushed to main

#### Overview

Unicove development focused on three areas: (1) localization prototype implementation using the "Wuchale" system for multi-language support, (2) wallet plugin expansion with GateWallet integration, and (3) multisig page UI improvements. The localization work establishes the foundation for international user support.

#### Commits (Direct to main)

##### Localization Prototype (Wuchale Integration)

**[443b8a6](https://github.com/greymass/unicove/commit/443b8a6) - Merged localization prototype (#539)**  
*Pushed: 2025-11-06*

Integrated the "Wuchale" localization system for multi-language support across Unicove.

**[1c7cd17](https://github.com/greymass/unicove/commit/1c7cd17) - Merged fixes to wuchale integration (#542)**  
*Pushed: 2025-11-15*

Applied fixes for locale handling across the application.

**[e3aac9e](https://github.com/greymass/unicove/commit/e3aac9e) - Load locale in every layout.ts load function**  
*Pushed: 2025-11-15*

Added locale loading to all layout load functions for consistent i18n behavior throughout the application.

##### Wallet Integration

**[9358fdb](https://github.com/greymass/unicove/commit/9358fdb) - Merged wallet-plugin-gatewallet (#545)**  
*Pushed: 2025-11-15*

Added GateWallet plugin support, expanding wallet compatibility options for users.

**[ed42718](https://github.com/greymass/unicove/commit/ed42718) - Integrated wallet-plugin-gatewallet**  
*Pushed: 2025-11-15*

Implementation commit for wallet-plugin-gatewallet integration.

##### Multisig Page Improvements

**[272d1f2](https://github.com/greymass/unicove/commit/272d1f2) - Always show variant selector on msig page**  
*Pushed: 2025-11-15*

Improved multisig page UX by ensuring variant selector visibility.

**[cf30a43](https://github.com/greymass/unicove/commit/cf30a43) - Split apart the msig page into sections**  
*Pushed: 2025-11-15*

Refactored multisig proposal page into logical sections with improved navigation.

**[858f512](https://github.com/greymass/unicove/commit/858f512) - Disable newaccount summary element**  
*Pushed: 2025-11-15*

Disabled incomplete newaccount summary feature to prevent user confusion.

---

### greymass/sextant

**Repository**: https://github.com/greymass/sextant  
**Activity**: 1 PR merged

#### Overview

Sextant is the shared account creation platform powering account creation across multiple Greymass products including Anchor, MetaMask integration, Unicove, and Web Authenticator.

#### Pull Requests

**[#7](https://github.com/greymass/sextant/pull/7) - Adding vaulta to forbidden words**  
*Merged: 2025-11-03*

**Description**: Updated forbidden words list to include "vaulta" to prevent name conflicts or inappropriate content in accounts created through the platform.

**Impact**: Maintains content moderation standards across the shared account creation infrastructure used by multiple products.

---

### greymass/evm-bridge-frontend

**Repository**: https://github.com/greymass/evm-bridge-frontend  
**Activity**: 1 PR merged | New repository

#### Overview

Community response to the Vaulta EVM shutdown by Vaulta Foundation (VF) in October 2025. This project was forked and relaunched to maintain token holder access to withdraw assets from the EVM. While greymass/msigs addresses governance transition, evm-bridge-frontend addresses immediate user access needs.

#### Pull Requests

**[#1](https://github.com/greymass/evm-bridge-frontend/pull/1) - Initial cleanup**  
*Merged: 2025-11-15*

**Description**: Initial cleanup work on the forked EVM bridge frontend codebase to restore functionality for token holders needing to withdraw assets from the EVM.

**Impact**: Ensures users maintain access to their assets following the Vaulta EVM infrastructure shutdown.

---

### greymass/roborovski

**Repository**: https://github.com/greymass/roborovski  
**Activity**: Active deployments (last pushed 2025-11-29)

#### Overview

Roborovski is the core infrastructure powering the multisig ecosystem. A new **multisig indexing service and API** was built as a prototype on top of the existing Roborovski history solution in November. This msig indexer indexes all multisig proposals on the Vaulta blockchain and provides a queryable API.

**Current Usage**: Powers msigs.io (public multisig search engine)  
**Future Usage**: Will power Unicove's native multisig functionality

**Data Flow**: Roborovski indexes proposals from blockchain → Provides queryable API → Applications (msigs.io, Unicove) consume API to display proposal data

No direct commits to the repository in November - activity is reflected in deployment and infrastructure work to support the new msig indexing capabilities.

---

### greymass/msigs

**Repository**: https://github.com/greymass/msigs  
**Activity**: 40 commits to main branch | New repository

#### Overview

This repository contains proposals for resolving the Vaulta Foundation (VF) shutdown. The primary work is developing **proposal documents** (markdown files) outlining governance transitions from VF to new entities (VDT & VNT), along with tooling for submitting proposals on-chain. November focused on Stage 1 proposal iteration from v6 to v8 and implementation of four technical on-chain proposals.

#### Commits (Direct to main)

##### Stage 1 Proposal Document Development

**Primary Document**: `documents/stage-1.md` (VF Transition Proposal)

**[340d25c](https://github.com/greymass/msigs/commit/340d25c) - Converting V6 document to Markdown**  
*Pushed: 2025-11-24*

Converted Stage 1 proposal v6 to Markdown format for version control and collaboration.

**[d7fc052](https://github.com/greymass/msigs/commit/d7fc052) - Diagram updates**  
*Pushed: 2025-11-24*

Updated diagrams illustrating the VF to VDT/VNT transition architecture.

**[a7e6e3d](https://github.com/greymass/msigs/commit/a7e6e3d) - Refined comparison table, updated ownership language, simplified messaging**  
*Pushed: 2025-11-24*

Improved proposal clarity with refined comparison tables and simplified language.

**[406bacb](https://github.com/greymass/msigs/commit/406bacb) - Added version number**  
*Pushed: 2025-11-24*

Added version tracking to proposal document.

**[0bd105b](https://github.com/greymass/msigs/commit/0bd105b) - Adding links to the technical documents**  
*Pushed: 2025-11-24*

Added cross-references to technical implementation documents.

**[7e23e0c](https://github.com/greymass/msigs/commit/7e23e0c) - Updating links**  
*Pushed: 2025-11-24*

Updated documentation links.

**[fcbec19](https://github.com/greymass/msigs/commit/fcbec19) - Update stage-1.md**  
*Pushed: 2025-11-26*

Final updates to Stage 1 proposal document.

**Status by End of November**: Stage 1 Proposal at v8 (Draft)

**v8 Key Changes**:
- dev.vaulta account created with network authority (15 of 21 BPs)
- fund.vaulta account created with network authority
- VDT multi-sig structure to be defined before final approval

##### Technical Proposals (On-Chain Implementation)

Four technical proposals created to implement Stage 1 on-chain:

**1. dev.accounts - Account Creation Proposal**

**[e74ac4b](https://github.com/greymass/msigs/commit/e74ac4b) - Adding dev.vaulta proposal**  
*Pushed: 2025-11-15*

Creates infrastructure accounts for VDT (dev.vaulta and fund.vaulta).

**2. coredevdist - Contracts & Configuration Proposal**

Deploys distribution contracts and funding configuration.

**3. unwindvf1 - Foundation Permission Reset**

**[906a8d2](https://github.com/greymass/msigs/commit/906a8d2) - Initial commit with unwindvf proposal**  
*Pushed: 2025-11-19*

Resets permissions for admin.grants and eosio.grants accounts. Completed during November.

**4. miscaccounts - Platform Infrastructure Accounts**

**[494eb26](https://github.com/greymass/msigs/commit/494eb26) - Adding miscaccounts proposal**  
*Pushed: 2025-11-20*

Creates accounts for new Vaulta platform contracts.

##### Proposal Tooling Development

**[2fce69b](https://github.com/greymass/msigs/commit/2fce69b) - Extracting reusable parts**  
*Pushed: 2025-11-19*

Created reusable libraries for proposal tooling.

**[7576204](https://github.com/greymass/msigs/commit/7576204) - Moved system contract to lib**  
*Pushed: 2025-11-19*

Refactored system contract code into shared library.

**[ec73135](https://github.com/greymass/msigs/commit/ec73135) - Resolve top 30 producers if eosio is the account**  
*Pushed: 2025-11-19*

Added logic to resolve top 30 block producers for network authority proposals.

**[219893b](https://github.com/greymass/msigs/commit/219893b) - Hashing helper script**  
*Pushed: 2025-11-19*

Created hash verification scripts for document integrity on-chain.

##### Repository Documentation

**[c23ac80](https://github.com/greymass/msigs/commit/c23ac80) - Added root README**  
*Pushed: 2025-11-15*

Created comprehensive README with status tracking and proposal documentation.

---

### greymass/msigs-ui

**Repository**: https://github.com/greymass/msigs-ui  
**Activity**: 25 commits to main branch | New repository

#### Overview

Powers **msigs.io**, a public search engine and viewer for multisig proposals on Vaulta. Consumes the **Roborovski msig indexing API** and serves as a reference implementation demonstrating how to integrate the public Roborovski msigs API. This demonstrates the complete data stack: Roborovski indexes proposals → API provides data → msigs.io displays proposals.

#### Commits (Direct to main)

##### Initial Implementation

**[2f705b8](https://github.com/greymass/msigs-ui/commit/2f705b8) - Initial commit**  
*Pushed: 2025-11-23*

SvelteKit-based UI foundation demonstrating msigs API integration patterns.

##### API Integration (Reference Implementation)

**[55836be](https://github.com/greymass/msigs-ui/commit/55836be) - Configure Cloudflare adapter and use npm package for @wharfkit/msigs**  
*Pushed: 2025-11-23*

Configured Cloudflare Pages deployment and integrated @wharfkit/msigs client library.

**[d431f44](https://github.com/greymass/msigs-ui/commit/d431f44) - Use published version rather than local file**  
*Pushed: 2025-11-23*

Switched from local development files to published npm package.

**[a1e3e4d](https://github.com/greymass/msigs-ui/commit/a1e3e4d) - Updated to search engine**  
*Pushed: 2025-11-23*

Connected to Roborovski msig indexing API for search functionality.

**Impact**: Demonstrates best practices for integrating the public Roborovski msigs API - patterns that will be reused when adding multisig features to Unicove.

##### UI Development

**[d1c457f](https://github.com/greymass/msigs-ui/commit/d1c457f) - Adjust headers and permission tree**  
*Pushed: 2025-11-23*

Improved permission visualization for multisig approval requirements.

**[667453f](https://github.com/greymass/msigs-ui/commit/667453f) - Better page to page navigation**  
*Pushed: 2025-11-24*

Enhanced navigation between proposal pages.

**[d4e9fb4](https://github.com/greymass/msigs-ui/commit/d4e9fb4) - Simplifying site**  
*Pushed: 2025-11-24*

Simplified UI for better clarity.

**[f3b15ee](https://github.com/greymass/msigs-ui/commit/f3b15ee) - Light/dark mode**  
*Pushed: 2025-11-24*

Added theme support for light/dark mode.

**[b9235a1](https://github.com/greymass/msigs-ui/commit/b9235a1) - Light/dark mode fixes**  
*Pushed: 2025-11-25*

Fixed theme support issues.

##### Deployment

**[d1673e0](https://github.com/greymass/msigs-ui/commit/d1673e0) - Fix Cloudflare Pages build by adding explicit Rollup Linux binary dependency**  
*Pushed: 2025-11-23*

Resolved Cloudflare Pages build issues by explicitly adding Rollup Linux binary dependency.

**[beaf125](https://github.com/greymass/msigs-ui/commit/beaf125) - Added wrangler config**  
*Pushed: 2025-11-23*

Added Cloudflare Wrangler configuration for deployment automation.

**Strategic Impact**: Accomplishes multiple goals: (1) provides a public tool for the Vaulta community, (2) serves as documentation-by-example for the Roborovski msigs API, and (3) establishes patterns for Unicove's upcoming multisig features.

---

### greymass/sentiment-api

**Repository**: https://github.com/greymass/sentiment-api  
**Activity**: 13 commits to main branch | New repository

#### Overview

Backend API powering Unicove's new Sentiment voting feature at https://unicove.com/en/vaulta/topic/sentiment. This API is the middle layer connecting on-chain sentiment voting smart contracts (aaroncox/vaulta-contracts) to the Unicove frontend. It indexes sentiment data from blockchain contracts and provides fast queries for displaying real-time stake-weighted sentiment.

**Sentiment Voting Infrastructure Stack**:
1. aaroncox/vaulta-contracts (sentiment branch) - Smart contracts on-chain
2. greymass/sentiment-api - Indexes contract data and provides API
3. Unicove - Consumes API to display sentiment voting

#### Commits (Direct to main)

##### Initial Development

**[35ff9d7](https://github.com/greymass/sentiment-api/commit/35ff9d7) - Initial scaffolding**  
*Pushed: 2025-11-17*

Base API structure created to support Unicove's sentiment voting integration.

##### Database and Syncing

**[500f2ca](https://github.com/greymass/sentiment-api/commit/500f2ca) - Initial database setup for weights and syncing**  
*Pushed: 2025-11-17*

Database schema for stake weight tracking and blockchain syncing.

**[0acca98](https://github.com/greymass/sentiment-api/commit/0acca98) - Embedding Drizzle like resource-provider**  
*Pushed: 2025-11-17*

Integrated embedded Drizzle ORM for database operations.

**[cdf6a08](https://github.com/greymass/sentiment-api/commit/cdf6a08) - Fixed syncing logic**  
*Pushed: 2025-11-17*

Corrected blockchain sync logic for accurate sentiment data indexing.

##### API Endpoints

**[16f3465](https://github.com/greymass/sentiment-api/commit/16f3465) - Added /topics API and unified pagination**  
*Pushed: 2025-11-17*

Created topics listing endpoint with pagination support.

**[993f206](https://github.com/greymass/sentiment-api/commit/993f206) - Update timestamps when votes update**  
*Pushed: 2025-11-17*

Added timestamp tracking for vote changes to enable real-time updates.

**[0217db5](https://github.com/greymass/sentiment-api/commit/0217db5) - Fixed deletion logic**  
*Pushed: 2025-11-17*

Corrected vote deletion handling for RAM reclamation scenarios.

**[67a4348](https://github.com/greymass/sentiment-api/commit/67a4348) - Added error handling and quick syncing to start**  
*Pushed: 2025-11-19*

Improved error handling and optimized initial sync performance.

**Development Timeline**: Rapid development from concept (Nov 17) to working API (Nov 19) supporting the sentiment voting system announced in the blog post.

---

### greymass/unicove-components

**Repository**: https://github.com/greymass/unicove-components  
**Activity**: 3 commits to main branch

#### Overview

Svelte-based UI framework and component library providing Antelope blockchain components. This is Unicove's design system and component library providing consistent UI patterns for blockchain interactions, wallet connections, and data display.

#### Commits (Direct to main)

**[04c45aa](https://github.com/greymass/unicove-components/commit/04c45aa) - Export default HTML attributes from description list elements**  
*Pushed: 2025-11-03*

Enhanced description list components with proper HTML attribute exports.

**[f3d629b](https://github.com/greymass/unicove-components/commit/f3d629b) - Update toggle examples to include onCheckedChange callbacks**  
*Pushed: 2025-11-03*

Improved component API documentation with callback examples.

**[81bce81](https://github.com/greymass/unicove-components/commit/81bce81) - Remove size-fit from medium+ breakpoints causing button size to change**  
*Pushed: 2025-11-20*

Fixed responsive button sizing issue that caused inconsistent button dimensions across breakpoints.

**Impact**: These improvements directly support Unicove's UI development and maintain consistency across the application.

---

## Wharfkit Organization

### wharfkit/website

**Repository**: https://github.com/wharfkit/website  
**Activity**: 1 PR merged

#### Pull Requests

**[#255](https://github.com/wharfkit/website/pull/255) - Sitemap**  
*Merged: 2025-11-23*

**Description**: Added sitemap functionality to the WharfKit website to improve SEO and site navigation.

**Impact**: Improves search engine discoverability of WharfKit documentation, making it easier for developers to find SDK information through search engines.

---

### wharfkit/console-renderer

**Repository**: https://github.com/wharfkit/console-renderer  
**Activity**: 1 PR merged

#### Pull Requests

**[#2](https://github.com/wharfkit/console-renderer/pull/2) - Making publish public**  
*Merged: 2025-11-12*

**Description**: Updated package configuration to make the package publicly available on npm.

**Impact**: Enables public npm distribution of the console-renderer package.

---

### wharfkit/msigs

**Repository**: https://github.com/wharfkit/msigs  
**Activity**: 8 commits to main branch | New repository

#### Overview

TypeScript client library for the **Roborovski msig indexing API**. Provides a developer-friendly interface to query the Roborovski msig indexer which indexes all multisig proposals on Vaulta. Currently powers msigs.io and will be used to add multisig features to Unicove.

#### Commits (Direct to main)

##### Initial Implementation

**[9c2dec2](https://github.com/wharfkit/msigs/commit/9c2dec2) - Initial commit**  
*Pushed: 2025-11-23*

TypeScript API client scaffolding for Roborovski msigs API.

##### API Methods

**[b888582](https://github.com/wharfkit/msigs/commit/b888582) - Added Search functionality**  
*Pushed: 2025-11-23*

Implemented search functionality across indexed proposals.

**[049105a](https://github.com/wharfkit/msigs/commit/049105a) - Updating get_approvals**  
*Pushed: 2025-11-23*

Updated approvals query method to match API changes.

**[4bb8a1b](https://github.com/wharfkit/msigs/commit/4bb8a1b) - Removed get_active and added debug_proposal**  
*Pushed: 2025-11-24*

Refactored API methods and added debug endpoints.

**[011bd7b](https://github.com/wharfkit/msigs/commit/011bd7b) - Updated to match API fields**  
*Pushed: 2025-11-24*

Synchronized TypeScript types with API schema changes.

**API Coverage** (wraps Roborovski msig indexing API):
- Service status checking
- Proposal retrieval by ID from index
- Proposals requiring approval query
- Account activity tracking
- Search functionality across indexed proposals
- Debug endpoints

**Technical Role**: Provides TypeScript types and methods for the Roborovski msig indexing API, enabling type-safe access to indexed proposal data.

##### Releases

**[c621226](https://github.com/wharfkit/msigs/commit/c621226) - v0.2.0**  
*Pushed: 2025-11-23*

First public release.

**[c8ccca7](https://github.com/wharfkit/msigs/commit/c8ccca7) - v0.3.1**  
*Pushed: 2025-11-24*

Updated release with API improvements.

---

### wharfkit/mock-data

**Repository**: https://github.com/wharfkit/mock-data  
**Activity**: 2 commits to main branch

#### Commits (Direct to main)

**[4097a57](https://github.com/wharfkit/mock-data/commit/4097a57) - Allow unix sock with mockFetch provider**  
*Pushed: 2025-11-23*

Added Unix socket support to mock fetch provider for testing scenarios.

**[9cf701d](https://github.com/wharfkit/mock-data/commit/9cf701d) - v1.3.1 release**  
*Pushed: 2025-11-23*

Version bump with Unix socket support.

---

### wharfkit/roborovski

**Repository**: https://github.com/wharfkit/roborovski  
**Branch**: https://github.com/wharfkit/roborovski/tree/filtered  
**Activity**: Active (last pushed 2025-11-21)

#### Overview

Initial prototype for **filtered history responses**. This work enables filtering of blockchain history data to return more targeted results for applications. The filtered history capability will be used on Unicove and other dapps to improve history query performance and relevance.

**Important Distinction**: This filtered history work is separate from the msig indexing work in greymass/roborovski. While greymass/roborovski contains the msig indexing service powering msigs.io, this wharfkit/roborovski work focuses on general-purpose filtered history responses for dapp usage.

**Use Cases**: The filtered history prototype will enable Unicove and other applications to request specific subsets of blockchain history data rather than receiving complete history, improving performance and UX when displaying transaction history and account activity.

---

## Individual Developer Activity

### aaroncox/vaulta-contracts

**Repository**: https://github.com/aaroncox/vaulta-contracts  
**Branch**: https://github.com/aaroncox/vaulta-contracts/tree/Sentiment  
**Activity**: 9 commits (Nov 16-17)

#### Overview

Smart contracts providing the **on-chain foundation for the sentiment voting system**. These contracts enable sentiment voting on the Vaulta blockchain and form the base layer of the sentiment voting infrastructure stack.

**Sentiment Voting Infrastructure Stack**:
1. aaroncox/vaulta-contracts (sentiment branch) - Smart contracts on-chain providing core voting functionality
2. greymass/sentiment-api - Indexes data from contracts and provides queryable API
3. Unicove - Consumes API to display sentiment voting at unicove.com/en/vaulta/topic/sentiment

**Technical Role**: The smart contracts provide on-chain storage and logic for sentiment voting including vote recording, stake-weight calculation, and topic management. The sentiment-api indexes data from these contracts to provide fast queries for Unicove.

#### Commits (Direct to branch)

##### Smart Contract Implementation

**[619ad50](https://github.com/aaroncox/vaulta-contracts/commit/619ad50454aced22e5ce96a15f82bf9ad7550bce) - Rough implementation of sentiment voting contract**  
*Pushed: 2025-11-17*

Initial implementation of core sentiment voting smart contract with voting logic and data structures.

**[b3d3e3b](https://github.com/aaroncox/vaulta-contracts/commit/b3d3e3b3668163d38deba35aa16c15d48a6df2ae) - Added getweight/getweights readonly actions**  
*Pushed: 2025-11-17*

Added readonly query actions for retrieving sentiment weight data, enabling the sentiment-api to efficiently read voting data from the blockchain.

**[9f35f86](https://github.com/aaroncox/vaulta-contracts/commit/9f35f8648504635ac09b75d97ccbb1d2cb36dbb4) - Enabled config wipe during reset**  
*Pushed: 2025-11-17*

Added configuration reset functionality for development and testing workflows.

##### Build and Deployment Infrastructure

**[0d2135d](https://github.com/aaroncox/vaulta-contracts/commit/0d2135d35f9d28768b6548fb1d34cd955dc510aa) - Configured to use development build**  
*Pushed: 2025-11-17*

Updated build configuration for development environment.

**[4b07cd6](https://github.com/aaroncox/vaulta-contracts/commit/4b07cd63683900955b37093e4254e5b3eccc80ba) - Added publishing command**  
*Pushed: 2025-11-17*

Added contract publishing automation for deployment workflows.

**[c4bcb2f](https://github.com/aaroncox/vaulta-contracts/commit/c4bcb2f1a0fd203c8eeb2d231172dc2fdd2a2fe0) - Updated Makefile**  
*Pushed: 2025-11-17*

Makefile updates for build and deployment processes.

**[2434c70](https://github.com/aaroncox/vaulta-contracts/commit/2434c709cb6af1c8bcc9f0eca8da24d2e730745c) - Updated test.yml for CI/CD**  
*Pushed: 2025-11-17*

CI/CD pipeline configuration updates for automated testing.

**[77e5830](https://github.com/aaroncox/vaulta-contracts/commit/77e58306758ecc448389743566f16748bcbf6516) - Updated Makefile**  
*Pushed: 2025-11-16*

Additional Makefile refinements.

**[da0fd12](https://github.com/aaroncox/vaulta-contracts/commit/da0fd12177d0c0969c8b942b86a766eddaa7751c) - Initial commit on Sentiment branch**  
*Pushed: 2025-11-16*

Created Sentiment branch and initial project structure for sentiment voting contracts.

**Development Timeline**: Complete smart contract implementation from initial commit (Nov 16) to deployed contracts with query APIs (Nov 17), enabling the sentiment-api development that started Nov 17 and the public launch announced Nov 19.

---

## New Repositories

### greymass/evm-bridge-frontend

**Created**: 2025-11-13  
**Repository**: https://github.com/greymass/evm-bridge-frontend  
**Technology Stack**: Vue.js, Yarn, ESLint

**Purpose**: Community response to Vaulta EVM shutdown - forked and relaunched to maintain token holder access to withdraw assets from the EVM. Originally built by Vaulta Foundation (VF) and shut down when VF ceased Vaulta EVM operations in October 2025. The project was forked to restore critical functionality and ensure users could continue to access and withdraw their assets.

**Description**: Frontend application for interacting with the Vaulta EVM trustless bridge. Runs on Mainnet by default with testnet access available via URL parameter (`?testnet`). Following the Vaulta EVM shutdown by VF, maintaining this interface became essential for protecting token holder access to their assets.

**Initial Activity**: 1 PR merged (cleanup), active development

---

### greymass/msigs

**Created**: 2025-11-14  
**Repository**: https://github.com/greymass/msigs  
**Technology Stack**: TypeScript (Bun runtime), Antelope smart contracts

**Purpose**: Vaulta Foundation transition proposals and on-chain multisig tooling. Contains multisig proposals for the Vaulta network, focusing on Stage 1 transition from Vaulta Foundation to new entities (VDT & VNT).

**Description**: Repository containing proposal documents (markdown), technical implementations (TypeScript), and tooling for creating and submitting on-chain multisig proposals. Features document hashing for on-chain verification and comprehensive documentation for each proposal with status tracking.

**Initial Activity**: 40 commits in November, active development continuing into December

---

### greymass/sentiment-api

**Created**: 2025-11-17  
**Repository**: https://github.com/greymass/sentiment-api  
**Technology Stack**: Not specified in documentation

**Purpose**: Backend API powering Unicove's new Sentiment voting feature - reads from sentiment voting smart contracts and provides queryable API for stake-weighted community sentiment.

**Description**: Middle layer that reads data from sentiment voting smart contracts (aaroncox/vaulta-contracts sentiment branch) deployed on-chain and provides a backend for Unicove's frontend to display real-time stake-weighted sentiment. Part of the complete sentiment voting stack: smart contracts on-chain → API indexes and serves data → Unicove displays to users.

**Initial Activity**: 13 commits (Nov 17-19), launched with blog post on Nov 19

---

### greymass/msigs-ui

**Created**: 2025-11-23  
**Repository**: https://github.com/greymass/msigs-ui  
**Technology Stack**: SvelteKit, @wharfkit/msigs API client, Cloudflare Pages

**Purpose**: Powers msigs.io - a public search engine and viewer for multisig proposals. Consumes the Roborovski msig indexing API and serves as a reference implementation.

**Description**: Reference implementation demonstrating how to build applications using the public Roborovski msigs API. Serves dual purposes: (1) providing a community tool for searching and reviewing multisig proposals, and (2) showcasing API integration patterns that will be reused when adding multisig functionality to Unicove. Demonstrates the complete stack: Roborovski indexes proposals → provides API → msigs.io displays data.

**Initial Activity**: 25 commits in November, deployed to production at msigs.io

---

### wharfkit/msigs

**Created**: 2025-11-23  
**Repository**: https://github.com/wharfkit/msigs  
**Technology Stack**: TypeScript, @wharfkit/antelope

**Purpose**: TypeScript client library for the Roborovski msig indexing API.

**Description**: API client library providing methods to get service status, retrieve specific proposals from the index, query proposals requiring approval, and get account activity. Supports filtering by status and includes pagination options. Currently used by msigs.io and will power Unicove's future multisig features. Install via `yarn add @wharfkit/msigs`.

**Initial Activity**: 8 commits (Nov 23-24), two releases published (v0.2.0, v0.3.1)

---

## Development Patterns

### Rapid Full-Stack Prototyping

**Pattern**: Building complete product features from smart contract to API to UI within days leveraging existing infrastructure.

**Example**: Sentiment voting system developed from concept (Nov 16) to public launch (Nov 19) spanning three layers:
- Smart contracts (aaroncox/vaulta-contracts) deployed Nov 17
- API service (greymass/sentiment-api) built Nov 17-19  
- Unicove UI integration completed and launched Nov 19
- Blog post published Nov 19 announcing the feature

**Impact**: Demonstrates capability to rapidly iterate on ideas and ship complete features. Existing Wharf/Unicove infrastructure enabled 3-day turnaround from concept to public launch. Rapid prototyping allows community feedback before heavy investment.

---

### Indexer-as-Infrastructure Pattern

**Pattern**: Building centralized indexing services that multiple applications consume through shared APIs, reducing redundant blockchain queries.

**Example**: Roborovski multisig indexer establishes shared data infrastructure:
- Single indexer service queries blockchain and maintains proposal database
- REST API provides queryable access to indexed data
- Multiple consumers (msigs.io, Unicove, future applications) use same API
- TypeScript library (wharfkit/msigs) provides type-safe client interface

**Impact**: Eliminates need for each application to build own indexing logic. Reduces blockchain query load by centralizing data access. Consistent data model across applications improves reliability. Pattern applicable to other blockchain data types beyond multisigs.

---

### Reference Implementation as Documentation

**Pattern**: Building production applications that simultaneously serve users and demonstrate API integration patterns for developers.

**Example**: msigs.io (greymass/msigs-ui) serves dual purpose:
- Production tool: Public search engine for browsing multisig proposals
- Reference implementation: Demonstrates how to integrate wharfkit/msigs library and Roborovski API
- Future Unicove multisig features will reuse integration patterns established in msigs.io

**Impact**: Code as documentation provides working examples beyond written guides. Developers can study production application code to understand best practices. Reduces learning curve for API adoption. Ensures documentation examples reflect real-world usage.

---

### Crisis Response Through Community Infrastructure

**Pattern**: Rapidly deploying community-managed alternatives when centralized services shut down.

**Example**: EVM bridge frontend restoration following Vaulta Foundation's October shutdown:
- Foundation shut down EVM bridge, leaving users unable to access withdrawal interface
- Forked and relaunched bridge frontend (greymass/evm-bridge-frontend) to restore access
- Protects user funds by maintaining withdrawal functionality
- Demonstrates commitment to user access over organizational continuity

**Impact**: Community-managed infrastructure provides resilience against single-point-of-failure governance. Rapid response preserves user trust during transitions. Fork-and-relaunch pattern applicable to other at-risk services.

---

### Documentation as Governance Tool

**Pattern**: Using structured documentation and proposal repositories to facilitate transparent governance transitions.

**Example**: greymass/msigs repository contains comprehensive governance proposals addressing foundation transition:
- 4 detailed proposals covering account creation, contract deployment, permissions, platform capabilities
- Technical diagrams and comparison tables
- Versioned documentation enabling community review and refinement
- Public search engine (msigs.io) makes proposals discoverable and reviewable

**Impact**: Transparent documentation enables informed community participation in governance. Version control provides audit trail for proposal evolution. Public visibility increases accountability. Pattern establishes expectations for future governance proposals.
