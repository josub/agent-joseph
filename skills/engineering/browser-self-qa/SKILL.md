---
name: browser-self-qa
context: fork
description: >-
  Browser self-QA using the Playwright MCP server. Use after implementing,
  modifying, or scaffolding any web UI, page, component, or user-facing flow,
  and after large multi-step build tasks (e.g. "set up this app", building a UI
  from screenshots or a design). For substantial UI or multi-step work,
  proactively run a browser QA pass and report results; for smaller visible
  changes, offer to self-test before declaring the task done. Trigger whenever a
  coding task produces something a user could see or click in a browser, even if
  testing was not explicitly requested. Do NOT use for backend-only, non-visual,
  or trivial text changes.
origin: user-request 2026-06-26T11:18:42+0900
created: 2026-06-26T11:18:42+0900
---

# Browser Self-QA

Verify work in a real browser before a task is called done. This skill runs in a
forked context: it performs the QA pass and returns a findings report. It does NOT
fix code itself — fixes happen back in the main session.

## Decide whether to QA

- **Skip** — backend-only logic, config, docs, or a trivial text/style tweak with
  no behavioral effect. Don't mention QA.
- **Offer** — a single moderate UI change or one new component/handler. Finish the
  work, then ask: "Want me to open it in the browser and verify the <flow>?" Wait
  for a yes before running. Bias smaller changes toward offering, not auto-running.
- **Proactive (run without asking)** — reserve the full pass for high-value cases:
  - New page, route, or multi-step flow (auth, checkout, forms, wizards)
  - A UI built from screenshots, a design, or a vague "set up this app" task
  - Changes spanning several files or components
  - Anything involving responsive layout or visual correctness

  Run the QA pass, then report. Briefly say you're verifying before you start.

## Prerequisites

1. Confirm the Playwright MCP server is connected and its browser tools are
   available. If not, tell the user to run
   `claude mcp add --scope user playwright npx @playwright/mcp@latest`, restart,
   then stop.
2. Determine the app URL. Prefer an already-running dev server (e.g.
   http://localhost:3000). If none is running, ask the user to start it (or start
   the repo's known dev script in the background) and wait until it responds
   before navigating.
3. Use fully-qualified Playwright MCP tool names so the correct tools resolve.

## QA pass (runs in the fork)

1. Navigate to the relevant URL — the specific thing just changed, not the whole
   app.
2. Exercise the actual path built: click, type realistic test data, submit, and
   assert the expected result (success message, new state, navigation).
3. For anything visual, test viewports explicitly — default is desktop. Check
   375px (mobile), 768px (tablet), and 1440px (desktop) and note layout breaks.
   Skip the sweep if the change isn't responsive.
4. Check the browser console for errors and failed network requests on each key
   screen.
5. Capture a screenshot at each major step for visual confirmation.

## Return a report (not fixes)

Hand back a concise findings report to the main session:
- A checklist: path/viewport → pass/fail.
- For each failure: what broke, where (selector/screen), and how to reproduce.
- Screenshots or console output only for failures — don't dump passing snapshots.

The main session then fixes any bugs and re-invokes this skill to confirm. Cap at
2–3 verify→fix→reverify cycles; if something still fails, stop and surface it for
the user to decide.

## Promote stable flows to test files

Once a flow passes reliably, offer to generate a Playwright spec (via `--codegen`
or by writing a `.spec.ts`) so future regression checks run with
`npx playwright test` in CI instead of re-driving the browser through MCP. This
moves recurring QA off the token budget.

## Guardrails

- Dev/staging only, with test data — everything the browser sees is sent to the
  API. Never point this at production or real user data.
- Keep it scoped to the change at hand, not an exhaustive crawl. Hold a clear stop
  condition so a pass can't run away with tokens.
- One browser context per task; don't reuse a session across unrelated checks.
