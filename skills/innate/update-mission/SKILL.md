---
name: update-mission
description: Edit a mission in work/missions/ in place — update progress, status, current state, or open threads, and optionally append a milestone to episodic. Missions are persistent goals that never flow through the work pipeline; this is the only way they change.
---

# update-mission

## Purpose
Keep a persistent goal current. Missions are the agent's mutable focus (identity stays
stable); they **never flow** through `tasks → ongoing → completed`.

## Steps
1. **Pick the mission** in `work/missions/` (by slug/title). If creating a brand-new
   one, copy `work/missions/_TEMPLATE.md` to `work/missions/<slug>.md` first.
2. **Edit in place:** update `## Current state`, `## Open threads`, and `status`
   (active | paused | completed) as needed; bump `updated`; append a dated line to the
   mission's own `## History`.
3. **Optionally** append a milestone to today's `memory/episodic/<YYYY-MM-DD>.md` (e.g.
   a status change or a significant completion).

## Notes
- On-demand, user-run. **Never moves a mission through the work flow** — missions live
  outside it.
