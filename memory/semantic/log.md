# Semantic Wiki — changelog (`log.md`)

Append-only, machine-parseable history of the knowledge base, in Karpathy LLM-wiki style.
Companion to `index.md`: the index is *what exists now*; this log is *what changed, when*.
Maintained by `sleep` (and `deep-sleep` for `lint`). **Newest entries are appended at the
bottom — never edit or reorder past entries.**

Entry format: `## [YYYY-MM-DD] <action> | <Page Title>` + a one-line note.
Actions: `ingest` (new page) · `update` (revised page) · `supersede` (a claim/page
superseded by a new understanding) · `index` (index.md rebuilt) · `lint` (deep-sleep
health check). Adopted 2026-06-24 — see [[No log.md — our stance]](no-logmd-stance.md).

---

## [2026-06-22] ingest | LLM Wiki (Andrej Karpathy)
Reference page created (powernap). Persistent LLM-maintained markdown wiki that compounds knowledge vs RAG.

## [2026-06-22] ingest | Open Knowledge Format (OKF)
Reference page created. Google Cloud's vendor-neutral spec formalizing the LLM-wiki pattern.

## [2026-06-22] ingest | ICM — Folder Structure as Agentic Architecture
Reference page created. Van Clief & McDermott — filesystem structure replaces multi-agent orchestration.

## [2026-06-22] ingest | Filesystem as Agentic Architecture
Topic page created. Synthesis tying Karpathy + OKF + ICM onto our own brain design.

## [2026-06-22] ingest | No log.md — our stance
Convention page created. Recorded our deliberate omission of the per-folder log.md (flagged for a future decision).

## [2026-06-22] index | index.md built
Initial index with Topics / References / Conventions sections (5 pages).

## [2026-06-24] ingest | Design Method — distinctive, brief-first UI
Convention page created (sleep). Brief-first product-UI method; consolidated from a user-provided design-system prompt.

## [2026-06-24] ingest | Web UI Prototype Recipe
Topic page created (sleep). Single-file React+Tailwind prototype + headless-Chrome screenshot verify; from the lead-scanner build.

## [2026-06-24] index | index.md updated
+1 Topic (Web UI Prototype Recipe), +1 Convention (Design Method). Now 7 pages.

## [2026-06-24] supersede | No log.md — our stance
User decision: adopt a single wiki-level `log.md` (Karpathy fidelity). The "No log.md" page is reframed to record the reversal; episodic/ + reports/ are unchanged.

## [2026-06-24] ingest | Semantic Wiki — changelog (log.md)
This file created and backfilled across both cycles; `sleep` will append here on every future wiki change.
