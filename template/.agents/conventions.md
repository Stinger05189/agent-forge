# Project Conventions & Architecture

> **[IMMUTABLE AI DIRECTIVE]** > **DO NOT MODIFY THIS INSTRUCTION BLOCK.**
> This file serves as the living architectural "brain" for this specific project. It contains the source of truth for the tech stack, naming conventions, structural constraints, and learned lessons.
>
> **Your Responsibilities:**
>
> 1. **Read First:** Reference this file during Phase 1 (Triangulation) of every session to ensure your proposed strategy aligns with established patterns.
> 2. **Maintain & Rewrite:** During the `[END SESSION]` teardown protocol, you are expected to rewrite, append, or reorganize the sections _below_ this block. If we establish a new architectural rule, encounter a recurring bug, or solidify a naming convention, you must add it here so it is not forgotten in future sessions.
> 3. **Keep it Dense:** Remove outdated patterns. Keep descriptions concise and technical.

---

## 1. Tech Stack & Environment

- **Primary Language:** [e.g., Strict Typed Language / Scripting Language]
- **Core Frameworks:** [e.g., Frontend Framework, Backend Runtime, Game Engine]
- **State / Data Management:** [e.g., Relational DB, Global State Manager, Local Storage]
- **Styling / UI Tooling:** [e.g., CSS Framework, Component Library, Custom Rendering]

## 2. Architectural Boundaries & Data Flow

- **Separation of Concerns:** [Define the core rule, e.g., "All business logic must exist outside the UI layer" or "Heavy processing must be offloaded to isolated threads/workers."]
- **Data Mutation:** [Define how state is changed, e.g., "State is strictly immutable and updated via pure functions" or "Direct mutation is allowed only within service classes."]
- **Communication:** [Define how modules talk, e.g., "Event-driven pub/sub," "Direct method invocation," or "REST API polling."]

## 3. Formatting & Naming Conventions

- **File Structure:** [e.g., "Feature-based grouping (e.g., `/features/auth`) rather than type-based grouping (`/components`, `/services`)."]
- **Casing Rules:**
  - Files: [e.g., `PascalCase.ext` or `kebab-case.ext`]
  - Classes/Interfaces: [e.g., `PascalCase`, prefixed with 'I' for interfaces]
  - Variables/Functions: [e.g., `camelCase` or `snake_case`]
- **Documentation:** [e.g., "All public methods must include docstrings explaining parameter types and return values."]

## 4. Execution Patterns & 'Gotchas'

_(This section should grow over time as we solve complex bugs or establish standard ways of doing things in this specific codebase.)_

- **Standard Implementations:**
  - [e.g., "When registering a new module, always add it to the `MainRegistry` before initialization."]
  - [e.g., "Always use `CustomWrapper` instead of native `NativeElement` to ensure cross-platform compatibility."]
- **Known Quirks & Preventative Rules:**
  - [e.g., "Do NOT use `MethodX` for background tasks; it blocks the main thread. Use `MethodY` instead."]
  - [e.g., "Framework Z has a memory leak when unmounting Widget A. Always call `cleanup()` manually."]
