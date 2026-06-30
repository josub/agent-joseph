---
type: convention
title: Stacked-PR merge gotcha — don't --delete-branch a base out from under its child
description: Merging a stacked GitHub PR with --delete-branch can auto-CLOSE the next PR in the stack (its base vanished) instead of retargeting it, and a closed PR with a deleted base can't be reopened or rebased. Retarget the child to main first, or merge without deleting branches.
tags: [convention, git, github, pr, stacked-prs, gh-cli]
source: 2026-06-28 contact-scanner merge train (PRs #35/#44/#49/#50)
created: 2026-06-29
updated: 2026-06-29
---

# Stacked-PR merge gotcha

When merging a chain of stacked GitHub PRs (A→main, B→A, C→B), `gh pr merge A --merge
--delete-branch` deletes branch A and GitHub **auto-closes PR B** (whose base was A) instead
of retargeting it to main. A closed PR whose base branch is gone **cannot be reopened or
rebased** (`gh pr reopen` / `gh pr edit --base` both fail: "Cannot change the base branch of
a closed pull request"). Recovery: open a fresh PR from B's branch (still on origin) against
main.

## Do this instead for a stack
1. Merge the bottom PR.
2. **Before deleting/merging further, retarget the next PR to `main`** (`gh pr edit <n>
   --base main`) while its old base branch still exists.
3. Only `--delete-branch` on the **top** PR (nothing stacked above it); delete leftover
   middle branches manually with `git push origin --delete <branch>` after their content is
   in main.

## Also
- Stacked branches that are linear supersets (each contains the previous commit) merge with
  **merge commits** cleanly. **Never squash a stack** (squash makes git re-apply
  already-merged commits → false conflicts).

## Related
- [[leadodex]] — where this was learned (the v1.0 merge train).
- [[bash-cwd-resets-use-explicit-repo-paths]]

## History
- 2026-06-29 — Page created by `sleep` from the 2026-06-28 working note.
