---
type: convention
title: log.md — our stance (resolved: wiki-level log.md adopted)
description: We initially omitted log.md entirely; resolved 2026-06-24 to adopt a single wiki-level log.md (memory/semantic/log.md, Karpathy-style) as the knowledge-base changelog. episodic/ + reports/ are unchanged.
tags: [convention, design-rationale, memory, resolved]
source: CLAUDE.md; contrasted with llm-wiki-karpathy + open-knowledge-format; resolved by user decision 2026-06-24
created: 2026-06-22
updated: 2026-06-24
---

# log.md — our stance (resolved)

**Current stance:** we keep a single **wiki-level** `log.md` at
[memory/semantic/log.md](log.md) — an append-only, machine-parseable changelog of the
knowledge base, in Karpathy's LLM-wiki style (`## [date] action | Title`). We do **not**
keep a `log.md` in every folder. The brain's whole-life audit (`memory/episodic/`) and
synthesized digests (`memory/reports/`) are unchanged and serve different jobs.

## How the three records divide
- **`memory/semantic/log.md`** — *changelog of the knowledge base*: what page was
  ingested / updated / superseded, and when. Reconstructs "what the brain learned, when"
  in one machine-readable file.
- **`memory/episodic/<date>.md`** — *whole-life audit*: everything the agent did (worked
  tasks, sent drafts, ran routines), not just knowledge events.
- **`memory/reports/`** — *synthesized digests*: the human-readable daily summary.

## Key points
- **Both source patterns prescribe `log.md`, at different strengths.** It is a **core**
  convention in [[llm-wiki-karpathy]] (part of the ingest
  loop, machine-parseable prefixes) and an **optional** file in
  [[open-knowledge-format]]. So `log.md` is more a Karpathy
  signature than an OKF one.
- **OKF compatibility never required this.** Because OKF makes `log.md` optional, our
  earlier no-`log.md` setup was already OKF-compatible. We adopted `log.md` for **Karpathy
  fidelity** and the practical value of a single, compact, machine-readable wiki changelog
  — not for interop.
- **What we deliberately did *not* do:** scatter a `log.md` into every folder (work/,
  skills/, …). That strawman is neither Karpathy's nor OKF's actual pattern. One
  wiki-level log, alongside `index.md`.

## Related
- [[log]] — the file this stance now mandates.
- [[filesystem-as-agentic-architecture]]
- [[llm-wiki-karpathy]]
- [[open-knowledge-format]]

## History
- 2026-06-24 — **Resolved (reversal).** User decided to adopt a single wiki-level `log.md`
  for Karpathy fidelity. Clarified that `log.md` is a *core* Karpathy convention but only
  *optional* in OKF (correcting an earlier framing), so OKF interop never depended on it.
  Created `memory/semantic/log.md` and wired `sleep` to maintain it. Page reframed from
  "we omit log.md" to "we adopted a wiki-level log.md"; filename kept for link stability.
- 2026-06-22 — Recorded during powernap as a deliberate omission; the divergence was
  flagged in two same-day working notes (Karpathy, OKF) and surfaced for a decision.
