---
type: topic
title: Web UI Prototype Recipe
description: How we build a hi-fi UI prototype as one self-contained React+Tailwind HTML file (no build step) and prove it renders by screenshotting every screen in headless Chrome — including the Babel classic-runtime fix and the WCAG contrast pattern.
tags: [topic, ui, prototype, react, tailwind, puppeteer, accessibility, engineering-recipe]
source: lead-scanner-ui-prototype build (work/, 2026-06-23); captured in working note 2026-06-23-ui-prototype-build-lessons.md
created: 2026-06-24
updated: 2026-06-24
---

# Web UI Prototype Recipe

The engineering execution for turning a design brief into a runnable, hi-fi prototype: a
single `index.html` with no build step, styled to a supplied token doc, proven to render
via headless-browser screenshots. This is the *how-to-build*; the *how-to-design* is
[[design-method-distinctive-ui]]. Keep the two
separate — method and engineering recipe are distinct concerns.

## The single-file React + Tailwind recipe
- One `index.html`, no build step: React 18 UMD + ReactDOM + `@babel/standalone` + Tailwind
  **Play CDN**. Needs network (CDNs) but nothing installed — confirm reachability first.
- Map the design-system token doc into `tailwind.config = { theme: { extend: { colors,
  fontFamily } } }` in a `<script>` placed **after** the Tailwind CDN script. Then every
  value in the build is a named token (`bg-canvas`, `text-ink`, …). Load display + body
  fonts from Google Fonts as the closest substitutes for licensed faces (note the swap).
- Tailwind Play CDN styles React's dynamically-rendered classes via MutationObserver, so
  JIT/arbitrary values (`bg-coral/15`, `shadow-[…]`, `enabled:`/`disabled:` variants) work
  at runtime.

## Babel gotcha (the real time-sink — cost a debug cycle)
- `@babel/standalone`'s React preset defaults to the **automatic** JSX runtime → injects
  `import … from "react/jsx-runtime"` → dies in a classic `<script>`: *"Cannot use import
  statement outside a module."* The `<script type="text/babel">` auto-loader hits this too.
- **Fix:** keep JSX in a non-executing `<script type="application/x-jsx" id="app-src">`,
  then compile classic + run:
  `Babel.transform(src, { presets: [['react', { runtime: 'classic' }]] }).code`, then
  indirect `(0, eval)(out)`. Classic runtime uses `React.createElement` (global `React`).

## Screenshot verification (headless)
- `puppeteer-core` (no bundled Chromium) pointed at the installed Google Chrome via
  `executablePath`. Launch args `--use-fake-ui-for-media-stream --use-fake-device-for-media-stream`
  so `getUserMedia` resolves instead of prompting (Chrome's fake device draws a green test
  pattern — fine, it's just the camera fallback).
- Viewport 390×844 @2×. `waitForFunction` on a known selector before the first shot. Click
  screens by `aria-label` or button text. Subscribe to `pageerror`/`console[error]` and
  assert zero. **Read the PNGs back** to actually look — don't trust "no errors" alone.

## Accessibility floor (what bit / mattered)
- **Contrast pattern:** a bright brand accent can fail WCAG AA for white label text (coral
  `#cc785c` on white ≈ 3.3:1 — fails the 4.5:1 normal-text minimum). Use the design system's
  darker "active" shade (`#a9583e` ≈ 5:1) for filled *text* CTAs; reserve the bright accent
  for large labels (≥24px, 3:1 OK) and non-text accents.
- Gate all motion behind `@media (prefers-reduced-motion: no-preference)`, and use
  `motion-safe:` for Tailwind's built-in `animate-*` (they don't self-respect the pref).
- Bottom sheet = focus-managed `role="dialog" aria-modal`, Esc to close, focus moved in.
- 375px floor; `focus-visible` rings on every control; labelled inputs; landmarks.

## Process notes
- **Honor never-auto-send even in mocks** — phrase actions as "drafted"/"queued", never
  "sent". (Held in the lead-scanner build: email "drafted", LinkedIn "queued".)
- **Deliverable shape that worked:** `prototype/index.html` + `prototype/README.md` +
  `prototype/screenshots/` inside the work item.

## Related
- [[design-method-distinctive-ui]] — the design method this recipe executes.
- Draft skill `skills/design/draft_prototype-ui-artifact/` — the procedural form of this recipe (inert pending morning-review).

## History
- 2026-06-24 — Created from the `lead-scanner-ui-prototype` build (2026-06-23) and its
  working note, consolidated this cycle.
