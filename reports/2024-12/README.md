# Greymass Team Activity Report
## December 2024

**Navigation**: [← Previous Month](../2024-11/README.md) | [Next Month →](../2025-01/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Released **Unicove 2.0** for EOS with web wallet, block explorer, and automatic resource handling
- Launched **EOS Wallet for MetaMask** so MetaMask users can access EOS, EOS EVM, and exSat in one wallet
- Launched **free account creation** with MetaMask and social logins
- Started building **Web Authenticator** as a no-download wallet using passkeys

### Publications

Published ["Progress Update (December 2024)"](https://greymass.medium.com/progress-update-december-2024-49ec7c46a65a) on Medium. The post covers developer tool improvements, MetaMask integration updates with separate owner and active keys, and Anchor wallet updates.

EOS Network Foundation published ["EOS Simplified: MetaMask Integration, Unicove 2.0, and Free Account Creation"](https://eosnetwork.com/resources/eos-metamask-unicove-free-account-creation/) announcing EOS Wallet for MetaMask, Unicove 2.0 with block explorer and account management, and free account creation with social logins.

### Unicove

Released Unicove 2.0 for EOS with web wallet, block explorer, and account creation. The platform handles CPU, NET, and RAM automatically through transaction fees so users don't need to manage resources.

Added multi-language support. Built staking rewards interface, RAM marketplace, and multisig proposal management. Created token pages showing balances with send functionality, and contract pages for smart contract data.

Added search for accounts, blocks, public keys, and transactions. Added manual account creation for advanced users and permissions management pages. Redesigned homepage. Works with all major EOS wallets including EOS Wallet for MetaMask.

### Web Authenticator

Started building a no-download wallet using passkeys. The project uses WebAuthn and passkey technology for blockchain access without downloads or installations. This lets users create accounts and start using apps quickly from any web browser.

The prototype tests integration with developer tools to offer quick onboarding, removing the need to install a wallet before trying blockchain apps.

### EOS Wallet for MetaMask

Released EOS Wallet for MetaMask so MetaMask users can access EOS, EOS EVM, and exSat in one wallet. Users can install it with one click through Unicove and create free accounts immediately.

Added security improvements using separate keys for owner and active permissions, reducing risk if keys are compromised. Keys come from MetaMask's secure storage and back up automatically through MetaMask's backup. Developers can integrate using the MetaMask Wallet Plugin.

### Anchor Mobile (Android)

Released 15 updates for stability and usability. Fixed transaction prompt handling to check app state before closing. Improved camera permission flow for QR code scanning. Improved security by hiding private keys when the app goes to background.

Updated block explorer and web wallet URLs to current services. Fixed language detection issues with Simplified Chinese. Improved error handling for account creation and import. Added ability to clear custom testnet settings.

### Free Account Creation

Launched free account creation so new users can create accounts with social logins at no cost. The system gets public keys from the connected wallet (like EOS Wallet for MetaMask) and assigns them to the new account.

Added mobile platform support for account creation directly from mobile apps. Added settings to control account limits per email address. Works with Unicove and supported wallets for easy onboarding.

### Developer Tools

Fixed table query bug where zero index values failed. Updated MetaMask wallet plugin to support new key methods matching security improvements in the Antelope Snap.

### Summary

Merged 60 updates across 8 repositories. Released Unicove 2.0 for EOS with web wallet and block explorer. Launched EOS Wallet for MetaMask and free account creation with social logins. Started building Web Authenticator as a no-download wallet using passkeys. These systems create a complete onboarding where users can install MetaMask, create a free account, and start using EOS.
