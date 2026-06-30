# Show a rendered artifact for UI/UX decisions (user preference)

Captured 2026-06-26 from the `contact-scanner` re-enrich-prompt session. User feedback on
*how to work*, confirmed explicitly ("it was great… I want to make sure we keep doing it
for these types of ui/ux decisions"). Raw scratch for `sleep` to consolidate into
`semantic/` — likely a `type: convention` on the UI/UX decision workflow.

→ Promotion candidate. Dedup by source = this session's confirmed preference; supersede,
don't delete. Companion to [[2026-06-23-ui-prototype-build-lessons]] (the engineering
recipe this preference operationalizes).

## The preference
For any user-facing **UI/UX decision**, don't have the user judge from prose or a static
mockup — build something **viewable and interactive** so they can see placement, states,
and behavior, then decide. This is now the default, not something to wait to be asked for.

**Why:** the user evaluates UI by seeing it rendered; concrete artifacts surface gaps an
abstract description misses (e.g. the "auto-scanned → suppress the prompt" edge case only
became obvious once rendered). Visual iteration (inline vs floating placement) let them
make fast, confident calls.

## How to apply
- Produce a **states gallery** (every state side-by-side) + a **live interactive instance**
  + **screenshots**. Headless Chrome works when there's no Playwright/Puppeteer driver:
  `--headless=new --screenshot --force-device-scale-factor=2`.
- When the real app can't easily reach the target state, build a **temporary demo
  route/harness** with seeded/canned data, then **delete it** once the decision is made
  and the feature is finalized.
- Offer **side-by-side comparisons** for placement/layout choices and let the user pick.
- Reach for the `prototype-ui-artifact`, `browser-self-qa`, and `verify` skills on UI work
  proactively.

## Note on memory location
User does **not** want this kind of note written to the Claude Code harness store at
`~/.claude/projects/.../memory/`; preferences/knowledge go into this brain's `memory/working/`
so `sleep` organizes them. (Keep future learnings here, not in the harness memory.)
