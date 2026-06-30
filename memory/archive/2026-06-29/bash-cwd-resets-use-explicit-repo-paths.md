---
name: bash-cwd-resets-use-explicit-repo-paths
description: The Bash tool's working directory can reset to the brain root between calls — always target external repos with explicit paths.
metadata:
  type: feedback
---

When working across repos, the Bash tool's working directory is **not reliably
persistent** — it can silently reset to the brain root (`/Users/joseph/Documents/Code/Agent Joseph`)
between calls, even after an earlier `cd` into a sibling repo. On 2026-06-26 this caused a
`git push` meant for `contact-scanner` to run in the brain repo instead and push a
local-only brain commit (4b916ae) to the brain's own remote — harmless that time, but it
was an outward-facing action in the wrong repo.

**Why:** a wrong-repo push/commit is an outward, hard-to-reverse mistake; relying on cwd
persistence is the failure mode.

**How to apply:** for any git/file operation on an external repo, use an explicit target —
`git -C /abs/path <cmd>` (or `cd /abs/path && <cmd>` *within the same compound command*) —
never a bare `git push`/`git commit` trusting the cwd from a previous call. Verify the
remote (`git -C <path> remote -v`) before pushing. Relates to the external-repo conventions
in CLAUDE.md.
