# Technical Activity Report
## April 2025

**Navigation**: [← Previous Month](../2025-03/technical.md) | [Next Month →](../2025-05/technical.md)

*Also available: [Executive Summary](README.md) | [Research Data](research.md)*

April 2025 focused on major feature expansion in Unicove with comprehensive token swap (DEX) functionality, complete Vaulta rebrand implementation, and production-readiness work for Web Authenticator. Key work included full DEX integration enabling token trading within Unicove, brand evolution from EOS to Vaulta with flexible configuration architecture, dashboard and security protocols for Web Authenticator, creation of Resource Provider infrastructure replacing deprecated Fuel service, and continued stability improvements across Anchor mobile applications. The month showed 29 PRs merged with emphasis on user-facing features and infrastructure modernization.

**Key Achievements**:
- Added Token Swap functionality to Unicove supporting DEX trading
- Updated Unicove with Vaulta branding reflecting network evolution
- Created Resource Provider service modernizing resource management infrastructure
- Added user dashboard to Web Authenticator providing centralized account management
- Improved Web Authenticator security with cryptographic handshake protocols
- Integrated iOS account creation portal maintaining cross-platform feature parity

**Technical Significance**: April delivered major feature expansion transforming Unicove into a comprehensive DeFi platform with token swap capabilities, implemented flexible branding architecture supporting multiple network identities, and completed production-readiness work for Web Authenticator including security protocols coordinated with WharfKit plugin. The Resource Provider creation modernizes critical infrastructure enabling fee-free transaction experiences after Fuel deprecation. Cross-repository security protocol implementation demonstrates mature multi-repo coordination.

---

## Table of Contents

- [Cross-Repository Insights](#cross-repository-insights)
- [greymass/unicove](#greymassunicove)
- [greymass/web-authenticator](#greymassweb-authenticator)
- [greymass/anchor-mobile-android](#greymassanchor-mobile-android)
- [greymass/anchor-mobile-ios](#greymassanchor-mobile-ios)
- [wharfkit/wallet-plugin-web-authenticator](#wharfkitwallet-plugin-web-authenticator)
- [New Repositories](#new-repositories)
- [Development Patterns](#development-patterns)

---

## Cross-Repository Insights

### Web Authenticator ↔ WharfKit Plugin Security Protocol Integration

**Integration**: Coordinated security protocol implementation across greymass/web-authenticator and wharfkit/wallet-plugin-web-authenticator enabling secure dapp communication.

**Technical Relationship**: Web Authenticator requires secure communication channel with dapps using WharfKit. Both repositories must implement matching cryptographic protocols for identity verification and transaction request handling.

**How They Work Together**:
- **Web Authenticator (PR #19)**: Implements wallet-side identity handshake and request unsealing
- **WharfKit Plugin (PR #2)**: Implements dapp-side identity handshake and message sealing
- **Handshake Protocol**: Cryptographic verification establishing secure channel before exchanging identity/transaction data
- **Message Sealing**: Encrypted transaction requests preventing eavesdropping during transmission
- **Coordinated Merge**: Both PRs merged April 11, 2025 ensuring protocol compatibility

**Security Flow**:
1. Dapp (via WharfKit plugin) initiates connection with challenge
2. Wallet (Web Authenticator) verifies dapp identity cryptographically
3. Handshake establishes secure channel with mutual authentication
4. Transaction requests sealed (encrypted) by dapp before transmission
5. Wallet unseals requests securely, verifies integrity
6. Both parties protected against man-in-the-middle attacks

**Benefit**: Enables production deployment of Web Authenticator with cryptographically secure dapp integration. Coordinated implementation ensures protocol compatibility, preventing security gaps or version mismatches. This cross-repo coordination demonstrates mature security engineering across organizational boundaries.

**Technical Details**:
- Web Authenticator: PR #19 ([link](https://github.com/greymass/web-authenticator/pull/19))
- WharfKit Plugin: PR #2 ([link](https://github.com/wharfkit/wallet-plugin-web-authenticator/pull/2))
- See [March 2025](../2025-03/technical.md#cross-repository-insights) for WharfKit plugin architecture alignment context

---

### Unicove ↔ WharfKit Common Configuration Integration

**Integration**: Vaulta rebrand coordinated across greymass/unicove and wharfkit/common for shared blockchain configuration.

**Technical Relationship**: Unicove relies on wharfkit/common for blockchain metadata (chain IDs, names, logos, endpoints). Rebranding EOS to Vaulta requires updates in both repositories to maintain consistency.

**How They Work Together**:
- **WharfKit Common**: Maintains canonical blockchain configuration data used across WharfKit ecosystem
- **Unicove Configuration**: Consumes wharfkit/common data for network identification and branding
- **Coordinated Updates**: PR #430 (Unicove) references wharfkit/common PR #4 for matching Vaulta configuration
- **Environment Override**: Unicove adds environment-based configuration override capability while maintaining wharfkit/common as baseline

**Configuration Flow**:
1. wharfkit/common provides canonical network metadata
2. Unicove imports and uses this data for network selection
3. Environment variables can override specific values (chain names, logos) for custom deployments
4. Both systems stay synchronized on core network identity

**Benefit**: Shared configuration prevents inconsistencies across WharfKit ecosystem. When users interact with Vaulta through Unicove or other WharfKit-powered applications, they see consistent branding and network identity. Environment override adds deployment flexibility without forking shared configuration.

**Technical Details**:
- Unicove: PR #430 Vaulta ([link](https://github.com/greymass/unicove/pull/430))
- WharfKit Common: PR #4 (referenced in Unicove PR)
- See [February 2025](../2025-02/technical.md#cross-repository-insights) for network abstraction architecture context

---

### Resource Provider Replaces eosio-resource-manager

**Integration**: Resource Provider (new repository) replaces eosio-resource-manager for automated network resource management.

**Technical Relationship**: Resource Provider modernizes resource management infrastructure by replacing eosio-resource-manager. Built using bun-service-template pattern establishing consistency across Greymass backend services.

**How They Work Together**:
- **eosio-resource-manager (replaced)**: Previous resource management solution
- **bun-service-template**: Provides standardized backend service structure with TypeScript, Bun runtime, WharfKit integration
- **Resource Provider (new)**: Implements resource management using template pattern with modern stack

**Architectural Flow**:
1. bun-service-template created April 21 establishing service patterns
2. Resource Provider created same day using template structure
3. Implements automated resource monitoring and powerup logic
4. Uses WharfKit for blockchain interaction (@wharfkit/resources, @wharfkit/session)
5. SQLite/Drizzle ORM for account configuration persistence

**Current Capability**: Resource Manager feature complete - monitors configured accounts and automatically powers up CPU/NET when resources fall below thresholds.

**Future Goal**: Eventually replace Fuel co-signer service for transaction cosigning, but this functionality incomplete and remains future work.

**Benefit**: Modernizes resource management with updated technology stack (Bun/TypeScript) and WharfKit integration. Automated management removes operational burden of manually monitoring accounts. Built using standardized template pattern ensuring maintainability. Resource complexity remains major blockchain UX barrier; automated management abstracts CPU/NET concepts from operators.

**Technical Details**:
- Resource Provider: https://github.com/greymass/resource-provider (created April 21)
- Bun Service Template: https://github.com/greymass/bun-service-template (created April 21)
- eosio-resource-manager: Previous solution (replaced)
- Fuel Co-signer: Future replacement target (NOT current capability)

---

## greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Previous Context**: See [March 2025](../2025-03/technical.md#greymass-unicove) for Crowdin integration, Tailwind v4 upgrade, and single-chain mode. See [February 2025](../2025-02/technical.md#greymass-unicove) for multisig support and network abstraction.

**Activity This Month**: 14 PRs merged

### Changes This Month

April delivered two major feature sets: comprehensive token swap (DEX) functionality transforming Unicove into a DeFi platform, and complete Vaulta rebrand reflecting network evolution. Additional work included network-specific theming, Storyblok CMS integration for content management, and UI refinements building on March's infrastructure improvements.

### Pull Requests

#### Major Changes

**#426 - Swap Implementation** ([link](https://github.com/greymass/unicove/pull/426))  
*Merged: 2025-04-10 | Comments: 8*

**Description**: Core implementation of token swap functionality enabling users to exchange tokens directly within Unicove without external DEX applications.

**Impact**: Major new feature adding decentralized exchange capabilities to Unicove. Users can now swap tokens seamlessly within the block explorer/wallet interface. Builds on transaction and state management improvements from February-March. Represents strategic expansion from wallet/explorer to comprehensive DeFi platform.

**Technical Details**: Implements DEX integration with price calculation, slippage settings, price impact warnings, transaction confirmation flow, and error handling for failed swaps.

---

**#444 - Adding swap support for RAM/WRAM** ([link](https://github.com/greymass/unicove/pull/444))  
*Merged: 2025-04-30 | Comments: 7*

**Description**: Extended token swap interface to support RAM (native system resource) and Wrapped RAM (WRAM) trading, completing the swap feature set.

**Impact**: Enables RAM/WRAM pair trading, one of the most important trading pairs on Vaulta. Users can manage RAM resources through familiar token swap interfaces, bridging the gap between resource management and token trading.

---

**#430 - Vaulta** ([link](https://github.com/greymass/unicove/pull/430))  
*Merged: 2025-04-21 | Comments: 7*

**Description**: Major rebrand implementing Vaulta identity replacing EOS branding across Unicove. Includes:
- `make config/vaulta` makefile configuration for Vaulta-specific builds
- Environment-based chain name/logo values (replacing wharfkit/common hardcoding)
- 301 redirects from `/en/eos` to `/en/vaulta` for SEO preservation
- RAM/System token pair support in swap interface
- Historic price data with user's preferred currency

**Related PRs**: wharfkit/common PR #4 for shared configuration updates

**Impact**: Establishes Vaulta as primary brand identity within Unicove following network evolution post-Vaulta Foundation shutdown. Flexible configuration system enables chain-specific branding through environment variables rather than hardcoded values, providing deployment flexibility for future network additions. Proper URL redirects maintain SEO rankings and user bookmarks.

**Technical Details**: Configuration approach allows same codebase to serve multiple networks with different branding based on environment variables. This continues the network abstraction pattern established in February (see [February 2025 Network Abstraction](../2025-02/technical.md#network-abstraction-architecture)).

---

**#427 - Network themes** ([link](https://github.com/greymass/unicove/pull/427))  
*Merged: 2025-04-25*

**Description**: Implemented network-specific theming allowing Unicove to adapt visual identity based on active blockchain. Each network can have custom colors, logos, and styling.

**Impact**: Enhances multi-chain user experience by providing visual differentiation between networks. Users can immediately identify which chain they're interacting with through distinct visual themes, improving safety and preventing accidental cross-chain transactions. Builds on February's network abstraction work.

---

**#441 - Storyblok Exploration** ([link](https://github.com/greymass/unicove/pull/441))  
*Merged: 2025-04-30*

**Description**: Integrated Storyblok headless CMS for content management, enabling non-developers to manage content (news, announcements, documentation) without code changes.

**Impact**: Establishes foundation for scalable content management. Storyblok integration allows content editors to publish updates independently, reducing development overhead for content changes. Decouples content updates from code deployments, enabling faster communication velocity.

**Related**: Supports PR #443 homepage news carousel feature.

---

**#443 - feat: homepage news carousel** ([link](https://github.com/greymass/unicove/pull/443))  
*Merged: 2025-04-30*

**Description**: Added carousel component to homepage displaying news and announcements sourced from Storyblok CMS.

**Impact**: Improves user engagement by surfacing important news and announcements prominently on homepage. Provides dynamic content delivery through CMS integration, enabling marketing team to update homepage content without developer involvement.

---

**#436 - Swap page design** ([link](https://github.com/greymass/unicove/pull/436))  
*Merged: 2025-04-25*

**Description**: UI/UX design implementation for swap interface with clear input controls, price display, slippage settings, and transaction confirmation flow.

**Impact**: Provides polished user interface for token swapping, making DeFi functionality accessible to non-technical users through intuitive design. Completes the user-facing portion of swap feature set.

---

**#420 - Transfer page UI** ([link](https://github.com/greymass/unicove/pull/420))  
*Merged: 2025-04-01*

**Description**: Redesigned token transfer page with improved UX including enhanced input controls, recipient validation, memo field, and confirmation flow.

**Impact**: Improves core wallet functionality with cleaner, more intuitive transfer interface. Reduces user errors through better validation and confirmation steps.

---

#### Minor Changes

**Swap Development**:
- **#419**: Swap ([link](https://github.com/greymass/unicove/pull/419)) - Early swap functionality iteration (merged 2025-04-03)

**Configuration and Bug Fixes**:
- **#440**: Change page banner link to point to Vaulta resource ([link](https://github.com/greymass/unicove/pull/440)) - Updated banner links for rebrand (merged 2025-04-29)
- **#437**: Fixed pricing info + updated test config ([link](https://github.com/greymass/unicove/pull/437)) - Price display fixes (merged 2025-04-25)
- **#432**: Fix environmental variable bug ([link](https://github.com/greymass/unicove/pull/432)) - Environment configuration fix (merged 2025-04-22)

**Release PRs**:
- **#442**: Next Release ([link](https://github.com/greymass/unicove/pull/442)) - Release (merged 2025-04-30)
- **#421**: Next Release ([link](https://github.com/greymass/unicove/pull/421)) - Release (merged 2025-04-28)

### Technical Context

April represented major feature development month with two strategic initiatives:

1. **DeFi Platform Evolution**: Token swap functionality transforms Unicove from block explorer/wallet into comprehensive DeFi platform. Four PRs (#419, #426, #436, #444) delivered complete swap feature including core logic, UI design, and RAM/WRAM support.

2. **Brand Evolution**: Vaulta rebrand reflects network's post-VF direction. Environment-based configuration approach provides flexible branding system supporting multiple network identities from single codebase.

3. **Content Management**: Storyblok CMS integration enables non-technical content updates, improving communication velocity and reducing developer overhead.

4. **Multi-Chain UX**: Network theming continues February's network abstraction work by adding visual differentiation between chains, improving safety in multi-chain environment.

The 14 PRs reflect sustained development velocity with focus on user-facing features building on infrastructure foundations from previous months (multisig, network abstraction, Tailwind v4, Crowdin).

---

## greymass/web-authenticator

**Repository**: https://github.com/greymass/web-authenticator  
**Previous Context**: See [March 2025](../2025-03/technical.md#greymass-web-authenticator) for plugin architecture. See [February 2025](../2025-02/technical.md#greymass-web-authenticator) for Cloudflare edge backend.

**Activity This Month**: 7 PRs merged

### Changes This Month

April advanced Web Authenticator toward production deployment with user dashboard, transaction detail views, MetaKeep signing integration, identity handshake protocols, and authentication refinements. Work focused on completing feature set and security protocols needed for production launch.

### Pull Requests

#### Major Changes

**#22 - Added dashboard and general polishing** ([link](https://github.com/greymass/web-authenticator/pull/22))  
*Merged: 2025-04-29 | Comments: 4*

**Description**: Implemented user dashboard providing account overview, transaction history, settings, and key management. Includes general UI polishing throughout application.

**Impact**: Major UX improvement giving users centralized view of account activity and settings. Dashboard makes Web Authenticator competitive with traditional wallet applications by providing familiar account management interface. Completes core wallet functionality needed for production deployment.

---

**#21 - add transaction detail** ([link](https://github.com/greymass/web-authenticator/pull/21))  
*Merged: 2025-04-23 | Comments: 1*

**Description**: Added detailed transaction views showing action data, authorization, and transaction status. Users can review transaction details before signing and view history of completed transactions.

**Impact**: Improves transparency and security by showing users exactly what they're signing. Detailed views help users understand transaction contents and verify actions match their intent, critical for security in production deployment.

---

**#19 - Adding handshake on identity request and unsealing signing requests** ([link](https://github.com/greymass/web-authenticator/pull/19))  
*Merged: 2025-04-11 | Comments: 1*

**Description**: Implemented identity handshake protocol and request unsealing for secure communication between Web Authenticator and dapps. Ensures secure identity verification and encrypted transaction request handling.

**Impact**: Critical security improvement enabling production deployment. Handshake protocol provides cryptographic verification during identity requests, preventing man-in-the-middle attacks. Unsealing mechanism ensures transaction requests remain confidential during transmission. Enables safe dapp integration.

**Related**: wharfkit/wallet-plugin-web-authenticator PR #2 implementing matching protocol on plugin side.

**Technical Details**: Uses cryptographic handshakes to establish secure channel between wallet and dapp before exchanging identity information or transaction requests. Sealed (encrypted) messages prevent eavesdropping on transaction details during transmission.

---

**#18 - Adding MetaKeep signing method** ([link](https://github.com/greymass/web-authenticator/pull/18))  
*Merged: 2025-04-02 | Comments: 1*

**Description**: Integrated MetaKeep as alternative signing provider offering third-party key management service.

**Impact**: Expands signing method options beyond WebAuthn. MetaKeep integration provides users choice in key management approach, supporting different security models and user preferences. Builds on March's plugin architecture work (see [March 2025 Web Authenticator Plugin Architecture](../2025-03/technical.md#web-authenticator-plugin-architecture)).

**Architecture**: Continues plugin-based signing pattern from March, allowing Web Authenticator to support multiple key management approaches through modular plugins.

---

#### Minor Changes

**Authentication Improvements**:
- **#25**: authjs usage refine ([link](https://github.com/greymass/web-authenticator/pull/25)) - Refined NextAuth.js integration (merged 2025-04-23)
- **#24**: add development login ([link](https://github.com/greymass/web-authenticator/pull/24)) - Development mode login for testing (merged 2025-04-18)

**Bug Fixes**:
- **#28**: fix ricardian folder typo ([link](https://github.com/greymass/web-authenticator/pull/28)) - Fixed typo preventing ricardian contract display (merged 2025-04-30)

### Technical Context

April showed significant maturation of Web Authenticator with production-readiness work across multiple dimensions:

1. **Feature Completeness**: Dashboard (PR #22) and transaction details (PR #21) provide complete wallet functionality matching traditional wallet applications.

2. **Security Protocols**: Identity handshake (PR #19) implements cryptographic security enabling safe production deployment. Matching protocol in wharfkit/wallet-plugin-web-authenticator (PR #2) completes secure communication channel.

3. **Signing Flexibility**: MetaKeep integration (PR #18) provides alternative key management option, expanding user choice beyond WebAuthn-only approach.

4. **Developer Experience**: Development login (PR #24) and authentication refinements improve contributor experience.

These additions move Web Authenticator from prototype to production-ready wallet with complete feature set, security protocols, and flexible signing options. Work builds on February's Cloudflare backend and March's plugin architecture foundations.

---

## greymass/anchor-mobile-android

**Repository**: https://github.com/greymass/anchor-mobile-android  
**Previous Context**: See [March 2025](../2025-03/technical.md#greymass-anchor-mobile-android) for Android 10 compatibility fixes and Crashlytics integration. See [February 2025](../2025-02/technical.md#greymass-anchor-mobile-android) for account creation portal integration.

**Activity This Month**: 6 PRs merged to dev branch

### Changes This Month

April continued March's stability focus with UI refinements, error message improvements, and crash prevention. Work included displaying custom testnet URLs, network rebranding, backup prompt improvements, and fixing null pointer exceptions and assertion errors.

### Pull Requests

**#738 - Displaying custom testnet url instead of generic Custom Testnet** ([link](https://github.com/greymass/anchor-mobile-android/pull/738))  
*Merged: 2025-04-30*

**Description**: Display actual testnet URL in network list instead of generic "Custom Testnet" label.

**Impact**: Improves network management UX by showing meaningful network identifiers rather than generic labels. Helps users identify which custom testnet they're connected to, particularly useful for developers testing on multiple testnets.

---

**#737 - Renamed proton to xpr** ([link](https://github.com/greymass/anchor-mobile-android/pull/737))  
*Merged: 2025-04-30*

**Description**: Updated network naming from "Proton" to "XPR" to match chain's current branding.

**Impact**: Maintains accurate network branding consistent with chain's identity evolution.

---

**#736 - Rewording backup cta** ([link](https://github.com/greymass/anchor-mobile-android/pull/736))  
*Merged: 2025-04-30*

**Description**: Improved call-to-action wording for backup prompts to better motivate users to back up their keys.

**Impact**: Better UX encouraging critical security behavior. Improved CTA wording may increase backup completion rates, reducing account recovery issues.

---

**#733 - catch AssertionError in PromptActivity#onPause and report custom error** ([link](https://github.com/greymass/anchor-mobile-android/pull/733))  
*Merged: 2025-04-29*

**Description**: Added error handling for assertion errors during activity pause lifecycle, preventing crashes and providing meaningful error reports.

**Impact**: Improves app stability by gracefully handling edge case errors in activity lifecycle. Continues March's stability improvement work (see [March 2025 Android Compatibility](../2025-03/technical.md#android-authentication-compatibility-fixes)).

---

**#732 - Fix NullPointerException in AnchorCamera setup** ([link](https://github.com/greymass/anchor-mobile-android/pull/732))  
*Merged: 2025-04-29*

**Description**: Fixed null pointer exception occurring during camera initialization for QR code scanning.

**Impact**: Prevents crashes when accessing camera functionality, improving reliability of QR code scanning features for WalletConnect and account import flows.

---

**#698 - refine key invalidation error** ([link](https://github.com/greymass/anchor-mobile-android/pull/698))  
*Merged: 2025-04-30*

**Description**: Improved error messaging when keys become invalidated due to device security changes or biometric updates.

**Impact**: Better user experience during error states by providing actionable error messages explaining why keys are invalidated and how to recover. Reduces user confusion during key invalidation scenarios common after device security changes.

### Technical Context

April continued March's maintenance focus with targeted improvements:

1. **Error Messaging**: Better error communication for key invalidation (PR #698) and assertion errors (PR #733) improves user experience during edge cases.

2. **UI Polish**: Custom testnet URL display (PR #738), network rebranding (PR #737), and improved backup CTAs (PR #736) refine user interface.

3. **Stability**: Null safety improvements (PR #732) and lifecycle error handling (PR #733) prevent crashes, continuing March's stability work enabled by Crashlytics visibility.

The 6 PRs reflect ongoing maintenance mode with emphasis on polish and reliability. Work addresses issues identified through March's Crashlytics integration, demonstrating data-driven stability improvements.

---

## greymass/anchor-mobile-ios

**Repository**: https://github.com/greymass/anchor-mobile-ios  
**Previous Context**: See previous reports for maintenance mode status. iOS version receives minimal activity compared to Android.

**Activity This Month**: 1 PR merged

### Changes This Month

**#82 - Support account creation portal** ([link](https://github.com/greymass/anchor-mobile-ios/pull/82))  
*Merged: 2025-04-17*

**Description**: Added support for account creation portal integration, connecting to Sextant account creation infrastructure.

**Impact**: Enables iOS users to create new accounts through Anchor Mobile using shared account creation infrastructure. Maintains feature parity with Android version (see [February 2025 Android Portal Integration](../2025-02/technical.md#greymass-anchor-mobile-android)). Ensures iOS benefits from improvements to centralized account creation infrastructure.

**Technical Context**: Completes cross-platform account creation portal integration started in February for Android. Both mobile platforms now use unified account creation infrastructure providing consistent onboarding experience.

---

## wharfkit/wallet-plugin-web-authenticator

**Repository**: https://github.com/wharfkit/wallet-plugin-web-authenticator  
**Activity**: 1 PR merged

### Overview

WharfKit plugin enabling Web Authenticator integration in dapps. Provides wallet selection option for Web Authenticator in WharfKit-powered applications.

### Pull Requests

**#2 - Adding handshake on identity request and sealing message on transaction request** ([link](https://github.com/wharfkit/wallet-plugin-web-authenticator/pull/2))  
*Merged: 2025-04-11*

**Description**: Implemented matching identity handshake protocol and message sealing on plugin side, corresponding to greymass/web-authenticator PR #19. Enables secure identity verification and encrypted transaction request handling between dapps and Web Authenticator.

**Impact**: Critical security improvement enabling production deployment of Web Authenticator in WharfKit-powered dapps. Handshake protocol and message sealing provide cryptographic security for identity requests and transaction signing. Completes the security protocol work needed for Web Authenticator production deployment.

**Related**: greymass/web-authenticator PR #19 implementing matching protocol on wallet side.

**Technical Details**: Plugin-side implementation of cryptographic handshake protocol ensuring both wallet and dapp verify each other's identity before exchanging sensitive information. Message sealing encrypts transaction requests during transmission.

---

## New Repositories

### greymass/bun-service-template

**Created**: 2025-04-21  
**Repository**: https://github.com/greymass/bun-service-template  
**Technology Stack**: Bun (JavaScript runtime), TypeScript

**Description**: Template repository for bootstrapping new backend service projects using Bun runtime. Includes codegen commands for Antelope smart contract integration. Intended as starting point for internal service development.

**Technical Impact**: Standardizes backend service development across Greymass projects. Bun provides faster startup and execution compared to Node.js while maintaining JavaScript/TypeScript ecosystem compatibility (see [glossary: Bun](../glossary.md#bun)).

**Purpose**: Internal tooling for accelerating backend service development with consistent patterns and Antelope blockchain integration support.

**Initial Activity**: Repository created with template structure, minimal initial commits during April.

---

### greymass/resource-provider

**Created**: 2025-04-21  
**Repository**: https://github.com/greymass/resource-provider  
**Status**: IN DEVELOPMENT - Resource Manager feature complete, cosigning features incomplete  
**Technology Stack**: Bun (JavaScript runtime), TypeScript, WharfKit, Drizzle ORM, SQLite

**Description**: Replacement for eosio-resource-manager providing automated network resource (CPU + NET) management. Future goal to also replace Fuel co-signer service, but cosigning features remain incomplete.

**Features**:
- **Resource Manager** (COMPLETE): Automatically manage network resources (CPU + NET) of selected accounts with configurable thresholds
- **Resource Provider** (INCOMPLETE): HTTP API for resource coverage through transaction co-signing - planned future feature
- **Request a Powerup** (INCOMPLETE): HTTP API for account powerup requests - planned future feature

**Status**: Resource Manager feature complete and usable. Cosigning features under development.

**Current Replacement**: Replaces eosio-resource-manager for automated resource management. Resource Manager monitors configured accounts and automatically powers up CPU/NET when resources fall below thresholds.

**Future Goal**: Eventually replace Fuel co-signer service for transaction cosigning, but this functionality not yet implemented.

**Deployment**: Built with Bun's compile feature producing standalone executables. Requires Linux server, blockchain account for service operations, and system token balance for resource provision. Configuration via `.env` file with CLI tool (`rpcli`) for management.

**Technical Impact**: Modernizes resource management infrastructure with updated technology stack (Bun/TypeScript) and WharfKit integration. Automated resource management removes operational burden of manually monitoring and powering up accounts. Built using bun-service-template pattern for consistency across Greymass backend services.

**Links**:
- Repository: https://github.com/greymass/resource-provider
- Releases: https://github.com/greymass/resource-provider/releases

---

## Development Patterns

### Token Swap (DEX) Functionality in Unicove

**Context**: April saw comprehensive implementation of token swap (DEX) functionality in Unicove across four PRs.

**Business Need**: Users need ability to exchange tokens without leaving Unicove to external DEX applications. Integrated swap reduces friction and keeps users within single interface for all blockchain operations.

**Technical Solution**: DEX integration directly in Unicove:
- Core swap logic and smart contract interaction
- User-friendly swap interface with price display
- Slippage settings and price impact warnings
- Support for common trading pairs including RAM/WRAM
- Transaction confirmation and error handling

**Work Completed**:
- PR #419: Swap (foundational) - https://github.com/greymass/unicove/pull/419
- PR #426: Swap Implementation (core logic) - https://github.com/greymass/unicove/pull/426
- PR #436: Swap page design (UI) - https://github.com/greymass/unicove/pull/436
- PR #444: Adding swap support for RAM/WRAM - https://github.com/greymass/unicove/pull/444

**Technical Impact**: Transforms Unicove from block explorer/wallet into comprehensive DeFi platform. Users can now trade tokens, manage RAM resources, and perform complex DeFi operations without switching applications. Reduces friction in DeFi workflows and improves user retention within Unicove ecosystem.

**Architecture**: Integrates with on-chain DEX contracts (likely Defibox or similar Antelope DEX) through WharfKit session management, building on February's transaction handling improvements and March's Tailwind v4 UI infrastructure.

**Links**:
- https://github.com/greymass/unicove/pull/419
- https://github.com/greymass/unicove/pull/426
- https://github.com/greymass/unicove/pull/436
- https://github.com/greymass/unicove/pull/444

---

### Vaulta Rebrand with Flexible Configuration

**Context**: April implemented comprehensive rebrand from EOS to Vaulta across Unicove with flexible configuration architecture.

**Business Need**: Following Vaulta Foundation shutdown and network evolution, rebrand to Vaulta identity reflects network's new direction. Maintaining EOS branding would cause confusion about network status and governance.

**Technical Challenge**: Rebrand requires:
- Configuration system changes to support chain-specific branding
- URL migration with proper redirects for SEO and bookmarks
- Logo and name updates throughout application
- Historical price data currency support
- RAM/System token pair support in swap interface

**Solution Implemented**: Flexible branding system:
- Environment-based chain configuration (replacing hardcoded values)
- 301 redirects from `/en/eos` to `/en/vaulta` 
- Chain name/logo embedded in environment variables
- Vaulta-specific makefile configuration (`make config/vaulta`)
- Currency preference support in price displays

**Work Completed**:
- PR #430: Vaulta - https://github.com/greymass/unicove/pull/430
- Related: wharfkit/common PR #4 for shared configuration updates

**Technical Impact**: Establishes Vaulta as primary network identity within Unicove. Flexible configuration system enables future network additions without hardcoding. Proper redirects maintain SEO rankings and user bookmarks. Environment-based approach provides deployment flexibility for different network configurations.

**Architecture Evolution**: Continues February's network abstraction work (see [February 2025 Network Abstraction](../2025-02/technical.md#network-abstraction-architecture)) by moving branding from hardcoded values to environment configuration. Same pattern supporting multiple networks now supports multiple brand identities.

**Links**:
- https://github.com/greymass/unicove/pull/430
- https://github.com/wharfkit/common/pull/4

---

### Web Authenticator Production Readiness

**Context**: April advanced Web Authenticator toward production deployment with dashboard, security protocols, and feature completeness.

**Technical Challenge**: Web Authenticator needed several critical features before production launch:
- User dashboard for account management
- Secure identity verification protocols
- Transaction detail views for transparency
- Multiple signing method options
- Developer-friendly testing tools

**Solution Implemented**: Complete missing features and security protocols:
- **Dashboard**: Account overview, transaction history, settings management (PR #22)
- **Security Handshakes**: Cryptographic identity verification protocols (PR #19)
- **Transaction Details**: Comprehensive action/authorization display (PR #21)
- **MetaKeep Integration**: Alternative signing provider option (PR #18)
- **Development Tools**: Dev mode login and testing utilities (PR #24)

**Work Completed**:
- PR #18: Adding MetaKeep signing method - https://github.com/greymass/web-authenticator/pull/18
- PR #19: Adding handshake on identity request and unsealing signing requests - https://github.com/greymass/web-authenticator/pull/19
- PR #21: add transaction detail - https://github.com/greymass/web-authenticator/pull/21
- PR #22: Added dashboard and general polishing - https://github.com/greymass/web-authenticator/pull/22
- PR #24: add development login - https://github.com/greymass/web-authenticator/pull/24
- PR #25: authjs usage refine - https://github.com/greymass/web-authenticator/pull/25
- Related: wharfkit/wallet-plugin-web-authenticator PR #2 (matching security protocol)

**Technical Impact**: Web Authenticator reaches feature completeness for production deployment. Dashboard provides traditional wallet functionality while maintaining no-download advantage. Security handshakes enable safe dapp integration. MetaKeep option provides alternative key management for users preferring third-party custody. Development tools improve contributor experience.

**Security Details**: Handshake protocols implement proper cryptographic verification between Web Authenticator and dapps (see [glossary: WebAuthn](../glossary.md#webauthn-web-authentication-api)). Process:
1. Dapp initiates connection with challenge
2. Wallet verifies dapp identity
3. Cryptographic handshake establishes secure channel
4. Identity/transaction requests encrypted during transmission
5. Both parties verify each other preventing MITM attacks

**Architecture Completion**: Builds on February's Cloudflare edge backend (see [February 2025 Cloudflare Edge Backend](../2025-02/technical.md#cloudflare-edge-backend-for-web-authenticator)) and March's plugin architecture (see [March 2025 Plugin Architecture](../2025-03/technical.md#web-authenticator-plugin-architecture)). Complete stack now includes:
- Edge deployment (Cloudflare Workers/Pages)
- Plugin-based signing architecture
- Multiple signing methods (WebAuthn, MetaKeep)
- Secure communication protocols
- Full wallet UI (dashboard, transaction details)

**Links**:
- https://github.com/greymass/web-authenticator/pull/18
- https://github.com/greymass/web-authenticator/pull/19
- https://github.com/greymass/web-authenticator/pull/21
- https://github.com/greymass/web-authenticator/pull/22
- https://github.com/greymass/web-authenticator/pull/24
- https://github.com/greymass/web-authenticator/pull/25
- https://github.com/wharfkit/wallet-plugin-web-authenticator/pull/2

---

### Resource Provider Modernizes Resource Management

**Context**: April saw creation of Resource Provider application replacing eosio-resource-manager. Future goal to replace Fuel, but cosigning features not yet implemented.

**Business Need**: Automated resource management removes operational burden of manually monitoring and powering up accounts. Resource complexity (CPU/NET/RAM concepts) remains major barrier to blockchain operations. Networks need automated solutions managing resources behind the scenes.

**What Was Replaced**: eosio-resource-manager - previous resource management solution requiring updates for modern infrastructure.

**What Will Eventually Be Replaced**: Fuel co-signer service (greymass/fuel-cosigner) - but cosigning functionality incomplete in April, remains future work.

**Solution Implemented**: Build Resource Provider with modern stack:
- **Complete**: Automatic resource management (CPU + NET) for selected accounts with configurable thresholds
- **Incomplete**: HTTP API for transaction co-signing with resource provision (future goal)
- **Incomplete**: Powerup API for direct account resource requests (future goal)
- **Technology**: Bun/TypeScript implementation using bun-service-template pattern
- **Integration**: WharfKit for blockchain interaction (@wharfkit/resources, @wharfkit/session)
- **Persistence**: SQLite with Drizzle ORM for account configuration
- **Deployment**: Bun's compile feature producing standalone executables

**Status**: Resource Manager feature complete and working. Monitors configured accounts, automatically powers up resources when thresholds not met. Cosigning features remain incomplete.

**Work Completed**:
- Created bun-service-template repository establishing backend service patterns (April 21)
- Created greymass/resource-provider using template structure (April 21)
- Implemented complete Resource Manager functionality
- Built CLI tool (`rpcli`) for account management
- Configuration via `.env` files
- Documentation and deployment guides

**Technical Impact**: Modernizes resource management with updated technology stack (Bun/TypeScript) replacing aging infrastructure. Automated monitoring removes need for operators to manually manage account resources. Built using standardized bun-service-template pattern ensuring maintainability and consistency across Greymass backend services. Resource complexity abstracted - operators configure thresholds, system handles powerups automatically.

**Deployment Architecture**:
- Bun-based service compiled to standalone executable
- Runs on Linux server with minimal dependencies
- CLI tool for configuration and account management
- Direct blockchain integration via WharfKit
- SQLite database for account configurations
- Cron-based monitoring checking account resources on schedule
- Automatic powerup transactions when thresholds not met

**Configuration Example**: CLI commands allow specifying minimum resources (min_ms, min_kb), powerup increments (inc_ms, inc_kb), and maximum fees. Service monitors accounts and powers up automatically when resources fall below minimums.

**Deployment Notes**: Requires Linux server, blockchain account with `powerup` permission, and system token balance for resource provision. Built from source with `make build` or use bun-service-template for custom deployments.

**Links**:
- https://github.com/greymass/resource-provider
- https://github.com/greymass/bun-service-template

---

### Network Theming and Multi-Chain UX

**Context**: Building on February's network abstraction and March's single-chain mode, April added network-specific theming.

**Business Need**: As Unicove supports multiple Antelope chains, users need clear visual indication of which network they're using. Accidental transactions on wrong network could result in asset loss.

**Solution Implemented**: Network-specific visual themes:
- Custom colors per network
- Network-specific logos and branding
- Visual differentiation in UI elements
- Instant recognition of active chain

**Work Completed**:
- PR #427: Network themes - https://github.com/greymass/unicove/pull/427

**Technical Impact**: Improves safety and usability in multi-chain environment. Visual themes provide immediate confirmation of active network, preventing cross-chain errors. Builds on network abstraction architecture from February (see [February 2025 Network Abstraction](../2025-02/technical.md#network-abstraction-architecture)), demonstrating continued investment in multi-chain support.

**Implementation**: Theming system likely uses CSS custom properties (CSS variables) combined with network configuration data, enabling dynamic styling based on active chain. Integrates with March's Tailwind v4 infrastructure for efficient theme implementation.

**Links**:
- https://github.com/greymass/unicove/pull/427

---

### Storyblok CMS Integration

**Context**: April integrated Storyblok headless CMS for content management in Unicove.

**Business Need**: Content updates (news, announcements, documentation) require code changes and deployments. This creates bottleneck limiting communication velocity and requiring developer time for non-code tasks.

**Solution Implemented**: Headless CMS integration:
- Storyblok for content management
- Homepage news carousel displaying CMS content
- Content editing without code deployments
- Non-developer content management capability

**Work Completed**:
- PR #441: Storyblok Exploration - https://github.com/greymass/unicove/pull/441
- PR #443: feat: homepage news carousel - https://github.com/greymass/unicove/pull/443

**Technical Impact**: Decouples content updates from code deployments. Content team can publish news, announcements, and updates independently without developer involvement. Homepage carousel improves user engagement by surfacing important information prominently. Scalable content management approach supporting future content needs.

**Architecture**: Storyblok provides headless CMS with:
- Web-based content editing interface
- Rich content model support
- Preview and version control
- API for content delivery
- Webhook support for real-time updates

Unicove integrates via Storyblok API, fetching content at build time (static generation) or runtime (dynamic content).

**Links**:
- https://github.com/greymass/unicove/pull/441
- https://github.com/greymass/unicove/pull/443


