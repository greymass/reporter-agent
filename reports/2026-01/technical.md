# Technical Activity Report
## January 2026

**Navigation**: [← Previous Month](../2025-12/technical.md) | [Next Month →](../2026-02/technical.md)

*Also available: [Executive Summary](README.md) | [Research Data](research.md)*

January 2026 centered on open-sourcing the Roborovski v2 codebase, migrated from the private robo2-temp workspace to a new public repository under the AGPL-3.0 license. Alongside this milestone, development continued across Roborovski's action streaming system, ABI decoding infrastructure, and API surface. Unicove integrated sentiment voting into its dev branch and began consuming the Roborovski v2 API with a v1 fallback mechanism.

**Key Achievements**:
- Open-sourced Roborovski v2 codebase from private robo2-temp to public greymass/roborovski under AGPL-3.0
- Hardened the action streaming system with keepalive, panic recovery, and compaction concurrency
- Integrated sentiment voting (accounts + multisig proposals) and search plugin refactor into Unicove dev branch
- Began Unicove integration with Roborovski v2 API including v1 fallback and new transfers page
- Advanced wharfkit/roborovski TypeScript client from rc2 to rc5 with new `activity()` and `transaction()` methods
- Fixed ABI decoding edge cases in go-eosio underpinning Roborovski's abicache

**Technical Significance**: The open-sourcing of Roborovski makes the v2 blockchain history infrastructure available to the broader Antelope ecosystem. While still in release candidate phase with data inconsistencies being resolved, the public repository enables external review and contribution. The coordinated work across greymass/roborovski, wharfkit/roborovski, greymass/go-eosio, and greymass/unicove demonstrates a full-stack progression from Go indexing services through TypeScript client library to end-user application integration.

---

## Table of Contents

- [Cross-Repository Insights](#cross-repository-insights)
- [Greymass Organization](#greymass-organization)
  - [greymass/roborovski](#greymassroborovski)
  - [greymass/unicove](#greymassunicove)
  - [greymass/go-eosio](#greymassgo-eosio)
  - [greymass/anchor-mobile-android](#greymassanchor-mobile-android)
  - [greymass/anchor-mobile-ios](#greymassanchor-mobile-ios)
  - [greymass/website](#greymasswebsite)
  - [greymass/statindex-ui-prototype](#greymassstatindex-ui-prototype)
- [Wharfkit Organization](#wharfkit-organization)
  - [wharfkit/roborovski](#wharfkitroborovski)
- [New Repositories](#new-repositories)

---

## Cross-Repository Insights

### Roborovski v2 Full-Stack Integration

**Repositories**: greymass/roborovski, wharfkit/roborovski, greymass/go-eosio, greymass/unicove, greymass/statindex-ui-prototype

**Previous Context**: See [December 2025](../2025-12/technical.md#roborovski-v2-full-stack-development) for robo2-temp and wharfkit/roborovski rc1-rc2 development.

January brought Roborovski v2 development out of the private robo2-temp workspace and into the public. The integration stack spans four layers:

1. **go-eosio** provided ABI decoding fixes for extension fields and name parsing that directly resolved decoding failures in Roborovski's abicache system
2. **greymass/roborovski** received the full open-source codebase migration on January 15, followed by action streaming hardening, API refinements (new `/log` endpoint, refactored `/activity`), and data integrity work (CRC checks, WAL key fixes for multi-account indexing)
3. **wharfkit/roborovski** advanced from rc2 to rc5, adding `activity()` and `transaction()` methods that map to the server-side `/account/{name}/activity` and `/transaction/{txid}` endpoints
4. **greymass/unicove** began consuming the v2 API on its robo2 branch with a v1 fallback mechanism, plus a new transfers page

The **statindex-ui-prototype** was created as a Svelte-based test harness for validating action streaming integrations during the same period streaming was being hardened in the main Roborovski repository.

---

## Greymass Organization

### greymass/roborovski

**Repository**: https://github.com/greymass/roborovski
**Activity**: 31 commits to master
**Previous Context**: See [December 2025](../2025-12/technical.md#greymassrobo2-temp) for robo2-temp development (slice indexing, canonical filtering, get_activity API)

#### Overview

The Roborovski v2 codebase was open-sourced on January 15, migrated from the private robo2-temp workspace to this new public repository. Post-migration work concentrated on four areas: infrastructure and observability, indexing and ABI improvements, action streaming hardening, and API and data integrity fixes. V2 remains in development with release candidates ongoing and data format inconsistencies still being resolved.

#### Open Source Migration (Jan 15)

The full codebase — CoreIndex, ActionIndex, TxIndex services, supporting libraries (corereader, serviceclient, abicache, compression, tracereader), and tooling — was published under the AGPL-3.0 license.

- [e63d543](https://github.com/greymass/roborovski/commit/e63d543da986a4e0995d8cab8e042be1457b600b): Initial open source migration
- [450575b](https://github.com/greymass/roborovski/commit/450575b3f4cdc516f6854e4b9e00c61bfcb67c25): Fixed flaky test
- [d3b354a](https://github.com/greymass/roborovski/commit/d3b354a497de87d0700e2a59546294beff72a863): Remove go.work from git
- [ec50371](https://github.com/greymass/roborovski/commit/ec503714dcb3e9e84e3def063cdb9b42f73292c0): Makefile updates with release helpers

#### Infrastructure & Observability (Jan 16-17)

- [0b9b4e4](https://github.com/greymass/roborovski/commit/0b9b4e403eaac636d1c4dfef24f991715ad485bc): Dedicated metrics listening interface on each service
- [4ab4837](https://github.com/greymass/roborovski/commit/4ab4837ef684325989da0dbb7f79176c3eb31a24): Redirect to docs from homepage
- [c9c4d37](https://github.com/greymass/roborovski/commit/c9c4d379ff0367c411671975a5f322bdf69692e6): Improved replay detection with minimized logging
- [bf3cda6](https://github.com/greymass/roborovski/commit/bf3cda69606417c5d6418f9e39659a2ad1049676): Upgraded to Pebble v2
- [bf6aab7](https://github.com/greymass/roborovski/commit/bf6aab726b0be61829031bab22869e5d95f34f18): Moved additional messages to debug logging category
- [af32083](https://github.com/greymass/roborovski/commit/af32083077c1a4250692183557219d8c22500a64): coreverify improvements including onblock checker
- [8d334f1](https://github.com/greymass/roborovski/commit/8d334f154f8b6d1300a572251fba1b8e30bf648f): Passing batchsize parameter

#### Indexing & ABI Improvements (Jan 19-21)

- [6dd50e9](https://github.com/greymass/roborovski/commit/6dd50e9af71a8b27b10a696a6012ec1e70e16526): Capture `IsAuthorizer` on traces
- [3ab5407](https://github.com/greymass/roborovski/commit/3ab54076011c9b3770763081b8feff0eba9b671b): ABI decoding fixes and code cleanup
- [d81a079](https://github.com/greymass/roborovski/commit/d81a0795b36a089150acf4812f16aa1121a9215e): Corrected cursors when mixing next/prev navigation
- [c4421ee](https://github.com/greymass/roborovski/commit/c4421ee532080ddf23fb373adc1a35ff7df1699b): Slice lazy loaders with logging cleanup

#### Action Streaming System (Jan 21-28)

Continued refinement of the existing action streaming system as prototypes were being built on top of it. Work focused on implementation improvements, error handling hardening, and operational reliability.

- [6fc9f4c](https://github.com/greymass/roborovski/commit/6fc9f4c7393f24f1877812fef7acaaab435c9083): Reworked actionstream implementation
- [c850268](https://github.com/greymass/roborovski/commit/c850268b7ebc81ac99f39492937e49aca85975b3): Added `--rebuild-abis` flag; uses slices/streamer
- [f1a9fe2](https://github.com/greymass/roborovski/commit/f1a9fe27f973969900dfb814178a227fbcfa469f): Decode flag for actionstream
- [ab3fa50](https://github.com/greymass/roborovski/commit/ab3fa509ee5dbb7f355a01d5d68384fd2416935a): Decoding on request
- [62ec508](https://github.com/greymass/roborovski/commit/62ec508eeca4bf68360f2b33b4a2635989442117): Retain action data to optimize streaming throughput
- [bf982fa](https://github.com/greymass/roborovski/commit/bf982fa4e782ce622b3f72ba608cb90c0fd4352b): Added keepalive for actionstream connections
- [f163cf3](https://github.com/greymass/roborovski/commit/f163cf3cf4dee71772d53343b6f3ba295453de4b): Implementation of action streaming and error handling
- [3824674](https://github.com/greymass/roborovski/commit/38246746b680f7750065e41101af5cf01b6256a3): Panic recovery and sync indexes before broadcasting via stream
- [8f5adce](https://github.com/greymass/roborovski/commit/8f5adceae270a99db042de17542ab838419976a3): Stream logging and compaction concurrency

#### API & Data Integrity (Jan 23-28)

- [577a175](https://github.com/greymass/roborovski/commit/577a175eab5004cc61534cfdd599d2d1e7cb8f91): Added new `/log` endpoint and refactored `/activity`
- [1c36a33](https://github.com/greymass/roborovski/commit/1c36a334c0363cb08cabb5288d40d0847437b197): CRC checks when reading from non-finalized slices
- [33a5e8a](https://github.com/greymass/roborovski/commit/33a5e8a7a8bb87a1afdc38a8e05ef7a90a675c83): Bounds checks and debugging
- [dba241d](https://github.com/greymass/roborovski/commit/dba241d191ab50dda5aa14a31ed625eecde8ad9d): Fixed slice discovery
- [2202389](https://github.com/greymass/roborovski/commit/2202389b7c68d2de35f1daee4713c6ecdc0591a9): Improved error handling for trace file reading
- [d278c7d](https://github.com/greymass/roborovski/commit/d278c7db04ddaa3399024b72b95c23be91bafec1): Modified WAL key to fix multi-account indexing for actions

#### Tooling

- [c3d854f](https://github.com/greymass/roborovski/commit/c3d854fc3bf96072ad92f2742ac4385572fe72a8): Inspect tool for trace files

---

### greymass/unicove

**Repository**: https://github.com/greymass/unicove
**Activity**: 3 PRs merged, 26 commits
**Previous Context**: See [December 2025](../2025-12/technical.md#greymassunicove) for governance features (producer voting, proposals) and search plugin architecture
**Related Work**: See [greymass/roborovski](#greymassroborovski), [wharfkit/roborovski](#wharfkitroborovski)

#### Overview

January delivered two parallel tracks: integrating the sentiment voting feature stack into the dev branch, and beginning Roborovski v2 API integration on a separate branch. The sentiment work brought account-level and proposal-level sentiment voting into Unicove alongside a refactored search plugin system. The Roborovski v2 integration introduced a v1 fallback mechanism and a new transfers page.

#### Pull Requests

##### Major Changes

**#554 - Msig Search** ([link](https://github.com/greymass/unicove/pull/554))
*Merged: 2026-01-19*

**Description**: Major overhaul containing multiple feature tracks:

1. **Search System Refactored with Plugin Architecture**: Migrated from monolithic to modular plugin-based search. Added multisig proposal and sentiment topic search by name. Implemented in-memory caching with TTL and stale-while-revalidate. Added error boundaries for search failures.

2. **Multisig Proposals UI Overhaul**: Redesigned account proposals section with three views (Created, Approvals, Timeline). Added feature flags for network support detection. New reusable components for proposal cards, filters, headers, and empty states. Infinite scroll/pagination. Status filtering (proposed, executed, cancelled, expired). Parallel data loading.

3. **Dependency and Bug Fixes**: Updated @wharfkit/resources to fix integer overflow issues. Fixed vote decay calculations and Int64 overflow in producer voting. Various navigation, page header, and layout rendering fixes.

---

**#555 - Account + MSIG Sentiment** ([link](https://github.com/greymass/unicove/pull/555))
*Merged: 2026-01-19*

**Description**: Extended sentiment voting from topic-based to account-level and multisig proposal-level. Accounts and proposals can now receive sentiment votes alongside the existing topic-based system.

---

**#546 - Sentiment** ([link](https://github.com/greymass/unicove/pull/546))
*Merged: 2026-01-19*

**Description**: Integration PR merging the full sentiment voting feature stack (msig search, account/MSIG sentiment, and related work) into the dev branch.

#### Roborovski v2 Integration (robo2 branch, Jan 20-22)

Work on a separate branch integrating the Roborovski v2 API into Unicove, including a v1 fallback mechanism for graceful degradation:

- [b9128e0](https://github.com/greymass/unicove/commit/b9128e088a01fe049c3fe9a0aa2f7b01860cf40c): Initial v2 implementation
- [894a020](https://github.com/greymass/unicove/commit/894a0200cd0fa5c6841b1db1688a85b99692948a): Fallback to v1
- [bae25e9](https://github.com/greymass/unicove/commit/bae25e91304cacbb65005cfe0d9d0e799cae0f45): Added useLocale
- [d9b4161](https://github.com/greymass/unicove/commit/d9b416102103f12867ff6926464ba34da50c0fb5): Testing Makefile adjustment for env overrides
- [bd45f1a](https://github.com/greymass/unicove/commit/bd45f1afa014a7f60685008b4864e3d78b901478): Making fee optional
- [9e893cd](https://github.com/greymass/unicove/commit/9e893cdaeb2a0c5439f8fca347f5b2be4996f723): Swap to use Unicove select elements
- [c12818d](https://github.com/greymass/unicove/commit/c12818d2efebc45ff5b3ca56f3cf7abbf841a8db): Style updates
- [c8ff682](https://github.com/greymass/unicove/commit/c8ff6825808b3bda0fedd058faf283a9002ae141): Removed EOS from Coinbase config
- [393eb43](https://github.com/greymass/unicove/commit/393eb430f1db55dd2a9f4f8b1a33144fabaf1ac3): Transfers page
- [c7c07c4](https://github.com/greymass/unicove/commit/c7c07c46038e58c93629d2c648fb7a231c019095): Fixing default/legacy token load and padding

#### Additional Commits

**Sentiment & Wuchale Integration (Jan 19)**:
- [e2521ed](https://github.com/greymass/unicove/commit/e2521ed073dfa9c757d1441de1ffc9c2ca3c7ff0): Fixing optional fields
- [68576ce](https://github.com/greymass/unicove/commit/68576ceaa0cd02e990eeefff8668f6159fc05f0c): Disabling msig voting temporarily
- [46e7fab](https://github.com/greymass/unicove/commit/46e7fab8ff5f28cdac18829b0e2c1837bcc29d6b): Wuchale cleanup
- [29bf257](https://github.com/greymass/unicove/commit/29bf25780391476a792cd149b65867f82fd9ca4c): Wuchale updates
- [5dd9d47](https://github.com/greymass/unicove/commit/5dd9d47797ff481f8754f6de5f8409febd3bf67a): Fixed API
- [3bb05b2](https://github.com/greymass/unicove/commit/3bb05b2d2d8a3c541cc8db0ccca11fef53edd80f): Wuchale integration

**Maintenance (Jan 30)**:
- [b511208](https://github.com/greymass/unicove/commit/b511208a51c0ba4f29e038748986c1272dce0e34): Fixing permission edit links
- [6b78179](https://github.com/greymass/unicove/commit/6b7817932b027916d7b05983fefb0c701e208a4d): Formatting

---

### greymass/go-eosio

**Repository**: https://github.com/greymass/go-eosio
**Activity**: 4 commits to master
**Related Work**: See [greymass/roborovski](#greymassroborovski)

#### Overview

Bug fixes for ABI decoding in the Go library that underpins Roborovski's abicache system. Roborovski relies on go-eosio for historical ABI decoding -- parsing contract ABIs at the correct block height to decode action data. These fixes addressed edge cases in extension field handling and name parsing that caused decoding failures on certain on-chain data.

#### Commits

- [798e288](https://github.com/greymass/go-eosio/commit/798e288b7c797d272f388ff82b556f690d174871) (Jan 6): Fix extension field decoding for ABI 1.0
- [8e882f9](https://github.com/greymass/go-eosio/commit/8e882f92272250bcc76db18216604c925fa4f07a) (Jan 7): Catch corrupted ABI
- [2c0237f](https://github.com/greymass/go-eosio/commit/2c0237f72d1c91ea4dd30d242ea8a7d9d4b017a3) (Jan 20): Fixing binary extension decoding
- [f673152](https://github.com/greymass/go-eosio/commit/f67315251bde058dc90ef652dc32b0b5ed45c49c) (Jan 20): Fixed panic with single character names

---

### greymass/anchor-mobile-android

**Repository**: https://github.com/greymass/anchor-mobile-android
**Activity**: 1 PR merged

#### Pull Requests

**#775 - Mnemonics Seeds Followup** ([link](https://github.com/greymass/anchor-mobile-android/pull/775))
*Merged: 2026-01-17*

**Description**: Follow-up work on mnemonic seed backup functionality for Anchor Mobile on Android. Continues the backup system improvements from December's Web Authenticator work.

---

### greymass/anchor-mobile-ios

**Repository**: https://github.com/greymass/anchor-mobile-ios
**Activity**: 1 PR merged

#### Pull Requests

**#88 - Mnemonics Seeds Followup** ([link](https://github.com/greymass/anchor-mobile-ios/pull/88))
*Merged: 2026-01-17*

**Description**: Follow-up work on mnemonic seed backup functionality for Anchor Mobile on iOS. Same mnemonic seeds work as the Android counterpart (PR #775), merged on the same day.

---

### greymass/website

**Repository**: https://github.com/greymass/website
**Activity**: 2 PRs merged

#### Minor Changes

- **#90**: style: update heading font ([link](https://github.com/greymass/website/pull/90)) - Updated heading font to Inter
- **#91**: Release ([link](https://github.com/greymass/website/pull/91)) - Production release deploying the font update

---

### greymass/statindex-ui-prototype

**Repository**: https://github.com/greymass/statindex-ui-prototype
**Activity**: 1 PR merged
**Related Work**: See [greymass/roborovski](#greymassroborovski)

#### Overview

Svelte-based UI prototype deployed to Cloudflare Pages, created to test and validate Roborovski's action streaming integrations. Built concurrently with the streaming hardening work in greymass/roborovski.

#### Pull Requests

**#1 - Dev** ([link](https://github.com/greymass/statindex-ui-prototype/pull/1))
*Merged: 2026-01-22*

**Description**: Initial development merge establishing the streaming test harness. Deployed at https://statindex-ui-prototype.pages.dev.

---

## Wharfkit Organization

### wharfkit/roborovski

**Repository**: https://github.com/wharfkit/roborovski
**Branch**: https://github.com/wharfkit/roborovski/tree/v2
**Activity**: 5 commits on v2 branch
**Previous Context**: See [December 2025](../2025-12/technical.md#wharfkitroborovski) for rc1-rc2 and get_activity client implementation
**Related Work**: See [greymass/roborovski](#greymassroborovski)

#### Overview

The TypeScript client library for Roborovski v2 advanced from rc2 to rc5. New `activity()` and `transaction()` methods were added, mapping to the server-side `/account/{name}/activity` and `/transaction/{txid}` endpoints respectively. These provide TypeScript applications programmatic access to account history and transaction lookup capabilities.

#### Key Commits (Jan 14)

- [b845fe8](https://github.com/wharfkit/roborovski/commit/b845fe8321e5654e5979ffb7d46251576eb209da): Adding `activity()` and `transaction()` prototypes
- [19dc6de](https://github.com/wharfkit/roborovski/commit/19dc6de7e2219540146996ecc39e14c5fc0aa09f): Fixing tests
- [22b9c81](https://github.com/wharfkit/roborovski/commit/22b9c8117242624ec4e34387c304f33bd70c687c): v2.0.0-rc3
- [ec361b2](https://github.com/wharfkit/roborovski/commit/ec361b2a55ca9ae441b73f675223fba56f2c997d): v2.0.0-rc4
- [1a96e3a](https://github.com/wharfkit/roborovski/commit/1a96e3ad689a91254ff46e09223edc5f02f62226): v2.0.0-rc5

**Releases**: v2.0.0-rc3, v2.0.0-rc4, v2.0.0-rc5

---

## New Repositories

### greymass/roborovski

**Created**: 2026-01-15
**Repository**: https://github.com/greymass/roborovski
**Purpose**: Open-source release of Roborovski v2 blockchain history infrastructure for Antelope networks
**Technology Stack**: Go, AGPL-3.0 license
**Initial Activity**: 31 commits in January

**Description**: Multi-service platform consisting of CoreIndex (compressed sliced storage from nodeos trace files), ActionIndex (Pebble LSM-tree account activity indexing), and TxIndex (partitioned flat-file transaction ID lookups). Provides REST API and legacy `/v1/history` endpoints. Migrated from the private robo2-temp development workspace.

See [greymass/roborovski](#greymassroborovski) above for full January activity.

---

### greymass/statindex-ui-prototype

**Created**: 2026-01-18
**Repository**: https://github.com/greymass/statindex-ui-prototype
**Purpose**: Prototype for testing Roborovski action streaming integrations
**Technology Stack**: Svelte, deployed on Cloudflare Pages
**Initial Activity**: 1 PR merged

**Live URL**: https://statindex-ui-prototype.pages.dev

---

### greymass/vaulta

**Created**: 2026-01-15
**Repository**: https://github.com/greymass/vaulta
**Purpose**: Unknown (no README or description at time of creation)
**Technology Stack**: Not specified

---

### greymass/buoy-cloudflare

**Created**: 2026-01-27
**Repository**: https://github.com/greymass/buoy-cloudflare
**Purpose**: Cloudflare Workers-based implementation of the Buoy communication service used for wallet-to-dapp communication
**Technology Stack**: TypeScript

---

### wharfkit/skill

**Created**: 2026-01-23
**Repository**: https://github.com/wharfkit/skill
**Purpose**: Claude Code skill definition for WharfKit SDK development assistance
**Technology Stack**: Markdown documentation

**Description**: Provides Claude Code with structured knowledge of Session Kit, Contract Kit, Core Types, Signing Requests, Resources, and best practice patterns for Antelope blockchain development with WharfKit. Includes reference documents and activates automatically when WharfKit-related work is detected.
