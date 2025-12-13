# Research Data: December 2024

**Generated**: 2024-12-08 19:00 UTC  
**Method**: REST API (historical data >30 days)  
**Rate Limit Remaining**: 4900 core, 30 search

---

## Data Sources & References

**GitHub Organizations**:
- [greymass](https://github.com/greymass)
- [wharfkit](https://github.com/wharfkit)

**Publications**:
- [Medium @greymass RSS](https://medium.com/feed/@greymass)

---

## Summary Statistics

- **Greymass**: 57 PRs merged across 5 repositories
- **Wharfkit**: 3 PRs merged across 3 repositories
- **New Repositories**: 4 created (3 Greymass, 1 Wharfkit)
- **Publications**: 1 blog post (Medium @greymass)
- **Top Repositories by Activity**: 
  - greymass/unicove (32 PRs - major feature development)
  - greymass/anchor-mobile-android (15 PRs - bug fixes and improvements)
  - greymass/account-creation-portal (5 PRs - mobile support enhancements)
  - greymass/web-authenticator (3 PRs - new public repository)
  - greymass/antelope-snap (2 PRs - key management improvements)

---

## Greymass Organization

### greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Activity**: 32 PRs merged

**Strategic Context**: Unicove is the modern block explorer and web-based wallet interface for Antelope blockchains. It serves as the primary user-facing product for blockchain interaction, featuring account management, multisig support, sentiment voting, and seamless wallet integration.

**December Focus**: Intensive development focused on localization, account management features, funding capabilities, homepage redesign, multisig refactoring, token pages, manual account creation, onramp prototyping, cleos CLI support, and performance optimizations. This represents a major push toward production readiness and feature completeness.

#### Major Feature PRs

**PR #328: Localize**  
**Link**: https://github.com/greymass/unicove/pull/328  
**Merged**: 2024-12-27  
**Description**: Implementation of localization system to support multiple languages across Unicove, making the platform accessible to international users.

**PR #324: Only display fund if is current user**  
**Link**: https://github.com/greymass/unicove/pull/324  
**Merged**: 2024-12-19  
**Description**: Enhanced privacy and UX by showing funding options only when viewing the current user's account.

**PR #322: Funding page suggestions**  
**Link**: https://github.com/greymass/unicove/pull/322  
**Merged**: 2024-12-19  
**Description**: Improvements to the funding page based on user feedback and testing.

**PR #321: Performance improvements**  
**Link**: https://github.com/greymass/unicove/pull/321  
**Merged**: 2024-12-18  
**Description**: Optimizations to improve application loading times and runtime performance.

**PR #320: feat: mobile page menu**  
**Link**: https://github.com/greymass/unicove/pull/320  
**Merged**: 2024-12-18  
**Description**: Added mobile-specific page menu for improved mobile user experience.

**PR #318: Funding page**  
**Link**: https://github.com/greymass/unicove/pull/318  
**Merged**: 2024-12-19  
**Description**: New funding page functionality to enable users to fund their accounts.

**PR #317: Updates to MetaMask page**  
**Link**: https://github.com/greymass/unicove/pull/317  
**Merged**: 2024-12-18  
**Description**: Enhancements to MetaMask integration page for better user guidance and functionality.

**PR #316: Homepage polishing for release**  
**Link**: https://github.com/greymass/unicove/pull/316  
**Merged**: 2024-12-18  
**Description**: Final polish and refinements to homepage ahead of production release.

**PR #309: feat: load more token holders**  
**Link**: https://github.com/greymass/unicove/pull/309  
**Merged**: 2024-12-18  
**Description**: Pagination support for token holders list, enabling users to browse through large holder lists.

**PR #307: Permissions page**  
**Link**: https://github.com/greymass/unicove/pull/307  
**Merged**: 2024-12-14  
**Description**: New permissions management page for viewing and managing account permissions.

**PR #305: Adding cleos support while in advanced mode**  
**Link**: https://github.com/greymass/unicove/pull/305  
**Merged**: 2024-12-11  
**Description**: Integration of cleos command-line interface functionality within Unicove for advanced users.

**PR #304: MSIG Refactoring**  
**Link**: https://github.com/greymass/unicove/pull/304  
**Merged**: 2024-12-12  
**Description**: Significant refactoring of multisig proposal functionality for better maintainability and performance.

**PR #302: Homepage**  
**Link**: https://github.com/greymass/unicove/pull/302  
**Merged**: 2024-12-13  
**Description**: Major homepage redesign to improve first-time user experience and navigation.

**PR #300: Token Additions**  
**Link**: https://github.com/greymass/unicove/pull/300  
**Merged**: 2024-12-09  
**Description**: Added support for additional token types and token-related functionality.

**PR #299: Voting Information**  
**Link**: https://github.com/greymass/unicove/pull/299  
**Merged**: 2024-12-09  
**Description**: Enhanced voting information display to help users understand governance participation.

**PR #298: Msig style updates**  
**Link**: https://github.com/greymass/unicove/pull/298  
**Merged**: 2024-12-09  
**Description**: Visual improvements to multisig proposal interface.

**PR #297: Refactor description list component**  
**Link**: https://github.com/greymass/unicove/pull/297  
**Merged**: 2024-12-09  
**Description**: Component refactoring for better reusability and consistency.

**PR #296: Added robots.txt**  
**Link**: https://github.com/greymass/unicove/pull/296  
**Merged**: 2024-12-09  
**Description**: SEO optimization by adding robots.txt configuration.

**PR #295: refactor(button): allow overriding button classes**  
**Link**: https://github.com/greymass/unicove/pull/295  
**Merged**: 2024-12-09  
**Description**: Improved button component flexibility for custom styling.

**PR #294: Initial onramp prototype**  
**Link**: https://github.com/greymass/unicove/pull/294  
**Merged**: 2024-12-06  
**Description**: Prototype implementation of fiat-to-crypto onramp functionality to enable direct token purchases.

**PR #293: Manual create dean**  
**Link**: https://github.com/greymass/unicove/pull/293  
**Merged**: 2024-12-06  
**Description**: Manual account creation workflow improvements.

**PR #292: Input trailing elements background**  
**Link**: https://github.com/greymass/unicove/pull/292  
**Merged**: 2024-12-06  
**Description**: UI refinement for input field styling.

**PR #290: Manual Account Creation**  
**Link**: https://github.com/greymass/unicove/pull/290  
**Merged**: 2024-12-06  
**Description**: Comprehensive manual account creation feature allowing users to create accounts with custom parameters.

**PR #289: Initial token page**  
**Link**: https://github.com/greymass/unicove/pull/289  
**Merged**: 2024-12-06  
**Description**: New token detail page showing token information, holders, and statistics.

**PR #286: Adding msig contract**  
**Link**: https://github.com/greymass/unicove/pull/286  
**Merged**: 2024-12-03  
**Description**: Integration of multisig smart contract functionality.

**PR #285: Refactor pill nav**  
**Link**: https://github.com/greymass/unicove/pull/285  
**Merged**: 2024-12-06  
**Description**: Navigation component refactoring for improved usability.

**PR #284: Msig proposal view**  
**Link**: https://github.com/greymass/unicove/pull/284  
**Merged**: 2024-12-06  
**Description**: Enhanced multisig proposal viewing interface.

#### Release PRs

**PR #323: Release**  
**Link**: https://github.com/greymass/unicove/pull/323  
**Merged**: 2024-12-19  
**Description**: Production release deployment.

**PR #308: Next release**  
**Link**: https://github.com/greymass/unicove/pull/308  
**Merged**: 2024-12-14  
**Description**: Release preparation.

**PR #301: Next Release**  
**Link**: https://github.com/greymass/unicove/pull/301  
**Merged**: 2024-12-14  
**Description**: Release branch merge.

**PR #283: Next Release**  
**Link**: https://github.com/greymass/unicove/pull/283  
**Merged**: 2024-12-06  
**Description**: Release preparation.

**PR #303: fix: layout of key page**  
**Link**: https://github.com/greymass/unicove/pull/303  
**Merged**: 2024-12-10  
**Description**: Bug fix for key page layout issues.

---

### greymass/anchor-mobile-android

**Repository**: https://github.com/greymass/anchor-mobile-android  
**Activity**: 15 PRs merged

**Strategic Context**: Anchor Mobile for Android is the native Android wallet for Antelope blockchains. While in maintenance mode, it continues to receive important bug fixes and usability improvements to support existing users.

**December Focus**: Bug fixes and UI improvements focusing on transaction prompts, QR scanning, internationalization, security enhancements, and compatibility with updated block explorers and web wallet URLs.

#### Notable PRs

**PR #690: check current activity when closePrompt**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/690  
**Merged**: 2024-12-24  
**Description**: Fixed issue with prompt closing to check current activity state.

**PR #689: Added XPR web wallet urls**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/689  
**Merged**: 2024-12-24  
**Description**: Added XPR Network web wallet URLs for improved chain support.

**PR #688: Fix RicardianContract rendering repeatedly**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/688  
**Merged**: 2024-12-16  
**Description**: Performance fix to prevent Ricardian contracts from rendering multiple times unnecessarily.

**PR #686: Catch the creation code verification exception**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/686  
**Merged**: 2024-12-18  
**Description**: Better error handling for account creation code verification.

**PR #685: Fix RNLocalize not detecting Simplified Chinese**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/685  
**Merged**: 2024-12-18  
**Description**: Fixed internationalization issue with Simplified Chinese detection.

**PR #684: Adjust camera authorization logic**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/684  
**Merged**: 2024-12-12  
**Description**: Improved camera permission request flow.

**PR #683: fix QRScanner callback method conflict**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/683  
**Merged**: 2024-12-12  
**Description**: Resolved callback conflicts in QR scanner functionality.

**PR #682: add close function for CertificateScan**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/682  
**Merged**: 2024-12-09  
**Description**: Added ability to close certificate scanning interface.

**PR #681: fix the parameter error for CreationCodeImport connect function**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/681  
**Merged**: 2024-12-09  
**Description**: Fixed parameter handling in creation code import.

**PR #678: change medium url**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/678  
**Merged**: 2024-12-09  
**Description**: Updated Medium blog URL to current location.

**PR #677: Add Custom Testnet clear button on the settings page**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/677  
**Merged**: 2024-12-12  
**Description**: Added button to clear custom testnet settings.

**PR #676: hide privatekey qr after app enter backgroud state**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/676  
**Merged**: 2024-12-09  
**Description**: Security improvement to hide private key QR codes when app goes to background.

**PR #674: replace the icon from bloks.io**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/674  
**Merged**: 2024-12-04  
**Description**: Updated block explorer icon reference.

**PR #672: Fixing block explorer and web wallet urls**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/672  
**Merged**: 2024-12-02  
**Description**: Updated URLs to point to current block explorers and web wallets.

**PR #670: set minifyEnabled true for release**  
**Link**: https://github.com/greymass/anchor-mobile-android/pull/670  
**Merged**: 2024-12-05  
**Description**: Enabled code minification for release builds to reduce app size.

---

### greymass/account-creation-portal

**Repository**: https://github.com/greymass/account-creation-portal  
**Activity**: 5 PRs merged

**Strategic Context**: The account creation portal provides account creation services for multiple platforms including Anchor, MetaMask, and mobile wallets. It's a critical piece of infrastructure for user onboarding.

**December Focus**: Enhanced mobile support including React Native WebView and iOS WebView compatibility, account limit configuration, and deployment improvements.

#### Notable PRs

**PR #21: use real account name**  
**Link**: https://github.com/greymass/account-creation-portal/pull/21  
**Merged**: 2024-12-24  
**Description**: Fixed account name handling to use actual account names instead of placeholders.

**PR #20: Master <- Dev**  
**Link**: https://github.com/greymass/account-creation-portal/pull/20  
**Merged**: 2024-12-23  
**Description**: Production deployment merge from development branch.

**PR #19: Allowing unlimited accounts per email through variable**  
**Link**: https://github.com/greymass/account-creation-portal/pull/19  
**Merged**: 2024-12-23  
**Description**: Added configuration variable to control account creation limits per email address.

**PR #18: Support ios webview**  
**Link**: https://github.com/greymass/account-creation-portal/pull/18  
**Merged**: 2024-12-19  
**Description**: Added support for iOS WebView integration enabling account creation from iOS apps.

**PR #17: Support react native webview**  
**Link**: https://github.com/greymass/account-creation-portal/pull/17  
**Merged**: 2024-12-13  
**Description**: Implemented React Native WebView compatibility for mobile app integration.

---

### greymass/web-authenticator

**Repository**: https://github.com/greymass/web-authenticator  
**Activity**: 3 PRs merged

**Strategic Context**: Web Authenticator is the no-download web-based non-custodial cloud wallet that enables users to create accounts and sign transactions in 1-2 minutes without any downloads. This represents a major onboarding innovation for Antelope blockchains. The repository was newly created in December 2024.

**December Focus**: Initial public repository setup with WebAuthn version implementation and transaction broadcasting improvements.

#### Repository Created

**Created**: 2024-12-07  
**Description**: Web Authenticator  
**URL**: https://github.com/greymass/web-authenticator  
**Last Push**: 2025-12-06

#### Notable PRs

**PR #3: Fixing the use of shouldBroadcast()**  
**Link**: https://github.com/greymass/web-authenticator/pull/3  
**Merged**: 2024-12-31  
**Description**: Corrected transaction broadcasting logic to properly respect shouldBroadcast flag.

**PR #2: enhancement: using create another account when appropriate**  
**Link**: https://github.com/greymass/web-authenticator/pull/2  
**Merged**: 2024-12-30  
**Description**: Improved account creation flow to suggest creating additional accounts when appropriate.

**PR #1: Web authn version**  
**Link**: https://github.com/greymass/web-authenticator/pull/1  
**Merged**: 2024-12-14  
**Description**: Initial WebAuthn implementation establishing the foundation for passwordless authentication.

---

### greymass/antelope-snap

**Repository**: https://github.com/greymass/antelope-snap  
**Activity**: 2 PRs merged

**Strategic Context**: The Antelope Snap is a MetaMask Snap that enables Antelope blockchain support within MetaMask, allowing millions of MetaMask users to access Antelope blockchains without additional software.

**December Focus**: Security improvements implementing separate active and owner keys for better account security.

#### Notable PRs

**PR #15: EOS - using different active owner keys**  
**Link**: https://github.com/greymass/antelope-snap/pull/15  
**Merged**: 2024-12-05  
**Description**: Implemented EOS-specific key derivation to use different keys for active and owner permissions.

**PR #13: Using different active and owner keys**  
**Link**: https://github.com/greymass/antelope-snap/pull/13  
**Merged**: 2024-12-05  
**Description**: Core implementation to derive separate active and owner keys from MetaMask, improving security by ensuring permissions use different key material.

---

## Wharfkit Organization

### wharfkit/contract

**Repository**: https://github.com/wharfkit/contract  
**Activity**: 1 PR merged

**Strategic Context**: Contract Kit provides type-safe smart contract interaction capabilities within the WharfKit SDK suite.

#### PR #71: Fixed false-y nature of JS 0 in table query

**Link**: https://github.com/wharfkit/contract/pull/71  
**Merged**: 2024-12-02  
**Description**: Fixed bug where JavaScript's falsy evaluation of zero (0) caused table queries with index 0 to fail. This ensures table queries work correctly across all valid index values.

---

### wharfkit/wallet-plugin-metamask

**Repository**: https://github.com/wharfkit/wallet-plugin-metamask  
**Activity**: 1 PR merged

**Strategic Context**: This wallet plugin enables MetaMask integration with WharfKit applications, allowing developers to add MetaMask Snap support.

#### PR #8: fix: using new antelope_getActivePublicKey RPC method

**Link**: https://github.com/wharfkit/wallet-plugin-metamask/pull/8  
**Merged**: 2024-12-05  
**Description**: Updated to use new RPC method for retrieving active public keys, coordinating with the antelope-snap changes to support separate active and owner keys.

---

### wharfkit/account-creation-plugin-metamask

**Repository**: https://github.com/wharfkit/account-creation-plugin-metamask  
**Activity**: 1 PR merged

**Strategic Context**: This plugin provides MetaMask-based account creation capabilities for WharfKit applications.

#### PR #4: Using different owner and active key

**Link**: https://github.com/wharfkit/account-creation-plugin-metamask/pull/4  
**Merged**: 2024-12-05  
**Description**: Updated account creation process to use separate owner and active keys derived from MetaMask, improving security for newly created accounts.

---

## New Repositories

### greymass/web-authenticator

**Created**: 2024-12-07  
**Repository**: https://github.com/greymass/web-authenticator  
**Purpose**: No-download web-based non-custodial cloud wallet  
**Technology Stack**: WebAuthn, TypeScript, Svelte  
**Initial Activity**: 3 PRs merged in December

**Description**: Web Authenticator fundamentally changes blockchain onboarding by allowing users to create free accounts and start using blockchain applications in 1-2 minutes without downloads or installations. Built with WebAuthn for passwordless authentication, it integrates with Wharf (WharfKit) enabling any dapp to leverage this frictionless onboarding experience. This removes the traditional barrier of wallet installation that blocks new users from trying blockchain applications.

**README Summary**: The Web Authenticator provides a seamless, secure way for users to interact with Antelope blockchains directly from their web browser. Using modern WebAuthn standards, it creates a non-custodial wallet experience without requiring browser extensions, mobile apps, or seed phrase management for basic usage.

---

### greymass/rex-staking-portal

**Created**: 2024-12-18  
**Repository**: https://github.com/greymass/rex-staking-portal  
**Purpose**: REX staking interface  
**Technology Stack**: Web application  
**Initial Activity**: Repository created, no PRs in period

**Description**: Dedicated portal for REX (Resource Exchange) staking operations on Antelope blockchains, providing users with an interface to stake tokens in the REX system to earn yields.

---

### greymass/wallet-plugin-web-authenticator

**Created**: 2024-12-20  
**Repository**: https://github.com/greymass/wallet-plugin-web-authenticator  
**Purpose**: Wharf Wallet Plugin for the Web Authenticator  
**Technology Stack**: TypeScript, WharfKit plugin architecture  
**Initial Activity**: Repository created, no PRs in period

**Description**: WharfKit wallet plugin enabling Web Authenticator integration into Wharf-based applications. This plugin allows developers to add Web Authenticator as a wallet option in their dapps with minimal integration work.

---

### wharfkit/wallet-plugin-web-authenticator

**Created**: 2024-12-24  
**Repository**: https://github.com/wharfkit/wallet-plugin-web-authenticator  
**Purpose**: Wharf Wallet Plugin for the Web Authenticator  
**Technology Stack**: TypeScript, WharfKit plugin architecture  
**Initial Activity**: Repository created, no PRs in period

**Description**: Canonical WharfKit organization version of the Web Authenticator wallet plugin. This is the official plugin maintained under the WharfKit organization for broader ecosystem access and standardization.

---

## Publications

### "Progress Update (December 2024)"

**Published**: 2024-12-08  
**Source**: https://greymass.medium.com/progress-update-december-2024-49ec7c46a65a  
**RSS Entry**: https://medium.com/feed/@greymass

**Content Summary**: Monthly progress report covering updates to Wharf (WharfKit), Anchor Wallet for both Android and iOS, and the Antelope Snap for MetaMask integration.

**Key Topics**:
- **Wharf Updates**: Antelope library update (v1.0.13) fixing block state header decoding issues for Savanna compatibility; MetaMask wallet plugin (v1.1.1) improved session handling and new active key retrieval method; MetaMask account creation plugin (v1.1.1) implementing separate owner/active keys; Account creation portal WebView support improvements; Resource library (v1.3.1) REX price calculation fix; Minor dependency updates across Account Kit, Contract Kit, and Common library
- **Anchor Android**: Version 0.62 release removing old UI, updating block explorer and web wallet URLs to Unicove, improved biometric prompt handling, better error messaging for malformed keys and account imports, transaction prompt scrolling fixes
- **Anchor iOS**: Version 1.4.0 release updating block explorer and web wallet URLs
- **MetaMask Integration**: Continued development of Antelope Snap with focus on separate key management for improved security

**Technical Highlights**:
- Fixed Savanna API compatibility issues with header_extensions and activated_protocol_features fields
- Implemented separate key derivation paths (index 0 for owner, index 1 for active) in MetaMask integrations for enhanced security
- Added safeguards to prevent owner key usage during transaction signing
- Enhanced WebView support for React Native and iOS for account creation portal
- REX state calculation fix preventing infinite recursion in network price calculations

---

## For Downstream Agents

**Summary Writer** (`agents/summary.md`):
- Read this file for complete context
- December 2024 was characterized by intensive production readiness work across multiple products
- Major themes: Web Authenticator launch (new repository and initial implementation), Unicove feature completion (32 PRs), MetaMask security improvements (separate keys), mobile platform enhancements
- Use source links for verification
- Focus on the strategic impact: Web Authenticator represents a major onboarding innovation that removes traditional wallet installation barriers
- Reference github-projects.md for display names and descriptions

**Technical Writer** (`agents/technical.md`):
- Read this file for complete context
- Include PR numbers and links from here
- Key technical achievements: WebAuthn implementation, separate key derivation for MetaMask, extensive Unicove feature additions (onramp, manual account creation, cleos support, localization)
- Cite sources when making technical claims
- Use discussion summaries for context
- Note the coordinated work across repositories for MetaMask security improvements (antelope-snap, wallet-plugin-metamask, account-creation-plugin-metamask all implementing separate active/owner keys)

**Both agents**: Focus on the WORK and DISCUSSIONS documented here. December 2024 showed significant momentum with 60 total PRs merged, 4 new repositories created (including the strategic Web Authenticator), and coordinated improvements across the ecosystem. The Web Authenticator launch represents a fundamental shift in onboarding approach - moving from download-required wallets to instant web-based authentication. Unicove's 32 PRs demonstrate rapid iteration toward production readiness with features like localization, onramp integration, manual account creation, and cleos CLI support.
