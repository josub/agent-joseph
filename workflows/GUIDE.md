# GUIDE — how to author a good workflow

Read this before running `workflow-creator`. It captures the judgment that makes a
workflow worth having (the mechanics are in `README.md`).

## When a workflow is the right tool
A workflow earns its keep only when **all** of these hold:
- **Multi-stage** — more than one input→process→output cycle, with natural points where
  you'd want to review before moving on.
- **Reusable** — you'll run it again on different inputs. A one-off is just a task.
- **Worth review gates** — high-stakes or drift-prone enough that a per-stage **Verify**
  saves you from compounding errors.

If a task is single-cycle or one-off, **just do it in-session** — don't make a workflow.
If you're unsure whether it qualifies, ask the user.

## Design principles
- **Thin stages, fat skills.** A stage *orchestrates* (rules + skill/script
  invocations) and *verifies*. Capability lives in the **skill**. Never reimplement an
  ability inside a stage's Process.
- **Linear only (v1).** No mid-pipeline branching. If work forks, a human chooses the
  next run between stages.
- **Stages = review boundaries.** Cut a new stage exactly where a human (or Verify)
  should be able to inspect output before the next step consumes it.
- **Inputs are pointers, not copies.** Name them with `stage:` / `ref:` / `memory:`
  prefixes (see the resolution table in `README.md`). A stage loads *only* what it
  declares.
- **Reference at the right tier.** Per-run source → the run's `references/`. Used by
  several stages of this one workflow → `workflows/<name>/references/`. Cross-cutting
  (voice/style/design, reused across workflows) → `memory/semantic/` as
  `type: convention`.

## Writing a good Verify
Verify is the advancement gate — with no human at each stage, it's what stops drift.
- **Prefer cheap deterministic checks**: file exists and is non-empty, length within
  bounds, links resolve, schema valid, required sections present.
- **Add a semantic self-check** where quality matters: matches the convention/voice,
  covers every point of the brief, no placeholder text left.
- Default to "output exists and is non-empty" when nothing better is specified — but
  push for something stronger on stages that produce the real value.
- A Verify **fail** halts the run and files an alert; it must describe *what* failed
  clearly enough for a human to fix the output or amend the stage.

## Capability gaps
If a stage needs a skill that doesn't exist yet, **note it for the user** — don't
silently auto-create capability. Provide the skill (or hand off to a skill-authoring
path), then wire the stage to invoke it.

## A good shape to copy
See `create-blog-post/` (the removable demo): a skill+reference stage (`02-copywrite`),
a purely mechanical script stage (`03-pdf`), the Inputs-pointer convention, and a
per-stage Verify on each.
