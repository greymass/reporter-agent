# Greymass Team Activity Report
## November 2025

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Launched sentiment polling system allowing token holders to express weighted opinions on community topics
- Built complete proposal infrastructure with search engine to support governance transition
- Improved Web Authenticator signing interface to reduce user confusion during onboarding
- Restored bridge interface access for token holders affected by infrastructure shutdown

### Publications

Published ["Stake-weighted Sentiment"](https://jesta.blog/p/stake-weighted-sentiment) on jesta.blog. The post introduces a new voting system that lets token holders express support or opposition to community topics using their staked tokens as voting weight. The system launched at Unicove with the first vote asking whether the sentiment feature itself is useful.

### Governance Infrastructure

November focused on building tools to support governance transitions following foundation shutdown. Created a complete proposal system with documentation, submission tools, and public review interfaces.

Developed four proposals addressing account creation, contract deployment, permission changes, and platform infrastructure. These proposals enable transition from foundation control to community-managed development and treasury operations.

Launched a public search engine at msigs.io where anyone can browse, search, and review governance proposals. The tool includes permission visualization and light/dark mode support.

### Sentiment Voting System

Built and deployed a complete sentiment polling system at Unicove. Token holders can express support or opposition to topics, with positions weighted by their staked tokens. 

Votes are stored using the voter's own storage space and can be removed to reclaim that space. The first live poll asks the community whether sentiment voting is valuable enough to continue developing.

The system provides visibility into token holder opinions on proposals and initiatives, helping inform network operators of community sentiment without directly impacting governance decisions.

### Web Authenticator

Improved the signing experience for users accessing blockchain applications without wallet downloads. Transaction prompts now display clearer information about what users are signing, including summaries, details, and warnings for sensitive operations.

Updated session management with better visual consistency and added adaptive branding to establish trust across different platforms.

These improvements reduce confusion when new users sign their first blockchain transactions, making onboarding more successful. Applications can offer this streamlined no-download experience to their users.

### Unicove

Added support for additional wallet connections. Implemented multi-language system prototype to serve international users. Improved proposal pages with better organization and navigation.

Sentiment voting integration positions Unicove as an interface for community opinion polling.

### Bridge Access Recovery

Restored the bridge frontend interface after infrastructure shutdown left token holders unable to access withdrawal functionality. The relaunched interface enables users to recover assets from the bridge, protecting access to funds for affected token holders.

### Developer Tools

Published new library for querying proposal data, making it easier for developers to access proposal information. Improved testing tools and added sitemap to WharfKit documentation site to improve search engine visibility.

Updated component library with interface fixes and enhanced documentation examples for consistency.

### Summary

Deployed 4 new projects and merged 4 updates in November. Work focused on governance infrastructure, community sentiment polling, and protecting user access following foundation shutdown. These efforts enable transparent proposal systems and community opinion visibility.
