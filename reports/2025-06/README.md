# Greymass Team Activity Report
## June 2025

**Navigation**: [← Previous Month](../2025-05/README.md) | [Next Month →](../2025-07/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Started building **Sextant v2** for account creation across multiple products
- Added **transaction signing** to Web Authenticator so users can approve blockchain actions
- Added **Apple login** to Web Authenticator for claiming free accounts
- Restructured **Web Authenticator data storage** for better maintainability
- Added **WebAuthn support** to WharfKit libraries for passwordless authentication

### Web Authenticator

Added transaction signing so users can approve blockchain actions directly in the browser. Added Apple login for claiming free accounts. Improved security with redirect verification and identity proofs so apps can verify account ownership.

Improved account creation with better error messages and navigation. Fixed routing bugs that blocked access to account details and backup features.

Restructured database handling and configuration management. Switched to shared WebAuthn library so multiple projects can use the same code.

Started building Sextant v2 for account creation. This shared service will handle account creation for Web Authenticator, Anchor, MetaMask Snap, and Unicove.

### Unicove

Fixed browser compatibility issues so Safari and other browsers work consistently. Fixed layout problems on mobile devices improving readability on phones and tablets. Mobile styling now shows transaction and action information correctly on all devices.

Updated homepage images for better performance. Replaced gradient backgrounds with high-quality images that load smoothly. Updated testnet token logos so developers can identify tokens more easily.

### Anchor Mobile (Android)

Fixed stability and reliability issues. Fixed crashes caused by animation errors. Improved release process so updates deploy smoothly. These maintenance updates keep the app reliable for existing users.

Finished modernizing account recovery features, updating old code to current standards. This improves maintainability and creates a stronger foundation for ongoing recovery support.

### WharfKit Core Libraries

Added WebAuthn support for passwordless authentication. Added signature verification so WebAuthn-based wallet signatures can be validated. This lets Web Authenticator and other WebAuthn wallets work with the rest of the ecosystem.

Added key validation to prevent crashes from invalid inputs and fixed security issues in key handling. Improved public key recovery and verification. Improved smart contract compatibility.

### Summary

Merged 29 updates across 5 repositories. June added transaction signing, Apple login, and restructured data storage in Web Authenticator. Started building Sextant v2 for account creation across multiple products. Added WebAuthn support to WharfKit libraries for passwordless authentication. Fixed Unicove browser compatibility and mobile styling. Modernized Anchor Android account recovery code.
