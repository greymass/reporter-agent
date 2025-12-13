# Greymass Team Activity Report
## March 2025

**Navigation**: [← Previous Month](../2025-02/README.md) | [Next Month →](../2025-04/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Added **translation tools** to Unicove so anyone can help translate without coding
- Upgraded **Unicove styling** for faster loading and smaller size
- Refactored **token system** in Unicove to support multiple tokens and swaps
- Improved **permissions interface** in Unicove making group account management easier
- Fixed **Anchor Mobile (Android)** crashes on older devices and added crash reporting

### Unicove

Added translation tools so community members can help translate without coding knowledge. Anyone can help translate Unicove into their language through simple web-based tools. This makes it easier for global communities to translate and improve accuracy.

Upgraded styling making the app faster and smaller. Updated the design foundation for faster loading and better responsiveness. Also added option to deploy Unicove for single blockchains instead of multiple networks.

Rebuilt how tokens work throughout the app preparing for rebrand and token swaps. This work ensures token features work correctly after the rebrand and makes adding token swaps easier.

Released 15 updates improving the permissions interface, navigation, and displays. These updates build on [February's multisig features](../2025-02/README.md) making group account management easier.

### Anchor Mobile (Android)

Fixed 13 crashes and bugs, especially on older Android versions. Fixed problems where certain devices couldn't create accounts. The app now checks device capabilities before account setup, preventing crashes on Android 10 and earlier.

Added crash reporting system to track problems in production. When crashes happen, the system captures detailed information for faster fixes. This helps maintain app quality by catching problems that only appear on real devices.

Improved interface responsiveness and fixed navigation issues. Improved error handling throughout the app to prevent unexpected crashes.

### Web Authenticator

Reorganized transaction signing code making it easier to maintain and add new features. This makes adding new signing methods simpler while keeping existing features working.

### Summary

Merged 29 updates across 3 repositories in March. Added translation tools, upgraded styling, rebuilt token system, and improved permissions interface in Unicove. Fixed crashes on older Android devices and added crash reporting to Anchor Mobile. Reorganized Web Authenticator transaction signing code.
