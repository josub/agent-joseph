---
name: stacked-pr-merge-no-delete-branch
description: Merging a stacked PR with --delete-branch can auto-CLOSE the next PR in the stack instead of retargeting it. Retarget the child to main first, or merge without deleting branches.
metadata:
  type: convention
  source: 2026-06-28 contact-scanner merge train
---

When merging a chain of stacked GitHub PRs (A→main, B→A, C→B), `gh pr merge A --merge
--delete-branch` deleted branch A and GitHub **auto-closed PR B** (whose base was A)
instead of retargeting it to main. A closed PR whose base branch is gone **cannot be
reopened or rebased** (`gh pr reopen`/`edit --base` both fail: "Cannot change the base
branch of a closed pull request"). Recovery: open a fresh PR from B's branch (still on
origin) against main.

**Do this instead for a stack:**
1. Merge the bottom PR.
2. **Before deleting/merging further, retarget the next PR to `main`** (`gh pr edit <n>
   --base main`) while its old base branch still exists.
3. Only `--delete-branch` on the **top** PR (nothing stacked above it); delete leftover
   middle branches manually with `git push origin --delete <branch>` after their content
   is in main.

Stacked branches that are linear supersets (each contains the previous commit) merge with
**merge commits** cleanly; never squash a stack (squash makes git re-apply already-merged
commits → false conflicts). Relates to [[contact-scanner-issues-lag-code]].
