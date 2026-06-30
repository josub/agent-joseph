---
name: ai-coach-business-idea
description: Joseph's new business candidate — proactive AI coach app (notifications + behavior-change framework) that scales into a creator/influencer coach marketplace with rev-share. Candidate for Business #2 or the $1M seed bet.
metadata:
  type: project
  source: 2026-06-28 idea-drop session
---

**The idea (Joseph, 2026-06-28).** An AI coach app. Core capability that's hard to do in a
plain cloud chat: it sends timed push notifications to nudge specific actions across the
day/week (proactive, not pull). Ship a few preset coaches, plus a framework that builds a
new coach from any user request: research credible sources, make a plan against
good-planning guidelines, set actionable steps, and bake in behavior-change psychology
(reward, encourage, hard truths when needed, measurable milestones). Long-term / seed
thesis: onboard real coaches and influencers (a Tony Robbins, an athlete) and let them
spin up their own coach trained on their content (we scrape it with permission, they don't
write it). Their branded coach beats generic knowledge and they bring their own audience
for a large rev share. Revenue = monthly/yearly subscription, free trial on every coach.

**Grounded assessment (web research, June 2026):**
- Market is real and growing: AI life-coaching ~$1.2B (2023) → ~$5.8B (2030), ~25% CAGR;
  coaching-platform market ~$4.23B (2026). Subscriptions are ~45% of coaching revenue.
- Crowded standalone field: BetterUp, Rocky.ai, Coach.me, GoalsWon, Simple/Avo. The
  "proactive notification" moat Joseph thinks is the hard part is already table stakes:
  Simple's Avo does proactive daily check-ins and shipped Avo Voice (real AI phone calls)
  in Jan 2026. Repeated lesson from contact-scanner: we do NOT win on the model or the
  obvious feature.
- The creator-clone marketplace = exactly Delphi's thesis, already funded: ~$19M raised
  (Sequoia, Menlo, Anthropic's Anthology Fund), 2,000+ experts, verified-only, trained on
  creator's own content, creators keep ownership, paywall + rev share. Matthew Hussey's
  Delphi clone reportedly 7 figures at $39/mo. Also Sensay, GrowthDay.

**The wedge (where this is NOT roadkill):** Delphi/clones are conversational PULL (chat
with my AI when you ask). Joseph's idea is PUSH + outcome: a structured, multi-week
behavior-change PROGRAM with timed accountability nudges and milestones, wrapped around a
creator's brand. "Outcome-driven proactive coaching program" vs "ask my clone a question."
The real seed unlock is distribution-as-product: creators onboard their own audience. That
is the strongest, most defensible part of the plan.

**Honest framing — these are TWO businesses, pick the bet:**
- (A) Standalone proactive coach = plausibly a $10k/mo lifestyle product, but crowded and
  thin differentiation. Faster to ship.
- (B) Creator coach marketplace = the actual $1M-seed bet, but head-to-head with a funded
  Delphi that has a 2-year head start. Needs a sharp wedge (program/outcome engine + a
  specific niche, e.g. fitness or business coaches) and a creator-acquisition motion.

**DECIDED 2026-06-28:** run this as Business #2 SIMULTANEOUSLY with contact-scanner (#1).
Joseph can carry 2-3 businesses at once. Related: [[build-profitable-online-businesses]],
[[contact-scanner-is-business-1]].

**Product additions (Joseph, 2026-06-28):** chat-first interface like WhatsApp/Messenger;
one or more coaches in the thread; proactive messages; AI avatar video messages (talking
head reading the script). Async recorded video, NOT live video calls (he cut those on
purpose: often you just want the info, async clip is better UX + cheaper). User can also
record video messages back to the coach.

**Holes I raised (he asked me to shoot holes):**
1. Video unit economics upside down at daily frequency: async avatar video ~$1-4/finished
   min (HeyGen Avatar IV ~$4, Synthesia ~$2.90-3). 3x 30s nudges/day ≈ $45-180/user/mo
   render cost vs a ~$20-40 sub. Dominant, never-zero cost line.
2. Personalization kills the cache: personal video can't be pre-rendered (fresh paid
   render + 1-2 min latency each); only generic clips cache, and those feel canned.
3. Likeness law has teeth: NO FAKES Act of 2026 (S.4591) hit Senate Judiciary 2026-06-18,
   up to $750k/work platform liability for unauthorized digital replicas (covers everyone,
   not just celebs). Generating net-new speech in a real creator's face needs scoped
   revocable consent + say-what guardrails + kill switch; slows top-tier creator onboarding.
4. Format doesn't fix retention; the hard problem is adherence past month 2 = the program,
   not the medium. Delphi already ships text+voice+video clones, so avatar ≠ moat.

**Recommendation (agreed direction):** ration video, don't remove it. Text = default for
daily nudges; reserve AI avatar video for high-leverage moments (onboarding welcome, weekly
review, milestone, win-back) ≈ 1-4/week. Build the program/outcome engine first, prove
retention text/voice-first, layer video once the loop works. Same lesson as contact-scanner:
win on the outcome, treat the flashy feature as margin-aware garnish.

**Agreements (Joseph, 2026-06-28):**
- Video cost fix accepted: text default + reserve video for highlight moments AND/OR gate
  richer video behind a higher-paying premium tier that covers its own render cost.
- Legal: use a UNIQUE synthetic/web avatar (not a real person's likeness) to sidestep NO
  FAKES liability; stay clear of anything that creates exposure; put this explicitly in the
  plan up front so we don't hit it later.
- Retention risk is real but downstream of the moat below; video vs text is a later call.

**THE MOAT (Joseph's core thesis, 2026-06-28):** success = being genuinely BETTER at
changing behavior. Two pillars: (1) feed in real behavior-change science, set our change
strategies from actual research studies, not vibes; (2) the IP is a very structured, clean
per-user content/context DB that lets the coach handle each person better and drive real
change. Grounded in our prior ICM/OKF realization that "AI is only as good as the context
we feed it." Real value = real change for the user, regardless of delivery medium.

My sharpening (to bake in): the published science (Fogg/COM-B/atomic-habits/motivational
interviewing) is public, so the literature itself is not the moat. The defensible parts are
(a) the per-user data flywheel that compounds (longitudinal record of what actually works
for THIS user), and (b) an intervention engine that picks the right nudge at the right
moment, plus (c) outcome measurement so the system learns. Capture outcomes in the DB, not
just context, or it can't compound.

**Privacy/security posture (decided direction 2026-06-28):** privacy is a first-class part
of the product, not bolted on. Honest constraint we accept: true zero-knowledge E2E and
"full anonymization" are incompatible with a server-side AI that personalizes on the data
(the coach must read behavioral context; compounding needs a persistent per-user identity).
So we DON'T promise zero-knowledge E2E. Shippable posture instead:
- Encrypt in transit + at rest (table stakes).
- Split PII from behavioral data; reference behavioral data by opaque IDs (pseudonymize) so
  a behavioral-data breach yields non-identifying data. Blast-radius reduction = the answer
  to "what if we're hacked."
- Data minimization + short retention; strict access controls + tenant isolation.
- Use a zero-data-retention LLM API agreement so the model host doesn't keep context; option
  to self-host later as a selling point.
- Treat this as sensitive-category data (GDPR special category, possibly mental-health
  rules); bake compliance in early (same "legal up front" stance as the likeness decision).

**Smart-from-start behavior-change levers (moat build, 2026-06-28).** Per-user data alone
isn't enough; design these in from day one. Defensible cluster:
- OPTIMIZE FOR MEASURED CHANGE, NOT ENGAGEMENT. Grade the coach on whether the user's target
  behavior/metric actually moved, not on app opens/DAU. Most apps won't do this (harder, can
  show worse vanity metrics) = our wedge. Requires defining a per-user "north star behavior."
- n-of-1 adaptive engine: treat each user as a single-subject experiment; try intervention →
  measure response → adapt; learn THIS user's response curve (nudge type, timing, tone,
  reward). This is "the model that seeps out what works," structured.
- Just-in-time adaptive intervention (JITAI): fire the nudge at the moment of highest
  receptivity/need using context signals, not on a fixed schedule. Timing is an underrated,
  defensible lever and ties to the proactive-notification core.
Good-design layers (replicable but necessary): tiny/minimum-viable next action (reduce
friction, Fogg); identity-based framing (becoming, not just tasks); commitment devices +
accountability/stakes; match tone to motivation type + stage of change (SDT/transtheoretical);
designed-in lapse recovery (self-compassion, lapse ≠ relapse) to attack the month-2 dropoff;
do the planning for the user (cut decision fatigue); and MAKE CHANGE VISIBLE — surface
provable progress, because a user who notices real change stays (Joseph's point).
Note: surfacing visible progress requires the outcome measurement above; it's the same build.

**Monetization (explored 2026-06-28, recommendation agreed-direction):** first-principles
key = the binding cost is VIDEO, not text. A free text-only tier is cheap (tokens + push,
pennies to low single $/user/mo), so "free until change" is far less scary financially than
it sounds IF free stays text-only and video sits behind paid.
- Red-team on "free until we detect change" as a literal paywall: (1) ties revenue to our
  hardest capability (outcome measurement) working early; (2) the change moment cuts both
  ways (proof-to-pay vs "got it free already"); (3) long, leaky free runway, many never
  reach change. Real risk = under-monetizing, not overspending.
- Two mindsets: growth-aggressive (free until value; bigger funnel, can train users to
  expect free) vs revenue-aggressive (early trial; cash day 1, payers self-select as more
  committed = better outcomes, but charging on hope before change is visible).
- RECOMMENDATION (synthesis): free-forever text tier (margin-safe) + one welcome video; Pro
  unlocks video coach + deeper program + measurement; use first detected win as the headline
  UPGRADE moment, not a lockout ("you hit your first win, unlock your video coach"); add a
  short Pro trial with limited video for the early wow + loss-aversion on downgrade; bill
  annual to fund CAC; launch in a high-willingness-to-pay niche (fitness, income/business,
  productivity).
- HARD RULE: video cost only ever sits behind a paying tier or a tightly capped trial; the
  free tier must be margin-safe on text alone.

**Next step (open):** (a) turn into a real mission + v1 product spec with the video budget
as a baked-in constraint [Joseph leaned here], or (b) build the unit-economics model first.
Tracked as a work task: continue developing this plan (filed 2026-06-28).

→ Promotion candidate for sleep: this becomes a project/mission once we pick the next step.
