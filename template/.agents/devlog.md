# Project Dev Log & Core Memory

> **[IMMUTABLE AI DIRECTIVE]**
> **DO NOT MODIFY THIS INSTRUCTION BLOCK.**
> This file is the project's historical ledger and your core memory. It is organized into "Epochs" (major milestones) and sequential "Sessions".
>
> **Your Responsibilities:**
>
> 1. **Session Incrementation:** Never use calendar dates. Increment the Session ID sequentially (e.g., Session 001, Session 002) for every new `[END SESSION]` teardown.
> 2. **Teardown Protocol & Documentation Timing Invariant:** Append a new Session Entry ONLY when `[END SESSION]` is explicitly triggered by the User after all implementation code has been compiled and verified. Never emit devlog updates concurrently with implementation code batches.
> 3. **Dense & Rationale-Focused:** Keep entries technical, dense, and focused on _decisions_, _architectural invariants_, and _resolved roadblocks_ rather than granular line diffs.
> 4. **Milestone Compression Cadence:** Periodically compress past completed sessions into dense Epoch summaries at clear milestones (every 3–4 sessions or when wrapping a major architectural goal). Retain only the most recent 1–2 active sessions in granular detail to prevent token bloat while keeping operational memory sharp.

---

## Active Epoch: 01 - [Define Initial Project Skeleton/Foundation]

### Session 001

- **Focus Area:** [e.g., Initialize core project structure, state management, and base UI layout.]
- **Key Decisions:**
  - [e.g., Opted for contextual state over monolithic store for initial skeleton to minimize boilerplate.]
  - [e.g., Established strict separation between data fetching layer and UI components.]
- **Roadblocks Resolved:**
  - [e.g., Resolved circular dependency between Auth module and Router by extracting auth state to a standalone hook.]
- **Core Files Modified:**
  - `src/main.ext`
  - `src/store/index.ext`

---

## Archived Epochs

_(Older epochs are compressed and summarized here to preserve AI context window capacity as the project scales.)_

- **Epoch 00 (Template Setup):** Initialized Agent Forge workflow, established hybrid diff verification standards, and established clean repository baseline.
