---
type: reference
title: LLM Wiki (Andrej Karpathy)
description: Karpathy's pattern — a persistent, LLM-maintained markdown wiki that compounds knowledge across sessions (vs RAG).
tags: [agent-architecture, memory, knowledge-base, markdown]
source: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
created: 2026-06-22
updated: 2026-06-22
---

# LLM Wiki (Andrej Karpathy)

A persistent, structured knowledge base that an LLM agent actively builds and maintains:
a folder of plain markdown files, one Wikipedia-style page per concept, cross-linked with
`[[wiki-links]]`. Knowledge **compounds** across sessions instead of evaporating. Posted
by Andrej Karpathy (~4 Apr 2026) as a GitHub gist. This is the closest external
articulation of our own brain's design.

## Key points
- **Vs RAG:** RAG re-derives knowledge from raw documents on *every* query; the LLM wiki
  builds a **persistent, compounding artifact** once and keeps it updated. Analogy:
  compilation — "you don't execute the source every time; you compile once, distribute
  the artifact, run it on demand." And: "Obsidian is the IDE; the LLM is the programmer;
  the wiki is the codebase." Spiritual precedent: Vannevar Bush's Memex (1945).
- **Three-layer architecture:** (1) raw sources — immutable, single source of truth, read
  but never edited; (2) the wiki — LLM-maintained markdown pages; (3) the schema — a
  `CLAUDE.md` specifying structure, conventions, workflows.
- **Conventions:** `index.md` content catalog (every page + one-line summary);
  append-only `log.md` with machine-parseable prefixes (e.g. `## [2026-04-02] ingest |
  Title`); `[[page-name]]` wiki-links; YAML frontmatter for metadata.
- **Loop:** Ingest (read source → extract → write/update ~10–15 pages → update index →
  append log) · Query (search wiki, not raw sources → synthesize cited answers → good
  answers become new pages) · Lint (periodic health-check for contradictions, stale
  claims, orphans, broken links).
- **Optional tooling:** `qmd` (on-device BM25/vector + LLM re-rank), Marp, Dataview, git.
- **Maps to us:** sources→intake; LLM-maintained wiki→`memory/semantic/`; schema
  `CLAUDE.md`→our `CLAUDE.md`. Ingest/Query/Lint ≈ our `sleep` / `start-work-session` /
  `deep-sleep`. Same `index.md`-first and `[[wiki-link]]` conventions.

## Related
- [[filesystem-as-agentic-architecture]]
- [[open-knowledge-format]]
- [[icm-folder-architecture]]
- [[no-logmd-stance]] — we adopted Karpathy's wiki-level `log.md` (see [[log]]).

## History
- 2026-06-22 — Created from working note `2026-06-22-karpathy-llm-wiki.md` during powernap.
