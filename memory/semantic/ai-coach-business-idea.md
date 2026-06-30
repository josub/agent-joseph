---
type: entity
title: AI coach — Business #2 idea
description: Provisional Business #2. A chat-first, proactive behavior-change coach (timed nudges, text-default with synthetic-avatar video at highlight moments) that scales into a creator/influencer coach marketplace with rev-share. The moat thesis is being genuinely better at changing behavior (real science + compounding per-user data + outcome measurement), not the medium.
tags: [entity, project, business, ai-coach, behavior-change, marketplace]
source: 2026-06-28 idea-drop session (Joseph), with June-2026 web research red-team
created: 2026-06-29
updated: 2026-06-29
---

# AI coach — Business #2 idea

Provisional **Business #2** under [[build-profitable-online-businesses]], chosen 2026-06-28 to
run **simultaneously** with [[leadodex]]. Joseph
may replace it before real build time, so keep it swappable, not locked. Development is tracked
by the task `work/tasks/develop-ai-coach-business-plan`.

## The idea
An AI coach app. Core capability that's hard in a plain cloud chat: timed push notifications
that nudge specific actions across the day/week (proactive, not pull). Ship preset coaches plus
a framework that builds a new coach from any user request: research credible sources, plan
against good-planning guidelines, set actionable steps, bake in behavior-change psychology.
Seed thesis: onboard real coaches/influencers and let them spin up a branded coach trained on
their content (scraped with permission, they don't write it); their brand beats generic
knowledge and they bring their own audience for a large rev share. Revenue = monthly/yearly
subscription, free trial on every coach.

**Product shape (Joseph):** chat-first like WhatsApp/Messenger; one or more coaches in the
thread; proactive messages; **async** AI-avatar video messages (talking head reading a script),
NOT live video calls (cut on purpose: async clip is better UX + cheaper). Users can record
video back.

## Grounded assessment (June-2026 research)
- Market is real and growing: AI life-coaching ~$1.2B (2023) → ~$5.8B (2030), ~25% CAGR;
  subscriptions ~45% of coaching revenue.
- **Crowded.** The "proactive notification" moat Joseph thought was the hard part is table
  stakes: Simple's Avo does proactive daily check-ins and shipped real AI phone calls (Jan
  2026). The creator-clone marketplace is **exactly Delphi's funded thesis** (~$19M raised
  incl. Anthropic's Anthology Fund, 2,000+ experts, trained on creator content, rev share;
  Matthew Hussey's clone reportedly 7 figures at $39/mo). Also Sensay, GrowthDay, BetterUp.
- **Repeated lesson from Leadodex: we do NOT win on the model or the obvious feature.**

## The wedge (where this is not roadkill)
Delphi/clones are conversational **PULL** (chat when you ask). This idea is **PUSH + outcome**:
a structured, multi-week behavior-change **program** with timed accountability nudges and
milestones, wrapped around a creator's brand. The real seed unlock is **distribution-as-product**:
creators onboard their own audience.

## The moat (Joseph's core thesis)
Success = being genuinely **better at changing behavior**. Pillars:
- **Optimize for measured change, not engagement.** Grade the coach on whether the user's
  target behavior/metric actually moved, not DAU/app-opens. Most apps won't (harder, worse
  vanity metrics) = the wedge. Requires a per-user "north-star behavior."
- **n-of-1 adaptive engine + JITAI timing.** Treat each user as a single-subject experiment:
  intervention → measure → adapt; fire the nudge at the moment of highest receptivity using
  context signals, not a fixed schedule.
- **Compounding clean per-user context+outcome DB.** Published science (Fogg/COM-B/atomic
  habits/motivational interviewing) is public, so the literature isn't the moat; the defensible
  parts are the longitudinal record of what works for THIS user + outcome measurement so the
  system learns. **Capture outcomes, not just context, or it can't compound.**
- Replicable-but-necessary layers: tiny next action; identity-based framing; commitment
  devices/stakes; tone matched to motivation stage; designed-in lapse recovery (attack the
  month-2 dropoff); do the planning for the user; **make change visible** (a user who notices
  real change stays).

## Decided constraints (2026-06-28)
- **Video economics:** async avatar video is ~$1-4/finished min (HeyGen Avatar IV ~$4,
  Synthesia ~$2.90-3); 3x 30s nudges/day ≈ $45-180/user/mo render vs a ~$20-40 sub = upside
  down, and personalization kills the cache. **Ration video, don't remove it:** text = default
  for daily nudges; reserve AI-avatar video for high-leverage moments (onboarding, weekly
  review, milestone, win-back) ≈ 1-4/week, and/or gate richer video behind a premium tier that
  covers its own render cost. **Hard rule: video cost only ever sits behind a paying tier or a
  tightly capped trial; the free tier must be margin-safe on text alone.**
- **Likeness law:** NO FAKES Act of 2026 (S.4591, Senate Judiciary 2026-06-18), up to
  $750k/work platform liability for unauthorized digital replicas (everyone, not just celebs).
  **Use a unique synthetic/web avatar, not a real person's likeness**, to sidestep liability;
  put this in the plan up front.
- **Privacy is first-class, honestly scoped:** true zero-knowledge E2E is incompatible with a
  server-side AI that personalizes, so DON'T promise it. Instead: encrypt in transit + at rest;
  **split PII from behavioral data, reference behavioral data by opaque IDs** (a breach yields
  non-identifying data); data minimization + short retention; strict access controls + tenant
  isolation; **zero-data-retention LLM API** agreement (self-host later as a selling point);
  treat as sensitive-category data (GDPR special category / possible mental-health rules), bake
  compliance in early.
- **Monetization (agreed direction):** free-forever **text-only** tier (margin-safe) + one
  welcome video; Pro unlocks video coach + deeper program + measurement; use the first detected
  win as the **upgrade** moment ("you hit your first win, unlock your video coach"), not a
  lockout; short Pro trial with limited video for the early wow; bill annual to fund CAC; launch
  in a high-willingness-to-pay niche (fitness, income/business, productivity).

## Two businesses, pick the bet
- (A) Standalone proactive coach: plausibly a ~$10k/mo lifestyle product, crowded, thin
  differentiation, faster to ship.
- (B) Creator coach marketplace: the actual $1M-seed bet, but head-to-head with a funded Delphi
  with a ~2-year head start; needs the program/outcome engine + a sharp niche + a
  creator-acquisition motion.

## Next step (open)
Either (a) turn into a real mission + v1 product spec with the video budget baked in as a
constraint (Joseph leaned here), or (b) build the unit-economics model first. Tracked in
`work/tasks/develop-ai-coach-business-plan`.

## Related
- [[build-profitable-online-businesses]] — the mission.
- [[leadodex]] — the parallel business; same "win on the outcome, not the flashy feature" lesson.

## History
- 2026-06-29 — Page created by `sleep` from the 2026-06-28 idea-drop working note. Status is
  PROVISIONAL Business #2; promote to a mission + spec when Joseph picks the next step.
