# Technical Glossary

**Purpose**: Central reference for technical concepts and terminology used across activity reports. Links to this glossary prevent repetitive explanations while maintaining clarity.

**Usage**: When writing technical reports, link to relevant glossary entries instead of re-explaining concepts.

---

## Table of Contents

- [Blockchain Technologies](#blockchain-technologies)
- [Security & Authentication](#security--authentication)
- [Software Architectures](#software-architectures)
- [Development Tools & Frameworks](#development-tools--frameworks)
- [Project-Specific Technologies](#project-specific-technologies)

---

## Blockchain Technologies

### Antelope

Antelope is an open-source blockchain framework (formerly EOSIO) that uses Delegated Proof of Stake (DPoS) consensus. It provides high throughput and flexibility for building decentralized applications. Notable blockchains using Antelope include EOS, WAX, Telos, and UX Network (formerly Ultra).

**Key Features**:
- DPoS consensus mechanism
- Resource model (RAM, CPU, NET)
- Smart contracts written in C++
- Human-readable account names (up to 12 characters)

**Related Projects**: EOS, WAX, Telos, UX Network

---

### DPoS (Delegated Proof of Stake)

Consensus mechanism where token holders vote for block producers (validators) who are responsible for validating transactions and producing blocks. Block producers are ranked by stake-weighted votes, and typically the top 21-30 producers actively produce blocks.

**Key Concepts**:
- Token holders vote for block producers
- Votes are weighted by staked tokens
- Block producers rotate to produce blocks
- Voters can change votes at any time

**Trade-offs**: Higher performance and scalability vs. more centralized than traditional PoS.

---

### Multisig (Multi-signature)

Blockchain accounts with multiple signature requirements for authorization. On Antelope chains, this is implemented through permission structures with thresholds and weighted keys/accounts.

**Example**: An account might require 2 out of 3 keys to approve a transaction, or 15 out of 21 block producers to approve a network-level change.

**Use Cases**:
- Treasury management (requires multiple approvers)
- Network governance (requires block producer consensus)
- Corporate accounts (requires board approval)
- Security (no single point of failure)

**Technical Details**: Implemented via eosio.msig system contract on Antelope chains.

---

### Smart Contracts

Self-executing code deployed on blockchain that runs when specific conditions are met. On Antelope chains, contracts are written in C++ and compiled to WebAssembly (WASM).

**Readonly Actions**: Smart contract actions that query data without modifying blockchain state. These can be executed without requiring transaction signing, making them ideal for API endpoints.

**Example Use**: The unicove-contracts repository provides readonly actions that consolidate multiple blockchain queries into single API calls.

---

### REX (Resource Exchange)

Antelope blockchain feature that allows token holders to lease unused CPU and NET resources to others in exchange for interest. Token holders lock their tokens in REX to earn interest from resource leasing fees.

**Benefits**:
- Token holders earn passive income
- Users can rent resources without buying tokens
- Improves network resource utilization

---

## Security & Authentication

### WebAuthn (Web Authentication API)

W3C web standard for secure authentication using public-key cryptography. Enables passwordless authentication using hardware security keys, fingerprint readers, or facial recognition.

**Security Model**:
- Private keys stored in device hardware (never transmitted)
- Public keys registered with service
- Challenges signed with private key to prove possession
- Resistant to phishing and credential theft

**Use in Projects**: Web Authenticator uses WebAuthn for secure key management while maintaining no-download, browser-based wallet functionality.

**Technical Details**:
- Based on FIDO2 standard
- Supports multiple authenticator types (platform, cross-platform)
- Keys are device-bound and non-exportable
- Works across browsers (Chrome, Firefox, Safari, Edge)

---

### BIP39 (Bitcoin Improvement Proposal 39)

Standard for generating mnemonic seed phrases (typically 12 or 24 words) that encode cryptographic keys. These human-readable phrases can be used to recover blockchain accounts.

**How it works**:
1. Generate random entropy
2. Convert to mnemonic words using standardized word list
3. Derive cryptographic keys from mnemonic using PBKDF2
4. Keys can be regenerated from mnemonic for recovery

**Use Case**: Account backup and recovery without storing raw private keys.

---

### Elliptic Curve Cryptography

#### secp256k1

Elliptic curve used by Bitcoin and many blockchain systems including Antelope. Provides 128-bit security with 256-bit keys.

**Properties**:
- Widely supported across blockchain ecosystems
- Well-audited and battle-tested
- Efficient signature generation and verification

#### secp256r1 (P-256)

NIST-standardized elliptic curve supported by hardware security modules and WebAuthn. Offers similar security to secp256k1 but with better hardware support.

**Advantage**: Native support in smartphone secure enclaves (iOS Secure Enclave, Android Keystore)

---

## Software Architectures

### Hybrid Client-Server Architecture

Architecture pattern that combines client-side and server-side functionality. Client handles sensitive operations (like key management) while server provides persistence, synchronization, and enhanced features.

**Example**: Web Authenticator maintains WebAuthn keys client-side (device-resident) while using backend database for account metadata, recovery, and cross-device access.

**Benefits**:
- Security of client-only architecture for sensitive data
- Convenience features enabled by server component
- Flexible deployment (can run client-only or with backend)

---

### Contract-based APIs

Pattern where smart contract readonly actions serve as API endpoints instead of relying solely on native blockchain RPC APIs. Applications query smart contracts to get processed, consolidated data.

**Advantages**:
- Consolidate multiple queries into single call
- Enable data processing not available in native APIs
- Contracts can be updated without node software changes
- Support dynamic configuration (like token rebrands)

**Example**: unicove-contracts provides account data, token balances, and network statistics through readonly smart contract actions.

---

### Edge Computing / Edge Deployment

Deploying application logic to servers geographically distributed near users (rather than centralized data centers). Cloudflare Workers/Pages run code in 250+ data centers worldwide.

**Benefits**:
- Lower latency (code runs near users)
- Better reliability (distributed, no single point of failure)
- Automatic scaling
- DDoS protection

**Use Cases**: Lighthouse JS and Web Authenticator deploy to Cloudflare edge network for global low-latency access.

---

## Development Tools & Frameworks

### SvelteKit

Full-stack web framework built on Svelte. Provides server-side rendering, routing, API endpoints, and deployment adapters for various platforms.

**Key Features**:
- File-based routing
- Server-side rendering (SSR)
- Static site generation (SSG)
- API routes
- Adapters for deployment (Cloudflare, Vercel, Node, etc.)

**Projects Using**: Unicove, Web Authenticator, lighthouse-js

---

### Svelte 5 Runes

Svelte 5's new reactivity system based on "runes" (special functions marked with $). Replaces Svelte 4's store-based reactivity with fine-grained reactive primitives.

**Key Runes**:
- `$state` - reactive state
- `$derived` - computed values
- `$effect` - side effects
- `$props` - component properties

**Migration**: Requires refactoring from Svelte 4 stores to runes-based reactivity.

---

### Drizzle ORM

TypeScript-first ORM (Object-Relational Mapping) library for SQL databases. Provides type-safe database queries with full TypeScript inference.

**Features**:
- Type-safe queries
- Schema migrations
- Supports multiple databases (PostgreSQL, MySQL, SQLite)
- Lightweight compared to alternatives like Prisma

**Projects Using**: sentiment-api uses Drizzle for database operations.

---

### Cloudflare Workers

Serverless execution environment that runs JavaScript/TypeScript at Cloudflare's edge network. Code executes within milliseconds globally without cold starts.

**Use Cases**:
- API endpoints
- Dynamic content generation
- Edge computing
- Request transformation

**Projects Using**: Web Authenticator backend, sentiment-api, unicove-og-image-gen

---

### WharfKit

TypeScript SDK for building Antelope blockchain applications. Provides session management, wallet integrations, contract interactions, and transaction signing.

**Components**:
- Session Kit - Wallet connection and session management
- Contract Kit - Type-safe contract interactions
- Account Kit - Account management utilities
- Wallet Plugins - Integrations for various wallets (Anchor, Cloud Wallet, etc.)

**Projects Using**: Unicove, Web Authenticator, Anchor

**Repository**: https://github.com/wharfkit

---

### Bun

Fast JavaScript runtime and toolkit. Drop-in replacement for Node.js with significantly faster startup times and built-in bundler, test runner, and package manager.

**Features**:
- ~3x faster than Node.js for many operations
- Built-in TypeScript support
- Built-in bundler and transpiler
- npm-compatible package manager
- Built-in test runner

**Projects Using**: Various Greymass repositories use Bun for development

---

## Project-Specific Technologies

### Roborovski

Blockchain history indexing and API service that processes Antelope blockchain data and provides queryable APIs. Powers multiple services including multisig proposal indexing.

**Key Capabilities**:
- Real-time blockchain data indexing
- Filtered history queries
- Multisig proposal tracking
- High-performance API endpoints

**Projects Using**: msigs.io, Unicove (planned)

**Repository**: https://github.com/greymass/roborovski

---

### Lighthouse

Service that looks up Antelope accounts across multiple blockchain networks. Given an account name, it returns which chains that account exists on.

**Use Cases**:
- Account discovery during login
- Multi-chain account management
- Wallet account lookup

**Implementation**: lighthouse-js provides the API, migrated to SvelteKit for better performance and edge deployment.

---

### Wuchale

Internationalization (i18n) system used across Greymass projects. Provides translation management and multi-language support.

**Features**:
- Translation file management
- Dynamic locale switching
- Machine translation integration
- Translation validation

**Projects Using**: Unicove, Web Authenticator

---

### Unicove Components

Svelte-based UI component library providing Antelope blockchain-specific components. Design system and component library for building consistent blockchain UIs.

**Components Include**:
- Account displays
- Transaction viewers
- Resource management widgets
- Wallet connection flows
- Token balances

**Repository**: https://github.com/greymass/unicove-components

---

### Shipload

Space trading game built on Antelope blockchains where players compete to become the most successful trader. Players found trading companies, hire crew members, build ship fleets, and trade goods across a procedurally generated galaxy.

**Gameplay**:
- Buy low, sell high across planets
- Manage fleet of trading ships
- Compete for top trader rankings
- Dynamic economy and procedural maps

**Blockchain Integration**:
- Built on EOS blockchain
- Uses SCRAP token for player-to-player trading
- All game data stored on-chain
- Open game economy

**Website**: https://shiploadgame.com  
**SCRAP Token**: https://scrapload.io  
**Alpha Release**: July 2024

---

## Glossary Maintenance

This glossary should be updated when:
- New technologies are introduced in reports
- Technical concepts require repeated explanation
- Project-specific terminology emerges
- Architectural patterns become common across repositories

**To add a new entry**: Submit PR with new section following existing format (concept name, description, use cases, related projects/links).
