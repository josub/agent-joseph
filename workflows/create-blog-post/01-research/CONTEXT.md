# Stage: 01-research

## Inputs        # pointers, not copies
- (the run's brief — dropped into the run's references/ when the run was started)

## Process       # thin orchestration: rules + skill invocations
Read the run's brief (the topic, angle, audience, and questions to answer).
Invoke: skills/marketing/research
Gather sourced points that answer the brief's questions. Keep only claims that carry a
source URL. Note any questions where evidence was thin.
<Do not reimplement the research skill here.>

## Outputs
- research.md -> output/        # written into the RUN at stages/01-research/output/

## Verify
- deterministic: research.md exists and is non-empty.
- semantic: ≥3 sourced claims, each with a URL; covers the brief's questions.
