# Project Conventions & Architecture

> **[IMMUTABLE AI DIRECTIVE]**
> **DO NOT MODIFY THIS INSTRUCTION BLOCK.**
> This file serves as the living architectural "brain" for this specific project. It contains the source of truth for the tech stack, naming conventions, structural constraints, and learned lessons.
>
> **Your Responsibilities:**
>
> 1. **Read First:** Reference this file during Phase 1 (Triangulation) of every session to ensure your proposed strategy aligns with established patterns.
> 2. **Maintain & Rewrite:** During the `[END SESSION]` teardown protocol, you are expected to append or reorganize the sections _below_ this block. If we establish a new architectural rule, resolve a recurring bug, or solidify a convention, you must add it here so it is not forgotten in future sessions.
> 3. **Keep it Dense:** Remove outdated patterns. Keep descriptions concise, technical, and actionable.

---

## 1. Tech Stack & Environment

- **Primary Language:** [e.g., TypeScript (Strict Mode) / C++20 / Python 3.12]
- **Core Frameworks:** [e.g., React 19, Vite, Electron / Unreal Engine 5.4 / FastAPI]
- **State / Data Management:** [e.g., Zustand Dual-Store / SQLite / Engine Subsystems]
- **Styling / UI Tooling:** [e.g., Tailwind CSS v4 / Slate SWidget / Custom Rendering]

## 2. Architectural Boundaries & Invariants

- **Separation of Concerns:** [e.g., "All business logic must reside outside the UI layer in feature services."]
- **Diff Discipline & Partial Diffs:** [e.g., "Always default to [PARTIAL_DIFF] on files >50 lines. Elide unchanged code >10 lines with standard skip taxonomy."]
- **Comment Preservation:** [e.g., "Retain all architectural rationale comments and structural section banners across diffs."]
- **Data Mutation & Threading:** [e.g., "UI state is strictly immutable. Heavy file I/O must execute isolated from the main render thread."]

## 3. Formatting & Naming Conventions

- **Indentation:** [e.g., 2 Spaces / 4 Spaces / Mandatory Tabs]
- **File Structure:** [e.g., Feature-based grouping (`src/features/<feature>/`) over type-based grouping (`src/components/`).]
- **Casing Rules:**
  - Files: [e.g., `PascalCase.tsx` for components, `camelCase.ts` for utilities]
  - Types / Interfaces: [e.g., `PascalCase`, no 'I' prefix in TS; strict Unreal prefixes in C++]
  - Variables / Functions: [e.g., `camelCase`]
- **Documentation:** [e.g., "Docstrings required for all public service methods explaining parameters and error states."]

## 4. Execution Patterns & 'Gotchas'

_(This section should grow over time as we solve complex bugs or establish standard patterns in this specific codebase.)_

- **Standard Implementations:**
  - [e.g., "When adding a new workspace property, always map it in both payload serialization and state hydration."]
  - [e.g., "Always use read-only file descriptors with guaranteed try/finally close handlers on Windows to prevent OS file locks."]
- **Known Quirks & Preventative Rules:**
  - [e.g., "Do NOT use string globs for path matching on Windows; backslash separators cause silent matching failures."]
  - [e.g., "React 19 disallows synchronous setState calls in top-level useEffect; defer state updates to the macro-task queue."]
