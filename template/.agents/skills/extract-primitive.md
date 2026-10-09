<!-- template/.agents/skills/extract-primitive.md -->
# [SKILL] Extract Composable Architectural Primitive (Tier 3)

## Purpose & Scope
This skill isolates a core algorithmic pattern or concurrency/memory trick from its project-specific business logic, producing a decoupled, language-agnostic blueprint in `vault/primitives/<name>.primitive.md` ready for future generative prompting.

---

## Execution Directives

1. **Strip Domain Coupling:** Replace all application-specific types (e.g., `OrderBook`, `ActorEntity`, `HttpRequest`) with generic templates or abstract types (`T`, `Payload`, `Message`).
2. **Isolate the Algorithmic Trick:** Focus on the specific mechanism that gives this primitive its power (e.g., bitwise sequence wrapping, memory fences, pointer tagging, arena chunking).
3. **Formulate the Agent Prompt Seed:** Create a self-contained, copy-pasteable instruction block that an AI agent in a future project can execute to reimplement the pattern from scratch.

---

## Target Output Schema (`vault/primitives/<name>.primitive.md`)

```markdown
# [PRIMITIVE] <Primitive Name>

## 1. Abstract Pattern Classification
- **Category:** <Concurrency | Memory Architecture | Spatial Indexing | Data Pipelines | Synchronization>
- **Problem Solved:** <Concise statement of the computational or architectural bottleneck solved.>
- **Algorithmic Complexity:** Time: <O(...)> | Space: <O(...)> | Cache Profile: <e.g., Single cache-line bounded>

## 2. Structural Contract (Language-Agnostic Interface)
```cpp
// Abstract structural contract defining the decoupled invariant
template <typename TPayload>
class IComposableKernel {
public:
    virtual bool TryPush(const TPayload& Item) = 0;
    virtual size_t DrainBatch(TPayload* OutBuffer, size_t MaxItems) = 0;
};
```

## 3. Algorithmic Kernel (Minimal Reference Implementation)
```cpp
// Minimal, production-grade reference implementation capturing the exact invariant
// (Omit extraneous logging, diagnostics, and domain-specific branches)
```

## 4. Reusability Guide
- **When to Use:** <Conditions where this pattern is the optimal engineering choice.>
- **When to Avoid:** <Pathological conditions, hardware architectures, or scale thresholds where this fails.>
- **Cross-Language Transposition:**
  - *Modern C++ / Rust:* <Alignment directives, atomic ordering, lifetime models.>
  - *Go / C# / Java:* <Avoiding GC object churn, byte-buffer backing, memory barriers.>
  - *TypeScript / WASM:* <SharedArrayBuffer, typed views, atomics.>

## 5. Agent Prompt Seed (For Downstream Generation)
> Copy-paste this directive into an AI context window to generate this primitive in a new project:
```markdown
"Implement a high-performance [Primitive Name] adhering to the structural invariants outlined in vault/primitives/[name].primitive.md. Enforce [Invariant 1] and [Invariant 2]. Ensure zero heap allocations during steady-state processing."
```
```