# Greymass Team Activity Report
## April 2025

**Navigation**: [← Previous Month](../2025-03/README.md) | [Next Month →](../2025-05/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Added **Token Swap functionality** to **Unicove** *supporting the rebrand by enabling users to swap the rebranded token*
- Updated **Unicove** with **Vaulta branding** reflecting *the network's evolution and new identity*
- Created **Resource Provider** service *automatically covering CPU, NET, and RAM requirements for transactions*
- Added **user dashboard** to **Web Authenticator** providing *centralized account overview and settings management*
- Improved **Web Authenticator** security with *protected communication ensuring apps can't access accounts without permission*

### Publications

Published ["Progress Update (April 2025)"](https://greymass.medium.com/progress-update-april-2025-41620e009492) on Medium. The post highlights Unicove 2.0's evolution over nine months including multisig support, onboarding tools, and upcoming token swap features. Also covers developer tool improvements including better wallet configuration handling, token querying fixes, and Anchor Android updates with improved account creation and performance optimizations.

### Unicove

Added Token Swap capability supporting the Vaulta rebrand by allowing users to swap the rebranded token directly within Unicove. Users can exchange tokens through familiar swap interfaces without switching to external applications. This keeps all blockchain operations in one place, making the rebrand transition seamless for users.

Updated branding from EOS to Vaulta throughout the interface, reflecting the network's new identity and direction. The update includes proper redirects ensuring bookmarks and search results continue working. Each blockchain now displays its own colors and visual identity, making it immediately clear which network users are connected to.

Added content management system allowing non-developers to publish news and announcements. A homepage carousel now displays important updates, improving communication without requiring code changes for each announcement.

### Web Authenticator

Added user dashboard providing account overview and settings management in one place. The dashboard makes Web Authenticator more comparable to traditional wallet applications while maintaining its no-download advantage for quick onboarding.

Improved security by protecting communication between Web Authenticator and applications. Apps must now prove their identity before accessing accounts, and transaction requests are protected during delivery. This ensures only legitimate apps can request account access and sign transactions. Added detailed views showing users exactly what they're approving before signing any transaction.

Integrated alternative key management option providing users choice in how they secure their accounts. Users can now select between different security approaches based on their preferences and needs.

### Anchor Mobile (Android)

Fixed 6 issues improving error messages, network identification, and application stability. Updated network naming to match current branding and improved backup prompts to better encourage users to protect their accounts. Fixed problems that caused unexpected closures during camera access and activity transitions.

### Anchor Mobile (iOS)

Added account creation integration connecting to shared account creation service. This maintains feature consistency with the Android version enabling iOS users to create accounts through the same streamlined process.

### Resource Provider

Created new service that covers network resource requirements for transactions, simplifying the complex CPU, NET, and RAM requirements. The service either provides resources for free or simplifies them as a transaction fee, removing the burden of resource management from users. This modernizes services previously handled by older systems, making blockchain interactions more accessible by handling resource complexity automatically.

### Summary

Merged 29 updates across 5 repositories in April. Work focused on adding Token Swap capabilities to Unicove, implementing the Vaulta rebrand, advancing Web Authenticator toward production readiness with dashboard and security improvements, and creating modern resource management services. Two new repositories support service development standardization and resource management modernization.
