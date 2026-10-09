<!-- template/.agents/skills/triangulate-source.md -->
# [SKILL] Triangulate External Sources vs. Code Reality

## Purpose & Scope
This skill audits research papers, technical talks, conference presentations, and RFC specifications against the actual ground-truth source code, producing a forensic audit in `vault/forensics/<name>.md`.

---

## Execution Directives

1. **Extract Theoretical Claims:** Identify the algorithms, data models, or performance claims made in the paper or presentation.
2. **Search the Physical Codebase:** Locate the concrete implementations of those claims in source files.
3. **Map the Divergence:** Document every place where production engineering diverged from the theoretical model, extracting *why* the authors were forced to deviate.

---

## Target Output Schema (`vault/forensics/<name>.md`)

```markdown
# [FORENSIC AUDIT] Theory vs. Physical Implementation

## 1. Source Provenance & Triangulation Baseline
- **External Literature / Talk:** <Title, Authors/Presenter, Venue/URL, Date>
- **Analyzed Repository:** <Repository Name, Commit SHA / Tag>
- **Target Subsystem:** <Subsystem Name and primary directories>

## 2. The Divergence Matrix

| Theoretical Construct (Paper/Talk) | Implementation Reality (Code) | Driver Rationale (Why it changed) | Source Citation |
| :--- | :--- | :--- | :--- |
| <e.g., Section 4.1: Synchronous log write per transaction> | <Uses asynchronous group commit ring buffer> | <Disk IOPS saturation under concurrent workloads> | `storage/wal.cpp:112` |
| <e.g., Presentation claim: Completely lock-free actor mailboxes> | <Fallback spinlock engaged under contention > 1000 items> | <Cache bouncing degraded L3 cache under heavy skew> | `actor/mailbox.h:64` |

## 3. Discovered Architectural Insights
- **Academic Blindspots:** <Practical constraints (OS scheduling, hardware quirks, memory fragmentation) omitted from original designs.>
- **Production Innovations:** <Clever proprietary mechanisms invented by developers to survive real-world workloads.>
- **Architectural Regrets:** <Technical debt, acknowledged limitations, or refactoring indicators discovered in source comments or talk transcripts.>
```