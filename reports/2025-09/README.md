# Greymass Team Activity Report
## September 2025

**Navigation**: [← Previous Month](../2025-08/README.md) | [Next Month →](../2025-10/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Made **Web Authenticator** faster and more stable by improving how it stores wallet information
- Simplified **account creation** and **import** making wallet setup faster and easier
- Connected **Web Authenticator** with **Unicove** so you can use the wallet for sending tokens and staking
- Started building **backup extension** for Web Authenticator to test 12-word recovery phrases
- Created **Gate Wallet plugin** for WharfKit expanding wallet integration options

### Web Authenticator

Continued Web Authenticator development on Jungle 4 testnet following [August's development work](../2025-08/README.md). Improved how the wallet stores information making it faster and more stable. Simplified account creation and import making setup faster. Connected with Unicove so you can use the wallet for sending tokens and staking.

Enhanced visual design improving clarity across settings and error pages. Added browser compatibility detection to hide unsupported features preventing confusion.

### Backup Extension

Started building browser extension for 12-word recovery phrases. The extension tests a new backup method separate from QR codes and cloud storage. Extension keeps sensitive recovery phrase handling separate from the main wallet application. Testing different backup methods helps find the best approach.

### Unicove

Released regular updates with improvements and bug fixes for testnet. Added support for pending transactions so users can see transactions before they become final.

### WharfKit Ecosystem

Created Gate Wallet plugin for WharfKit giving users more wallet choices. Additional wallet options let users pick their preferred way to sign transactions. More plugin options help the ecosystem by reducing dependence on any single wallet.

Fixed translation support so wallet plugins display properly in different languages. Users can now interact with wallet interfaces in their preferred language instead of only English. This lets non-English speakers use products in their native language.

Improved resource calculations with better math. The updated calculations prevent transaction failures from incorrect resource estimates. Better calculations mean fewer failed transactions.

### Smart Contract Improvements

Improved smart contracts to retrieve information for multiple accounts at once instead of one at a time. This makes applications faster and more efficient when checking account balances and token holdings.

### Summary

Merged 34 updates across 6 repositories. September focused on improving Web Authenticator on testnet with faster performance, simpler account setup, and connection to Unicove. Started building backup extension for recovery phrases and created Gate Wallet plugin for more wallet choices.
