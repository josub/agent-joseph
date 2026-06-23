---
name: capture-resource
description: Find a specific named external resource (a paper, spec, gist, post, repo) and stash a structured working-memory note about it — What / By / Source URL / Why-this-matters-to-us — flagged for promotion at next consolidation. Use when the user says "find X and stash/remember it" about one identifiable artifact (not a broad research brief).
origin: sleep 2026-06-22T15:28:00+0900
created: 2026-06-22T15:28:00+0900
---

# capture-resource

## Purpose
Capture a single, identifiable external artifact into a consistent working-memory note so
it survives to the next consolidation. Narrower than `research` (which answers a brief
with many cited points across sources); this is one resource → one structured note.

## Steps
1. Identify the exact artifact the user means (title + canonical URL). Resolve the
   primary source, not a secondhand mention; prefer official/primary links.
2. Web-search to confirm the essentials: what it is, who made it, when, the canonical
   source/repo URL, license/openness if relevant.
3. Write `memory/working/<YYYY-MM-DD>-<slug>.md` with a consistent shape:
   - **What** (one-paragraph summary), **By** (author/org), **When**, **Source** (URL),
     plus any format/openness specifics.
   - A `## Why this matters to us` section connecting it to our brain / current work.
   - Cross-links `[[...]]` to any related existing notes or concepts.
   - A closing line flagging it as a promotion candidate for the next consolidation.
4. Stop. Do not promote to `semantic/` here — that is `sleep`'s job (dedup by `source`,
   supersede don't delete).

## Notes
# usually called by: ad hoc (user request); consolidated by sleep
- **DRAFT / inert** — created autonomously by sleep on 2026-06-22 after three same-shape
  captures in one day (Karpathy LLM wiki, Google OKF, Van Clief ICM paper). Gated until
  `morning-review` promotes or discards it (guardrail 6). Not exposed to Claude Code.
- Read-only on the world; never sends anything.
