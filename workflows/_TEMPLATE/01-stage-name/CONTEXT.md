# Stage: <name>

## Inputs        # pointers, not copies — resolved by prefix (see resolution table)
- stage:<NN-prev>/output/        # Layer 4 — previous stage's output, from THIS RUN
- ref:<file>.md                  # Layer 3 — workflow-scoped reference
- memory:semantic/<slug>.md      # Layer 3 — cross-cutting convention (optional)

## Process       # thin orchestration: rules + skill/script invocations
<Rules specific to this stage.>
Invoke: skills/<theme>/<skill>   # 0..n skills or scripts; capability lives in the skill
<Do not reimplement a skill here.>

## Outputs
- <artifact>.md -> output/       # written into the RUN at stages/<this-stage>/output/

## Verify        # the advancement gate (see below)
- deterministic: <script-checkable assertions — file exists/non-empty, length, links, schema>
- semantic: <LLM self-check — matches the convention, covers the brief, no placeholders>
