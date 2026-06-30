---
type: convention
title: Current dev setup — Agent Joseph brain + contact-scanner dual repo
description: Current (temporary) dev arrangement — when the Agent Joseph brain is the open project, contact-scanner auto-loads as a secondary working directory via additionalDirectories + a code-workspace file. Supersede when focus shifts to a different secondary project.
tags: [convention, environment, setup, dual-repo, contact-scanner, leadodex, temporary]
source: 2026-06-29 saving the two-folder VS Code/Claude setup
created: 2026-06-30
updated: 2026-06-30
---

# Current dev setup — Agent Joseph brain + contact-scanner dual repo

**This is the current working arrangement, flagged temporary by Joseph** — right "for now"
but expected to change when focus shifts to other projects. Treat it as current state to
supersede, **not** a lasting convention.

As of 2026-06-29 the active dev arrangement pairs two sibling repos:
- **Agent Joseph brain** (primary, this repo) — skills + memory loaded.
- **contact-scanner** (secondary) at `/Users/joseph/Documents/Code/contact-scanner` — a
  Next.js app, remote `git@github.com:josub/contact-scanner.git`, default branch `main`.
  Also known as the Tessera / Leadodex lead-scanner (see [[leadodex]]).

## How it's wired (two ways)
- **`.claude/settings.local.json` → `permissions.additionalDirectories`** includes the
  contact-scanner absolute path, so it auto-loads as an additional working directory
  **whenever Agent Joseph is the project Claude opens**. Project-scoped, gitignored
  (machine-specific), takes effect next session.
- **`Agent Joseph.code-workspace`** (untracked) holds the matching VS Code multi-root view.

## Why
Joseph wanted to "easily get back to this setup" — work on contact-scanner code with the
brain's skills + memory loaded, without re-adding the dir each session.

## How to apply / caveat
- Treat the contact-scanner pairing as the **current** focus, not a permanent fixture.
- If a different project becomes the active secondary, **update (don't just append to)**
  `additionalDirectories`, and supersede this page.
- Still read contact-scanner's own `CLAUDE.md`/`AGENTS.md` before editing code there
  (external-repo rule in `CLAUDE.md`; see [[bash-cwd-resets-use-explicit-repo-paths]]).

## Related
- [[leadodex]] — Business #1, the product that lives in contact-scanner.
- [[collaboration-with-joseph]] — how I work with Joseph.
- [[bash-cwd-resets-use-explicit-repo-paths]] — external-repo working gotchas.

## History
- 2026-06-30 — Page created by `sleep` from the 2026-06-29 working note. Explicitly
  temporary per Joseph; supersede when the active secondary project changes.
