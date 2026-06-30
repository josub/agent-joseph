---
name: dual-repo-contact-scanner-additional-dir
description: Current working setup — when working in the Agent Joseph brain, contact-scanner is auto-loaded as a secondary working directory. May change when focus shifts to other projects.
metadata:
  type: project
  source: 2026-06-29 saving the two-folder VS Code/Claude setup
---

As of 2026-06-29, the active dev arrangement pairs two sibling repos: the **Agent Joseph
brain** (primary, this repo) and **contact-scanner** (secondary) at
`/Users/joseph/Documents/Code/contact-scanner` — a Next.js app, remote
`git@github.com:josub/contact-scanner.git`, default branch `main`. The contact-scanner
work is also known as the Tessera / Leadodex lead-scanner.

This is wired up two ways:
- `.claude/settings.local.json` → `permissions.additionalDirectories` includes the
  contact-scanner absolute path, so it auto-loads as an additional working directory
  **whenever Agent Joseph is the project Claude opens**. Project-scoped, gitignored
  (machine-specific), takes effect next session.
- `Agent Joseph.code-workspace` (untracked) holds the matching VS Code multi-root view.

**Why:** Joseph wanted to "easily get back to this setup" — work on contact-scanner code
with the brain's skills + memory loaded, without re-adding the dir each session.

**How to apply / caveat:** Joseph flagged this is **temporary** — it's right "for now" but
likely changes when he focuses on other projects later. So treat the contact-scanner
pairing as the current focus, not a permanent fixture: if a different project becomes the
active secondary, update (don't just append to) `additionalDirectories`. Don't promote
this to a hard, lasting convention.

Relates to [[collaboration-with-joseph]]; remember to read contact-scanner's own
`AGENTS.md`/`CLAUDE.md` before editing code there (external-repo rule).
