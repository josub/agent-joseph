---
type: alert
source: email         # email | order | system | agent:<name>
mission: <slug>       # optional; usually empty for alerts
status: new
priority: normal
created: <ISO>
# claimed_by:         # set at runtime when an agent takes this (concurrency)
# claimed_at:         # ISO time of claim
---

## What happened
<The event.>

## Needs
<What response or action this calls for. Supporting files go in ./references/.>
