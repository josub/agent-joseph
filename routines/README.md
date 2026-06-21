# routines/ — habits (trigger → skill bindings)

Thin bindings: a **trigger** fires a **skill**. Skills stay pure (no triggers); routines
own the triggering. Sorted by status:

| Folder | Meaning |
|---|---|
| `active/` | Live habits that fire on their trigger. |
| `inactive/` | Dormant routines, and where newly-confirmed routines are **born** — the folder mirror of the `draft_` prefix on skills. `morning-review` surfaces these for keep/edit/discard; activating one is moving its file to `active/`. |

## Triggers
**time** or **event**. In v1 almost everything is **time-based cron**, because reactive
behavior arrives as `work/alerts/` files swept by the time-based intake routine
(`start-work-session`). No event dispatcher is needed (out of scope).

## Routine file shape
```yaml
---
name: sleep
status: active
trigger:
  type: time          # time | event
  at: "23:00"
  # type: event
  # on: lead_replied
runs: skills/innate/sleep
---

<One line: what this habit is for.>
```

## Anchors that ship in `active/`
- `sleep.md` → time, night (`23:00`) → `skills/innate/sleep`
- `morning-review.md` → time, morning (`08:00`) → `skills/innate/morning-review`
- `start-work-session.md` → time, recurring daytime (every 2h, 09:00–18:00) →
  `skills/innate/start-work-session`. Because it advances any in-flight workflow run by
  one stage per pass, recurring runs naturally carry multi-day workflows forward.

The other innate skills (`initiate-birth`, `powernap`, `deep-sleep`, `add-task`,
`add-alert`, `update-mission`, `workflow-creator`, `create-clone`) are **on-demand** —
no active routine; the user invokes them directly.

Wiring is opt-in: `scripts/run-routine.sh` runs a routine; scheduling (cron/launchd) is
commented out by default. A root `.paused` file halts all routine runs.
