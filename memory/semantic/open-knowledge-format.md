---
type: reference
title: Open Knowledge Format (OKF)
description: Google Cloud's vendor-neutral spec (v0.1) formalizing the LLM-wiki pattern into a portable, interoperable knowledge format.
tags: [agent-architecture, memory, knowledge-base, markdown, spec, standard]
source: https://github.com/GoogleCloudPlatform/knowledge-catalog/tree/main/okf
created: 2026-06-22
updated: 2026-06-22
---

# Open Knowledge Format (OKF)

OKF v0.1 is an open, vendor-neutral specification from Google Cloud (data analytics team,
released ~12–13 Jun 2026) that formalizes the "LLM-wiki" pattern into a portable,
interoperable format for the metadata, context, and curated knowledge AI agents need.
"Format, not platform" — never requires a proprietary account/SDK to read, write, or
serve; published open from day one. v0.1 is a starting point, not finished. It is
essentially the industry-standard version of our own brain.

## Key points
- **Shape:** knowledge = a directory of markdown files, one concept per file (tables,
  datasets, metrics, playbooks, runbooks, APIs…).
- **Frontmatter:** YAML with structured fields — `type` (the *only* required field),
  `title`, `description`, `resource`, `tags`, `timestamp`; markdown body for content.
- **Optional files:** `index.md` per folder (progressive disclosure) and `log.md`
  (chronological history).
- **Separation of concerns:** minimally opinionated; cleanly separates producers
  (writers) from consumers (readers) so different agents/tools share a wiki without
  translation.
- **Just markdown:** readable in any editor, renders on GitHub, indexable by any search.
- **Ships with:** an enrichment agent (BigQuery → OKF), a static HTML graph visualizer,
  and 3 sample bundles (GA4, Stack Overflow, Bitcoin).
- **Announcement:** https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing
- **Maps to us:** near-identical to `memory/semantic/` conventions — folder = state, plain
  markdown, git as substrate, one required `type` field, `index.md` first, supersede
  don't delete.

## Related
- [[Filesystem as Agentic Architecture]](filesystem-as-agentic-architecture.md)
- [[LLM Wiki (Andrej Karpathy)]](llm-wiki-karpathy.md) — the pattern OKF formalizes.
- [[ICM — Folder Structure as Agentic Architecture]](icm-folder-architecture.md)
- [[No log.md — our stance]](no-logmd-stance.md) — OKF blesses `log.md`; we deliberately don't.

## History
- 2026-06-22 — Created from working note `2026-06-22-google-open-knowledge-format.md` during powernap.
