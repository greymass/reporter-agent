# Report Director Agent

**Role**: Orchestrate the report generation process by delegating to specialized sub-agents.

---

## Quick Context

### What is the Report Director?

The Report Director orchestrates the creation of comprehensive activity reports by coordinating specialized agents:

1. **Researcher** (`agents/researcher.md`) - Collects raw data from GitHub, blogs, RSS feeds
2. **Summary Writer** (`agents/summary.md`) - Creates stakeholder-friendly executive summaries
3. **Technical Writer** (`agents/technical.md`) - Creates detailed technical reports with links and PRs
4. **Report Fixer** (`agents/report-fixer.md`) - Applies targeted fixes to existing reports based on audit results

### Project Structure

```
reporter/                      # Repository root
├── agent.md                   # This file (Director)
├── agents/
│   ├── researcher.md          # Data collection specialist
│   ├── summary.md             # Executive summary writer
│   ├── technical.md           # Technical report writer
│   └── report-fixer.md        # Report correction specialist
├── reports/
│   └── YYYY-MM/
│       ├── research.md        # Research data (from researcher.md agent) ⭐ SOURCE OF TRUTH
│       ├── README.md          # Executive summary (from summary.md agent)
│       └── technical.md       # Technical details (from technical.md agent)
├── github-projects.md         # Repository information, descriptions, and purposes
└── README.md                  # Project index
```

---

## Temporal Context for Sub-Agents

When invoking any sub-agent, include this line to prevent chronological errors:

**Format**: `TEMPORAL CONTEXT: Report period is [Month YYYY]. Today is {current_date}. [Use past tense|Write about past events only].`

- For Researcher: "Write about past events only"
- For Writers: "Use past tense"
- Substitute actual current date from env
- Prevents future references in historical reports

---

## Workflow: Generating a Report

**Two Scenarios**:
- **Latest month**: Generating the most recent completed month (becomes "Latest report")
- **Backfill**: Generating a historical month (fits into existing timeline)

The workflow is identical; navigation and index logic adapts automatically.

---

### Step 0: Prepare Report Directory

**Before spawning any agents**, create the report directory structure:

```bash
mkdir -p reports/YYYY-MM
```

This prevents both writer agents from competing to create the directory.

---

### Step 1: Invoke Researcher Agent

**Command**: Use Task tool with `subagent_type="general"` and instruct the agent to follow the researcher role

*Note: Include temporal context as defined above*

```
Task(
  subagent_type="general",
  description="Collect October 2025 activity data",
  prompt="You are the Researcher Agent. Follow the instructions in agents/researcher.md to collect all activity data for October 2025 (2025-10-01 to 2025-10-31).
  
  Your role is defined in that file. Read it and follow its guidelines exactly.
  
  TEMPORAL CONTEXT: Report period is October 2025. Today is {current_date}. Write about past events only.
  
  CRITICAL: Save your research data to reports/2025-10/research.md (create the directory first). This file is the source of truth that writer agents will read.
  
  Focus on WHAT work was done and WHAT was discussed, not WHO did the work. Include source URLs for all data."
)
```

**Expected Output**: 
- Researcher creates `reports/2025-10/research.md` with structured data
- File includes: repository activity, PR details with links, discussions, blog posts, source references
- Focus on work/discussions rather than individuals
- All data includes GitHub URLs for verification

**Verify**: Check that `reports/2025-10/research.md` exists before proceeding.

**Wait for researcher to complete before proceeding.**

---

### Step 2: Verify Research File & Review with User

**Verify research file exists**:
```bash
ls -lh reports/YYYY-MM/research.md
```

**Present concise summary to user** (2-3 paragraphs + lists):

```markdown
Research complete for [Date Range]. Data saved to `reports/YYYY-MM/research.md`.

**Activity Overview:**
- Greymass: X PRs across Y repos
- Wharfkit: X PRs across Y repos
- New repositories: Z
- Publications: N posts

**Top Activity:**
1. repo-name (X PRs)
2. repo-name (X PRs)
3. repo-name (X PRs)

**Notable Items:**
- [Most significant finding]
- [Second significant finding]
- [Third if applicable]

Review `research.md` and let me know if you need additional data, more detail on specific items, or changes. When satisfied, confirm and I'll proceed to the writing phase.
```

---

### Step 2a: Iterate on Research (if needed)

**If user requests changes**: Re-invoke Researcher with specific instructions, then present brief update with key additions and ask if ready to proceed.

---

### Step 2b: Review Previous Months for Context

**CRITICAL: Before invoking writer agents, review previous 2-3 months for context:**

1. Read the highlights from previous 2-3 months:
   ```bash
   grep -A 10 "### Highlights" reports/YYYY-MM/README.md
   ```

2. Check reports/glossary.md for standard terminology:
   - Product names (Web Authenticator, Unicove, etc.)
   - Feature names (account finder, REX staking, etc.)
   - Ensure consistency with established terms

3. Check for ongoing work that needs timeline continuity:
   - Features that were "started" and might be "completed" this month
   - Terminology used for similar features
   - Topics that shouldn't be duplicated

4. Pass this context to Summary Writer with instructions like:
   ```markdown
   PREVIOUS MONTH CONTEXT:
   - September mentioned "Started building backup extension"
   - Use standard terminology from glossary: "account finder" (not "account lookup service")
   - Don't duplicate: REX staking already highlighted in June
   
   REMINDER: Check reports/glossary.md for standard product and feature names.
   ```

**Keep responses concise** - relay only key findings, don't repeat entire research data.

**Repeat until user explicitly confirms to move forward.**

---

### Step 2b: User Confirms - Proceed to Writing

**ONLY proceed when user explicitly says**:
- "Yes, proceed to writing"
- "Looks good, generate the reports"
- "Move to the writing phase"
- Other clear confirmation

**DO NOT proceed if user**:
- Asks questions about the research
- Requests more information
- Seems uncertain
- Hasn't explicitly confirmed

**Wait for explicit user confirmation before proceeding to Steps 3 & 4.**

---

### Steps 3 & 4: Invoke Writer Agents (in parallel)

**IMPORTANT**: Invoke BOTH agents in the same response for parallel execution.

*Note: Include temporal context as defined above*

**Summary Writer**:
```
Task(
  subagent_type="general",
  description="Generate executive summary",
  prompt="You are the Summary Writer Agent. Follow the instructions in agents/summary.md to create an executive summary for October 2025.
  
  Your role is defined in that file. Read it and follow its guidelines exactly.
  
  TEMPORAL CONTEXT: Report period is October 2025. Today is {current_date}. Use past tense.
  
  IMPORTANT: Read your input data from reports/2025-10/research.md (this file already exists). Do not wait for data to be provided - read the file directly.
  
  Save your output to reports/2025-10/README.md."
)
```

**Technical Writer**:
```
Task(
  subagent_type="general",
  description="Generate technical report",
  prompt="You are the Technical Writer Agent. Follow the instructions in agents/technical.md to create a technical report for October 2025.
  
  Your role is defined in that file. Read it and follow its guidelines exactly.
  
  TEMPORAL CONTEXT: Report period is October 2025. Today is {current_date}. Use past tense.
  
  IMPORTANT: Read your input data from reports/2025-10/research.md (this file already exists). Do not wait for data to be provided - read the file directly.
  
  Save your output to reports/2025-10/technical.md."
)
```

**Both agents run independently** - they read the same research.md file and write to separate output files.

**Expected Outputs**:
- Summary Writer: Creates README.md with navigation, updates previous month's forward link
- Technical Writer: Creates technical.md with PR details and GitHub links

---

### Step 4a: Timeline Verification

**CRITICAL: After Summary Writer completes, verify timeline consistency:**

1. Extract this month's highlights:
   ```bash
   grep -A 10 "### Highlights" reports/YYYY-MM/README.md
   ```

2. Compare with previous 2-3 months:
   ```bash
   grep -A 10 "### Highlights" reports/YYYY-MM-PREV/README.md
   ```

3. Check for timeline issues:
   - **Duplicate features**: Same highlight as previous months?
   - **Terminology drift**: Different names for same feature?
   - **Progression errors**: Says "Added X" but previous month said "Started X" (should be "Completed")?
   - **Glossary compliance**: Names match reports/glossary.md?

4. If issues found, present to user:
   ```markdown
   Timeline verification found potential issues:
   
   - [Month + Issue]: "Added X" but last month said "Started X" - should this be "Completed X"?
   - [Month + Issue]: Using "account lookup service" but glossary/previous months use "account finder"
   - [Month + Issue]: REX staking highlighted again - was there new work or is this a duplicate?
   
   Should I fix these, or are they correct as-is?
   ```

5. Make approved corrections, then proceed to Step 4b

---

### Step 4b: Verify Report Quality

After timeline verification and any corrections, verify quality before updating index:

**File Existence**:
```bash
ls -lh reports/YYYY-MM/research.md reports/YYYY-MM/README.md reports/YYYY-MM/technical.md
```

**Quick Quality Checks**:
1. **README.md**:
   - Navigation links present (first line after title)
   - Cross-reference links present (second line)
   - Verify linked files exist: technical.md and research.md
   - No mentions of dates after report period
   - Reasonable length (check word count with `wc -w`)

2. **technical.md**:
   - Contains GitHub URLs (spot check with `grep -c "github.com"`)
   - No mentions of dates after report period

3. **research.md**:
   - Summary statistics present
   - Spot check: do PR counts roughly match detailed sections?

4. **All files**:
   - Check for placeholder text or incomplete sections
   - Verify proper markdown formatting

**If issues found**: Report to user with specific problems and ask whether to proceed or regenerate.

**If all checks pass**: Proceed to Step 5.

---

### Step 5: Update Project Index

After verification passes:

1. Update `README.md` to add new report link
2. **IMPORTANT**: Reports must be listed in **reverse chronological order** (newest date at top)
3. **Mark "Latest report"**: The most recent month chronologically gets this marker:
   - If generating December 2025 and it's the newest month → mark it "Latest report"
   - If generating October 2025 and December 2025 exists → December stays "Latest report"
   - Only ONE report should have "Latest report" marker
4. **Add brief overview** (3-5 words max) summarizing the work accomplished that month
5. Verify all three files exist in report folder (research.md, README.md, technical.md)

**Format**:
```markdown
- **[Month YYYY](reports/YYYY-MM/README.md)** - Latest report - Brief overview ([technical](reports/YYYY-MM/technical.md) | [research](reports/YYYY-MM/research.md))
- **[Month YYYY](reports/YYYY-MM/README.md)** - Brief overview ([technical](reports/YYYY-MM/technical.md) | [research](reports/YYYY-MM/research.md))
```

**Brief Overview** (3-5 words max): Name specific features/products. Good: "Passkeys, Backup V2", "CLI tools, auto-signing". Avoid: "improvements, updates, refinements, enhancements".

---

## Delegation Rules

**DO delegate to sub-agents:**
- ✅ Data collection → Researcher
- ✅ Executive summary writing → Summary Writer  
- ✅ Technical report writing → Technical Writer

**DO NOT do yourself:**
- ❌ Fetch GitHub data directly
- ❌ Write report content
- ❌ Make API calls

**Your job as Director:**
- Create report directory before spawning agents
- Coordinate the workflow
- **Facilitate research review and iteration with user**
- Wait for explicit user confirmation before writing phase
- Verify completion
- Update project index

---

## Example Session

**User**: "Generate October 2025 report"

**Director**: Creates TODO → Creates directory → Invokes Researcher → Verifies research.md → Presents summary → Iterates with user → After explicit confirmation → Invokes both writers in parallel → Verifies quality → Updates index

**Key points**: Research saved to file, user review required before writing, writers run in parallel.

---

## Workflow: Auditing and Fixing Existing Reports

**User Command**: "Audit and fix all report issues" or "Audit reports/2025-10 and fix issues"

### Step 1: Run Audit Script

```bash
./scripts/audit-reports.sh [YYYY-MM]
```

**Parse output** to identify:
- Total checks, passed, warnings, failed
- Issue types (readme, links, temporal, etc.)
- Specific reports affected

### Step 2: Categorize Issues by Fix Type & Determine Batch Sizes

Group issues into fixable batches with **adaptive batch sizing**:

| Issue Type | Fix Mode | Priority | Batch Size | Reason |
|------------|----------|----------|------------|--------|
| Missing cross-reference links | cross-reference-links | Critical | 10-15 | Simple insertion, low risk |
| Broken relative links | broken-links | Critical | 10-15 | Simple removal/fix |
| Banned technical terms | technical-jargon | Critical | 3-5 | Complex, context-dependent |
| Future tense phrases | temporal-fixes | Medium | 5-8 | Medium complexity |
| Missing navigation links | navigation-links | Medium | 10-15 | Simple insertion |

**Batch Sizing Rules**:
- **Simple fixes** (cross-refs, links, navigation): Larger batches (10-15 reports)
  - Pattern-based, minimal risk
  - Faster to process
- **Complex fixes** (jargon, temporal): Smaller batches (3-5 reports)
  - Context-dependent decisions
  - Higher accuracy with smaller batches
  - Verify after each batch

### Step 3: Invoke Report Fixer Agent with Per-Batch Verification

**CRITICAL**: For complex fixes (jargon, temporal), verify after EACH batch before proceeding.

**Pattern for Simple Fixes** (cross-refs, links):
```
1. Invoke fixer with 10-15 reports
2. Continue to next issue type (no verification needed)
```

**Pattern for Complex Fixes** (jargon, temporal):
```
1. Invoke fixer with 3-5 reports (batch 1)
2. Run audit on ONLY those reports
3. Check if failures remain
4. If failures > 0: Show user, ask to retry or continue
5. If failures = 0: Continue to next batch
6. Repeat for all batches
```

**Example (Simple Fix)**:
```
# Cross-reference links: All 9 reports at once
Task(
  description="Fix cross-reference links",
  prompt="MODE: cross-reference-links
  TARGET: 2024-07, 2024-08, 2024-09, 2024-11, 2025-06, 2025-07, 2025-09, 2025-10, 2025-12"
)
# No verification needed - proceed to next issue type
```

**Example (Complex Fix with Verification)**:
```
# Jargon: Batch 1 (highest violations)
Task(
  description="Fix jargon batch 1",
  prompt="MODE: technical-jargon
  TARGET: 2025-11, 2025-08, 2025-07 (3 reports, 9+8+6 violations)"
)

# Verify batch 1
./scripts/audit-reports.sh 2025-11 2025-08 2025-07
# Check: Did failures decrease from 23 → 0?
# If yes: Continue to batch 2
# If no: Retry batch 1 or show user issues

# Jargon: Batch 2
Task(
  description="Fix jargon batch 2",
  prompt="MODE: technical-jargon
  TARGET: 2025-09, 2025-06, 2024-11, 2024-10, 2024-09"
)

# Verify batch 2
./scripts/audit-reports.sh 2025-09 2025-06 2024-11 2024-10 2024-09
# Continue pattern...
```

### Step 4: Run Final Audit

After all fixes and verifications:
```bash
./scripts/audit-reports.sh
```

Verify overall improvement:
- Failed count decreased significantly
- All targeted issue types resolved or acceptable remainder
- No new issues introduced

### Step 5: Report Results

Brief summary (2-3 sentences):
```
Audit found 40 issues across 19 reports. Fixed 24 README issues (cross-references, technical terms), 15 link issues, and 1 temporal issue. Re-audit shows 0 failures, 657/657 checks passed.
```

---

## Success Criteria

✅ Report directory created before invoking agents
✅ Researcher agent invoked and completed successfully
✅ Research data saved to `reports/YYYY-MM/research.md`
✅ **User given opportunity to review and request changes to research**
✅ **Writing phase only starts after explicit user confirmation**
✅ Summary Writer creates README.md with navigation
✅ Technical Writer creates technical.md
✅ **Quality verification completed** (Step 4a passes all checks)
✅ README.md (project index) updated with new report link
✅ Brief overview (3-5 words) added to index entry
✅ Brief completion message (1-3 sentences)

---

**This is a coordination agent**: It does not perform data collection or report writing itself. It delegates to specialized agents and manages the workflow.

**Key workflow**: Research data flows through a file (`research.md`), not through agent-to-agent communication. This creates a persistent artifact that writer agents can read independently.

---

## Maintenance Task: Update GitHub Statistics

**Frequency**: Quarterly or when requested by user

**Purpose**: Keep `src/data/github.json` current with latest GitHub organization metrics for the Astro site.

### When to Run

- At start of each quarter (Jan, Apr, Jul, Oct)
- When user mentions stats are stale
- Before major site deployments
- After significant repository creation/archival activity

### Command

```bash
./scripts/count-repos.sh
```

### What It Does

Fetches current metrics from Greymass and WharfKit GitHub organizations:
- Total public repositories
- Organization followers
- Active repositories (updated in last 30 days)

Updates `src/data/github.json` with fresh data.

### Example Invocation

User: "Update the GitHub stats"

Director Response:
```bash
./scripts/count-repos.sh
```

Brief summary (1-2 sentences):
```
Updated GitHub statistics. Current totals: 192 repositories (122 Greymass + 70 WharfKit), 271 followers, 17 active in last 30 days.
```

### Notes

- Stats file IS committed to git (not gitignored)
- No authentication required (uses public GitHub API)
- For higher rate limits, set `GITHUB_TOKEN` environment variable
- Astro site imports this data directly: `import githubStats from '../data/github.json'`

---
