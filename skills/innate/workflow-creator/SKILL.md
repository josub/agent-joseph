---
name: workflow-creator
description: Author a new multi-stage workflow definition via a guided questionnaire. Use when a task is genuinely sequential, reusable, and benefits from review gates between stages. Produces a complete definition in workflows/<name>/ — a router CONTEXT.md plus per-stage Inputs/Process/Outputs/Verify contracts. The questionnaire IS the human approval; there is no draft gate.
---

# workflow-creator

## Purpose
Turn a repeatable, multi-stage deliverable into a reusable workflow **definition** (the
factory). A *run* of it is an ordinary work item, handled by `start-work-session`.

**Read `workflows/GUIDE.md` first** — it explains what makes a good workflow.

## Steps

### 1. Discovery questionnaire
- What **deliverable** does this produce, and will you run it again (reusable)?
- What are the natural **stages** — the points where you'd want to review before moving
  on?
- For each stage, **in order**:
  - **Inputs** — which prior stage's output (`stage:<NN-prev>/output/`), plus which
    references: workflow-scoped (`ref:<file>`) or a `memory/semantic/` convention
    (`memory:semantic/<slug>.md`).
  - **Process** — the rules, and which **skill(s) or script(s)** it should invoke.
  - **Output** — the artifact it writes.
  - **Definition of done** — becomes the **Verify** section.
- Which references are **shared across stages** (→ `workflows/<name>/references/`) vs.
  **cross-cutting** (→ `memory/semantic/` as `type: convention`)?

### 2. Name it
Mint a unique kebab-case workflow name; check `workflows/` for a collision.

### 3. Write the definition
Copy `workflows/_TEMPLATE/` → `workflows/<name>/`. Then write:
- the **router** `CONTEXT.md` — one-line `## Description` (used for discovery), the
  ordered stage list, shared references, and the run model;
- each stage's `NN-<name>/CONTEXT.md` — **Inputs / Process / Outputs / Verify** from the
  answers.
Defaults and discipline:
- Default **Verify** to "output exists and is non-empty" where the user didn't specify;
  **prefer cheap deterministic checks**, adding a semantic self-check where quality
  matters.
- Keep stages **thin** — orchestration that *invokes* skills, never reimplemented
  capability ("thin stages, fat skills").
- Keep the workflow **linear** (v1 — no mid-pipeline branching).
- Put shared references in `workflows/<name>/references/`; remove the unused
  `references/.gitkeep` only if you add real files.

### 4. Missing capability
If a stage needs a **skill that doesn't yet exist**, note it for the user to provide
(or hand off to a skill-authoring path). **Do not silently auto-create capability.**

### 5. Record
Log the creation in episodic. **No draft gate** — the questionnaire *is* the human
approval. (Autonomous workflow proposal by `sleep` is out of scope for v1.)

## Notes
- On-demand, user-invoked only.
