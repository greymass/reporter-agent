# Greymass Team Activity Report
## June 2024

**Navigation**: [Next Month →](../2024-07/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Improved **Anchor Mobile** interface with *faster load times* and modernized design now available as the default experience
- Launched **MetaMask Snap** integration enabling MetaMask users to interact with Antelope blockchains *without learning new wallet software*
- Added **token staking** to Unicove allowing users to earn rewards while providing liquidity to the resource rental market
- Improved developer tools with *better error messages* showing exactly where problems occur in data structures

### Anchor Mobile

Released 20 updates focused on interface improvements and performance. The updated interface became the default experience, replacing the previous design after extensive testing and refinement.

Improved app loading speed through better code organization and removed unnecessary development tools from the production version. Users now experience faster startup times and smoother interactions when managing their accounts and signing transactions.

Fixed several issues affecting transaction requests and account operations. The app now responds more reliably when applications request signatures or account information through the wallet connection.

### MetaMask Integration

Created new tools enabling MetaMask wallet users to access Antelope blockchains. MetaMask users can now sign Antelope transactions without installing separate wallet software or managing additional security credentials.

The integration works by adding Antelope blockchain support directly to MetaMask through a secure extension. This removes a significant barrier for users already familiar with MetaMask who want to explore Antelope applications.

### Unicove

Added token staking features allowing users to lock tokens to earn rewards. Staked tokens provide liquidity to the resource rental market where other users can temporarily rent computing resources.

Improved resource calculation accuracy for better estimates when users stake or unstake tokens. This helps users make informed decisions about resource allocation and timing.

### Account Lookup Services

Created new tools for discovering which accounts are associated with specific keys across multiple blockchain networks. These services perform fast parallel searches across networks, making it easier for users to find their existing accounts.

Improved reliability by adding protections against slow or unresponsive blockchain nodes. The services now respond consistently even when individual network connections experience delays.

### Developer Tools

Improved error messages in core development libraries to show exactly where problems occur within data structures. Instead of generic error messages, developers now see the specific field and location that caused an issue, reducing time spent troubleshooting.

Enhanced token amount handling to ensure accurate calculations across all operations involving transfers, staking, and contract interactions.

### Summary

Shipped 30 updates across 8 repositories. June focused on improving user experiences with the Anchor Mobile interface redesign and establishing MetaMask integration to welcome users from other blockchain ecosystems.
