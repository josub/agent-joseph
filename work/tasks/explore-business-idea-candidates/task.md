---
type: task
mission: build-profitable-online-businesses
source: user
status: new
priority: normal
created: 2026-06-28T21:22:59+0900
---

## Outcome
Explore and pressure-test two parked business-idea candidates Joseph raised 2026-06-28,
then recommend whether either should become **Business #3** (or replace the provisional
Business #2). For each: grounded market/competition read (red-team it, don't cheerlead),
a rough unit-economics sketch, the defensible wedge, and the smallest test that would
de-risk it. **Backlog — explore later, not now.**

## Notes
Two candidates, captured verbatim so detail isn't lost. Both are early idea-drops to
revisit; neither is committed. Mission has Business #3 "not yet chosen" — these are the
leading candidates for that slot. Related: [[build-profitable-online-businesses]],
[[ai-coach-business-idea]] (Business #2, provisional).

### Candidate A — niche directory site (→ portfolio play)
- Directory site for a **blue-ocean niche category**; Joseph's prior research surfaced
  **renting horses / riding sessions** as a candidate niche.
- Traffic via **AEO/SEO** (answer-engine + search optimization).
- **Revenue** from add-on services once the site generates traffic (monetize the audience,
  not the listings up front).
- **Data pipeline:** source listings via **Outscraper**, then clean + structure with AI.
- **The real prize:** during the first build, productize the process into a **repeatable
  workflow** so we can spin up a **portfolio of directory sites** and stack them toward
  $10k/mo+. (This is the contact-scanner "build the loop once, then replicate" pattern —
  candidate for a brain `workflows/` definition if it proves out.)
- Things to pressure-test later: is the horse-rental niche big enough / does it have
  buyer intent + add-on revenue; AEO/SEO durability vs Google/AI-answer volatility;
  Outscraper data quality, freshness, and ToS/scraping legality; defensibility (directories
  are cheap to clone — moat has to be data quality + coverage + the replication workflow).

**Early findings (light dig, 2026-06-28):**
- **Market is real, modest per-niche.** Equestrian training services ~$3.2B (2024),
  ~5.6-5.9% CAGR; US riding lessons ~$98-322/lesson (~$178 common) = real buyer intent
  and add-on spend. One niche won't hit $10k/mo alone, which is exactly why the
  portfolio/workflow framing matters.
- **"Blue ocean" is overstated for equestrian.** O Horse (ohorse.com) has run since 2005
  with ~15,000 listings / ~800 categories / ~3,500 regions = an aged incumbent. The
  opening isn't "no one's here," it's that the incumbent is old and likely weak on UX,
  AEO, and booking. Wedge = fresher + AEO-optimized + **transactional** (book/rent a
  session) rather than static listing pages.
- **Directory model is proven income.** Operators report ~$1k-40k/mo; money comes from
  paid listings, lead-gen, and **booking commissions** (commission > ad impressions for
  durability). Programmatic SEO is the traffic engine.
- **AEO cuts both ways.** Directories earn ~24% of Perplexity citations for unbranded
  subjective queries (tailwind), but zero-click search hit ~69% (2025) and Gartner expects
  ~25% of organic to shift to AI by 2026. Pure traffic/ad directories erode; lead/booking
  monetization survives. Build for citations + transactions, not pageview ads.
  - **Monetization model — pick the resilient one.** Two ways a directory earns: (1)
    pageview/ad revenue, paid per impression, needs people to land and browse — this is the
    one zero-click + AI Overviews are structurally killing (no click = no impression = no
    income); (2) booking/lead commissions, paid per conversion, needs only the few
    high-intent visitors who do arrive (AI-referred traffic converts well, >10% in some
    reports). Decision: build this to **earn on bookings/leads and to get cited by AI
    answers (AEO)**, NOT to farm ad impressions off traffic that's shrinking.
- **Outscraper = workable but gray.** Scraping public Maps data is generally legal under
  US case law (hiQ, Meta v. Bright Data), but it violates Google's ToS (contractual, not
  criminal; risk = account/IP blocks). Outscraper bears the blocking risk and claims GDPR
  compliance; ~10k records/$30. Clean long-term alt = Google Places API. Freshness/
  re-scrape is an ongoing cost, not one-and-done.
- **Verdict:** viable, and the repeatable-build workflow is the actual prize. But it's a
  "beat a stale incumbent with AEO + booking + freshness" play, not greenfield. Before
  replicating, validate one niche's add-on revenue end to end.
- Sources: [equestrian training market](https://dataintelo.com/report/equestrian-training-services-market),
  [lesson pricing](https://shop.bridleuphope.org/blogs/ideas/horse-riding-costs),
  [O Horse incumbent](https://www.ohorse.com/), [directory revenue/model](https://directorist.com/blog/business-directory-ideas/),
  [AEO + directory citations](https://cxl.com/blog/answer-engine-optimization-aeo-the-comprehensive-guide/),
  [Outscraper legality](https://scrap.io/scrape-google-gaps-legal).

### Candidate B — Shopify app: still photo → short product video
- **Shopify app** that lets merchants turn **product still photos into short videos**.
- Joseph searched the Shopify App Store and **found no strong incumbent**; early testing
  with **Veo** produced great results.
- Proposed edge = **two-phase pipeline**: (1) **AI vision analyzes the image** and writes
  the right prompt; (2) **Veo generates the motion video** with that prompt — aimed at
  killing hallucination/artifacts that naive image-to-video produces.
- Things to pressure-test later: verify the "no strong players" claim (App Store + outside
  it, e.g. existing AI-video tools merchants already use); Veo per-clip cost vs a Shopify
  app sub price (margin math, same video-economics discipline as the AI coach); product
  authenticity / ad-disclosure risk of AI-fabricated motion on real products; Shopify
  platform dependency + app-review/distribution; how durable the two-phase prompt trick is
  once base image-to-video models improve.

**Early findings (light dig, 2026-06-28):**
- **Demand is strong and well-quantified.** Product video lifts conversion materially:
  ~4.8% with video vs ~2.9% without; +37% add-to-cart on PDPs with video; shoppable video
  +17-33% site-wide. Merchants have a clear ROI reason to pay. This is the strongest part
  of the thesis.
- **"No strong players" is WRONG as stated — but salvageable.** The App Store already has
  10+ photo→AI-video apps: Vidify, CreatorKit, Animate Product AI, Shhots AI, Piks AI,
  Pele AI Studio, Videomate, VideoPoint, Video Genie, Bunu — plus general tools (Vidu,
  Pictory, already running on Veo 3.1). So it's NOT greenfield.
- **The incumbents are weak, though.** Vidify sits at 3.2★ on only 11 reviews; CreatorKit
  has serious complaints (blurry output, unresponsive generator, refund/scam accusations).
  Honest read: apps exist, a clearly *good and reliable* one doesn't. The wedge survives
  but shifts from "first" → "first that actually works." Caveat: Video Genie already does
  attribute-driven prompt crafting, so the two-phase vision→prompt trick isn't novel on its
  own; we'd have to prove a real, durable quality delta (no artifacts/hallucination) +
  SKU-bulk automation + Shopify-native UX.
- **Economics work only on the cheaper Veo tiers.** Veo 3 Fast ~$0.15/sec (audio) / ~$0.10
  (no audio); Veo 3.1 Lite ~$0.03/sec; full Veo 3 ~$0.40/sec. A 5-8s clip ≈ $0.24-$1.20 on
  Fast/Lite, up to ~$3.20 on full Veo 3. Benchmark price point: Vidify charges $20-60/mo
  for 20-60 videos (~$1/video). So at ~$1/video, full Veo 3 is underwater; Fast/Lite +
  metered credits is margin-positive. **Model choice = the margin lever** (same discipline
  as the AI-coach video gating).
- **Risks to test:** durability of the quality delta as base image-to-video models improve
  (the prompt trick may commoditize); Shopify platform/app-review dependency; ad-authenticity
  / disclosure risk of AI-fabricated motion on real products.
- **Verdict:** better-grounded than Candidate A on demand and economics, but it's a "beat
  weak incumbents on quality," not a land-grab. Smallest de-risking test: run the two-phase
  pipeline on 5-10 real SKUs and compare output side-by-side against Vidify/CreatorKit. If
  ours is visibly cleaner, there's a wedge; if not, the thesis is dead.
- Sources: [Shopify photo→video apps](https://apps.shopify.com/vidify),
  [conversion lift stats](https://www.xictron.com/en/blog/product-videos-e-commerce-conversion-2026/),
  [Vidify rating/pricing](https://apps.shopify.com/vidify),
  [CreatorKit complaints](https://apps.shopify.com/creatorkit-1/reviews),
  [Veo pricing](https://www.veo3ai.io/blog/veo-3-api-pricing-2026).

### Cross-cutting
- Apply the same discipline as Business #1/#2: win on outcome + a defensible wedge, not on
  the obvious feature; bake unit economics in as a constraint from the start (esp.
  Candidate B's Veo render cost).
- Deliverable when picked up: a short compare-and-recommend memo; promote the winner to a
  mission/`projects/` deliverable and file a dev task (mirror the AI-coach flow).
