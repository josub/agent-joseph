# Stage: 02-copywrite

## Inputs        # pointers, not copies — resolved by prefix
- stage:01-research/output/research.md   # Layer 4 — previous stage's output, this run
- ref:voice.md                           # Layer 3 — workflow-scoped voice guide

## Process       # thin orchestration: rules + skill invocations
Invoke: skills/marketing/copywrite
Draft the blog post in the house voice (ref:voice.md) from the research points. Address
every point in research.md. Honor the identity ## Rules (no AI-filler, don't overuse the
em-dash).
<Do not reimplement the copywrite skill here.>

## Outputs
- article.md -> output/        # written into the RUN at stages/02-copywrite/output/

## Verify
- deterministic: article.md exists and is non-empty; length within target.
- semantic: matches voice.md; every section of the research is addressed; no placeholder
  text.
