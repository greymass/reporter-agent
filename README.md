# Reporter Agent System

Modular reporting system for tracking [Greymass](https://github.com/greymass) and [Wharfkit](https://github.com/wharfkit) team activities across GitHub, blogs, and publications.

## What It Does

Generates comprehensive activity reports using a multi-agent architecture:
- **Executive summaries** for stakeholders (non-technical)
- **Technical reports** for developers (detailed with links)
- **Automated data collection** from multiple sources

## Architecture

The system uses a **Director-Agent pattern** with specialized sub-agents:

1. **Director** (`agent.md`) - Orchestrates the workflow
2. **Researcher** (`agents/researcher.md`) - Collects data from GitHub/RSS feeds
3. **Summary Writer** (`agents/summary.md`) - Creates executive summaries
4. **Technical Writer** (`agents/technical.md`) - Creates technical reports

## Reports

- [November 2025](reports/2025-11/README.md)
- [October 2025](reports/2025-10/README.md) *(folder structure)*
- [September 2025](reports/2025-09.md)
- [August 2025](reports/2025-08.md)
- [July 2025](reports/2025-07.md)

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
