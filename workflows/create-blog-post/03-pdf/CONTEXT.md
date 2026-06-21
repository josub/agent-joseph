# Stage: 03-pdf

## Inputs        # pointers, not copies — resolved by prefix
- stage:02-copywrite/output/article.md   # Layer 4 — previous stage's output, this run

## Process       # thin orchestration — a mechanical script, no skill
Assemble article.md into a PDF. This is purely mechanical work, so no skill is invoked —
run a converter directly (e.g. `pandoc article.md -o post.pdf`, or any Markdown→PDF
tool available). This is the last stage.
<No skill: mechanical conversion only.>

## Outputs
- post.pdf -> output/        # written into the RUN at stages/03-pdf/output/

## Verify
- deterministic: post.pdf exists and is non-empty.
- semantic: the PDF contains the article body (not an empty or error page).
