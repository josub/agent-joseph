# UI prototype build — reusable lessons

Captured 2026-06-23 from the `lead-scanner-ui-prototype` task. Raw knowledge for `sleep`
to consolidate into `semantic/` (likely a `type: convention` or `type: topic` on
"self-contained web prototypes" + "screenshot verification"). Companion to the new draft
skill `skills/design/draft_prototype-ui-artifact/`.

→ Promotion candidate. Dedup by source = this build; supersede, don't delete.

## The single-file React + Tailwind recipe
- One `index.html`, no build step: React 18 UMD + ReactDOM + `@babel/standalone` +
  Tailwind **Play CDN**. Needs network (CDNs) but nothing installed.
- Map the design-system token doc into `tailwind.config = { theme: { extend: { colors,
  fontFamily } } }` set in a `<script>` AFTER the Tailwind CDN script. Then every value
  in the build is a named token (`bg-canvas`, `text-ink`, etc.).
- Tailwind Play CDN styles React's dynamically-rendered classes via MutationObserver, so
  JIT/arbitrary values (`bg-coral/15`, `shadow-[…]`, `enabled:` / `disabled:` variants)
  work at runtime.

## Babel gotcha (the real time-sink)
- `@babel/standalone`'s React preset defaults to the **automatic** JSX runtime →
  injects `import … from "react/jsx-runtime"` → dies in a classic `<script>`:
  *"Cannot use import statement outside a module."* The `<script type="text/babel">`
  auto-loader hits this too.
- **Fix:** put JSX in a non-executing `<script type="application/x-jsx" id="app-src">`,
  then compile classic + run:
  `Babel.transform(src, { presets: [['react', { runtime: 'classic' }]] }).code` then
  indirect `(0, eval)(out)`. Classic runtime uses `React.createElement` (global React).

## Screenshot verification (headless)
- `puppeteer-core` (no bundled Chromium) + the installed Google Chrome via
  `executablePath`. Launch args `--use-fake-ui-for-media-stream
  --use-fake-device-for-media-stream` so `getUserMedia` resolves instead of prompting
  (Chrome's fake device renders a green test pattern — fine, it's just the camera fallback).
- Viewport 390×844 @2×. `waitForFunction` on a known selector before the first shot.
  Click screens by `aria-label` or button text. Subscribe to `pageerror`/`console[error]`
  and assert zero. Read the PNGs back to actually look.

## Accessibility floor that bit / mattered
- **Contrast:** a bright brand accent can fail WCAG AA for white label text (coral
  `#cc785c` on white ≈ 3.3:1 — fails 4.5:1 for normal text). Use the design system's
  darker "active" shade (`#a9583e` ≈ 5:1) for filled *text* CTAs; reserve the bright
  accent for large labels (≥24px, 3:1 OK) and non-text accents.
- Gate all motion behind `@media (prefers-reduced-motion: no-preference)` and use
  `motion-safe:` for Tailwind's built-in `animate-*` (they don't self-respect the pref).
- Bottom sheet = focus-managed `role="dialog" aria-modal`, Esc to close, focus moved in.
- 375px floor; `focus-visible` rings on every control; labelled inputs; landmarks.

## Process notes
- Honor never-auto-send even in mocks: phrase actions as "drafted"/"queued", not "sent".
- Deliverable shape that worked: `prototype/index.html` + `prototype/README.md` +
  `prototype/screenshots/` inside the work item.
- Design *method* (brief→plan→self-critique→build→Chanel cut) came from
  [[2026-06-23-design-system-prompt-saas]] — keep method and engineering recipe separate.
