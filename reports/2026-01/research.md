# Research Data: January 2026

**Generated**: 2026-02-02 UTC
**Method**: Events API + REST API (fallback for PRs)
**Rate Limit Remaining**: 4879 core, 30 search

---

## Data Sources & References

**GitHub Organizations**:
- [greymass](https://github.com/greymass)
- [wharfkit](https://github.com/wharfkit)

---

## Summary Statistics

- **Greymass**: 8 PRs merged across 5 repositories + 31 commits to Roborovski (open source migration) + 26 commits to Unicove + 4 commits to go-eosio
- **Wharfkit**: 1 PR merged + 9 commits across 2 repositories
- **New Repositories**: 6 created (5 Greymass, 1 Wharfkit)
- **Publications**: 0 blog posts
- **Top Repositories by Activity**:
  - greymass/roborovski (31 commits - open source migration, streaming, API development)
  - greymass/unicove (26 commits in January - Roborovski v2 integration, sentiment voting, transfers page)
  - wharfkit/roborovski (5 commits - v2 client library rc3-rc5)
  - greymass/go-eosio (4 commits - ABI decoding fixes)

---

## Greymass Organization

### greymass/roborovski

**Repository**: https://github.com/greymass/roborovski
**Activity**: 31 commits to master
**Language**: Go
**License**: AGPL-3.0

**What is Roborovski**: A multi-service blockchain history indexing and query platform for Antelope chains. The system consists of three core services: **CoreIndex** (reads nodeos trace files and produces compressed sliced storage), **ActionIndex** (indexes account activity using Pebble LSM-trees for low-latency queries), and **TxIndex** (partitioned flat-file transaction ID lookups). Services communicate through a shared `corereader` library and support both REST API and legacy `/v1/history` endpoints.

**Context from December**: Roborovski v2 was being developed in the private robo2-temp migration workspace. In January, the codebase was open-sourced into a new public repository. V2 is still in development with release candidates being published; data format changes are still being addressed and some data inconsistencies remain.

**What's new in v2** (in development): Compared to v1, Roborovski v2 adds filtering by contract, action, and date ranges on activity queries. It deduplicates traces to avoid the repetition problems present in v1. It includes local streaming capabilities for providing real-time updates to other internal services (not exposed publicly). It also implements a new API pattern designed for ease of integration, which the wharfkit/roborovski TypeScript client library implements directly.

#### Open Source Migration (Jan 15)

The entire Roborovski codebase — all three core services, supporting libraries (corereader, serviceclient, abicache, compression, tracereader), and tooling — was migrated from the private robo2-temp repository to a new public greymass/roborovski repository on January 15, open-sourcing the project under the AGPL-3.0 license. This is the development build of v2, not a stable release — release candidates are ongoing (rc3-rc5 for the client library) and data inconsistencies from format changes are still being resolved.

- e63d543: Initial open source migration - [link](https://github.com/greymass/roborovski/commit/e63d543da986a4e0995d8cab8e042be1457b600b)
- 450575b: Fixed flaky test - [link](https://github.com/greymass/roborovski/commit/450575b3f4cdc516f6854e4b9e00c61bfcb67c25)
- d3b354a: Remove go.work from git - [link](https://github.com/greymass/roborovski/commit/d3b354a497de87d0700e2a59546294beff72a863)
- ec50371: Updating Makefile with new release helpers - [link](https://github.com/greymass/roborovski/commit/ec503714dcb3e9e84e3def063cdb9b42f73292c0)

#### Infrastructure & Observability (Jan 16-17)

- 0b9b4e4: Dedicated metrics listening interface on each service - [link](https://github.com/greymass/roborovski/commit/0b9b4e403eaac636d1c4dfef24f991715ad485bc)
- 4ab4837: Redirect to docs from homepage - [link](https://github.com/greymass/roborovski/commit/4ab4837ef684325989da0dbb7f79176c3eb31a24)
- c9c4d37: Better replay detection + minimized logging - [link](https://github.com/greymass/roborovski/commit/c9c4d379ff0367c411671975a5f322bdf69692e6)
- bf3cda6: Pebble v2 - [link](https://github.com/greymass/roborovski/commit/bf3cda69606417c5d6418f9e39659a2ad1049676)
- bf6aab7: Moved additional messages to debugging category - [link](https://github.com/greymass/roborovski/commit/bf6aab726b0be61829031bab22869e5d95f34f18)
- af32083: coreverify improvements (+ onblock checker) - [link](https://github.com/greymass/roborovski/commit/af32083077c1a4250692183557219d8c22500a64)
- 8d334f1: Passing batchsize - [link](https://github.com/greymass/roborovski/commit/8d334f154f8b6d1300a572251fba1b8e30bf648f)

#### Indexing & ABI Improvements (Jan 19-21)

- 6dd50e9: Capture `IsAuthorizer` on traces - [link](https://github.com/greymass/roborovski/commit/6dd50e9af71a8b27b10a696a6012ec1e70e16526)
- 3ab5407: ABI decoding fixes + tidy - [link](https://github.com/greymass/roborovski/commit/3ab54076011c9b3770763081b8feff0eba9b671b)
- d81a079: Corrected cursors when mixing next/prev navigation - [link](https://github.com/greymass/roborovski/commit/d81a0795b36a089150acf4812f16aa1121a9215e)
- c4421ee: Slice lazy loaders + logging cleanup - [link](https://github.com/greymass/roborovski/commit/c4421ee532080ddf23fb373adc1a35ff7df1699b)

#### Action Streaming System (Jan 21-28)

Continued refinement of the existing action streaming system as prototypes were being built on top of it. Work focused on implementation improvements, error handling hardening, and operational reliability.

- 6fc9f4c: Reworking actionstream implementation - [link](https://github.com/greymass/roborovski/commit/6fc9f4c7393f24f1877812fef7acaaab435c9083)
- c850268: Added --rebuild-abis and uses slices/streamer - [link](https://github.com/greymass/roborovski/commit/c850268b7ebc81ac99f39492937e49aca85975b3)
- f1a9fe2: Decode flag for actionstream - [link](https://github.com/greymass/roborovski/commit/f1a9fe27f973969900dfb814178a227fbcfa469f)
- ab3fa50: Decoding when requested - [link](https://github.com/greymass/roborovski/commit/ab3fa509ee5dbb7f355a01d5d68384fd2416935a)
- 62ec508: Retain action data to optimize streaming - [link](https://github.com/greymass/roborovski/commit/62ec508eeca4bf68360f2b33b4a2635989442117)
- bf982fa: Added keepalive for actionstream - [link](https://github.com/greymass/roborovski/commit/bf982fa4e782ce622b3f72ba608cb90c0fd4352b)
- f163cf3: Implementation of action streaming and error handling - [link](https://github.com/greymass/roborovski/commit/f163cf3cf4dee71772d53343b6f3ba295453de4b)
- 3824674: Add panic recovery and sync indexes before broadcasting via stream - [link](https://github.com/greymass/roborovski/commit/38246746b680f7750065e41101af5cf01b6256a3)
- 8f5adce: Add stream logging and compaction concurrency - [link](https://github.com/greymass/roborovski/commit/8f5adceae270a99db042de17542ab838419976a3)

#### API & Data Integrity (Jan 23-28)

- 577a175: Added new /log endpoint + refactored /activity - [link](https://github.com/greymass/roborovski/commit/577a175eab5004cc61534cfdd599d2d1e7cb8f91)
- 1c36a33: Perform CRC checks when reading from non-finalized slices - [link](https://github.com/greymass/roborovski/commit/1c36a334c0363cb08cabb5288d40d0847437b197)
- 33a5e8a: Add bounds checks and debugging - [link](https://github.com/greymass/roborovski/commit/33a5e8a7a8bb87a1afdc38a8e05ef7a90a675c83)
- dba241d: Fixed slice discovery - [link](https://github.com/greymass/roborovski/commit/dba241d191ab50dda5aa14a31ed625eecde8ad9d)
- 2202389: Better error handling for trace file reading - [link](https://github.com/greymass/roborovski/commit/2202389b7c68d2de35f1daee4713c6ecdc0591a9)
- d278c7d: Modified WAL key to fix multi-account indexing for actions - [link](https://github.com/greymass/roborovski/commit/d278c7db04ddaa3399024b72b95c23be91bafec1)

#### Tooling

- c3d854f: Inspect tool for trace files - [link](https://github.com/greymass/roborovski/commit/c3d854fc3bf96072ad92f2742ac4385572fe72a8)

---

### greymass/unicove

**Repository**: https://github.com/greymass/unicove
**Activity**: 3 PRs merged, 26 commits in January across multiple branches

**Context from December**: December added governance features (producer voting, proposals) and search plugin architecture. January continues with sentiment voting integration, Roborovski v2 integration, and a new transfers page.

#### PR #554: Msig Search

**Link**: https://github.com/greymass/unicove/pull/554
**Merged**: 2026-01-19

**Body Summary**: Major overhaul containing multiple feature tracks:

1. **Search System Refactored with Plugin Architecture**: Completely refactored from monolithic to modular plugin-based architecture. New feature: search now supports finding multisig proposals and sentiment topics by name. Added in-memory caching with TTL and stale-while-revalidate. Added error boundaries for better search error handling.

2. **Complete Overhaul of Multisig Proposals UI**: Redesigned account proposals section with three views (Created, Approvals, Timeline). Added feature flags for network support detection. New reusable components for proposal cards, filters, headers, and empty states. Added infinite scroll/pagination. Implemented status filtering (proposed, executed, cancelled, expired). Parallel data loading for improved performance.

3. **Additional Improvements**: Updated @wharfkit/resources to fix integer overflow issues. Fixed vote decay calculations and Int64 overflow in producer voting. Various bug fixes for navigation, page headers, and layout rendering.

#### PR #555: Account + MSIG Sentiment

**Link**: https://github.com/greymass/unicove/pull/555
**Merged**: 2026-01-19

**Body Summary**: Added sentiment voting support for accounts and multisig proposals. This extends the sentiment voting feature (which was previously topic-based) to work at the account and proposal level.

#### PR #546: Sentiment

**Link**: https://github.com/greymass/unicove/pull/546
**Merged**: 2026-01-19

**Body Summary**: Integration PR merging the sentiment voting feature stack into the dev branch. Brings together the msig search, account/MSIG sentiment, and related work.

#### Roborovski v2 Integration (robo2 branch, Jan 20-22)

Significant work integrating the new Roborovski v2 API into Unicove:

- b9128e0: Initial v2 implementation - [link](https://github.com/greymass/unicove/commit/b9128e088a01fe049c3fe9a0aa2f7b01860cf40c)
- 894a020: Fallback to v1 - [link](https://github.com/greymass/unicove/commit/894a0200cd0fa5c6841b1db1688a85b99692948a)
- bae25e9: Added useLocale - [link](https://github.com/greymass/unicove/commit/bae25e91304cacbb65005cfe0d9d0e799cae0f45)
- d9b4161: Testing Makefile adjustment for env overrides - [link](https://github.com/greymass/unicove/commit/d9b416102103f12867ff6926464ba34da50c0fb5)
- bd45f1a: Making fee optional - [link](https://github.com/greymass/unicove/commit/bd45f1afa014a7f60685008b4864e3d78b901478)
- 9e893cd: Swap to use Unicove select elements - [link](https://github.com/greymass/unicove/commit/9e893cdaeb2a0c5439f8fca347f5b2be4996f723)
- c12818d: Style updates - [link](https://github.com/greymass/unicove/commit/c12818d2efebc45ff5b3ca56f3cf7abbf841a8db)
- c8ff682: Removed EOS from Coinbase config - [link](https://github.com/greymass/unicove/commit/c8ff6825808b3bda0fedd058faf283a9002ae141)
- 393eb43: Transfers page - [link](https://github.com/greymass/unicove/commit/393eb430f1db55dd2a9f4f8b1a33144fabaf1ac3)
- c7c07c4: Fixing default/legacy token load + padding - [link](https://github.com/greymass/unicove/commit/c7c07c46038e58c93629d2c648fb7a231c019095)

**Notable**: The Roborovski v2 integration includes a v1 fallback mechanism, ensuring graceful degradation. Also added a new transfers page and locale support.

#### Additional January Commits

**Sentiment & Wuchale Integration (Jan 19)**:
- e2521ed: Fixing optional fields - [link](https://github.com/greymass/unicove/commit/e2521ed073dfa9c757d1441de1ffc9c2ca3c7ff0)
- 68576ce: Disabling msig voting temporarily - [link](https://github.com/greymass/unicove/commit/68576ceaa0cd02e990eeefff8668f6159fc05f0c)
- 46e7fab: Wuchale cleanup - [link](https://github.com/greymass/unicove/commit/46e7fab8ff5f28cdac18829b0e2c1837bcc29d6b)
- 29bf257: Wuchale updates - [link](https://github.com/greymass/unicove/commit/29bf25780391476a792cd149b65867f82fd9ca4c)
- 5dd9d47: Fixed API - [link](https://github.com/greymass/unicove/commit/5dd9d47797ff481f8754f6de5f8409febd3bf67a)
- 3bb05b2: Wuchale - [link](https://github.com/greymass/unicove/commit/3bb05b2d2d8a3c541cc8db0ccca11fef53edd80f)

**Maintenance (Jan 30)**:
- b511208: Fixing permission edit links - [link](https://github.com/greymass/unicove/commit/b511208a51c0ba4f29e038748986c1272dce0e34)
- 6b78179: Formatting - [link](https://github.com/greymass/unicove/commit/6b7817932b027916d7b05983fefb0c701e208a4d)

---

### greymass/go-eosio

**Repository**: https://github.com/greymass/go-eosio
**Activity**: 4 commits to master

**Work Summary**: Bug fixes for ABI decoding in the Go library that underpins Roborovski's `abicache` system. Roborovski relies on go-eosio for historical ABI decoding — parsing contract ABIs at the correct block height to decode action data. These fixes addressed edge cases in extension field handling and name parsing that would cause decoding failures on certain on-chain data.

- 798e288 (Jan 6): Fix extension field decoding for ABI 1.0 - [link](https://github.com/greymass/go-eosio/commit/798e288b7c797d272f388ff82b556f690d174871)
- 8e882f9 (Jan 7): Catch corrupted ABI - [link](https://github.com/greymass/go-eosio/commit/8e882f92272250bcc76db18216604c925fa4f07a)
- 2c0237f (Jan 20): Fixing binary extension decoding - [link](https://github.com/greymass/go-eosio/commit/2c0237f72d1c91ea4dd30d242ea8a7d9d4b017a3)
- f673152 (Jan 20): Fixed panic with single character names - [link](https://github.com/greymass/go-eosio/commit/f67315251bde058dc90ef652dc32b0b5ed45c49c)

---

### greymass/anchor-mobile-android

**Repository**: https://github.com/greymass/anchor-mobile-android
**Activity**: 1 PR merged

#### PR #775: Mnemonics Seeds Followup

**Link**: https://github.com/greymass/anchor-mobile-android/pull/775
**Merged**: 2026-01-17

**Body Summary**: Follow-up work on mnemonic seed backup functionality for Anchor Mobile on Android. Continues the backup system improvements from December's Web Authenticator work.

---

### greymass/anchor-mobile-ios

**Repository**: https://github.com/greymass/anchor-mobile-ios
**Activity**: 1 PR merged

#### PR #88: Mnemonics Seeds Followup

**Link**: https://github.com/greymass/anchor-mobile-ios/pull/88
**Merged**: 2026-01-17

**Body Summary**: Follow-up work on mnemonic seed backup functionality for Anchor Mobile on iOS. Same mnemonic seeds work as the Android counterpart (PR #775), merged on the same day.

---

### greymass/website

**Repository**: https://github.com/greymass/website
**Activity**: 2 PRs merged

#### Minor PRs

- **#90**: style: update heading font - Updated heading font to Inter ([link](https://github.com/greymass/website/pull/90))
- **#91**: Release - Production release deploying the font update ([link](https://github.com/greymass/website/pull/91))

---

### greymass/statindex-ui-prototype

**Repository**: https://github.com/greymass/statindex-ui-prototype
**Activity**: 1 PR merged

#### PR #1: Dev

**Link**: https://github.com/greymass/statindex-ui-prototype/pull/1
**Merged**: 2026-01-22

**Body Summary**: Initial development merge for statindex UI prototype. This is a Svelte-based UI deployed to Cloudflare Pages (https://statindex-ui-prototype.pages.dev) used to test Roborovski's action streaming integrations.

---

## Wharfkit Organization

### wharfkit/roborovski

**Repository**: https://github.com/wharfkit/roborovski
**Branch**: https://github.com/wharfkit/roborovski/tree/v2
**Activity**: 5 commits on v2 branch

**Context**: This is the TypeScript client library that gives web applications access to the Roborovski v2 API (account activity queries, transaction lookups, etc.). V2 development reached rc1-rc2 in December. January continued with rc3-rc5, adding new query methods.

**Key Commits (Jan 14)**:
- b845fe8: Adding `activity()` and `transaction()` prototypes - [link](https://github.com/wharfkit/roborovski/commit/b845fe8321e5654e5979ffb7d46251576eb209da)
- 19dc6de: Fixing tests - [link](https://github.com/wharfkit/roborovski/commit/19dc6de7e2219540146996ecc39e14c5fc0aa09f)
- 22b9c81: v2.0.0-rc3 - [link](https://github.com/wharfkit/roborovski/commit/22b9c8117242624ec4e34387c304f33bd70c687c)
- ec361b2: v2.0.0-rc4 - [link](https://github.com/wharfkit/roborovski/commit/ec361b2a55ca9ae441b73f675223fba56f2c997d)
- 1a96e3a: v2.0.0-rc5 - [link](https://github.com/wharfkit/roborovski/commit/1a96e3ad689a91254ff46e09223edc5f02f62226)

**Releases**: v2.0.0-rc3, v2.0.0-rc4, v2.0.0-rc5

**Notable**: Added `activity()` and `transaction()` methods, which map to the Roborovski v2 `/account/{name}/activity` and `/transaction/{txid}` endpoints respectively. These give TypeScript applications programmatic access to the same account history and transaction lookup capabilities that Roborovski provides server-side.

---
## New Repositories

### greymass/roborovski

**Created**: 2026-01-15
**Repository**: https://github.com/greymass/roborovski
**Purpose**: High-performance blockchain history infrastructure for Antelope networks
**Technology Stack**: Go, AGPL-3.0 license
**Initial Activity**: 31 commits in January

**README Summary**: Roborovski provides efficient block/transaction storage with sliced architecture, APIs for querying blockchain history, and a framework for building custom blockchain indexes. Includes build/test/verify targets via Makefile.

**Strategic Context**: This is the open-source release of the Roborovski v2 infrastructure. The migration to a public repository is a major milestone, making this infrastructure available to the broader Antelope ecosystem.

---

### greymass/vaulta

**Created**: 2026-01-15
**Repository**: https://github.com/greymass/vaulta
**Purpose**: Unknown (no README or description)
**Technology Stack**: Not specified

---

### greymass/statindex-ui-prototype

**Created**: 2026-01-18
**Repository**: https://github.com/greymass/statindex-ui-prototype
**Purpose**: Prototype for testing Roborovski action streaming integrations
**Technology Stack**: Svelte, deployed on Cloudflare Pages
**Live URL**: https://statindex-ui-prototype.pages.dev
**Initial Activity**: 1 PR merged

**Context**: Built to test and validate the Roborovski action streaming system. Directly related to the streaming refinement work happening in greymass/roborovski during the same period.

---

### greymass/buoy-cloudflare

**Created**: 2026-01-27
**Repository**: https://github.com/greymass/buoy-cloudflare
**Purpose**: Cloudflare-based implementation of the Buoy communication service
**Technology Stack**: TypeScript

**Context**: Buoy is the communication infrastructure used for wallet-to-dapp communication. This new repository appears to be a Cloudflare Workers-based implementation, complementing or replacing the existing buoy-nodejs implementation.

---

### wharfkit/skill

**Created**: 2026-01-23
**Repository**: https://github.com/wharfkit/skill
**Purpose**: Claude Code skill definition for WharfKit SDK development
**Technology Stack**: Markdown documentation

**README Summary**: A skill definition that teaches Claude Code (AI coding assistant) how to work with the WharfKit SDK for Antelope blockchain development. Provides Claude with knowledge of Session Kit, Contract Kit, Core Types, Signing Requests, Resources, and best practice patterns. Can be installed globally or per-project and activates automatically when WharfKit-related work is detected.

**Includes**: Entry point with package overview, plus reference documents for SessionKit, ContractKit, Antelope core types, patterns, signing requests, and resources.

---

## Publications

No blog posts were published during January 2026.

---

## For Downstream Agents

**Summary Writer** (`agents/summary.md`):
- Read this file for complete context
- Use source links for verification
- Focus on outcomes and business impact
- Reference github-projects.md for display names and descriptions
- Review December 2025 README.md for narrative continuity
- Key themes: Roborovski open-sourced (v2 still in development, not released), sentiment voting in Unicove, Roborovski v2 integration, new monitoring infrastructure
- No blog posts to cover this month

**Technical Writer** (`agents/technical.md`):
- Read this file for complete context
- Include PR numbers and links from here
- Cite sources when making technical claims
- Use discussion summaries for context
- Notable technical work: Roborovski open-source migration, action streaming system, ABI decoding fixes, Roborovski v2 client library, Cloud Wallet plugin changes

**Both agents**: Focus on the WORK and DISCUSSIONS documented here, not the individuals. This research emphasizes what was done and what was decided. Prior months' reports provide valuable context for ongoing projects and narrative flow.

**January 2026 Themes**:
1. **Roborovski Open-Sourced**: Codebase migrated from private robo2-temp to public greymass/roborovski under AGPL-3.0. V2 is still in development (release candidates, data inconsistencies being resolved), not a stable release.
2. **Action Streaming Hardening**: Continued refinement of Roborovski's action streaming system — error handling, keepalive, panic recovery — as the statindex-ui-prototype was built to test streaming integrations.
3. **Unicove Sentiment Voting**: Sentiment voting feature integrated into dev branch with support for accounts and multisig proposals.
4. **Unicove Roborovski v2 Integration**: Unicove began integrating the Roborovski v2 API with v1 fallback, plus new transfers page.
5. **Go-EOSIO Fixes**: ABI decoding fixes in the Go library underpinning Roborovski's abicache system.
6. **Monitoring Infrastructure**: New webmonitoring repository with Prometheus/Grafana stack for endpoint health monitoring.
7. **Buoy Cloudflare**: New Cloudflare-based implementation of the Buoy communication service.
8. **Cloud Wallet Plugin**: Updated for new Cloud Wallet interface, then reverted — not yet production-ready.
9. **WharfKit AI Skill**: Claude Code skill definition for WharfKit SDK development assistance.
10. **Mnemonic Seeds**: Continued backup system work on Anchor Mobile Android.
