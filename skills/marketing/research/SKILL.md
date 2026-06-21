---
name: research
description: Gather sourced material on a topic via web search. Returns concise, cited points (claim + URL) covering a brief's questions. Used by the create-blog-post example workflow's 01-research stage. (Removable demo skill.)
---

# research

## Purpose
Collect well-sourced, relevant points on a topic so a later stage can write from solid
material. A learned (demo) ability under the `marketing/` theme.

## Steps
1. Read the brief (the questions to answer, the angle, the audience).
2. Run web searches; prefer primary and reputable sources. (If a search provider key is
   needed, read it from `.env` — never hard-code it.)
3. For each finding, capture a **claim + its source URL**. Discard the unsourced.
4. Output concise points grouped by the brief's questions; note gaps where evidence was
   thin.

## Notes
# usually called by: workflows/create-blog-post/01-research (stage)
- **Removable demo.** Delete the `skills/marketing/` theme if you don't want it.
- Never send anything; this skill only reads.
