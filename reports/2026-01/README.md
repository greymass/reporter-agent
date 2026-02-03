# Greymass Team Activity Report
## January 2026

**Navigation**: [← Previous Month](../2025-12/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Published the first **Roborovski v2** beta, *open-sourcing the blockchain history tools* — a major milestone, though not yet recommended for production deployment
- Integrated **Roborovski v2** into the test version of Unicove, bringing *new ways to search and filter account activity* in a *compact table view*
- Expanded **governance tools** in Unicove — *sentiment polling now covers accounts and proposals*, and the *proposal browser gained search, status filters, and smoother scrolling*
- Published a **WharfKit AI Skill** that *teaches coding assistants how to build with WharfKit tools*

### Roborovski

Building on [December's progress](../2025-12/README.md), the entire Roborovski v2 project was made publicly available on January 15. Roborovski powers the ability to look up account history and find transactions on Antelope blockchains. By sharing these tools openly, any team can now offer the same capabilities to their users.

**Important to note**: v2 is still in active testing and not yet recommended for others to run. Some data issues are still being resolved as the team works toward a stable version.

Reliability improvements continued throughout the month, including better error recovery and data verification. A companion test app was built to validate how the tools handle live data. Several fixes addressed rare cases where historical blockchain data would fail to load correctly.

### Unicove

Unicove began using the new Roborovski v2 tools on a test network. Users can now browse their account activity and narrow results by specific apps, actions, or dates, with a new compact table view that makes the data easier to scan. An experimental transfers page is also in progress. If the new tools are unavailable, the app automatically switches back to the older version.

January also extended Unicove's governance features. [November's sentiment polling](../2025-11/README.md) originally worked only for standalone topics. The groundwork was laid to support sentiment voting on individual accounts and multisig proposals as well, giving the community more ways to signal support or opposition once these are enabled.

The multisig proposals section received a major redesign. Proposals now have three browsing views: ones you created, ones waiting for your approval, and a timeline of all activity. Users can search proposals by name and filter by status, such as proposed, executed, cancelled, or expired. Results appear quickly and scroll smoothly as more proposals load. Translation cleanup continued through the Wuchale system.

### WharfKit AI Skill

Published a guide that teaches AI coding assistants like Claude Code, OpenCode, and other agent-based development tools how to build with the WharfKit tools. The guide activates automatically when relevant work is detected, helping developers get started faster.

### Other Work

Continued improving the **12-word backup** system on Anchor Mobile for both Android and iOS, building on the backup work from previous months. Created a new version of the Buoy communication service, which handles the connection between wallets and apps.

### Summary

Shipped updates across 10 repositories. January focused on making Roborovski v2 publicly available, integrating it into Unicove, and expanding governance tools.
