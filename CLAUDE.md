# CLAUDE.md — operating manual

This is the agent's brain: a folder system that mimics a human mind. Everything is plain
markdown; git is the substrate; **folder = state**. This is the **only `CLAUDE.md`** in
the repo (workflow stages use `CONTEXT.md` so Claude Code doesn't auto-load them).

**Read `identity.md` first** — it's who you are (purpose, personality, principles, and
hard Rules). Current goals are **not** there; they live in `work/missions/`.

---

## The brain map

| Human faculty | Folder | Notes |
|---|---|---|
| Self-model / identity | `identity.md` | Stable. Edited by `initiate-birth`. |
| Working memory (scratch) | `memory/working/` | Consolidated nightly, then moved to `memory/archive/`. |
| Consolidated scratch | `memory/archive/` | Dated folders; pruned after 30 days. |
| Episodic ("what happened") | `memory/episodic/` | Dated, append-only raw log + audit. |
| Semantic ("what I know") | `memory/semantic/` | Concept wiki + `type: convention` refs. Read `index.md` first. |
| Daily digests | `memory/reports/` | `latest/` = current cycle; rolled to dated folders. |
| Prospective ("what to do") | `work/` | missions (persistent) + tasks/alerts (flowing). |
| Output / craft ("what I made") | `projects/` | Durable deliverables, one folder per project. **Never flows**; work items point here via `output:`. |
| Procedural — abilities | `skills/` | `innate/` (ships) + learned themes. **No triggers.** |
| Procedural — habits | `routines/` | trigger → skill bindings. `active/` vs `inactive/`. |
| Procedural — multi-stage | `workflows/` | Reusable staged procedures. **ICM applies here only.** |
| Native skill exposure | `.claude/skills/` | Generated symlinks so Claude Code sees the brain's skills (excl. `draft_`/`_*` templates; anchors included). Synced by `scripts/sync-claude-skills.sh` (nightly via `sleep`, and on-promotion via `morning-review`). |
| Scheduling entry | `scripts/run-routine.sh` | Honors `.paused`. Cron/launchd opt-in. |

Three classes of procedural memory: **skills** (single abilities, no triggers),
**routines** (habits = trigger→skill), **workflows** (reusable multi-stage procedures).

---

## The daily rhythm

- **Day** — notes drop into `memory/working/`; proactive work into `work/tasks/` (via
  `add-task`); reactive events into `work/alerts/` (via `add-alert`).
  `start-work-session` sweeps intake, prioritizes, claims, and works items — routing a
  complex/reusable one through a **workflow** (start a run, or advance an in-flight run
  by one Verify-gated stage). Finished items → `work/completed/`. A midday `powernap`
  can consolidate early.
- **Night — `sleep`** (keystone) — working memory + completed work fold into
  `episodic/` + `semantic/`; scratch is archived (30-day retention); finished items move
  to `work/archived/`; the previous report cycle rolls to its dated folder and a fresh
  **sleep report** is written to `memory/reports/latest/`.
- **Morning — `morning-review`** — reads the sleep report, walks pending drafts for
  keep/edit/discard, sets focus, writes the **morning report**.
- **Occasionally — `deep-sleep`** — manual deep clean of the wiki.
- **As needed — `workflow-creator`** (author a procedure) · **`create-clone`** (spawn a
  new agent) · `add-task` / `add-alert` / `update-mission` / `initiate-birth`.

The three anchors (`sleep`, `morning-review`, `start-work-session`) are just files in
`routines/active/` that run innate skills. Everything else is on-demand.

---

## Guardrails (non-negotiable — see also `identity.md` ## Rules)

1. **Approval gate for consequential/irreversible actions** — payments, purchases,
   contracts, deleting anything outside an archive. Never do these unattended.
2. **Outbound comms are drafted, never auto-sent.** Don't speak as the user unreviewed.
3. **Archive, never hard-delete.** (The *only* exception: `sleep` pruning
   `memory/archive/` scratch older than 30 days.)
4. **Secrets only in `.env`** — never in memory, the wiki, any tracked file, or a clone.
5. **Audit everything autonomous to episodic.** Traceability.
6. **Gated self-modification** — new skills are `draft_` and inert; new routines born in
   `inactive/`; new workflows only via the user-invoked `workflow-creator` (no
   autonomous workflow creation in v1).
7. **Verify gates workflow advancement** — a run never advances unless the stage's
   Verify passes; a failed Verify halts the run and files an alert.
8. **Loop / blast guard** — no self-re-triggering work items; routines idempotent; one
   open continue-task per workflow run.
9. **Global pause switch** — a root `.paused` file halts all routine runs.

**Unattended (cron) runs** use *agent-prioritizes*, stage the plan / advance one stage,
and take **no** consequential or outbound action on their own — a human acts later.

---

## Conventions (single source of truth)

- **Folder = state** → idempotency for free.
- **Claim before work** — each work item is a folder; claim it with an atomic `.lock`
  inside it (before moving to `ongoing/`) plus a `claimed_by`/`claimed_at` frontmatter
  stamp, so a fleet never double-works an item. (See `work/README.md`.)
- **Deliverable ≠ work item** — durable output lives in `projects/<slug>/` (one folder per
  project), **not** inside the work item. The work item carries an `output:` pointer and
  flows on to `archived/<date>/` with only its record; the artifact stays put in `projects/`
  (never archived, never pruned), so it's always findable without knowing an archive date.
  Pointer, not copy. (See `projects/README.md`.)
- **Plain markdown**, git is the substrate.
- **Saving a memory → `memory/working/`.** When working in this repo and you want to
  persist a learning or fact, drop it into `memory/working/`; `sleep` consolidates it
  into episodic/semantic. **Don't** use the Claude Code harness memory store
  (`~/.claude/projects/.../memory/`) — Claude doesn't depend on it and it isn't
  versioned, shared, or consolidated; this brain is the single source of truth.
- **Working in an external repo (outside this brain):** the brain is the working
  directory (skills + memory loaded), but a sibling repo's own config is **not**
  auto-loaded. Before editing files there, read its **root** `CLAUDE.md`/`AGENTS.md`
  **and any nested `CLAUDE.md` in subdirectories you touch**, and note its git remote +
  default branch. Follow that repo's project conventions (build/test/commit, framework
  rules) for code in it; the brain's safety guardrails (approval gate, never auto-send,
  archive-not-delete) still apply on top.
- **Semantic memory:** one required field (`type`); **dedup by `source`**; **supersede,
  don't delete**. Given reference config (voice/style/design) lives here as
  `type: convention`.
- **Episodic = raw dated log/audit; reports = synthesized daily digests.** The semantic
  wiki additionally keeps one **wiki-level** `memory/semantic/log.md` — an append-only,
  machine-parseable changelog of knowledge-base changes (Karpathy-style `## [date] action
  | Title`), maintained by `sleep`/`deep-sleep` alongside `index.md`. No *per-folder*
  `log.md` anywhere else. (See `semantic/no-logmd-stance.md`.)
- **Skills are pure** (no triggers); **routines own triggers**; **workflow stages invoke
  skills**.
- **Innate vs learned skills** — innate ship in `skills/innate/`; learned acquired under
  a theme tree via the `draft_` review path.
- **`.claude/skills/` is generated, not authored** — it holds relative symlinks produced
  by `scripts/sync-claude-skills.sh` to expose the brain's skills (innate + learned) to
  Claude Code's native discovery. `skills/` stays the single source of truth. Excluded:
  inert `draft_` skills (guardrail 6) and templates (`_*`). Scheduled anchors (`sleep`,
  `morning-review`, `start-work-session`) **are** exposed — they keep running on the
  `run-routine.sh`/cron path and can also be invoked manually. **`sleep` runs the sync
  nightly** (step 5) and **`morning-review` runs it the moment it promotes a draft**, so
  promoted/new skills surface (immediately on promotion, else by next morning) and stale
  links are pruned automatically; never hand-edit the links.
- **ICM is scoped** — it governs `workflows/` only; the rest stays cyclic and native.
- **Workflow definition ≠ run** — definition in `workflows/` (factory, stable); a run is
  a work item in `work/` (the product). Inputs are **pointers, not copies** (resolved by
  `stage:` / `ref:` / `memory:` prefix).
- **Thin stages, fat skills** — a stage orchestrates + verifies; capability lives in the
  skill.
- **Verify gates advancement** — pass mints the next continue-task (or completes the
  run); fail halts + alerts.
- **Workflow instruction files are `CONTEXT.md`, never `CLAUDE.md`.** Workflows are
  **linear** in v1.
- **Identity is stable; goals are mutable** (`work/missions/`).
- **Guardrails above are non-negotiable.**

---

## Git & GitHub access

- **Use SSH for all GitHub access** — clone, fetch, push, and set remotes over
  `git@github.com:` URLs, never HTTPS. If a remote is HTTPS, switch it to SSH.
- **Use the `git` CLI (and `gh` for GitHub-specific operations), not the GitHub MCP
  server.** Run git/`gh` commands directly for PRs, issues, branches, and pushes.

---

## First run / after clone
See `README.md` → "After you clone". In short: rename the folder, copy
`.env.example` → `.env`, run `initiate-birth` to set identity, create a first mission,
adjust routine times, then work the rhythm. `create-clone` spawns more agents;
`workflows/create-blog-post/` + `skills/marketing/` are a **removable demo**.
