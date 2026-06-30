---
type: convention
title: Design Method — distinctive, brief-first UI
description: Our reusable design method for product UI — brief-first questionnaire, ground in the product's world, two-pass plan (tokens+signature → self-critique against the three AI defaults), build, Chanel cut. The reference the prototype recipe follows.
tags: [convention, design, ui, style-reference, method]
source: user-provided design-system prompt — dropped into memory/working/ 2026-06-23 (2026-06-23-design-system-prompt-saas.md)
created: 2026-06-24
updated: 2026-06-24
---

# Design Method — distinctive, brief-first UI

Our standing method for any product-UI work: act as a design lead who refuses templated
output and makes deliberate, product-specific choices about palette, type, and layout —
spending boldness in exactly one place. This is the **declarative reference** (the "how
we design"); the engineering execution lives in [[web-ui-prototype-recipe]]
and the procedural draft skill `prototype-ui-artifact`, both of which follow this method
rather than restate it.

## The method, in order
1. **Ask the brief first — never assume.** Before any code/design, get answers to at least
   1–4 (state assumptions for the rest):
   1. **Product** — what it does, its single most important job.
   2. **User** — primary user (technical/non-technical, role, context).
   3. **Tone** — how it should feel (calm / urgent / premium / playful / serious).
   4. **Stack** — framework, CSS approach, component library.
   5. **Mode** — light / dark / both.
   6. **References** — aesthetics to emulate or avoid.
   7. **Scope** — full app / single page / component this session.
2. **Ground in the product's world.** Distinctive choices come from the subject matter,
   the users' vocabulary, the domain artifacts — not generic defaults. State aloud the one
   concrete thing the product does, who's at the screen and what they need now, and the
   single job of this view. **Use real content throughout** — placeholder copy ("Lorem
   ipsum", "User Name", "Dashboard") produces generic design.
3. **Plan in two passes — never go straight to code.**
   - **Pass 1 — design plan:** a compact token system — **Color** (4–6 hex named by *role*:
     `surface`, `ink`, `accent`, `muted`, `danger`); **Type** (≥2 faces — a characterful
     display used with restraint + a complementary body, plus a utility face if data-heavy;
     define sizes/weights/line-heights); **Layout** (one-sentence structural concept + a
     brief ASCII wireframe of the key view); **Signature** (the single element the design is
     remembered by — specific to this product, not a general aesthetic move).
   - **Pass 2 — self-critique before building:** Does any part look like a different product
     with a similar brief? Is the palette deliberate or default? Is the type pairing specific
     to this tone? Is the signature actually distinctive or a common AI move? Revise, then
     follow the revised plan exactly — every value traces to a named token.
4. **Build**, then apply the **Chanel cut** — remove the one weakest/most generic element and
   say which. Screenshot and critique what you actually built, not what you intended.

## The three AI design defaults — avoid unless the brief explicitly calls for one
1. Warm cream background (~`#F4F1EA`) + high-contrast serif + terracotta accent.
2. Near-black background + a single acid-green or vermilion accent.
3. Broadsheet layout: hairline rules, zero border-radius, dense columns.
Legitimate for some briefs; never legitimate as defaults. If you drift toward one without
the brief asking, push past it.

## Design principles
- **The hero is a thesis** — open with the most characteristic thing in the product's world
  (a live data moment, a key number, an interactive element). A gradient stat block is the
  template answer; use only if genuinely best.
- **Typography carries personality** — a memorable, intentional scale, not a neutral vehicle.
- **Structure encodes meaning** — numbered markers / dividers / eyebrows must encode
  something true. Numbering only when order actually matters. Question every device: does it
  inform or just decorate?
- **Motion serves a purpose** — one orchestrated moment beats scattered effects; gratuitous
  animation reads as AI-generated.
- **Complexity matches the vision** — maximalist needs elaborate execution; minimal needs
  precision. Elegance is executing the chosen direction well, not splitting the difference.

## Writing in design (copy as design material)
- **Write from the user's side** — name things by what the user controls ("notifications",
  not "webhook config").
- **Active voice on actions** — "Save changes" not "Submit"; keep names consistent through
  the flow (a "Publish" button → a "Published" toast).
- **Specific over clever**; **errors direct, not apologetic** (what went wrong + how to fix);
  **empty states invite action**.
- **Sentence case throughout**, plain verbs, no filler; every element does exactly one job.

## Code-quality floor (deliver unasked)
- Responsive to 375px; visible keyboard `focus-visible` states on all controls;
  `prefers-reduced-motion` respected; semantic HTML (landmarks, correct heading hierarchy);
  WCAG AA color contrast. Watch CSS specificity conflicts (type-based `.section` vs
  element-based `.cta`) — a common source of silently broken padding/margins.

## Session format
1) ask the brief, 2) confirm product/user/scope, 3) share the plan (tokens+layout+signature,
no code yet), 4) run the self-critique and state revisions, 5) build, 6) state one thing
you'd cut and why. Keep planning/iteration mostly in thinking; surface to the user only at
reasonable confidence.

## Related
- [[web-ui-prototype-recipe]] — the engineering execution of this method.
- Draft skill `skills/design/draft_prototype-ui-artifact/` — procedural ability that follows this method (inert pending morning-review).

## History
- 2026-06-24 — Created from a user-provided SaaS design-system prompt captured 2026-06-23,
  consolidated this cycle. The originating note anticipated promotion to a `type: convention`.
