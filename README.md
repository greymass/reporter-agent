# Reporter Agent System

An LLM agent-based reporting system that provides insights into ongoing [Greymass](https://github.com/greymass) and [Wharfkit](https://github.com/wharfkit) development activities. The system automatically collects data from GitHub and blogs, then generates reports - no need to understand GitHub or browse through hundreds of projects.

**View these reports online:** [reports.greymass.io](https://reports.greymass.io)

The website provides a more readable experience with a timeline view, navigation, and better formatting.

> **A note from a human**: We're experimenting with this as a way for everyone to understand the work we're doing. *It may be inaccurate though*. This information is reviewed before being added to this repo - but we may not catch everything. Let us know if anything looks incorrect.

## Reports

- **[November 2025](reports/2025-11/README.md)** - Latest report - Sentiment polling, governance tools ([technical](reports/2025-11/technical.md) | [research](reports/2025-11/research.md))
- **[October 2025](reports/2025-10/README.md)** - Passkey integration, backup prototypes ([technical](reports/2025-10/technical.md) | [research](reports/2025-10/research.md))
- **[September 2025](reports/2025-09/README.md)** - Testnet refinements, Unicove integration ([technical](reports/2025-09/technical.md) | [research](reports/2025-09/research.md))
- **[August 2025](reports/2025-08/README.md)** - Backup prototypes, token contracts ([technical](reports/2025-08/technical.md) | [research](reports/2025-08/research.md))
- **[July 2025](reports/2025-07/README.md)** - Web Authenticator design, Spring testnet ([technical](reports/2025-07/technical.md) | [research](reports/2025-07/research.md))
- **[June 2025](reports/2025-06/README.md)** - Transaction signing, Sextant v2 ([technical](reports/2025-06/technical.md) | [research](reports/2025-06/research.md))
- **[May 2025](reports/2025-05/README.md)** - Vaulta rebrand, light theme ([technical](reports/2025-05/technical.md) | [research](reports/2025-05/research.md))
- **[April 2025](reports/2025-04/README.md)** - Token Swap, Vaulta rebrand ([technical](reports/2025-04/technical.md) | [research](reports/2025-04/research.md))
- **[March 2025](reports/2025-03/README.md)** - Translations, token refactoring ([technical](reports/2025-03/technical.md) | [research](reports/2025-03/research.md))
- **[February 2025](reports/2025-02/README.md)** - Multisig support, Web Authenticator deployment ([technical](reports/2025-02/technical.md) | [research](reports/2025-02/research.md))
- **[January 2025](reports/2025-01/README.md)** - Unicove contracts, account tracking ([technical](reports/2025-01/technical.md) | [research](reports/2025-01/research.md))
- **[December 2024](reports/2024-12/README.md)** - Unicove 2.0, EOS Wallet launch ([technical](reports/2024-12/technical.md) | [research](reports/2024-12/research.md))
- **[November 2024](reports/2024-11/README.md)** - Unicove launch preparation ([technical](reports/2024-11/technical.md) | [research](reports/2024-11/research.md))
- **[October 2024](reports/2024-10/README.md)** - Unicove refinements, MetaMask audit ([technical](reports/2024-10/technical.md) | [research](reports/2024-10/research.md))
- **[September 2024](reports/2024-09/README.md)** - Resource management features ([technical](reports/2024-09/technical.md) | [research](reports/2024-09/research.md))
- **[August 2024](reports/2024-08/README.md)** - Core wallet features ([technical](reports/2024-08/technical.md) | [research](reports/2024-08/research.md))
- **[July 2024](reports/2024-07/README.md)** - Unicove 2.0 development start ([technical](reports/2024-07/technical.md) | [research](reports/2024-07/research.md))
- **[June 2024](reports/2024-06/README.md)** - Anchor Mobile improvements ([technical](reports/2024-06/technical.md) | [research](reports/2024-06/research.md))

## What It Does

Generates comprehensive activity reports using a multi-agent LLM architecture:
- **Executive summaries** for stakeholders (plain language, non-technical)
- **Technical reports** for developers (detailed with GitHub links)
- **Research data** collected automatically from GitHub, blogs, and publications

The goal is to make development activity transparent and understandable without requiring readers to navigate GitHub repositories or understand technical jargon.

## Architecture

The system uses a **Director-Agent pattern** with specialized LLM sub-agents:

1. **Director** (`agent.md`) - Orchestrates the workflow
2. **Researcher** (`agents/researcher.md`) - Collects data from GitHub/RSS feeds
3. **Summary Writer** (`agents/summary.md`) - Creates executive summaries
4. **Technical Writer** (`agents/technical.md`) - Creates technical reports
5. **Report Fixer** (`agents/report-fixer.md`) - Applies targeted fixes to existing reports

## Files

- **`agent.md`** - Director agent (orchestrates report generation)
- **`agents/`** - Specialized sub-agents
  - `researcher.md` - Data collection from GitHub/RSS
  - `summary.md` - Executive summary writer
  - `technical.md` - Technical report writer
- **`repo-names.md`** - Maps repository names to friendly display names
- **`reports/`** - Generated reports directory
  - Each report is a folder (e.g., `2025-10/`) containing:
    - `README.md` - Executive summary (non-technical)
    - `technical.md` - Technical details (for developers)
    - Optional: Additional files from other agents

## How to Generate a Report

**Simple approach**: Ask the Director agent to generate a report

```
"Generate a report for October 2025"
```

The Director will:
1. Invoke the Researcher to collect data
2. Present findings for your approval
3. Invoke Summary Writer to create `README.md`
4. Invoke Technical Writer to create `technical.md`
5. Update this file with the new report link

**Manual approach**: Invoke agents individually
1. Use Researcher agent to collect data
2. Use Summary Writer with research data
3. Use Technical Writer with research data
