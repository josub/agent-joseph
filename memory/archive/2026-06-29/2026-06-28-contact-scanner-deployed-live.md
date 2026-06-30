---
name: contact-scanner-deployed-live
description: contact-scanner (Business #1) is deployed live on Railway at contact-scanner-production.up.railway.app; auth + scan + Stripe billing verified working 2026-06-28.
metadata:
  type: project
  source: 2026-06-28 deploy session
---

**contact-scanner is LIVE** (2026-06-28). Issue #19 (deploy) effectively done.

- **URL:** https://contact-scanner-production.up.railway.app (Railway, GitHub auto-deploy from `main`).
- **Verified working end to end:** magic-link sign-in, a real scan (counter decrements), Basic
  Stripe checkout flips plan. Automated checks: `/`=200 login, `/api/quota`=401 unauth,
  webhook unsigned POST=400.
- **Build fix shipped:** Next 16 needs Node >=20.9; pinned via `.nvmrc` + `engines.node` (PR #57).
  Railway also has `NIXPACKS_NODE_VERSION=20` and `PORT=8080` set.
- **Email:** Supabase auth uses Resend SMTP with the **test sender** `onboarding@resend.dev`,
  which only delivers to Joseph's own Resend signup email. Real users can't receive magic links yet.

**Open launch blockers / follow-ups:**
- ⛔ **No domain yet.** Blocks: real-user email (need a verified domain in Resend), a
  trustworthy app URL (vs `*.up.railway.app`), branded sender. This is the #1 blocker to anyone
  but Joseph using it.
- Magic-link gotchas learned: link returns to the **origin you signed in from** (not Supabase
  Site URL); old emails carry stale `localhost:8080` redirects; `pkce_` links must be opened in
  the **same browser** that requested them.
- Minor UX bug: after the auth callback the page doesn't re-render until a manual refresh
  (auto-redirect after callback is the fix). Candidate work item.
- **#20 edit-persistence** still open (today is new-scans-only). Last v1.0 issue.

Relates to [[contact-scanner-is-business-1]], [[contact-scanner-gtm-plan]],
[[contact-scanner-issues-lag-code]], [[build-profitable-online-businesses]].
