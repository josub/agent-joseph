---
name: add-alert
description: File ONE well-formed reactive alert into work/alerts/. Runs a short interview (what happened, source, what response it needs, priority), mints a unique kebab-case slug, copies the alert template into a new item-folder, and fills alert.md. Writes only to work/alerts/ — never tasks.
---

# add-alert

## Purpose
Capture a single, reactive event as a clean intake item. One alert per run. This is how
reactive behavior enters the brain — there is no real-time event dispatcher; alerts are
swept by the time-based `start-work-session` routine.

## Steps
1. **Short interview:**
   - What happened (the event).
   - Source (email | order | system | agent:<name>).
   - What response or action it needs.
   - Priority (low | normal | high).
2. **Mint a slug.** Choose a unique, descriptive kebab-case `<id>` from the event
   (e.g. `order-1234-payment-failed`). Check it isn't already used anywhere in the
   **active pipeline** (`work/tasks/`, `work/alerts/`, `work/ongoing/`,
   `work/completed/`). On a collision, make it more specific or append a numeric suffix.
   Do **not** scan `work/archived/`.
3. **Create the item.** Copy `work/alerts/_TEMPLATE/` to `work/alerts/<id>/` and fill
   its `alert.md` (set `created` to now; leave the claim fields commented). **Only if
   the user supplies files**, create `work/alerts/<id>/references/` and put them there.

## Notes
- On-demand only. **Never writes to `work/tasks/`.**
- Files just one alert per run.
