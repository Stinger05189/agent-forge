# Agent Forge ⚒️

A standardized, hybrid human-AI developer workflow engine.

Agent Forge is designed for developers and systems architects who prefer **manual code implementation and diff-checking** in their IDE (like VS Code), while utilizing AI (like Google Gemini) as a persistent, state-aware Assistant Architect.

Instead of relying on pasting massive prompts or fighting AI hallucinations as a project scales, this workflow injects a dedicated, machine-readable `.agents/` directory into your project root. This acts as the AI's core memory bank, providing strict architectural constraints, execution standards, and session-based dev logs.

## The Value Proposition

Standard AI coding assistants often suffer from context drift, hallucinated frameworks, and destructive file-overwrite behavior. Agent Forge solves this by enforcing:

1. **The Diff-Ready Standard:** The AI is strictly instructed on a "Skip Taxonomy" (using anchors like `// ... [Skipped: N lines] ...`). It outputs surgical, token-efficient code blocks designed to align perfectly in IDE diff/merge tools.
2. **Session-Based Memory:** Work is compartmentalized into "Sessions" and "Epochs". The AI maintains its own `devlog.md` and `plan.md` to remember what it did yesterday and what needs to happen today.
3. **Immutable Architecture:** A living `conventions.md` file tracks project-specific rules, preventing the AI from forgetting the tech stack, naming conventions, or solved bugs.
4. **Zero-Noise Execution:** The AI is trained to eliminate conversational filler and only output the strategy, the code, and the teardown summaries.

---

## The Engine: The `.agents/` Directory

When initialized, Agent Forge scaffolds four files into your project:

- 📄 **`agent.md` (The Master Protocol):** The immutable glue of the workflow. It defines the AI's role, the VS Code diff-ready execution standards, and the strict Session Lifecycle protocol. **(Never modified by the AI).**
- 📄 **`plan.md` (The Short-Term Engine):** The immediate, actionable queue. It tracks Active and Pending "Work Packets" and flags external blockers. **(Updated by the AI at the end of every session).**
- 📄 **`devlog.md` (The Core Memory):** The historical ledger. Organized sequentially by Epochs and Session IDs (never dates). It tracks key architectural decisions and resolved roadblocks. **(Appended by the AI at the end of every session).**
- 📄 **`conventions.md` (The Brain):** The living rulebook. It stores the tech stack, separation of concerns, naming conventions, and repeated "Gotchas" specific to the current codebase. **(Expanded by the AI as new patterns emerge).**

---

## Instant Installation (Windows PowerShell)

You don't need to clone this repository or install any packages. To initialize Agent Forge in a new project, simply open your terminal at the root of your project and run:

```powershell
irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1" | iex
```

This completely eliminates setup friction. No cloning, no profile tweaking, no path mapping. Just open a terminal, run the one-liner, and your AI memory bank is ready to go.

**_Note: If an `.agents/` directory already exists in the target, the script will prompt you before overwriting to protect your project's memory state._**

---

## The Workflow Loop

Agent Forge operates on a strict "Session" lifecycle. You, the Lead Architect, drive the overarching phases, while the AI executes the micro-level implementations.

### 1. Initialization (Context Loading)

Start a new conversation in your LLM of choice (e.g., Gemini). Drop your target source files into the context window, along with the entire `.agents/` directory.

Copy and paste the following prompt, filling in your specific goal:

```markdown
# [HANDSHAKE] Session Initialization

**System Directive:**
Review the `.agents/agent.md` file provided in this context window. Acknowledge the Master Protocol and the Execution Standards. Cross-reference the upcoming tasks with `.agents/conventions.md` and `.agents/plan.md`.

### [USER INPUT: SESSION GOAL]

> **My Focus Area / Task for this session is:**
> [INSERT YOUR GOAL, THOUGHTS, CONCERNS, OR TARGET FILES HERE]

**Action Required:**
Do not write code yet. Proceed to **Phase 1: Initialization** by executing the following:

1. **Synthesize Context:** Actively merge my stated goal with the existing project memory. Cross-reference `devlog.md` for past decisions, `conventions.md` for strict architectural rules, and `plan.md` for the active task queue.
2. **Triangulate & Strategize:** Based on this synthesis, provide a breakdown of affected files, potential edge cases, and architectural impacts.
3. **Propose Work Packets:** Outline a detailed execution plan batched into logical, comprehensive Work Packets.
4. **Halt:** Await my exact reply of **`GREENLIGHT`** before generating any functional code.
```

### 2. Phase 1: Triangulation & Strategy

The AI will **not** write code yet. It will cross-reference your goal against `conventions.md` and `plan.md`, then output a strategy broken down into isolated "Work Packets."

### 3. Phase 2: Iteration

Reply with the exact phrase: **`GREENLIGHT`**.
The AI will begin executing the Work Packets. It will accumulate changes per-file to maximize turn volume and output diff-ready code blocks using strict structural anchors. You manually merge these blocks in VS Code using your diff tool.

### 4. Phase 3: The Teardown

When the work is merged and your goal for the day is met, you must trigger the memory-saving protocol.

Copy and paste the following prompt:

```markdown
# [END SESSION] Teardown Protocol

**System Directive:**
Halt all active development. We are concluding this session. Proceed immediately to **Phase 3: Teardown** as defined in the Master Protocol (`agent.md`).

**Action Required:**
Please generate the exact, formatted markdown snippets required to update our `.agents/` memory bank. Provide three distinct code blocks:

1. **`devlog.md` Update:** A new Session Entry under the Active Epoch summarizing our focus, key architectural decisions, and resolved roadblocks. Increment the Session ID.
2. **`plan.md` Update:** A refreshed task queue checking off what we finished, removing stale tasks, and promoting/defining the exact tasks for the _next_ session.
3. **`conventions.md` Update:** (If applicable) Any new architectural rules, strict naming conventions, or specific 'Gotchas' we discovered today that should be permanently remembered.

Ensure these blocks are formatted perfectly for me to directly copy and replace/append to their respective files.
```

You review these drafts, and if they look good, manually paste them into their respective files in your `.agents/` folder. The state is now perfectly preserved for tomorrow.

---

## Maintenance & Best Practices

- **Keep `agent.md` clean:** Do not put project-specific code in `agent.md`. If you change tech stacks, update `conventions.md`.
- **Compress Epochs:** As `devlog.md` grows massive over months of development, manually summarize older Epochs into short paragraphs to save AI token context limits.
- **Trust the Diff Tool:** If the AI fails to provide the required 3 lines of unchanged structural context for a sparse edit, correct its behavior immediately before copying the code.
