# Greymass Team Activity Report
## October 2025

**Navigation**: [← Previous Month](../2025-09/README.md) | [Next Month →](../2025-11/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Improved **passkey support** in Web Authenticator for fingerprint and face unlock instead of managing private keys
- Made **managing accounts** easier in Web Authenticator with search, app permissions, and scrolling
- Made **account creation work on-chain** supporting both modern and traditional security methods
- Began integrating **new multi-language system** into Web Authenticator and Unicove

### Publications

Published ["What I see next for Vaulta/Antelope"](https://jesta.blog/p/what-i-see-next-for-vaultaantelope) on jesta.blog. The post examines development history as alternating cycles between building tools and building products, identifies the current period as focused on improved user experience, and advocates for increased product development to leverage recent work.

### Web Authenticator

Continued development from [September's testnet refinement](../2025-09/README.md) with 22 updates focusing on modern authentication, backup systems, and user experience.

Improved passkey support for fingerprint, face recognition, or device PIN—the same methods users already use to unlock their phones and computers. This removes the burden of managing private keys while maintaining security.

Made managing multiple accounts easier with search and filtering. Added scrolling through large account lists and real-time name availability checks during account creation. 

Added connection management giving users control over which applications access their wallet. The Connections section in Settings displays all connected applications for easy permission management.

Continued building 12-word backup system through browser extension. The extension generates recovery phrases and will enable wallet restoration after device loss.

Improved wallet communication enabling users to use the same account across multiple applications simultaneously. Started adding Wuchale translation system for multi-language support.

### Account Creation

Improved account creation contract to support both modern passkeys and traditional key types. This flexibility accommodates different user preferences—new users benefit from convenient passkey creation while experienced users maintain access to traditional approaches.

### Supporting Projects

Released maintenance updates for Unicove block explorer maintaining product stability. Improved recovery phrase library reliability by removing WASM dependency, and enhanced backup extension design enabling cleaner integration patterns.

### Summary

Merged 29 updates across 4 repositories. October continued Web Authenticator development with improved passkey support, better account management, and on-chain account creation. Added fingerprint and face unlock while making it easier to manage multiple accounts and control app permissions.
