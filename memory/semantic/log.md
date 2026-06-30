# Semantic Wiki — changelog (`log.md`)

Append-only, machine-parseable history of the knowledge base, in Karpathy LLM-wiki style.
Companion to `index.md`: the index is *what exists now*; this log is *what changed, when*.
Maintained by `sleep` (and `deep-sleep` for `lint`). **Newest entries are appended at the
bottom — never edit or reorder past entries.**

Entry format: `## [YYYY-MM-DD] <action> | <Page Title>` + a one-line note.
Actions: `ingest` (new page) · `update` (revised page) · `supersede` (a claim/page
superseded by a new understanding) · `index` (index.md rebuilt) · `lint` (deep-sleep
health check). Adopted 2026-06-24 — see [[no-logmd-stance]].

---

## [2026-06-22] ingest | LLM Wiki (Andrej Karpathy)
Reference page created (powernap). Persistent LLM-maintained markdown wiki that compounds knowledge vs RAG.

## [2026-06-22] ingest | Open Knowledge Format (OKF)
Reference page created. Google Cloud's vendor-neutral spec formalizing the LLM-wiki pattern.

## [2026-06-22] ingest | ICM — Folder Structure as Agentic Architecture
Reference page created. Van Clief & McDermott — filesystem structure replaces multi-agent orchestration.

## [2026-06-22] ingest | Filesystem as Agentic Architecture
Topic page created. Synthesis tying Karpathy + OKF + ICM onto our own brain design.

## [2026-06-22] ingest | No log.md — our stance
Convention page created. Recorded our deliberate omission of the per-folder log.md (flagged for a future decision).

## [2026-06-22] index | index.md built
Initial index with Topics / References / Conventions sections (5 pages).

## [2026-06-24] ingest | Design Method — distinctive, brief-first UI
Convention page created (sleep). Brief-first product-UI method; consolidated from a user-provided design-system prompt.

## [2026-06-24] ingest | Web UI Prototype Recipe
Topic page created (sleep). Single-file React+Tailwind prototype + headless-Chrome screenshot verify; from the lead-scanner build.

## [2026-06-24] index | index.md updated
+1 Topic (Web UI Prototype Recipe), +1 Convention (Design Method). Now 7 pages.

## [2026-06-24] supersede | No log.md — our stance
User decision: adopt a single wiki-level `log.md` (Karpathy fidelity). The "No log.md" page is reframed to record the reversal; episodic/ + reports/ are unchanged.

## [2026-06-24] ingest | Semantic Wiki — changelog (log.md)
This file created and backfilled across both cycles; `sleep` will append here on every future wiki change.

## [2026-06-29] ingest | Working with Joseph — communication & collaboration norms
Convention page created (sleep). Consolidated five 2026-06-28 feedback notes: concise-first, zero em-dashes, short scannable updates, research before asking, persist every feedback.

## [2026-06-29] ingest | Show a rendered artifact for UI/UX decisions
Convention page created (sleep). From the 2026-06-26 note; build viewable/interactive artifacts for UI calls. Cross-linked to the design-method + prototype-recipe pages.

## [2026-06-29] ingest | Stacked-PR merge gotcha
Convention page created (sleep). From the 2026-06-28 contact-scanner merge train: don't --delete-branch a base out from under its child PR.

## [2026-06-29] ingest | Git identity on this machine
Convention page created (sleep). Global identity set to Joseph Alsberg 2026-06-28; watch for stale hostname local overrides.

## [2026-06-29] ingest | Bash cwd resets — use explicit repo paths
Convention page created (sleep). Bash cwd can reset to brain root; use git -C /abs/path for external repos.

## [2026-06-29] ingest | Leadodex (contact-scanner) — Business #1
Entity page created (sleep). Consolidated four 2026-06-28 notes (is-business-1, named-leadodex, deployed-live, issues-lag-code). Brand Leadodex, separate repo, live on Railway. GTM promoted to projects/leadodex/gtm-plan.md.

## [2026-06-29] ingest | AI coach — Business #2 idea
Entity page created (sleep). From the 2026-06-28 idea-drop: proactive behavior-change coach to creator marketplace; moat = better at changing behavior; provisional Business #2.

## [2026-06-29] ingest | US LLC setup guide — non-resident founder
Reference page created (sleep). User-provided incorporation guide (Wyoming LLC via Stripe Atlas, Mercury/Wise/Korea, Form 5472).

## [2026-06-29] ingest | Pre-incorporation expenses
Reference page created (sleep). Pointer to the durable June-2026 expense ledger ($177.34) promoted to projects/finance/; owner reimbursements.

## [2026-06-29] ingest | Creator content repurposer — Business #3 idea
Entity page created (sleep). From a 2026-06-29 idea-drop note that arrived mid-consolidation: YouTube/blog to native-preview social posts; wedge = WYSIWYG + voice authenticity; #3 candidate, not committed.

## [2026-06-29] index | index.md updated
+1 section (Entities). +3 entities, +2 references, +5 conventions. Now 17 pages.

## [2026-06-30] update | Working with Joseph — communication & collaboration norms
Added norm #6 (defer-needs-github-issue) from the 2026-06-29 note: capture deferred follow-ups as GitHub issues, not just chat.

## [2026-06-30] ingest | Current dev setup — brain + contact-scanner dual repo
Convention page created (sleep) from the 2026-06-29 note. Temporary dual-repo arrangement: contact-scanner auto-loads as a secondary working dir via additionalDirectories + code-workspace; supersede when focus shifts.

## [2026-06-30] index | index.md updated
+1 Convention (dev-setup-dual-repo); collaboration-with-joseph updated to norm #6. Now 18 pages.

## [2026-06-30] ingest | Lead-list enrichment SaaS — Business #4 idea
Entity page created (sleep) from a 2026-06-30 idea-drop note that arrived mid-consolidation: any-format list to structured + enriched to CRM with first-class attribution; strongest founder-problem fit; shares Leadodex's lead-to-CRM backbone. Captured, NOT committed.

## [2026-06-30] index | index.md updated
+1 Entity (lead-list-enrichment-saas-idea, #4 candidate). Now 19 pages.
