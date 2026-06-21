---
name: copywrite
description: Draft prose to a specified voice guide from source material. Takes researched points plus a voice reference and writes a cohesive piece that matches the voice, covers every input, and contains no placeholder text. Used by the create-blog-post example workflow's 02-copywrite stage. (Removable demo skill.)
---

# copywrite

## Purpose
Turn source material into finished prose in a defined voice. A learned (demo) ability
under the `marketing/` theme.

## Steps
1. Read the source material (e.g. a research stage's output) and the **voice guide**
   reference it's pointed at.
2. Draft the piece so it:
   - matches the voice guide (tone, rhythm, vocabulary, do/don't list);
   - addresses **every** point in the source material;
   - hits any length target;
   - contains **no placeholder text** ("TODO", "lorem ipsum", "[insert …]").
3. Honor the identity `## Rules` (e.g. don't overuse em-dashes or AI-filler).
4. Output the finished draft.

## Notes
# usually called by: workflows/create-blog-post/02-copywrite (stage)
- **Removable demo.** Delete the `skills/marketing/` theme if you don't want it.
- Drafting only — never publishes or sends.
