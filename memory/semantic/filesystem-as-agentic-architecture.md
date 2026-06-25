---
type: topic
title: Filesystem as Agentic Architecture
description: The lineage behind our brain — plain markdown + folder structure + git as the substrate for agent memory and orchestration. Ties together Karpathy's LLM wiki, Google's OKF, and Van Clief's ICM.
tags: [agent-architecture, memory, workflows, design-rationale]
source: synthesis of llm-wiki-karpathy + open-knowledge-format + icm-folder-architecture
created: 2026-06-22
updated: 2026-06-22
---

# Filesystem as Agentic Architecture

A convergent idea, named independently by three sources in 2026, underpins this brain:
**plain markdown files + folder structure + git as the substrate** is enough to give an
agent durable memory and reliable orchestration — no bespoke framework, no proprietary
store. "Folder = state." The same principle drives both halves of our design: knowledge
(the semantic wiki) and procedure (staged workflows).

## Key points
- **Three convergent sources (2026):**
  - [[LLM Wiki (Andrej Karpathy)]](llm-wiki-karpathy.md) — the **memory** half: a
    persistent, LLM-maintained markdown wiki that compounds across sessions (vs RAG).
  - [[Open Knowledge Format (OKF)]](open-knowledge-format.md) — the same memory pattern
    **formalized** into a vendor-neutral spec by Google Cloud.
  - [[ICM — Folder Structure as Agentic Architecture]](icm-folder-architecture.md) — the
    **orchestration** half: numbered-folder stages replacing multi-agent frameworks.
- **Shared DNA:** plain markdown, git as substrate, one required `type` field, `index.md`
  read first / progressive disclosure, `[[wiki-links]]`, supersede-don't-delete.
- **How our brain splits it:** Karpathy/OKF ≈ `memory/semantic/` (the wiki, cyclic and
  native); ICM ≈ `workflows/` (staged, Verify-gated, and *scoped to that folder only*).
  Our Ingest/Query/Lint ≈ `sleep` / `start-work-session` / `deep-sleep`.
- **On `log.md`:** see [[log.md — our stance (resolved)]](no-logmd-stance.md) — we adopted
  a single wiki-level `log.md` ([[Semantic Wiki — changelog]](log.md), Karpathy-style) for
  knowledge-base changes, *alongside* (not instead of) dated `episodic/` + digest
  `reports/`, which serve the whole-life audit and digest jobs.
- **Older root:** Vannevar Bush's Memex (1945) — the LLM solves the human maintenance
  burden Memex couldn't.

## Related
- [[LLM Wiki (Andrej Karpathy)]](llm-wiki-karpathy.md)
- [[Open Knowledge Format (OKF)]](open-knowledge-format.md)
- [[ICM — Folder Structure as Agentic Architecture]](icm-folder-architecture.md)
- [[log.md — our stance (resolved)]](no-logmd-stance.md)
- [[Semantic Wiki — changelog]](log.md)

## History
- 2026-06-22 — Synthesized during powernap from the three same-day working notes.
