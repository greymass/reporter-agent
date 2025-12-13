# Greymass Team Activity Report
## May 2025

**Navigation**: [← Previous Month](../2025-04/README.md) | [Next Month →](../2025-06/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Finished **Vaulta rebrand** in mobile apps and developer tools
- Added **light theme** to Unicove that switches with your device settings
- Added **contract upload** to Unicove so developers can deploy smart contracts without command-line tools
- Made **transactions easier to read** in Unicove with plain language descriptions
- Started building **12-word recovery** for Web Authenticator to restore accounts on new devices
- Started **Ledger hardware wallet** integration in Web Authenticator for enhanced security

### Publications

Published ["Progress Update (May 2025)"](https://greymass.medium.com/progress-update-may-2025-5805010f5074) on Medium. The post covers Unicove improvements including token balance displays with prices, readable transaction summaries, token swaps, contract upload, and light/dark themes. Also covers developer tool updates and Anchor Android stability fixes.

### Unicove

Added light theme for viewing in bright environments. The theme switches with your device settings, changing between light and dark modes automatically. Users can also manually pick a theme in settings. Both themes show success and error messages clearly.

Added contract upload so developers can deploy smart contracts directly through the website. The upload page accepts contract files and deploys them to any account, working for personal uploads or team approvals. This removes the need for command-line tools.

Made transactions easier to read with plain language descriptions. Users can now understand what transactions do without technical knowledge. The descriptions show information in tables, making it easier to review before signing.

### Unicove - Marketing and Visual Polish

Added custom preview images for social media. When Unicove links are shared on Twitter or Discord, they show custom images with relevant information like account names or transaction details. This makes links look more professional.

Redesigned homepage with updated visuals and messaging. Added notices directing users to swap pages when viewing system contract pages. Updated chart colors, transaction headers, and button styles to work better in both light and dark themes.

### Web Authenticator

Started building 12-word recovery phrase backup. Users can write down recovery phrases and use them to restore accounts on new devices or after data loss. Testing a familiar recovery method alongside device-based sign-in.

Started integrating Ledger hardware wallet support. This will let users combine Web Authenticator's convenience with hardware wallet security. Working on connection methods for desktop and mobile devices for users managing high-value accounts.

Fixed several reliability issues including sign-in setup and backup detection. Development environment now supports secure local testing for contributors.

### Anchor Mobile (Android)

Released 17 stability fixes. Fixed problems that caused the app to freeze during sign-in when users approve transactions. Fixed memory issues that could slow down the app over time.

Improved key management with better handling of edge cases. Users can now remove accounts even when setup didn't finish properly, and the app keeps keys safe to prevent accidental loss. Fixed serious translation errors in Chinese that changed the meaning of important messages.

Updated network naming to Vaulta throughout the app, keeping it consistent with web interfaces.

### WharfKit Development Tools

Added Vaulta network support to developer tools so apps built with WharfKit can support the rebranded network. Created two new wallet connection options: Ledger hardware wallet support, and imToken mobile wallet popular in Asian markets. This gives users more wallet choices when connecting to apps.

### Summary

Merged 41 updates across 5 repositories in May. Added light theme, contract upload, and readable transaction descriptions to Unicove. Started building 12-word recovery and Ledger hardware wallet support for Web Authenticator. Released 17 stability fixes for Anchor Android. Added Vaulta network support and new wallet options to WharfKit.
