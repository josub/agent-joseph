# design-sync notes — Manna

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

## Upload status — UPLOADED (2026-06-25)
Pushed via `/design-login`-authorized `DesignSync`. Project **"Lead Scanner"**,
`projectId` `c888fa5e-255d-49f2-b401-3ff23100c872`, pinned in `config.json`. All 7
files live (verified via `list_files`).
- Project URL: https://claude.ai/design/p/c888fa5e-255d-49f2-b401-3ff23100c872

### Re-sync path (for future bundle changes)
Now that a `projectId` is pinned, a later run is a **re-sync into the existing
project**, not first-time creation:
1. Authorize: `/design-login` (or `/login` with a Claude subscription).
2. `DesignSync(list_files, projectId)` → structural diff vs `ds-bundle/`.
3. `DesignSync(finalize_plan, projectId, localDir:"./ds-bundle", writes:["**/*"], deletes:[<removed paths>])`.
4. `DesignSync(write_files)` changed files (7 files, 36K — single call is fine).
No `_ds_sync.json` / sentinel needed — there are no components to verify, and the
tokens-only bundle has no recompile step.

## Bundle layout (off-script)
```
ds-bundle/
  styles.css                 # entry — @imports fonts + all tokens, base + primitives
  fonts/fonts.css
  tokens/{colors,typography,spacing}.css
  README.md                  # conventions header (design-agent reference)
  guidelines/design-language.md
```
