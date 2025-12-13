# Greymass Team Activity Report
## April 2025

**Navigation**: [← Previous Month](../2025-03/README.md) | [Next Month →](../2025-05/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Added **token swaps** to Unicove including swapping to the rebranded token
- Updated **Unicove** from EOS to Vaulta including all features for the new token
- Created **Resource Provider** for automatically managing CPU and NET resources for accounts
- Added **dashboard** to Web Authenticator showing accounts and settings in one place
- Secured **Web Authenticator messaging** so transactions can only come from apps you're logged into

### Publications

Published ["Progress Update (April 2025)"](https://greymass.medium.com/progress-update-april-2025-41620e009492) on Medium. The post covers Unicove 2.0's progress over nine months including multisig support, onboarding tools, and token swap features. Also covers developer tool improvements and Anchor Android updates.

### Unicove

Added token swaps including swapping to the rebranded token. Users can exchange tokens directly in Unicove without switching to external apps. This keeps all blockchain operations in one place.

Updated branding from EOS to Vaulta throughout the site. The update includes redirects so bookmarks and search results still work. Each blockchain now displays its own colors and visual identity so users can see which network they're connected to.

Added content management system so non-developers can publish news and announcements. A homepage carousel now displays important updates without requiring code changes.

### Web Authenticator

Added dashboard showing account overview and settings in one place. The dashboard makes Web Authenticator work more like traditional wallet apps while keeping the no-download advantage.

Secured messaging between Web Authenticator and apps. Transaction requests are encrypted so they can only come from apps you're logged into. This ensures only apps you've connected to can send transactions. Added detailed views showing exactly what you're approving before signing transactions.

Added alternative key management option so users can choose how they secure their accounts. Users can now pick between different security approaches.

### Anchor Mobile (Android)

Fixed 6 issues with error messages, network names, and app stability. Updated network naming from EOS to Vaulta and improved backup prompts encouraging users to protect their accounts. Fixed problems that caused the app to close unexpectedly during camera use and screen changes.

### Anchor Mobile (iOS)

Connected to shared account creation service. iOS users can now create accounts through the same process as Android users.

### Resource Provider

Created tool for automatically managing CPU and NET resources for accounts. The tool monitors selected accounts and ensures they have enough resources for transactions. This replaces the old eosio-resource-manager with a modern alternative.

### Summary

Merged 29 updates across 5 repositories in April. Added token swaps to Unicove and updated branding from EOS to Vaulta. Added dashboard and secured messaging in Web Authenticator. Created Resource Provider tool for automatically managing transaction resources. Two new repositories created.
