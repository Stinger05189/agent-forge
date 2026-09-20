# Agent Forge

A standardized, hybrid human-AI developer workflow engine optimized for high-throughput AI models, surgical diff verification, and automated batch code extraction tools.

Agent Forge is designed for systems architects and developers who prefer **rigorous diff verification in their IDE** (VS Code, JetBrains Rider, Visual Studio) or dedicated batch code extraction tools (such as **Xcerpt**), while utilizing frontier AI models as persistent, state-aware Assistant Architects.

Instead of pasting massive prompts or fighting AI hallucinations as a project scales, this workflow injects a dedicated, machine-readable `.agents/` memory directory into your project root. This acts as the AI's external memory bank, enforcing strict architectural invariants, execution standards, and session-based dev logs.

---

## Core Architectural Pillars

### 1. Work Packet vs. Batch Taxonomy

- **Work Packet (Logical Unit):** A cohesive milestone addressing a specific subsystem. **The Single-File Action Invariant:** A file may only appear in _one_ Work Packet per turn, consolidating all edits into a single diff block to prevent fragmented file emissions.
- **Batch (Physical Unit):** A single LLM generation turn / response containing one or more Work Packets.
- **High-Throughput Strategy:** The AI defaults to executing **ALL proposed Work Packets in a single batch (Turn 1)**. Plans are split into sequential batches only when code volume dictates, organized strictly by file dependency boundaries with intermediate halts.

### 2. Surgical Diff Discipline (`[PARTIAL_DIFF]` Default)

- **Mandatory Default:** For any existing file exceeding ~50–80 lines, the AI defaults to `[PARTIAL_DIFF]`.
- **Anchor & Elide:** Surrounds changes with 2–3 natural structural syntax lines (class declarations, enclosing function signatures) and elides untouched blocks $>10$ lines using standardized skip comments:
  ```typescript
  // ... [Skipped: Unchanged database connection pooling and client setup] ...
  ```
- **Highly Constrained `[MODIFIED]`:** Full-file outputs are strictly reserved for new files, tiny files (<50–80 lines), or $>80\%$ architectural rewrites.

### 3. Rationale & Comment Preservation

- All existing architectural rationale comments (_why_ logic, locks, or fallbacks exist) and structural labeling comments (`// region`, category banners) are preserved across all diffs.
- Zero synthetic AI instructional comments (e.g., `// TODO: delete this line`) are permitted.

### 4. Documentation Timing Invariant

- Documentation files (`.md`, devlogs, plans) are **never** emitted concurrently with implementation code.
- Implementation code must first be imported, compiled, and verified. Memory synchronization occurs exclusively during Phase 3 Teardown via `[END SESSION]`.

### 5. Dual Tooling Integration: Native IDE & Xcerpt Dev Studio

- **Xcerpt-Optimized Mode:** Emits deterministic boundary tokens (`<<<FILE_START: [ACTION] path>>>` / `<<<FILE_END>>>`), line 1 comment headers, and 4-backtick markdown wrappers for 1-click batch ingestion into Xcerpt Dev Studio.
- **Native IDE Mode:** Emits clean, standard markdown code fences with line 1 comment path headers, optimized for manual review in VS Code, JetBrains, or Visual Studio merge tools.

> **Tooling Note:** [Xcerpt Dev Studio](https://github.com/Stinger05189/xcerpt-app) is a free and open-source desktop tool designed for batch context exporting, deterministic boundary extraction, and 1-click code ingestion.

---

## ⚙️ The Engine: The `.agents/` Directory

When initialized, Agent Forge scaffolds four files into your project:

- 📄 **`agent.md` (The Master Protocol):** The immutable glue of the workflow. Defines roles, diff standards, batch generation rules, and the Greenlight protocol. **(Never modified by the AI).**
- 📄 **`plan.md` (The Short-Term Roadmap):** The actionable queue. Tracks Active and Pending Work Packets and flags external blockers. **(Updated by the AI at teardown).**
- 📄 **`devlog.md` (The Core Memory Ledger):** Historical memory organized sequentially by Epochs and Session IDs (never calendar dates). Periodically compressed at milestones. **(Appended by the AI at teardown).**
- 📄 **`conventions.md` (The Living Brain):** Stores tech stack rules, architectural invariants, and solved gotchas specific to the codebase. **(Expanded by the AI as patterns emerge).**

---

## 🚀 Instant Installation (Windows PowerShell)

Initialize Agent Forge in any project root with an interactive menu:

```powershell
irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1" | iex
```

### Direct CLI Selection (Non-Interactive)

To bypass interactive prompts and specify your configuration directly:

```powershell
# Standard Software Engineering with Xcerpt Dev Studio support
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1"))) -WorkspaceProfile Standard -ToolingMode Xcerpt

# Standard Software Engineering for Native IDE Merge (VS Code / JetBrains)
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1"))) -WorkspaceProfile Standard -ToolingMode NativeIDE

# Unreal Engine 5 with Xcerpt Dev Studio support (C++20, Slate, LWC, GC Roots, Tabs)
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1"))) -WorkspaceProfile Unreal -ToolingMode Xcerpt

# Unreal Engine 5 for Native IDE Merge (Rider / Visual Studio)
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1"))) -WorkspaceProfile Unreal -ToolingMode NativeIDE
```

---

## 🔄 The Workflow Loop

```
[Context Loading] ──> Drop .agents/ + files into context window
                             │
                             ▼
[Phase 1: Triangulation] ──> AI synthesizes memory & proposes Work Packets
                             │
                             ▼
[FULL HALT] ───────────────> Awaits explicit human approval: "GREENLIGHT"
                             │
                             ▼
[Phase 2: Execution] ──────> High-throughput code emission (Zero chatter)
                             │
                             ▼
[User Merge & Test] ───────> Review diffs in IDE or Xcerpt Dev Studio
                             │
                             ▼
[Phase 3: Teardown] ───────> User triggers "[END SESSION]" ──> Memory sync
```

### 1. Initialization (The Handshake)

Start a new conversation in your LLM of choice. Drop your target source files into the context window along with the `.agents/` directory.

Copy and paste the Kickoff Prompt:

```markdown
# [HANDSHAKE] Session Initialization

**System Directive:**
Review the `.agents/agent.md` file provided in this context window. Acknowledge the Master Protocol and Execution Standards. Cross-reference upcoming tasks with `.agents/conventions.md` and `.agents/plan.md`.

### [USER INPUT: SESSION GOAL]

> **My Focus Area / Task for this session is:**
> [INSERT GOAL, CONCERNS, OR TARGET FILES HERE]

**Action Required:**
Do not write code yet. Proceed to **Phase 1: Initialization & Triangulation**:

1. **Synthesize Memory:** Cross-reference `devlog.md` for past decisions, `conventions.md` for strict architectural rules, and `plan.md` for active queue alignment.
2. **Propose Work Packets:** Group work into cohesive Work Packets adhering to the Single-File Action Invariant (consolidate changes per file).
3. **Specify Actions:** Declare action tags (`[PARTIAL_DIFF]`, `[NEW]`, `[MODIFIED]`, `[DELETED]`) for each file. Default to `[PARTIAL_DIFF]` for files >50 lines.
4. **Declare Batch Strategy:** State explicitly which packets will execute in Turn 1 (defaulting to ALL packets).
5. **HALT & SOLICIT GREENLIGHT:** Conclude without code:
   _"Plan established and invariants validated. Awaiting your review and explicit **`[GREENLIGHT]`** to begin execution of ALL Work Packets."_
```

### 2. Phase 1: Triangulation & Strategy

The AI analyzes your goal, verifies architectural invariants, consolidates changes per file, declares its batch execution plan, and comes to a full halt.

### 3. Phase 2: High-Throughput Execution

Reply with: `GREENLIGHT`

The AI emits the declared batch: a single Pre-Code Summary followed immediately by back-to-back code blocks with line 1 comment headers and zero interstitial chatter. Import the diff directly into your IDE or paste it into Xcerpt Dev Studio for 1-click merging.

### 4. Phase 3: The Teardown

Once changes are merged, compiled, and verified, trigger the memory synchronization protocol:

```markdown
# [END SESSION] Teardown Protocol

**System Directive:**
Halt active code development. We are concluding this session. Proceed immediately to **Phase 3: Teardown & Memory Synchronization** as defined in `agent.md`.

**Action Required:**
Generate the exact formatted updates for our `.agents/` memory bank:

1. **`devlog.md` Update:** Append a new Session Entry under the Active Epoch summarizing key architectural decisions and resolved roadblocks. Increment the Session ID sequentially.
2. **`plan.md` Update:** Refresh the task queue: check off completed items, remove stale tasks, and define the active queue for the next session.
3. **`conventions.md` Update:** (If applicable) Document newly established architectural patterns, conventions, or engine gotchas discovered today.
```
