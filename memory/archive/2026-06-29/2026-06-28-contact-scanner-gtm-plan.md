---
name: contact-scanner-gtm-plan
description: Full go-to-market plan for contact-scanner — ICP, positioning, pricing, channels, two-track referral, launch motion, metrics. Decided with the user 2026-06-28.
metadata:
  type: project-note
  source: 2026-06-28 contact-scanner GTM session
  project: contact-scanner
---

# Contact Scanner — GTM plan

Captured 2026-06-28 from the contact-scanner GTM session. This is the **full** plan; only
the referral section is also written to the repo at `contact-scanner/docs/REFERRAL-PROGRAM.md`
(by user instruction the full plan lives in memory only, not in the repo).

→ Promotion candidate for `sleep`: likely belongs in `projects/contact-scanner/` as a
durable deliverable (it's strategy, not scratch). Dedup by source = this session. Several
points are user-confirmed decisions (pricing reality, referral mechanics), not proposals.

Grounded in: repo README/ROADMAP/PROGRESS (product = camera-first mobile app: Claude Vision
extract → Apollo enrich → one-tap Slack/HubSpot; Supabase auth; Stripe tiers) and web
research (June 2026) on competitors, market, SEO/AEO, and email deliverability.

---

## Product (what we're selling)

Camera-first mobile app. Photograph a badge/business card → Claude Sonnet vision extracts
8 fields → Apollo enriches (title, company size, industry, location, photo) → review with
source dots (scanned vs enriched) → one-tap to Slack + HubSpot. Magic-link auth. Email +
LinkedIn actions still mocked (roadmap).

## Market opportunity (the wedge)

- ~$24k avg exhibitor spend per show; events = 17% of B2B budgets (25–35% for higher-ACV SaaS).
- **~80% of trade-show leads never get any follow-up**; 40% who do follow up wait 3–5 days.
- Following up within 24h drives ~3x pipeline value.
- Rental scanners $300–1,000/event; competing apps $5–25/user/mo.
- Reality: competitive category (Popl, Mobly, Wave Connect, Blinq, iCapture/Cvent, BoothIQ).
  AI photo-to-fields is now **table stakes** (Cvent iCapture + BoothIQ ship it). We do NOT
  win on the model.

## Positioning & differentiation

- Category to own: **event lead capture + enrichment** (not "badge scanner," a commodity).
- Statement: *For B2B sales and field-marketing teams who work events, Contact Scanner turns
  any badge or business card into an enriched, CRM-ready lead in seconds — no rented
  hardware, no manual entry, no leads lost. Unlike basic scanners and OCR card apps, every
  scan arrives qualified and routed while the lead is still warm.*
- Defensible edge = **enrichment + instant routing at a flat, no-hardware price**, then move
  up-stack into follow-up automation + reporting before incumbents make those self-serve.
- Three shipped proof pillars: (3) auto-enrichment → qualified lead; (4) one-tap HubSpot +
  real-time Slack → in CRM before you leave the booth; (7) flat per-seat price < renting one
  scanner for one show.

## ICP

- Company: B2B SaaS, Seed–Series B, 10–100 employees.
- Behavior: exhibits/attends 5+ events/yr; reps work booths with phones, not enterprise scanners.
- Stack: already on HubSpot + Slack (our live integrations).
- Buying: self-serve / single approver; no procurement.
- Disqualifiers: enterprise locked into Cvent/official retrieval; consumer/networking; non-event teams.
- Expansion rings: agencies working the circuit for clients → mid-market multi-team programs
  (manager dashboard becomes the upsell).

## Personas

- **Booth Rep Riley** (primary user, not buyer): SDR/AE/founder at the booth. Win = capture
  in <5s without breaking eye contact, never think about it again. Cares about speed, not dashboards.
- **Demand-Gen Dana** (economic buyer): field-marketing / demand-gen / RevOps; owns event ROI
  + CRM data quality; signs off on seats. Win = every lead lands in HubSpot, enriched, routed,
  within 24h, attributed by event. She responds to the 80% leakage stat.
- **Founder Sam** (small-team buyer + user): pre-Series-A; Riley and Dana are the same person.
  Lands via PLG free tier + referral credit.

## Pricing (ACTUAL, from repo — corrected from earlier assumption)

All plans include every feature; only the monthly scan allowance differs.

| Plan | Price | Scans/mo |
|---|---|---|
| Free | $0 | 10 |
| Basic | $24/mo · $19/mo billed yearly ($228/yr) | 100 |
| Pro | $59/mo · $49/mo billed yearly ($588/yr) | 500 |

Refill: 100 extra scans / $20 one-off, never-expiring, **Basic/Pro only** (free users can't
hold refill credits — `planCanRefill()` excludes free; `refill_credits` stays 0). Scans are
the metered, monetized currency across all tiers (even Pro is capped at 500). Anchor line:
"one rep, all year, for less than renting one scanner for one show."

## Channels (4, each with the guardrail that makes it work)

1. **LinkedIn (core).** Founder-led organic on the follow-up-gap thesis + tightly-targeted
   ads to demand-gen / field-marketing / RevOps titles at SaaS companies.
2. **Email lead gen — AI-assisted (core, with discipline).** Stack like Instantly + dedicated
   verified sending domains (never the primary) + warmup/rotation + low per-inbox caps.
   Non-negotiables: verify every address (list quality drives complaints more than volume);
   keep spam complaints <0.10% (≥0.30% → domain ineligible for Gmail mitigation + permanent
   550 rejections); SPF+DKIM+DMARC per domain; one-click unsubscribe; CAN-SPAM/GDPR.
   Strategic note: the same AI email engine is more valuable **as the in-product 24h
   follow-up feature** (roadmap pain #8) — productize it, don't only use it for acquisition.
3. **SEO / AEO — quality-capped, NOT volume-first.** Correction to the original "50+ AI
   articles/day from day 1" idea: mass AI publishing is Google's top 2026 enforcement target
   (scaled content abuse) — 50–80% traffic drops; capped human-edited AI (~50–100 quality
   pieces) saw +30–80%. Split: ~10–20 cornerstone pages with a genuine human touch (original
   usage stat, real screenshot/quote) to rank + earn LLM citations (AEO rewards trusted,
   referenced sources, not page count); AI-drafted+AI-edited long-tail support pages, capped
   and quality-gated. "Human-edit" can be an AI editing pass for the long tail, but it adds
   no first-hand EEAT — reserve real human input for cornerstone. Targets: "best lead
   retrieval app," "[competitor] alternative," "trade show lead follow-up" + a free
   lead-leakage ROI calculator as the flagship magnet.
4. **Demo video (Higgsfield) — creative, not a virality bet.** Produce sharp demo/ad creative
   fast; run as paid + LinkedIn creative we control; repurpose to landing page. B2B tooling
   rarely goes organically viral — budget on distribution, treat organic spikes as upside.

## Referral program (two tracks; full spec also in docs/REFERRAL-PROGRAM.md)

**Track A — member referral (double-sided free month).** Both sides get one free month on a
successful PAID referral. Free month (not bonus scans) on purpose: it scales with the plan
the referee picks (Pro month worth more), pulling people toward the higher tier; flat scans
would cushion the scan ceiling and suppress upgrades. Cash-flow mechanic: referee is charged
in full at signup (we keep the cash now), reward applied by **deferring the next billing date
one period** (extend Stripe billing-cycle anchor, or one-month customer-balance credit) — the
first charge is never discounted. Referrer also gets a month extension on their current plan;
if on Free, a comped month of Basic (no card, lapses back to Free with a "keep Basic?"
prompt). Optional 2× month for annual referees. Anti-abuse: grant only after first charge
clears the refund window (14–30 days); clawback on early refund/churn; no self-referral.

**Track B — affiliate/creator (recurring cash).** 20% recurring for 12 months (not one-time —
$4 on a monthly plan won't move anyone; annual = meaningful upfront lump). Application-only;
60-day cookie; ~$50 minimum payout; run on Rewardful/PartnerStack over Stripe; clawback on
refund/chargeback.

## Launch motion

- **Phase 0 — Design partners (now, pre-GA):** 5–10 SaaS teams with events in next 60–90 days;
  free Pro for usage data + testimonials; harvest 2–3 quantified case studies.
- **Phase 1 — PLG launch (v1.0):** free tier + self-serve Stripe; Product Hunt + LinkedIn
  launch on the follow-up-gap story + case study; ship SEO cornerstone + leakage calculator;
  turn on in-product referral (Track A) + engineered Slack share moment.
- **Phase 2 — Sales-assist expansion:** at 3+ active seats, reach the buyer with Team tier
  (dashboard, reporting, dedup/scoring); ship real email/LinkedIn follow-up actions (attack
  the 24h stat in-product); open Track B affiliates.

## Metrics

Activation: % of signups completing first scan; time-to-first-scan. Aha: first scan that
lands in HubSpot/Slack. Core value: scans per active user per event. Monetization: Free→paid
conversion; seats per account. Virality: referral invites sent/accepted, K-factor. **North
star: leads captured that reach a CRM within 24 hours.**

## Top risks & mitigations

- AI extraction commoditizing (Cvent, BoothIQ) → compete on enriched+routed outcome, flat
  pricing, Slack/HubSpot-native workflow; move up-stack into follow-up + reporting first.
- Mass AI content penalty → cap volume, quality-gate, human touch on cornerstone, chase EEAT/citations.
- Cold email burns domain reputation → separate verified domains, warmup/rotation, low caps,
  verified lists, <0.10% complaints, full auth + compliance.
- Enrichment depends on Apollo → treat as swappable feature; monitor match rate + per-lead cost.
- Show-floor connectivity → queue captures offline, sync when signal returns.

## First 90 days

1. Days 0–30: lock beachhead ICP + pricing; recruit 5–10 design partners; build leakage ROI
   calculator; stand up verified email domains (warmup); draft cornerstone SEO set.
2. Days 30–60: ship free tier + Stripe; wire Track A referral; publish cornerstone + calculator;
   start LinkedIn founder posting; produce first Higgsfield demo creative.
3. Days 60–90: Product Hunt + LinkedIn launch w/ case study; turn on targeted LinkedIn + email;
   open Track B affiliates; instrument metrics; begin Team-tier discovery with multi-seat accounts.

## Key sources (June 2026)

Vendelux & Wave Connect event-marketing stats; Momencio rental-cost analysis; Lensmor/BoothIQ/
Blinq competitor roundups; Gauge & Flooencer B2B SaaS channel guides; Digital Applied &
Keywords Everywhere on Google scaled-content-abuse; Red Sift & GMass on 2026 bulk-sender rules.
