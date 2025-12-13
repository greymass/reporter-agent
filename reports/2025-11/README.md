# Greymass Team Activity Report
## November 2025

**Navigation**: [← Previous Month](../2025-10/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Launched sentiment polling allowing token holders to share weighted opinions on community topics
- Built complete proposal platform with search engine to support governance transition
- Improved Web Authenticator signing experience to reduce user confusion during onboarding
- Restored bridge access for token holders affected by service shutdown

### Publications

Published ["Stake-weighted Sentiment"](https://jesta.blog/p/stake-weighted-sentiment) on jesta.blog. The post introduces a new voting mechanism that lets token holders indicate support or opposition to community topics using their staked tokens as voting weight. The feature launched at Unicove with the first vote asking whether sentiment polling is valuable enough to continue developing.

### Governance Tools

November focused on building tools to support governance transitions following foundation shutdown. Created a complete proposal platform with documentation, submission tools, and public review pages.

Developed four proposals addressing account creation, contract deployment, permission changes, and platform capabilities. These proposals enable transition from foundation control to community-managed development and treasury operations.

Launched a public search engine at msigs.io where anyone can browse, search, and review governance proposals. The tool includes permission visualization and light/dark mode support.

### Sentiment Voting

Built and deployed complete sentiment polling at Unicove. Token holders can indicate support or opposition to topics, with positions weighted by their staked tokens. 

Votes are stored using the voter's own storage space and can be removed to reclaim that space. The first live poll asks the community whether sentiment voting is valuable enough to continue developing.

This feature provides visibility into token holder opinions on proposals and initiatives, helping inform network operators of community sentiment without directly impacting governance decisions.

### Web Authenticator

Continued polish work while release is on hold pending foundation asset handoff to new entity. Improved the signing experience with transaction prompts that display clearer information about what users are signing, including summaries, details, and warnings for sensitive operations.

Updated session management with better visual consistency and added branding elements. These improvements reduce confusion when new users sign their first blockchain transactions.

### Unicove

Added support for additional wallet connections. Prototyped multi-language capabilities to explore serving international users. Improved proposal pages with better organization and navigation.

Sentiment voting integration positions Unicove as a platform for community opinion polling.

### Bridge Access Recovery

Restored the bridge application after Vaulta EVM shutdown in October left token holders unable to access withdrawal functionality. The relaunched application enables users to recover assets from the bridge, protecting access to funds for affected token holders.

### Developer Tools

Published new library for querying proposal data, making it easier for developers to access proposal information. Improved testing tools and added sitemap to WharfKit documentation site to improve search engine visibility.

Updated component library with improvements and enhanced documentation examples for consistency.

### Summary

Deployed 4 new projects and merged 4 updates in November. Work focused on governance tools, community sentiment polling, and protecting user access following foundation shutdown. These efforts enable transparent proposal platforms and community opinion visibility.
