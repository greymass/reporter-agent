# Technical Activity Report
## January 2025

**Navigation**: [← Previous Month](../2024-12/technical.md) | [Next Month →](../2025-02/technical.md)

*Also available: [Executive Summary](README.md) | [Research Data](research.md)*

January 2025 focused on foundational infrastructure improvements across multiple products. Key work included a major architectural shift in Unicove to reduce native API dependencies through contract-based APIs, significant backend infrastructure additions to Web Authenticator for account tracking, framework migrations in lighthouse-js to SvelteKit, and maintenance improvements across Anchor mobile platforms.

**Key Achievements**:
- Created Unicove smart contracts to provide better data access improving account loading speed
- Added account tracking to Web Authenticator enabling future recovery features
- Modernized account lookup service for better performance and reliability
- Fixed seven stability issues in mobile wallet improving user experience

**Technical Significance**: January focused on infrastructure modernization preparing for upcoming network changes. Contract-based APIs reduce dependency on native blockchain APIs while improving performance. Account tracking infrastructure enables future recovery capabilities.

---

## Table of Contents

- [Cross-Repository Insights](#cross-repository-insights)
- [Unicove](#unicove)
- [Unicove Contracts](#unicove-contracts)
- [Web Authenticator](#web-authenticator)
- [Lighthouse JS](#lighthouse-js)
- [Anchor Mobile Android](#anchor-mobile-android)
- [Anchor Mobile iOS](#anchor-mobile-ios)
- [Environment Encryption Test](#environment-encryption-test)
- [Wharfkit Website](#wharfkit-website)
- [New Repositories](#new-repositories)

---

## Cross-Repository Insights

### Unicove Contract-Based API Integration

Coordinated work between Unicove application and unicove-contracts to implement new data access architecture:

**Integration Stack**:
1. **greymass/unicove-contracts** - Smart contract API layer
   - Created readonly API actions consolidating account data queries
   - Implemented token balance/supply queries with filtering
   - Built network statistics endpoints
   - Added configuration system for dynamic token registry

2. **greymass/unicove** - Application integration
   - Refactored AccountState to support multiple data sources
   - Migrated balances and refunds to contract-based APIs
   - Separated refund_request from native `get_account` API
   - Implemented feature flags for staged rollout

**Technical Relationship**: Application-contract integration reducing native API dependencies:
- **Contract layer**: Consolidates multiple native API calls into single readonly action queries
- **Application layer**: Migrates from native APIs to contract-based queries for account data
- **Data flow**: One contract call replaces many sequential native API requests

**Previous Approach**: Applications called many separate native API endpoints (balances, staking, resources, delegations) requiring multiple sequential requests with high latency.

**New Approach**: Readonly smart contract actions return consolidated data in single query, reducing API calls and server load.

**Impact**: Performance improvement through reduced network requests. Lower server burden and bandwidth usage. Flexibility to adapt to token rebrands without application updates. Pattern other wallets can adopt.

---

## Unicove

**Repository**: https://github.com/greymass/unicove  
**Activity**: 54 commits to main branch

### Overview

January focused on major architectural refactoring to reduce the number of native blockchain API calls required to load account data. Previously, applications needed to call many separate native API endpoints to gather all required information, creating performance bottlenecks. This work involved implementing a new smart contract-based API system through the companion unicove-contracts repository that consolidates multiple queries into single calls, restructuring account state management to support this new data source, and improving localization coverage for international users.

### Major Architectural Work

#### Account API Refactoring

**Commit dd60716** - Refactored account api ([link](https://github.com/greymass/unicove/commit/dd60716589154e4da30e94e817b5d9cc18836e7b))  
*Committed: 2025-01-23*

Comprehensive account API refactoring to support the new contract-based data source architecture. This change restructures how Unicove loads and manages account data, enabling it to fetch information from multiple sources including the new readonly contract APIs.

**Impact**: Foundation for migrating away from `get_account` dependency. Enables more flexible, performant data access patterns.

---

**Commit 78c72ee** - Separating refund_request from get_account ([link](https://github.com/greymass/unicove/commit/78c72eed21d96358584567cd053f1c4d1557f1f2))  
*Committed: 2025-01-24*

Separated refund request data from the `get_account` API call, making it an independent data source that can be returned by the v2 contract API. Reduces reliance on the native API and improves data fetching flexibility.

**Impact**: Breaking down monolithic API dependencies. Each piece of account data becomes independently fetchable.

---

**Commit 087a60c** - Moving balance and rexbal to v2 API ([link](https://github.com/greymass/unicove/commit/087a60c5da3237be0c6b492b0ed3b2802c521e79))  
*Committed: 2025-01-24*

Migrated balance and REX balance queries from native APIs to the new v2 contract-based API, continuing the shift away from `get_account` dependency.

**Impact**: First production use of contract-based API for critical account data. Demonstrates feasibility of the new approach.

---

**Commit a974e7b** - Marked `sources` on AccountState as private and rework components ([link](https://github.com/greymass/unicove/commit/a974e7b5ed7f775d25cdff05829808cb2025a2b7))  
*Committed: 2025-01-23*

Refactored account state architecture by making internal data sources private and reworking components that accessed them directly. Improves encapsulation and provides cleaner API boundaries.

**Impact**: Better separation of concerns. Components now interact with account data through well-defined interfaces rather than direct source access.

---

**Commit ec28cd2** - Reworked network state loading and restructured token/resources ([link](https://github.com/greymass/unicove/commit/ec28cd2546cc38aa46083c1f877ba81a198d41d6))  
*Committed: 2025-01-30*

Major refactoring of network state loading and token/resource data structures. This architectural change improves data flow and reduces coupling to native APIs.

**Impact**: More flexible state management enabling multiple data sources.

---

#### Feature Flags and Rollout Infrastructure

**Commit e180c1d** - Rename feature to `unicovecontracts` and update account name ([link](https://github.com/greymass/unicove/commit/e180c1d648dc999e882b518fcc6d937a3d1b79be))  
*Committed: 2025-01-28*

Renamed contract feature flag and updated associated account names for clarity and consistency. Part of the infrastructure for staged rollout of contract-based APIs.

---

**Commit fc02144** - Disable new contracts on EOS ([link](https://github.com/greymass/unicove/commit/fc02144cbe8bf95dbda6b0288cb0f60b961ba00f))  
*Committed: 2025-01-29*

Disabled new contract features on EOS mainnet, implementing network-specific feature flags for staged rollout. Allows testing on other networks before EOS deployment.

---

#### Developer Experience

**Commit 0f41f45** - Added data view to accounts while in advanced mode ([link](https://github.com/greymass/unicove/commit/0f41f45db016202475c696f613afcd4c6405c16b))  
*Committed: 2025-01-22*

Added JSON data view for accounts when in advanced mode, providing developers and power users with raw account state visibility. Useful for debugging and understanding the new data source architecture.

---

**Commit 4ac904f** - Detect if the account has a contract ([link](https://github.com/greymass/unicove/commit/4ac904f220932a2b70b9753606c3b634f49ca869))  
*Committed: 2025-01-30*

Added contract detection functionality to identify accounts that have deployed smart contracts, enabling different UI treatment for contract accounts.

---

**Commit 353b441** - Automatic request on pageload (if requested) ([link](https://github.com/greymass/unicove/commit/353b44152993d6fb195722cb7c8b0d268997dd97))  
*Committed: 2025-01-31*

Added automatic data request functionality on page load when requested, improving user experience by reducing manual interactions.

---

**Commit 9899c20** - Error handling + dedicated readonly API ([link](https://github.com/greymass/unicove/commit/9899c207ca5414d5d8c8f59ec3493cb585408b92))  
*Committed: 2025-01-31*

Implemented error handling and established dedicated readonly API infrastructure, separating concerns for better reliability and performance.

---

**Commit b5a9708** - Allow calling of readonly actions ([link](https://github.com/greymass/unicove/commit/b5a9708f1ae44c1111c0b9c17d7b6c4253e0d68b))  
*Committed: 2025-01-30*

Enabled calling readonly smart contract actions, a key enabler for the new contract-based API system. Readonly actions execute without requiring transaction signing, making them ideal for data queries.

---

### User Experience Improvements

**Commit bf8c831** - Quick addition of traces for a transaction ([link](https://github.com/greymass/unicove/commit/bf8c831df204a993c2e02d4457ae4c63cee73d61))  
*Committed: 2025-01-22*

Added transaction trace display, providing visibility into internal actions and notifications for each transaction. Improves debugging and transparency.

---

**PR #345** - Group notification traces ([link](https://github.com/greymass/unicove/pull/345))  
*Merged: 2025-01-23*

Grouped notification traces to deduplicate them on transaction pages, reducing clutter and improving readability. Multiple identical notifications are now shown as a single entry with a count.

---

**PR #339** - refactor: sticky side menu ([link](https://github.com/greymass/unicove/pull/339))  
*Merged: 2025-01-28*

Refactored the side menu to use sticky positioning, improving navigation when scrolling through long pages. Menu remains visible while scrolling content.

---

**PR #332** - feat: async chart loading ([link](https://github.com/greymass/unicove/pull/332))  
*Merged: 2025-01-28*

Implemented asynchronous chart loading to improve page load performance by deferring non-critical visualizations. Charts load after the main content is visible.

---

**Commit 2d70806** - Show not logged in message on funding account ([link](https://github.com/greymass/unicove/commit/2d70806bf476450e17d7f1b0f5d1b9107c28a18a))  
*Committed: 2025-01-07*

Improved user experience by showing clear "not logged in" message when attempting to access funding features that require authentication.

---

### Internationalization

**PR #335** - Localized Resources pages ([link](https://github.com/greymass/unicove/pull/335))  
*Merged: 2025-01-16*

Added localization support to resource management pages, making them accessible to non-English users. Includes machine translations that need human review.

---

**PR #336** - review resources zh translations ([link](https://github.com/greymass/unicove/pull/336))  
*Merged: 2025-01-17*

Reviewed Chinese translations for resource management pages, improving translation quality and accuracy.

---

**Commit e5a2f0d** - Machine translations for resource pages (needs proofing) ([link](https://github.com/greymass/unicove/commit/e5a2f0de3a969e91501307d180a3e150ec947823))  
*Committed: 2025-01-16*

Generated initial machine translations for resource pages across multiple languages, establishing baseline translations for human review.

---

**PR #337** - check unlocalized strings ([link](https://github.com/greymass/unicove/pull/337))  
*Merged: 2025-01-28*

Reviewed and fixed unlocalized strings across the application, improving internationalization coverage. Identified hardcoded English strings and replaced them with translatable keys.

---

**PR #330** - Fix some translations in zh.json ([link](https://github.com/greymass/unicove/pull/330))  
*Merged: 2025-01-10*

Fixed Chinese translation issues identified during review, improving translation accuracy and clarity.

---

### Infrastructure Updates

**Commit e67c896** - Updating svelte/sveltekit/vite ([link](https://github.com/greymass/unicove/commit/e67c8963e0dea1aed2328615856a68f2ad7280ca))  
*Committed: 2025-01-30*

Updated core frontend dependencies (Svelte, SvelteKit, Vite) to latest versions, bringing performance improvements and new capabilities.

---

**Commit 867199f** - Default to Jungle4 on non-production builds ([link](https://github.com/greymass/unicove/commit/867199fe66b87efcee504581848b6dccf3f42a8c))  
*Committed: 2025-01-06*

Changed default network to Jungle4 testnet for development builds, improving developer experience and reducing accidental mainnet interactions during development.

---

### Release Management

**PR #341** - Next Release ([link](https://github.com/greymass/unicove/pull/341))  
*Merged: 2025-01-22*

Release branch containing multiple features and improvements.

---

**PR #331** - Next release ([link](https://github.com/greymass/unicove/pull/331))  
*Merged: 2025-01-13*

Release branch with accumulated features and fixes.

---

## Unicove Contracts

**Repository**: https://github.com/greymass/unicove-contracts  
**Activity**: 1 PR merged, 41 commits to main branch  
**Created**: January 2025

### Overview

New repository created to facilitate the token/network rebrand and reduce dependency on native blockchain APIs. These readonly smart contracts serve as flexible API endpoints that applications can query for account data, token balances, network statistics, and other blockchain state without hardcoding assumptions about token symbols or relying on monolithic native APIs.

**Purpose**: The existing native APIs were incapable of facilitating a new token directly through the base layer. This readonly smart contract serves as an API allowing easier access to token information (balances, staking, etc.) without hardcoding that data into apps. Applications can query these contracts to get current token information dynamically, enabling seamless token rebrands without code updates.

### Pull Requests

**PR #1** - Tokens ([link](https://github.com/greymass/unicove-contracts/pull/1))  
*Merged: 2025-01-28*

Initial token contract implementation providing token balance APIs. Established the foundation for multi-token balance queries with filtering and configuration options.

---

### Core API Development

#### Account Data APIs

**Commit ea88c4f** - Add voter_info to account API ([link](https://github.com/greymass/unicove-contracts/commit/ea88c4fa347551539c6f4470841a2bb7a82b947a))  
*Committed: 2025-01-31*

Extended account API to include voter information (staked tokens, vote weight, selected producers). Provides comprehensive governance-related account data.

---

**Commit e786dbc** - Loading of delegations, rex, and msig proposals ([link](https://github.com/greymass/unicove-contracts/commit/e786dbcdeede76dfea0740b16971e6bb141ef983))  
*Committed: 2025-01-22*

Extended account API to include resource delegations, REX (Resource Exchange) data, and multisig proposals associated with the account. Provides comprehensive account state information.

---

**Commit d9d36b3** - Add `available` call to check account existence ([link](https://github.com/greymass/unicove-contracts/commit/d9d36b32cbe51dd6e0f14b84b3b856f9882aa28b))  
*Committed: 2025-01-31*

Added `available` action to check if an account exists on the blockchain, providing a lightweight alternative to full account queries. Useful for account name validation.

---

#### Token Balance APIs

**Commit d9382f5** - Add getbalances, addtoken, removetoken ([link](https://github.com/greymass/unicove-contracts/commit/d9382f50c05d6da0cb853833fa8804dcd6009563))  
*Committed: 2025-01-27*

Implemented core token balance query functionality and token registry management actions. Applications can query balances for all registered tokens, and administrators can manage the token registry.

---

**Commit 5af8184** - Adding lookups for token balance and pending refunds ([link](https://github.com/greymass/unicove-contracts/commit/5af818493be4ecce9c7fb6c66d1b686b0599014a))  
*Committed: 2025-01-24*

Added actions to query token balances and pending unstaking refunds, providing comprehensive token state information.

---

**Commit 55b4acc** - Set default balance and prevent error when account has no balance object ([link](https://github.com/greymass/unicove-contracts/commit/55b4acc8a52b8ca1e9528440a4c7ad70a5126dbe))  
*Committed: 2025-01-28*

Improved error handling by providing default balance values when account has no balance record. Prevents errors and provides consistent API responses.

---

**Commit ade5ae6** - New `zerobalances` parameter to allow showing/hiding 0 balances ([link](https://github.com/greymass/unicove-contracts/commit/ade5ae678351b752942243f7bd80c5b612385e03))  
*Committed: 2025-01-29*

Added parameter to filter out zero-balance tokens from balance queries, improving UX by hiding irrelevant tokens. Applications can choose whether to show tokens with zero balances.

---

#### Network Statistics APIs

**Commit 6ce158f** - Added network and supply calls ([link](https://github.com/greymass/unicove-contracts/commit/6ce158f777c7afb38f78cb1888fb77d3aca6f2ca))  
*Committed: 2025-01-30*

Added network-wide statistics and token supply information endpoints. Provides data like total supply, staked supply, and network resource usage.

---

**Commit fe25a54** - Adding circulating (supply - locked) ([link](https://github.com/greymass/unicove-contracts/commit/fe25a54e033aa6ec60b822c390ed8631cbf0567b))  
*Committed: 2025-01-31*

Added circulating supply calculation by subtracting locked tokens from total supply. Important metric for token economics.

---

### Architecture and Modularity

**Commit 4c2e00f** - Split all combined APIs into individual APIs, then recombined ([link](https://github.com/greymass/unicove-contracts/commit/4c2e00f83d72e4b2c3a6b1e78a3d92c4dc590561))  
*Committed: 2025-01-31*

Refactored API structure by splitting combined endpoints into individual actions, then providing recombined views for convenience. Improves modularity and composability - applications can request exactly the data they need.

**Impact**: Applications can choose between fine-grained individual endpoints (for minimal data transfer) or combined endpoints (for convenience). Balances performance and developer experience.

---

**Commit 1f26b83** - Duplicated api contract to tokens (splitting codebase) ([link](https://github.com/greymass/unicove-contracts/commit/1f26b8312dd1e292dfaaf39371e69dcd205cbfbd))  
*Committed: 2025-01-29*

Split codebase into separate `api` and `tokens` contracts for better separation of concerns. Different contracts can be deployed and upgraded independently.

---

**Commit 58b6e4c** - Updating tokens contract to make it functional ([link](https://github.com/greymass/unicove-contracts/commit/58b6e4c46b011abde9a1800528c8d1fd2cc6720c))  
*Committed: 2025-01-29*

Made tokens contract fully functional with proper balance queries and filtering after the codebase split.

---

**Commit 69e46cd** - Renamed readonly actions (removed `get`) ([link](https://github.com/greymass/unicove-contracts/commit/69e46cd9cd3af2d6e685b4bfded6e4355f864f60))  
*Committed: 2025-01-29*

Renamed action names for clarity by removing `get` prefix from readonly actions. Improves API naming consistency.

---

### Configuration and Management

**Commit bf14b1a** - Added config table and moved constants to allow overriding ([link](https://github.com/greymass/unicove-contracts/commit/bf14b1ac5905c5b9dbc5ed25d583b17f30284c51))  
*Committed: 2025-01-27*

Added configuration table enabling contract parameters to be adjusted without redeployment. Administrators can update token lists, thresholds, and other settings on-chain.

---

**Commit c0283a4** - Created `addtokens` helper + script to generate ESR ([link](https://github.com/greymass/unicove-contracts/commit/c0283a40217a460005f8d5d6455f5ad888a1428a))  
*Committed: 2025-01-28*

Created helper action and ESR (EOSIO Signing Request) generation script for adding tokens to the contract's registry. Simplifies token management workflow.

---

### Deployment Infrastructure

**Commit 4bfb3e7** - Allow testnet deployments ([link](https://github.com/greymass/unicove-contracts/commit/4bfb3e7135be461e49c556aac9cefaaa1603a4f3))  
*Committed: 2025-01-22*

Added testnet deployment configuration for testing contract functionality before mainnet deployment. Supports safe testing and iteration.

---

**Commit 7c1d647** - Initial commit to rework for Unicove ([link](https://github.com/greymass/unicove-contracts/commit/7c1d647da0d4c846e8ec460569506178e835f15f))  
*Committed: 2025-01-22*

Initial development commit establishing the foundation for readonly API contracts specifically designed for Unicove's needs.

---

## Web Authenticator

**Repository**: https://github.com/greymass/web-authenticator  
**Activity**: 22 commits to main branch

### Overview

January focused on significant backend infrastructure changes, transitioning from a purely client-side application to a hybrid architecture with backend database support. This architectural shift enables new features like email-based account tracking, cross-device account management, and account recovery while maintaining the WebAuthn security model for cryptographic key management.

### Backend Infrastructure

**Commit d4fc499** - chore: adding backend ([link](https://github.com/greymass/web-authenticator/commit/d4fc499229db3ffc1a8fa8a8249ead185f0d1fd7))  
*Committed: 2025-01-20*

**Major Infrastructure Addition**: Initial implementation of backend server infrastructure for database connectivity and account tracking. Establishes Express-based server for handling account management requests.

**Impact**: Enables persistent account tracking and management features while preserving client-side security for key material.

---

**Commit 7070aca** - chore: moving db to a new backend express app ([link](https://github.com/greymass/web-authenticator/commit/7070acaab3e246c42b8917a6799a9968486a159e))  
*Committed: 2025-01-31*

**Major Infrastructure Change**: Migrated database functionality to a new Express-based backend application, completing the transition from purely client-side to a client-server architecture. Separates concerns between frontend and backend.

---

**Commit 8515b75** - refactor: moving all db files to backend folder ([link](https://github.com/greymass/web-authenticator/commit/8515b75d84f735d2f6d80db4938465b49a32ffa4))  
*Committed: 2025-01-31*

Reorganized database-related files into a dedicated backend folder structure, improving code organization and separation of concerns.

---

**Commit af348a2** - chore: making it so the app can run in cf without a db ([link](https://github.com/greymass/web-authenticator/commit/af348a288651312970c958eaa5f814c92e000e54))  
*Committed: 2025-01-21*

Made the application capable of running in Cloudflare without database dependency, enabling flexible deployment options. Application can operate in client-only mode or with full backend support.

**Impact**: Supports multiple deployment scenarios - full backend for production, client-only for development or limited deployments.

---

### Account Management Features

**Commit 1bc0d89** - enhancement: tracking accounts based on email addresses ([link](https://github.com/greymass/web-authenticator/commit/1bc0d89d6252f9796d4e99d6f3388c79ea0e2ff3))  
*Committed: 2025-01-24*

**Key Feature**: Implemented email-based account tracking in the backend database, enabling user account management and recovery features. Associates blockchain accounts with email addresses for identification.

---

**Commit 92f13b8** - chore: added dashboard page ([link](https://github.com/greymass/web-authenticator/commit/92f13b8e9f688506d7a393718ea78b7b0a506477))  
*Committed: 2025-01-20*

Added new dashboard page for user account management. Provides interface for viewing and managing associated accounts.

---

### Application Flow Restoration

**Commit 33fe855** - fix: getting app running again ([link](https://github.com/greymass/web-authenticator/commit/33fe855eb4d9d9f9fcd39831d5750b021b804c31))  
*Committed: 2025-01-24*

Fixed application runtime after backend migration, restoring core functionality. Major refactoring required updating all application flows.

---

**Commit deb9094** - fix: more work to get the app running ([link](https://github.com/greymass/web-authenticator/commit/deb9094801788bdf0652d269c7960ef933bc04e3))  
*Committed: 2025-01-24*

Continued work to restore application functionality after backend infrastructure changes. Multiple components required updates to work with new architecture.

---

**Commit 18fadd8** - fix: fixing account creation flow ([link](https://github.com/greymass/web-authenticator/commit/18fadd84ba5b90d66b1e533623c095dde0cad311))  
*Committed: 2025-01-25*

Fixed account creation flow to work with the new backend database system. Account creation now stores metadata in database while maintaining client-side key management.

---

**Commit 756d9cf** - fix: fixing login flow ([link](https://github.com/greymass/web-authenticator/commit/756d9cf98da6ea78159ae5cf8256a41b5becb6b2))  
*Committed: 2025-01-25*

Fixed login flow integration with the new backend architecture. Login now retrieves account information from database while authenticating using WebAuthn.

---

**Commit 02c37f5** - fix: getting sign in working again ([link](https://github.com/greymass/web-authenticator/commit/02c37f5d914e966d81f27c41a9912653ee3e67cc))  
*Committed: 2025-01-23*

Restored sign-in functionality after backend architectural changes.

---

**Commit 6d2a619** - fix: fixing accounts store ([link](https://github.com/greymass/web-authenticator/commit/6d2a619702bfa9c2fac51fd23cab04d5bcbe198e))  
*Committed: 2025-01-25*

Fixed account store functionality to work with the new storage architecture. Accounts now persist in both client-side storage and backend database.

---

**Commit 0f5b8d1** - fix: fixing dashboard and webauthn storage issues ([link](https://github.com/greymass/web-authenticator/commit/0f5b8d1ab12f41559678ea0545d13f88ae5bbf93))  
*Committed: 2025-01-25*

Fixed dashboard functionality and resolved WebAuthn storage issues introduced by the backend migration. Ensured WebAuthn keys remain securely stored client-side.

---

**Commit 8ed9ad2** - fix: adding accounts to db properly ([link](https://github.com/greymass/web-authenticator/commit/8ed9ad28c633ec40be101f8d07ed7dc04e856841))  
*Committed: 2025-01-23*

Fixed account database insertion logic to properly store account data with correct schema and relationships.

---

### User Experience and Security

**Commit 86c7757** - enhancement: polishing sign page ([link](https://github.com/greymass/web-authenticator/commit/86c7757f17d5c530e77cf73e430a713834fac287))  
*Committed: 2025-01-29*

Improved sign page UI and user experience for transaction signing flows.

---

**Commit c73ce02** - enhancement: polishing sign page ([link](https://github.com/greymass/web-authenticator/commit/c73ce0211dfcee3af023e8165836a0b061ee603f))  
*Committed: 2025-01-25*

Additional sign page improvements for better user experience.

---

**Commit 52ef54f** - chore: adding comment about bypassing csrf ([link](https://github.com/greymass/web-authenticator/commit/52ef54f8602bc38e377bffad6e61b45b3496fd2d))  
*Committed: 2025-01-22*

Added documentation about CSRF protection implementation decisions, explaining security considerations for the backend API.

---

### Development Infrastructure

**Commit c54eaf4** - fix: getting bun dev working ([link](https://github.com/greymass/web-authenticator/commit/c54eaf4becc39be95a96192c1e2a0d9d0824ab84))  
*Committed: 2025-01-30*

Fixed development environment configuration to work with Bun runtime for faster development builds.

---

**Commit 386583e** - fix: getting cf build running ([link](https://github.com/greymass/web-authenticator/commit/386583e27ddd7c3d2b8833b545a540f004e46ba7))  
*Committed: 2025-01-30*

Fixed Cloudflare build configuration to work with the new backend architecture.

---

**Commit 89a1921** - fix: fixing scripts ([link](https://github.com/greymass/web-authenticator/commit/89a1921145c07773445ca28f7be38b86d1f53d00))  
*Committed: 2025-01-22*

Fixed build and development scripts to work with new project structure including both frontend and backend applications.

---

**Commit c334904** - chore: adding tests ([link](https://github.com/greymass/web-authenticator/commit/c3349043b408c9f8d90ea102bd2e25aa7d15f8f2))  
*Committed: 2025-01-31*

Added test coverage for the new backend database functionality, ensuring reliability of account tracking features.

---

## Lighthouse JS

**Repository**: https://github.com/greymass/lighthouse-js  
**Activity**: 2 PRs merged, 15 commits to main branch

### Overview

January saw a major architectural migration from a basic JavaScript implementation to a modern SvelteKit-based application. This modernization brings better performance, improved maintainability, and enhanced deployment flexibility while maintaining backward compatibility with the legacy Lighthouse API that wallets and applications depend on.

### Pull Requests

**PR #3** - Converting app to svelte kit ([link](https://github.com/greymass/lighthouse-js/pull/3))  
*Merged: 2025-01-21*

**Major Migration**: Converted the Lighthouse API implementation from basic JavaScript to SvelteKit, bringing modern tooling, better performance, and improved developer experience.

**Work included**:
- Migrated to SvelteKit framework for better structure and performance
- Added ESLint for code quality enforcement  
- Updated to more recent Node.js versions for CI checks
- Fixed dependencies and testing infrastructure
- Implemented Cloudflare-compatible fetch in network request methods
- Updated README with new setup instructions

**Technical Impact**: Modernizes infrastructure while maintaining API compatibility. SvelteKit provides better performance, server-side rendering capabilities, and improved development experience. Cloudflare compatibility enables edge deployment for lower latency.

**Commits in PR**:
- [45d5c87](https://github.com/greymass/lighthouse-js/commit/45d5c87d3cd530a0c99fde8c0a0b84a2a9fe9ca6) - Core conversion to SvelteKit architecture
- [7f6f4ae](https://github.com/greymass/lighthouse-js/commit/7f6f4aecd8940f00a3153d38603518bd23382170) - Added ESLint configuration
- [0948c32](https://github.com/greymass/lighthouse-js/commit/0948c32a3237fb1d04e78c50cf7d4bbc64755563) - Updated CI to use modern Node.js versions
- [90868ec](https://github.com/greymass/lighthouse-js/commit/90868ecd2e77fc398f31600d0f9ad70e5f5f60c3) - Fixed package dependencies
- [5b2fa9b](https://github.com/greymass/lighthouse-js/commit/5b2fa9b877eee42d48fd06c47628fcf1a0f645e0) - Ensured Cloudflare Workers compatibility
- [3d894e8](https://github.com/greymass/lighthouse-js/commit/3d894e8a2cdf96c20d915ee4cfa4fafe43ac07aa) - Restored test suite functionality
- [a3ec9af](https://github.com/greymass/lighthouse-js/commit/a3ec9affc1389da845a99c232d45c812a00b61a1) - Updated documentation

---

**PR #4** - Making includeTestnets behavior identical to legacy API ([link](https://github.com/greymass/lighthouse-js/pull/4))  
*Merged: 2025-01-22*

Fixed `includeTestnets` parameter behavior to match the legacy Lighthouse API, ensuring backward compatibility for existing integrations. The migration inadvertently changed testnet filtering behavior.

**Commit**: [f1b0b87](https://github.com/greymass/lighthouse-js/commit/f1b0b872962757f80cd2380357d1e31532103841)

---

### Code Quality and Maintenance

**Commit d721ed1** - fix: fixing lookup method ([link](https://github.com/greymass/lighthouse-js/commit/d721ed18d399006658c7b331ade554b0527c870b))  
*Committed: 2025-01-20*

Fixed account lookup method implementation after framework migration.

---

**Commit 2aa4ea2** - style: linted ([link](https://github.com/greymass/lighthouse-js/commit/2aa4ea271e9edbbb9c06a06a324eef9b61235ec6))  
*Committed: 2025-01-20*

Applied linting rules across the codebase for consistency.

---

**Commit f8f0f74** - cleanup: code cleanup ([link](https://github.com/greymass/lighthouse-js/commit/f8f0f741f4b05738a42ad1d1b0841278c4e13359))  
*Committed: 2025-01-20*

General code cleanup and organization improvements post-migration.

---

**Commit 36feeb4** - cleanup: more cleanup ([link](https://github.com/greymass/lighthouse-js/commit/36feeb4a8bf914dafd7ca3443843086718f74578))  
*Committed: 2025-01-20*

Additional cleanup work after SvelteKit migration.

---

**Commit 38a7e85** - chore: temporarily renamed project ([link](https://github.com/greymass/lighthouse-js/commit/38a7e850403bc413745c9a7f45131228e948382c))  
*Committed: 2025-01-20*

Temporarily renamed project during migration process to avoid conflicts.

---

## Anchor Mobile Android

**Repository**: https://github.com/greymass/anchor-mobile-android  
**Activity**: 7 PRs merged, 12 commits to dev branch

### Overview

January focused on bug fixes and stability improvements across multiple areas including UI performance, thread safety, account management, and transaction handling. Work addressed edge cases and improved the user experience through targeted maintenance fixes.

### Pull Requests

#### Performance and Stability Fixes

**PR #694** - Fix LoadingAnimation multiple setState causing multiple renders ([link](https://github.com/greymass/anchor-mobile-android/pull/694))  
*Merged: 2025-01-16*

Fixed performance issue where loading animation was causing unnecessary re-renders. Multiple `setState` calls were triggering redundant render cycles, causing UI lag.

**Impact**: Improved UI responsiveness during loading states.

---

**PR #691** - Optimize multiple startups of the Prompt component ([link](https://github.com/greymass/anchor-mobile-android/pull/691))  
*Merged: 2025-01-16*

Optimized prompt component to prevent multiple simultaneous initializations, improving UI responsiveness. Component now properly handles rapid successive calls.

---

#### Thread Safety

**PR #697** - use volatile for thread-safe access in KeyStoreManager ([link](https://github.com/greymass/anchor-mobile-android/pull/697))  
*Merged: 2025-01-16*

Improved thread safety in key store management by using volatile keyword for thread-safe variable access. Prevents race conditions when multiple threads access key store state.

**Technical Context**: Android apps are multi-threaded. The key store manages sensitive cryptographic material and must be accessed safely from multiple threads. The `volatile` keyword ensures visibility of changes across threads.

---

#### Account Management

**PR #699** - Fix the null exception caused by account deletion ([link](https://github.com/greymass/anchor-mobile-android/pull/699))  
*Merged: 2025-01-16*

Fixed null pointer exception that occurred when deleting accounts. Improved app stability by properly handling account deletion edge cases.

---

#### Transaction Handling

**PR #692** - fix transaction cancel ([link](https://github.com/greymass/anchor-mobile-android/pull/692))  
*Merged: 2025-01-16*

Fixed transaction cancellation flow to properly handle user-initiated transaction cancellations. Transaction state now correctly resets when user cancels.

---

#### User Interface

**PR #687** - Fix the check for whether the bottom is reached ([link](https://github.com/greymass/anchor-mobile-android/pull/687))  
*Merged: 2025-01-14*

Fixed scroll detection logic for determining when user has reached the bottom of content. Improves "scroll to accept" and infinite scroll features.

---

**Commit e5365ae** - fix help view cannot scroll ([link](https://github.com/greymass/anchor-mobile-android/commit/e5365ae6f36c16f3e55e30d8aa434135d59e4c79))  
*Committed: 2025-01-22*

Fixed scrolling functionality in help view, ensuring users can access all help content.

---

#### Code Quality

**PR #695** - Remove the redundant SoLoader.init in MainActivity ([link](https://github.com/greymass/anchor-mobile-android/pull/695))  
*Merged: 2025-01-16*

Cleaned up redundant initialization code in main activity, reducing startup overhead. `SoLoader` was being initialized twice unnecessarily.

---

### Integration Updates

**Commit c1dfc86** - chore: using new lighthouse API ([link](https://github.com/greymass/anchor-mobile-android/commit/c1dfc869beba827098a53c17376d455066401d40))  
*Committed: 2025-01-22*

Updated to use new Lighthouse API endpoint for account lookups, integrating with the migrated lighthouse-js service. Ensures compatibility with the modernized Lighthouse infrastructure.

---

## Anchor Mobile iOS

**Repository**: https://github.com/greymass/anchor-mobile-ios  
**Activity**: 1 PR merged, 1 commit to main branch

### Overview

January saw a minor update to add support for XPR Network web wallet URLs, enabling better integration with the XPR Network ecosystem.

### Pull Request

**PR #81** - Added XPR web wallet urls ([link](https://github.com/greymass/anchor-mobile-ios/pull/81))  
*Merged: 2025-01-20*

Added XPR Network web wallet URL configuration, enabling the mobile wallet to properly handle XPR Network web wallet interactions. Allows users to initiate transactions from XPR Network web apps and sign them using Anchor iOS.

---

## Environment Encryption Test

**Repository**: https://github.com/greymass/env-encryption-test  
**Activity**: 2 commits to main branch  
**Created**: January 2025

### Overview

New proof of concept repository demonstrating a system that allows developers to commit `.env` files and other secrets to GitHub repositories securely. Contributors can decrypt them using the same SSH keys they use for GitHub authentication. Uses the `age` encryption tool with SSH key encryption.

**Purpose**: Proof of concept for secure environment variable sharing in development teams. Solves the challenge of distributing development secrets without relying on external secret management systems or manual key distribution.

**How it works**: 
1. Environment files are encrypted for specific GitHub contributors (identified by their GitHub SSH keys)
2. Encrypted files are committed to the repository
3. Authorized contributors decrypt using their local SSH keys
4. No separate key distribution required - leverages existing GitHub SSH authentication

### Commits

**Commit 9899403** - init ([link](https://github.com/greymass/env-encryption-test/commit/9899403cddff10339894eb592379973dae53dc6f))  
*Committed: 2025-01-08*

Initial implementation of the environment encryption proof of concept. Established workflow for encrypting, committing, and decrypting environment files.

---

**Commit 06f6350** - use real .env instead of test string ([link](https://github.com/greymass/env-encryption-test/commit/06f63500976fc27cdde87d5c819c0df9673b509f))  
*Committed: 2025-01-09*

Updated the proof of concept to use actual .env file instead of test strings, demonstrating real-world usage.

---

## Wharfkit Website

**Repository**: https://github.com/wharfkit/website  
**Activity**: 3 commits to documentation

### Overview

January saw minor documentation updates to contract loading guides and API reference pages.

### Commits

**Commit 92afd78** - Update dynamically-loading-contracts.md ([link](https://github.com/wharfkit/website/commit/92afd78443cfbcf217cf8f486a57d872120d1fb8))  
*Committed: 2025-01-22*

Updated documentation for dynamic contract loading patterns, clarifying best practices for loading contract ABIs at runtime.

---

**Commit 894a327** - Update BalanceMethod.md ([link](https://github.com/wharfkit/website/commit/894a327ccffc50cfe6668beed28b91ed81b940d7))  
*Committed: 2025-01-13*

Updated balance method API documentation with clearer examples and usage notes.

---

**Commit e83e51c** - Update ContractKit.md ([link](https://github.com/wharfkit/website/commit/e83e51cdc821f11af07480ef73f8f19c84d92ba4))  
*Committed: 2025-01-10*

Updated ContractKit documentation with improved descriptions and code examples.

---

## New Repositories

### greymass/template-contract

**Created**: 2025-01-22  
**Repository**: https://github.com/greymass/template-contract  
**Activity**: Repository created (no commits in January)

**Purpose**: Template repository for creating new Antelope smart contracts with proper project structure, build configuration, testing setup, and documentation templates. Provides standardized starting point for contract development.

**Features**:
- Pre-configured build system for Antelope smart contracts
- Testing framework setup
- Documentation templates
- CI/CD configuration examples
- Best practices and code organization

**Use Case**: Developers can clone this template when starting a new smart contract project, ensuring consistent structure and tooling across Greymass contract projects.

---

### greymass/unicove-og-image-gen

**Created**: 2025-01-29  
**Repository**: https://github.com/greymass/unicove-og-image-gen  
**Activity**: Repository created (no commits in January)

**Purpose**: Cloudflare Worker that generates Open Graph images for Unicove dynamically based on URL query parameters. Supports Chinese, Korean, and English text rendering using Google Fonts. Images are cached for 24 hours for performance.

**Technology Stack**: 
- Cloudflare Workers (edge computing)
- Bun (JavaScript runtime)
- Dynamic image generation
- Google Fonts API integration

**Use Case**: Generates social media preview images when Unicove links are shared on platforms like Twitter, Facebook, and Discord. Shows localized content based on language, improving international reach and engagement.

**Technical Approach**: Edge-deployed worker generates images on-demand with 24-hour caching. Supports multiple languages with proper font rendering for international character sets.

---

### wharfkit/wallet-plugin-mimic

**Created**: 2025-01-13  
**Repository**: https://github.com/wharfkit/wallet-plugin-mimic  
**Activity**: 1 commit (initial creation)

**Purpose**: New WharfKit wallet plugin created from the wallet plugin template. Enables integration of a specific wallet with WharfKit's session management system.

**Context**: WharfKit uses a plugin architecture for wallet integrations. Each wallet provider (Anchor, Wombat, MetaMask, etc.) has a corresponding plugin that implements the WharfKit wallet interface.

**Commit 81ac40d** - Initial commit ([link](https://github.com/wharfkit/wallet-plugin-mimic/commit/81ac40d8442f2de0707600e23dd12bd7dedced99))  
*Committed: 2025-01-13*

Initial repository setup for the new wallet plugin using the standard WharfKit wallet plugin template.

---

