# Greymass Team Activity Report
## December 2024

**Navigation**: [← Previous Month](../2024-11/README.md) | [Next Month →](../2025-01/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Released **Unicove 2.0** as the portal to EOS *offering web wallet, block explorer, and automatic resource management that makes blockchain complexity invisible to users*
- Launched **EOS Wallet for MetaMask** enabling *MetaMask users to interact with EOS alongside EOS EVM and exSat with one-click installation*
- Launched **free account creation** allowing new users to *create accounts at no cost using social login authentication*
- Started development on **Web Authenticator** *exploring browser-based wallet using WebAuthn and passkey technology*

### Publications

Published ["Progress Update (December 2024)"](https://greymass.medium.com/progress-update-december-2024-49ec7c46a65a) on Medium. The post covers improvements to developer tools including better error handling and account creation validation, MetaMask integration updates with separate owner and active keys for enhanced security, and Anchor wallet updates for both Android and iOS with updated links to current services.

EOS Network Foundation published ["EOS Simplified: MetaMask Integration, Unicove 2.0, and Free Account Creation"](https://eosnetwork.com/resources/eos-metamask-unicove-free-account-creation/) announcing the release of EOS Wallet for MetaMask (allowing MetaMask users to interact with EOS), Unicove 2.0 as the portal to the EOS network with block explorer and account management, and a free account creation platform for new users with social login authentication.

### Unicove

Released Unicove 2.0 as the portal to the EOS network, serving as the homepage offering information, web wallet, block explorer, and account creation. The platform provides automatic resource management handling CPU, NET, and RAM through transaction fees, making blockchain complexity invisible to users.

Added multi-language support making the platform accessible to international users. Built staking rewards interface, RAM marketplace access, and multisig proposal management. Created token pages showing balances with send functionality, and contract pages for accessing smart contract data.

Implemented search functionality for accounts, blocks, public keys, and transactions. Added manual account creation workflow for advanced users and permissions management pages. Redesigned homepage highlighting major EOS network components. The platform integrates with all major EOS-compatible wallets including the new EOS Wallet for MetaMask.

### Web Authenticator

Began development on a new web-based wallet exploring browser-native authentication. The project investigates using WebAuthn and passkey technology to enable blockchain access without downloads or installations. This experimental approach aims to allow users to create accounts and start using applications quickly from any web browser.

The prototype explores integration with developer tools to potentially offer a quick onboarding experience, removing the traditional barrier of wallet installation that prevents new users from trying blockchain applications.

### EOS Wallet for MetaMask

Released EOS Wallet for MetaMask, allowing the popular MetaMask wallet to directly interact with EOS network alongside EOS EVM and exSat. The wallet integrates with Unicove through a dedicated landing page where users can install it with one click and create free accounts immediately.

Implemented security improvements using separate keys for owner and active permissions, reducing risk if signing keys are compromised. Keys are derived using standard methods from MetaMask's secure key storage and backed up automatically through MetaMask's normal backup process. Developers can integrate using the MetaMask Wallet Plugin.

### Anchor Mobile (Android)

Shipped 15 updates focused on stability and usability. Fixed transaction prompt handling to properly check activity state before closing. Improved camera permission request flow for QR code scanning. Enhanced security by hiding private key displays when the app enters background mode.

Updated block explorer and web wallet URLs to point to current services. Fixed internationalization issues with Simplified Chinese detection. Improved error handling for account creation and import workflows. Added ability to clear custom testnet settings.

### Free Account Creation

Launched free account creation platform allowing new users to create accounts at no cost by authenticating with social logins. The system securely requests public keys from the connected wallet (like EOS Wallet for MetaMask) and assigns them to the new account's permissions.

Enhanced mobile platform support enabling account creation directly from mobile applications. Added configuration options to control account limits per email address. The platform integrates with Unicove and supported wallets to provide a seamless onboarding experience.

### Developer Tools

Fixed table query bug where zero index values failed due to JavaScript's handling of zero as false. Updated MetaMask wallet plugin to support new key retrieval methods coordinating with security improvements in the Antelope Snap.

### Summary

Merged 60 updates across 8 repositories. December focused on releasing Unicove 2.0 as the EOS network portal, launching EOS Wallet for MetaMask with free account creation, and beginning Web Authenticator development exploring browser-based authentication. These systems combined create a complete onboarding experience where new users can install MetaMask, create a free account, and immediately start using the EOS network.
