# Agent Forge ⚒️

A standardized, hybrid human-AI developer workflow engine optimized for high-throughput AI models, manual diff verification, and automated batch code extraction tools.

Agent Forge is designed for developers and systems architects who prefer **manual code review and diff verification** in their IDE (like VS Code or JetBrains Rider) or dedicated batch code extraction GUI applications, while utilizing frontier AI models as persistent, state-aware Assistant Architects.

Instead of relying on pasting massive prompts or fighting AI hallucinations as a project scales, this workflow injects a dedicated, machine-readable `.agents/` directory into your project root. This acts as the AI's core memory bank, providing strict architectural constraints, execution standards, and session-based dev logs.

---

## 🌟 The Value Proposition

Modern frontier models can output thousands of lines of code across dozens of files in a single pass. Agent Forge channels this raw throughput into a predictable, robust development pipeline:

1. **Tooling & Batch-Export Ready:** Code blocks are formatted for seamless parsing by automated batch code extractors. Line 1 inside every code block strictly specifies the commented relative file path. Zero synthetic instructional comments are injected inside code, ensuring code is immediately pasteable and compilable without manual cleanup.
2. **Work Packet Pre-Code Summaries:** Summaries of intent, file changes, and structural additions/removals are consolidated before code blocks execute. Zero conversational chatter or interstitial commentary is permitted between code blocks.
3. **Natural Structural Anchors:** Partial file splices and additions utilize natural surrounding code syntax (enclosing class lines, access specifiers, and adjacent functions) rather than artificial comment tags, ensuring perfect alignment in diff tools.
4. **Milestone-Driven Core Memory:** The workflow enforces a periodic compression cadence on `devlog.md`. Historical sessions are compressed into dense Epoch milestones, preserving technical rationale while preventing token bloat.
5. **Specialized Engine Profiles:** Out-of-the-box support for both general software development and dedicated game engine workflows (e.g., Unreal Engine C++20, Slate, UMG, LWC, and GC rooting).

---

## ⚙️ The Engine: The `.agents/` Directory

When initialized, Agent Forge scaffolds four files into your project:

- 📄 **`agent.md` (The Master Protocol):** The immutable glue of the workflow. Defines roles, execution standards, batch generation rules, and the Session Lifecycle protocol. Available in **Standard** and **Unreal Engine** profiles. **(Never modified by the AI).**
- 📄 **`plan.md` (The Short-Term Engine):** The immediate, actionable queue. Tracks Active and Pending Work Packets and flags external blockers. **(Updated by the AI at teardown).**
- 📄 **`devlog.md` (The Core Memory):** The historical ledger. Organized sequentially by Epochs and Session IDs (never calendar dates). Periodically compressed at milestones to retain maximum operational context. **(Appended by the AI at teardown).**
- 📄 **`conventions.md` (The Brain):** The living rulebook. Stores the tech stack, separation of concerns, naming conventions, and repeated gotchas specific to the codebase. **(Expanded by the AI as new patterns emerge).**

---

## 🚀 Instant Installation (Windows PowerShell)

Initialize Agent Forge in any project root with an interactive prompt:

```powershell
irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1" | iex
```

### Direct Profile Selection (Non-Interactive)

To bypass the interactive prompt and specify the profile directly:

```powershell
# Standard Profile (General Web, Backend, Systems, Mobile)
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1"))) -WorkspaceProfile Standard

# Unreal Engine Profile (C++20, Slate, UMG, LWC, GC Roots, Engine Macros)
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/init.ps1"))) -WorkspaceProfile Unreal
```

---

## 🔄 The Workflow Loop

### 1. Initialization (Context Loading)

Start a new conversation in your LLM of choice. Drop your target source files into the context window along with the entire `.agents/` directory.

Copy and paste the Kickoff Prompt:

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
3. **Propose Work Packets & Declare Batch:** Outline a detailed execution plan batched into logical Work Packets. Explicitly declare your intent to execute all packets in one go.
4. **Halt:** Await my exact reply of **`GREENLIGHT`** before generating any functional code.
```

### 2. Phase 1: Triangulation & Strategy

The AI will synthesize your goal against memory, triangulate edge cases, propose comprehensive Work Packets, and halt for approval.

### 3. Phase 2: High-Throughput Execution

Reply with: `GREENLIGHT`

The AI executes the declared Work Packets sequentially. Each packet provides a single Pre-Code Summary followed immediately by back-to-back code blocks with line 1 file paths and natural context anchors. Your automated batch tools or diff viewer import the code cleanly with zero comment-cleanup required.

### 4. Phase 3: The Teardown

When your goal is met, trigger the memory consolidation protocol:

```markdown
# [END SESSION] Teardown Protocol

**System Directive:**
Halt all active development. We are concluding this session. Proceed immediately to **Phase 3: Teardown** as defined in the Master Protocol (`agent.md`).

**Action Required:**
Please generate the exact, formatted markdown snippets required to update our `.agents/` memory bank:

1. **`devlog.md` Update:** A new Session Entry under the Active Epoch summarizing our focus, key architectural decisions, and resolved roadblocks. Apply milestone compression to older completed sessions if applicable. Increment the Session ID.
2. **`plan.md` Update:** A refreshed task queue checking off completed items, removing stale tasks, and defining the actionable queue for the next session.
3. **`conventions.md` Update:** (If applicable) Any new architectural patterns, conventions, or gotchas discovered today.
```
