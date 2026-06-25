---
type: task
mission: <slug>       # none — no matching mission yet
source: user          # user | agent:<name>
status: doing         # new | doing  (folder also encodes status)
priority: normal      # low | normal | high  (assumed — not specified)
created: 2026-06-23T15:08:54+0900
claimed_by: claude
claimed_at: 2026-06-23T15:08:54+0900
completed_at: 2026-06-23T15:30:00+0900
output: projects/tessera-lead-scanner/   # deliverable lives here (moved out of the work item 2026-06-24)
# workflow:           # set only on workflow runs — the workflow definition slug
# run:                # set only on workflow runs — this run's id (usually the folder slug)
# stage:              # set only on workflow runs — the next stage to execute, e.g. 02-copywrite
---

## Outcome
Design the UI for a **lead scanner app** as a set of prototype artifacts (clickable/
visual prototype screens — not production code). "Done" = a coherent prototype that
walks the full flow below, styled to the Anthropic-like design system in
[DESIGN-claude.md](../../../DESIGN-claude.md).

### Core interaction (Shazam-like)
A single, dominant **"Scan"** button is the home screen — like Shazam's listen button.

1. **Scan** — large central "Scan" button → opens the camera.
2. **Capture** — user scans an event badge or business card.
3. **Review (editable)** — show the extracted info, all fields editable:
   - miniature thumbnail of the scanned image at the top
   - first name
   - last name
   - company
   - title
   - email
   - phone
   - LinkedIn
4. **Confirm** — a floating **"Confirm"** button pinned at the bottom of the review screen.
5. **Post-confirm sheet** — on confirm, a near-full-screen popup with options in two
   blocks, plus a final action:
   - **Block A — Actions:** "Send quick email greeting" · "Connect on LinkedIn"
   - **Block B — Data storage:** "Send to Slack" · "Send to HubSpot"
   - **Done** at the bottom (closes the flow / returns to Scan).

## Notes
- **Deliverable type:** **hi-fi** prototype, built as a **React + Tailwind** artifact
  (HTML/CSS/JS). A real, interactive, browser-runnable prototype of the flow — not a
  shipped backend app (camera/scan/OCR and the Slack/HubSpot/email/LinkedIn actions can
  be mocked/stubbed, but the screens and transitions should actually work).
- **Design system:** follow [DESIGN-claude.md](../../../DESIGN-claude.md) — Anthropic-
  like. Cream canvas (#faf9f5), coral primary CTA (#cc785c), Copernicus/Tiempos serif
  display + StyreneB/Inter body, hierarchical radii, color-block-first depth. Reuse its
  named tokens rather than inventing values. Note: that system is documented for a
  desktop marketing site, so adapt it to a **mobile-first app** surface (375px up) — the
  Scan button, camera view, review form, and bottom sheet are app patterns the source
  doc doesn't cover directly.
- **Screens to prototype:** (a) Scan home, (b) camera/capture, (c) editable review,
  (d) post-confirm options sheet, plus the "Done" return.
- **Copy:** use real, active-voice labels per the design-prompt note in working memory
  ([2026-06-23-design-system-prompt-saas.md](../../../memory/working/2026-06-23-design-system-prompt-saas.md))
  — e.g. button says "Scan", confirm flow stays consistent through toasts.
- **Fidelity & format (resolved 2026-06-23):** hi-fi, delivered as a React + Tailwind
  HTML/CSS/JS artifact.

## Delivered (2026-06-23)
- **Output location:** `projects/tessera-lead-scanner/` (deliverable moved here
  2026-06-24 — work items point to `projects/`, they don't hold the artifact).
- **Artifact:** `projects/tessera-lead-scanner/prototype/index.html` — single
  self-contained React + Tailwind file, opens in any browser. See its `prototype/README.md`
  for run + design notes.
- **All five screens built & verified** end-to-end in headless Chrome (zero page errors).
  Screenshots in `prototype/screenshots/`.
- **Product named "Tessera"** (a tessera = a Roman identity token/ticket — fits a badge
  scanner). Scan cycles 3 realistic sample leads; actions mocked (email "drafted",
  LinkedIn "queued", Slack/HubSpot simulated) to honor the never-auto-send rule.
- **Notable fix:** Babel-standalone's automatic JSX runtime broke in a classic script;
  switched to manual `Babel.transform` with the classic runtime.
