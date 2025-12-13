# Technical Activity Report
## March 2025

**Navigation**: [← Previous Month](../2025-02/technical.md) | [Next Month →](../2025-04/technical.md)

*Also available: [Executive Summary](README.md) | [Research Data](research.md)*

March 2025 focused on enabling crowd-sourced contributions, modern tooling adoption, and intensive stability improvements. Key work included Crowdin integration enabling non-coders to contribute translations to Unicove, Tailwind CSS v4 upgrade for modern styling infrastructure, comprehensive Android authentication fixes for older device compatibility, and Web Authenticator plugin architecture refactoring. The month showed 29 PRs merged with emphasis on enablement and refinement rather than major new features.

**Key Achievements**:
- Enabled crowd-sourced translations in Unicove through Crowdin integration
- Modernized Unicove design infrastructure with Tailwind CSS v4
- Enabled single-network deployment mode for Unicove
- Fixed 13 stability issues in Anchor Mobile (Android) improving older device compatibility
- Added production error tracking to Anchor Mobile (Android) with Firebase Crashlytics
- Refactored Web Authenticator signing logic into plugin architecture

**Technical Significance**: March established critical enablement infrastructure allowing non-technical community members to contribute translations, modernized styling infrastructure for better performance, and resolved systematic authentication compatibility issues on older Android devices. The plugin architecture refactoring in Web Authenticator aligns with WharfKit ecosystem patterns improving future extensibility.

---

## Table of Contents

- [Cross-Repository Insights](#cross-repository-insights)
- [greymass/unicove](#greymassunicove)
- [greymass/anchor-mobile-android](#greymassanchor-mobile-android)
- [greymass/web-authenticator](#greymassweb-authenticator)

---

## Cross-Repository Insights

### WharfKit Plugin Ecosystem Alignment

**Integration**: Web Authenticator plugin architecture aligns with WharfKit's plugin-based wallet integration system.

**Technical Relationship**: WharfKit uses plugin architecture for wallet integrations, where each wallet implementation is a plugin that implements standard interfaces. Web Authenticator's refactoring to move signing logic into plugins (PR #13) aligns with this pattern, enabling better integration with the WharfKit ecosystem.

**How They Work Together**:
- **WharfKit Core**: Defines standard plugin interfaces for wallet operations
- **Web Authenticator Plugins**: Implement signing methods as modular plugins
- **Integration Point**: Web Authenticator can now integrate more cleanly with WharfKit's plugin system since both use compatible plugin architectures
- **Future Extensibility**: New signing methods can be added as plugins without modifying core code in either system

**Benefit**: Architectural alignment improves maintainability, enables better WharfKit ecosystem integration, and makes it easier to add new signing methods in the future. The plugin pattern allows Web Authenticator to work as a WharfKit wallet plugin while maintaining its own modular signing plugin system internally.

**Technical Details**:
- Web Authenticator: PR #13 - Moving signing logic to plugins ([link](https://github.com/greymass/web-authenticator/pull/13))
- See [February 2025](../2025-02/technical.md#cross-repository-insights) for WharfKit integration context

---

## greymass/unicove

**Repository**: https://github.com/greymass/unicove  
**Previous Context**: See [February 2025](../2025-02/technical.md#greymass-unicove) for multisig account support and network abstraction. See [January 2025](../2025-01/technical.md#unicove) for contract-based API architecture.

**Activity This Month**: 15 PRs merged

### Changes This Month

March focused on three strategic initiatives: crowd-sourced translation infrastructure through Crowdin integration, modern styling infrastructure with Tailwind CSS v4, and deployment flexibility with single-chain mode. Work built on February's multisig and network abstraction foundations while enabling non-technical community members to contribute translations.

### Pull Requests

#### Major Changes

**#415 - Crowdin Integration** ([link](https://github.com/greymass/unicove/pull/415))  
*Merged: 2025-03-27*

**Description**: Integrated Crowdin translation management platform, enabling non-coders to contribute translations through web-based tools.

**Impact**: Removes technical barriers to translation contribution by providing simple web interface for community translators. Crowdin enables anyone to contribute translations without coding knowledge, using tools like translation memory, automated workflows, and collaborative review. Transitions from machine translations to crowd-sourced community translations.

**Follow-up**: PR #416 merged new Crowdin-generated translations immediately after integration.

---

**#412 - Tailwind v4** ([link](https://github.com/greymass/unicove/pull/412))  
*Merged: 2025-03-20*

**Description**: Upgraded CSS framework from Tailwind CSS v3 to v4, bringing new engine with performance improvements and modern capabilities.

**Impact**: Modernizes styling infrastructure providing:
- Faster build times through new engine
- Smaller production bundle sizes
- Enhanced utility classes and developer experience
- Improved CSS output efficiency

**Technical Details**: Tailwind v4 includes complete engine rewrite with significant performance improvements. Migration required updating all Tailwind configuration and reviewing utility usage across codebase.

---

**#398 - Single chain** ([link](https://github.com/greymass/unicove/pull/398))  
*Merged: 2025-03-12*

**Description**: Implemented single-chain deployment mode allowing Unicove to operate as dedicated single-chain interface rather than multi-chain explorer.

**Impact**: Provides deployment flexibility enabling focused single-chain deployments for specific Antelope blockchains. Builds on February's network abstraction work (PR #355) by adding configuration option to disable chain selection UI and focus interface on single network. Maintains architectural flexibility through configuration rather than code changes.

**Use Cases**:
- Chain-specific deployments for focused user experience
- Embedded blockchain explorers for specific networks
- Simplified interface when multi-chain support unnecessary

---

**#391 - Permissions** ([link](https://github.com/greymass/unicove/pull/391))  
*Merged: 2025-03-05*

**Description**: Continued refinement of permissions management interface, building on February's multisig work (PR #384).

**Impact**: Improved usability of permission and authority management interfaces, making complex multisig configurations more accessible. Enhanced display of permission hierarchies and authority structures.

---

**#393 - Refactoring Tokens** ([link](https://github.com/greymass/unicove/pull/393))  
*Merged: 2025-03-05*

**Description**: Architectural refactoring of token handling logic in anticipation of expanding token-related features.

**Impact**: Improves maintainability and extensibility of token-related code by restructuring how tokens are managed throughout the application. Prepares codebase for future token management features.

---

#### Minor Changes

**UI/UX Improvements**:
- **#407**: Permissions UI Changes ([link](https://github.com/greymass/unicove/pull/407)) - Enhanced permissions interface clarity (merged 2025-03-20)
- **#414**: refactor: remove network switch button from account switch sidebar ([link](https://github.com/greymass/unicove/pull/414)) - UI streamlining (merged 2025-03-27)
- **#410**: refactor: reusable localstorage key ([link](https://github.com/greymass/unicove/pull/410)) - Code refactoring (merged 2025-03-20)
- **#408**: refactor: banner component ([link](https://github.com/greymass/unicove/pull/408)) - Component refactoring (merged 2025-03-20)
- **#400**: style: root error page ([link](https://github.com/greymass/unicove/pull/400)) - Error page styling (merged 2025-03-12)
- **#396**: fix: account switch filter bug ([link](https://github.com/greymass/unicove/pull/396)) - Bug fix (merged 2025-03-05)

**Internationalization**:
- **#416**: New Crowdin Translations ([link](https://github.com/greymass/unicove/pull/416)) - First translation batch from Crowdin (merged 2025-03-27)

**Release PRs**:
- **#411**: Next Release ([link](https://github.com/greymass/unicove/pull/411)) - Release (merged 2025-03-20)
- **#406**: Next Release (Additional Testnets) ([link](https://github.com/greymass/unicove/pull/406)) - Release (merged 2025-03-14)
- **#403**: Next Release ([link](https://github.com/greymass/unicove/pull/403)) - Release (merged 2025-03-12)

### Technical Context

March represented strategic development focused on enablement and modernization:

1. **Internationalization Infrastructure**: Crowdin integration transitions from one-off machine translations to sustainable community-driven workflow, critical for global expansion.

2. **Modern Tooling**: Tailwind v4 adoption keeps Unicove on current styling infrastructure with performance benefits.

3. **Deployment Flexibility**: Single-chain mode provides configuration-based deployment options building on February's network abstraction.

4. **Continued Refinement**: 15 PRs reflect ongoing polish of February's major features (multisig, network abstraction) with UX improvements and bug fixes.

---

## greymass/anchor-mobile-android

**Repository**: https://github.com/greymass/anchor-mobile-android  
**Previous Context**: See [February 2025](../2025-02/technical.md#greymass-anchor-mobile-android) for account creation portal integration and stability improvements. See [January 2025](../2025-01/technical.md#anchor-mobile-android) for previous maintenance work.

**Activity This Month**: 13 PRs merged to dev branch

### Changes This Month

March focused intensively on stability improvements, particularly addressing authentication compatibility issues on Android 10 (API 29) and below. Work included Firebase Crashlytics integration for production error tracking, systematic fixes for biometric authentication on older devices, and various crash prevention improvements.

### Pull Requests

#### Major Changes

**#716 - add crashlytics** ([link](https://github.com/greymass/anchor-mobile-android/pull/716))  
*Merged: 2025-03-26*

**Description**: Integrated Firebase Crashlytics for production crash tracking and debugging. Requires saving source mapping files after builds:
- `index.android.bundle.map` - Maps React Native JavaScript from minified to original
- `mapping.txt` - Maps native Java/Kotlin code from obfuscated to original

**Impact**: Provides visibility into production crashes with full source mapping for both React Native and native Android code. Enables proactive identification and fixing of stability issues based on real-world crash data. Critical infrastructure for maintaining app quality at scale.

**Technical Details**: Crashlytics automatically collects crash reports from production with deobfuscated stack traces. Combined with source maps, provides complete debugging context for both JavaScript and native crashes.

---

**#725 - Generate key by AccountSettingsState with device authentication checking** ([link](https://github.com/greymass/anchor-mobile-android/pull/725))  
*Merged: 2025-03-27*

**Description**: Fixed authentication compatibility issues on Android 10 and older devices. Problem: default `AccountSettingsState` values (`useBiometry=true`, `usePin=true`) didn't account for device capabilities. Android 10 (API 29) and below don't support strong biometric authentication required by `AccessControl.BIOMETRY_ANY_OR_DEVICE_PASSCODE`, causing crashes during key generation.

**Solution**: Implemented proper device capability detection before key generation, adjusting account settings based on actual device authentication support.

**Impact**: Resolves systematic crashes on Android 10 and below by validating device authentication capabilities before attempting key generation. Improves app compatibility across Android ecosystem, particularly for users on older devices.

**Technical Context**: Strong biometric authentication (Class 3 biometrics) not available on Android API 29 and below. App must detect capabilities and gracefully degrade to supported authentication methods.

---

#### Stability and Bug Fixes

**Authentication and Key Management**:
- **#726**: fix throwOnUnsupportedAuth check when genreateKey ([link](https://github.com/greymass/anchor-mobile-android/pull/726)) - Fixed authentication checking logic (merged 2025-03-28)
- **#722**: Dont switch to creating state when generateKeys failed ([link](https://github.com/greymass/anchor-mobile-android/pull/722)) - Improved state management on key generation failures (merged 2025-03-26)
- **#719**: fix authenticator combination is unsupported on API 29 ([link](https://github.com/greymass/anchor-mobile-android/pull/719)) - Android 10 biometric compatibility fix (merged 2025-03-23)

**UI and Interaction**:
- **#724**: fix KeyManagement could not scroll ([link](https://github.com/greymass/anchor-mobile-android/pull/724)) - Fixed scrolling bug in key management (merged 2025-03-28)
- **#723**: add hardwareBackPress listener for RecoverView ([link](https://github.com/greymass/anchor-mobile-android/pull/723)) - Improved back button handling (merged 2025-03-26)
- **#714**: change PromptActivity to portrait ([link](https://github.com/greymass/anchor-mobile-android/pull/714)) - Locked prompt to portrait orientation (merged 2025-03-11)

**Crash Prevention**:
- **#720**: Fix NPE in SplashScreen removal by checking Activity state ([link](https://github.com/greymass/anchor-mobile-android/pull/720)) - Fixed null pointer exception (merged 2025-03-22)
- **#717**: Ensure permissions is string[] instead of Name[] to fix rendering error ([link](https://github.com/greymass/anchor-mobile-android/pull/717)) - Fixed type mismatch causing crashes (merged 2025-03-22)
- **#715**: catch AssertionError on Activity pause ([link](https://github.com/greymass/anchor-mobile-android/pull/715)) - Added error handling for lifecycle edge cases (merged 2025-03-11)

**Infrastructure**:
- **#718**: fix ci check ([link](https://github.com/greymass/anchor-mobile-android/pull/718)) - Fixed continuous integration (merged 2025-03-22)
- **#712**: Add file_paths.xml to configure FileProvider paths for sharing files ([link](https://github.com/greymass/anchor-mobile-android/pull/712)) - Configured secure file sharing (merged 2025-03-20)

### Technical Context

March demonstrated intensive maintenance focus on Anchor Android, particularly addressing authentication and stability issues on older Android versions:

1. **Production Visibility**: Crashlytics integration provides critical insight into production issues, enabling data-driven stability improvements.

2. **Android Compatibility**: Systematic fixes for Android 10 and below authentication issues address significant portion of user base still on older devices.

3. **Crash Prevention**: Multiple PRs addressing null pointer exceptions, type mismatches, and lifecycle issues improve overall app stability.

4. **Maintenance Mode**: The 13 PRs reflect ongoing maintenance of production application with focus on stability and compatibility rather than new features.

---

## greymass/web-authenticator

**Repository**: https://github.com/greymass/web-authenticator  
**Previous Context**: See [February 2025](../2025-02/technical.md#greymass-web-authenticator) for Cloudflare edge backend completion. See [January 2025](../2025-01/technical.md#web-authenticator) for backend infrastructure addition.

**Activity This Month**: 1 PR merged

### Changes This Month

**#13 - Moving signing logic to plugins** ([link](https://github.com/greymass/web-authenticator/pull/13))  
*Merged: 2025-03-17*

**Description**: Architectural refactoring moving transaction signing logic from core application into plugin architecture.

**Impact**: Improves code organization and maintainability by separating signing concerns into modular plugins. Makes it easier to add new signing methods in the future. Aligns with WharfKit's plugin-based architecture, enabling better integration with WharfKit ecosystem.

**Architecture**: 
- **Previous**: Monolithic signing logic in core application
- **New**: Plugin-based signing with modular implementations
- **Benefits**: Easier to add new signing methods, better code organization, improved testability

**Technical Context**: WharfKit uses plugin architecture for wallet integrations. Moving signing logic to plugins aligns Web Authenticator with this pattern, enabling better ecosystem integration and future extensibility.

---

## Development Patterns

### Crowd-Sourced Translation Infrastructure with Crowdin

**Context**: Building on January/February's machine translation work, March enabled non-coders to contribute translations.

**The Business Need**: Machine translations from January/February provided initial multi-language support, but quality translations require native speakers and human review. Technical contribution barriers prevented community members from helping with translations.

**The Solution**: Integrate Crowdin platform enabling non-technical users to contribute translations:
- Web-based translation interface requiring no coding knowledge
- Simple tools for community members to suggest and review translations
- Translation memory for consistency across updates
- Automated synchronization between translation platform and codebase
- Context for translators improving translation quality

**Work Completed**:
- PR #415: Crowdin Integration - https://github.com/greymass/unicove/pull/415
- PR #416: New Crowdin Translations - https://github.com/greymass/unicove/pull/416

**Technical Impact**: Removes technical barriers to translation contribution. Non-coders can now:
- Contribute translations through simple web interface
- Review and improve existing translations
- Collaborate with other translators on quality
- Access translation memory for consistency

**Strategic Impact**: Enables global community to improve translations without technical knowledge. Anyone who speaks another language can now contribute, dramatically expanding potential translator pool beyond developers.

**Links**:
- https://github.com/greymass/unicove/pull/415
- https://github.com/greymass/unicove/pull/416

---

### Tailwind CSS v4 Upgrade

**Context**: Unicove upgraded from Tailwind CSS v3 to v4, representing major styling infrastructure modernization.

**The Challenge**: Tailwind CSS v3 had limitations in performance and developer experience. Version 4 introduced complete engine rewrite with significant improvements, but required migration effort across entire codebase.

**The Solution**: Migrate all styling to Tailwind v4, taking advantage of:
- New high-performance engine with faster build times
- Improved CSS output resulting in smaller bundle sizes
- Enhanced utility classes and improved developer ergonomics
- Better developer experience with improved tooling
- Modern CSS features support

**Work Completed**:
- PR #412: Tailwind v4 - https://github.com/greymass/unicove/pull/412

**Technical Impact**: 
- **Performance**: Faster build times and smaller production bundles
- **Developer Experience**: Improved tooling and better utility classes
- **Maintainability**: Modern codebase aligned with current best practices
- **Future-proofing**: Ensures Unicove stays on supported Tailwind version

**Migration Scope**: Required reviewing and updating Tailwind configuration, auditing utility usage across components, and testing styling across all pages and features.

**Links**:
- https://github.com/greymass/unicove/pull/412

---

### Single-Chain Deployment Mode

**Context**: Building on February's network abstraction work (PR #355), March added single-chain deployment capability.

**The Business Need**: Some deployments target specific Antelope chains rather than serving as multi-chain explorers. Single-chain mode provides focused user experience for chain-specific use cases while maintaining code reusability.

**The Solution**: Implement deployment configuration allowing Unicove to operate in single-chain mode:
- Configuration-based chain selection (not code changes)
- Removes chain selection UI elements when in single-chain mode
- Focuses entire interface on single network
- Simplifies user experience for dedicated deployments
- Maintains full multi-chain flexibility through environment configuration

**Work Completed**:
- PR #398: Single chain - https://github.com/greymass/unicove/pull/398

**Technical Impact**: Provides deployment flexibility through configuration rather than code forks. Single codebase serves both multi-chain and single-chain deployments based on environment variables. Builds on February's network abstraction architecture (see [February 2025 Network Abstraction](../2025-02/technical.md#network-abstraction-architecture)).

**Use Cases**:
- Dedicated block explorers for specific chains
- Embedded explorers for chain-specific applications
- Simplified interface when multi-chain support unnecessary
- White-label deployments for individual blockchains

**Links**:
- https://github.com/greymass/unicove/pull/398

---

### Android Authentication Compatibility Fixes

**Context**: Intensive work fixing authentication and key generation issues on Android 10 (API 29) and older devices.

**The Problem**: Anchor Android assumed all devices supported strong biometric authentication (Class 3 biometrics), but Android 10 and below lack required authentication methods. Default account settings enabled biometry without checking device capabilities, causing systematic crashes during key generation.

**The Technical Challenge**: 
- Default `AccountSettingsState` used `useBiometry=true` and `usePin=true`
- Android 10 (API 29) and below don't support `AccessControl.BIOMETRY_ANY_OR_DEVICE_PASSCODE`
- Async capability checking (`isBiometrySupported()`) not properly implemented
- Key generation attempted using unsupported authentication methods
- No graceful degradation to supported authentication methods

**The Solution**: Implement comprehensive device capability detection:
- Check device authentication support before key generation
- Properly handle async capability checking
- Adjust account settings based on actual device capabilities
- Gracefully degrade to supported authentication methods on older devices
- Validate authentication methods before attempting key operations

**Work Completed**:
- PR #725: Generate key by AccountSettingsState with device authentication checking - https://github.com/greymass/anchor-mobile-android/pull/725
- PR #726: fix throwOnUnsupportedAuth check when genreateKey - https://github.com/greymass/anchor-mobile-android/pull/726
- PR #719: fix authenticator combination is unsupported on API 29 - https://github.com/greymass/anchor-mobile-android/pull/719

**Technical Impact**: Resolves systematic crashes on Android 10 and below by properly validating device authentication capabilities before key generation. Improves app compatibility across Android ecosystem, particularly important for users in regions with older devices.

**Technical Context**: Android's strong biometric authentication (Class 3 biometrics) not available until Android 11 (API 30). Applications must detect capabilities and adapt authentication requirements accordingly. See [glossary: WebAuthn](../glossary.md#webauthn-web-authentication-api) for related security concepts.

**Links**:
- https://github.com/greymass/anchor-mobile-android/pull/725
- https://github.com/greymass/anchor-mobile-android/pull/726
- https://github.com/greymass/anchor-mobile-android/pull/719

---

### Production Error Tracking with Firebase Crashlytics

**Context**: Added Firebase Crashlytics integration to Anchor Android for production crash tracking and debugging.

**The Business Need**: Production crashes are difficult to debug without proper error tracking. Stack traces from production builds are obfuscated (ProGuard) and minified (React Native), making root cause identification nearly impossible without source mapping.

**The Solution**: Integrate Firebase Crashlytics with comprehensive source mapping:
- **React Native Source Maps** (`index.android.bundle.map`): Maps minified JavaScript code back to original React Native code
- **ProGuard Mapping** (`mapping.txt`): Maps obfuscated native Java/Kotlin code back to original source
- **Automatic Crash Reporting**: Crashlytics automatically collects and reports crashes from production
- **Deobfuscated Stack Traces**: Full debugging context with readable stack traces

**Work Completed**:
- PR #716: add crashlytics - https://github.com/greymass/anchor-mobile-android/pull/716

**Technical Impact**: 
- **Visibility**: Complete visibility into production crashes with readable stack traces
- **Proactive Debugging**: Identify and fix crashes before users report them
- **Data-Driven**: Prioritize stability work based on actual crash frequency
- **Quality**: Maintain app quality at scale with real-world usage data

**Operational Requirements**: Build process must save and upload both source map files after each production build to enable proper stack trace deobfuscation.

**Links**:
- https://github.com/greymass/anchor-mobile-android/pull/716

---

### Web Authenticator Plugin Architecture

**Context**: Web Authenticator refactored transaction signing from monolithic implementation to plugin-based architecture.

**The Challenge**: Monolithic signing logic in core application made it difficult to:
- Add new signing methods
- Test signing functionality in isolation
- Maintain and extend signing capabilities
- Integrate with WharfKit's plugin ecosystem

**The Solution**: Move transaction signing into plugin architecture:
- Separate signing concerns from core application logic
- Enable modular signing method implementations
- Align with [WharfKit](../glossary.md#wharfkit) plugin-based architecture
- Improve extensibility for future signing methods
- Better testability through isolated plugin testing

**Work Completed**:
- PR #13: Moving signing logic to plugins - https://github.com/greymass/web-authenticator/pull/13

**Technical Impact**: 
- **Modularity**: Signing logic isolated in plugins, easier to maintain and test
- **Extensibility**: New signing methods can be added as plugins without core changes
- **Ecosystem Alignment**: Better integration with WharfKit plugin ecosystem
- **Code Quality**: Improved organization and testability

**Architecture Evolution**: Completes transition started with February's Cloudflare backend (see [February 2025 Web Authenticator](../2025-02/technical.md#greymass-web-authenticator)). Application now has modern plugin-based signing architecture deployed on Cloudflare edge.

**Links**:
- https://github.com/greymass/web-authenticator/pull/13

---

### Strategic Development Month

March demonstrated strategic development focus on enablement and modernization rather than major new features:

**Pattern**:
1. **Community Contribution Enablement**: Crowdin integration allows non-coders to contribute translations
2. **Modern Tooling**: Tailwind v4 keeps infrastructure current and performant
3. **Deployment Flexibility**: Single-chain mode provides configuration-based deployment options
4. **Intensive Maintenance**: 13 PRs in Anchor Android addressing stability and compatibility

**Characteristics**:
- No major new user-facing features
- Focus on infrastructure and enablement
- Heavy investment in quality and compatibility
- Removing barriers to community contribution (translations)
- Modernizing tooling (Tailwind v4)

**Strategic Value**: These "enablement months" don't produce immediate user-visible features but establish foundations for future capabilities. Crowdin integration enables community members without coding skills to contribute translations. Tailwind v4 provides modern, performant styling infrastructure. Android fixes improve reliability and compatibility.
