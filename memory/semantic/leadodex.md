---
type: entity
title: Leadodex (contact-scanner) — Business #1
description: Business #1 of the mission. A camera-first event lead-capture app (photo of badge/card → Claude vision extract → Apollo enrich → one-tap Slack/HubSpot). Brand = Leadodex (TM-clean, domains leadodex.com/.ai). Lives in its OWN repo github.com/josub/contact-scanner, deployed live on Railway. GTM plan is a durable deliverable in projects/leadodex/.
tags: [entity, project, business, leadodex, contact-scanner, saas]
source: four 2026-06-28 working notes (is-business-1, named-leadodex, deployed-live, issues-lag-code), consolidated 2026-06-29
created: 2026-06-29
updated: 2026-06-29
---

# Leadodex (contact-scanner) — Business #1

**Business #1** under the mission [[build-profitable-online-businesses]] (decided by Joseph
2026-06-28). A camera-first mobile app for event lead capture: photograph a badge/business
card → Claude Sonnet vision extracts the fields → Apollo enriches → review with source dots
(scanned vs enriched) → one-tap to Slack + HubSpot. Magic-link auth (Supabase), Stripe tiers.

## Identity facts (stable)
- **Brand: Leadodex** (decided 2026-06-28). lead + dex, echoes the *Rolodex* cadence without
  the Rolodex trademark (owned by Newell). Built from Joseph's roots: dex (index), lead, scan.
- **Trademark: clean.** TMview (official multi-office search across USPTO + EUIPO + WIPO + 70
  registers) returned 0 results; no commercial web use. Coined term = strongest TM class. Not
  formal legal clearance; file our own mark once live. Names killed in the hunt (all collided):
  tapdex, snapdex, badgedex, introdex, nabdex, Manna/mannascanner, mannadex.
- **Domains:** `leadodex.com` (primary, trust + email) and `leadodex.ai` (brand protection /
  AI-native), bought on Cloudflare. The `.com` registration is the first logged business
  expense (see [[pre-incorporation-expenses]]).
- **Repo (separate from this brain):** local `/Users/joseph/Documents/Code/contact-scanner`,
  remote `github.com/josub/contact-scanner` (SSH). Migrated **out** of this brain's old
  `projects/tessera-lead-scanner/` prototype. When working the product, use the external repo
  and read its own CLAUDE.md/AGENTS.md/ROADMAP/PROGRESS first (see external-repo conventions
  in `CLAUDE.md`).

## Status snapshot (2026-06-28, volatile — repo ROADMAP/PROGRESS is source of truth)
- **LIVE** on Railway at `contact-scanner-production.up.railway.app` (GitHub auto-deploy from
  `main`). Verified end to end: magic-link sign-in, real scan (counter decrements), Basic
  Stripe checkout flips plan.
- **Build:** v1.0 work is issues #16-#20. #16 Supabase auth+RLS, #17 free-tier quota, #18
  plans+Stripe billing all built & PR'd; #19 deploy effectively done. **#20 edit-persistence
  is the last open v1.0 issue** (today is new-scans-only).
- Build fix: Next 16 needs Node ≥20.9 (pinned via `.nvmrc` + `engines.node`).
- Pricing (actual): Free/Basic/Pro = 10/100/500 scans/mo; Basic $24/mo ($19 yearly), Pro
  $59/mo ($49 yearly); $20 non-expiring 100-scan refill (Basic/Pro only). Webhook is the only
  writer of billing state; a migration revokes self-update of plan/refill columns.

## Known operational gotchas
- **Issues lag the code:** features get committed without closing their GitHub issue, so the
  open-issue list overstates remaining work. **Audit code vs issue list before picking the
  "next" issue.**
- **No verified email domain yet** was the #1 launch blocker (Supabase auth used Resend test
  sender `onboarding@resend.dev`, only delivers to Joseph). Buying leadodex.com unblocks this:
  wire DNS in Cloudflare, verify the domain in Resend, repoint Railway/Supabase/Stripe to the
  new host.
- Magic-link gotchas: link returns to the origin you signed in from (not Supabase Site URL);
  stale `localhost` redirects in old emails; `pkce_` links must open in the same browser.
- **Concurrent actor:** a second process (fleet/clone) has edited this shared repo, including
  `git checkout` on the shared working tree. Do edits in an isolated `git worktree`; treat
  shared branches as contended (`--force-with-lease` mandatory). See
  [[stacked-pr-merge-gotcha]].

## GTM
Full go-to-market plan is a durable deliverable: **[projects/leadodex/gtm-plan.md](../../projects/leadodex/gtm-plan.md)**.
Headline: own the category "event lead capture + enrichment" (not commodity "badge scanner");
win on enriched + instantly-routed leads at a flat no-hardware price; North-star metric =
leads captured that reach a CRM within 24 hours (attacking the ~80% trade-show
follow-up-leakage stat).

## Related
- [[build-profitable-online-businesses]] — the mission (work/missions/).
- [[ai-coach-business-idea]] — the parallel business.
- [[stacked-pr-merge-gotcha]], [[git-identity-on-this-machine]], [[bash-cwd-resets-use-explicit-repo-paths]] — conventions learned building it.
- [[pre-incorporation-expenses]], [[us-llc-setup-guide]].

## History
- 2026-06-29 — Page created by `sleep`, consolidating four 2026-06-28 working notes
  (is-business-1, named-leadodex, deployed-live, issues-lag-code). Status snapshot is a
  point-in-time copy; the repo is the live source of truth.
