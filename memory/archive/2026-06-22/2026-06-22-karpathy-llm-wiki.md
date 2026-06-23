# LLM Wiki — Andrej Karpathy

Captured 2026-06-22 (user asked to find Karpathy's "LLM wiki" and stash it in working
memory).

**What:** A persistent, structured knowledge base that an LLM agent actively builds and
maintains — a folder of plain markdown files, one Wikipedia-style page per concept,
cross-linked with `[[wiki-links]]`. Knowledge **compounds** across sessions instead of
evaporating.
**By:** Andrej Karpathy (OpenAI co-founder, ex-Tesla AI).
**Posted:** ~4 Apr 2026, as a GitHub gist.
**Source:** https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

## The core idea (vs RAG)
RAG re-derives knowledge from raw documents on *every* query. The LLM wiki instead
builds a **persistent, compounding artifact** once and keeps it updated. Analogy:
compilation — "you don't execute the source every time; you compile once, distribute
the artifact, run it on demand." And: **"Obsidian is the IDE; the LLM is the
programmer; the wiki is the codebase."** Cites Vannevar Bush's Memex (1945) as the
spiritual precedent (the LLM solves the maintenance burden Bush couldn't).

## Three-layer architecture
1. **Raw sources** (immutable) — papers, articles, transcripts, notes = single source
   of truth; the LLM reads but never edits them.
2. **The wiki** (LLM-maintained) — markdown pages: summaries, entity/concept pages,
   cross-references.
3. **The schema** (config) — a `CLAUDE.md` specifying structure, conventions, workflows.

## Conventions & workflow
- **`index.md`** — content catalog: every page + one-line summary, by category; updated
  each ingest.
- **`log.md`** — append-only chronological record with machine-parseable prefixes, e.g.
  `## [2026-04-02] ingest | Article Title`.
- **`[[page-name]]`** wiki-links; YAML frontmatter for metadata (dates, source counts,
  tags).
- **Ingest:** read new source → extract takeaways → write/update ~10–15 pages → update
  `index.md` → append `log.md`.
- **Query:** search wiki pages (not raw sources) → synthesize cited answers → *good
  answers become new pages*.
- **Lint:** periodic health-check for contradictions, stale claims, orphans, missing links.
- Optional tooling: `qmd` (on-device BM25/vector search + LLM re-rank), Marp (slides),
  Dataview (Obsidian), git (versioning).

## Why this matters to us
This is **the direct blueprint for our brain.** His three layers map almost 1:1:
sources→intake, LLM-maintained wiki→`memory/semantic/`, schema `CLAUDE.md`→our
`CLAUDE.md`. His Ingest/Query/Lint loop ≈ our `sleep` / `start-work-session` /
`deep-sleep`. Same `index.md`-first, same `[[wiki-link]]` convention. This is also the
"LLM-wiki pattern" that Google's [[OKF]] (2026-06-22-google-open-knowledge-format)
formalizes into a vendor-neutral spec, and the same lineage as the [[ICM paper]]
(2026-06-22-icm-paper-van-clief).

**Same divergence to flag (now in 2 notes):** Karpathy *and* OKF both bless an
append-only `log.md`; our CLAUDE.md deliberately says **"No `log.md`"** (episodic = the
dated log/audit; reports = digests). A conscious design choice on our part, worth
defending or revisiting.

→ Strong candidate for promotion to `memory/semantic/` (`type: reference`) at next
consolidation — arguably the most foundational of the three related notes.
