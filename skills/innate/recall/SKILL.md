---
name: recall
description: Cheaply surface what the brain already knows about a topic before acting — an index-first, tiered read of memory (semantic wiki + today's working notes, with episodic history only on demand). Use before working a claimed item, before filing a new task (prior-art / dedup), or any time you need "what do we already know about X?". Read-only; never writes memory or sends anything.
---

# recall

## Purpose
Prime work with the brain's existing knowledge — the read-side counterpart to `sleep`'s
write-side consolidation. Answers "what do we already know that's relevant here?" without
loading the whole wiki, so it stays fast and cheap. This is how long-term memory (and
today's not-yet-consolidated working memory) actually pays off at the point of use.

## Steps

### 1. Frame the query
Distill the subject into a few keywords/concepts — from the claimed item's outcome, the
task being filed, or the topic the user named. Keep it tight; this drives matching.

### 2. Tier 0 — cheap scan (always)
Read only the cheap, curated entry points; do **not** open concept files yet:
- `memory/semantic/index.md` — the curated one-line-per-concept digest (read first).
- `ls memory/working/` — today's unconsolidated notes; the dated-slug filenames are
  self-describing (short-term memory, until `sleep` promotes it).
- `memory/reports/latest/` — the current cycle's digest, if a quick orientation helps.

### 3. Tier 1 — lazy expand (only on a match)
Open just the **1–3** files whose index line or working-note slug actually matches the
query. Never read the whole wiki — the index exists precisely so you expand only what's
relevant.

### 4. Tier 2 — history on demand (only if needed)
If prior decisions or events matter, `grep -ril <keywords> memory/episodic/` and read
only the hits (scope by date when you can). Skip entirely otherwise — episodic is the
most expensive tier.

### 5. Return a tight digest
Hand back a short list of relevant resources — each as **Title · path · one line of why
it's relevant** — plus `[[slug]]` cross-links for any semantic concepts. If nothing
matches, say so explicitly ("no relevant prior knowledge found") rather than padding.

## Notes
# usually called by: start-work-session (prime a claimed item before executing),
#   add-task (prior-art / dedup check), or ad hoc ("what do we know about X?")
- **Read-only and non-consequential** — never writes memory, never sends anything; safe
  on unattended runs.
- **Cost-tiered** — Tier 0 is always cheap (a few small files); Tiers 1–2 expand only on
  a match. The point is to benefit from the compounding wiki without RAG-scale reads.
- Complements `sleep`/`powernap` (which *store*); recall *retrieves*.
