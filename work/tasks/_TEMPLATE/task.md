---
type: task
mission: <slug>       # optional
source: user          # user | agent:<name>
status: new           # new | doing  (folder also encodes status)
priority: normal      # low | normal | high
created: <ISO>
# workflow:           # set only on workflow runs — the workflow definition slug
# run:                # set only on workflow runs — this run's id (usually the folder slug)
# stage:              # set only on workflow runs — the next stage to execute, e.g. 02-copywrite
# claimed_by:         # set at runtime when an agent takes this (concurrency)
# claimed_at:         # ISO time of claim
---

## Outcome
<What "done" looks like.>

## Notes
<Context, links, constraints. Drop supporting files in ./references/.>
