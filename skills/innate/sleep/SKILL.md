---
name: sleep
description: The keystone nightly consolidation. Folds the day's working memory and completed work into long-term episodic + semantic memory, archives scratch and finished items, detects patterns into draft skills / inactive routines, prunes old scratch, refreshes native skill exposure (`.claude/skills/`), rolls the report cycle, and writes a fresh sleep report. Idempotent. Runs at night; powernap invokes it on demand.
---

# sleep

## Purpose
Consolidate the day into long-term memory and produce the **sleep report** — the
night's output and the next morning's input. Idempotent (folder = state), so a re-run
is safe.

## Steps

### 1. Consolidate working memory
For each item in `memory/working/`:
- append an episodic entry to `memory/episodic/<today>.md` (what the note was);
- integrate its facts into `memory/semantic/` (one concept per file; **dedup by
  `source`**; **supersede, don't delete** — append to `## History`); update
  `index.md`;
- then **move** the item to `memory/archive/<today>/` (do **not** delete).

### 2. Sweep completed work
For each item in `work/completed/`:
- append an episodic entry ("did X");
- extract reusable knowledge into `semantic/`, **cited to the item**;
- move the whole folder to `work/archived/<today>/`.
Completed **workflow runs** are swept the same way — their `stages/` outputs are part
of the provenance. If a same-named item already sits in today's archive folder, append
a numeric suffix (the only place archived names are de-duped).

### 3. Detect patterns (gated growth)
Where a repeated activity suggests a reusable ability or habit:
- write a `draft_` skill to `skills/<theme>/draft_<name>/SKILL.md` with `origin: sleep
  <ISO>` + `created`. **It is inert** until `morning-review` promotes it.
- and/or add a new routine to `routines/inactive/`.
Never author a workflow autonomously (v1 — guardrail 6). Log each proposal to episodic.

### 4. Prune old scratch
Delete `memory/archive/<date>/` folders older than **30 days**. (This is the one place
the agent hard-deletes — only already-consolidated scratch past retention.)

### 5. Refresh native skill exposure
Run `scripts/sync-claude-skills.sh` to regenerate `.claude/skills/` — link any newly
added on-demand skill, prune links for removed skills, and re-exclude any skill that
became a routine anchor. Idempotent and non-consequential, so it is safe on unattended
runs. It exposes **on-demand** skills only; `draft_`/inert skills are never exposed
(guardrail 6).

### 6. Roll reports + write the sleep report
- If `memory/reports/latest/` still holds the **previous** cycle, move its files to
  `memory/reports/<its-cycle-date>/` — `<cycle-date>` is the date the reports
  themselves carry (local time at generation), **not** the clock now. If that dated
  folder already exists, suffix it: `<cycle-date>-duplicate`, then `-duplicate-2`, …
  **Never overwrite.**
- Write the fresh `memory/reports/latest/sleep-report.md` from
  `_TEMPLATE-sleep-report.md`: what was consolidated, new/updated knowledge, anything
  flagged, and what's pending review (draft skills, new inactive routines, ideas).
- Append a one-line summary to today's episodic.

### 7. Idempotency
Items already archived are skipped (folder = state). An in-flight workflow run still in
`work/ongoing/` is **left untouched** — only `completed/` is swept.

## Notes
# usually called by: routines/active/sleep.md (time, night) — and by the powernap skill.
