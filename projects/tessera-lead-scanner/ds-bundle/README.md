# Manna — design system (tokens)

A warm-canvas **editorial** design language (Anthropic-like): tinted cream canvas,
serif display headlines, warm coral CTAs, dark-navy product surfaces. This is a
**tokens-only** system — there is no compiled component library. Build with generic
components, but style them with the tokens and idioms below so every design reads
on-brand.

## Setup — no provider needed

Pure CSS. `styles.css` is the entry point; everything is reachable through its
`@import` closure — fonts, color tokens, the type scale, spacing + radius. There is
no React provider, theme wrapper, or JS runtime to mount. Just consume the CSS
custom properties and utility classes. Read these for the full vocabulary before
styling:

- `styles.css` — base styles, surface helpers, primitive patterns (`.btn`, `.card`, `.input`, `.badge`)
- `tokens/colors.css` — every `var(--color-*)`
- `tokens/typography.css` — families + the `.text-*` type scale
- `tokens/spacing.css` — `var(--space-*)` and `var(--radius-*)`

## The styling idiom — CSS custom properties + utility classes

This system styles via **`var(--*)` tokens** and a small set of **utility classes**.
Never inline hex; reference the token. The vocabulary:

**Colors** — `var(--color-…)`:
`coral` `coral-active` `coral-disabled` · `canvas` `surface-soft` `surface-card`
`cream-strong` · `dark` `dark-elevated` `dark-soft` · `ink` `body-strong` `body`
`muted` `muted-soft` · `on-primary` `on-dark` `on-dark-soft` · `hairline`
`hairline-soft` · `teal` `amber` `success` `warning` `error`

**Type scale** — classes (serif display, sans body):
`.text-display-xl/lg/md/sm` (serif, weight 400, negative tracking) ·
`.text-title-lg/md/sm` · `.text-body-md/sm` · `.text-caption` ·
`.text-caption-uppercase` · `.text-code` · helpers `.font-serif/.font-sans/.font-mono`

**Spacing / radius** — `var(--space-xxs…xxl|section)` (4px base, 96px band rhythm),
`var(--radius-xs/sm/md/lg/xl/pill)` (md=8 buttons/inputs, lg=12 cards, xl=16 hero).

**Surfaces** — `.surface-canvas` `.surface-soft` `.surface-card` `.surface-dark`
`.surface-coral`. **Primitives** — `.btn` (+ `.btn-primary/.btn-secondary/.btn-on-dark/.btn-icon`),
`.card` (+ `.card-dark/.card-coral`), `.input`, `.badge` (+ `.badge-coral`), `.hairline`.

## Rules that define the brand

- **Cream canvas, never pure white.** `var(--color-canvas)` (#faf9f5) is the floor and the brand differentiator.
- **Serif display, sans body — unbreakable.** Headlines use the serif (`.text-display-*` / `.font-serif`) at weight 400 with negative tracking; never bold, never sans. Body/UI uses the sans.
- **Coral is scarce.** Reserve `var(--color-coral)` for primary CTAs and full-bleed `.card-coral` callouts. Don't paint accent moments coral elsewhere.
- **Color-block first, shadow rare.** Depth comes from cream-vs-dark surface contrast, not shadows.
- **Alternate surfaces.** Never repeat the same surface mode in two consecutive bands (cream → cream-card → dark → cream → coral → dark-footer).
- **The trinity is cream + coral + dark navy.** Don't introduce a fourth surface tone.

See `guidelines/design-language.md` for the full reference (component recipes, layout, responsive behavior).

## Idiomatic snippet

```html
<section class="surface-canvas" style="padding: var(--space-section) var(--space-xl);">
  <h1 class="text-display-xl">Meet your thinking partner</h1>
  <p class="text-body-md" style="color: var(--color-body); margin-top: var(--space-md);">
    A warm, editorial interface — built on cream, coral, and dark navy.
  </p>
  <div style="display:flex; gap: var(--space-sm); margin-top: var(--space-lg);">
    <button class="btn btn-primary">Try it</button>
    <button class="btn btn-secondary">Learn more</button>
  </div>
</section>
```

## Fonts

Newsreader (serif) + Inter (sans) + JetBrains Mono, loaded via Google Fonts in
`fonts/fonts.css`. These substitute for Anthropic's licensed Copernicus (serif) and
StyreneB (sans), which are not public web fonts.
