---
type: convention
title: Bash cwd resets — use explicit repo paths
description: The Bash tool's working directory is not reliably persistent; it can silently reset to the brain root between calls, even after an earlier cd into a sibling repo. For any git/file op on an external repo, use an explicit target (git -C /abs/path) and verify the remote before pushing.
tags: [convention, git, bash, tooling, external-repo, safety]
source: 2026-06-26 incident — a git push meant for contact-scanner ran in the brain repo
created: 2026-06-29
updated: 2026-06-29
---

# Bash cwd resets — use explicit repo paths

When working across repos, the Bash tool's working directory is **not reliably persistent**;
it can silently reset to the brain root (`/Users/joseph/Documents/Code/Agent Joseph`) between
calls, even after an earlier `cd` into a sibling repo. On 2026-06-26 this caused a `git push`
meant for `contact-scanner` to run in the brain repo instead and push a local-only brain
commit to the brain's own remote (harmless that time, but it was an outward-facing action in
the wrong repo).

**Why:** a wrong-repo push/commit is an outward, hard-to-reverse mistake; relying on cwd
persistence is the failure mode.

## How to apply
- For any git/file operation on an external repo, use an explicit target: `git -C /abs/path
  <cmd>` (or `cd /abs/path && <cmd>` **within the same compound command**), never a bare
  `git push` / `git commit` trusting the cwd from a previous call.
- Verify the remote (`git -C <path> remote -v`) before pushing.

## Related
- [[git-identity-on-this-machine]]
- [[leadodex]] — the external repo this guards against.
- External-repo conventions in `CLAUDE.md`.

## History
- 2026-06-29 — Page created by `sleep` from the working note.
