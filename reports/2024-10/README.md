# Greymass Team Activity Report
## October 2024

**Navigation**: [← Previous Month](../2024-09/README.md) | [Next Month →](../2024-11/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Added **account overview pages** showing balances, staking, and resources in one place
- Improved **search** with history and keyboard shortcuts for faster lookups
- Improved **Unicove homepage** and added **token prices** with historical charts
- Completed **security audit** for MetaMask Snap improving data security

### Publications

Published ["Progress Update (October 2024)"](https://greymass.medium.com/progress-update-october-2024-e6b46b8b4c1b) on Medium. The post covers improvements to developer tools including better transaction error handling and automatic resource allocation, Anchor Wallet for Android updates with better browser compatibility, MetaMask Snap audit completion, and Unicove bug fixes for resource pricing and earnings displays.

### Unicove

Improved interface and resource management. The app got many updates for how users interact with resources like RAM, NET, and CPU.

Added account overview pages showing your holdings including liquid balances, staked resources, and available bandwidth. Resource pages show information more clearly and calculate prices accurately across different rental methods.

Improved search making it faster and easier to find accounts. Search now remembers recent searches and lets you navigate with keyboard shortcuts. Added error pages so you can still navigate when searches fail.

### Resource Pricing

Fixed resource rental pricing calculations. Powerup, REX rental market, and staking now show accurate costs per kilobyte of NET and CPU. This helps users decide which method fits their needs and budget.

Fixed issues where prices were wrong or showed zero. Users can now compare costs between renting temporarily through powerup (0.0001 EOS per KB), using REX market (0.00004 EOS per KB), or staking long-term (0.0528 EOS per KB).

### Antelope Snap

Completed security audit for the MetaMask Snap integration. Removed console logging that could leak sensitive information and added data sanitization for transactions. These improvements protect users by keeping their transaction data and account information secure when using MetaMask.

### Wharfkit

Updated resources library with better REX price calculations for NET and CPU. Fixed a bug where the price calculation was broken. Added documentation about asset quantities to help developers display token amounts correctly.

### Unicove API

Created the Unicove API for price history charts and current token prices. This service lets Unicove display market information to users.

### Summary

Merged 35 updates across 6 repositories. Added account overview pages, improved search, built Unicove homepage, and created API for token prices. Fixed resource pricing and completed security audit for MetaMask Snap.
