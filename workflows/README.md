# workflows/ — multi-stage procedures (scoped ICM)

A **workflow** is a reusable, **linear**, multi-stage procedure for a complex
deliverable (e.g. "create a website"). This is the **only** place ICM applies: numbered
stages, each a plain **input → process → output** contract with a **Verify** step.
Everything else in the brain stays cyclic and native.

> **Cardinal rule: the definition is the factory; a run is the product, and a run is a
> work item.** The *definition* lives here in `workflows/<name>/` and never holds run
> data. A *run* lives in `work/ongoing/<run>/` and flows like any other work item, so
> `sleep` sweeps and archives it for free. **They are never mixed.**

To author one, use the `workflow-creator` skill (read `GUIDE.md` first).

## The definition (`workflows/<name>/`) — reusable, stable, no run data
- `CONTEXT.md` — the **router**: a one-line `## Description` (used for discovery by
  `start-work-session`), the ordered stage list, shared references, and the run model.
- `references/` — optional Layer-3 material used by more than one stage of *this*
  workflow (e.g. a voice guide). Stored once; stages point at it.
- `NN-stage-name/CONTEXT.md` — one per stage: the **contract** (Inputs / Process /
  Outputs / Verify).

> Instruction files here are **`CONTEXT.md`, never `CLAUDE.md`** — Claude Code
> auto-loads every `CLAUDE.md`, which would defeat ICM's per-stage scoping. The root
> `CLAUDE.md` is the only one in the repo.

## The run (`work/ongoing/<run>/`) — created per use
A run is an ordinary work item whose `task.md` carries `workflow:` / `run:` / `stage:`.
It holds optional per-run source in `references/` and a `stages/` tree of outputs:

```
work/ongoing/blog-acme/
├── task.md                  # workflow: create-blog-post · run: blog-acme · stage: 02-copywrite
├── references/              # per-run source ("write a post like X"), optional
└── stages/
    ├── 01-research/output/...
    ├── 02-copywrite/output/...
    └── 03-pdf/output/...
```

## Three tiers of reference, by reuse scope
| Reference | Lives in | Loaded by |
|---|---|---|
| Per-run source (this run only) | the run's `references/` | the stage that needs it |
| One workflow only | `workflows/<wf>/references/` | that workflow's stages |
| Cross-cutting (voice, style, design) | `memory/semantic/` as `type: convention` | any workflow's stages |

## Path resolution — Inputs are pointers, not copies
| Prefix | Resolved against | Resolves to |
|---|---|---|
| `stage:` | the **run** | `work/ongoing/<run>/stages/<NN>/output/` |
| `ref:` | the **definition** | `workflows/<wf>/references/<file>` |
| `memory:` | repo root | `memory/<path>` |

## How a run executes
**Starting a run** (from `start-work-session` step 4b, match found):
1. Mint a unique run id (kebab-case, e.g. `blog-acme`); create the work item in
   `work/ongoing/<run>/` and claim it (3.3 protocol).
2. Write `task.md` with `workflow: <name>`, `run: <run>`, `stage: 01-<first>`, plus the
   outcome. Drop any user-supplied source into the run's `references/`.
3. Execute stage `01`.

**Executing a stage** (`<NN>` from the run's `stage:` field):
1. Read the stage's `CONTEXT.md` from the **definition**. Load **only** the Inputs it
   names (resolve by prefix).
2. Apply Process: the stage's rules, invoking the named skill(s)/script(s).
3. Write Outputs into the **run** at `stages/<NN>/output/`.
4. Run **Verify**.

**Verify — the advancement gate** (replaces vanilla ICM's human review gate; the
brain's defense against stage drift when running unattended). Two flavors used together:
*deterministic* (script-checkable: file exists/non-empty, length, links resolve, schema
valid) and *semantic* (LLM self-check: matches the convention, covers the brief, no
placeholders).
- **Pass + more stages remain** → set `stage:` to the next stage and mint a
  **continue-task**: a normal `task.md` in `work/tasks/` carrying the same
  `workflow:`/`run:`/`stage:` pointers (**one open continue-task per run** at a time).
  Stop. The next `start-work-session` resumes there. (Async review: a human may edit
  `stages/<NN>/output/` before the continue-task runs.)
- **Pass + last stage** → move the whole run from `ongoing/` to `completed/` (no
  continue-task). `sleep` archives it and extracts knowledge.
- **Fail** → do **not** create a continue-task. File an `alert` describing what failed,
  leave the run in `ongoing/`, and log to episodic. A human resolves it.
