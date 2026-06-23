---
name: prototype-ui-artifact
description: Build a hi-fi, interactive UI prototype as a single self-contained React + Tailwind HTML file, styled to a given design-system/token doc, then verify it renders by screenshotting every screen in headless Chrome. Use when asked to design/prototype an app or page UI as a runnable artifact (not a production app). Takes a token doc + a flow/screens spec as input.
origin: user-request 2026-06-23T15:35:00+0900
created: 2026-06-23T15:35:00+0900
---

# prototype-ui-artifact

## Purpose
Turn a design brief into a runnable, hi-fi prototype: one self-contained `index.html`
(React + Tailwind, no build step) that walks the real flow, styled to a supplied design
system, and proven to render via headless-browser screenshots. This is the engineering
recipe; the *design method* lives in the design-system-prompt convention (see Notes),
which this skill follows but does not restate.

## Inputs (resolve before building)
- **Design system** — a token doc (e.g. a `DESIGN-*.md` with colors/type/radii). Map it,
  don't invent values.
- **Flow / screens** — the screens and the transitions between them.
- **Fidelity & format** — confirm hi-fi vs lo-fi and the artifact format (default:
  single-file React + Tailwind).

## Steps
1. **Run the design method first** (don't skip to code). Follow the design-system-prompt
   convention: state the product/user/job, produce a compact token+layout+signature plan,
   self-critique against the three AI defaults, then build the revised plan. Use real
   content throughout — never "Lorem ipsum" / "User Name".
2. **Map the token doc into a Tailwind config** in the `<head>` (`tailwind.config = {…}`
   with `theme.extend.colors` named by role + `fontFamily`). Every color/type value in the
   build then traces back to a named token. Load display + body fonts from Google Fonts as
   the closest substitutes for any licensed faces (note the substitution).
3. **Build one self-contained `index.html`:** React 18 UMD + ReactDOM + Babel-standalone +
   Tailwind Play CDN, all from CDNs. One screen rendered at a time inside a phone shell
   (`max-w-[400px]`, device frame at `sm:`). App-pattern components a marketing doc won't
   cover: camera viewfinder, editable review form, floating CTA, and a bottom sheet as a
   focus-managed `role="dialog"` (Esc closes, focus moved in).
4. **Honor the code-quality floor unprompted:** responsive to 375px; visible
   `focus-visible` rings on every control; gate ALL motion behind
   `prefers-reduced-motion` (and `motion-safe:` for Tailwind animations); semantic
   landmarks + labelled inputs; WCAG AA contrast.
5. **Mock external actions** — never wire real sends. Phrase outcomes honestly
   ("drafted", "queued") per the never-auto-send rule, even in a prototype.
6. **Verify by screenshot** (see recipe in Notes). Drive the installed Chrome with
   puppeteer-core, click through every screen, screenshot each, and read the PNGs back.
   Fix anything that doesn't render before declaring done.
7. **Lay down the deliverable** in the work item: `prototype/index.html`, a short
   `prototype/README.md` (how to run + token/design notes), and `prototype/screenshots/`.

## Notes
# usually called by: ad hoc (user request) / a future design workflow stage
- **DRAFT / inert** — created on user request 2026-06-23 after a one-off lead-scanner
  prototype. Gated until `morning-review` promotes or discards it (guardrail 6); not
  exposed to Claude Code while `draft_`.
- **Design method is a separate concern** — see the working note
  [[2026-06-23-design-system-prompt-saas]] (headed for `semantic/` as a `type: convention`
  via `sleep`). This skill *references* it; it does not duplicate the philosophy.
- **Babel gotcha (cost a debug cycle):** `@babel/standalone`'s React preset defaults to
  the *automatic* JSX runtime, which injects `import …/jsx-runtime` and dies in a classic
  `<script>` ("Cannot use import statement outside a module"). Fix: keep the JSX in a
  non-executing `<script type="application/x-jsx" id="app-src">`, then compile with the
  **classic** runtime and run it:
  `Babel.transform(src, { presets: [['react', { runtime: 'classic' }]] }).code` → indirect
  `(0, eval)(out)`.
- **Screenshot-verify recipe:** `puppeteer-core` (no bundled browser) pointed at the
  installed Chrome via `executablePath`; launch with
  `--use-fake-ui-for-media-stream --use-fake-device-for-media-stream` if the page calls
  `getUserMedia`; viewport `390×844 @2×`; `waitForFunction` on a known selector before
  shooting; click screens by `aria-label` or button text; capture `pageerror`/`console`
  errors and assert none. Network is required (CDNs); confirm reachability first.
- **Contrast fix pattern:** a brand accent that fails AA for white label text (e.g. a
  coral at ~3.3:1) → use the design system's darker "active" shade for filled *text*
  CTAs (clears 4.5:1) and reserve the bright accent for large labels + non-text accents.
- **Chanel cut** — before delivering, remove the weakest/most generic element and say
  which, per the design method.
