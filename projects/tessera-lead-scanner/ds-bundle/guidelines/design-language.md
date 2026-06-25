# Tessera design language — full reference

Warm-canvas editorial system (Anthropic-like). Brand voltage comes from the
**cream + coral** pairing — deliberately warm and humanist where most AI brands use
cool blue + slate. All tokens below resolve to `var(--*)` custom properties defined
in `tokens/` (see `README.md` for the vocabulary index).

## Surfaces — three modes, alternated band-by-band

1. **Cream canvas** `--color-canvas` — default body floor.
2. **Cream cards** `--color-surface-card` — feature/content card backgrounds (one step darker than canvas).
3. **Dark navy** `--color-dark` — product chrome (code editors, terminals), featured surfaces, pre-footer CTAs, footer.

The cream-to-dark contrast is the page's pacing rhythm. Coral callouts (`.card-coral`)
are the high-voltage punctuation between them.

## Typography

- **Display** = serif (`--font-serif`, Newsreader/Copernicus), **weight 400 only**,
  negative letter-spacing (−0.3 to −1.5px). Serif without negative tracking reads
  off-brand; bold serif reads bombastic. The serif voice is what makes this feel
  literary rather than like every other AI tool.
- **Body / UI** = humanist sans (`--font-sans`, Inter/StyreneB), 400 for paragraphs,
  500 for labels/emphasis.
- **Code** = `--font-mono` (JetBrains Mono).

Scale: `.text-display-xl` 64 · `display-lg` 48 · `display-md` 36 · `display-sm` 28
(all serif) · `title-lg` 22 · `title-md` 18 · `title-sm` 16 · `body-md` 16 ·
`body-sm` 14 · `caption` 13 · `caption-uppercase` 12/1.5px-tracking · `code` 14.

## Component recipes (compose generic components to match)

- **button-primary** — `.btn .btn-primary`: coral bg, white text, 14/500, 12×20 pad, 40px tall, radius-md. Active darkens to `--color-coral-active`.
- **button-secondary** — `.btn .btn-secondary`: canvas bg, ink text, 1px hairline border.
- **button-on-dark** — `.btn .btn-on-dark`: stays dark (`--color-dark-elevated`) over dark surfaces; the system never inverts to a light secondary on dark.
- **icon button** — `.btn-icon`: 36px circular, canvas bg, hairline border, ink icon.
- **text link** — inline `<a>`: coral, underline on press. A signature small detail.
- **feature-card** — `.card`: surface-card bg, radius-lg, 32px pad; small icon, `title-md` headline, `body-md` description.
- **product-mockup-card / code-window** — `.card-dark`: dark navy, radius-lg; shows real product chrome (code blocks, terminal, line numbers in `--color-muted-soft`). Inner code blocks use `--color-dark-soft`.
- **callout-card-coral** — `.card-coral`: full coral fill, white text, radius-lg, 48px pad. The coral surface IS the voltage; CTA inside inverts to a cream button.
- **pricing-tier-card** — canvas bg + hairline border, radius-lg, 32px pad; plan name `title-lg`, price `display-sm` (serif!), checklist `body-md`. Featured tier flips to `.card-dark` — the dark surface IS the featured signal.
- **text-input** — `.input`: canvas bg, radius-md, 10×14 pad, 40px tall, hairline border; focus shifts border to coral with a 3px coral-15% ring.
- **badge** — `.badge` (surface-card pill, `caption`) / `.badge-coral` (coral pill, uppercase 12/1.5px) for NEW/BETA.
- **top-nav** — 64px tall, canvas bg, `nav-link` items (sans 14/500), spike-mark + wordmark left, primary coral CTA right.
- **footer** — `.surface-dark`, `--color-on-dark-soft` text, 64px vertical pad; never inverts.

## Layout

- Base unit 4px. Section rhythm `--space-section` (96px) between major bands.
- Card internal padding 32px (`--space-xl`); 24px for code-window/connector tiles.
- Max content width `--container-max` (~1200px), centered. Hero often a 6/6 split.
- Feature grids 3-up desktop → 2-up tablet → 1-up mobile. Pricing 3-up → 1-up.

## Elevation

Color-block first, shadow rare. Most depth = cream-vs-dark surface contrast. The one
soft shadow (`--shadow-soft`, `0 1px 3px rgba(20,20,19,.08)`) is used sparingly on
hover-elevated states. Borders are 1px `--color-hairline` — they read as one
elevation step, not ink lines.

## Do / Don't

**Do** — anchor on cream; serif display + sans body with negative tracking; reserve
coral for CTAs and full-bleed coral callouts; alternate cream↔dark bands; 96px
between bands.

**Don't** — cool grays or pure white for canvas; bold serif display; cool blue/cyan
accents; coral everywhere; sans for display headlines; a fourth surface tone; hover
styling beyond press-darken.

## Responsive

| Breakpoint | Width | Key changes |
|---|---|---|
| Mobile | <768px | Hamburger nav; hero display-xl 64→32; grids 1-up; footer cols → 1 |
| Tablet | 768–1024px | Feature cards 2-up; pricing 2-up |
| Desktop | 1024–1440px | Full nav; 3-up feature cards; 3-up pricing |
| Wide | >1440px | Desktop + more outer breathing room; content caps at 1200px |

## Known gaps

- Copernicus / StyreneB are licensed Anthropic faces, not public — Newsreader + Inter
  are the substitutes shipped here.
- The Anthropic radial-spike mark is a logo asset (inline SVG), not a token.
- Sourced from a single UI prototype + its design doc (`DESIGN-claude.md`); this is a
  token/style language, not an audited component library.
