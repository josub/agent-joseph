---
name: create-clone
description: Spawn a new agent from this one for a multi-agent fleet. Walks the user through which components to carry over (innate machinery always; relevant learned skills/workflows by recommendation; fresh identity and empty memory/work by default), confirms a target sibling path, scaffolds the boilerplate there, copies the selected subset, and resets the rest. Never copies secrets.
---

# create-clone

## Purpose
Bootstrap a new, differently-trained agent from this one — reuse what's worth reusing
instead of starting from the bare boilerplate. Clones are independent folders; there is
no cross-agent runtime coordination (out of scope).

## Steps

### 1. Ask scope, component by component
Present each with a **recommendation**, and let the user override:

| Component | Default recommendation |
|---|---|
| `skills/innate/` | **Always keep** (the machinery). |
| `skills/<learned themes>/` | **Keep the relevant ones** — recommend by relevance to the new agent's stated purpose. (The `marketing/` demo is a demo — keep only if relevant.) |
| `workflows/` | **Keep the relevant definitions** (reusable assets) — recommend by relevance. The `create-blog-post` demo is optional. |
| `routines/` | **Keep the anchors** (`sleep`, `morning-review`, `start-work-session`); learned routines optional. |
| `identity.md` | **Recommend a fresh identity** — a differently-trained agent needs its own purpose. Offer to carry over personality / rules only. |
| `memory/semantic/` | **Carry a subset if the domain overlaps** (incl. relevant `convention` refs), else start fresh. |
| `memory/episodic/`, `working/`, `archive/`, `reports/` | **Exclude by default** — the source agent's lived history. |
| `work/` (missions/tasks/…) | **Exclude by default** — different goals. Offer to carry **templates only**. |
| `.env` / secrets | **Never copied** (guardrail 4). The clone gets a fresh `.env.example`. |

### 2. Recommend a default selection
Propose a sensible default set and **explain the reasoning**; accept customizations.

### 3. Confirm the target path, then scaffold
- Confirm a **new sibling directory** (e.g. `../<new-agent-name>/`). This **writes
  outside the current repo** — confirm the path before creating anything.
- Scaffold the full boilerplate tree there (all folders, `.gitkeep`, templates, READMEs,
  `.gitignore`, `.env.example`).
- Copy the **selected** components; reset everything else to empty.

### 4. Hand off
Offer to run `initiate-birth` in the clone to set its new identity. **Leave git init /
push to the user.**

## Notes
- On-demand only. **Never copies `.env` or any secret.** Confirm the target path first.
