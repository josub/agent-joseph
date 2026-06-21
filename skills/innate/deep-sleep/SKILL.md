---
name: deep-sleep
description: An occasional, heavier-than-nightly deep clean of the semantic wiki. Inventories every concept for orphans, duplicates, contradictions, stale claims, and broken links; rebuilds index.md; repairs cross-links; applies safe fixes and routes the ambiguous to a report. Run manually now and then — not nightly, because it is expensive and over-eager cleaning can churn good pages.
---

# deep-sleep

## Purpose
A full inventory and clean of `memory/semantic/`. Deliberately **not** nightly: it is
expensive, and aggressive cleaning risks churning good pages, so a human runs it
occasionally.

## Steps
1. **Scan all of `semantic/`** for:
   - orphans (no inbound links, not in `index.md`);
   - duplicate concepts (same `source`);
   - contradictions and stale claims;
   - broken `[[links]]` / relative links;
   - missing pages referenced but never created.
2. **Rebuild `index.md`** from scratch (one section per type/category); repair
   cross-links; **propose merges** for duplicates (don't silently merge content).
3. **Apply safe fixes** (fix a broken link, add a missing index line). **Route anything
   ambiguous to the report** rather than auto-resolving — supersede, never delete.
4. **Write** `memory/reports/latest/deep-sleep-report.md` listing what was fixed and
   what needs a human decision. (It is archived with the next `sleep` cycle roll.) Log
   a one-line episodic entry.

## Notes
- On-demand only. Heavier than `sleep`; run sparingly.
