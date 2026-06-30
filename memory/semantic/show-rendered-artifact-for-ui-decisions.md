---
type: convention
title: Show a rendered artifact for UI/UX decisions
description: For any user-facing UI/UX decision, don't make Joseph judge from prose or a static mockup; build something viewable and interactive (states gallery + live instance + screenshots) so he can see placement, states, and behavior, then decide. This is the default, not on-request.
tags: [convention, design, ui, ux, prototype, workflow]
source: 2026-06-26 contact-scanner re-enrich-prompt session — user feedback confirmed explicitly ("I want to make sure we keep doing it for these types of ui/ux decisions")
created: 2026-06-29
updated: 2026-06-29
---

# Show a rendered artifact for UI/UX decisions

For any user-facing **UI/UX decision**, don't have Joseph judge from prose or a static
mockup. Build something **viewable and interactive** so he can see placement, states, and
behavior, then decide. This is now the default behavior, not something to wait to be asked
for. It is the decision-workflow companion to the engineering recipe in
[[web-ui-prototype-recipe]] and the design method in
[[design-method-distinctive-ui]].

**Why:** Joseph evaluates UI by seeing it rendered. Concrete artifacts surface gaps an
abstract description misses (e.g. the "auto-scanned → suppress the prompt" edge case only
became obvious once rendered). Visual iteration (inline vs floating placement) lets him make
fast, confident calls.

## How to apply
- Produce a **states gallery** (every state side-by-side) + a **live interactive instance**
  + **screenshots**. Headless Chrome works when there's no Playwright/Puppeteer driver:
  `--headless=new --screenshot --force-device-scale-factor=2`.
- When the real app can't easily reach the target state, build a **temporary demo
  route/harness** with seeded/canned data, then **delete it** once the decision is made and
  the feature is finalized.
- Offer **side-by-side comparisons** for placement/layout choices and let him pick.
- Reach for the `prototype-ui-artifact`, `browser-self-qa`, and `verify` skills on UI work
  proactively.

## Related
- [[web-ui-prototype-recipe]] — the engineering execution this preference operationalizes.
- [[design-method-distinctive-ui]] — the "how we design" reference.
- [[collaboration-with-joseph]] — same family of working-style preferences.

## History
- 2026-06-29 — Page created by `sleep` from the 2026-06-26 working note (re-enrich-prompt
  session), where Joseph confirmed the preference explicitly.
