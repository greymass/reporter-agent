# Greymass Team Activity Report
## June 2024

**Navigation**: [Next Month →](../2024-07/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Improved **Anchor Mobile** interface with *faster load times* and modernized design now available as the default experience
- Started **MetaMask Snap** allowing MetaMask users to sign Antelope transactions without switching wallets
- Added **REX staking** to Unicove letting users earn rewards by lending their tokens
- Built **account finder** that searches for your accounts across different blockchains

### Anchor Mobile

Released 20 updates for interface improvements and performance. The updated interface became the default experience, replacing the previous design.

Made the app load faster with better code organization and removed development tools from production. Users now experience faster startup times and smoother interactions when managing accounts and signing transactions.

Fixed several issues affecting transaction requests and account operations. The app now responds more reliably when apps request signatures or account information.

### MetaMask Integration

Built tools letting MetaMask wallet users access Antelope blockchains. MetaMask users can now sign Antelope transactions without installing separate wallet software or managing additional security credentials.

The integration adds Antelope blockchain support directly to MetaMask through a secure extension. This removes a barrier for users already familiar with MetaMask who want to explore Antelope applications.

### Unicove

Added REX staking so users can earn rewards by lending tokens. Staked tokens let other users rent computing resources temporarily.

Improved resource calculations for better estimates when users stake or unstake tokens. This helps users make informed decisions about staking and timing.

### Account Lookup Services

Built tools for finding which accounts are associated with specific keys across multiple blockchains. These services search across networks in parallel, making it easier to find your existing accounts.

Improved reliability with protections against slow or unresponsive nodes. The services now respond consistently even when individual network connections are slow.

### Developer Tools

Improved error messages in core libraries to show exactly where problems occur. Instead of generic errors, developers now see the specific field that caused an issue, reducing troubleshooting time.

Improved token amount handling for accurate calculations across transfers, staking, and contract interactions.

### Summary

Merged 30 updates across 8 repositories. Improved Anchor Mobile interface with faster load times and modernized design. Started MetaMask Snap allowing MetaMask users to sign Antelope transactions. Added REX staking to Unicove letting users earn rewards. Built account finder searching across blockchains.
