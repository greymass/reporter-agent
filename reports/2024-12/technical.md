# Technical Activity Report
## December 2024

**Navigation**: [← Previous Month](../2024-11/technical.md) | [Next Month →](../2025-01/technical.md)

*Also available: [Executive Summary](README.md) | [Research Data](research.md)*

December 2024 focused on production readiness development across the Greymass and WharfKit ecosystem. The month featured the start of Web Authenticator development (WebAuthn-based cloud wallet), extensive Unicove feature development, coordinated MetaMask security improvements implementing separate key derivation, and continued maintenance of Android wallet infrastructure.

**Key Achievements**:
- Released Unicove 2.0 as the portal to EOS with web wallet and block explorer
- Launched EOS Wallet for MetaMask enabling MetaMask users to interact with EOS
- Launched free account creation allowing new users to create accounts at no cost
- Started development on Web Authenticator exploring browser-based wallet using WebAuthn
- Implemented MetaMask security improvements with separate owner and active keys

**Technical Significance**: December marked major product launches coordinated across multiple repositories, establishing a complete onboarding ecosystem from MetaMask installation through free account creation to wallet usage. Web Authenticator prototype explored browser-native authentication approaches.

---

## Table of Contents

- [Cross-Repository Insights](#cross-repository-insights)

- [greymass/unicove](#greymassunicove)
- [greymass/anchor-mobile-android](#greymassanchor-mobile-android)
- [greymass/web-authenticator](#greymassweb-authenticator)
- [greymass/account-creation-portal](#greymassaccount-creation-portal)
- [greymass/antelope-snap](#greymassantelope-snap)
- [wharfkit/contract](#wharfkitcontract)
- [wharfkit/wallet-plugin-metamask](#wharfkitwallet-plugin-metamask)
- [wharfkit/account-creation-plugin-metamask](#wharfkitaccount-creation-plugin-metamask)
- [New Repositories](#new-repositories)

---

## Cross-Repository Insights

### MetaMask Security Improvements - Separate Key Derivation

Coordinated security improvements across the MetaMask integration stack implementing separate owner and active keys:

**Integration Stack**:
1. **greymass/antelope-snap** - Core Snap implementation
   - [#13](https://github.com/greymass/antelope-snap/pull/13): Separate active and owner key derivation (BIP-44 indices 0 and 1)
   - [#15](https://github.com/greymass/antelope-snap/pull/15): EOS-specific key derivation configuration

2. **wharfkit/wallet-plugin-metamask** - WharfKit wallet integration
   - [#10](https://github.com/wharfkit/wallet-plugin-metamask/pull/10): Updated to use `antelope_getActivePublicKey` for transaction signing

3. **wharfkit/account-creation-plugin-metamask** - Account creation workflow
   - [#2](https://github.com/wharfkit/account-creation-plugin-metamask/pull/2): Retrieves both keys and assigns to appropriate permissions

**Technical Relationship**: Three-layer security architecture coordinating key management:
- **Snap layer**: Derives two separate keys using different BIP-44 indices (owner: index 0, active: index 1)
- **Wallet plugin layer**: Calls `antelope_getActivePublicKey` for transaction signing, never exposing owner key
- **Account creation layer**: Retrieves both keys and assigns owner key to owner permission, active key to active permission

**Security Model**: Aligns with Antelope best practices where active keys (daily transactions) are kept "hot" while owner keys (account recovery, permission changes) are kept "cold". If an active key is compromised, the owner key can revoke it and set a new active key without losing account control.

**Implementation Details**:
- Snap exposes two separate RPC methods: `antelope_getOwnerPublicKey` and `antelope_getActivePublicKey`
- Safeguards prevent owner key usage for transaction signing
- Backward compatibility maintained for existing accounts

**Impact**: Major security improvement bringing MetaMask Snap security model in line with native Antelope wallets. Reduces risk for users by isolating daily-use keys from recovery keys.

---

## greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Activity**: 32 PRs merged

### Overview

Unicove is the modern block explorer and web-based wallet interface for Antelope blockchains, serving as the primary user-facing product for blockchain interaction. December focused on feature completion and production readiness, with major additions including localization, funding capabilities, homepage redesign, multisig refactoring, token pages, manual account creation, onramp prototyping, cleos CLI support, and performance optimizations.

### Pull Requests

#### Major Feature Development

**#328 - Localize** ([link](https://github.com/greymass/unicove/pull/328))  
*Merged: 2024-12-27*

**Description**: Implementation of comprehensive localization system to support multiple languages across Unicove, making the platform accessible to international users.

**Impact**: Enables global audience expansion by removing language barriers for non-English speaking users.

---

**#324 - Only display fund if is current user** ([link](https://github.com/greymass/unicove/pull/324))  
*Merged: 2024-12-19*

**Description**: Enhanced privacy and UX by conditionally showing funding options only when viewing the current user's account.

**Impact**: Improves user experience by preventing confusion about funding actions on accounts the user doesn't control.

---

**#322 - Funding page suggestions** ([link](https://github.com/greymass/unicove/pull/322))  
*Merged: 2024-12-19*

**Description**: User feedback-driven improvements to the funding page interface and flow.

---

**#321 - Performance improvements** ([link](https://github.com/greymass/unicove/pull/321))  
*Merged: 2024-12-18*

**Description**: Application-wide optimizations to improve loading times and runtime performance.

**Impact**: Faster page loads and improved responsiveness for all users.

---

**#320 - feat: mobile page menu** ([link](https://github.com/greymass/unicove/pull/320))  
*Merged: 2024-12-18*

**Description**: Mobile-specific page menu implementation for improved mobile navigation experience.

**Impact**: Better mobile usability addressing the growing mobile user segment.

---

**#318 - Funding page** ([link](https://github.com/greymass/unicove/pull/318))  
*Merged: 2024-12-19*

**Description**: New funding page functionality enabling users to add resources to their accounts.

**Impact**: Critical feature for user onboarding and account management, allowing users to fund accounts directly from Unicove.

---

**#317 - Updates to MetaMask page** ([link](https://github.com/greymass/unicove/pull/317))  
*Merged: 2024-12-18*

**Description**: Enhanced MetaMask integration page with improved guidance and functionality for MetaMask Snap users.

**Impact**: Better user experience for MetaMask-based wallet interactions.

---

**#316 - Homepage polishing for release** ([link](https://github.com/greymass/unicove/pull/316))  
*Merged: 2024-12-18*

**Description**: Final polish and refinements to homepage ahead of production release.

**Impact**: Production-ready homepage optimized for first-time user experience.

---

**#309 - feat: load more token holders** ([link](https://github.com/greymass/unicove/pull/309))  
*Merged: 2024-12-18*

**Description**: Implemented pagination support for token holders list, enabling users to browse through large holder lists.

**Impact**: Handles tokens with thousands of holders without performance degradation.

---

**#307 - Permissions page** ([link](https://github.com/greymass/unicove/pull/307))  
*Merged: 2024-12-14*

**Description**: New permissions management page for viewing and managing account permission structures.

**Impact**: Provides transparency into Antelope's hierarchical permission system, essential for advanced users and multisig operations.

---

**#305 - Adding cleos support while in advanced mode** ([link](https://github.com/greymass/unicove/pull/305))  
*Merged: 2024-12-11*

**Description**: Integration of cleos command-line interface functionality within Unicove for advanced users.

**Impact**: Bridges gap between web UI and CLI tooling, allowing developers and power users to execute cleos commands directly in the browser.

---

**#304 - MSIG Refactoring** ([link](https://github.com/greymass/unicove/pull/304))  
*Merged: 2024-12-12*

**Description**: Significant refactoring of multisig proposal functionality for better maintainability and performance.

**Impact**: Improved code quality and performance for multisig operations, essential for organizational account management.

---

**#302 - Homepage** ([link](https://github.com/greymass/unicove/pull/302))  
*Merged: 2024-12-13*

**Description**: Major homepage redesign to improve first-time user experience and navigation clarity.

**Impact**: Better conversion funnel for new users encountering Unicove for the first time.

---

**#300 - Token Additions** ([link](https://github.com/greymass/unicove/pull/300))  
*Merged: 2024-12-09*

**Description**: Added support for additional token types and expanded token-related functionality.

---

**#299 - Voting Information** ([link](https://github.com/greymass/unicove/pull/299))  
*Merged: 2024-12-09*

**Description**: Enhanced voting information display to help users understand governance participation and voting power calculations.

**Impact**: Improves transparency in blockchain governance processes.

---

**#294 - Initial onramp prototype** ([link](https://github.com/greymass/unicove/pull/294))  
*Merged: 2024-12-06*

**Description**: Prototype implementation of fiat-to-crypto onramp functionality to enable direct token purchases.

**Impact**: Major onboarding improvement removing the barrier of acquiring cryptocurrency through external exchanges.

---

**#290 - Manual Account Creation** ([link](https://github.com/greymass/unicove/pull/290))  
*Merged: 2024-12-06*

**Description**: Comprehensive manual account creation feature allowing users to create accounts with custom parameters including custom key material and resource allocations.

**Impact**: Provides flexibility for advanced users who need control over account creation parameters beyond automated flows.

---

**#289 - Initial token page** ([link](https://github.com/greymass/unicove/pull/289))  
*Merged: 2024-12-06*

**Description**: New dedicated token detail page showing token information, holder distribution, and statistics.

**Impact**: Enhanced token transparency and discoverability within the blockchain explorer functionality.

---

**#286 - Adding msig contract** ([link](https://github.com/greymass/unicove/pull/286))  
*Merged: 2024-12-03*

**Description**: Integration of multisig smart contract functionality for proposal creation and management.

**Impact**: Enables multisig proposal workflows directly in Unicove interface.

---

**#284 - Msig proposal view** ([link](https://github.com/greymass/unicove/pull/284))  
*Merged: 2024-12-06*

**Description**: Enhanced multisig proposal viewing interface with better visualization of approval states and required signatures.

**Impact**: Improved clarity for multisig participants tracking proposal status.

---

#### Component Refactoring and UI Improvements

**#298 - Msig style updates** ([link](https://github.com/greymass/unicove/pull/298))  
*Merged: 2024-12-09*

**Description**: Visual improvements to multisig proposal interface.

---

**#297 - Refactor description list component** ([link](https://github.com/greymass/unicove/pull/297))  
*Merged: 2024-12-09*

**Description**: Component refactoring for better reusability and consistency across the application.

---

**#295 - refactor(button): allow overriding button classes** ([link](https://github.com/greymass/unicove/pull/295))  
*Merged: 2024-12-09*

**Description**: Improved button component flexibility for custom styling use cases.

---

**#293 - Manual create dean** ([link](https://github.com/greymass/unicove/pull/293))  
*Merged: 2024-12-06*

**Description**: Manual account creation workflow improvements.

---

**#292 - Input trailing elements background** ([link](https://github.com/greymass/unicove/pull/292))  
*Merged: 2024-12-06*

**Description**: UI refinement for input field styling consistency.

---

**#285 - Refactor pill nav** ([link](https://github.com/greymass/unicove/pull/285))  
*Merged: 2024-12-06*

**Description**: Navigation component refactoring for improved usability and maintainability.

---

#### SEO and Infrastructure

**#296 - Added robots.txt** ([link](https://github.com/greymass/unicove/pull/296))  
*Merged: 2024-12-09*

**Description**: SEO optimization by adding robots.txt configuration for search engine crawling control.

---

#### Bug Fixes

**#303 - fix: layout of key page** ([link](https://github.com/greymass/unicove/pull/303))  
*Merged: 2024-12-10*

**Description**: Bug fix for key page layout rendering issues.

---

#### Release Management

- **#323**: Release ([link](https://github.com/greymass/unicove/pull/323)) - *Merged: 2024-12-19*
- **#308**: Next release ([link](https://github.com/greymass/unicove/pull/308)) - *Merged: 2024-12-14*
- **#301**: Next Release ([link](https://github.com/greymass/unicove/pull/301)) - *Merged: 2024-12-14*
- **#283**: Next Release ([link](https://github.com/greymass/unicove/pull/283)) - *Merged: 2024-12-06*

---

## greymass/anchor-mobile-android

**Repository**: https://github.com/greymass/anchor-mobile-android  
**Activity**: 15 PRs merged

### Overview

Anchor Mobile for Android is the native Android wallet for Antelope blockchains. While in maintenance mode, December saw important bug fixes and usability improvements focusing on transaction prompts, QR scanning, internationalization, security enhancements, and compatibility with updated block explorers and web wallet URLs.

### Pull Requests

#### Transaction Prompt Improvements

**#690 - check current activity when closePrompt** ([link](https://github.com/greymass/anchor-mobile-android/pull/690))  
*Merged: 2024-12-24*

**Description**: Fixed crash issue with prompt closing by adding current activity state verification before dismissal.

**Impact**: Prevents application crashes during transaction prompt lifecycle management.

---

#### Chain Support Updates

**#689 - Added XPR web wallet urls** ([link](https://github.com/greymass/anchor-mobile-android/pull/689))  
*Merged: 2024-12-24*

**Description**: Added XPR Network web wallet URLs for improved chain support and browser navigation.

---

#### Performance Fixes

**#688 - Fix RicardianContract rendering repeatedly** ([link](https://github.com/greymass/anchor-mobile-android/pull/688))  
*Merged: 2024-12-16*

**Description**: Performance optimization to prevent Ricardian contracts from rendering multiple times unnecessarily during transaction review.

**Impact**: Reduced CPU usage and improved transaction review screen responsiveness.

---

#### Error Handling

**#686 - Catch the creation code verification exception** ([link](https://github.com/greymass/anchor-mobile-android/pull/686))  
*Merged: 2024-12-18*

**Description**: Better error handling for account creation code verification failures with user-friendly messaging.

**Impact**: Improved user experience during account creation flow with clearer error states.

---

#### Internationalization

**#685 - Fix RNLocalize not detecting Simplified Chinese** ([link](https://github.com/greymass/anchor-mobile-android/pull/685))  
*Merged: 2024-12-18*

**Description**: Fixed internationalization bug where React Native Localize library failed to detect Simplified Chinese locale.

**Impact**: Proper language detection and localization for Chinese users.

---

#### Camera and QR Scanning

**#684 - Adjust camera authorization logic** ([link](https://github.com/greymass/anchor-mobile-android/pull/684))  
*Merged: 2024-12-12*

**Description**: Improved camera permission request flow to better handle Android permission states.

---

**#683 - fix QRScanner callback method conflict** ([link](https://github.com/greymass/anchor-mobile-android/pull/683))  
*Merged: 2024-12-12*

**Description**: Resolved callback conflicts in QR scanner that caused scanning failures in certain scenarios.

**Impact**: More reliable QR code scanning for account imports and transaction signing requests.

---

**#682 - add close function for CertificateScan** ([link](https://github.com/greymass/anchor-mobile-android/pull/682))  
*Merged: 2024-12-09*

**Description**: Added ability to close certificate scanning interface without completing the scan.

**Impact**: Better UX allowing users to cancel scanning operations.

---

#### Import Functionality

**#681 - fix the parameter error for CreationCodeImport connect function** ([link](https://github.com/greymass/anchor-mobile-android/pull/681))  
*Merged: 2024-12-09*

**Description**: Fixed parameter handling in creation code import flow preventing successful account imports.

**Impact**: Restored account import functionality via creation codes.

---

#### External Link Updates

**#678 - change medium url** ([link](https://github.com/greymass/anchor-mobile-android/pull/678))  
*Merged: 2024-12-09*

**Description**: Updated Medium blog URL from old to current location.

---

**#674 - replace the icon from bloks.io** ([link](https://github.com/greymass/anchor-mobile-android/pull/674))  
*Merged: 2024-12-04*

**Description**: Updated block explorer icon references for brand consistency.

---

**#672 - Fixing block explorer and web wallet urls** ([link](https://github.com/greymass/anchor-mobile-android/pull/672))  
*Merged: 2024-12-02*

**Description**: Updated URLs throughout the app to point to current block explorers (Unicove) and web wallets, replacing deprecated bloks.io references.

**Impact**: Ensures users can successfully navigate to working block explorers and web interfaces from mobile wallet.

---

#### Settings and Configuration

**#677 - Add Custom Testnet clear button on the settings page** ([link](https://github.com/greymass/anchor-mobile-android/pull/677))  
*Merged: 2024-12-12*

**Description**: Added button to clear custom testnet configuration from settings page.

**Impact**: Easier testnet configuration management for developers.

---

#### Security Improvements

**#676 - hide privatekey qr after app enter backgroud state** ([link](https://github.com/greymass/anchor-mobile-android/pull/676))  
*Merged: 2024-12-09*

**Description**: Security improvement to automatically hide private key QR codes when app transitions to background state.

**Impact**: Prevents shoulder-surfing attacks and accidental key exposure when switching apps.

---

#### Build Configuration

**#670 - set minifyEnabled true for release** ([link](https://github.com/greymass/anchor-mobile-android/pull/670))  
*Merged: 2024-12-05*

**Description**: Enabled code minification for release builds using ProGuard/R8.

**Impact**: Reduced APK size and improved reverse-engineering resistance for production builds.

---

## greymass/web-authenticator

**Repository**: https://github.com/greymass/web-authenticator  
**Activity**: 3 PRs merged | Repository created December 2024

### Overview

Web Authenticator is a new no-download web-based non-custodial cloud wallet under development that aims to fundamentally change blockchain onboarding. Using WebAuthn (the web standard for passwordless authentication), it enables users to create free accounts and start using blockchain applications in 1-2 minutes without any downloads, extensions, or traditional seed phrase management. This represents a major innovation in removing the traditional wallet installation barrier that prevents new users from trying blockchain applications.

**Technology Stack**: WebAuthn API, TypeScript, Svelte, WharfKit integration

**Architecture**: Browser-based WebAuthn credential creation stores private key material in browser's secure enclave. Keys are derived from WebAuthn credentials and never leave the user's device. The wallet integrates with WharfKit's plugin architecture enabling any WharfKit-based dapp to offer Web Authenticator as a login option.

### Pull Requests

**#3 - Fixing the use of shouldBroadcast()** ([link](https://github.com/greymass/web-authenticator/pull/3))  
*Merged: 2024-12-31*

**Description**: Corrected transaction broadcasting logic to properly respect the shouldBroadcast flag, which controls whether transactions should be immediately broadcast to the blockchain or returned unsigned for manual broadcasting.

**Impact**: Enables proper handling of multi-step transaction flows where immediate broadcasting is not desired.

---

**#2 - enhancement: using create another account when appropriate** ([link](https://github.com/greymass/web-authenticator/pull/2))  
*Merged: 2024-12-30*

**Description**: Improved account creation flow to detect when users should create additional accounts versus importing existing ones, streamlining the UX for multi-account management.

**Impact**: Better account management guidance for users operating multiple blockchain accounts.

---

**#1 - Web authn version** ([link](https://github.com/greymass/web-authenticator/pull/1))  
*Merged: 2024-12-14*

**Description**: Initial WebAuthn implementation establishing the foundation for passwordless authentication. This PR implemented credential creation, key derivation from WebAuthn assertions, transaction signing flows, and WharfKit integration.

**Impact**: Core functionality enabling the entire Web Authenticator product. Leverages browser's built-in WebAuthn support (fingerprint, Face ID, Windows Hello, security keys) for secure key management without requiring users to manage seed phrases.

---

## greymass/account-creation-portal

**Repository**: https://github.com/greymass/account-creation-portal  
**Activity**: 5 PRs merged

### Overview

The account creation portal provides account creation services across multiple platforms including Anchor wallets, MetaMask Snap integration, and mobile applications. December focused on enhanced mobile support with React Native and iOS WebView compatibility, plus configuration improvements for account limits.

### Pull Requests

**#21 - use real account name** ([link](https://github.com/greymass/account-creation-portal/pull/21))  
*Merged: 2024-12-24*

**Description**: Fixed account name handling to use actual created account names instead of placeholder values in responses.

**Impact**: Proper account name display in mobile wallets after creation.

---

**#20 - Master <- Dev** ([link](https://github.com/greymass/account-creation-portal/pull/20))  
*Merged: 2024-12-23*

**Description**: Production deployment merge from development branch.

---

**#19 - Allowing unlimited accounts per email through variable** ([link](https://github.com/greymass/account-creation-portal/pull/19))  
*Merged: 2024-12-23*

**Description**: Added environment variable configuration to control account creation limits per email address, allowing operators to set unlimited accounts if desired.

**Impact**: Flexible deployment configuration for different use cases (public service vs. private deployments).

---

**#18 - Support ios webview** ([link](https://github.com/greymass/account-creation-portal/pull/18))  
*Merged: 2024-12-19*

**Description**: Added support for iOS WKWebView integration, handling iOS-specific JavaScript bridge communication for account creation from native iOS apps.

**Impact**: Enables account creation directly within iOS applications without opening external browser.

---

**#17 - Support react native webview** ([link](https://github.com/greymass/account-creation-portal/pull/17))  
*Merged: 2024-12-13*

**Description**: Implemented React Native WebView compatibility with message passing between portal and React Native application.

**Impact**: Seamless account creation integration for React Native-based mobile wallets.

---

## greymass/antelope-snap

**Repository**: https://github.com/greymass/antelope-snap  
**Activity**: 2 PRs merged

### Overview

The Antelope Snap is a MetaMask Snap that enables Antelope blockchain support within MetaMask, allowing millions of MetaMask users to access Antelope blockchains without additional wallet software. December's work focused on critical security improvements implementing separate key derivation for active and owner permissions.

### Pull Requests

**#15 - EOS - using different active owner keys** ([link](https://github.com/greymass/antelope-snap/pull/15))  
*Merged: 2024-12-05*

**Description**: Implemented EOS-specific key derivation paths to use different keys for active and owner permissions on EOS mainnet.

**Impact**: Chain-specific security configuration for EOS blockchain.

---

**#13 - Using different active and owner keys** ([link](https://github.com/greymass/antelope-snap/pull/13))  
*Merged: 2024-12-05*

**Description**: Core implementation to derive separate active and owner keys from MetaMask's key material using different BIP-44 derivation paths. Owner keys use index 0, active keys use index 1.

**Impact**: Major security improvement following Antelope best practices. Separate keys ensure that if an active key is compromised (which is used for daily transactions), the owner key remains secure and can be used to recover the account. This matches the security model used by native Antelope wallets.

---

## wharfkit/contract

**Repository**: https://github.com/wharfkit/contract  
**Activity**: 1 PR merged

### Overview

Contract Kit provides type-safe smart contract interaction capabilities within the WharfKit SDK suite, enabling developers to query tables and call contract actions with TypeScript types.

### Pull Requests

**#71 - Fixed false-y nature of JS 0 in table query** ([link](https://github.com/wharfkit/contract/pull/71))  
*Merged: 2024-12-02*

**Description**: Fixed bug where JavaScript's falsy evaluation of zero (0) caused table queries with index 0 to fail. The condition `if (index)` was evaluating to false for index 0, causing queries to skip index specification.

**Technical Details**: Changed condition from `if (index)` to `if (index !== undefined)` to properly handle all valid numeric index values including 0.

**Impact**: Table queries now work correctly across all valid secondary index values (0-15), fixing failures when querying tables using the first secondary index.

---

## wharfkit/wallet-plugin-metamask

**Repository**: https://github.com/wharfkit/wallet-plugin-metamask  
**Activity**: 1 PR merged

### Overview

This wallet plugin enables MetaMask Snap integration with WharfKit applications, allowing developers to add MetaMask support to their dapps with minimal integration code.

### Pull Requests

**#8 - fix: using new antelope_getActivePublicKey RPC method** ([link](https://github.com/wharfkit/wallet-plugin-metamask/pull/8))  
*Merged: 2024-12-05*

**Description**: Updated to use new `antelope_getActivePublicKey` RPC method for retrieving active public keys from the Antelope Snap, coordinating with antelope-snap #13 that implemented separate active and owner keys.

**Technical Details**: Previously the plugin retrieved only one key from the snap. With the separate key implementation, the snap now exposes different methods for active vs. owner keys. The wallet plugin must use the active key for transaction signing operations.

**Impact**: Ensures wallet plugin correctly retrieves the active key (not owner key) for transaction signing, maintaining the security separation implemented in the snap.

---

## wharfkit/account-creation-plugin-metamask

**Repository**: https://github.com/wharfkit/account-creation-plugin-metamask  
**Activity**: 1 PR merged

### Overview

This plugin provides MetaMask-based account creation capabilities for WharfKit applications, enabling dapps to offer MetaMask Snap account creation workflows.

### Pull Requests

**#4 - Using different owner and active key** ([link](https://github.com/wharfkit/account-creation-plugin-metamask/pull/4))  
*Merged: 2024-12-05*

**Description**: Updated account creation process to retrieve and use separate owner and active keys derived from MetaMask Snap, coordinating with antelope-snap #13 implementation.

**Technical Details**: Account creation now calls the snap twice to retrieve owner key (index 0) and active key (index 1), then creates the account with both keys properly assigned to their respective permissions.

**Impact**: Newly created accounts through MetaMask have proper security configuration with separate keys for owner and active permissions, following Antelope security best practices from account creation.

---

## New Repositories

### greymass/web-authenticator

**Created**: 2024-12-07  
**Repository**: https://github.com/greymass/web-authenticator  
**Purpose**: No-download web-based non-custodial cloud wallet  
**Technology Stack**: WebAuthn, TypeScript, Svelte  
**Initial Activity**: 3 PRs merged in December

**Description**: Web Authenticator is being developed to enable users to create free accounts and start using blockchain applications in 1-2 minutes without downloads or installations. Built with WebAuthn for passwordless authentication, it will integrate with WharfKit enabling any dapp to leverage this frictionless onboarding experience. This aims to remove the traditional barrier of wallet installation that blocks new users from trying blockchain applications.

**Technical Architecture**: Uses browser's native WebAuthn API to create and store credentials in secure hardware (TPM, secure enclave). Private keys are derived from WebAuthn assertions and never leave the device. No seed phrases required for basic usage. Integrates with WharfKit's plugin architecture for seamless dapp integration.

---

### greymass/rex-staking-portal

**Created**: 2024-12-18  
**Repository**: https://github.com/greymass/rex-staking-portal  
**Purpose**: REX staking interface  
**Technology Stack**: Web application  
**Initial Activity**: Repository created, no PRs in period

**Description**: Dedicated portal for REX (Resource Exchange) staking operations on Antelope blockchains, providing users with an interface to stake tokens in the REX system to earn yields while providing liquidity to the resource rental market.

---

### greymass/wallet-plugin-web-authenticator

**Created**: 2024-12-20  
**Repository**: https://github.com/greymass/wallet-plugin-web-authenticator  
**Purpose**: WharfKit Wallet Plugin for the Web Authenticator  
**Technology Stack**: TypeScript, WharfKit plugin architecture  
**Initial Activity**: Repository created, no PRs in period

**Description**: WharfKit wallet plugin enabling Web Authenticator integration into Wharf-based applications. This plugin allows developers to add Web Authenticator as a wallet option in their dapps by installing the plugin and adding it to their WharfKit SessionKit configuration.

---

### wharfkit/wallet-plugin-web-authenticator

**Created**: 2024-12-24  
**Repository**: https://github.com/wharfkit/wallet-plugin-web-authenticator  
**Purpose**: WharfKit Wallet Plugin for the Web Authenticator  
**Technology Stack**: TypeScript, WharfKit plugin architecture  
**Initial Activity**: Repository created, no PRs in period

**Description**: Canonical WharfKit organization version of the Web Authenticator wallet plugin. This is the official plugin maintained under the WharfKit organization for broader ecosystem access and standardization across WharfKit-based applications.


