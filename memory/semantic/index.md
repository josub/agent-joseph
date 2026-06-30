# Semantic Index
_Maintained by sleep / deep-sleep. Read first when querying memory._
_Changelog of wiki changes: [log.md](log.md) (append-only, `## [date] action | Title`)._

<!-- One section per type or category. Each line:
     - [Title](slug.md) — one-line — type: X — updated: DATE -->

## Topics
- [Filesystem as Agentic Architecture](filesystem-as-agentic-architecture.md) — the lineage behind our brain: markdown + folders + git as agent substrate — type: topic — updated: 2026-06-22
- [Web UI Prototype Recipe](web-ui-prototype-recipe.md) — single-file React+Tailwind prototype + headless-Chrome screenshot verify (Babel classic-runtime fix, WCAG contrast pattern) — type: topic — updated: 2026-06-24

## Entities (businesses / projects)
- [Leadodex (contact-scanner) — Business #1](leadodex.md) — camera-first event lead-capture app; brand Leadodex, separate repo josub/contact-scanner, live on Railway; GTM in projects/leadodex/ — type: entity — updated: 2026-06-29
- [AI coach — Business #2 idea](ai-coach-business-idea.md) — provisional #2: proactive behavior-change coach to creator coach marketplace; moat = better at changing behavior — type: entity — updated: 2026-06-29
- [Creator content repurposer — Business #3 idea](creator-content-repurposer-idea.md) — #3 candidate (not committed): YouTube/blog to native-preview social posts on an editable canvas; wedge = WYSIWYG + voice authenticity — type: entity — updated: 2026-06-29
- [Lead-list enrichment SaaS — Business #4 idea](lead-list-enrichment-saas-idea.md) — #4 candidate (captured, not committed): any-format list to structured + email/LinkedIn enriched to CRM with first-class attribution; wedge = LLM any-format structuring + Leadodex backbone synergy — type: entity — updated: 2026-06-30

## References
- [LLM Wiki (Andrej Karpathy)](llm-wiki-karpathy.md) — persistent LLM-maintained markdown wiki that compounds knowledge (vs RAG) — type: reference — updated: 2026-06-22
- [Open Knowledge Format (OKF)](open-knowledge-format.md) — Google Cloud's vendor-neutral spec formalizing the LLM-wiki pattern — type: reference — updated: 2026-06-22
- [ICM — Folder Structure as Agentic Architecture](icm-folder-architecture.md) — Van Clief & McDermott paper; filesystem structure replaces multi-agent orchestration — type: reference — updated: 2026-06-22
- [US LLC setup guide — non-resident founder](us-llc-setup-guide.md) — Wyoming LLC via Stripe Atlas; Mercury to Wise to Korea money flow; Form 5472; pull up at incorporation — type: reference — updated: 2026-06-29
- [Pre-incorporation expenses](pre-incorporation-expenses.md) — pointer to the June-2026 expense ledger ($177.34) in projects/finance/; owner reimbursements — type: reference — updated: 2026-06-29

## Conventions
- [log.md — our stance (resolved)](no-logmd-stance.md) — resolved 2026-06-24: adopted a single wiki-level log.md (Karpathy-style); episodic/ + reports/ unchanged — type: convention — updated: 2026-06-24
- [Design Method — distinctive, brief-first UI](design-method-distinctive-ui.md) — our reusable product-UI method: brief-first, ground in the product's world, two-pass plan, avoid the three AI defaults, Chanel cut — type: convention — updated: 2026-06-24
- [Working with Joseph — communication & collaboration norms](collaboration-with-joseph.md) — concise takeaways first, zero em-dashes, short scannable updates, research before asking, persist every feedback, defer to a GitHub issue — type: convention — updated: 2026-06-30
- [Show a rendered artifact for UI/UX decisions](show-rendered-artifact-for-ui-decisions.md) — build a viewable/interactive artifact for UI calls; don't make Joseph judge from prose — type: convention — updated: 2026-06-29
- [Stacked-PR merge gotcha](stacked-pr-merge-gotcha.md) — don't --delete-branch a base out from under its child PR; retarget the child to main first — type: convention — updated: 2026-06-29
- [Git identity on this machine](git-identity-on-this-machine.md) — global identity is Joseph Alsberg joseph.alsberg@gmail.com as of 2026-06-28; watch for stale hostname local overrides — type: convention — updated: 2026-06-29
- [Bash cwd resets — use explicit repo paths](bash-cwd-resets-use-explicit-repo-paths.md) — Bash cwd can reset to brain root between calls; use git -C /abs/path for external repos, verify remote before push — type: convention — updated: 2026-06-29
- [Current dev setup — brain + contact-scanner dual repo](dev-setup-dual-repo.md) — temporary: contact-scanner auto-loads as a secondary working dir (additionalDirectories + code-workspace) when the brain is the open project; supersede when focus shifts — type: convention — updated: 2026-06-30
