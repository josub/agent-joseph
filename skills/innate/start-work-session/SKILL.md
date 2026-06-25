---
name: start-work-session
description: Begin a block of work. Reads the open set of unclaimed tasks and alerts, lets you prioritize (or auto-prioritizes), claims an item with an atomic lock, and routes it — resuming an in-flight workflow run, starting a matching workflow, suggesting workflow-creator, or just doing it in-session. Runs on a recurring daytime schedule and is runnable manually for an interactive session.
---

# start-work-session

## Purpose
Choose what to work on next, claim it safely (multi-agent), and route it to the right
execution path. One ability serves both the recurring cron pass and a manual session.

## Steps

### 1. Build the open set
The open set = all **unclaimed tasks and alerts** in `work/tasks/` + `work/alerts/`
(handling an alert is a valid session action). **Pre-filter** anything already holding
a `.lock`. *(Optionally check external sources read-only here and file new alerts via
`add-alert` — never send anything.)*

### 2. Offer a mode
- **Agent prioritizes** *(recommended / default)* — rank the whole open set by mission
  urgency, item priority, age, and dependencies; recommend an ordered shortlist and a
  top pick, each with a one-line rationale. **Give workflow continue-tasks (in-flight
  runs) a priority bump** so started work finishes before new work begins.
- **Pick from list** — show the open set (mission, priority, age); the user selects one.
- **Pick by name** — the user types the task/alert name directly.
- **Do all (sequential)** — work the entire open set, but strictly **one item at a
  time**: claim → finish (or explicitly defer) → next. **Never parallel** — sequential
  processing avoids context bleed and hallucination.

### 3. Claim the chosen item (3.3 protocol)
1. Atomically create the lock: `mkdir work/<tasks|alerts>/<id>/.lock` (fails if it
   exists — the race gate).
2. Stamp the content file's frontmatter: `status: doing`, `claimed_by: <agent-id>`
   (e.g. `agent-joe`, or `hostname:pid`), `claimed_at: <ISO 8601>`.
3. Move the whole folder to `work/ongoing/<id>/` (any `references/` travel with it).

### 4. Prime from memory (recall)
Before executing the claimed item, invoke the `recall` skill
(`skills/innate/recall/SKILL.md`) on the item's topic to surface what the brain already
knows — relevant semantic concepts, today's working notes, and (on demand) prior episodic
decisions. Carry the returned resources into execution so work doesn't start cold.
Applies whether the item routes to in-session work, a fresh workflow run, or a resumed
continue-task. Read-only, so it's safe on the cron pass — though a pure staging pass that
defers execution to a human can skip it.

### 5. Route the claimed item
- **(a) Workflow continue-task** — frontmatter has `workflow:` / `run:` / `stage:` →
  **resume** that run: execute the named stage per its contract (read Inputs, apply
  Process, write Outputs, run Verify — see `workflows/README.md`), then advance per the
  Verify outcome. Done for this item.
- **(b) Fresh task** — check `workflows/` for a matching definition by reading each
  workflow's `CONTEXT.md` `## Description` (same discovery pattern as skills):
  - **Match found** → offer to run it: create the run ("Starting a run" in
    `workflows/README.md`) and execute stage `01`.
  - **No match, and the task is multi-stage** (more than one input→process→output
    cycle) **AND likely reusable or high-stakes** enough to want review gates →
    **suggest `workflow-creator`**. **If unsure whether it qualifies, ask the user.**
  - **Otherwise** (single-cycle, or one-off) → just do the task in-session.

**Durable deliverables go to `projects/`, not the work item.** Whichever route runs, any
output worth keeping (a prototype, document, dataset, site) is laid down in
`projects/<project-slug>/` and the work item's content file gets an `output: projects/<slug>/`
pointer. The work item flows on to `completed/` then `archived/<date>/` carrying only the
record + pointer — the artifact stays in `projects/` where it's always findable. See
`projects/README.md`.

### 6. Losing the claim
If the `.lock` create fails, another agent took it between selection and claim. The
loser never moves the folder, and recovers by who made the choice:
- **Agent chose** (agent-prioritizes / do-all): silently drop it and claim the
  next-best item on the ranked list. Only report if the whole list is exhausted
  ("nothing available").
- **User chose** (pick-from-list / pick-by-name): **don't substitute** — tell the user
  it was just claimed (by whom + when, read from the content file's frontmatter) and
  re-present the now-current available list to pick again.

### 7. Report
Report what was started / the prioritized plan.

## Notes
# usually called by: routines/active/start-work-session.md (time, recurring daytime)
- **Manual run = interactive** (asks which mode; default *agent prioritizes*).
- **Unattended / cron run** uses *agent prioritizes*, stages the ranked plan, advances
  any in-flight workflow run by one stage, and — per guardrails — **takes no
  consequential action on its own** (no payments, no outbound sends); a human acts on
  the staged plan later.
