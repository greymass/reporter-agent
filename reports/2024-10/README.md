# Greymass Team Activity Report
## October 2024

**Navigation**: [← Previous Month](../2024-09/README.md) | [Next Month →](../2024-11/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Shipped **26 updates to Unicove** focused on *user interface refinements and resource management improvements*
- Improved **account overview pages** with better display of *balances, staking, and resource information*
- Enhanced **search functionality** with *history tracking and keyboard navigation* for faster account lookups
- Fixed **resource pricing calculations** for NET and CPU across *powerup, REX, and staking methods*
- Completed **security audit remediations** for the Antelope Snap MetaMask integration

### Publications

Published ["Progress Update (October 2024)"](https://greymass.medium.com/progress-update-october-2024-e6b46b8b4c1b) on Medium. The post covers improvements to developer tools including better transaction error handling and automatic resource allocation, Anchor Wallet for Android updates with better browser compatibility, MetaMask Snap audit completion, and Unicove bug fixes for resource pricing and earnings displays.

### Unicove

Focused heavily on interface polish and resource management accuracy. The application received comprehensive updates to improve how users interact with blockchain resources like RAM, NET, and CPU.

Account overview pages were added to give users a clearer picture of their holdings, including liquid balances, staked resources, and available bandwidth. The resource management interface was improved to present information more clearly and calculate prices accurately across different rental methods.

Search improvements made finding accounts faster and more convenient. The search dialog now remembers recent searches and allows navigation with keyboard shortcuts, reducing the friction of looking up multiple accounts in a session. Error pages were added so users can still navigate the application even when searches fail.

### Resource Pricing Accuracy

Fixed calculations for resource rental pricing across multiple methods. The powerup system, REX rental market, and traditional staking now display accurate costs per kilobyte of NET and CPU resources. This helps users make informed decisions about which method best suits their needs and budget.

The fixes addressed issues where prices were incorrectly calculated or displayed as zero in certain unit conversions. Users can now reliably compare costs between renting resources temporarily through powerup (0.0001 EOS per KB), using the REX market (0.00004 EOS per KB), or staking tokens long-term (0.0528 EOS per KB).

### Antelope Snap

Completed security audit remediation work for the MetaMask Snap integration. Removed console logging that could potentially leak sensitive information and added data sanitization for transaction information. These improvements protect users by ensuring their transaction data and account information remain secure when using MetaMask to interact with Antelope blockchains.

### Wharfkit

Released updates to the resources library that improve REX price calculations for NET and CPU. Fixed a bug where the price calculation method was calling itself recursively instead of performing the correct calculation. Added documentation about the asset quantity property to help developers properly render token amounts.

### Unicove API

Created the Unicove API to provide data services for Unicove including price history charts and current token prices. This dedicated service enhances the wallet's ability to display market information to users.

### Summary

Merged 35 updates across 6 repositories. October focused on Unicove interface improvements, resource management accuracy, and security enhancements for the MetaMask integration.
