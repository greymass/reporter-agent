# Greymass Team Activity Report
## December 2025

**Navigation**: [← Previous Month](../2025-11/README.md)

*Also available: [Technical Report](technical.md) | [Research Data](research.md)*

### Highlights

- Added **block producer voting** to Unicove letting users *vote for their preferred network operators*
- Built **session keys** for Wharf allowing *games and apps to sign certain actions automatically*
- Released **proposal management** in Unicove with *search by name, security warnings, and faster loading*
- Progressed **Roborovski v2** preparing *tools that let developers build apps faster*

### Unicove

December brought major governance features to Unicove. Users can now vote for block producers directly in the app, with accurate vote weight calculations across different networks. The voting interface shows producer rankings and makes it easy to select and change votes.

The proposal section received significant improvements. Users can now search proposals by name, see them load much faster, and browse results that scroll smoothly as more proposals appear. A new security warning alerts users when reviewing approval lists for sensitive proposals.

Search throughout Unicove now handles errors more gracefully. When looking for accounts, blocks, or contracts that don't exist, the page stays stable instead of jumping around, making it easier to correct typos and try again.

### Wharf Session Keys

A major new feature arrived for developers building games and high-activity apps. Session keys let applications sign specific actions automatically without asking users to approve every single transaction in their wallet.

This works by giving the app a temporary key that can only perform certain actions. Players in a game, for example, won't see wallet popups for routine game moves, but still maintain full control over their account for everything else. The feature went through multiple test releases and is now ready for developers to try.

### Web Authenticator

Fixed an issue where Ledger hardware wallet users couldn't complete certain transactions. The backup system received a major update with a redesigned interface, easier manual backup creation, and the ability to share backup information with a mobile device using QR codes. These improvements make it simpler to recover accounts across different devices.

### Developer Tools

Created three new projects this month. A reporting tool now generates activity summaries automatically. A support knowledge base provides centralized documentation for all Greymass and Wharfkit products. A native mobile companion for Web Authenticator enables backup and sign-in features on phones.

Multiple Wharf libraries received updates including better permission handling in Cloud Wallet connections and improved security for local testing.

### Governance Proposals

Continued refining VF transition governance documents, advancing from version 7 to version 9 during December. These proposals outline the transition from foundation control to community-managed operations.

### Roborovski v2

Significant progress on preparing Roborovski v2 for public release. Roborovski is a set of tools that helps apps quickly find and display blockchain information like account history, proposal tracking, and community voting results.

December's work focused on cleaning up the code so other developers can use it in their own projects. The tools were made faster and more reliable. Once released, other teams building on Antelope blockchains can use Roborovski instead of building these features from scratch.

### Summary

Shipped 12 updates across 4 Greymass repositories plus 57 commits across Wharfkit. December focused on governance features in Unicove, session keys for developers, and major progress on the Roborovski v2 public release, while continuing Web Authenticator backup improvements and governance proposal refinement.
