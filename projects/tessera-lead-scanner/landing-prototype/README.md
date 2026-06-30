# Leadodex — landing page prototype

A hi-fi, self-contained marketing landing page + waitlist for **Leadodex** (AI event
lead scanner). Single `index.html`, no build step. Styled to the **Manna** warm-canvas
design system (`../ds-bundle/`).

## Run it
- Quickest: open `index.html` in a browser.
- If your browser blocks local fonts/CDN over `file://`, serve it:
  `python3 -m http.server 8753` then visit `http://localhost:8753/index.html`.

## Stack
React 18 + Babel-standalone + Tailwind Play CDN, all from CDNs (network required).
JSX is compiled with Babel's **classic** runtime to run inside a plain `<script>`.

## Design notes
- **Tokens mapped, not invented** — colors/type/spacing trace to `../ds-bundle/` and are
  declared in a `tailwind.config` named by role. Cream `#faf9f5` canvas, coral `#cc785c`
  reserved for CTAs + the one coral band, dark navy `#181715` for product chrome + footer.
- **Fonts** — Newsreader (serif display, weight 400, negative tracking) + Inter (body) +
  JetBrains Mono, via Google Fonts (substitutes for Anthropic's licensed Copernicus /
  StyreneB).
- **AA contrast fix** — filled text buttons use the darker coral `#a9583e` (white text =
  4.8:1) so they pass WCAG AA; bright coral is reserved for large text + non-text accents.
- **Bands alternate** cream → soft-cream → dark → coral → dark, per the system's rhythm.
- **Signatures** — the dark "code-window" card showing a badge scan resolving into an
  enriched contact; the coral camera-aperture "o" wordmark; serif editorial headlines.
- **Deliberate cut** — the waitlist form lives once (hero); the coral CTA band scrolls to
  it and focuses the email, rather than duplicating the form. One source of truth, less
  generic.

## Sections
Nav · Hero (headline + waitlist form + scan→enriched-contact card) · How it works
(Scan → Enrich → Sync) · Why it matters (Today vs With Leadodex, 3 matched problem→fix
pairs) · Coral CTA · Footer.

## Caveats (it's a prototype)
- The waitlist form is **client-side only** — it validates and shows a success state, but
  nothing is saved. Production wires it to Supabase + a Resend confirmation.
- Copy is the approved v1 (tagline "Every handshake, enriched by AI.").
- Logo is a text wordmark with an aperture-glyph "o"; a finished logo can drop in.

## Screenshots
`screenshots/leadodex-landing-desktop.png`, `…-mobile.png`, `…-success.png`
(rendered + verified in headless Chrome).
