<!-- template/.agents/plan.miner.md -->
# Short-Term Implementation Plan (Extraction Roadmap)

> **[IMMUTABLE AI DIRECTIVE]**
> This file represents the immediate, actionable queue for reverse-engineering.
> Tasks must directly map 1:1 to proposed Work Packets. Update during `[END SESSION]`.

---

## Current Macro-Objective

**Phase 1: Initial Cartography & Core Engine Topology**
_Context: Map the top-level repository boundaries, high-frequency execution pipelines, and critical data structures before beginning isolated subsystem deep-dives._

## Active Queue (Current / Next Session)

- [ ] **Task 1: System Cartography & Execution Flow Mapping**
  - _Details:_ Map top-level module dependencies, thread boundaries, and hot-path execution flow.
  - _Target Files:_ `vault/00_SYSTEM_TOPOLOGY.md`
  - _Action Scope:_ `[NEW]`
- [ ] **Task 2: Primary Subsystem Deep-Dive**
  - _Details:_ Deconstruct the core processing pipeline, state machine, and data structures.
  - _Target Files:_ `vault/subsystems/core-pipeline.spec.md`
  - _Action Scope:_ `[NEW]`

## Pending Queue (Upcoming)

- [ ] **Task 3: Primitive Extraction:** Isolate core memory/concurrency primitive into `vault/primitives/`.
- [ ] **Task 4: Forensic Triangulation:** Cross-reference paper/talk claims against implementation in `vault/forensics/`.
- [ ] **Task 5: Master Index Synchronization:** Update `vault/CATALOG.md` with extracted primitives and patterns.

## Blockers / Unresolved Constraints

- **[Missing Source/Context]:** [e.g., Awaiting Git log access or video transcript for architectural pivot context.]
- **[Ambiguity]:** [e.g., Unclear whether secondary memory allocator is production code or legacy fallback.]