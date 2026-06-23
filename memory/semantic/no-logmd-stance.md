---
type: convention
title: No log.md — our stance
description: We deliberately omit the per-folder append-only log.md that Karpathy's LLM wiki and Google's OKF both bless; episodic/ is the dated log, reports/ are the digests.
tags: [convention, design-rationale, memory, divergence]
source: CLAUDE.md ("No log.md"); contrasted with llm-wiki-karpathy + open-knowledge-format
created: 2026-06-22
updated: 2026-06-22
---

# No log.md — our stance

Our CLAUDE.md states the convention plainly: **"No `log.md`."** Chronological history
lives in `memory/episodic/` (raw dated log / audit, append-only) and synthesized history
lives in `memory/reports/` (daily digests). We do not keep a per-folder `log.md`.

## Key points
- **The tension:** two authoritative external patterns both bless a per-folder append-only
  `log.md` — [[LLM Wiki (Andrej Karpathy)]](llm-wiki-karpathy.md) (with
  machine-parseable prefixes like `## [2026-04-02] ingest | Title`) and
  [[Open Knowledge Format (OKF)]](open-knowledge-format.md) (lists `log.md` as an optional
  file). We diverge from both.
- **Why we diverge:** we separate raw audit (`episodic/`, dated) from synthesized digest
  (`reports/`) at the *brain* level rather than scattering a log inside every folder. One
  audit trail, one digest stream — not N per-folder logs.
- **When this matters:** if we ever claim OKF compatibility or want to interoperate with
  an LLM-wiki-style consumer, the missing `log.md` is the most likely friction point. A
  deliberate decision would be needed then — either an export shim that renders `episodic/`
  as per-folder `log.md`, or an accepted incompatibility. **Open for a human decision.**

## Related
- [[Filesystem as Agentic Architecture]](filesystem-as-agentic-architecture.md)
- [[LLM Wiki (Andrej Karpathy)]](llm-wiki-karpathy.md)
- [[Open Knowledge Format (OKF)]](open-knowledge-format.md)

## History
- 2026-06-22 — Recorded during powernap; the divergence was flagged in two same-day
  working notes (Karpathy, OKF). Surfaced to the user in the sleep report for a decision.
