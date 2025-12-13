# Greymass Team Activity Report
## February 2025

**Navigation**: [← Previous Month](../2025-01/README.md) | [Next Month →](../2025-03/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Added **multisig accounts** to Unicove so teams can manage shared accounts with group approvals
- Made **Unicove features** configurable per blockchain preparing for rebrand and token swaps
- Connected **Unicove** to smart contracts to support new token data for rebrand
- Improved **Anchor Mobile (Android)** stability and connected to shared account creation service

### Unicove - Multisig Accounts

Added multisig support so users can manage accounts controlled by multiple people. Teams can view permissions, create proposals needing group approval, and track who has approved. This makes group account management possible without command-line tools.

The multisig interface shows permission structures clearly and handles time-delayed proposals for team decisions. Users can see who can approve actions, create proposals for group decisions, and monitor approval status. This protects shared accounts by requiring multiple approvals before transactions go through.

### Unicove - Multi-Chain Features

Made Unicove features configurable per blockchain. Each blockchain can now enable or disable features based on what it supports. This prepares for the rebrand where different chains will have different token features and swaps.

Connected Unicove to smart contracts for token data supporting the rebrand. This provides token information directly from contracts instead of only from nodes. Added gifted RAM feature so users can buy RAM for others, making it easier to help new users get started.

Released 33 updates throughout February with frequent improvements. Added visual indicators to show which accounts are smart contracts. Improved transaction feedback with clearer success and error messages. Fixed social media link previews when sharing account pages.

### Mobile Wallets

Fixed bugs affecting Anchor Mobile (Android) reliability and performance. Fixed startup timing problems that caused errors. Improved responsiveness when switching between screens. Fixed compatibility issues on older Android versions.

Connected to shared account creation service. This provides consistent account creation across all Greymass products. Updated account lookup to use faster service launched in January.

### Web Authenticator

Deployed globally for faster access worldwide. Users connecting from different regions now experience quicker loading and better responsiveness. The no-download wallet responds faster while keeping security keys under user control.

This completes work started in January, moving from single-location hosting to worldwide deployment for better performance.

### Developer Tools

Updated system contract definitions to match current versions. Fixed compilation issues for smoother development. Added support for temporary accounts in wallet tools for better testing.

### Summary

Merged 52 updates across 7 repositories in February. Added multisig accounts to Unicove, made features configurable per blockchain, and connected to smart contracts for token data preparing for rebrand. Improved Anchor Mobile (Android) stability and connected to shared account creation. Deployed Web Authenticator globally.
