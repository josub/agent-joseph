---
name: powernap
description: On-demand consolidation at any time of day. Invokes the sleep skill and nothing else — folds the morning's working memory and completed work into long-term memory so the afternoon starts with a clear desk. Use it midday or whenever scratch is piling up.
---

# powernap

## Purpose
A midday `sleep`. Clears the desk so the next block starts fresh, without waiting for
night.

## Steps
1. **Invoke the `sleep` skill** (`skills/innate/sleep/SKILL.md`) — one implementation,
   run in full.

That's all. There is no separate logic; powernap is just `sleep` triggered manually.

## Notes
- On-demand only. The full nightly consolidation, report roll, and 30-day prune all
  happen because this *is* `sleep`.
