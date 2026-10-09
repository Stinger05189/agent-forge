<!-- template/.agents/conventions.miner.md -->
# Source Miner Knowledge Base Conventions & Taxonomies

> **[IMMUTABLE AI DIRECTIVE]**
> This file is the living architectural brain for reverse-engineering and knowledge extraction.
> Reference this file during Phase 1 (Triangulation) of every session. Update during `[END SESSION]` teardown.

---

## 1. Mining Mission & Target Profile

- **Target Repository / Subject:** [Repository Name / URL / Domain]
- **Primary Source Languages:** [e.g., C++20, Rust, Go, TypeScript]
- **Core Paradigms:** [e.g., Data-Oriented Design, Lock-Free Concurrency, LSM-Trees, Event Sourcing]
- **Extraction Goal:** Deconstruct production patterns into composable, language-agnostic primitives and architectural specifications for downstream synthesis.

## 2. Quality Gates & Extraction Invariants

- **The "Why > What" Rule:** Every subsystem spec must identify the underlying problem driving design decisions. Reject descriptions of mundane code syntax.
- **North Star Invariants:** Every extracted spec must declare at least one non-negotiable invariant (e.g., "Zero heap allocation on the hot path", "Single-writer lockless ownership").
- **Battle Scars & Provenance:** Whenever an unusual optimization or workaround exists, document the specific runtime, OS, or hardware hazard that motivated it, citing exact file paths and line ranges.
- **Strict Decoupling in Primitives:** Tier 3 primitive specifications must be completely divorced from the source project's domain-specific types. Express them using clean interfaces, templates, or pseudocode.

## 3. Formatting & Schema Standards

- **Output Destination:** All specifications must reside in `vault/` subdirectories:
  - `vault/00_SYSTEM_TOPOLOGY.md`: Overall system mental model and data pipelines.
  - `vault/subsystems/<name>.spec.md`: Concrete subsystem analysis conforming to `skills/extract-subsystem.md`.
  - `vault/primitives/<name>.primitive.md`: Reusable patterns conforming to `skills/extract-primitive.md`.
  - `vault/forensics/<name>.md`: Paper/video audits conforming to `skills/triangulate-source.md`.
- **Diagrams:** Use Mermaid (`graph TD`, `sequenceDiagram`, `stateDiagram-v2`) for state machines and execution flows.
- **Code Listings:** Clean, syntax-highlighted snippets with comments explaining algorithmic tricks (bit shifts, memory fences, alignment tricks).

## 4. Cross-Language Transposition Rules

When extracting Tier 3 Primitives, document adaptation vectors for these runtime models:
- **Systems (C++20 / Rust):** Memory layout, cache-line alignment (`alignas(64)`), zero-copy slices, RAII/borrow lifetimes.
- **Managed / Garbage Collected (Go / C# / Java):** Minimizing GC pointer scanning, arena pooling, off-heap buffers.
- **Web / Event-Loop (TypeScript / WASM / Node):** ArrayBuffers, SharedArrayBuffer + Atomics, microtask queue scheduling.

## 5. Discovered Architectural Patterns & Gotchas

_(Appended dynamically during Phase 3 Teardown as common idioms and recurring design patterns emerge across the codebase.)_