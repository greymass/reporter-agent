# GitHub Projects Reference

This file provides comprehensive information about repositories across Greymass, Wharfkit, and related organizations. Agents can reference this for human-friendly names, descriptions, purposes, URLs, and status information.

---

## Greymass Organization

**URL**: https://github.com/greymass

### Wallets & User-Facing Products

#### unicove
- **Name**: Unicove
- **URL**: https://github.com/greymass/unicove
- **Visibility**: Public
- **Website**: https://unicove.com
- **Purpose**: Block explorer and web wallet interface for Antelope blockchains
- **Description**: Modern block explorer and web-based wallet interface featuring sentiment voting, multisig support, and seamless onboarding
- **Status**: Active development
- **Key Features**: Block explorer, web wallet, sentiment voting, multisig proposals, account creation, transaction signing

#### web-authenticator
- **Name**: Web Authenticator
- **URL**: https://github.com/greymass/web-authenticator
- **Visibility**: Private
- **Purpose**: No-download web-based non-custodial "cloud wallet"
- **Description**: Allows users to onboard and create a free account in 1-2 minutes without downloads. Can be used from any dapp through Wharf for onboarding and transaction signing
- **Status**: Active development
- **Key Features**: WebAuthn support, Wharf integration, quick onboarding, transaction signing

#### anchor
- **Name**: Anchor Desktop Wallet
- **URL**: https://github.com/greymass/anchor
- **Purpose**: Desktop wallet for Antelope blockchains
- **Description**: Full-featured desktop wallet with hardware wallet support, resource management, and multi-chain capabilities
- **Status**: Deprecated

#### anchor-mobile-ios
- **Name**: Anchor Mobile (iOS)
- **URL**: https://github.com/greymass/anchor-mobile-ios
- **Purpose**: iOS mobile wallet
- **Description**: Native iOS wallet for Antelope blockchains
- **Status**: Maintenance

#### anchor-mobile-android
- **Name**: Anchor Mobile (Android)
- **URL**: https://github.com/greymass/anchor-mobile-android
- **Purpose**: Android mobile wallet
- **Description**: Native Android wallet for Antelope blockchains
- **Status**: Maintenance

#### anchor-link
- **Name**: Anchor Link Protocol
- **URL**: https://github.com/greymass/anchor-link
- **Purpose**: Communication protocol for Anchor wallet
- **Description**: Protocol enabling dapps to communicate with Anchor wallet
- **Status**: Deprecated

### Services & Infrastructure

#### roborovski
- **Name**: Roborovski
- **URL**: https://github.com/greymass/roborovski
- **Visibility**: Private
- **Purpose**: Advanced blockchain history indexing and API service
- **Description**: High-performance history solution providing blockchain data indexing with specialized services including multisig proposal indexing (powers msigs.io) and filtered history responses (for Unicove and dapps)
- **Status**: Active development
- **Key Features**: Multisig indexing API, filtered history responses, multi-tier caching, WebAuthn support

#### sextant
- **Name**: Sextant
- **URL**: https://github.com/greymass/sextant
- **Visibility**: Private
- **Purpose**: Account creation platform
- **Description**: Shared infrastructure powering account creation for Anchor, MetaMask, Unicove, and Web Authenticator
- **Status**: Active maintenance
- **Key Features**: Multi-product support, account validation, onboarding workflows

#### msigs
- **Name**: Multisig Proposals Repository
- **URL**: https://github.com/greymass/msigs
- **Visibility**: Public
- **Purpose**: Home for multisig proposals related to VF shutdown resolution
- **Description**: Repository containing proposal documents (markdown files) and code for making proposals on-chain. Focus is on the proposal content and iterations, tracking governance transition after VF shutdown
- **Status**: Active development
- **Key Proposals**: stage-1 through stage-5, dev.accounts, and others related to VF transition

#### msigs-ui
- **Name**: Msigs.io UI
- **URL**: https://github.com/greymass/msigs-ui
- **Visibility**: Private
- **Website**: https://msigs.io
- **Purpose**: Search engine and viewer for multisig proposals
- **Description**: SvelteKit-based reference implementation of the Roborovski msigs API. Serves as public tool and documentation-by-example for developers. Will establish patterns for Unicove multisig integration
- **Status**: Active development
- **Stack**: SvelteKit, @wharfkit/msigs, Cloudflare Pages

#### sentiment-api
- **Name**: Sentiment API
- **URL**: https://github.com/greymass/sentiment-api
- **Visibility**: Private
- **Purpose**: Backend API powering Unicove's sentiment voting feature
- **Description**: Indexes sentiment voting data from smart contracts and provides API for Unicove.com to display and interact with stake-weighted sentiment voting system
- **Status**: Active development
- **Stack**: Drizzle ORM, PostgreSQL, topics API with pagination

#### evm-bridge-frontend
- **Name**: EVM Bridge Frontend
- **URL**: https://github.com/greymass/evm-bridge-frontend
- **Visibility**: Public
- **Purpose**: Maintain token holder access to withdraw from Vaulta EVM
- **Description**: Community response to VF shutting down the Vaulta EVM in October. Forked and relaunched to ensure token holders can continue to withdraw their assets from the EVM bridge
- **Status**: Deprecated (maintenance mode for withdrawals only)
- **Context**: Part of VF shutdown response, distinct from msigs governance work

#### unicove-components
- **Name**: Unicove Components
- **URL**: https://github.com/greymass/unicove-components
- **Visibility**: Private
- **Purpose**: Svelte-based UI framework for Antelope components
- **Description**: Component library and design system providing Antelope blockchain UI components used by Unicove
- **Status**: Active maintenance
- **Stack**: Svelte, reusable components

#### buoy-nodejs
- **Name**: Buoy
- **URL**: https://github.com/greymass/buoy-nodejs
- **Purpose**: Communication infrastructure
- **Description**: Communication service for blockchain applications
- **Status**: Maintenance

#### lighthouse
- **Name**: Lighthouse
- **URL**: https://github.com/greymass/lighthouse
- **Purpose**: Account lookup API
- **Description**: Service for discovering and looking up blockchain accounts
- **Status**: Maintenance

#### fuel-cosigner
- **Name**: Fuel APIs
- **URL**: https://github.com/greymass/fuel-cosigner
- **Purpose**: Resource provider co-signing service
- **Description**: API service enabling fee-free transactions through co-signing
- **Status**: Deprecated

### Libraries & Tools

#### swift-eosio
- **Name**: iOS Development Library
- **URL**: https://github.com/greymass/swift-eosio
- **Purpose**: Swift library for Antelope blockchain development
- **Description**: Native iOS library for building blockchain applications
- **Status**: Maintenance

#### keycert-js
- **Name**: Key Certificate Library
- **URL**: https://github.com/greymass/keycert-js
- **Purpose**: Key certification utilities
- **Description**: JavaScript library for managing blockchain key certificates
- **Status**: Maintenance

#### ricardian-template-toolkit
- **Name**: Contract Template Tools
- **URL**: https://github.com/greymass/ricardian-template-toolkit
- **Purpose**: Ricardian contract templating
- **Description**: Tools for creating and managing Ricardian contract templates
- **Status**: Maintenance

### Smart Contracts

#### producerjson
- **Name**: Block Producer Registry Contract
- **URL**: https://github.com/greymass/producerjson
- **Purpose**: On-chain block producer information registry
- **Description**: Smart contract for registering and updating block producer metadata
- **Status**: Deployed

#### customtokens
- **Name**: Token Registry Contract
- **URL**: https://github.com/greymass/customtokens
- **Purpose**: Custom token metadata registry
- **Description**: Smart contract for managing custom token information
- **Status**: Deployed

#### fuelcontract
- **Name**: Fee Sharing Contract
- **URL**: https://github.com/greymass/fuelcontract
- **Purpose**: Resource provider fee management
- **Description**: Smart contract managing Fuel service fee distribution
- **Status**: Deployed

### Development Tools

#### docker-nodeos
- **Name**: Node Deployment Tools
- **URL**: https://github.com/greymass/docker-nodeos
- **Purpose**: Containerized blockchain node deployment
- **Description**: Docker configurations for deploying Antelope nodes
- **Status**: Maintenance

#### eosio-abi2ts
- **Name**: TypeScript Generator
- **URL**: https://github.com/greymass/eosio-abi2ts
- **Purpose**: Generate TypeScript types from smart contract ABIs
- **Description**: Tool for creating type-safe TypeScript interfaces from contract ABIs
- **Status**: Maintenance

#### pricefeed
- **Name**: Oracle Price Feed
- **URL**: https://github.com/greymass/pricefeed
- **Purpose**: Blockchain price oracle service
- **Description**: Service providing price data to smart contracts
- **Status**: Maintenance

---

## Wharfkit Organization

**URL**: https://github.com/wharfkit

**Overview**: WharfKit is a comprehensive SDK for building Antelope blockchain applications, providing modular libraries for sessions, contracts, accounts, and wallet integrations.

### Core Libraries

#### antelope
- **Name**: Antelope Core Library
- **URL**: https://github.com/wharfkit/antelope
- **Purpose**: Core blockchain primitives and types
- **Description**: Foundation library providing core types, serialization, and utilities for Antelope blockchain development
- **Status**: Active maintenance

#### session
- **Name**: Session Kit
- **URL**: https://github.com/wharfkit/session
- **Purpose**: User session management
- **Description**: Library for managing user sessions, authentication, and transaction signing
- **Status**: Active maintenance

#### contract
- **Name**: Contract Kit
- **URL**: https://github.com/wharfkit/contract
- **Purpose**: Smart contract interaction
- **Description**: Type-safe smart contract interaction library
- **Status**: Active maintenance

#### account
- **Name**: Account Kit
- **URL**: https://github.com/wharfkit/account
- **Purpose**: Account management utilities
- **Description**: Library for managing blockchain accounts, permissions, and resources
- **Status**: Active maintenance

#### signing-request
- **Name**: Signing Request Library (ESR)
- **URL**: https://github.com/wharfkit/signing-request
- **Purpose**: ESR/EOSIO Signing Request protocol implementation
- **Description**: Library for creating and parsing signing requests
- **Status**: Active maintenance

#### resources
- **Name**: Resource Calculator
- **URL**: https://github.com/wharfkit/resources
- **Purpose**: Blockchain resource calculation
- **Description**: Library for calculating CPU, NET, and RAM resources
- **Status**: Active maintenance

#### token
- **Name**: Token Balance Library
- **URL**: https://github.com/wharfkit/token
- **Purpose**: Token balance queries
- **Description**: Library for fetching and managing token balances
- **Status**: Active maintenance

#### msigs
- **Name**: Multi-Signature Tools
- **URL**: https://github.com/wharfkit/msigs
- **Visibility**: Public
- **Purpose**: TypeScript client for Roborovski msigs API
- **Description**: API client for accessing multisig proposal data from the Roborovski indexing service. Used by msigs.io and will be integrated into Unicove
- **Status**: Active development
- **Key Features**: Proposal search, filtering, pagination, type-safe access

#### roborovski
- **Name**: Roborovski Client
- **URL**: https://github.com/wharfkit/roborovski
- **Visibility**: Public
- **Purpose**: Filtered history API client prototype
- **Description**: Initial prototype for filtered history responses, enabling dapps like Unicove to request specific subsets of blockchain history for better performance
- **Status**: Active development
- **Branch**: https://github.com/wharfkit/roborovski/tree/filtered

### User Interfaces

#### web-renderer
- **Name**: Web UI Components
- **URL**: https://github.com/wharfkit/web-renderer
- **Purpose**: Web-based UI rendering
- **Description**: React components for WharfKit integration
- **Status**: Active maintenance

#### console-renderer
- **Name**: Console Interface
- **URL**: https://github.com/wharfkit/console-renderer
- **Purpose**: CLI-based UI rendering
- **Description**: Terminal interface for WharfKit applications
- **Status**: Active maintenance

#### website
- **Name**: WharfKit Website
- **URL**: https://github.com/wharfkit/website
- **Visibility**: Public
- **Website**: https://wharfkit.com
- **Purpose**: Documentation and developer resources
- **Description**: Official WharfKit website with documentation, guides, and API references. Recently enhanced with sitemap for SEO and search engine discoverability
- **Status**: Active maintenance

### Wallet Plugins

#### wallet-plugin-anchor
- **Name**: Anchor Wallet Plugin
- **URL**: https://github.com/wharfkit/wallet-plugin-anchor
- **Purpose**: Anchor wallet integration
- **Description**: Plugin enabling Anchor wallet support in WharfKit applications
- **Status**: Active maintenance

#### wallet-plugin-cloudwallet
- **Name**: Cloud Wallet Plugin
- **URL**: https://github.com/wharfkit/wallet-plugin-cloudwallet
- **Purpose**: Cloud wallet integration
- **Description**: Plugin for cloud-based wallet solutions
- **Status**: Active maintenance

#### wallet-plugin-web-authenticator
- **Name**: Web Authenticator Plugin
- **URL**: https://github.com/wharfkit/wallet-plugin-web-authenticator
- **Purpose**: Web Authenticator integration
- **Description**: Plugin enabling Web Authenticator support in WharfKit applications
- **Status**: Active maintenance

#### wallet-plugin-wombat
- **Name**: Wombat Wallet Plugin
- **URL**: https://github.com/wharfkit/wallet-plugin-wombat
- **Purpose**: Wombat wallet integration
- **Description**: Plugin for Wombat wallet support
- **Status**: Active maintenance

#### wallet-plugin-metamask
- **Name**: MetaMask Snap Plugin
- **URL**: https://github.com/wharfkit/wallet-plugin-metamask
- **Purpose**: MetaMask integration via Snaps
- **Description**: Plugin enabling MetaMask support through MetaMask Snaps
- **Status**: Active maintenance

#### wallet-plugin-tokenpocket
- **Name**: TokenPocket Plugin
- **URL**: https://github.com/wharfkit/wallet-plugin-tokenpocket
- **Purpose**: TokenPocket wallet integration
- **Description**: Plugin for TokenPocket wallet support
- **Status**: Active maintenance

#### wallet-plugin-scatter
- **Name**: Scatter Wallet Plugin
- **URL**: https://github.com/wharfkit/wallet-plugin-scatter
- **Purpose**: Scatter wallet integration
- **Description**: Plugin for legacy Scatter wallet support
- **Status**: Maintenance

#### wallet-plugin-privatekey
- **Name**: Private Key Plugin (Testing)
- **URL**: https://github.com/wharfkit/wallet-plugin-privatekey
- **Purpose**: Development and testing
- **Description**: Plugin for direct private key signing (testing only)
- **Status**: Maintenance

#### wallet-plugin-ledger
- **Name**: Ledger Hardware Wallet Plugin
- **URL**: https://github.com/wharfkit/wallet-plugin-ledger
- **Purpose**: Ledger hardware wallet integration
- **Description**: Plugin for Ledger hardware wallet support
- **Status**: Active maintenance

### Transaction Plugins

#### transact-plugin-resource-provider
- **Name**: Resource Provider Plugin
- **URL**: https://github.com/wharfkit/transact-plugin-resource-provider
- **Purpose**: Fee-free transaction support
- **Description**: Plugin for integrating resource provider services (e.g., Fuel)
- **Status**: Active maintenance

#### transact-plugin-autocorrect
- **Name**: Transaction Autocorrect Plugin
- **URL**: https://github.com/wharfkit/transact-plugin-autocorrect
- **Purpose**: Automatic transaction correction
- **Description**: Plugin that automatically fixes common transaction issues
- **Status**: Active maintenance

#### transact-plugin-cosigner
- **Name**: Co-signing Plugin
- **URL**: https://github.com/wharfkit/transact-plugin-cosigner
- **Purpose**: Multi-signature transaction co-signing
- **Description**: Plugin for adding co-signers to transactions
- **Status**: Active maintenance

#### transact-plugin-finality-checker
- **Name**: Transaction Finality Checker
- **URL**: https://github.com/wharfkit/transact-plugin-finality-checker
- **Purpose**: Verify transaction finality
- **Description**: Plugin that checks and confirms transaction finality
- **Status**: Active maintenance

#### transact-plugin-explorerlink
- **Name**: Block Explorer Link Plugin
- **URL**: https://github.com/wharfkit/transact-plugin-explorerlink
- **Purpose**: Block explorer integration
- **Description**: Plugin that provides links to block explorers for transactions
- **Status**: Active maintenance

#### transact-plugin-local-signing
- **Name**: Local Signing Plugin
- **URL**: https://github.com/wharfkit/transact-plugin-local-signing
- **Purpose**: Client-side transaction signing
- **Description**: Plugin for local transaction signing without wallet
- **Status**: Active maintenance

### Account Creation Plugins

#### account-creation-plugin-anchor
- **Name**: Anchor Account Creation
- **URL**: https://github.com/wharfkit/account-creation-plugin-anchor
- **Purpose**: Account creation via Anchor
- **Description**: Plugin for creating accounts through Anchor wallet
- **Status**: Active maintenance

#### account-creation-plugin-jungle4
- **Name**: Jungle4 Testnet Account Creation
- **URL**: https://github.com/wharfkit/account-creation-plugin-jungle4
- **Purpose**: Testnet account creation
- **Description**: Plugin for creating test accounts on Jungle4 testnet
- **Status**: Active maintenance

#### account-creation-plugin-metamask
- **Name**: MetaMask Account Creation
- **URL**: https://github.com/wharfkit/account-creation-plugin-metamask
- **Purpose**: Account creation via MetaMask
- **Description**: Plugin for creating accounts through MetaMask Snap
- **Status**: Active maintenance

### Development Tools

#### cli
- **Name**: Command-Line Tools
- **URL**: https://github.com/wharfkit/cli
- **Purpose**: WharfKit CLI utilities
- **Description**: Command-line interface for WharfKit development
- **Status**: Active maintenance

#### abicache
- **Name**: ABI Cache System
- **URL**: https://github.com/wharfkit/abicache
- **Purpose**: Contract ABI caching
- **Description**: Service for caching and retrieving smart contract ABIs
- **Status**: Active maintenance

#### common
- **Name**: Shared Utilities
- **URL**: https://github.com/wharfkit/common
- **Purpose**: Common utilities across WharfKit
- **Description**: Shared code and utilities used by multiple WharfKit packages
- **Status**: Active maintenance

#### mock-data
- **Name**: Testing Data
- **URL**: https://github.com/wharfkit/mock-data
- **Purpose**: Test data generation
- **Description**: Mock data and fixtures for testing WharfKit applications. Recently added Unix socket support
- **Status**: Active maintenance

### Additional Libraries

#### webauthn
- **Name**: WebAuthn Authentication
- **URL**: https://github.com/wharfkit/webauthn
- **Purpose**: WebAuthn integration
- **Description**: Library for WebAuthn-based authentication
- **Status**: Active maintenance

#### hyperion
- **Name**: Hyperion API Client
- **URL**: https://github.com/wharfkit/hyperion
- **Purpose**: Hyperion history API client
- **Description**: Client library for Hyperion history services
- **Status**: Active maintenance

#### atomicassets
- **Name**: AtomicAssets Integration
- **URL**: https://github.com/wharfkit/atomicassets
- **Purpose**: NFT standard integration
- **Description**: Library for AtomicAssets NFT standard
- **Status**: Active maintenance

#### sealed-messages
- **Name**: Encrypted Messaging
- **URL**: https://github.com/wharfkit/sealed-messages
- **Purpose**: Encrypted message protocol
- **Description**: Library for encrypted messaging between accounts
- **Status**: Active maintenance

---

## Individual Developer Repositories

### aaroncox/vaulta-contracts
- **Name**: Vaulta Smart Contracts
- **URL**: https://github.com/aaroncox/vaulta-contracts
- **Visibility**: Public
- **Purpose**: Collection of smart contracts for various Vaulta network features
- **Description**: Repository containing multiple smart contracts including API contracts, token registries, account creation contracts, sentiment voting, and other network functionality. Each contract serves a specific purpose within the Vaulta ecosystem.
- **Status**: Active development
- **Stack**: Antelope smart contracts (C++)

---

## Publications

### jesta.blog
- **URL**: https://jesta.blog
- **RSS**: https://jesta.blog/feed
- **Purpose**: Technical blog and announcements
- **Description**: Blog covering blockchain development, product updates, and technical insights

### Medium @greymass
- **URL**: https://medium.com/@greymass
- **RSS**: https://medium.com/feed/@greymass
- **Purpose**: Organization blog and announcements
- **Description**: Official Greymass blog with product updates and ecosystem news

---

## Project Relationships & Infrastructure Stacks

### Sentiment Voting Stack
1. **aaroncox/vaulta-contracts** (Sentiment branch) - Smart contracts on-chain
2. **greymass/sentiment-api** - Indexes contracts, provides API
3. **Unicove** - User interface consuming API

### Multisig Infrastructure Stack
1. **greymass/roborovski** - Multisig indexing service and API
2. **wharfkit/msigs** - TypeScript API client
3. **greymass/msigs-ui** - Reference implementation (msigs.io)
4. **Unicove** - Future integration for multisig features

### Account Creation Infrastructure
- **greymass/sextant** - Shared platform powering:
  - Anchor wallet
  - MetaMask Snap
  - Unicove
  - Web Authenticator

### Onboarding Stack
- **greymass/web-authenticator** - Cloud wallet (1-2 min onboarding)
- **Wharf (WharfKit)** - Integration layer for dapps
- **greymass/sextant** - Account creation backend

---

**Last Updated**: 2025-12-07  
**Usage**: Agents should reference this file for accurate repository names, descriptions, purposes, URLs, and context when generating reports or analyzing activity.

**Maintained By**: Report Director - Update as new projects are created or contexts evolve.
