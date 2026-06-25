# projects/ — durable output ("what I made")

The **finished-goods shelf**. Where the durable *deliverables* of work live, separated
from the work item's flowing process state. This is the work-output analog of
`memory/semantic/`: `work/` flows and is archived; `projects/` is **kept, in place**.

| | `work/` | `projects/` |
|---|---|---|
| Holds | the *task* — what to do + the record of doing it | the *deliverable* — what the work produced |
| Lifecycle | flows `tasks → ongoing → completed → archived/<date>/` | **never flows** — kept in place, not archived, not pruned |
| Found by | (archived items found by date) | a stable slug you can always navigate to |

## Each project is a folder
A stable, descriptive kebab-case **slug** names the folder
(e.g. `tessera-lead-scanner`) and holds the deliverable(s) of one project or a family of
related work — whatever shape the output takes (a `prototype/`, a document, a dataset, a
site). One project may collect several related runs over time.

## The pointer rule (work item → project)
The deliverable lives **only** here; the work item that produced it does **not** carry a
copy. Instead the work item's content file (`task.md` / `alert.md`) records a pointer:

```yaml
output: projects/<slug>/        # where the deliverable lives
```

So when `sleep` sweeps the completed item to `work/archived/<date>/`, only the
lightweight *record* goes to cold storage — the deliverable stays here, where you can
always find it without knowing an archive date. This mirrors the brain's existing
"inputs are pointers, not copies" convention.

## Who writes here
Any skill or in-session work that produces a durable deliverable lays it down in
`projects/<slug>/` and leaves the `output:` pointer in the work item — never inside the
work folder. See `skills/innate/start-work-session/SKILL.md` (general convention),
`skills/design/prototype-ui-artifact/SKILL.md` (a producer), and the brain map in
`CLAUDE.md`.

## What does *not* belong here
- **Knowledge** (facts, concepts, references) → `memory/semantic/`.
- **The task record / process state** → `work/`.
- **Throwaway scratch** → `memory/working/`.
`projects/` is for the artifacts you'd want to show someone.
