# Open Knowledge Format (OKF) — Google Cloud

Captured 2026-06-22 (user asked to find Google's "open knowledge format" and stash it
in working memory).

**What:** OKF v0.1 — an open, vendor-neutral specification that formalizes the
"LLM-wiki" pattern into a portable, interoperable format for the metadata, context,
and curated knowledge AI agents need.
**By:** Google Cloud (data analytics team).
**Released:** ~12–13 Jun 2026.
**Spec / repo:** https://github.com/GoogleCloudPlatform/knowledge-catalog/tree/main/okf
**Announcement:** https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing
**Openness:** "Format, not platform." Never requires a proprietary account/SDK to read,
write, or serve. Published open from day one. v0.1 is a starting point, not finished.

## The format
- Knowledge = a **directory of markdown files**, one concept per file (tables, datasets,
  metrics, playbooks, runbooks, APIs…).
- **YAML frontmatter** with structured fields: `type` (only required field), `title`,
  `description`, `resource`, `tags`, `timestamp`; markdown body for content.
- Optional `index.md` per folder (progressive disclosure) and `log.md` (chronological
  history).
- Minimally opinionated; cleanly separates **producers** (writers) from **consumers**
  (readers) so different agents/tools can share a wiki without translation.
- Just markdown — readable in any editor, renders on GitHub, indexable by any search.
- Ships with: an enrichment agent (BigQuery → OKF), a static HTML graph visualizer,
  and 3 sample bundles (GA4, Stack Overflow, Bitcoin).

## Why this matters to us
OKF is essentially the **industry-standard version of our own brain**: folder =
state, plain markdown, git as substrate, one required `type` field, `index.md` for
progressive disclosure — almost identical to our `memory/semantic/` conventions
(read `index.md` first; one required field `type`; supersede, don't delete). Same
lineage as [[the ICM paper]] (2026-06-22-icm-paper-van-clief): filesystem structure
as agentic architecture.

**Notable divergence:** OKF blesses a per-folder `log.md` for chronological history;
our CLAUDE.md deliberately says **"No `log.md`"** (episodic = the dated log/audit;
reports = digests). Worth a deliberate stance if we ever claim OKF compatibility.

→ Strong candidate for promotion to `memory/semantic/` (`type: reference`, plus maybe
a convention note on OKF-alignment vs. our `log.md` choice) during next consolidation.
