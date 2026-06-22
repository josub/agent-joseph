# ICM paper — Jake Van Clief

Captured 2026-06-22 (user asked to find it and stash in short-term memory).

**Title:** Interpretable Context Methodology: Folder Structure as Agentic Architecture
**Authors:** Jake Van Clief, David McDermott (Eduba / University of Edinburgh)
**arXiv:** 2603.16021 — https://arxiv.org/abs/2603.16021 (HTML: https://arxiv.org/html/2603.16021v2)
**Submitted:** 17 Mar 2026
**License:** open source, MIT

## What ICM is
"ICM" = **Interpretable Context Methodology**. Replaces multi-agent framework
orchestration with plain **filesystem structure** for sequential, human-reviewed
workflows. Numbered folders = stages; plain markdown files carry the prompts/context
telling a *single* agent what role to play at each step; local scripts do the
mechanical (non-AI) work. One agent reading the right files at the right moment does
what would otherwise need a multi-agent framework. Draws on Unix pipelines, modular
decomposition, multi-pass compilation, and literate programming.

## Naming nuance
The abstract names the method **Model Workspace Protocol (MWP)** — the original name —
while the paper title settles on **Interpretable Context Methodology (ICM)**.

## Why this matters to us
This is the theory behind our own brain: "folder = state", plain markdown, git as
substrate, thin staged `workflows/` with human Verify gates. Our CLAUDE.md note
"ICM is scoped — it governs `workflows/` only" refers to exactly this.

→ Candidate for promotion to `memory/semantic/` (as a concept / `type: reference`)
during next consolidation.
