---
name: add-task
description: File ONE well-formed proactive task into work/tasks/. Runs a short interview (outcome, mission, priority, constraints), mints a unique kebab-case slug, copies the task template into a new item-folder, and fills task.md. Writes only to work/tasks/ — never alerts.
---

# add-task

## Purpose
Capture a single, proactive piece of work as a clean intake item. One task per run.

## Steps
1. **Short interview:**
   - Outcome / definition of done.
   - Mission (link an existing `work/missions/` slug, or none).
   - Priority (low | normal | high).
   - Any constraints or links.
2. **Surface prior art (recall).** Invoke the `recall` skill
   (`skills/innate/recall/SKILL.md`) on the proposed outcome to catch related semantic
   concepts, prior/related tasks, and working notes before filing. This goes beyond the
   name-clash check below — it finds *semantic* duplicates and reusable context. Surface
   findings to the user and link relevant ones in the new task's `references/` or
   frontmatter. Read-only; it informs, it never blocks filing.
3. **Mint a slug.** Choose a unique, descriptive kebab-case `<id>` from the outcome
   (e.g. `answer-email-from-customer-a`). Check it isn't already used anywhere in the
   **active pipeline** (`work/tasks/`, `work/alerts/`, `work/ongoing/`,
   `work/completed/`). On a collision, make it more specific (e.g. `...-customer-b`) or
   append a numeric suffix. Do **not** scan `work/archived/` — archived items live under
   date folders, so old names can't clash.
4. **Create the item.** Copy `work/tasks/_TEMPLATE/` to `work/tasks/<id>/` and fill its
   `task.md` (set `created` to now; leave the workflow/run/stage and claim fields
   commented). **Only if the user supplies files**, create `work/tasks/<id>/references/`
   and put them there.

## Notes
- On-demand only. **Never writes to `work/alerts/`.**
- Files just one task — to file several, run again per task.
