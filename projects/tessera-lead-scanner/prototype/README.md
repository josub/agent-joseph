# Manna — lead scanner UI prototype

A hi-fi, interactive prototype of a Shazam-style event-badge lead scanner, styled to the
Anthropic-like design system in [`DESIGN-claude.md`](../../../DESIGN-claude.md).

## Run it
Open `index.html` in any modern browser — that's it. It's a single self-contained file
(React 18 + Babel-standalone + Tailwind Play CDN, all from CDNs), so it needs a network
connection on first load but no build step or install.

On a phone or in a mobile viewport it fills the screen; on desktop it renders inside a
centered phone shell.

## The flow
1. **Scan** — the home screen is one big coral orb (the signature element). Tap it.
2. **Camera** — a dark viewfinder with a framing reticle. It attempts the real camera
   (`getUserMedia`); if unavailable it falls back to the drawn badge in-frame. Tap the
   capture button.
3. **Review** — extracted fields, all editable: first/last name, company, title, email,
   phone, LinkedIn, plus a thumbnail of the scanned badge. Tap **Confirm contact**.
4. **Options sheet** — a near-fullscreen sheet with two groups:
   - *Reach out* — Send quick email greeting · Connect on LinkedIn
   - *Save to* — Send to Slack · Send to HubSpot
   Each row flips to a green check + status when tapped, with a confirming toast. Tap
   **Done** to return home (the lead is saved and the counter ticks up).

Scanning cycles through three sample leads so repeated runs feel alive. All actions are
**mocked** — email is "drafted", LinkedIn is "queued" (never auto-sent), Slack/HubSpot
are simulated.

## Design notes (traceable to DESIGN-claude.md)
- **Color** — cream canvas `#faf9f5`, coral `#cc785c`, ink `#141413`, card `#efe9de`,
  dark `#181715`. Registered as named Tailwind tokens in the `<head>` config.
- **Type** — Newsreader (a Tiempos-adjacent serif, substituting the licensed Copernicus)
  for display; Inter for all UI/body.
- **Signature** — the Scan orb: coral, with a faint badge silhouette and a scanning sweep
  line inside it — specific to a badge scanner rather than a generic pulse.
- **A11y floor** — filled text CTAs use the darker coral `#a9583e` so white labels clear
  WCAG AA (4.5:1); visible focus rings; `prefers-reduced-motion` disables all motion;
  semantic landmarks + labelled inputs; the sheet is a focus-managed `role="dialog"`
  (Esc to close). Responsive from 375px.

## Verification
Walked end-to-end in headless Chrome with zero page errors. Screenshots of all five
states are in [`screenshots/`](./screenshots/).
