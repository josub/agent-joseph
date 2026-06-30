---
name: contact-scanner-issues-lag-code
description: contact-scanner's GitHub issues lag the code — features land in commits without closing the issue; audit code vs issue list before picking work.
metadata:
  type: project
---

In `contact-scanner` (`github.com/josub/contact-scanner`), shipped features are committed
**without closing their GitHub issues**, so the open-issue list overstates remaining work.
Always audit the code against the issue list before picking the "next" issue.

On 2026-06-26 a housekeeping pass closed the no-milestone enhancement backlog that was
already implemented in committed code: **#1, #2, #3** (camera live feed / freeze-on-capture
/ tap-to-focus), **#5** (legend below form), **#6–#9** (email/LinkedIn deep links + copy),
**#10** (upload-from-album), **#11** (on-device photos + save-to-album), **#13** (Note
field; shipped `rows={3}` vs spec's `rows={2}`), **#27** (API base-URL seam, `lib/api.ts`).

Resolved later same day:
- **#14** (require First/Last/Company) — user chose "build the spec'd UX" over the prior
  disabled-Save+hint. Rebuilt in `review-screen.tsx`: empty-only red asterisks (`text-error`,
  mutually exclusive with the source dot), always-clickable Save that pops "Please fill in the
  mandatory fields" + red-borders the empty required fields, borders/asterisks clearing as each
  fills. Build clean; browser-QA verified all four acceptance points. **Committed + pushed to
  `main` (0cd0449) and #14 closed.**

Left open after the audit:
- **#25** (scan-line up/down bounce) — genuinely not done; still the one-way `sweep` keyframe.
- **#26** (reject non-badge images / stop guessing), **#22–24** (per-user Slack/HubSpot OAuth
  + Settings screen, depend on auth), **#28/#29** (multi-client capture isolation + auth),
  **#12** (native shell).

**v1.0 work is #16–#20.**

- **#16 Supabase Auth + RLS — built & PR'd 2026-06-26 (PR #35, `Closes #16`, on branch
  `feat/16-supabase-auth-rls`; not yet merged).** Magic-link email (passwordless). New seams:
  `lib/supabase/server.ts` (RLS cookie client), `proxy.ts` (Next 16 **renamed `middleware.ts`
  → `proxy.ts`**), `lib/supabase/auth.ts` `resolveUserClient` (cookie **or** `Authorization:
  Bearer` for native, #29), `components/screens/login-screen.tsx`, `app/auth/callback`,
  `app/actions/auth.ts` signOut; `app/page.tsx` is now a server-component gate over
  `components/app-shell.tsx` (the former page body). `/api/contacts` stamps `user_id`; admin
  client retired from the persistence path. Migration `0003_profile_on_signup.sql` (applied
  in dashboard — confirmed live, auto-creates a `profiles` row, `plan=free`). RLS isolation +
  route 401/Bearer verified by script. **Remaining for the live email hop:** add
  `http://localhost:3000/**` to Supabase Auth → URL Configuration → Redirect URLs.
- **#17 Free-tier quota — built & PR'd 2026-06-26 (PR #44, `Closes #17`, branch
  `feat/17-free-tier-quota` **stacked on the #16 branch**; base auto-retargets to main once
  #16 merges).** Meter = `scans` table (one row per saved contact). `lib/quota.ts getQuota()`
  counts the calendar month + reads `profiles.plan` (free=10, paid=unlimited). Enforced
  server-side at **both** `/api/extract` (429 before vision) and `/api/contacts` (429 hard
  cap); `GET /api/quota` feeds a Home "N of 10 left" counter that disables Scan/Upload at
  limit. `QuotaError` (lib/capture) distinguishes a 429 from a bad read. No migration.
  Verified by script (10 allowed, 11th blocked both routes, exactly 10 DB rows) + browser QA.
- **#18 Plans + Stripe billing — built & PR'd 2026-06-28 (PR #49, `Closes #18`, branch
  `feat/18-plans-stripe-billing` stacked on the #17 branch).** Free/Basic/Pro = 10/100/500
  scans/mo + non-expiring 100-scan refills ($20, Basic/Pro only). `lib/quota.ts` is now
  per-plan + refill-aware (`PLAN_MONTHLY_LIMIT`, `planCanRefill`, `getQuota` returns
  `refillCredits`/`usingRefill`; `remaining=(limit-used)+refill`; `atLimit` only when both
  gone). `lib/stripe.ts` + `app/api/billing/{checkout,portal,webhook}` — checkout (subscribe
  or refill), Customer Portal, and a **signature-verified webhook** that's the ONLY writer of
  billing state (syncs `profiles.plan` by price→plan, grants refills) via the admin client.
  **Security:** migration `0006_billing_column_guard.sql` revokes column UPDATE on
  plan/refill_credits/stripe_* from authenticated/anon (the `own profile` RLS policy is
  `for all` → users could otherwise self-upgrade to Pro), and adds a SECURITY DEFINER
  `consume_refill_credit()` for the save-time draw-down (contacts route calls it via rpc). New
  **Plan & billing** screen; Home counter plan/refill-aware, "See plans" CTA at limit.
  Verified: build clean, scripted getQuota+webhook-signature test, browser QA both states.
  **Dashboard steps (like #16):** apply migrations `0004` + `0006`, create the 3 Stripe Prices,
  set `STRIPE_*` env, point a webhook at `/api/billing/webhook`.
- **Next: #19 Railway deploy, then #20 edit-persistence** (update-by-id; today is new-scans-only).

**⚠️ Concurrent-actor note (2026-06-28):** a *second process* is editing this repo (a fleet/clone).
While I worked #18 it committed+pushed `docs(pricing) #18` (`9c57465`) and `feat(db) #32`
(`f0441c5`) onto `feat/17` at 14:18, and later left uncommitted `#12 Capacitor decision` notes in
`PROGRESS.md`/`ROADMAP.md` (I stashed/popped around them — left untouched for that actor). Treat
shared branches as contended; `--force-with-lease` is mandatory here.

**Branch cleanup DONE (2026-06-28, user-authorized force-pushes):** split the tangled commits so
each PR = one issue. `feat/17` reset to the #17 commit (`5c063b3`) → **PR #44 is quota-only again**.
`feat/18` rebased (`--onto 9c57465 f0441c5`) to drop #32 and carry its own #18 pricing+`0004` →
**PR #49 is self-contained #18** (2 commits). `0005` cherry-picked onto `main` as `feat/32` →
**new PR #50 (#32)**.

**Four PRs open** — #35 #16→main · #44 #17→#16 · #49 #18→#17 · #50 #32→main. Merge #16→#17→#18 in
order (each retargets to main as its base merges); #50 is independent. None merged yet.

**#18 pricing update (2026-06-28, user changed it mid-test):** added **monthly + yearly** cadence.
Basic $24/mo or $19/mo billed yearly ($228); Pro $59/mo or $49/mo yearly ($588); refill $20
unchanged. Now **5 Stripe Prices** → env vars renamed: `STRIPE_PRICE_{BASIC,PRO}_{MONTHLY,YEARLY}`
+ `STRIPE_PRICE_REFILL` (the old `STRIPE_PRICE_BASIC/PRO` are gone). `priceIdForPlan(plan,interval)`;
`planForPriceId` maps both cadence prices → the plan; checkout takes `interval`; Plan screen has a
Monthly/Yearly toggle. Pushed to feat/18 (`4ea567c`), PR #49. Scan limits unchanged (10/100/500).

**Concurrent actor escalated (2026-06-28):** mid-session it ran `git checkout` in the SHARED
contact-scanner working tree (switched it to `docs/native-shell-path-a`, committing the #12 notes
as `818ddac`), yanking my branch out from under me. Lesson: when a fleet/clone is active in an
external repo, **do edits in an isolated `git worktree`** (I added one in scratchpad, built via
`tsc --noEmit` since Turbopack rejects a cross-filesystem-root node_modules symlink — symlink the
main repo's node_modules only if the worktree shares the `/Users` root, else use tsc). Don't trust
the shared checkout's current branch.

See ROADMAP.md / PROGRESS.md "Phase 6". Relates to [[bash-cwd-resets-use-explicit-repo-paths]].
