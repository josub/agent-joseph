# design-sync notes — Tessera

## Repo shape (2026-06-25)
- **Not a component-library repo.** It's a single self-contained UI prototype:
  `prototype/index.html` (React + Tailwind via CDN). No `package.json`, no `dist/`,
  no Storybook. The standard `/design-sync` converter pipeline does not apply.
- **Chosen path: tokens-only sync.** Sync the design language (tokens, fonts,
  styling idioms) so the design agent renders generic components on-brand. No
  `_ds_bundle.js`, no `components/`, no `_ds_sync.json` (nothing to verify-recipe).

## Token source of truth
1. `DESIGN-claude.md` at the repo root (`../../DESIGN-claude.md`) — authoritative
   design doc (colors, type scale, spacing, radius, component recipes).
2. `prototype/index.html` `tailwind.config` block — the prototype's concrete choices
   (Newsreader + Inter fonts; same hex palette).

If either changes, regenerate `ds-bundle/tokens/*.css`, `styles.css`, and the
`README.md` conventions header, then re-validate names and re-sync.

## Fonts
Newsreader (serif) + Inter (sans) + JetBrains Mono, loaded via Google Fonts `@import`
in `ds-bundle/fonts/fonts.css`. Substitutes for licensed Copernicus / StyreneB. To
bundle instead, drop woff2 files beside `fonts.css` and swap the `@import` for
`@font-face` — styles.css reaches it via the import closure either way.

## Bundle layout (off-script)
```
ds-bundle/
  styles.css                 # entry — @imports fonts + all tokens, base + primitives
  fonts/fonts.css
  tokens/{colors,typography,spacing}.css
  README.md                  # conventions header (design-agent reference)
  guidelines/design-language.md
```
