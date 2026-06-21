---
name: morning-review
description: The agent's "waking" routine. Reads last night's sleep report, walks every pending draft skill and new inactive routine for keep/edit/discard, sets the day's focus from missions, and writes the human-readable morning report. Runs each morning; also runnable on demand.
---

# morning-review

## Purpose
Turn the night's sleep report into an actionable, human-readable day plan, and gate
the agent's self-modification (drafts) through explicit user decisions.

## Steps
1. **Read** `memory/reports/latest/sleep-report.md` (the night's output, the morning's
   input). If `latest/` also holds a `deep-sleep-report.md`, read that too.
2. **Walk pending drafts (gated growth).** Find them by scanning the **filesystem**, so
   nothing is missed even after a skipped day:
   - draft skills: every `skills/**/draft_*/SKILL.md`, **oldest first** (by `created`,
     falling back to file mtime);
   - new routines in `routines/inactive/`.
   For each, show what it does, its `origin`, and its content, then ask **keep / edit /
   discard** and apply the draft lifecycle (see `skills/README.md`):
   - **keep** → collision-check the name (merge/rename on conflict), strip the
     `draft_` prefix;
   - **discard** → delete + note "built draft_X, declined" in episodic;
   - **edit-then-keep** → let the user edit, then promote.
   Promoting a skill ≠ scheduling it: wiring a routine/stage to call it is a **separate**
   confirmation (move the routine to `routines/active/`).
3. **Set focus.** Read `work/missions/` to choose today's mission(s) in focus, then pull
   priorities by handing off to / mirroring `start-work-session` (the open set ranked).
4. **Write** `memory/reports/latest/morning-report.md` from the
   `_TEMPLATE-morning-report.md` shape: yesterday's wins, draft decisions, today's
   focus, prioritized work, and anything needing the user. Log a one-line episodic
   entry that the morning review ran.

## Notes
# usually called by: routines/active/morning-review.md (time, morning)
- Drafts never expire — a late review still catches old ones.
