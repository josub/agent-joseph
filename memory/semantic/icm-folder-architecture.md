---
type: reference
title: ICM — Folder Structure as Agentic Architecture
description: Van Clief & McDermott's paper — Interpretable Context Methodology (a.k.a. Model Workspace Protocol); filesystem structure replaces multi-agent orchestration.
tags: [agent-architecture, workflows, icm, paper]
source: https://arxiv.org/abs/2603.16021
created: 2026-06-22
updated: 2026-06-22
---

# ICM — Folder Structure as Agentic Architecture

"Interpretable Context Methodology: Folder Structure as Agentic Architecture" by Jake Van
Clief & David McDermott (Eduba / University of Edinburgh), arXiv 2603.16021 (submitted 17
Mar 2026, MIT-licensed; HTML: https://arxiv.org/html/2603.16021v2). ICM replaces
multi-agent framework orchestration with plain **filesystem structure** for sequential,
human-reviewed workflows. This is the theory our `workflows/` directory implements — our
CLAUDE.md note "ICM is scoped — it governs `workflows/` only" refers to exactly this.

## Key points
- **Core claim:** one agent reading the right files at the right moment does what would
  otherwise need a multi-agent framework. Numbered folders = stages; plain markdown files
  carry the prompts/context telling a *single* agent what role to play at each step; local
  scripts do the mechanical (non-AI) work.
- **Lineage:** draws on Unix pipelines, modular decomposition, multi-pass compilation, and
  literate programming.
- **Naming nuance:** the abstract names the method **Model Workspace Protocol (MWP)** (the
  original name); the paper title settles on **Interpretable Context Methodology (ICM)**.
- **Maps to us:** "folder = state", plain markdown, git as substrate, thin staged
  `workflows/` with human Verify gates. ICM is *scoped* in our brain — it governs
  `workflows/` only; the rest of the brain stays cyclic/native, not staged.

## Related
- [[filesystem-as-agentic-architecture]]
- [[llm-wiki-karpathy]]
- [[open-knowledge-format]]

## History
- 2026-06-22 — Created from working note `2026-06-22-icm-paper-van-clief.md` during powernap.
