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

## Installation

Agent Forge is built to be modular. You can clone this repository anywhere on your machine and run the installer script to inject the workflow into any new or existing project.

### Windows (PowerShell)

```powershell
# 1. Clone this repository to your local machine (e.g., into your tools directory)
git clone [https://github.com/yourusername/agent-forge.git](https://github.com/yourusername/agent-forge.git)

# 2. Run the installer script, pointing it to your target project directory
.\agent-forge\install.ps1 -TargetDir "C:\path\to\your\target\project"

```

_Note: If an `.agents/` directory already exists in the target, the script will prompt you before overwriting to protect your project's memory state._

---

## The Workflow Loop

Agent Forge operates on a strict "Session" lifecycle. You, the Lead Architect, drive the overarching phases, while the AI executes the micro-level implementations.

### 1. Initialization (Context Loading)

Start a new conversation in your LLM of choice (e.g., Gemini 1.5 Pro). Drop your target source files into the context window, along with the entire `.agents/` directory.

Provide your kickoff prompt:

> _"Review `agent.md` and acknowledge the handshake. [USER INPUT: SESSION GOAL] My goal is to: [Insert Goal Here]."_

### 2. Phase 1: Triangulation & Strategy

The AI will **not** write code yet. It will cross-reference your goal against `conventions.md` and `plan.md`, then output a strategy broken down into isolated "Work Packets."

### 3. Phase 2: Iteration

Reply with the exact phrase: **`GREENLIGHT`**.
The AI will begin executing the Work Packets. It will accumulate changes per-file to maximize turn volume and output diff-ready code blocks using strict structural anchors. You manually merge these blocks in VS Code using your diff tool.

### 4. Phase 3: The Teardown

When the work is merged and the goal is met, type:

> **`[END SESSION]`**

The AI will immediately halt development and draft updates. It will:

1. Increment the Session ID and write a summary for `devlog.md`.
2. Update checkboxes and queue the next tasks in `plan.md`.
3. Add any newly discovered rules or fixes to `conventions.md`.

You review these drafts, and if they look good, you manually paste them into their respective files in your `.agents/` folder. The state is now saved for your next session.

---

## Maintenance & Best Practices

- **Keep `agent.md` clean:** Do not put project-specific code in `agent.md`. If you change tech stacks, update `conventions.md`.
- **Compress Epochs:** As `devlog.md` grows massive over months of development, manually summarize older Epochs into short paragraphs to save AI token context limits.
- **Trust the Diff Tool:** If the AI fails to provide the required 3 lines of unchanged structural context for a sparse edit, correct its behavior immediately before copying the code.
